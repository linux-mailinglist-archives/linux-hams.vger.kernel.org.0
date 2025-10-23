Return-Path: <linux-hams+bounces-678-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4E0C010E9
	for <lists+linux-hams@lfdr.de>; Thu, 23 Oct 2025 14:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 305FE50913D
	for <lists+linux-hams@lfdr.de>; Thu, 23 Oct 2025 12:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0CD311956;
	Thu, 23 Oct 2025 12:13:52 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6743F310630
	for <linux-hams@vger.kernel.org>; Thu, 23 Oct 2025 12:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761221625; cv=none; b=HO8N2NEdM3ftA7oEm46TukJi8ILcKAawCAF2FxX/mTyInrsXz9LEUUvAaeQCd2sxAbCG7aSaJdCvo1WlSm5y2tDb5iDHucaVjf9maD8JVD76PemGIeDKzlINShjOpjL2q9kckFp+aMiiwRaQj+VSpEMkV+rd2jMgz1s0FoU26p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761221625; c=relaxed/simple;
	bh=3OYalnmnmKwShACgYaeWJVdJA3/45vqucJoDg6xxCKc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=AbY+MbbQtnFFs7XGgR3kk+u6I27LUVKnW8pciq+ParNgZpFPUUJEZrQzMl7MscCfp5Z3wZ1Fikg90FWvfiL9CpyJ/94b/bb7HmE1GCcsAlcmoETWg0XCJkmbo//2A5tdGjBIaVxXWHha4vf2WAFEs6zt0GQCqcSdcGPDQUfbD94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-431d999ebe8so23228335ab.1
        for <linux-hams@vger.kernel.org>; Thu, 23 Oct 2025 05:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761221613; x=1761826413;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eMiZfwr32apJwYZ0mK2NrZ0bAlrXvUhOwPNa+z4KCVk=;
        b=Z73HaljMZggF2zHQdYmfvKzCh+FqDyWUCVwXCkDYiaE1JMSGECalcW/qw/83EB/kj7
         9QndV5v84ule3J8JVK0khaH5jnhWL1fR+6gvZ39CfuIwM/BzAW6FImJSkHA5o2yTKhhE
         EA7quCBcXeGNC5yQ21ht27yOefzL1v5te8py0qKC85BKxCQPy0AHvZreABSJf7TquxTl
         Sd0kl5D0RVgev7Mh8AZcHuR1kJjhmOrnJ/ZqX7ep3K/mltUBlNBGNaNJmuqG7Zoxj9Ub
         qztW5bGje4spp6JSk/t2c5d5ZDnd87DGN3lm1+/Smtji6PkJbnR5XzaQrk6RNDlNCmoB
         Y0GA==
X-Forwarded-Encrypted: i=1; AJvYcCUuwUVbdCb7VykdReCxWLfFwQZm0mukE1YlbRIIakv4NuYtj8V+SlPxi2jycuAx+ALYUXWRSsPwxryZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyrO7W95+iXmGEoEh1hSDBK66RfqybSfmwrIQlPuTppGGmtNKX5
	dK//0q8MfdDvH+0qQ0gTuam3ewWQad54oU2srgm315W4t4iOjErCChp7KBgBfDq6+Kb3iEvyWmR
	yh9C88ax+HB9erwtDGp8bGcR/iIUysKlvNXZSnw0dqqG1ZOLmqxIcnwOMunk=
X-Google-Smtp-Source: AGHT+IG1eho+3d8N6tgVB3Q7FcdfCNix3RhE4k7Y3EXmYf3pNJHOETKhkDyn7aCRphZU4/EAps6qnrQp5IfNxVLuwwWk1tOT1dbW
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fca:b0:42f:946f:8eb4 with SMTP id
 e9e14a558f8ab-430c527bca5mr309055585ab.21.1761221612752; Thu, 23 Oct 2025
 05:13:32 -0700 (PDT)
Date: Thu, 23 Oct 2025 05:13:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68fa1bec.a70a0220.3bf6c6.004f.GAE@google.com>
Subject: [syzbot] [hams?] KASAN: slab-use-after-free Read in ax25_find_cb
From: syzbot <syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	jreuter@yaina.de, kuba@kernel.org, linux-hams@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    250a17e8f955 Merge tag 'erofs-for-6.18-rc3-fixes' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=154a3734580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d1ce99afe6f71855
dashboard link: https://syzkaller.appspot.com/bug?extid=caa052a0958a9146870d
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f51301069523/disk-250a17e8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a4671c3f2507/vmlinux-250a17e8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2b5a3b36a321/bzImage-250a17e8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in ax25_find_cb+0x3b8/0x3f0 net/ax25/af_ax25.c:237
Read of size 1 at addr ffff888059c704c0 by task syz.6.2733/17200

