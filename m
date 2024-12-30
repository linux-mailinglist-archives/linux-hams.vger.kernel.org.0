Return-Path: <linux-hams+bounces-457-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BFF9FE1AA
	for <lists+linux-hams@lfdr.de>; Mon, 30 Dec 2024 02:55:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04F0A18821C9
	for <lists+linux-hams@lfdr.de>; Mon, 30 Dec 2024 01:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBC878F5B;
	Mon, 30 Dec 2024 01:55:21 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495F76F06B
	for <linux-hams@vger.kernel.org>; Mon, 30 Dec 2024 01:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735523721; cv=none; b=G1ylyUaCBP/mG0p/NHIcg4j6Ym4DTvL1gc9mcMQfDMM3pCxe5Y6Y47usy7wKrTbtZ1IvvGrM0XH6zAE1raUYPoYD+1mms7G3B1ldbE8sLePdQmu09MFNr/jSDNwhOEmPaEgqNEqG2h0jol/NsV659S/0qfiJMwaUDo/TdcEnyrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735523721; c=relaxed/simple;
	bh=X2xHlkwdTLoE40bUfraJ6jcr2bWSnUrBJJRLm0iSD30=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=b4ctk17s3dKskngZ0ZIEgyRADiIpUGkLrBSjgwiTqADHAwqRi0LfOFn7cG4oYbxX6dWxf3Gvru5YY7AikNoKxmNscXujHjIlcA9BdzduSnYBoHHaTlLBxv8iSw8cucX2SpGe4vrHLZDU5FSIaBJW926+3ejnvAvFEvw1BLrU2ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3a78421a2e1so151609075ab.2
        for <linux-hams@vger.kernel.org>; Sun, 29 Dec 2024 17:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735523718; x=1736128518;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VNmv7+uKVMcCP9FuUMHe33ubA55YAyylWOZExA6DbM0=;
        b=AJLcRj4M6jWUVNJsflCwRwW8TZ5kunFUWeVJANtyYdyZnmXa0yUQFIh0ySF+d3exx4
         SKOLP8UBKQT64lLQuxys35mTwLx2SUFm133dgu0pd3spFGR/RxVLKl1vHwmkVwbV/Msb
         sxiq5Pr7X5R31+XNQISdV2hpAmpKk92PVk62/NvxUCSj88LtLzDoqsxw4fJ3TxDKDGX9
         pH8mGbsKZEH5UUHwPEcIbVAAXhyyjiIqOAkT4Zj3zjftqbuhxyX4qD4vaz5MnXWXq55q
         pNt+AAuW8XFxFsEi4C+lZNGXxcyb5MTApbbCM9usUvbTva1XPTf9Irzte2GVJxBMzpqd
         SdHA==
X-Forwarded-Encrypted: i=1; AJvYcCXhuo9sq8olgTYJuMma594mleVt5uBYHamwxdIBvP5QDWWokt2ghy48j5L0aNAUlFVefKFPtZejircK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4I7OZ2ie/Sdli9HSrWhml92Clo8qpY8HwX8yCW3LK1edYK/o0
	VKXAOnGxvHZECDQ5LsoJbJN3H4wq4koPsMMPWKUUZrhuiEaGf5qnLHnk8fEsgVn9tM8tpTZ3OXi
	1BQ/a6y8wdW7VnX9Bj2uqwNEeN3yYiIderAJsoPQmpM8RSqMsfCeUumk=
X-Google-Smtp-Source: AGHT+IFKXi2kwaWCi7JWaDVLSpTz1g4zI6hCh0P0m0kqqZXaXokFDeQN8TcCL1WNYXgsRcRNkjHpJdOum4T6p2/eSkBgDGR5XNNG
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18cd:b0:3a7:81a4:a557 with SMTP id
 e9e14a558f8ab-3c2d65e508dmr275491035ab.24.1735523718578; Sun, 29 Dec 2024
 17:55:18 -0800 (PST)
