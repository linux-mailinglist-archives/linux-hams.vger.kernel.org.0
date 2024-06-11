Return-Path: <linux-hams+bounces-364-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD9F90331B
	for <lists+linux-hams@lfdr.de>; Tue, 11 Jun 2024 08:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB1F91C24539
	for <lists+linux-hams@lfdr.de>; Tue, 11 Jun 2024 06:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5BD171E5C;
	Tue, 11 Jun 2024 06:56:27 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9B0171095
	for <linux-hams@vger.kernel.org>; Tue, 11 Jun 2024 06:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718088987; cv=none; b=opgJw5foeP01Q8kJ3zDpTYKcDsjcLgpEiJCpug4TSwRVjy1cgDI0iwThTO5j3q7Uw07N+uVLd7loNamHrodQW1UZHxgMeOut7LqnezVHUavZ/wbiXCpFy4+aHCE9HilwZB3N5itzZGMJiYByEKcdPNIgcxEnaCLf8uIMV3poV/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718088987; c=relaxed/simple;
	bh=aq13VU7Q9k2bv8uKCMvXVSbGXuRCq0H38CHAeK23d/s=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=NygCCmpwAGiZHVvVIuAU4E0x1r5fNVPM8N/GTVGYA9LKYWXSbERswPlhXabappd8sW29w05zyeF/V/w2CyfxnmRpisbKz8BMCZu/pz6CrIzxr7TQ3wYXfNfOHpdqP58/8xocEq1q+aheNxw28QrYdi0uFQGrqxNYILqwMU6I7lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-7e1fe2ba2e1so85148439f.3
        for <linux-hams@vger.kernel.org>; Mon, 10 Jun 2024 23:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718088984; x=1718693784;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1QeVVtVbuY3lKewmm2GkZz0EfS3sN5PtZNaGwExOd5k=;
        b=wEz9A0zChFZ/Eq2FNw/iZ5nJJxja1/9glDRcl+59HyFfq5pdA0pABG1xcpBih4FqDL
         C8PGPa3+Hg7jOYldHibwbTDwvFb7UC4shBq1vzFr/7FPj6I4vBG3qyU4YVd8UVqVp9SF
         avv3Z40Cm5cBfi7aQn64tJjn8/Idd2YXOV4N6HUSis/y/IRcHCnw9z/HnBp02UKFFBH9
         CGjMIE5xiCx2FRSfXnCXEjARDS36ZsN5IVTbJaaoXmfU0pk1G7KHz40GO56n5xmMPO6m
         yAEkILqrmr/z+L20TF5kuvePX6Cx3J/RNvmnsdXDABECDfLHPOx1VM/AJz3wautsUXQI
         6Avw==
X-Forwarded-Encrypted: i=1; AJvYcCW4jXUIuMIYnbrOdOH4P4THKNUw3AqgEAEMELjAwOCezL2tyEX20b4DKW6QFJZr+Fqt0SK0uN2mMHCRC0yCM7cqiKxL9X6y4IxaYQ==
X-Gm-Message-State: AOJu0Yx2VQymr1oaXMKwSp838KR80Eg+BGZvUp6gSE+3UzbfLBb79C1v
	CsxriwjD0fAiSIhbNPOi4QG3IyHxeM8Hd9JewIblnGwR/YDOj6LI+qmcLv57ZxfzzuDt4uv3efG
	1PTtZ1uxFpRwGlqzLeJ6l7BhI8uSmHCHlZIKl0ahMJbUHmtMFLdTl+Ao=
X-Google-Smtp-Source: AGHT+IEISY8jjTZg+wAe6q/iI2pWLAxhKzCBFaWnxj27wrphFEXISixXouHbOhjt/zVby7iGH5Wzy9pvhWQTIm9LekDCuijo3W//
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:8608:b0:4b7:ba1f:5449 with SMTP id
 8926c6da1cb9f-4b7ba1f5689mr732024173.4.1718088984568; Mon, 10 Jun 2024
 23:56:24 -0700 (PDT)
Date: Mon, 10 Jun 2024 23:56:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009e3ae2061a97c386@google.com>
Subject: [syzbot] [hams?] KASAN: slab-use-after-free Read in rose_get_neigh
From: syzbot <syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    bb678f01804c Merge branch 'intel-wired-lan-driver-updates-..
git tree:       net-next
console output: https://syzkaller.appspot.com/x/log.txt?x=15ddd8ee980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ce6b8d38d53fa4e
dashboard link: https://syzkaller.appspot.com/bug?extid=e04e2c007ba2c80476cb
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a34378d9338a/disk-bb678f01.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9ac7eb354351/vmlinux-bb678f01.xz
kernel image: https://storage.googleapis.com/syzbot-assets/49fdcb908144/bzImage-bb678f01.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in rose_get_neigh+0x1b6/0x6f0 net/rose/rose_route.c:692
Read of size 1 at addr ffff88802a32b030 by task syz-executor.2/6399

