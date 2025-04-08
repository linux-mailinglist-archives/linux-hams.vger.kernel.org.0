Return-Path: <linux-hams+bounces-513-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AE8A7FD62
	for <lists+linux-hams@lfdr.de>; Tue,  8 Apr 2025 13:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 815017A2C1E
	for <lists+linux-hams@lfdr.de>; Tue,  8 Apr 2025 11:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8714E26A0ED;
	Tue,  8 Apr 2025 11:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SysSRzyN"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384B5269B15;
	Tue,  8 Apr 2025 11:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744110001; cv=none; b=OGdFhFnBRLqUAqMfKZwqKk2cEKLjDPrcD7TM24NTHwP1Zr0rRY8pdOsbR+xHOxCiXyiB47oMH8WNEd+SxoPrw/tgraYx3KqrPhxuIS6eCtcvtHUiJvWk9+x0C60VrdJzQr6UOf3M399Uwhwx9fyyFH8ggUdlhvacYAAEE0LGZaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744110001; c=relaxed/simple;
	bh=3mCSAWnUMIyBPcA7HtiTW90K6L+F5iOa4GEatyISkRM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=s7ZGUuJctHzyvnzP2oEGggse0+ur3GPJe7BazuJYcz7z4n3VyF/b4VAF5U9tAfXb6L1ujiidJ9dEfLCtPRQUyx5Wl8CaxtjXD598z3EumwXva0xxijHbALKOKO6ME6o9yQNtFWSytihB7+Lcs9kzFAS/nxnbZAmcz/8oI99KXro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SysSRzyN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D22C4CEE5;
	Tue,  8 Apr 2025 11:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744110000;
	bh=3mCSAWnUMIyBPcA7HtiTW90K6L+F5iOa4GEatyISkRM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SysSRzyNGgiwAjXrlCuiemoxy63HjGGi6F1tovXfTO+H38Fk6cI7kz1Fh/vmK8Luz
	 1+woG828u/MmLXJ5Ozp1doRbDOlrbMpSslQiD6MpEgZrlss5xB2VvtKd4rKMXtfu7l
	 vuR/TQqrb4vU9QKCIB/i4virF2NWiISfvgcxMqMZ2CEj0curuftCciWPL3+VeTa/cp
	 iAv+js4GeR8haKHwoyG/qJSWIc2kPZkJAvhmaGZCg6M+vZSv9qICNuL2yOkBGX1R/y
	 aZOz5YktZWSuavBp/xReH45bFGXpWcc0fUEM7hM6XFv8Hta+ZUWO7falyrSFaB6edb
	 T1xkCHTA5nETg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 736BE38111D4;
	Tue,  8 Apr 2025 11:00:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] hamradio: Remove unnecessary strscpy_pad() size
 arguments
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174411003830.1874546.17151956229664119847.git-patchwork-notify@kernel.org>
Date: Tue, 08 Apr 2025 11:00:38 +0000
References: <20250407082607.741919-2-thorsten.blum@linux.dev>
In-Reply-To: <20250407082607.741919-2-thorsten.blum@linux.dev>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: t.sailer@alumni.ethz.ch, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-hams@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon,  7 Apr 2025 10:26:07 +0200 you wrote:
> If the destination buffer has a fixed length, strscpy_pad()
> automatically determines its size using sizeof() when the argument is
> omitted. This makes the explicit sizeof() calls unnecessary - remove
> them.
> 
> No functional changes intended.
> 
> [...]

Here is the summary with links:
  - [net-next] hamradio: Remove unnecessary strscpy_pad() size arguments
    https://git.kernel.org/netdev/net-next/c/48afd5550524

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