Date: Sun, 29 Dec 2024 17:55:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6771fd86.050a0220.2f3838.04b3.GAE@google.com>
Subject: [syzbot] [hams?] KASAN: slab-use-after-free Read in ax25_release
From: syzbot <syzbot+a5716c7fb89dcd7205d8@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	jreuter@yaina.de, kuba@kernel.org, linux-hams@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4099a71718b0 Merge tag 'sched-urgent-2024-12-29' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=133e70b0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aa8dc22aa6de51f5
dashboard link: https://syzkaller.appspot.com/bug?extid=a5716c7fb89dcd7205d8
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-4099a717.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b05c8741aa90/vmlinux-4099a717.xz
kernel image: https://storage.googleapis.com/syzbot-assets/406102cf22f0/bzImage-4099a717.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a5716c7fb89dcd7205d8@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in ax25_release+0x99a/0xa10 net/ax25/af_ax25.c:1062
Read of size 1 at addr ffff88804c0f9ccc by task syz.0.352/7238

CPU: 3 UID: 0 PID: 7238 Comm: syz.0.352 Not tainted 6.13.0-rc4-syzkaller-00110-g4099a71718b0 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:489
 kasan_report+0xd9/0x110 mm/kasan/report.c:602
 ax25_release+0x99a/0xa10 net/ax25/af_ax25.c:1062
 __sock_release+0xb0/0x270 net/socket.c:640
 sock_close+0x1c/0x30 net/socket.c:1408
 __fput+0x3f8/0xb60 fs/file_table.c:450
 task_work_run+0x14e/0x250 kernel/task_work.c:239
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x27b/0x2a0 kernel/entry/common.c:218
 do_syscall_64+0xda/0x250 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8962185d29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffdad15cf68 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 00000000000106e8 RCX: 00007f8962185d29
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007f8962377ba0 R08: 0000000000000001 R09: 00007ffdad15d25f
R10: 00007f8962000000 R11: 0000000000000246 R12: 0000000000010730
R13: 00007f8962375fa0 R14: 0000000000000032 R15: ffffffffffffffff
 </TASK>

Allocated by task 7239:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 ax25_dev_device_up+0x47/0x690 net/ax25/ax25_dev.c:57
 ax25_device_event+0x485/0x610 net/ax25/af_ax25.c:143
 notifier_call_chain+0xb7/0x410 kernel/notifier.c:85
 call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:1996
 call_netdevice_notifiers_extack net/core/dev.c:2034 [inline]
 call_netdevice_notifiers net/core/dev.c:2048 [inline]
 __dev_notify_flags+0x12d/0x2e0 net/core/dev.c:8988
 dev_change_flags+0x10c/0x160 net/core/dev.c:9026
 dev_ifsioc+0x9c8/0x10b0 net/core/dev_ioctl.c:526
 dev_ioctl+0x224/0x10c0 net/core/dev_ioctl.c:783
 sock_do_ioctl+0x19e/0x280 net/socket.c:1223
 sock_ioctl+0x228/0x6c0 net/socket.c:1328
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 7239:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:582
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4613 [inline]
 kfree+0x14f/0x4b0 mm/slub.c:4761
 ax25_dev_put include/net/ax25.h:294 [inline]
 ax25_dev_device_down+0x341/0x400 net/ax25/ax25_dev.c:131
 ax25_device_event+0x4b5/0x610 net/ax25/af_ax25.c:148
 notifier_call_chain+0xb7/0x410 kernel/notifier.c:85
 call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:1996
 call_netdevice_notifiers_extack net/core/dev.c:2034 [inline]
 call_netdevice_notifiers net/core/dev.c:2048 [inline]
 dev_close_many+0x333/0x6a0 net/core/dev.c:1589
 dev_close net/core/dev.c:1611 [inline]
 dev_close+0x181/0x230 net/core/dev.c:1605
 bpq_device_event+0x820/0xaf0 drivers/net/hamradio/bpqether.c:547
 notifier_call_chain+0xb7/0x410 kernel/notifier.c:85
 call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:1996
 call_netdevice_notifiers_extack net/core/dev.c:2034 [inline]
 call_netdevice_notifiers net/core/dev.c:2048 [inline]
 dev_close_many+0x333/0x6a0 net/core/dev.c:1589
 dev_close net/core/dev.c:1611 [inline]
 dev_close+0x181/0x230 net/core/dev.c:1605
 bond_setup_by_slave drivers/net/bonding/bond_main.c:1631 [inline]
 bond_enslave+0x1f67/0x6040 drivers/net/bonding/bond_main.c:2043
 bond_do_ioctl+0x60e/0x6d0 drivers/net/bonding/bond_main.c:4685
 dev_siocbond net/core/dev_ioctl.c:471 [inline]
 dev_ifsioc+0x1ea/0x10b0 net/core/dev_ioctl.c:613
 dev_ioctl+0x224/0x10c0 net/core/dev_ioctl.c:783
 sock_do_ioctl+0x19e/0x280 net/socket.c:1223
 sock_ioctl+0x228/0x6c0 net/socket.c:1328
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88804c0f9c00
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 204 bytes inside of
 freed 256-byte region [ffff88804c0f9c00, ffff88804c0f9d00)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x4c0f8
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b042b40 0000000000000000 dead000000000001
raw: 0000000000000000 0000000080100010 00000001f5000000 0000000000000000
head: 00fff00000000040 ffff88801b042b40 0000000000000000 dead000000000001
head: 0000000000000000 0000000080100010 00000001f5000000 0000000000000000
head: 00fff00000000001 ffffea0001303e01 ffffffffffffffff 0000000000000000
head: 0000000000000002 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5931, tgid 5931 (syz-executor), ts 45493664183, free_ts 45397637475
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1558
 prep_new_page mm/page_alloc.c:1566 [inline]
 get_page_from_freelist+0xfce/0x2f80 mm/page_alloc.c:3476
 __alloc_pages_noprof+0x223/0x25b0 mm/page_alloc.c:4753
 alloc_pages_mpol_noprof+0x2c9/0x610 mm/mempolicy.c:2269
 alloc_slab_page mm/slub.c:2423 [inline]
 allocate_slab mm/slub.c:2589 [inline]
 new_slab+0x2c9/0x410 mm/slub.c:2642
 ___slab_alloc+0xd7d/0x17a0 mm/slub.c:3830
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3920
 __slab_alloc_node mm/slub.c:3995 [inline]
 slab_alloc_node mm/slub.c:4156 [inline]
 __do_kmalloc_node mm/slub.c:4297 [inline]
 __kmalloc_noprof+0x2ec/0x510 mm/slub.c:4310
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 fib_create_info+0x8c1/0x5080 net/ipv4/fib_semantics.c:1435
 fib_table_insert+0x1d7/0x1d70 net/ipv4/fib_trie.c:1231
 fib_magic+0x4d6/0x5c0 net/ipv4/fib_frontend.c:1112
 fib_add_ifaddr+0x174/0x560 net/ipv4/fib_frontend.c:1134
 fib_netdev_event+0x38a/0x710 net/ipv4/fib_frontend.c:1494
 notifier_call_chain+0xb7/0x410 kernel/notifier.c:85
 call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:1996
 call_netdevice_notifiers_extack net/core/dev.c:2034 [inline]
 call_netdevice_notifiers net/core/dev.c:2048 [inline]
 __dev_notify_flags+0x12d/0x2e0 net/core/dev.c:8988
