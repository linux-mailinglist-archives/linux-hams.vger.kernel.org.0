Return-Path: <linux-hams+bounces-272-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FD58C49FD
	for <lists+linux-hams@lfdr.de>; Tue, 14 May 2024 01:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DCA71F22308
	for <lists+linux-hams@lfdr.de>; Mon, 13 May 2024 23:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A25785284;
	Mon, 13 May 2024 23:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/y9ASq3"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C22185622;
	Mon, 13 May 2024 23:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715642432; cv=none; b=oMcIRlal1GUNp6p36Xj0nWULV9qLtpkJWmgvZcyT/oUkds1dTKtx7TUl2GfyMoqbblaRh0l+77GsYxM1ZfcHbNEIfBT4I2Bk79HdPr8eXUfA4N2VefwgzbvwPKPdIz8O6mWiVS0mgAGHlQP7b1tncD86db0NYo6brImpe1IOEo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715642432; c=relaxed/simple;
	bh=LW7czoZwatdQXRO+YVercOrMx1lCPFkpDoEbGYPmtrM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=AYAjXkge2mp5oz4OaxFPe9V0hhxWHUal4BS2jBhL6r4Sd9mHPX/2j9X4KNXHtHfNjHclymmjKMyF3lSLWA5L3Xkq3bZ33atOJf8p4HksP3clNvK5JEPA5qP+NOHkT79gLezQJ1NZuotpjcbxFC1tSjh7bcnC7MyMtanBjX1Zksc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/y9ASq3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C1C6C32781;
	Mon, 13 May 2024 23:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715642431;
	bh=LW7czoZwatdQXRO+YVercOrMx1lCPFkpDoEbGYPmtrM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=i/y9ASq3hC2V1cno1xImJ6wv49pyQRzknjuwdQyCQa/e2Z1Ghij1XOLmVAwM3CtYv
	 p30vNPrMt1uaKkSSTzT4lNwTSMcnTnPyakJYGGkhWfW51IoyJ5a8A6yLmVgVwX1qy7
	 NQNDeBVtrNUFeBL1z1WHjUO0+WGb3DfyCUKAm8yoBNqx3mIGxgIVmcJw58oP8ly6X9
	 JHO9i6aqOuiBV3INyBR8ahkVzAR4AeVE95bpPLrGTdieeN3XYxYfXFHuMg6kQ4vVyi
	 +wfQ9oGACH5IZWJ2YznX2/eTElJkLLGlvOO8vvQp4TYsrxqnbEVHp0bDhx6UrrlW4u
	 StHBCUcPA0aXA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 82C47C43443;
	Mon, 13 May 2024 23:20:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v7 0/3] ax25: Fix issues of ax25_dev and net_device
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171564243153.13558.7234535622239803096.git-patchwork-notify@kernel.org>
Date: Mon, 13 May 2024 23:20:31 +0000
References: <cover.1715247018.git.duoming@zju.edu.cn>
In-Reply-To: <cover.1715247018.git.duoming@zju.edu.cn>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hams@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, jreuter@yaina.de, dan.carpenter@linaro.org,
 rkannoth@marvell.com, davem@davemloft.net, lars@oddbit.com

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  9 May 2024 17:35:59 +0800 you wrote:
> The first patch uses kernel universal linked list to implement
> ax25_dev_list, which makes the operation of the list easier.
> The second and third patch fix reference count leak issues of
> the object "ax25_dev" and "net_device".
> 
> Duoming Zhou (3):
>   ax25: Use kernel universal linked list to implement ax25_dev_list
>   ax25: Fix reference count leak issues of ax25_dev
>   ax25: Fix reference count leak issue of net_device
> 
> [...]

Here is the summary with links:
  - [net,v7,1/3] ax25: Use kernel universal linked list to implement ax25_dev_list
    https://git.kernel.org/netdev/net/c/a7d6e36b9ad0
  - [net,v7,2/3] ax25: Fix reference count leak issues of ax25_dev
    https://git.kernel.org/netdev/net/c/b505e0319852
  - [net,v7,3/3] ax25: Fix reference count leak issue of net_device
    https://git.kernel.org/netdev/net/c/36e56b1b002b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



