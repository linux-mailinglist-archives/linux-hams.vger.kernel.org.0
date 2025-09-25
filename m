Return-Path: <linux-hams+bounces-643-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B51BA0A03
	for <lists+linux-hams@lfdr.de>; Thu, 25 Sep 2025 18:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0112D4E609F
	for <lists+linux-hams@lfdr.de>; Thu, 25 Sep 2025 16:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA8A302CA3;
	Thu, 25 Sep 2025 16:35:27 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D41286D60
	for <linux-hams@vger.kernel.org>; Thu, 25 Sep 2025 16:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758818127; cv=none; b=AVKVYreXyMOaZ5siIi4GCJ+5Ok0EOquHWJyG9SnMcZgU7ubc4PdR9Lao7MK6gelZmTzVzGtjGHbxcvPr5rkJL/1hW55HHvfBltK/HYH4n+rkxSffMtvYE6ub+MyqHpIrMN2s2b9l5AbzOvVNHFvAYpPYc3Y/NeLEMT6WUi9tP8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758818127; c=relaxed/simple;
	bh=hm8Jz6FaWuh/Ug7+j1E71c0i/h5RZ4hWpewomV5LsYs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=KgrkzJsKRlL9IJ5EcehKBa9FtJbZVxdQHPIljPntNK4SwpteCJ3iMPdv4mN9h/LpD6eyTJR2OxV3vBSq9zDrSIlXvBxDbEIZqOEXrbruCK4J1qIAMHqDsJYqCmyaksYkBXTuKXxirSLOKT3kC3lwyAvTugpseWxmOG2Gs1EhiVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-4256ea4e08bso28181005ab.3
        for <linux-hams@vger.kernel.org>; Thu, 25 Sep 2025 09:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818125; x=1759422925;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c6jG7pr3bxwwLSPK7p0MnLiBfePcgwX2SpZvPRuaIF8=;
        b=tKPD00x7HXYWLixzvbXF1JBGaW1MBOojsJQ/Iow++DKIDkY0eNKxJL31LJa7hSCa1Z
         BVAaF/vqqjQuYW2hGwdSuwdP0/Q+LFKFZEvqiLOK3nAaVMKCQoBhAdqgGbRrkUcVhhTv
         smh3u0l0ID3Omfc1aE2ARKmuMh6y40nQj0QPKMZl2DEGb3dVEcoThs0p6cnmEs+EJ2La
         mzgWbjuYHosjAjDOyMot1Tg4r8siD5NgEVEQNfnhv5hzeT14hFQMLMqq4wspnCeiFodP
         eJmr9NcHzCDyBRke3aJIMdpfZP650QGJ/1oFZZK1IAxU3Xr8TSHgOYMZ+ykQ/TC9ASu8
         EsDw==
X-Forwarded-Encrypted: i=1; AJvYcCUSwIUC5RNm8aFC9mpSbXeJ2Ng1WK4yxi9AXNT6bZJufSQhpZpVYsJg4Syqz5WeTdJqFAyUuTVS6LS+@vger.kernel.org
X-Gm-Message-State: AOJu0YxMLGW6VFl3O2Z94QG5IqnUWC1Kuf8bdzzRXEOMSjZxD/IrAedk
	nK3MBD0hJVIk9/k+ewE+bsPrTP/qMEo2dPH3P8zKD9CyreMhIXrLKy19XOp3hFMSp6GgZvlgN7G
	bGrTLDESe0jl11vM4a7s0SWn+XOAtfTneIwbe77CRF8xOZ27xfguKxXIjTBY=
X-Google-Smtp-Source: AGHT+IGkaCEgj1Z499HPtD8FrlU/t7pvMQT/1DrPGEJRKjaDMWbI7zkrn2/Irs27auXakuU0EsjKWseYkDag4lVQpjDj1KMq50N2
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:d0d0:0:b0:423:f9d1:e913 with SMTP id
 e9e14a558f8ab-4259566e72emr48317225ab.31.1758818125203; Thu, 25 Sep 2025
 09:35:25 -0700 (PDT)
Date: Thu, 25 Sep 2025 09:35:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68d56f4d.050a0220.25d7ab.0047.GAE@google.com>
Subject: [syzbot] [hams?] KASAN: slab-use-after-free Read in nr_add_node
From: syzbot <syzbot+2860e75836a08b172755@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    846bd2225ec3 Add linux-next specific files for 20250919
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=130c08e2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=135377594f35b576
dashboard link: https://syzkaller.appspot.com/bug?extid=2860e75836a08b172755
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13f3fe42580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c53d48022f8a/disk-846bd222.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/483534e784c8/vmlinux-846bd222.xz
kernel image: https://storage.googleapis.com/syzbot-assets/721b36eec9b3/bzImage-846bd222.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2860e75836a08b172755@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in nr_add_node+0x251b/0x2580 net/netrom/nr_route.c:248
Read of size 2 at addr ffff888078ae2632 by task syz.0.4719/15936

