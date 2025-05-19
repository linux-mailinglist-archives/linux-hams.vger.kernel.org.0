Return-Path: <linux-hams+bounces-517-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7F6ABC07D
	for <lists+linux-hams@lfdr.de>; Mon, 19 May 2025 16:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E7CA189FEFD
	for <lists+linux-hams@lfdr.de>; Mon, 19 May 2025 14:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6180A283689;
	Mon, 19 May 2025 14:23:32 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CE127A454
	for <linux-hams@vger.kernel.org>; Mon, 19 May 2025 14:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747664612; cv=none; b=UzR5q+O4LSznTHIw7sHAKtGuy8XNPFsnWAA6qoI/7EIfhtfkvxZ8LnfN9k5abs2L9x0EzihrF3uQl7fmmzRKNCW3PBIXkKze66jKz3w3/egz7bzUsNG7UqLq0CUfZWqR9C+3fcECRcyoETgHwCfZsfnWz5cfxjX229gnv2/GGdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747664612; c=relaxed/simple;
	bh=8/afwr+2SfXYD9uTvrTr5lfY5Z2ppcvwYzTOugJ5sfE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=NbLYZbP2Mxgno7Gkl+j7onNH+NGs/LBDOmfHU013ILa2GQHKHEi7+04T68/v/8kwRcAPWPLbnFv9gb1JVIV7jfnEkfMN02qOrGJf2prk1cl4JWEQ4cVdGGSb1dzkv5hNPBtsL2ajgmBnmxvRdBUZWjevMe3rChuYg8k2qu0uRwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-862dda418a6so760100739f.0
        for <linux-hams@vger.kernel.org>; Mon, 19 May 2025 07:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747664609; x=1748269409;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q78evjgpUQUDyDANaa7asE1bT87knULXFyNm+MdDVpk=;
        b=Tz7Bq6TGis78H2xDkehAc3s5hb4ZoudzZ85S/XeVTfjo4PTMbWMvOUQVRsaaM5q9go
         9D7/zhJy7/GkvEzJiePNBQk8brlwSRQV3i+GM2D2SzzvSwwEsBq0cSiIpJRbruPT+16k
         gUhpsZqCRWXGRUF0j/YfNl856rhAqPPnEdk5oWoVxilqfcRD0Ggsrjsh/6E8dyNDuIPi
         ZOniwNcAXCpYl2a1Pjd8tPD/WGoYdGGIg+92zt0iZmETp6hpbOcRlBh3TkOtjEkVbS89
         rBqbO0ppOl0p1ufIXMkZeYQD72YuJ8AOsKKUVohx3tfzMLZ8Vdl6Zy5bpEA7qh2Ljxo+
         SZdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3hmfP2cSvQ3+qV5F5BmkXGz93bDtURUDJ+1n75mkyTpMn3yo0X9lmCcf6aGi+XSqaEy6Ia6Ocy3FJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwA7FCVOvZZs+gtQqhkMtlZ1fYJg92QpG4BoN8zB3xa24HaF22G
	xBgBr96w0zsjL1oxXZ9EmTFCyjWkdkAsYr9OjTHeeNB4FkyHsyYg5bftQLPZkJrAEKpsDOx6Kd2
	Cs5ZSAtGcg1c8+XNgmqit+Y5OE1n7KDU//XmaAgqlfbk1+d2+HjKmxRL3GKo=
X-Google-Smtp-Source: AGHT+IFGFd+DWMHIm0hA/LNFe+UWmOQT+R07riDugRAQxz17mmrnksYOgxh7fQ/9KbiXBLiXAtU0/R1oC725E/a4zSHUynF+zNQ7
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:7507:b0:85b:3885:1592 with SMTP id
 ca18e2360f4ac-86a24c91080mr1309724039f.10.1747664609383; Mon, 19 May 2025
 07:23:29 -0700 (PDT)
