Return-Path: <linux-hams+bounces-472-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AADECA17567
	for <lists+linux-hams@lfdr.de>; Tue, 21 Jan 2025 02:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0B273AA031
	for <lists+linux-hams@lfdr.de>; Tue, 21 Jan 2025 01:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A71238DD3;
	Tue, 21 Jan 2025 01:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nY5Uusms"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3D48831;
	Tue, 21 Jan 2025 01:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737421807; cv=none; b=j6lb1lELACZKwHK8i8+UyMEhqFzxh9MoYF8AkQHfufvvhU9CZipolpa0QmdZltFVCEsRF1/sjNqftduMweb8IRgvs+CMFb4ZAqNdDyTrJszZsVAi5ozcM2WglZ1eHLilkRv46LjWNtxGue7q8UVaRE4xfJtRr/gpJVVOlsJJlnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737421807; c=relaxed/simple;
	bh=zPO4duhBKb6fFaXj2aXHiDNik7bn4YYaXv62DXkF+Ro=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=smjkkWs3GHXy0Ag0zM6nFDFMltOqhqYRD10WxZSVt3YiqQtxVqU9pvm8lJjdYCXDe1TFOtuoWOespyXRvCiutEY2fTYPCgnaa3i+aKvhw7V1JmpGX47Xw72Xji91bV6wSzBT+zfdcUT6geqW1jy5otsPotV0+MRcjwOs2sxgtcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nY5Uusms; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A504C4CEDD;
	Tue, 21 Jan 2025 01:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737421807;
	bh=zPO4duhBKb6fFaXj2aXHiDNik7bn4YYaXv62DXkF+Ro=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nY5UusmsQAlzzlqhg/4AnYFc+0GqPU9NRpJLYMryRBegON2yl9Z1rCboh3lUwbD5k
	 bkrv3mk4fyklwLsexHEG5/dh//8CzFwnyeL7oJINVrPkRACg/NyVwfjRM1m9mTBhMi
	 UdnfGYRbT9VqtuPvp/D8BNJCoN6aD+lir3E0zp4o+XRvMD0hdCrOsNho9wm7d9FtHE
	 tyAQXrm6hbLlamqlc2fPvyp799u9sEzrgW9pncS4uxqRRoljGJRLQT22G+G2HSGK3y
	 ED+LArzss19JPfLcHWKKf28p9Nip2HGyYA9uN9KTFz0ggR+vCAduH9usbS2rPuIG8L
	 3LSNXqYCfqxpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D13380AA62;
	Tue, 21 Jan 2025 01:10:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net/rose: prevent integer overflows in rose_setsockopt()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173742183130.3698671.13583555893820567462.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jan 2025 01:10:31 +0000
References: <20250115164220.19954-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20250115164220.19954-1-n.zhandarovich@fintech.ru>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, linux-hams@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 15 Jan 2025 08:42:20 -0800 you wrote:
> In case of possible unpredictably large arguments passed to
> rose_setsockopt() and multiplied by extra values on top of that,
> integer overflows may occur.
> 
> Do the safest minimum and fix these issues by checking the
> contents of 'opt' and returning -EINVAL if they are too large. Also,
> switch to unsigned int and remove useless check for negative 'opt'
> in ROSE_IDLE case.
> 
> [...]

Here is the summary with links:
  - [net] net/rose: prevent integer overflows in rose_setsockopt()
    https://git.kernel.org/netdev/net/c/d640627663bf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



