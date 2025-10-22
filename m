Return-Path: <linux-hams+bounces-674-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61107BF9889
	for <lists+linux-hams@lfdr.de>; Wed, 22 Oct 2025 02:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27B8B19C69DD
	for <lists+linux-hams@lfdr.de>; Wed, 22 Oct 2025 00:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F131F5423;
	Wed, 22 Oct 2025 00:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCPtmrZm"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2949D78F51;
	Wed, 22 Oct 2025 00:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761094244; cv=none; b=SWzIHpwzuTjrRdKW4Jwm0RJYpeXITdp+98XmvarKrO8n0IEUMoI0M89EaFx3S2mZI/cnSy9RjIhA3sFaBOEkdiNzBDii6rTkKbmpW935LTzq1ewCvJco09B9pUXltuvKXh0W9nv/1svS9a5m0l4aLJmA9SNiq5Aoy8disNlh5YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761094244; c=relaxed/simple;
	bh=5YiKGTTA0sPWfPkkjbaajZBM+rJdSZYR+vr23Ya6r+M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FoK40LTudv2j4EaJh/1wvgcpoVLlRMMWu5VfELPL1Cvdh6CfgEA6XFcdwAo3q6a6e/rbSACVGzWzxcuc5C31YE9V7aHaEhvOh2Yy/03Ta/wovB2l3zGnmQZ2BgcPVEP5d5yJoQiHNuTeR3UrLGLEZkviR+qKYf17fO3oOfdis80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCPtmrZm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FD3C4CEF1;
	Wed, 22 Oct 2025 00:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761094243;
	bh=5YiKGTTA0sPWfPkkjbaajZBM+rJdSZYR+vr23Ya6r+M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TCPtmrZmieoXZPsojPGu+pmbO/FQAoGK3VNZ0C17A0fH9C94OoxBex0+s2ZX1d9Rj
	 olkuHMjOrFk6LwnpPKw9NVIkyecsjpl0vtgNucQE0OYATfiPJRL1QIp8VCmtP5mYAX
	 jrPNjFRhueQgHxyNPzfYrEhSaHfBlV2xchB81mLsLf5W/MsyMpNQkTN56JzF3hSL9k
	 O+OFmoGafZUhH4M2usSvL0SzRAyVUz9gdZzE3tzb4uzG6g/dFDXPkRj+c3E3jyeEVk
	 7eFcwqQjc51q5+42E52Yc+0WbhnJXiveP++U7Ls5zS2Jip7kB2ULk9TLi5wP1KhQG2
	 Sm8iYXpmyWzrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CD53A55FA6;
	Wed, 22 Oct 2025 00:50:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Documentation: networking: ax25: update the mailing list
 info.
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176109422474.1291118.15093123426414398141.git-patchwork-notify@kernel.org>
Date: Wed, 22 Oct 2025 00:50:24 +0000
References: <20251020052716.3136773-1-rdunlap@infradead.org>
In-Reply-To: <20251020052716.3136773-1-rdunlap@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 corbet@lwn.net, linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 19 Oct 2025 22:27:16 -0700 you wrote:
> Update the mailing list subscription information for the linux-hams
> mailing list.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: linux-hams@vger.kernel.org
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> 
> [...]

Here is the summary with links:
  - Documentation: networking: ax25: update the mailing list info.
    https://git.kernel.org/netdev/net/c/86c48f50baba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