CPU: 1 UID: 0 PID: 17200 Comm: syz.6.2733 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xcd/0x630 mm/kasan/report.c:482
 kasan_report+0xe0/0x110 mm/kasan/report.c:595
 ax25_find_cb+0x3b8/0x3f0 net/ax25/af_ax25.c:237
 ax25_send_frame+0x157/0xb60 net/ax25/ax25_out.c:55
 rose_send_frame+0xcc/0x2c0 net/rose/rose_link.c:106
 rose_transmit_restart_request+0x1b8/0x240 net/rose/rose_link.c:198
 rose_t0timer_expiry+0x1d/0x150 net/rose/rose_link.c:83
 call_timer_fn+0x19a/0x620 kernel/time/timer.c:1747
 expire_timers kernel/time/timer.c:1798 [inline]
 __run_timers+0x6ef/0x960 kernel/time/timer.c:2372
 __run_timer_base kernel/time/timer.c:2384 [inline]
 __run_timer_base kernel/time/timer.c:2376 [inline]
 run_timer_base+0x114/0x190 kernel/time/timer.c:2393
 run_timer_softirq+0x1a/0x40 kernel/time/timer.c:2403
 handle_softirqs+0x219/0x8e0 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0x109/0x170 kernel/softirq.c:723
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:739
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1052 [inline]
 sysvec_apic_timer_interrupt+0x57/0xc0 arch/x86/kernel/apic/apic.c:1052
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
RIP: 0033:0x7fd4a4c68253
Code: 1f 84 00 00 00 00 00 48 8b 70 f8 48 83 e8 08 48 39 f2 72 f3 48 39 c3 73 3e 48 89 33 48 83 c3 08 48 8b 70 f8 48 89 08 48 8b 0b <49> 8b 14 24 eb bf 48 39 f2 72 97 48 39 f0 73 46 49 89 34 24 48 89
RSP: 002b:00007ffd914df840 EFLAGS: 00000212
RAX: 00007fd4a4777648 RBX: 00007fd4a47774b0 RCX: ffffffff8a01d69a
RDX: ffffffff8a01d69a RSI: ffffffff8a01d69a RDI: 00007fd4a47777a0
RBP: 00007fd4a4777358 R08: 00007fd4a4777578 R09: 00007fd4a4fd2000
R10: 00007fd4a43fd008 R11: 000000000000000a R12: 00007fd4a4777350
R13: 0000000000000016 R14: 00007ffd914dfab8 R15: 00007fd4a43fd008
 </TASK>

Allocated by task 13773:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:56
 kasan_save_track+0x14/0x30 mm/kasan/common.c:77
 poison_kmalloc_redzone mm/kasan/common.c:400 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:417
 kmalloc_noprof include/linux/slab.h:957 [inline]
 rose_add_node net/rose/rose_route.c:109 [inline]
 rose_rt_ioctl+0x1c40/0x2580 net/rose/rose_route.c:748
 rose_ioctl+0x64d/0x7c0 net/rose/af_rose.c:1381
 sock_do_ioctl+0x118/0x280 net/socket.c:1254
 sock_ioctl+0x227/0x6b0 net/socket.c:1375
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 17183:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:56
 kasan_save_track+0x14/0x30 mm/kasan/common.c:77
 __kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:587
 kasan_save_free_info mm/kasan/kasan.h:406 [inline]
 poison_slab_object mm/kasan/common.c:252 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:284
 kasan_slab_free include/linux/kasan.h:234 [inline]
 slab_free_hook mm/slub.c:2530 [inline]
 slab_free mm/slub.c:6619 [inline]
 kfree+0x2b8/0x6d0 mm/slub.c:6826
 rose_neigh_put include/net/rose.h:165 [inline]
 rose_timer_expiry+0x537/0x630 net/rose/rose_timer.c:183
 call_timer_fn+0x19a/0x620 kernel/time/timer.c:1747
 expire_timers kernel/time/timer.c:1798 [inline]
 __run_timers+0x6ef/0x960 kernel/time/timer.c:2372
 __run_timer_base kernel/time/timer.c:2384 [inline]
 __run_timer_base kernel/time/timer.c:2376 [inline]
 run_timer_base+0x114/0x190 kernel/time/timer.c:2393
 run_timer_softirq+0x1a/0x40 kernel/time/timer.c:2403
 handle_softirqs+0x219/0x8e0 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0x109/0x170 kernel/softirq.c:723
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:739
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1052 [inline]
 sysvec_apic_timer_interrupt+0xa4/0xc0 arch/x86/kernel/apic/apic.c:1052
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697

