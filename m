Return-Path: <linux-hams+bounces-746-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91471D28678
	for <lists+linux-hams@lfdr.de>; Thu, 15 Jan 2026 21:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A516E305501B
	for <lists+linux-hams@lfdr.de>; Thu, 15 Jan 2026 20:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465E932692F;
	Thu, 15 Jan 2026 20:26:27 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31867322B74
	for <linux-hams@vger.kernel.org>; Thu, 15 Jan 2026 20:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768508787; cv=none; b=oODXa2xnEwwvsDr9iA5MChE14k1ynbxtCiQmP8pDss2EDA8SjbtsM+bcCfyIv/B5ZMC2idPh2x5jG14oqJUJqoIMrvl+09TFII9RPK8CQd1z3Kjvbu5DMBj9GQ9X14GOG2prZ8toTQCtKSAWpcCxUOlbkwotpSP50Pf4OXdRHbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768508787; c=relaxed/simple;
	bh=ywQudgv2k/kG6qtK69tZWh51qrkKPVOngg5Hm8xPVGw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=YU7a50k2co8OiaSXz7WKZkmEXeCzcOTX0SAdTNa4lWywACeaY5Fe7MW5ywpRfsXaBsBfWk7bPnfzf7ovYRs0adRGGnW+uPbnZxOYVvFaZRHkFVbTi59oI/f3cVtsUx2qmNhEnq3CHXQzjsTeBQw40LEZfsJopdqe4zIOBMP8LTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-66102e59148so4648537eaf.2
        for <linux-hams@vger.kernel.org>; Thu, 15 Jan 2026 12:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768508784; x=1769113584;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/3TEZzYo5AAkEWO9Z+3kAT6NR3thdbWtxkYN1srBYSU=;
        b=YKdH90MrKTAi+f1N8a3PtwNMci/Fl1+zFyLephltPnGkGUbkt/r/+3WdzVZp+YdI8K
         FxxeC/owd7evpKTeQfY3IEGPmjqw8oLSpYJVgiJjN/rCqriRDABWAsV2S5FFczZrl6RT
         iCkTZ5PIJw6PcxkTB6mLL3njmu5ygeTanZNk6h/E4AGzE+IYwti1m1xTtTwW83c1K4K7
         eZVPEZ0mPGcqZIyszKyIhB0DQV2Lsitl0GyF8+fU+7MgmVmWOb4Lh8EIEbtNI2MB99uY
         E2kztDhBzOB29fAfbMV2+dWfeqGhlXXdJHsAmS+ccaDOdBl2glJEWAiSqZ9PeM8erF0J
         th2w==
X-Forwarded-Encrypted: i=1; AJvYcCUF96bCUw96wyb93DHJlEGkru9+lEPWTgakk8jtNr/kSw0c3Kp6oNLi7zNPwX03gCHY5ZHKntv9w2u6@vger.kernel.org
X-Gm-Message-State: AOJu0YxDh942GOb8cG3NPx/ujXpdXp9iHbUd4hYZlxFY7jo0o7LQDUhU
	2Iv0h6Q0khHzx/uNzS/pP+fh7sULlFL1fmw02j9eEujDLPrZrmqDzIxyAicahgmDu50aokeNPgy
	KQm5zhuyrMVM+k7jldhxh4Z8Ct4mBoyC/M0M5Zqr0F/Zyb2CGr+RvcuB4K5s=
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:229d:b0:65b:f0da:31c0 with SMTP id
 006d021491bc7-661179faf4bmr503534eaf.55.1768508784013; Thu, 15 Jan 2026
 12:26:24 -0800 (PST)
