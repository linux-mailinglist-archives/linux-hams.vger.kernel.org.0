Return-Path: <linux-hams+bounces-454-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7EF9FB3D3
	for <lists+linux-hams@lfdr.de>; Mon, 23 Dec 2024 19:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32F6618847A2
	for <lists+linux-hams@lfdr.de>; Mon, 23 Dec 2024 18:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E114C1C3BF8;
	Mon, 23 Dec 2024 18:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpKWtluU"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EE51C3BE7;
	Mon, 23 Dec 2024 18:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734977418; cv=none; b=rtmmx8JYZVRFbglAQxPqWTPRgE49UchAP5zhAYZ0TTgam0g0FgUHV+WaXM7YOfBbA9qjvGbXvhp1KfK2MqFz6s/UhwlD4QwCalnvtf8LRxJtsDu/XUmohjAyFBB6wwPC4ZgTWImusUpHXF8xpMpwaJwIw02O6xd1J5EScdnFJvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734977418; c=relaxed/simple;
	bh=KJiNIh4OQ8lGKPrQdi0wcuPy97JBnl46/hHW1i4t3tY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uVEqW8B9h4zyq6f2Lf1ncSYxnUHQgJhCst0pNbds8WCGL1Cj/ruU4UKHQozI+VgVcORJytTX9QWcWgYoGfzYilICksYRMbE8vpWLW1l4e2eVuWMsaqNDWZqTBKQOz9Q2NESMKArfLEbt6eXXbuH08EZ6wBaWS0RounHtbEmH3XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpKWtluU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794E8C4CED3;
	Mon, 23 Dec 2024 18:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734977418;
	bh=KJiNIh4OQ8lGKPrQdi0wcuPy97JBnl46/hHW1i4t3tY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gpKWtluUlZGTHIrJPAmGB6U7rzyOHVeL/7+8jNTJR5TJk5+DSjc3wlD7SmqQQ/MR9
	 jx3118rbCUufPPQ5XCcy20zPR+desvj+43nOn+SF3yUAswowI0Z7vec+Vhm3kOlysF
	 qrFgd0OSVj6DAAS/SvAG4+mE4Qhh+1cJLXBDItyFuDxmofe4DsSsxgNTVquqGHUrj8
	 QrVSv7AdqfuIETh1VqizuP8KmR6giW21JGhynWc2JNenJbfViqxBS7fvm8yYa0Tk0U
	 mqPP9BDRqUNBHV0Qk8ADl2aCb/2uoQuEfSC4o1Y3GpI9uMgvlqa01tH9BEGPq8lkFN
	 vAfpKCAzesZYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E0E3805DB2;
	Mon, 23 Dec 2024 18:10:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] netrom: check buffer length before accessing it
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173497743701.3921163.18071428597161743809.git-patchwork-notify@kernel.org>
Date: Mon, 23 Dec 2024 18:10:37 +0000
References: <20241219082308.3942-1-rabbelkin@mail.ru>
In-Reply-To: <20241219082308.3942-1-rabbelkin@mail.ru>
To: Ilya Shchipletsov <rabbelkin@mail.ru>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, hfggklm@gmail.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 19 Dec 2024 08:23:07 +0000 you wrote:
> Syzkaller reports an uninit value read from ax25cmp when sending raw message
> through ieee802154 implementation.
> 
> =====================================================
> BUG: KMSAN: uninit-value in ax25cmp+0x3a5/0x460 net/ax25/ax25_addr.c:119
>  ax25cmp+0x3a5/0x460 net/ax25/ax25_addr.c:119
>  nr_dev_get+0x20e/0x450 net/netrom/nr_route.c:601
>  nr_route_frame+0x1a2/0xfc0 net/netrom/nr_route.c:774
>  nr_xmit+0x5a/0x1c0 net/netrom/nr_dev.c:144
>  __netdev_start_xmit include/linux/netdevice.h:4940 [inline]
>  netdev_start_xmit include/linux/netdevice.h:4954 [inline]
>  xmit_one net/core/dev.c:3548 [inline]
>  dev_hard_start_xmit+0x247/0xa10 net/core/dev.c:3564
>  __dev_queue_xmit+0x33b8/0x5130 net/core/dev.c:4349
>  dev_queue_xmit include/linux/netdevice.h:3134 [inline]
>  raw_sendmsg+0x654/0xc10 net/ieee802154/socket.c:299
>  ieee802154_sock_sendmsg+0x91/0xc0 net/ieee802154/socket.c:96
>  sock_sendmsg_nosec net/socket.c:730 [inline]
>  __sock_sendmsg net/socket.c:745 [inline]
>  ____sys_sendmsg+0x9c2/0xd60 net/socket.c:2584
>  ___sys_sendmsg+0x28d/0x3c0 net/socket.c:2638
>  __sys_sendmsg net/socket.c:2667 [inline]
>  __do_sys_sendmsg net/socket.c:2676 [inline]
>  __se_sys_sendmsg net/socket.c:2674 [inline]
>  __x64_sys_sendmsg+0x307/0x490 net/socket.c:2674
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0x44/0x110 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x63/0x6b
> 
> [...]

Here is the summary with links:
  - netrom: check buffer length before accessing it
    https://git.kernel.org/netdev/net/c/a4fd163aed2e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



