Return-Path: <linux-hams+bounces-727-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAF1CAFA70
	for <lists+linux-hams@lfdr.de>; Tue, 09 Dec 2025 11:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E1F6F3012451
	for <lists+linux-hams@lfdr.de>; Tue,  9 Dec 2025 10:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83592E7198;
	Tue,  9 Dec 2025 10:34:32 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-oo1-f77.google.com (mail-oo1-f77.google.com [209.85.161.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D442EAB71
	for <linux-hams@vger.kernel.org>; Tue,  9 Dec 2025 10:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765276472; cv=none; b=nr4xoZGmSAi6PC03ZT2xL4FznVpwdYNG/PWEa9sg7c3WmwEItv6bYZafdnxNOOAyEnIHMmR8bp5k4QUTJZk0OWm/A2zBMxPjds/Y1r+Nwfz2IutIKoM5CsscVVQ6SJuRd1kTNAQB3/71DjH0vaH/fbc/pNZn5m2FsE59OeqcPdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765276472; c=relaxed/simple;
	bh=3qhtZnqy4Gxd0NIFFjlCScRVTWZWyDIePtpvIZeUA2k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=azkMce/1QEpRAGmvkmhz3dJbQZ23zMRp+jB/uxYSabSQLkP8jr3XCkbklEeZXHpZH1NioQsAKd1yL9CzAcY6CDuN8q1SytJFghy4PHuqivtpz8JqIqKPl5J1rqiQeddJeoIigK9hcoE93csjS81a2eDITkshbKr+41+yq2oU2y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f77.google.com with SMTP id 006d021491bc7-656b2edce07so7288676eaf.0
        for <linux-hams@vger.kernel.org>; Tue, 09 Dec 2025 02:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765276469; x=1765881269;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNgTi24xpMoa5z03ZGynRE0iwMoLvpOk2BTEr2eNGl4=;
        b=Y10HjdN753n3CR5tjDWBKtUI7Jz3mk3V4WmzVw0eg2NaXnqN0KcWXd8xg8/5dIULh/
         /0ViXCOCZNoUdrBcXDmjTUM/Fe+TqFkjxpX8QVXFo966RhAYJA+5eYGkt/6t7OIfNKxP
         LuXMCj5vryEQRpvphSXYm0pdxFwCOok6XlZQAGgD0b2z34GWM1d+kM8GtwB62errbZSR
         K4EyzOUn7kLXg4Xw9a2PmbNZvDF7/d0LLZ+ToLJqAhyzTFY6JoESfeDSjpUfQ1YRbZAR
         nhxn9/CkjdDRrvPTvlUi5ShhGzNPzZ2yk/YBtlKq4JTZ2rPFATBY+3yuUsmvLIl4m8bV
         WE2w==
X-Forwarded-Encrypted: i=1; AJvYcCXjENgK8Hj0tZFk8USTZZ+RpSHF6t3i1RgUnuk50IJ7Hs4RD3P5oTmaYIP0nJ+KHHGWpTLHBDHfQDdz@vger.kernel.org
X-Gm-Message-State: AOJu0YwZGwS7V2zz5RaCdXTuNA49QXyctZEO9IwdwM1nn+ICUyA4BKpi
	gmslwSBoOabknIQSXZIy/IK+3iUYi+owINYDK+QUaDJoeFGvSXw3jE2+HSEa1FL/IfMJYM+TkwH
	ItQZUziQR0RxHSvcj5Xk6IU5K8BP/kKWGQoS+hd45xiBq+tWw1j19QzhWukE=
X-Google-Smtp-Source: AGHT+IG3yC4lES7qUQ2RMGC40puVqLsvtw9jbs6/6XLyVhOSeM7NkZP2pq4fU6y1VmuzPbnJgHZF868TsQdcT52VCgJymX6vvWDk
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81c6:b0:659:9a49:8f38 with SMTP id
 006d021491bc7-6599a983879mr4826373eaf.73.1765276469403; Tue, 09 Dec 2025
 02:34:29 -0800 (PST)
Date: Tue, 09 Dec 2025 02:34:29 -0800
In-Reply-To: <68fa1bec.a70a0220.3bf6c6.004f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6937fb35.a70a0220.38f243.00ce.GAE@google.com>
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in ax25_find_cb
From: syzbot <syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	jreuter@yaina.de, kuba@kernel.org, kuniyu@google.com, 
	linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lizhi.xu@windriver.com, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    c75caf76ed86 Add linux-next specific files for 20251209
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=14e91eb4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b9f785244b836412
dashboard link: https://syzkaller.appspot.com/bug?extid=caa052a0958a9146870d
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15b62a1a580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=144caec2580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5262ac64cf0f/disk-c75caf76.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ef5f82dd5e01/vmlinux-c75caf76.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1e93d794f3bf/bzImage-c75caf76.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in ax25_find_cb+0x179/0x3a0 net/ax25/af_ax25.c:236
Read of size 8 at addr ffff888077f9da10 by task syz.2.252/6544

CPU: 1 UID: 0 PID: 6544 Comm: syz.2.252 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 ax25_find_cb+0x179/0x3a0 net/ax25/af_ax25.c:236
 rose_link_up net/rose/rose_link.c:129 [inline]
 rose_transmit_link+0x16d/0x740 net/rose/rose_link.c:271
 rose_write_internal+0x11dc/0x1ac0 net/rose/rose_subr.c:198
 rose_connect+0x909/0x10a0 net/rose/af_rose.c:881
 __sys_connect_file net/socket.c:2104 [inline]
 __sys_connect+0x316/0x440 net/socket.c:2123
 __do_sys_connect net/socket.c:2129 [inline]
 __se_sys_connect net/socket.c:2126 [inline]
 __x64_sys_connect+0x7a/0x90 net/socket.c:2126
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f98cf98f749
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f98d08e5038 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: ffffffffffffffda RBX: 00007f98cfbe5fa0 RCX: 00007f98cf98f749
RDX: 0000000000000040 RSI: 0000200000000100 RDI: 0000000000000005
RBP: 00007f98cfa13f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f98cfbe6038 R14: 00007f98cfbe5fa0 R15: 00007fff4c13b338
 </TASK>

Allocated by task 6474:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:262 [inline]
 __kmalloc_cache_noprof+0x3e2/0x700 mm/slub.c:5776
 kmalloc_noprof include/linux/slab.h:957 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 ax25_dev_device_up+0x54/0x600 net/ax25/ax25_dev.c:57
 ax25_device_event+0x124/0x630 net/ax25/af_ax25.c:143
 notifier_call_chain+0x19d/0x3a0 kernel/notifier.c:85
 call_netdevice_notifiers_extack net/core/dev.c:2269 [inline]
 call_netdevice_notifiers net/core/dev.c:2283 [inline]
 __dev_notify_flags+0x18d/0x2e0 net/core/dev.c:-1
 netif_change_flags+0xe8/0x1a0 net/core/dev.c:9803
 dev_change_flags+0x130/0x260 net/core/dev_api.c:68
 dev_ioctl+0x7b4/0x1150 net/core/dev_ioctl.c:842
 sock_do_ioctl+0x22c/0x300 net/socket.c:1283
 sock_ioctl+0x576/0x790 net/socket.c:1390
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 37:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:234 [inline]
 slab_free_hook mm/slub.c:2540 [inline]
 slab_free_freelist_hook mm/slub.c:2569 [inline]
 slab_free_bulk mm/slub.c:6701 [inline]
 kmem_cache_free_bulk+0x3fb/0xdb0 mm/slub.c:7388
 kfree_bulk include/linux/slab.h:830 [inline]
 kvfree_rcu_bulk+0xe5/0x1f0 mm/slab_common.c:1523
 kfree_rcu_work+0xed/0x170 mm/slab_common.c:1601
 process_one_work+0x93a/0x15a0 kernel/workqueue.c:3279
 process_scheduled_works kernel/workqueue.c:3362 [inline]
 worker_thread+0x9b0/0xee0 kernel/workqueue.c:3443
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x599/0xb30 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

Last potentially related work creation:
 kasan_save_stack+0x3e/0x60 mm/kasan/common.c:57
 kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:556
 kvfree_call_rcu+0x11b/0x480 mm/slab_common.c:1994
 ax25_device_event+0x57e/0x630 net/ax25/af_ax25.c:148
 notifier_call_chain+0x19d/0x3a0 kernel/notifier.c:85
 call_netdevice_notifiers_extack net/core/dev.c:2269 [inline]
 call_netdevice_notifiers net/core/dev.c:2283 [inline]
 __dev_notify_flags+0x18d/0x2e0 net/core/dev.c:-1
 netif_change_flags+0xe8/0x1a0 net/core/dev.c:9803
 dev_change_flags+0x130/0x260 net/core/dev_api.c:68
 dev_ioctl+0x7b4/0x1150 net/core/dev_ioctl.c:842
 sock_do_ioctl+0x22c/0x300 net/socket.c:1283
 sock_ioctl+0x576/0x790 net/socket.c:1390
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888077f9da00
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 16 bytes inside of
 freed 256-byte region [ffff888077f9da00, ffff888077f9db00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x77f9c
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88813fe26b40 0000000000000000 dead000000000001
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88813fe26b40 0000000000000000 dead000000000001
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000001 ffffea0001dfe701 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000002
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0x252800(GFP_NOWAIT|__GFP_NORETRY|__GFP_COMP|__GFP_THISNODE), pid 5886, tgid 5886 (syz-executor), ts 158848081003, free_ts 158761437861
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x234/0x290 mm/page_alloc.c:1846
 prep_new_page mm/page_alloc.c:1854 [inline]
 get_page_from_freelist+0x2365/0x2440 mm/page_alloc.c:3915
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5210
 alloc_slab_page mm/slub.c:3077 [inline]
 allocate_slab+0x7a/0x3b0 mm/slub.c:3248
 new_slab mm/slub.c:3302 [inline]
 ___slab_alloc+0xf2b/0x1960 mm/slub.c:4656
 __slab_alloc+0x65/0x100 mm/slub.c:4779
 __slab_alloc_node mm/slub.c:4855 [inline]
 slab_alloc_node mm/slub.c:5251 [inline]
 __do_kmalloc_node mm/slub.c:5656 [inline]
 __kmalloc_node_noprof+0x5d9/0x820 mm/slub.c:5663
 kmalloc_array_node_noprof include/linux/slab.h:1075 [inline]
 alloc_slab_obj_exts+0x3e/0x100 mm/slub.c:2123
 account_slab mm/slub.c:3202 [inline]
 allocate_slab+0x1cc/0x3b0 mm/slub.c:3267
 new_slab mm/slub.c:3302 [inline]
 ___slab_alloc+0xf2b/0x1960 mm/slub.c:4656
 __slab_alloc+0x65/0x100 mm/slub.c:4779
 __slab_alloc_node mm/slub.c:4855 [inline]
 slab_alloc_node mm/slub.c:5251 [inline]
 __do_kmalloc_node mm/slub.c:5656 [inline]
 __kvmalloc_node_noprof+0x6b6/0x920 mm/slub.c:7134
 allocate_hook_entries_size net/netfilter/core.c:58 [inline]
 nf_hook_entries_grow+0x281/0x720 net/netfilter/core.c:137
 __nf_register_net_hook+0x2c9/0x930 net/netfilter/core.c:432
 nf_register_net_hook+0xb2/0x190 net/netfilter/core.c:575
 nf_register_net_hooks+0x44/0x1b0 net/netfilter/core.c:591
page last free pid 5902 tgid 5902 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1395 [inline]
 __free_frozen_pages+0xbc8/0xd30 mm/page_alloc.c:2943
 discard_slab mm/slub.c:3346 [inline]
 __put_partials+0x146/0x170 mm/slub.c:3886
 put_cpu_partial+0x1f2/0x2d0 mm/slub.c:3961
 __slab_free+0x288/0x2a0 mm/slub.c:5952
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:252 [inline]
 slab_post_alloc_hook mm/slub.c:4953 [inline]
 slab_alloc_node mm/slub.c:5263 [inline]
 kmem_cache_alloc_lru_noprof+0x36c/0x6e0 mm/slub.c:5282
 __d_alloc+0x37/0x6f0 fs/dcache.c:1730
 d_alloc+0x4b/0x190 fs/dcache.c:1809
 lookup_one_qstr_excl+0xdc/0x360 fs/namei.c:1743
 __start_dirop fs/namei.c:2866 [inline]
 start_dirop+0x5c/0x90 fs/namei.c:2875
 simple_start_creating+0xc4/0x100 fs/libfs.c:2338
 debugfs_start_creating+0xdb/0x1a0 fs/debugfs/inode.c:394
 __debugfs_create_file+0x6f/0x400 fs/debugfs/inode.c:428
 debugfs_create_file_full+0x3f/0x60 fs/debugfs/inode.c:460

Memory state around the buggy address:
 ffff888077f9d900: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888077f9d980: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888077f9da00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff888077f9da80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888077f9db00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

