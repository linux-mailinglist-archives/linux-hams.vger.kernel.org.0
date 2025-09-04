Return-Path: <linux-hams+bounces-623-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B29B1B42E38
	for <lists+linux-hams@lfdr.de>; Thu,  4 Sep 2025 02:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26556188D2C1
	for <lists+linux-hams@lfdr.de>; Thu,  4 Sep 2025 00:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28715198851;
	Thu,  4 Sep 2025 00:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s18XiR5Z"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88735464D;
	Thu,  4 Sep 2025 00:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756945804; cv=none; b=fK6E+ezJjddRYga6BlbQaFm9mGjk0z5itnRo8bT/sd9QCbmKOd3xYtu1exg3yFGadEbA5tHfQdwhEWSTut/7eWSENcOVSYG/70Tfmg/JvxSyR9xO8kcEndwyOzaGzGriF9E+F60s7qqLt8tD15m9kAsBFTRPY2VtjgoVUllPXn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756945804; c=relaxed/simple;
	bh=lgX3nLNZdilc7QInfMmzgyDYeFZwGd4/sdtsRXrSTNg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tzlFAXl89wx14oabhAq3Fpj2CBmYI55ShE6dl0gGgmJG19xNYk4i8DocU9TbAGEbGpfHOsonOGr/fA0qkEwJ3uAAjogUrCWGEAlch8UpDP/VbD6fKxNwWVj+jE7nGwthuwv2HHVVRMFxiBNplkaJGAu+oHTH1/84rogc99fO0Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s18XiR5Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9177EC4CEE7;
	Thu,  4 Sep 2025 00:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756945803;
	bh=lgX3nLNZdilc7QInfMmzgyDYeFZwGd4/sdtsRXrSTNg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s18XiR5ZAV+khfis1uHV8/49ZQLPTHvkQVFtmkt41Be7nyv6LQWHkh+azjbe16E/m
	 JeJUM6zdIox4cr7MKumUZ1wYFbfmm37Ky94ttJaMjElnNUxZCXFTu7PzjwkIfuzXlM
	 EWxFcNYAbzJ3soJ4BcYc0N5VQm3VQUobpOMwdIgLPJ4jrF1P7DXbcoja8aC2TTzrRf
	 G94VieVk6rpInLp2PQurUvQFbipn7DLXQyeq64p+R7q3HnukPLrD2rDGtcyaIKCxM6
	 k7Bvo2CVJTnkYg8jGUpJadJmKfA5qEYq2l64w6cTbKrATAXg7bfXiJU1oJ5rLctqRz
	 6n9Yo0VdFnXlw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C50383C259;
	Thu,  4 Sep 2025 00:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] ax25: properly unshare skbs in ax25_kiss_rcv()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175694580827.1248581.17392450252240992479.git-patchwork-notify@kernel.org>
Date: Thu, 04 Sep 2025 00:30:08 +0000
References: <20250902124642.212705-1-edumazet@google.com>
In-Reply-To: <20250902124642.212705-1-edumazet@google.com>
To: Eric Dumazet <edumazet@google.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, eric.dumazet@gmail.com, f6bvp@free.fr,
 jreuter@yaina.de, linux-hams@vger.kernel.org, dranch@trinnet.net,
 crossd@gmail.com, folkert@vanheusden.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  2 Sep 2025 12:46:42 +0000 you wrote:
> Bernard Pidoux reported a regression apparently caused by commit
> c353e8983e0d ("net: introduce per netns packet chains").
> 
> skb->dev becomes NULL and we crash in __netif_receive_skb_core().
> 
> Before above commit, different kind of bugs or corruptions could happen
> without a major crash.
> 
> [...]

Here is the summary with links:
  - [net] ax25: properly unshare skbs in ax25_kiss_rcv()
    https://git.kernel.org/netdev/net/c/8156210d36a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