Date: Thu, 15 Jan 2026 12:26:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69694d6f.050a0220.58bed.0029.GAE@google.com>
Subject: [syzbot] [hams?] BUG: unable to handle kernel paging request in sk_skb_reason_drop
From: syzbot <syzbot+999115c3bf275797dc27@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8bb886cb8f3a Merge tag 'edac_urgent_for_v6.18_rc5' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=175bf932580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=929790bc044e87d7
dashboard link: https://syzkaller.appspot.com/bug?extid=999115c3bf275797dc27
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16d6a292580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12b5e342580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-8bb886cb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/46fdb9b0b548/vmlinux-8bb886cb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/73268ceecbe7/bzImage-8bb886cb.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+999115c3bf275797dc27@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
BUG: KASAN: slab-use-after-free in atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
BUG: KASAN: slab-use-after-free in __refcount_sub_and_test include/linux/refcount.h:389 [inline]
BUG: KASAN: slab-use-after-free in __refcount_dec_and_test include/linux/refcount.h:432 [inline]
BUG: KASAN: slab-use-after-free in refcount_dec_and_test include/linux/refcount.h:450 [inline]
BUG: KASAN: slab-use-after-free in skb_unref include/linux/skbuff.h:1292 [inline]
BUG: KASAN: slab-use-after-free in __sk_skb_reason_drop net/core/skbuff.c:1175 [inline]
BUG: KASAN: slab-use-after-free in sk_skb_reason_drop+0x37/0x170 net/core/skbuff.c:1203
Write of size 4 at addr ffff8880596605e4 by task syz.0.54/5600

CPU: 0 UID: 0 PID: 5600 Comm: syz.0.54 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x2b0/0x2c0 mm/kasan/generic.c:200
 instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
 atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
 __refcount_sub_and_test include/linux/refcount.h:389 [inline]
 __refcount_dec_and_test include/linux/refcount.h:432 [inline]
 refcount_dec_and_test include/linux/refcount.h:450 [inline]
 skb_unref include/linux/skbuff.h:1292 [inline]
 __sk_skb_reason_drop net/core/skbuff.c:1175 [inline]
 sk_skb_reason_drop+0x37/0x170 net/core/skbuff.c:1203
 kfree_skb_reason include/linux/skbuff.h:1322 [inline]
 kfree_skb include/linux/skbuff.h:1331 [inline]
 nr_transmit_buffer+0x11d/0x1b0 net/netrom/nr_out.c:210
 nr_establish_data_link+0x62/0xb0 net/netrom/nr_out.c:227
 nr_connect+0x6e6/0xde0 net/netrom/af_netrom.c:723
 __sys_connect_file net/socket.c:2102 [inline]
 __sys_connect+0x316/0x440 net/socket.c:2121
 __do_sys_connect net/socket.c:2127 [inline]
 __se_sys_connect net/socket.c:2124 [inline]
 __x64_sys_connect+0x7a/0x90 net/socket.c:2124
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe6a438f6c9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fe6a5268038 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: ffffffffffffffda RBX: 00007fe6a45e6090 RCX: 00007fe6a438f6c9
RDX: 0000000000000048 RSI: 0000200000000300 RDI: 0000000000000004
RBP: 00007fe6a4411f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fe6a45e6128 R14: 00007fe6a45e6090 R15: 00007ffdf569a138
 </TASK>

Allocated by task 5600:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 unpoison_slab_object mm/kasan/common.c:342 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:368
 kasan_slab_alloc include/linux/kasan.h:252 [inline]
 slab_post_alloc_hook mm/slub.c:4970 [inline]
 slab_alloc_node mm/slub.c:5280 [inline]
 kmem_cache_alloc_node_noprof+0x433/0x710 mm/slub.c:5332
 __alloc_skb+0x112/0x2d0 net/core/skbuff.c:660
 alloc_skb include/linux/skbuff.h:1383 [inline]
 nr_write_internal+0xe2/0xc60 net/netrom/nr_subr.c:144
 nr_establish_data_link+0x62/0xb0 net/netrom/nr_out.c:227
 nr_connect+0x6e6/0xde0 net/netrom/af_netrom.c:723
 __sys_connect_file net/socket.c:2102 [inline]
 __sys_connect+0x316/0x440 net/socket.c:2121
 __do_sys_connect net/socket.c:2127 [inline]
 __se_sys_connect net/socket.c:2124 [inline]
 __x64_sys_connect+0x7a/0x90 net/socket.c:2124
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5600:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 __kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:587
 kasan_save_free_info mm/kasan/kasan.h:406 [inline]
 poison_slab_object mm/kasan/common.c:252 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:284
 kasan_slab_free include/linux/kasan.h:234 [inline]
 slab_free_hook mm/slub.c:2539 [inline]
 slab_free mm/slub.c:6630 [inline]
 kmem_cache_free+0x19b/0x690 mm/slub.c:6740
 kfree_skb_reason include/linux/skbuff.h:1322 [inline]
 kfree_skb include/linux/skbuff.h:1331 [inline]
 nr_route_frame+0x467/0x7e0 net/netrom/nr_route.c:820
 nr_transmit_buffer+0xe7/0x1b0 net/netrom/nr_out.c:209
 nr_establish_data_link+0x62/0xb0 net/netrom/nr_out.c:227
 nr_connect+0x6e6/0xde0 net/netrom/af_netrom.c:723
 __sys_connect_file net/socket.c:2102 [inline]
 __sys_connect+0x316/0x440 net/socket.c:2121
 __do_sys_connect net/socket.c:2127 [inline]
 __se_sys_connect net/socket.c:2124 [inline]
 __x64_sys_connect+0x7a/0x90 net/socket.c:2124
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888059660500
 which belongs to the cache skbuff_head_cache of size 240