The buggy address belongs to the object at ffff888059c70480
 which belongs to the cache kmalloc-96 of size 96
The buggy address is located 64 bytes inside of
 freed 96-byte region [ffff888059c70480, ffff888059c704e0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888059c70b00 pfn:0x59c70
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff88813ffa6280 ffffea0001df33d0 ffffea0000c94410
raw: ffff888059c70b00 000000000020001f 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 5815, tgid 5815 (syz-executor), ts 66851059499, free_ts 66850862508
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1c0/0x230 mm/page_alloc.c:1850
 prep_new_page mm/page_alloc.c:1858 [inline]
 get_page_from_freelist+0x10a3/0x3a30 mm/page_alloc.c:3884
 __alloc_frozen_pages_noprof+0x25f/0x2470 mm/page_alloc.c:5183
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2416
 alloc_slab_page mm/slub.c:3046 [inline]
 allocate_slab mm/slub.c:3219 [inline]
 new_slab+0x24a/0x360 mm/slub.c:3273
 ___slab_alloc+0xdc4/0x1ae0 mm/slub.c:4643
 __slab_alloc.constprop.0+0x63/0x110 mm/slub.c:4762
 __slab_alloc_node mm/slub.c:4838 [inline]
 slab_alloc_node mm/slub.c:5260 [inline]
 __kmalloc_cache_noprof+0x477/0x780 mm/slub.c:5750
 kmalloc_noprof include/linux/slab.h:957 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 class_dir_create_and_add drivers/base/core.c:3223 [inline]
 get_device_parent+0x2b1/0x4e0 drivers/base/core.c:3283
 device_add+0x1ad/0x1aa0 drivers/base/core.c:3613
 netdev_register_kobject+0x1a9/0x3d0 net/core/net-sysfs.c:2358
 register_netdevice+0x13dc/0x2270 net/core/dev.c:11294
 cfg80211_register_netdevice+0x149/0x340 net/wireless/core.c:1518
 ieee80211_if_add+0xc9d/0x1a40 net/mac80211/iface.c:2295
 ieee80211_register_hw+0x393b/0x4120 net/mac80211/main.c:1608
 mac80211_hwsim_new_radio+0x32d8/0x50b0 drivers/net/wireless/virtual/mac80211_hwsim.c:5803
page last free pid 5815 tgid 5815 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1394 [inline]
 __free_frozen_pages+0x7df/0x1160 mm/page_alloc.c:2906
 selinux_genfs_get_sid security/selinux/hooks.c:1357 [inline]
 inode_doinit_with_dentry+0xacb/0x12e0 security/selinux/hooks.c:1555
 selinux_d_instantiate+0x26/0x30 security/selinux/hooks.c:6523
 security_d_instantiate+0x142/0x1a0 security/security.c:4148
 d_instantiate+0x5c/0x90 fs/dcache.c:1961
 __debugfs_create_file+0x286/0x6b0 fs/debugfs/inode.c:459
 debugfs_create_file_short+0x41/0x60 fs/debugfs/inode.c:480
 add_link_files+0xff/0x120 net/mac80211/debugfs_netdev.c:990
 ieee80211_debugfs_add_netdev net/mac80211/debugfs_netdev.c:1011 [inline]
 ieee80211_debugfs_recreate_netdev+0xf70/0x17e0 net/mac80211/debugfs_netdev.c:1033
 ieee80211_if_add+0x9b9/0x1a40 net/mac80211/iface.c:2269
 ieee80211_register_hw+0x393b/0x4120 net/mac80211/main.c:1608
 mac80211_hwsim_new_radio+0x32d8/0x50b0 drivers/net/wireless/virtual/mac80211_hwsim.c:5803
 hwsim_new_radio_nl+0xba2/0x1330 drivers/net/wireless/virtual/mac80211_hwsim.c:6497
 genl_family_rcv_msg_doit+0x209/0x2f0 net/netlink/genetlink.c:1115
 genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
 genl_rcv_msg+0x55c/0x800 net/netlink/genetlink.c:1210
 netlink_rcv_skb+0x158/0x420 net/netlink/af_netlink.c:2552

Memory state around the buggy address:
 ffff888059c70380: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
 ffff888059c70400: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
>ffff888059c70480: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
                                           ^
 ffff888059c70500: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
 ffff888059c70580: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
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

