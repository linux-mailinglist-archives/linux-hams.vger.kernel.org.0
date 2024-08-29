Return-Path: <linux-hams+bounces-420-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A80965052
	for <lists+linux-hams@lfdr.de>; Thu, 29 Aug 2024 21:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9F3028B2FB
	for <lists+linux-hams@lfdr.de>; Thu, 29 Aug 2024 19:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8DB1BFE17;
	Thu, 29 Aug 2024 19:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TL/J/qpq"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B882F1BF7E1;
	Thu, 29 Aug 2024 19:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724961029; cv=none; b=Efr6dfw47WfwHaq2S7qRSTH6Hq21IR8Wgz+PxOAdC/KMLBozln1WVh6ZS/M9nwPskP1Ssm81fFmB9kCAnSJ0I0lsyce3YrMga5XOFUb32E+uPh4wjq7qZxivqPrcu0KekevsAFuvbr8TEICLeQy8DBjk6P8sT/K3T8pkjaTC2KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724961029; c=relaxed/simple;
	bh=IueMo5FCYpiperiQzC5vwu0BM6YG2Uu9bk3SW2uOugs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QckW7OcbyGEzUJR21VcEJGasaDvLQhEiN3y0dIDpnC8ptl+qLUOho7veM75NpSDfVr3xhnu4BjEaf+qGSiWF1NDG8hC31X284aDX+jymp9qXB/s4CyhqHNNhdIkn61ynDSYYV7Ya5x21Ig2CGZKH49cyhhzSZY4jb9l9qjDVC7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TL/J/qpq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6BEC4CEC1;
	Thu, 29 Aug 2024 19:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724961029;
	bh=IueMo5FCYpiperiQzC5vwu0BM6YG2Uu9bk3SW2uOugs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TL/J/qpq32V4bL7TaGu8Y/JpAOJrVnQhQYXXgt9ouvVLoomUiqp1pYnrW3aIp3Kyy
	 tDxDAWWk8zPmpM2+5f6OcFEr/iPRO9N5nexv9+ThNFUpJGLHPEijHeu6yyQQ2fpDvM
	 rSK36zto2GNPeK6T7zpPgVvVIc0q/0ZdsefyWERfOVKikdmcmFm+wP0k23BugJQRYw
	 Z6XHrIxP1SltueLxAcxUIXQ0DM56/oT614Re17JzMXg50lvQXnHZ/75GCvb1Ct6r76
	 fHk/fhMcuNiW30iFFJw7Fb088NmQLreEaajL+M/6CJ4mt0equ0V5OMaPKOiqAdbEqC
	 GsZhdmEp/ng3g==
Received: from ip-10-30-226-235.us-west-2.compute.internal (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C13EC3822D6A;
	Thu, 29 Aug 2024 19:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/6] replace deprecated strcpy with strscpy
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172496103078.2069528.3343735639041200651.git-patchwork-notify@kernel.org>
Date: Thu, 29 Aug 2024 19:50:30 +0000
References: <20240828123224.3697672-1-lihongbo22@huawei.com>
In-Reply-To: <20240828123224.3697672-1-lihongbo22@huawei.com>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, dsahern@kernel.org, ralf@linux-mips.org,
 jmaloy@redhat.com, ying.xue@windriver.com, dan.carpenter@linaro.org,
 netdev@vger.kernel.org, linux-hams@vger.kernel.org,
 netfilter-devel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 28 Aug 2024 20:32:18 +0800 you wrote:
> The deprecated helper strcpy() performs no bounds checking on the
> destination buffer. This could result in linear overflows beyond
> the end of the buffer, leading to all kinds of misbehaviors.
> The safe replacement is strscpy() [1].
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/6] net: prefer strscpy over strcpy
    https://git.kernel.org/netdev/net-next/c/68016b997222
  - [net-next,v2,2/6] net/ipv6: replace deprecated strcpy with strscpy
    https://git.kernel.org/netdev/net-next/c/b19f69a95830
  - [net-next,v2,3/6] net/netrom: prefer strscpy over strcpy
    https://git.kernel.org/netdev/net-next/c/597be7bd17c3
  - [net-next,v2,4/6] net/netfilter: replace deprecated strcpy with strscpy
    (no matching commit)
  - [net-next,v2,5/6] net/tipc: replace deprecated strcpy with strscpy
    https://git.kernel.org/netdev/net-next/c/af1052fd49cc
  - [net-next,v2,6/6] net/ipv4: net: prefer strscpy over strcpy
    https://git.kernel.org/netdev/net-next/c/82183b03de5f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



