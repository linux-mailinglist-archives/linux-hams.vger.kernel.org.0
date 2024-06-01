Return-Path: <linux-hams+bounces-355-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3C98D72A2
	for <lists+linux-hams@lfdr.de>; Sun,  2 Jun 2024 01:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 157BF1C2097A
	for <lists+linux-hams@lfdr.de>; Sat,  1 Jun 2024 23:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177E73A1BB;
	Sat,  1 Jun 2024 23:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gw2N/naR"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CB62032D;
	Sat,  1 Jun 2024 23:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717282830; cv=none; b=naQ0YkP+nf3V8viaTdkrwH+ifzxCegMT+341mtxp7T4KYhMhmaWFie/94etz071dlPNxwj0hXAP4gI3bRIuslHfWPT9I6aK3ujJD5V2QHXQeZHZMvw8o6/esFQ1H/1DEfOCu+54COd/yBv5xjHn/G4+SkX/mI29WEmzLU9mAx04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717282830; c=relaxed/simple;
	bh=dn7tHb0D8BYATJK0Urlct3wSl3oO4d5o7t54Y1CN7Zo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=i+o5aA5YmUgN64TTXotN2fpVH0z4e5eAsPyg0zOd1+AZTUGr+LSPbgAT6d3UsgLitGUQ2ks9gPvwdWa5kU8ioit+2u1YibJ5iShJGQUD9nfLGI3EFyPacH2zN2ZORCyGwnrigw1XvNQCRwn7QRKtKxpGJ7JkaM/STtlpMTzZQEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gw2N/naR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 644B3C4AF07;
	Sat,  1 Jun 2024 23:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717282830;
	bh=dn7tHb0D8BYATJK0Urlct3wSl3oO4d5o7t54Y1CN7Zo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Gw2N/naR7li3G+krL4DRvJ9PrwMmau1of+iFa3EMVRsBQS5Nt68Z7RLoZd3wdbpjl
	 eCpc0M0fFNwqj63ACCJe0ruGwt0LkAXse/un2EVZbHqsXhymE7OhCxD450tai6qgCO
	 XWuRGMj3ZrmCi56Gh54NIYB7/QNxBabIf1gIStaXeUGAi8Pqrz1M9+LrI8lN/vfgpn
	 caKZL17LPWq/vrcwk+m+oQptzgkjS2ve7jg7bA605wctgW/Oy3bxzRKAOvHUqMBb2C
	 PP+ZlBetYve0N2YYhaHNxM4GiIu3Z1jkQ6kNcuOpVPMeIHW5CIgaVh/3HNBnqt7SgJ
	 32VLMY4/j9Qiw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 55FBADEA717;
	Sat,  1 Jun 2024 23:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5] ax25: Fix refcount imbalance on inbound connections
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171728283034.4092.12616353767873504629.git-patchwork-notify@kernel.org>
Date: Sat, 01 Jun 2024 23:00:30 +0000
References: <20240529210242.3346844-2-lars@oddbit.com>
In-Reply-To: <20240529210242.3346844-2-lars@oddbit.com>
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org, duoming@zju.edu.cn,
 crossd@gmail.com, christopher.maness@gmail.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 29 May 2024 17:02:43 -0400 you wrote:
> From: Lars Kellogg-Stedman <lars@oddbit.com>
> 
> When releasing a socket in ax25_release(), we call netdev_put() to
> decrease the refcount on the associated ax.25 device. However, the
> execution path for accepting an incoming connection never calls
> netdev_hold(). This imbalance leads to refcount errors, and ultimately
> to kernel crashes.
> 
> [...]

Here is the summary with links:
  - [v5] ax25: Fix refcount imbalance on inbound connections
    https://git.kernel.org/netdev/net/c/3c34fb0bd4a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