CPU: 0 PID: 6399 Comm: syz-executor.2 Not tainted 6.10.0-rc2-syzkaller-00722-gbb678f01804c #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:488
 kasan_report+0x143/0x180 mm/kasan/report.c:601
 rose_get_neigh+0x1b6/0x6f0 net/rose/rose_route.c:692
 rose_connect+0x45a/0x1170 net/rose/af_rose.c:808
 __sys_connect_file net/socket.c:2049 [inline]
 __sys_connect+0x2df/0x310 net/socket.c:2066
 __do_sys_connect net/socket.c:2076 [inline]
 __se_sys_connect net/socket.c:2073 [inline]
 __x64_sys_connect+0x7a/0x90 net/socket.c:2073
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7feee447cf69
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 20 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007feee51920c8 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: ffffffffffffffda RBX: 00007feee45b3f80 RCX: 00007feee447cf69
RDX: 000000000000001c RSI: 00000000200002c0 RDI: 0000000000000007
RBP: 00007feee44da6fe R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000000b R14: 00007feee45b3f80 R15: 00007ffd3499d388
 </TASK>

Allocated by task 29561:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:370 [inline]
 __kasan_kmalloc+0x98/0xb0 mm/kasan/common.c:387
 kasan_kmalloc include/linux/kasan.h:211 [inline]
 kmalloc_trace_noprof+0x19c/0x2c0 mm/slub.c:4152
 kmalloc_noprof include/linux/slab.h:660 [inline]
 batadv_forw_packet_alloc+0x19c/0x3b0 net/batman-adv/send.c:519
 batadv_iv_ogm_aggregate_new net/batman-adv/bat_iv_ogm.c:562 [inline]
 batadv_iv_ogm_queue_add+0x6da/0xbf0 net/batman-adv/bat_iv_ogm.c:670
 batadv_iv_ogm_schedule_buff net/batman-adv/bat_iv_ogm.c:849 [inline]
 batadv_iv_ogm_schedule+0xc4d/0x1090 net/batman-adv/bat_iv_ogm.c:868
 batadv_iv_send_outstanding_bat_ogm_packet+0x6fe/0x810 net/batman-adv/bat_iv_ogm.c:1712
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
 worker_thread+0x86d/0xd70 kernel/workqueue.c:3393
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Freed by task 29551:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:579
 poison_slab_object+0xe0/0x150 mm/kasan/common.c:240
 __kasan_slab_free+0x37/0x60 mm/kasan/common.c:256
 kasan_slab_free include/linux/kasan.h:184 [inline]
 slab_free_hook mm/slub.c:2195 [inline]
 slab_free mm/slub.c:4436 [inline]
 kfree+0x149/0x360 mm/slub.c:4557
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
 worker_thread+0x86d/0xd70 kernel/workqueue.c:3393
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Last potentially related work creation:
 kasan_save_stack+0x3f/0x60 mm/kasan/common.c:47
 __kasan_record_aux_stack+0xac/0xc0 mm/kasan/generic.c:541
 insert_work+0x3e/0x330 kernel/workqueue.c:2207
 __queue_work+0xc16/0xee0 kernel/workqueue.c:2359
 call_timer_fn+0x18e/0x650 kernel/time/timer.c:1792
 expire_timers kernel/time/timer.c:1838 [inline]
 __run_timers kernel/time/timer.c:2417 [inline]
 __run_timer_base+0x695/0x8e0 kernel/time/timer.c:2428
 run_timer_base kernel/time/timer.c:2437 [inline]
 run_timer_softirq+0xb7/0x170 kernel/time/timer.c:2447
 handle_softirqs+0x2c4/0x970 kernel/softirq.c:554
 __do_softirq kernel/softirq.c:588 [inline]
 invoke_softirq kernel/softirq.c:428 [inline]
 __irq_exit_rcu+0xf4/0x1c0 kernel/softirq.c:637
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:649
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1043 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1043
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702

