Return-Path: <linux-hams+bounces-515-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8022CA95C3B
	for <lists+linux-hams@lfdr.de>; Tue, 22 Apr 2025 04:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 825D9164FF6
	for <lists+linux-hams@lfdr.de>; Tue, 22 Apr 2025 02:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0340B13C81B;
	Tue, 22 Apr 2025 02:40:29 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010D9481B6
	for <linux-hams@vger.kernel.org>; Tue, 22 Apr 2025 02:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745289628; cv=none; b=okumovrfWiLoldcjybGhSNXu93Ood5k9MbRJAF+9obM7JP5dBjbj/MVRMOarxKg5dJHzja1rPQSAN93QlO1+mn1CX/6Lxz0op8v8aLSGsVEEQsKLF6CqKJBJfv4G43QFqnLEDebPZ0sFUH7HBn8oPEXFNFNYieFn3hyxoQFNW/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745289628; c=relaxed/simple;
	bh=kYS0nGVHs12GmpOBUd5Mychc86qJDLeH/B6t6DhYNHA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sLkYLG/OSxcjSKGYszViuz4CIClLyLDCjaDRb7lfyTv9VYfs92HBtpKHUxdwMJ+e3ANf7o26yjk12PgskFTx2453nyEkqKMHHzre79ztnsTnW9uqbDfMksZ7B8FsMga2vmNEoea9DuIMPFQ2FhGnYhaUf+pIxOY2dgpeeAHJvxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d43541a706so44734725ab.1
        for <linux-hams@vger.kernel.org>; Mon, 21 Apr 2025 19:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745289626; x=1745894426;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rDG388NK6Fa8Gk8Ce+vpDfN3AxtEeUkFipST/8bhzw=;
        b=GSJplrAIhk7l9ItHPpEDyMaMNsZlRKXrQrQ29RNSGDTI+dfUWevjPSM/mBcgGlOlb6
         7Ui/upNUc1gs3R0Zq7vzSIw5YzS68iTOeytoe5SDAIzgzIOdxRC6VkZAHYk5XaOzt9CQ
         1ZU7or1S4YWNeLoBHYcKIPaoEbZmSVlTD43JDZ4+95luw0ne+MbYxSw6+DLT5qDa2rrd
         7luRKBKnxOJJ3a277eDLhkFtWtfdPyTVYn0cVO/x4CLh/OLuSuvatVAUkI72ho7zJbkq
         vfCVajhjyQGjbuNaxTjH7PUdUctpmMVcKkfjcrfmXeifGdgIPhViKAbJAGI8JpCF4dbR
         XjtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNOjw0oPUzEzRN3aR2wL8buESab93ZTbeeUeV7OhldF4G5PnoVEGcvvZlk0XkMm6aYscmDIIwGpJCD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5N4z0yJ8zmiCDME7rBKz1DKn0+TPAGb0+qsLBVkeCxAUhvbuG
	5Q5F11ieMmPdwoxOBweWlcg00AejdW/TqWsOi1oBEr0MjOriEjW2fYKLJU+pLZqNoeN8ro+zZkA
	/IqV7UNTWF+fNA5x4rIIGQN/JuUPzjaIf4cxSUZEclgkRXJjjKnXFM7w=
X-Google-Smtp-Source: AGHT+IHGFKtU40ux+YN62NluSf85gst2pf88YYG1QYMz2vCc6F5s2+7AviogYMy74os3Z2REvK9Vbuqm5oCoQBOxIQ69H7/tehsI
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2785:b0:3d2:aa73:7b7a with SMTP id
 e9e14a558f8ab-3d88ed8d70emr151088955ab.12.1745289626073; Mon, 21 Apr 2025
 19:40:26 -0700 (PDT)
Date: Mon, 21 Apr 2025 19:40:26 -0700
In-Reply-To: <0000000000009e3ae2061a97c386@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6807019a.050a0220.380c13.0001.GAE@google.com>
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in rose_get_neigh
From: syzbot <syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    9d7a0577c9db gcc-15: disable '-Wunterminated-string-initia..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=139b5ccc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=efa83f9a6dd67d67
dashboard link: https://syzkaller.appspot.com/bug?extid=e04e2c007ba2c80476cb
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15652c70580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17676c70580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/97d5bc2781eb/disk-9d7a0577.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/25887608b61e/vmlinux-9d7a0577.xz
kernel image: https://storage.googleapis.com/syzbot-assets/505d68dbd87d/bzImage-9d7a0577.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in rose_get_neigh+0x549/0x640 net/rose/rose_route.c:692
Read of size 1 at addr ffff888036f04c30 by task syz-executor234/6532

CPU: 0 UID: 0 PID: 6532 Comm: syz-executor234 Not tainted 6.15.0-rc3-syzkaller-00001-g9d7a0577c9db #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xc3/0x670 mm/kasan/report.c:521
 kasan_report+0xe0/0x110 mm/kasan/report.c:634
 rose_get_neigh+0x549/0x640 net/rose/rose_route.c:692
 rose_connect+0x2d4/0x1540 net/rose/af_rose.c:816
 __sys_connect_file+0x13e/0x1a0 net/socket.c:2038
 __sys_connect+0x14d/0x170 net/socket.c:2057
 __do_sys_connect net/socket.c:2063 [inline]
 __se_sys_connect net/socket.c:2060 [inline]
 __x64_sys_connect+0x72/0xb0 net/socket.c:2060
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb5b7a9cc29
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 91 1f 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb5b7223168 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: ffffffffffffffda RBX: 00007fb5b7b22438 RCX: 00007fb5b7a9cc29
RDX: 0000000000000040 RSI: 0000200000000040 RDI: 0000000000000006
RBP: 00007fb5b7b22430 R08: 00007fb5b72236c0 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fb5b7b2243c
R13: 000000000000006e R14: 00007ffe0d8e5c80 R15: 00007ffe0d8e5d68
 </TASK>

