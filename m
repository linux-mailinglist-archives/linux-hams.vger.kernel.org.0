Return-Path: <linux-hams+bounces-726-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BAFCA330B
	for <lists+linux-hams@lfdr.de>; Thu, 04 Dec 2025 11:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C68D314EFF9
	for <lists+linux-hams@lfdr.de>; Thu,  4 Dec 2025 10:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E9D335BA6;
	Thu,  4 Dec 2025 10:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7Lug+Ex"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CE0335574;
	Thu,  4 Dec 2025 10:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764843188; cv=none; b=TtIOSuFVtm4pl52JOke9wlvcZs7J/eFANoAdM/QJd1ToblSyM+p0EBDSjIWDlC50HAYhmQ1koHdU9bhuZ3VAYn5TEGWYR74rWOCjrfRHyhVXqIYCtUi+MlHXbKHtc6jlZy/OYC6RbjluF26/AFAb3i8z1wsZt6Feryvpzz5DBm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764843188; c=relaxed/simple;
	bh=PJtYn+wfEO54GKOyH+nLn8yJzebo8sY3af1DHLU07no=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GTVua0LC0qR0CzVEnmHZRTvbF+ArJUyf7WrDpx3gZBi3OyJzVYZttH6OQkOILTbvVkQU2eOoGgiPlAWayawIhb3p2blYOupiyuf4tH25/XpAx8EizK6jQwYG032xUti7eAGU8qliOza/2vWEwNytcrRcIStgacBlpConGC7WSG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7Lug+Ex; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5788C4CEFB;
	Thu,  4 Dec 2025 10:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764843187;
	bh=PJtYn+wfEO54GKOyH+nLn8yJzebo8sY3af1DHLU07no=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=T7Lug+Ex6TpWLnO1AkmYT+4MLAPE+7giJKRrK3/ra6ki4b6mRH7BDtz7GEBLC9bed
	 4wavgxy+kJAAhchlLovSXV3V3etYu8DXOksJqAG1R4/nyRH8xmyXBBYoXB4R6HMifb
	 iZSVQY+NJ5zssVPFSZ1xW5uE+TcGTZ+SRZKuVDy5dimNWUApJCaONnkVxOcx1eiCIp
	 gWj9lkLCuD/f+gQliEMwDP3kIfXED1P67YmSgsC6y+wbwMjk0yEtI/+7SqAyVryci3
	 +1+IBWMBnNQwFDg0thXbbt8mzvoyyp8U3kNUV8W/bsMpWNkuLuv0U1ZvCxX+QnUiPh
	 VaTeQoKV566rw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 788AA3AA9A97;
	Thu,  4 Dec 2025 10:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] netrom: Fix memory leak in nr_sendmsg()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176484300630.715175.16155719972689096623.git-patchwork-notify@kernel.org>
Date: Thu, 04 Dec 2025 10:10:06 +0000
References: <20251129041315.1550766-1-wangliang74@huawei.com>
In-Reply-To: <20251129041315.1550766-1-wangliang74@huawei.com>
To: Wang Liang <wangliang74@huawei.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, linux-hams@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, yuehaibing@huawei.com,
 zhangchangzhong@huawei.com

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sat, 29 Nov 2025 12:13:15 +0800 you wrote:
> syzbot reported a memory leak [1].
> 
> When function sock_alloc_send_skb() return NULL in nr_output(), the
> original skb is not freed, which was allocated in nr_sendmsg(). Fix this
> by freeing it before return.
> 
> [1]
> BUG: memory leak
> unreferenced object 0xffff888129f35500 (size 240):
>   comm "syz.0.17", pid 6119, jiffies 4294944652
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 10 52 28 81 88 ff ff  ..........R(....
>   backtrace (crc 1456a3e4):
>     kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
>     slab_post_alloc_hook mm/slub.c:4983 [inline]
>     slab_alloc_node mm/slub.c:5288 [inline]
>     kmem_cache_alloc_node_noprof+0x36f/0x5e0 mm/slub.c:5340
>     __alloc_skb+0x203/0x240 net/core/skbuff.c:660
>     alloc_skb include/linux/skbuff.h:1383 [inline]
>     alloc_skb_with_frags+0x69/0x3f0 net/core/skbuff.c:6671
>     sock_alloc_send_pskb+0x379/0x3e0 net/core/sock.c:2965
>     sock_alloc_send_skb include/net/sock.h:1859 [inline]
>     nr_sendmsg+0x287/0x450 net/netrom/af_netrom.c:1105
>     sock_sendmsg_nosec net/socket.c:727 [inline]
>     __sock_sendmsg net/socket.c:742 [inline]
>     sock_write_iter+0x293/0x2a0 net/socket.c:1195
>     new_sync_write fs/read_write.c:593 [inline]
>     vfs_write+0x45d/0x710 fs/read_write.c:686
>     ksys_write+0x143/0x170 fs/read_write.c:738
>     do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>     do_syscall_64+0xa4/0xfa0 arch/x86/entry/syscall_64.c:94
>     entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> [...]

Here is the summary with links:
  - [net] netrom: Fix memory leak in nr_sendmsg()
    https://git.kernel.org/netdev/net/c/613d12dd794e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



