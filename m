Return-Path: <linux-hams+bounces-537-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A76AF088C
	for <lists+linux-hams@lfdr.de>; Wed,  2 Jul 2025 04:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C67F316A550
	for <lists+linux-hams@lfdr.de>; Wed,  2 Jul 2025 02:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67DD1A08CA;
	Wed,  2 Jul 2025 02:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HEiRixx8"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D23214A62B;
	Wed,  2 Jul 2025 02:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751423983; cv=none; b=DI9xj/mvdnNr53xCyea6a0Z8nR63YVzHxC4ByXdixhesF/qRvDMBcODYDRSqzOgMOUzZXS1yOFFrTKG5TT5iGdLB01xpnzXMTw+Krv7pyhy5to/pCywMjDUZO1bN8ECq2zuEjtJele3I1TppXEsfUlyYfZWmhnfMztDTjW35IVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751423983; c=relaxed/simple;
	bh=NSp1zPPH78qqMhfGx6Ra8H33420Q4jqqcUT2ZuZEwok=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Sllc1a0IO6+e/NiyuYVZBZx75aaA860R1WEBOCGDt50M6aKk0+FbcFZwYJIMgHrnifxrd+fVge8vts/o+Fe3T1SadvVqRH9X5aa0/dPQoLCXC0+GXjKzTLOO2Boqay0o1mMpr6kDB6JZVXmX0A0MymSJpFSrlksAcqebCrTfp6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HEiRixx8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F6EC4CEEB;
	Wed,  2 Jul 2025 02:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751423983;
	bh=NSp1zPPH78qqMhfGx6Ra8H33420Q4jqqcUT2ZuZEwok=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HEiRixx8eRzfnv8rUdUpP76ytoATOFCQe8HISBnbiyVdhqv3Se6BAhG0imJluD1zi
	 jsf2r9qcCrm4jD4XR1Cf8H2DoIFLOdctPXymfNPXO/ZGALlbzvNl0glvq/dUCRODz7
	 nldCqqNE7aJBLqp89hKWzkKi7rwOtW+pryftupW+d+bsjVpXc4aqBzNFFelbW6N/gD
	 J2YW1n0yzdYyORTEKDstyI2kI6MwvkfS61q8/4KSOLstzi97uhT6tLKasiqVKMHDGf
	 QxY/C5K4x0Talrq4OdRe0GJxstbM+TibO9vCC7omoN+DSYQjhFbHtPfiJMRUe1HioL
	 YXqPEZe5DuOWA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD66383BA06;
	Wed,  2 Jul 2025 02:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] rose: fix dangling neighbour pointers in
 rose_rt_device_down()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175142400742.183540.1698591972107897588.git-patchwork-notify@kernel.org>
Date: Wed, 02 Jul 2025 02:40:07 +0000
References: <20250629030833.6680-1-enjuk@amazon.com>
In-Reply-To: <20250629030833.6680-1-enjuk@amazon.com>
To: Kohei Enju <enjuk@amazon.com>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, kohei.enju@gmail.com,
 syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 29 Jun 2025 12:06:31 +0900 you wrote:
> There are two bugs in rose_rt_device_down() that can cause
> use-after-free:
> 
> 1. The loop bound `t->count` is modified within the loop, which can
>    cause the loop to terminate early and miss some entries.
> 
> 2. When removing an entry from the neighbour array, the subsequent entries
>    are moved up to fill the gap, but the loop index `i` is still
>    incremented, causing the next entry to be skipped.
> 
> [...]

Here is the summary with links:
  - [net,v2] rose: fix dangling neighbour pointers in rose_rt_device_down()
    https://git.kernel.org/netdev/net/c/34a500caf48c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