The buggy address is located 228 bytes inside of
 freed 240-byte region [ffff888059660500, ffff8880596605f0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x59660
ksm flags: 0x4fff00000000000(node=1|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 04fff00000000000 ffff8880304cfc80 ffffea00015cfa80 dead000000000003
raw: 0000000000000000 00000000800c000c 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 3035, tgid 3035 (kworker/u4:12), ts 243435803171, free_ts 243218050311
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1850
 prep_new_page mm/page_alloc.c:1858 [inline]
 get_page_from_freelist+0x2365/0x2440 mm/page_alloc.c:3884
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5183
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2416
 alloc_slab_page mm/slub.c:3055 [inline]
 allocate_slab+0x96/0x350 mm/slub.c:3228
 new_slab mm/slub.c:3282 [inline]
 ___slab_alloc+0xe94/0x18a0 mm/slub.c:4651
 __slab_alloc+0x65/0x100 mm/slub.c:4770
 __slab_alloc_node mm/slub.c:4846 [inline]
 slab_alloc_node mm/slub.c:5268 [inline]
 kmem_cache_alloc_node_noprof+0x4c5/0x710 mm/slub.c:5332
 __alloc_skb+0x112/0x2d0 net/core/skbuff.c:660
 alloc_skb include/linux/skbuff.h:1383 [inline]
 nsim_dev_trap_skb_build drivers/net/netdevsim/dev.c:763 [inline]
 nsim_dev_trap_report drivers/net/netdevsim/dev.c:820 [inline]
 nsim_dev_trap_report_work+0x29a/0xb80 drivers/net/netdevsim/dev.c:866
 process_one_work kernel/workqueue.c:3263 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page last free pid 5492 tgid 5492 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1394 [inline]
 __free_frozen_pages+0xbc4/0xd30 mm/page_alloc.c:2906
 __slab_free+0x2e7/0x390 mm/slub.c:5962
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:352
 kasan_slab_alloc include/linux/kasan.h:252 [inline]
 slab_post_alloc_hook mm/slub.c:4970 [inline]
 slab_alloc_node mm/slub.c:5280 [inline]
 kmem_cache_alloc_noprof+0x367/0x6e0 mm/slub.c:5287
 ptlock_alloc+0x20/0x70 mm/memory.c:7284
 ptlock_init include/linux/mm.h:3052 [inline]
 pagetable_pte_ctor include/linux/mm.h:3106 [inline]
 __pte_alloc_one_noprof include/asm-generic/pgalloc.h:78 [inline]
 pte_alloc_one+0x7a/0x310 arch/x86/mm/pgtable.c:18
 do_fault_around mm/memory.c:5650 [inline]
 do_read_fault mm/memory.c:5689 [inline]
 do_fault mm/memory.c:5832 [inline]
 do_pte_missing mm/memory.c:4361 [inline]
 handle_pte_fault mm/memory.c:6177 [inline]
 __handle_mm_fault+0x2767/0x5400 mm/memory.c:6318
 handle_mm_fault+0x40a/0x8e0 mm/memory.c:6487
 do_user_addr_fault+0xa7c/0x1380 arch/x86/mm/fault.c:1336
 handle_page_fault arch/x86/mm/fault.c:1476 [inline]
 exc_page_fault+0x82/0x100 arch/x86/mm/fault.c:1532
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:618

Memory state around the buggy address:
 ffff888059660480: 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc
 ffff888059660500: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888059660580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fc fc
                                                       ^
 ffff888059660600: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb
 ffff888059660680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