CPU: 0 UID: 0 PID: 15936 Comm: syz.0.4719 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/18/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 nr_add_node+0x251b/0x2580 net/netrom/nr_route.c:248
 nr_rt_ioctl+0x9f1/0xb00 net/netrom/nr_route.c:651
 sock_do_ioctl+0xdc/0x300 net/socket.c:1241
 sock_ioctl+0x576/0x790 net/socket.c:1362
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f29de38ec29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f29df216038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f29de5d5fa0 RCX: 00007f29de38ec29
RDX: 0000200000000000 RSI: 000000000000890b RDI: 0000000000000004
RBP: 00007f29de411e41 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f29de5d6038 R14: 00007f29de5d5fa0 R15: 00007ffedaf2ceb8
 </TASK>

Allocated by task 15939:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 poison_kmalloc_redzone mm/kasan/common.c:400 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:417
 kasan_kmalloc include/linux/kasan.h:262 [inline]
 __kmalloc_cache_noprof+0x3d5/0x6f0 mm/slub.c:5723
 kmalloc_noprof include/linux/slab.h:957 [inline]
 nr_add_node+0x804/0x2580 net/netrom/nr_route.c:146
 nr_rt_ioctl+0x9f1/0xb00 net/netrom/nr_route.c:651
 sock_do_ioctl+0xdc/0x300 net/socket.c:1241
 sock_ioctl+0x576/0x790 net/socket.c:1362
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 15936:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 __kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:587
 kasan_save_free_info mm/kasan/kasan.h:406 [inline]
 poison_slab_object mm/kasan/common.c:252 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:284
 kasan_slab_free include/linux/kasan.h:234 [inline]
 slab_free_hook mm/slub.c:2507 [inline]
 slab_free mm/slub.c:6557 [inline]
 kfree+0x19a/0x6d0 mm/slub.c:6765
 nr_add_node+0x1cbe/0x2580 net/netrom/nr_route.c:246
 nr_rt_ioctl+0x9f1/0xb00 net/netrom/nr_route.c:651
 sock_do_ioctl+0xdc/0x300 net/socket.c:1241
 sock_ioctl+0x576/0x790 net/socket.c:1362
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888078ae2600
 which belongs to the cache kmalloc-64 of size 64
The buggy address is located 50 bytes inside of
 freed 64-byte region [ffff888078ae2600, ffff888078ae2640)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x78ae2
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801b0418c0 ffffea0000c51900 dead000000000004
raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 5233, tgid 5233 (udevd), ts 92365645188, free_ts 92323224662
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1850
 prep_new_page mm/page_alloc.c:1858 [inline]
 get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3869
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5159
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2416
 alloc_slab_page mm/slub.c:3023 [inline]
 allocate_slab+0x96/0x3a0 mm/slub.c:3196
 new_slab mm/slub.c:3250 [inline]
 ___slab_alloc+0xe94/0x1920 mm/slub.c:4626
 __slab_alloc+0x65/0x100 mm/slub.c:4745
 __slab_alloc_node mm/slub.c:4821 [inline]
 slab_alloc_node mm/slub.c:5232 [inline]
 __do_kmalloc_node mm/slub.c:5601 [inline]
 __kmalloc_noprof+0x471/0x7f0 mm/slub.c:5614
 kmalloc_noprof include/linux/slab.h:961 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 tomoyo_encode2 security/tomoyo/realpath.c:45 [inline]
 tomoyo_encode+0x28b/0x550 security/tomoyo/realpath.c:80
 tomoyo_realpath_from_path+0x58d/0x5d0 security/tomoyo/realpath.c:283
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_perm+0x213/0x4b0 security/tomoyo/file.c:822
 security_inode_getattr+0x12f/0x330 security/security.c:2416
 vfs_getattr fs/stat.c:259 [inline]
 vfs_fstat fs/stat.c:281 [inline]
 __do_sys_newfstat fs/stat.c:555 [inline]
 __se_sys_newfstat fs/stat.c:550 [inline]
 __x64_sys_newfstat+0xfc/0x200 fs/stat.c:550
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5528 tgid 5528 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1394 [inline]
 __free_frozen_pages+0xbc4/0xd30 mm/page_alloc.c:2906
 rcu_do_batch kernel/rcu/tree.c:2605 [inline]
 rcu_core+0xcab/0x1770 kernel/rcu/tree.c:2861
 handle_softirqs+0x286/0x870 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:723
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:739
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1052 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1052
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697

Memory state around the buggy address:
 ffff888078ae2500: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888078ae2580: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>ffff888078ae2600: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                                     ^
 ffff888078ae2680: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888078ae2700: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
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

