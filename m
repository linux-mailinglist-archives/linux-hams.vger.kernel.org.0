Return-Path: <linux-hams+bounces-644-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDD8BA1118
	for <lists+linux-hams@lfdr.de>; Thu, 25 Sep 2025 20:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A5D61C21D9E
	for <lists+linux-hams@lfdr.de>; Thu, 25 Sep 2025 18:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BA82F2601;
	Thu, 25 Sep 2025 18:49:30 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADC7A944
	for <linux-hams@vger.kernel.org>; Thu, 25 Sep 2025 18:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758826170; cv=none; b=pcAOmlWqMxdBf48uR+cjYCHMHmxVMYoTTGABbckwPwr6wY4gjTgMWMMS8wHvVennWQXMUlKm/EedBXpNhc7V+CT7rRKJPxXo3ykidXzzlAagUYja7767mkP/7t6FsUyQLg5hFvMGRBqDk5u6stocA8luHLrI0pL9BkGocanqBYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758826170; c=relaxed/simple;
	bh=GNBT5bxOPbYG7lfhIrDOKnvIqVevRRFFY+5USWYSQKE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=estOxJTblrKHyIvbjtfdjqw2sY8XjABbxc9U1OSKIzkRYUsb2vLB0Wn52XNjqVp0x+P5ODmZuMRsJlPydYP5Gz/xXduJ70aBX7s6wQlVRvYl9fTLMmVSc550zoOQE8g/RvhznsTD1Y/SnuovTjBQW4tuhIRylBqLNy/6c+teIsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-42595318a28so24603215ab.0
        for <linux-hams@vger.kernel.org>; Thu, 25 Sep 2025 11:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758826168; x=1759430968;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s6B/MGcmvTIVY5UDk7ftWA8f+bRgVB4t+i6Z17NI/uc=;
        b=OANbAWDP6IUuaoAKf258AP7/JqktxAaTkxLH8ViH2/QyLZUyN3RpSukHl02AJAfvzX
         HBuh23dYOddRZAT9HlZtKnkGXlxl2K1yPxWNw3NybTiBqQPx4it44sIkB1MGTIlPs4cA
         8r0b4CR5DS4UrFXOiZrHGQmyNK3K1ReymESLWGRQDUK/HpiQ1tykH70PJkkde1OrPB28
         4iBq9lbCjGM/UyGwRonxh8TOrRsVzKh8ww6ANl5YqMc8x0W678MAjgGlahXCkGz49tJT
         i48Hg1F4Iu22oxJFCcdEdGOllHIoXLTg5aKnU8YWs9lmX7c6hFFHJmuoK83rqsV8WWxU
         TXCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI3H8GCJc/K+twik+LiNEEHITeNLGy+lyt/+jKv+mM6hMGWBXXz/W+rTZ11G1LIAnizkVOYkHftHKL@vger.kernel.org
X-Gm-Message-State: AOJu0YzAOleL/3rsHUKo6bwdgmvwGRTzXJ/sCW/GCqYqoTCSIwDZV3gZ
	iqBWu5p9c/uj9vb2QZoTt8bH/kl1WI736AqkN+AqpPVndWxzBFuVcYXn3vYdUusJ6q+pMQOvMMm
	YAvfvqymsOLW7Igwj71ZVehuoW4AjQQq4shai2Nc1fJTxlIr9fzgYLsq9XK4=
X-Google-Smtp-Source: AGHT+IFYCSH1x2qSqy2wdt+Q79kdzAnEPfb/WCccGxR6GmIECzsSfHiPQOnkcjuG+9JbwaSknSzNnCTDfz+NPQkFiI1mGeHUV+eJ
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:349c:b0:425:86d9:91ea with SMTP id
 e9e14a558f8ab-425c292e916mr50483355ab.11.1758826168076; Thu, 25 Sep 2025
 11:49:28 -0700 (PDT)