The buggy address belongs to the object at ffff88802a32b000
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 48 bytes inside of
 freed 512-byte region [ffff88802a32b000, ffff88802a32b200)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2a328
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: 0xffffefff(slab)
raw: 00fff00000000040 ffff888015041c80 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000100010 00000001ffffefff 0000000000000000
head: 00fff00000000040 ffff888015041c80 dead000000000100 dead000000000122
head: 0000000000000000 0000000000100010 00000001ffffefff 0000000000000000
head: 00fff00000000002 ffffea0000a8ca01 ffffffffffffffff 0000000000000000
head: 0000000000000004 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5114, tgid 5114 (syz-executor.2), ts 77337016652, free_ts 77201339167
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f3/0x230 mm/page_alloc.c:1468
 prep_new_page mm/page_alloc.c:1476 [inline]
 get_page_from_freelist+0x2e2d/0x2ee0 mm/page_alloc.c:3402
 __alloc_pages_noprof+0x256/0x6c0 mm/page_alloc.c:4660
 __alloc_pages_node_noprof include/linux/gfp.h:269 [inline]
 alloc_pages_node_noprof include/linux/gfp.h:296 [inline]
 alloc_slab_page+0x5f/0x120 mm/slub.c:2264
 allocate_slab+0x5a/0x2e0 mm/slub.c:2427
 new_slab mm/slub.c:2480 [inline]
 ___slab_alloc+0xcd1/0x14b0 mm/slub.c:3666
 __slab_alloc+0x58/0xa0 mm/slub.c:3756
 __slab_alloc_node mm/slub.c:3809 [inline]
 slab_alloc_node mm/slub.c:3988 [inline]
 kmalloc_trace_noprof+0x1d5/0x2c0 mm/slub.c:4147
 kmalloc_noprof include/linux/slab.h:660 [inline]
 kzalloc_noprof include/linux/slab.h:778 [inline]
 device_private_init drivers/base/core.c:3566 [inline]
 device_add+0xc1/0xbf0 drivers/base/core.c:3617
 netdev_register_kobject+0x17e/0x320 net/core/net-sysfs.c:2136
 register_netdevice+0x11d5/0x19e0 net/core/dev.c:10375
 veth_newlink+0x84f/0xcd0 drivers/net/veth.c:1860
 rtnl_newlink_create net/core/rtnetlink.c:3510 [inline]
 __rtnl_newlink net/core/rtnetlink.c:3730 [inline]
 rtnl_newlink+0x158f/0x20a0 net/core/rtnetlink.c:3743
 rtnetlink_rcv_msg+0x89b/0x1180 net/core/rtnetlink.c:6641
 netlink_rcv_skb+0x1e3/0x430 net/netlink/af_netlink.c:2550
 netlink_unicast_kernel net/netlink/af_netlink.c:1331 [inline]
 netlink_unicast+0x7ea/0x980 net/netlink/af_netlink.c:1357
page last free pid 5125 tgid 5125 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1088 [inline]
 free_unref_page+0xd22/0xea0 mm/page_alloc.c:2565
 discard_slab mm/slub.c:2526 [inline]
 __put_partials+0xeb/0x130 mm/slub.c:2994
 put_cpu_partial+0x17c/0x250 mm/slub.c:3069
 __slab_free+0x2ea/0x3d0 mm/slub.c:4306
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x9e/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x14f/0x170 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x23/0x80 mm/kasan/common.c:322
 kasan_slab_alloc include/linux/kasan.h:201 [inline]
 slab_post_alloc_hook mm/slub.c:3940 [inline]
 slab_alloc_node mm/slub.c:4000 [inline]
 kmalloc_trace_noprof+0x132/0x2c0 mm/slub.c:4147
 kmalloc_noprof include/linux/slab.h:660 [inline]
 netdevice_queue_work drivers/infiniband/core/roce_gid_mgmt.c:642 [inline]
 netdevice_event+0x37d/0x950 drivers/infiniband/core/roce_gid_mgmt.c:801
 notifier_call_chain+0x19f/0x3e0 kernel/notifier.c:93
 __netdev_upper_dev_link+0x4c3/0x670 net/core/dev.c:7888
 netdev_master_upper_dev_link+0xb1/0x100 net/core/dev.c:7958
 batadv_hardif_enable_interface+0x26e/0x9f0 net/batman-adv/hard-interface.c:734
 batadv_softif_slave_add+0x79/0xf0 net/batman-adv/soft-interface.c:844
 do_set_master net/core/rtnetlink.c:2701 [inline]
 do_setlink+0xe70/0x41f0 net/core/rtnetlink.c:2907
 __rtnl_newlink net/core/rtnetlink.c:3696 [inline]
 rtnl_newlink+0x180b/0x20a0 net/core/rtnetlink.c:3743



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