page last free pid 5933 tgid 5933 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_unref_page+0x661/0x1080 mm/page_alloc.c:2659
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4e/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4119 [inline]
 slab_alloc_node mm/slub.c:4168 [inline]
 kmem_cache_alloc_lru_noprof+0x226/0x3d0 mm/slub.c:4187
 __d_alloc+0x31/0xaa0 fs/dcache.c:1646
 d_alloc+0x4a/0x1e0 fs/dcache.c:1726
 d_alloc_parallel+0xe9/0x12b0 fs/dcache.c:2490
 __lookup_slow+0x194/0x460 fs/namei.c:1776
 lookup_one_len+0x181/0x1b0 fs/namei.c:2905
 start_creating.part.0+0x12f/0x3a0 fs/debugfs/inode.c:378
 start_creating fs/debugfs/inode.c:351 [inline]
 __debugfs_create_file+0xa5/0x660 fs/debugfs/inode.c:423
 debugfs_create_file_short+0x74/0xa0 fs/debugfs/inode.c:478
 add_common_files net/mac80211/debugfs_netdev.c:830 [inline]
 add_files net/mac80211/debugfs_netdev.c:947 [inline]
 ieee80211_debugfs_add_netdev net/mac80211/debugfs_netdev.c:1011 [inline]
 ieee80211_debugfs_recreate_netdev+0x584/0x1700 net/mac80211/debugfs_netdev.c:1044
 ieee80211_if_add+0x9a9/0x18d0 net/mac80211/iface.c:2190
 ieee80211_register_hw+0x382c/0x41a0 net/mac80211/main.c:1594

Memory state around the buggy address:
 ffff88804c0f9b80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88804c0f9c00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88804c0f9c80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                              ^
 ffff88804c0f9d00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88804c0f9d80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