Date: Thu, 25 Sep 2025 11:49:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68d58eb8.050a0220.25d7ab.005b.GAE@google.com>
Subject: [syzbot] [hams?] KASAN: slab-use-after-free Write in rose_t0timer_expiry
From: syzbot <syzbot+350060a9356421ae83dc@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e8442d5b7bc6 Merge tag 'sound-6.17-rc7' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1444b0e2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8f01d8629880e620
dashboard link: https://syzkaller.appspot.com/bug?extid=350060a9356421ae83dc
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a710a41115b6/disk-e8442d5b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/cf50d7099eff/vmlinux-e8442d5b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/48cf00216bb5/bzImage-e8442d5b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+350060a9356421ae83dc@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in rose_t0timer_expiry+0x114/0x150 net/rose/rose_link.c:85
Write of size 1 at addr ffff8880569e3435 by task syz.3.1212/10695

CPU: 0 UID: 0 PID: 10695 Comm: syz.3.1212 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/18/2025
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xcd/0x630 mm/kasan/report.c:482
 kasan_report+0xe0/0x110 mm/kasan/report.c:595
 rose_t0timer_expiry+0x114/0x150 net/rose/rose_link.c:85
 call_timer_fn+0x197/0x620 kernel/time/timer.c:1747
 expire_timers kernel/time/timer.c:1798 [inline]
 __run_timers+0x6ef/0x960 kernel/time/timer.c:2372
 __run_timer_base kernel/time/timer.c:2384 [inline]
 __run_timer_base kernel/time/timer.c:2376 [inline]
 run_timer_base+0x114/0x190 kernel/time/timer.c:2393
 run_timer_softirq+0x1a/0x40 kernel/time/timer.c:2403
 handle_softirqs+0x219/0x8e0 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0x109/0x170 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
 sysvec_apic_timer_interrupt+0xa4/0xc0 arch/x86/kernel/apic/apic.c:1050
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:lock_release+0x183/0x2f0 kernel/locking/lockdep.c:5893
Code: 0f c1 05 f8 4d 3f 12 83 f8 01 0f 85 1d 01 00 00 9c 58 f6 c4 02 0f 85 08 01 00 00 41 f7 c5 00 02 00 00 74 01 fb 48 8b 44 24 10 <65> 48 2b 05 0d 0c 3f 12 0f 85 58 01 00 00 48 83 c4 18 5b 41 5c 41
RSP: 0018:ffffc9000458eef0 EFLAGS: 00000206
RAX: 6a3b0bf03f2b6b00 RBX: ffffffff8e5c15a0 RCX: ffffc9000458eefc
RDX: 0000000000000000 RSI: ffffffff8de2d7a0 RDI: ffffffff8c163380
RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000006b1a R12: ffffffff816af8a4
R13: 0000000000000202 R14: ffff888079510000 R15: 0000000000000001
 rcu_lock_release include/linux/rcupdate.h:341 [inline]
 rcu_read_unlock include/linux/rcupdate.h:871 [inline]
 class_rcu_destructor include/linux/rcupdate.h:1155 [inline]
 unwind_next_frame+0x3f9/0x20a0 arch/x86/kernel/unwind_orc.c:479
 __unwind_start+0x45f/0x7f0 arch/x86/kernel/unwind_orc.c:758
 unwind_start arch/x86/include/asm/unwind.h:64 [inline]
 arch_stack_walk+0x73/0x100 arch/x86/kernel/stacktrace.c:24
 stack_trace_save+0x8e/0xc0 kernel/stacktrace.c:122
 save_stack+0x160/0x1f0 mm/page_owner.c:156
 __reset_page_owner+0x84/0x1a0 mm/page_owner.c:308
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1395 [inline]
 free_unref_folios+0xa61/0x16b0 mm/page_alloc.c:2952
 folios_put_refs+0x56f/0x740 mm/swap.c:999
 folio_batch_release include/linux/pagevec.h:101 [inline]
 shmem_undo_range+0x58f/0x1150 mm/shmem.c:1157
 shmem_truncate_range mm/shmem.c:1269 [inline]
 shmem_evict_inode+0x3a1/0xbe0 mm/shmem.c:1397
 evict+0x3e3/0x920 fs/inode.c:810
 iput_final fs/inode.c:1897 [inline]
 iput fs/inode.c:1923 [inline]
 iput+0x521/0x880 fs/inode.c:1909
 dentry_unlink_inode+0x29c/0x480 fs/dcache.c:466
 __dentry_kill+0x1d0/0x600 fs/dcache.c:669
 dput.part.0+0x4b1/0x9b0 fs/dcache.c:911
 dput+0x1f/0x30 fs/dcache.c:901
 __fput+0x51c/0xb70 fs/file_table.c:476
 task_work_run+0x150/0x240 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x86f/0x2bf0 kernel/exit.c:961
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1102
 get_signal+0x2673/0x26d0 kernel/signal.c:3034
 arch_do_signal_or_restart+0x8f/0x7d0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x84/0x110 kernel/entry/common.c:40
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 do_syscall_64+0x41c/0x4e0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6ae558ec29
Code: Unable to access opcode bytes at 0x7f6ae558ebff.
RSP: 002b:00007f6ae6354038 EFLAGS: 00000246 ORIG_RAX: 000000000000012b
RAX: 0000000000010106 RBX: 00007f6ae57d6090 RCX: 00007f6ae558ec29
RDX: 0000000000010106 RSI: 00002000000000c0 RDI: 0000000000000003
RBP: 00007f6ae5611e41 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000002 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f6ae57d6128 R14: 00007f6ae57d6090 R15: 00007ffc44639248
 </TASK>