Date: Mon, 19 May 2025 07:23:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682b3ee1.a00a0220.7a43a.0074.GAE@google.com>
Subject: [syzbot] [hams?] KASAN: slab-use-after-free Read in rose_timer_expiry (3)
From: syzbot <syzbot+942297eecf7d2d61d1f1@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c46286fdd6aa mr: consolidate the ipmr_can_free_table() che..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=16625f68580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c3f0e807ec5d1268
dashboard link: https://syzkaller.appspot.com/bug?extid=942297eecf7d2d61d1f1
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b89482f652db/disk-c46286fd.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/af392e8727a0/vmlinux-c46286fd.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7f31c338482f/bzImage-c46286fd.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+942297eecf7d2d61d1f1@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in rose_timer_expiry+0x471/0x4b0 net/rose/rose_timer.c:183
Read of size 2 at addr ffff888030b0ac2a by task syz-executor/10726

CPU: 1 UID: 0 PID: 10726 Comm: syz-executor Not tainted 6.15.0-rc6-syzkaller-00167-gc46286fdd6aa #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <IRQ>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xb4/0x290 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 rose_timer_expiry+0x471/0x4b0 net/rose/rose_timer.c:183
 call_timer_fn+0x17e/0x5f0 kernel/time/timer.c:1789
 expire_timers kernel/time/timer.c:1840 [inline]
 __run_timers kernel/time/timer.c:2414 [inline]
 __run_timer_base+0x61a/0x860 kernel/time/timer.c:2426
 run_timer_base kernel/time/timer.c:2435 [inline]
 run_timer_softirq+0xb7/0x180 kernel/time/timer.c:2445
 handle_softirqs+0x283/0x870 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1049
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:lock_acquire+0x175/0x360 kernel/locking/lockdep.c:5870
Code: 00 00 00 00 9c 8f 44 24 30 f7 44 24 30 00 02 00 00 0f 85 cd 00 00 00 f7 44 24 08 00 02 00 00 74 01 fb 65 48 8b 05 6b 4f d7 10 <48> 3b 44 24 58 0f 85 f2 00 00 00 48 83 c4 60 5b 41 5c 41 5d 41 5e
RSP: 0018:ffffc90003727710 EFLAGS: 00000206
RAX: 494544bb3a228f00 RBX: 0000000000000000 RCX: 494544bb3a228f00
RDX: 0000000000000001 RSI: ffffffff8d937446 RDI: ffffffff8bc1d9a0
RBP: ffffffff81ceba36 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: ffffffff81ceba36 R12: 0000000000000002
R13: ffffffff8df3dce0 R14: 0000000000000000 R15: 0000000000000246
 rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 rcu_read_lock include/linux/rcupdate.h:841 [inline]
 is_bpf_text_address+0x47/0x2b0 kernel/bpf/core.c:772
 kernel_text_address+0xa5/0xe0 kernel/extable.c:125
 __kernel_text_address+0xd/0x40 kernel/extable.c:79
 unwind_get_return_address+0x4d/0x90 arch/x86/kernel/unwind_orc.c:369
 arch_stack_walk+0xfc/0x150 arch/x86/kernel/stacktrace.c:26
 stack_trace_save+0x9c/0xe0 kernel/stacktrace.c:122
 save_stack+0xf7/0x1f0 mm/page_owner.c:156
 __reset_page_owner+0x71/0x1f0 mm/page_owner.c:308
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1262 [inline]
 __free_frozen_pages+0xb0e/0xcd0 mm/page_alloc.c:2725
 vfree+0x1a6/0x330 mm/vmalloc.c:3384
 kcov_put kernel/kcov.c:439 [inline]
 kcov_close+0x28/0x50 kernel/kcov.c:535
 __fput+0x44c/0xa70 fs/file_table.c:465
 task_work_run+0x1d4/0x260 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x8d6/0x2550 kernel/exit.c:953
 do_group_exit+0x21c/0x2d0 kernel/exit.c:1102
 __do_sys_exit_group kernel/exit.c:1113 [inline]
 __se_sys_exit_group kernel/exit.c:1111 [inline]
 __x64_sys_exit_group+0x3f/0x40 kernel/exit.c:1111
 x64_sys_call+0x21ba/0x21c0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb09178e969