Allocated by task 5886:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:905 [inline]
 rose_add_node net/rose/rose_route.c:85 [inline]
 rose_rt_ioctl+0x87e/0x1d40 net/rose/rose_route.c:747
 rose_ioctl+0x64d/0x7d0 net/rose/af_rose.c:1380
 sock_do_ioctl+0x115/0x280 net/socket.c:1190
 sock_ioctl+0x227/0x6b0 net/socket.c:1311
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6532:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2398 [inline]
 slab_free mm/slub.c:4656 [inline]
 kfree+0x2b6/0x4d0 mm/slub.c:4855
 rose_remove_neigh+0x25e/0x370 net/rose/rose_route.c:240
 rose_rt_device_down+0x2aa/0x390 net/rose/rose_route.c:522
 rose_device_event+0xfc/0x120 net/rose/af_rose.c:248
 notifier_call_chain+0xb9/0x410 kernel/notifier.c:85
 call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:2176
 call_netdevice_notifiers_extack net/core/dev.c:2214 [inline]
 call_netdevice_notifiers net/core/dev.c:2228 [inline]
 __dev_notify_flags+0x1f7/0x2e0 net/core/dev.c:9407
 netif_change_flags+0x108/0x160 net/core/dev.c:9434
 dev_change_flags+0xba/0x250 net/core/dev_api.c:68
 dev_ifsioc+0x1498/0x1f70 net/core/dev_ioctl.c:565
 dev_ioctl+0x223/0x10e0 net/core/dev_ioctl.c:821
 sock_do_ioctl+0x19d/0x280 net/socket.c:1204
 sock_ioctl+0x227/0x6b0 net/socket.c:1311
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888036f04c00
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 48 bytes inside of
 freed 512-byte region [ffff888036f04c00, ffff888036f04e00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x36f04
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b441c80 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b441c80 dead000000000122 0000000000000000
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000002 ffffea0000dbc101 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5825, tgid 5825 (syz-executor234), ts 69568665808, free_ts 69397287194
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x181/0x1b0 mm/page_alloc.c:1718
 prep_new_page mm/page_alloc.c:1726 [inline]
 get_page_from_freelist+0x135c/0x3920 mm/page_alloc.c:3688
 __alloc_frozen_pages_noprof+0x263/0x23a0 mm/page_alloc.c:4970
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2301
 alloc_slab_page mm/slub.c:2468 [inline]
 allocate_slab mm/slub.c:2632 [inline]
 new_slab+0x244/0x340 mm/slub.c:2686
 ___slab_alloc+0xd9c/0x1940 mm/slub.c:3872
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3962
 __slab_alloc_node mm/slub.c:4037 [inline]
 slab_alloc_node mm/slub.c:4198 [inline]
 __do_kmalloc_node mm/slub.c:4340 [inline]
 __kmalloc_noprof+0x2f2/0x510 mm/slub.c:4353
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 fib6_info_alloc+0x40/0x160 net/ipv6/ip6_fib.c:155
 ip6_route_info_create+0x33f/0x18e0 net/ipv6/route.c:3802
 addrconf_f6i_alloc+0x391/0x670 net/ipv6/route.c:4631
 ipv6_add_addr+0x531/0x1fe0 net/ipv6/addrconf.c:1121
 inet6_addr_add+0x256/0x960 net/ipv6/addrconf.c:3049
 inet6_rtm_newaddr+0x1619/0x1c70 net/ipv6/addrconf.c:5060
 rtnetlink_rcv_msg+0x95b/0xe90 net/core/rtnetlink.c:6955
 netlink_rcv_skb+0x16a/0x440 net/netlink/af_netlink.c:2534
page last free pid 5827 tgid 5827 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1262 [inline]
 __free_frozen_pages+0x69d/0xff0 mm/page_alloc.c:2725
 discard_slab mm/slub.c:2730 [inline]
 __put_partials+0x16d/0x1c0 mm/slub.c:3199
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4e/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4161 [inline]
 slab_alloc_node mm/slub.c:4210 [inline]
 __kmalloc_cache_noprof+0x1f1/0x3e0 mm/slub.c:4367
 kmalloc_noprof include/linux/slab.h:905 [inline]
 netdevice_queue_work drivers/infiniband/core/roce_gid_mgmt.c:664 [inline]
 netdevice_event+0x365/0x9d0 drivers/infiniband/core/roce_gid_mgmt.c:823
 notifier_call_chain+0xb9/0x410 kernel/notifier.c:85
 call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:2176
 call_netdevice_notifiers_extack net/core/dev.c:2214 [inline]
 call_netdevice_notifiers net/core/dev.c:2228 [inline]
 netif_set_mac_address+0x378/0x4a0 net/core/dev.c:9601
 do_setlink.constprop.0+0x9f1/0x44b0 net/core/rtnetlink.c:3103
 rtnl_changelink net/core/rtnetlink.c:3769 [inline]
 __rtnl_newlink net/core/rtnetlink.c:3928 [inline]
 rtnl_newlink+0x1446/0x2000 net/core/rtnetlink.c:4065
 rtnetlink_rcv_msg+0x95b/0xe90 net/core/rtnetlink.c:6955
 netlink_rcv_skb+0x16a/0x440 net/netlink/af_netlink.c:2534
 netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
 netlink_unicast+0x53a/0x7f0 net/netlink/af_netlink.c:1339
 netlink_sendmsg+0x8d1/0xdd0 net/netlink/af_netlink.c:1883

Memory state around the buggy address:
 ffff888036f04b00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888036f04b80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888036f04c00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                     ^
 ffff888036f04c80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888036f04d00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