Allocated by task 7892:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:388 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:405
 kmalloc_noprof include/linux/slab.h:905 [inline]
 rose_add_node net/rose/rose_route.c:85 [inline]
 rose_rt_ioctl+0x880/0x2580 net/rose/rose_route.c:748
 rose_ioctl+0x64d/0x7d0 net/rose/af_rose.c:1381
 sock_do_ioctl+0x118/0x280 net/socket.c:1238
 sock_ioctl+0x227/0x6b0 net/socket.c:1359
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl fs/ioctl.c:584 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4e0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 10720:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:243 [inline]
 __kasan_slab_free+0x60/0x70 mm/kasan/common.c:275
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2422 [inline]
 slab_free mm/slub.c:4695 [inline]
 kfree+0x2b4/0x4d0 mm/slub.c:4894
 rose_neigh_put include/net/rose.h:166 [inline]
 rose_timer_expiry+0x53f/0x630 net/rose/rose_timer.c:183
 call_timer_fn+0x197/0x620 kernel/time/timer.c:1747
 expire_timers kernel/time/timer.c:1798 [inline]
 __run_timers+0x6ef/0x960 kernel/time/timer.c:2372
 __run_timer_base kernel/time/timer.c:2384 [inline]
 __run_timer_base kernel/time/timer.c:2376 [inline]
 run_timer_base+0x114/0x190 kernel/time/timer.c:2393
 run_timer_softirq+0x1a/0x40 kernel/time/timer.c:2403
 handle_softirqs+0x219/0x8e0 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0x109/0x170 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
 sysvec_apic_timer_interrupt+0xa4/0xc0 arch/x86/kernel/apic/apic.c:1050
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702