Code: Unable to access opcode bytes at 0x7fb09178e93f.
RSP: 002b:00007fff797e7e18 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000043 RCX: 00007fb09178e969
RDX: 00007fb09178d3e0 RSI: 0000000000000004 RDI: 0000000000000043
RBP: 00007fb0919b6738 R08: 00007fff797e5bb6 R09: 0000000000000008
R10: 000000000000001a R11: 0000000000000246 R12: 0000000000000008
R13: 0000000000000003 R14: 0000000000000009 R15: 0000000000000000
 </TASK>

Allocated by task 10364:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x230/0x3d0 mm/slub.c:4358
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 mca_alloc net/ipv6/mcast.c:884 [inline]
 __ipv6_dev_mc_inc+0x420/0xaf0 net/ipv6/mcast.c:975
 addrconf_join_solict net/ipv6/addrconf.c:2242 [inline]
 addrconf_dad_begin net/ipv6/addrconf.c:4103 [inline]
 addrconf_dad_work+0x3d0/0x14b0 net/ipv6/addrconf.c:4231
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xade/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 59:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2380 [inline]
 slab_free_freelist_hook mm/slub.c:2409 [inline]
 slab_free_bulk mm/slub.c:4666 [inline]
 kmem_cache_free_bulk+0x2d1/0x520 mm/slub.c:5243
 kfree_bulk include/linux/slab.h:794 [inline]
 kvfree_rcu_bulk+0xe5/0x1e0 mm/slab_common.c:1516
 kfree_rcu_work+0xed/0x170 mm/slab_common.c:1594
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xade/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Last potentially related work creation:
 kasan_save_stack+0x3e/0x60 mm/kasan/common.c:47
 kasan_record_aux_stack+0xbc/0xd0 mm/kasan/generic.c:548
 kvfree_call_rcu+0xbb/0x410 mm/slab_common.c:1962
 __ipv6_dev_mc_dec+0x31f/0x390 net/ipv6/mcast.c:1024
 addrconf_leave_solict net/ipv6/addrconf.c:2254 [inline]
 __ipv6_ifa_notify+0x43d/0xac0 net/ipv6/addrconf.c:6302
 addrconf_ifdown+0xe69/0x1880 net/ipv6/addrconf.c:3981
 addrconf_notify+0x1bc/0x1010 net/ipv6/addrconf.c:-1
 notifier_call_chain+0x1b3/0x3e0 kernel/notifier.c:85
 call_netdevice_notifiers_extack net/core/dev.c:2214 [inline]
 call_netdevice_notifiers net/core/dev.c:2228 [inline]
 dev_close_many+0x29c/0x410 net/core/dev.c:1731
 unregister_netdevice_many_notify+0x834/0x2330 net/core/dev.c:11942
 unregister_netdevice_many net/core/dev.c:12036 [inline]
 default_device_exit_batch+0x819/0x890 net/core/dev.c:12530
 ops_exit_list net/core/net_namespace.c:177 [inline]
 cleanup_net+0x7a9/0xbd0 net/core/net_namespace.c:654
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xade/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888030b0ac00
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 42 bytes inside of
 freed 512-byte region [ffff888030b0ac00, ffff888030b0ae00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x30b08
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801a041c80 ffffea0000bf2b00 dead000000000002
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801a041c80 ffffea0000bf2b00 dead000000000002
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000002 ffffea0000c2c201 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 7072, tgid 7068 (syz.0.281), ts 123560825873, free_ts 122958233374
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1d8/0x230 mm/page_alloc.c:1718
 prep_new_page mm/page_alloc.c:1726 [inline]
 get_page_from_freelist+0x21ce/0x22b0 mm/page_alloc.c:3688
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:4970
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2301
 alloc_slab_page mm/slub.c:2450 [inline]
 allocate_slab+0x8a/0x3b0 mm/slub.c:2618
 new_slab mm/slub.c:2672 [inline]
 ___slab_alloc+0xbfc/0x1480 mm/slub.c:3858
 __slab_alloc mm/slub.c:3948 [inline]
 __slab_alloc_node mm/slub.c:4023 [inline]
 slab_alloc_node mm/slub.c:4184 [inline]
 __do_kmalloc_node mm/slub.c:4326 [inline]
 __kmalloc_node_track_caller_noprof+0x2f8/0x4e0 mm/slub.c:4346
 kmemdup_noprof+0x2b/0x70 mm/util.c:137
 _Z14kmemdup_noprofPKvU25pass_dynamic_object_size0mj include/linux/fortify-string.h:765 [inline]
 cache_create_net+0x2f/0x260 net/sunrpc/cache.c:1742
 rsi_cache_create_net net/sunrpc/auth_gss/svcauth_gss.c:2023 [inline]
 gss_svc_init_net+0x104/0x570 net/sunrpc/auth_gss/svcauth_gss.c:2083
 ops_init+0x35c/0x5c0 net/core/net_namespace.c:138
 setup_net+0x238/0x830 net/core/net_namespace.c:364
 copy_net_ns+0x32e/0x590 net/core/net_namespace.c:518
 create_new_namespaces+0x3d3/0x700 kernel/nsproxy.c:110
 unshare_nsproxy_namespaces+0x11c/0x170 kernel/nsproxy.c:228
 ksys_unshare+0x4c8/0x8c0 kernel/fork.c:3375
page last free pid 6994 tgid 6994 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1262 [inline]
 __free_frozen_pages+0xb0e/0xcd0 mm/page_alloc.c:2725
 mm_free_pgd kernel/fork.c:793 [inline]
 __mmdrop+0xb5/0x460 kernel/fork.c:939
 exit_mm+0x1da/0x2c0 kernel/exit.c:589
 do_exit+0x859/0x2550 kernel/exit.c:940
 do_group_exit+0x21c/0x2d0 kernel/exit.c:1102
 __do_sys_exit_group kernel/exit.c:1113 [inline]
 __se_sys_exit_group kernel/exit.c:1111 [inline]
 __x64_sys_exit_group+0x3f/0x40 kernel/exit.c:1111
 x64_sys_call+0x21ba/0x21c0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888030b0ab00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888030b0ab80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888030b0ac00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                  ^
 ffff888030b0ac80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888030b0ad00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================
----------------
Code disassembly (best guess):
   0:	00 00                	add    %al,(%rax)
   2:	00 00                	add    %al,(%rax)
   4:	9c                   	pushf
   5:	8f 44 24 30          	pop    0x30(%rsp)
   9:	f7 44 24 30 00 02 00 	testl  $0x200,0x30(%rsp)
  10:	00
  11:	0f 85 cd 00 00 00    	jne    0xe4
  17:	f7 44 24 08 00 02 00 	testl  $0x200,0x8(%rsp)
  1e:	00
  1f:	74 01                	je     0x22
  21:	fb                   	sti
  22:	65 48 8b 05 6b 4f d7 	mov    %gs:0x10d74f6b(%rip),%rax        # 0x10d74f95
  29:	10
* 2a:	48 3b 44 24 58       	cmp    0x58(%rsp),%rax <-- trapping instruction
  2f:	0f 85 f2 00 00 00    	jne    0x127
  35:	48 83 c4 60          	add    $0x60,%rsp
  39:	5b                   	pop    %rbx
  3a:	41 5c                	pop    %r12
  3c:	41 5d                	pop    %r13
  3e:	41 5e                	pop    %r14


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

