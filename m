Return-Path: <linux-hams+bounces-255-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D58D88BFC11
	for <lists+linux-hams@lfdr.de>; Wed,  8 May 2024 13:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5805CB212B7
	for <lists+linux-hams@lfdr.de>; Wed,  8 May 2024 11:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6DE8287F;
	Wed,  8 May 2024 11:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owjdlBqA"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5E782487;
	Wed,  8 May 2024 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715167829; cv=none; b=kn/JPyZfiTycyhdfDFaXh9vQ9PZJGYlLe72oqwBLEPdiQXzV2f0tKQ3ZFxR+K6fhhOGXDuU2Vieel+qX0KJ3SLqc4De7x4YSZbEF89OHJzjCeSLyFjNetB6CGeKmXTaQsLZsPuEYy3u5e3D9Ja9ji2B4xrt6J4ieMUfL3dQGDHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715167829; c=relaxed/simple;
	bh=jnXx7y874v4iRFiY+y9hcn33IsqIg8gQYsHVn/2a1/M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dzS8b6jeo5WLikwodTP/BIYNNX7/qG0TIGDNsGgBsn5TEqQCuEqdEp49qiBMR4cqqlLUbMMkFAvmJoyugi6TCKQjzWCP6j101q6dR2JNayZ2H7EXdVCjMNCsNEI5x/g8+rmCp5uZCvRwGZlSCEU8RE9lOciOliC0MP6CxuW4Rm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owjdlBqA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 985C2C4DDE0;
	Wed,  8 May 2024 11:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715167828;
	bh=jnXx7y874v4iRFiY+y9hcn33IsqIg8gQYsHVn/2a1/M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=owjdlBqAm80LsK+EKCh+R5vUX1akCBp4hM0guUJBIB14kUKdu87fLj8hGMUd1H39Z
	 5L6D9DRzvPKW2CnNQ57s0PEJ0Tb33dzJ8cn5tIBcK5yCuDseTE/sq5IAzPLNfR1w4O
	 tEzIOLw46Vewp+3Zcx+ycdLDB8P+3pSLgOqjj0+Vv1nIUEseawNsP1b9PgwMQYMkTF
	 UmYnD207p1QvGPSXdamjXh+hMVKwzFjNQNjjvifvsLu/+6VuvQXZ+q3avjyS5BHbXH
	 ar9/fP+h3ROpyPbxbclx7e8wkkk3rS6bnXufC451OaF5nwY7K+CS3kiaNhOi38Ga5w
	 q6UDJ9gz7CqGQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8DEC3C3275D;
	Wed,  8 May 2024 11:30:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] ax25: Remove superfuous "return" from
 ax25_ds_set_timer
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171516782857.10113.12922238920177706856.git-patchwork-notify@kernel.org>
Date: Wed, 08 May 2024 11:30:28 +0000
References: <20240507-jag-fix_void_ret_ax25-v1-1-507fb246f192@samsung.com>
In-Reply-To: <20240507-jag-fix_void_ret_ax25-v1-1-507fb246f192@samsung.com>
To: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Cc: jreuter@yaina.de, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-hams@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, j.granados@samsung.com

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue, 07 May 2024 10:40:39 +0200 you wrote:
> From: Joel Granados <j.granados@samsung.com>
> 
> Remove the explicit call to "return" in the void ax25_ds_set_timer
> function that was introduced in 78a7b5dbc060 ("ax.25: x.25: Remove the
> now superfluous sentinel elements from ctl_table array").
> 
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> 
> [...]

Here is the summary with links:
  - [net-next] ax25: Remove superfuous "return" from ax25_ds_set_timer
    https://git.kernel.org/netdev/net-next/c/1d3985ed0dd3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