The buggy address belongs to the object at ffff8880569e3400
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 53 bytes inside of
 freed 512-byte region [ffff8880569e3400, ffff8880569e3600)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x569e0
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b841c80 0000000000000000 dead000000000001
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b841c80 0000000000000000 dead000000000001
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000002 ffffea00015a7801 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5844, tgid 5844 (syz-executor), ts 66287574491, free_ts 15197057508
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1c0/0x230 mm/page_alloc.c:1851
 prep_new_page mm/page_alloc.c:1859 [inline]
 get_page_from_freelist+0x132b/0x38e0 mm/page_alloc.c:3858
 __alloc_frozen_pages_noprof+0x261/0x23f0 mm/page_alloc.c:5148
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2416
 alloc_slab_page mm/slub.c:2492 [inline]
 allocate_slab mm/slub.c:2660 [inline]
 new_slab+0x247/0x330 mm/slub.c:2714
 ___slab_alloc+0xcf2/0x1750 mm/slub.c:3901
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3992
 __slab_alloc_node mm/slub.c:4067 [inline]
 slab_alloc_node mm/slub.c:4228 [inline]
 __kmalloc_cache_noprof+0xfb/0x3e0 mm/slub.c:4402
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 mca_alloc net/ipv6/mcast.c:876 [inline]
 __ipv6_dev_mc_inc+0x2f1/0xbc0 net/ipv6/mcast.c:966
 br_ip6_multicast_join_snoopers net/bridge/br_multicast.c:4183 [inline]
 br_multicast_join_snoopers+0xcb/0x120 net/bridge/br_multicast.c:4194
 br_dev_open+0x112/0x150 net/bridge/br_device.c:174
 __dev_open+0x2e7/0x7c0 net/core/dev.c:1682
 __dev_change_flags+0x55d/0x720 net/core/dev.c:9549
 netif_change_flags+0x8d/0x160 net/core/dev.c:9612
 do_setlink.constprop.0+0xb53/0x4380 net/core/rtnetlink.c:3143
 rtnl_changelink net/core/rtnetlink.c:3761 [inline]
 __rtnl_newlink net/core/rtnetlink.c:3920 [inline]
 rtnl_newlink+0x1446/0x2000 net/core/rtnetlink.c:4057
page last free pid 1 tgid 1 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1395 [inline]
 __free_frozen_pages+0x7d5/0x10f0 mm/page_alloc.c:2895
 __free_pages mm/page_alloc.c:5260 [inline]
 free_contig_range+0x183/0x4b0 mm/page_alloc.c:7091
 destroy_args+0x794/0xc10 mm/debug_vm_pgtable.c:958
 debug_vm_pgtable+0x1a32/0x3640 mm/debug_vm_pgtable.c:1345
 do_one_initcall+0x120/0x6e0 init/main.c:1269
 do_initcall_level init/main.c:1331 [inline]
 do_initcalls init/main.c:1347 [inline]
 do_basic_setup init/main.c:1366 [inline]
 kernel_init_freeable+0x5c2/0x910 init/main.c:1579
 kernel_init+0x1c/0x2b0 init/main.c:1469
 ret_from_fork+0x56a/0x730 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff8880569e3300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880569e3380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880569e3400: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                     ^
 ffff8880569e3480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880569e3500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================
----------------
Code disassembly (best guess):
   0:	0f c1 05 f8 4d 3f 12 	xadd   %eax,0x123f4df8(%rip)        # 0x123f4dff
   7:	83 f8 01             	cmp    $0x1,%eax
   a:	0f 85 1d 01 00 00    	jne    0x12d
  10:	9c                   	pushf
  11:	58                   	pop    %rax
  12:	f6 c4 02             	test   $0x2,%ah
  15:	0f 85 08 01 00 00    	jne    0x123
  1b:	41 f7 c5 00 02 00 00 	test   $0x200,%r13d
  22:	74 01                	je     0x25
  24:	fb                   	sti
  25:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
* 2a:	65 48 2b 05 0d 0c 3f 	sub    %gs:0x123f0c0d(%rip),%rax        # 0x123f0c3f <-- trapping instruction
  31:	12
  32:	0f 85 58 01 00 00    	jne    0x190
  38:	48 83 c4 18          	add    $0x18,%rsp
  3c:	5b                   	pop    %rbx
  3d:	41 5c                	pop    %r12
  3f:	41                   	rex.B


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

