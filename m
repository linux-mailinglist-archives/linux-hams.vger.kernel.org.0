Return-Path: <linux-hams+bounces-546-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54282B106C7
	for <lists+linux-hams@lfdr.de>; Thu, 24 Jul 2025 11:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85755AE32FC
	for <lists+linux-hams@lfdr.de>; Thu, 24 Jul 2025 09:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9073823645D;
	Thu, 24 Jul 2025 09:38:36 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCC7236430
	for <linux-hams@vger.kernel.org>; Thu, 24 Jul 2025 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349916; cv=none; b=VPth1w+gXr0Se3ZlyQLjt2Ws4c6Ca16WQWJJ6SbUaUzgtW/kmPtQqWh6FioA4G07l8y8RXX8+UCRSRZj9UjYcYhClCFpLA3gbfPlE9/F3jagPtIlbtYn3TG7wwh6hWX/y6OHcWq6ZghYOD9xNDDHKkLw2gjypAUEDrlhwuoLWGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349916; c=relaxed/simple;
	bh=qMvzUv7VzIC4PesUlyhEH7SvHUYeeBFU5O6QuawN6Fk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Jv3FBNlPvO/1k54Gc9xZ4Q9LsUuSfy6Dy7WMDspSECO6xyyjsczt5tHIDjjwNYaZBhNlbrff+gmfm6ctB2y7sABItMjw8Qq6dgmzDZJlBuz+e+HHbKWKD5bLGj99Dp0xqfjrcD/X7N3SCYupYniKgNhXGnW/V7EjRrAIf0M/9G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-87c2f667915so99336239f.2
        for <linux-hams@vger.kernel.org>; Thu, 24 Jul 2025 02:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349914; x=1753954714;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v6Kt+rGzGf8D5UIk7sDDRfyh2rZsYpI7OMoiw1q1VEM=;
        b=XK+2V1c6sTMm+SBX3lj2tPqj7UtWFcgBDtieR+rTSzy7TUvRbIFAqR+ZIjmbta3+qF
         vAsxuxVy5EGLkw7PeuWYn7g/od5D4WskaKdKgPIdw9RjnHwe7I4fWX9fO8c00HhWi7iR
         86afzKRWaznq6blLBNV08GCrDY4VUCq+s7ue5su1JfbCesqtkIF7ZfthQn5phfnBj2rX
         kheeZ4b5YcIimSw9b9jYICosN3hzYBd0AQRnbWSYcn5ZeXLES7UaPUqQcJLeI9ZCwmMZ
         txNVsvi4XJuXDBbLxtFkoeTOJp2oOzby5e1nOtgnF00EkhQERlTphazPo+DyxjozHLkf
         hJKw==
X-Forwarded-Encrypted: i=1; AJvYcCU8ngqqeiwZ5pF7FLz5KI33YG/qteDJZU+YoZd3IwZycGZlWx9Yh4rpG4bINGv5DZ9BoD/qXaPmqxtg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7PSdrK+7Rpf0v6qFRnGCBz5hJPdYGVToE1AqEJfmx+86g8Ff9
	c+je3ItOaj0KtgPT4r9af77ilq4JciVw5yKn4ZhObYvZNwa8ipv1YK8DxyJ70/CLrHqwG2n1QOe
	avu0fXytJ49rlVJlVWut7aA7F21Cd+kI/w6QnORYrV04dr4sIAj7Dj2PpD7k=
X-Google-Smtp-Source: AGHT+IHJ0I1QhYYHpkkFkHXVNN74PPLzb+kDe2GSftspGRqI7/kQvDgNHQHiwTvEuQ3IBuKlBZv2IziIYoma3qfcRZqhW1SmPSjF
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:13d1:b0:86d:d6:5687 with SMTP id
 ca18e2360f4ac-87c64fa0e51mr1307145939f.6.1753349913732; Thu, 24 Jul 2025
 02:38:33 -0700 (PDT)
Date: Thu, 24 Jul 2025 02:38:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6881ff19.a00a0220.2f88df.001e.GAE@google.com>
Subject: [syzbot] [hams?] KASAN: slab-use-after-free Read in rose_new_lci
From: syzbot <syzbot+0fc08dad8f34563208d5@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d086c886ceb9 Add linux-next specific files for 20250718
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1517af22580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=69896dd7b8c4e81e
dashboard link: https://syzkaller.appspot.com/bug?extid=0fc08dad8f34563208d5
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1317af22580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/54504fbc2437/disk-d086c886.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b427b00abffe/vmlinux-d086c886.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5a87731b006b/bzImage-d086c886.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0fc08dad8f34563208d5@syzkaller.appspotmail.com

bpq0: left promiscuous mode
==================================================================
BUG: KASAN: slab-use-after-free in rose_new_lci+0x334/0x340 net/rose/af_rose.c:325
Read of size 1 at addr ffff88807776a431 by task syz.1.6214/19371

CPU: 0 UID: 0 PID: 19371 Comm: syz.1.6214 Not tainted 6.16.0-rc6-next-20250718-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 rose_new_lci+0x334/0x340 net/rose/af_rose.c:325
 rose_connect+0x463/0x10a0 net/rose/af_rose.c:823
 __sys_connect_file net/socket.c:2086 [inline]
 __sys_connect+0x313/0x440 net/socket.c:2105
 __do_sys_connect net/socket.c:2111 [inline]
 __se_sys_connect net/socket.c:2108 [inline]
 __x64_sys_connect+0x7a/0x90 net/socket.c:2108
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f861738e9a9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f861824d038 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: ffffffffffffffda RBX: 00007f86175b5fa0 RCX: 00007f861738e9a9
RDX: 0000000000000040 RSI: 0000200000000100 RDI: 0000000000000009
RBP: 00007f8617410d69 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f86175b5fa0 R15: 00007ffd84d12788
 </TASK>

Allocated by task 19371:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x230/0x3d0 mm/slub.c:4396
 kmalloc_noprof include/linux/slab.h:905 [inline]
 rose_add_node+0x23a/0xde0 net/rose/rose_route.c:85
 rose_rt_ioctl+0xa48/0xfb0 net/rose/rose_route.c:740
 rose_ioctl+0x3ce/0x8b0 net/rose/af_rose.c:1380
 sock_do_ioctl+0xdc/0x300 net/socket.c:1238
 sock_ioctl+0x576/0x790 net/socket.c:1359
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 19376:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2417 [inline]
 slab_free mm/slub.c:4680 [inline]
 kfree+0x18e/0x440 mm/slub.c:4879
 rose_rt_device_down+0x473/0x4c0 net/rose/rose_route.c:515
 rose_device_event+0x603/0x6a0 net/rose/af_rose.c:248
 notifier_call_chain+0x1b6/0x3e0 kernel/notifier.c:85
 call_netdevice_notifiers_extack net/core/dev.c:2267 [inline]
 call_netdevice_notifiers net/core/dev.c:2281 [inline]
 __dev_notify_flags+0x18d/0x2e0 net/core/dev.c:-1
 netif_change_flags+0xe8/0x1a0 net/core/dev.c:9589
 dev_change_flags+0x130/0x260 net/core/dev_api.c:68
 dev_ioctl+0x7b4/0x1150 net/core/dev_ioctl.c:823
 sock_do_ioctl+0x22c/0x300 net/socket.c:1252
 sock_ioctl+0x576/0x790 net/socket.c:1359
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88807776a400
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 49 bytes inside of
 freed 512-byte region [ffff88807776a400, ffff88807776a600)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x77768
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801a841c80 ffffea00017ded00 dead000000000002
raw: 0000000000000000 0000000080100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801a841c80 ffffea00017ded00 dead000000000002
head: 0000000000000000 0000000080100010 00000000f5000000 0000000000000000
head: 00fff00000000002 ffffea0001ddda01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0x52820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 49, tgid 49 (kworker/u8:3), ts 110489602895, free_ts 110339344367
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1851
 prep_new_page mm/page_alloc.c:1859 [inline]
 get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3858
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5148
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2416
 alloc_slab_page mm/slub.c:2487 [inline]
 allocate_slab+0x8a/0x370 mm/slub.c:2655
 new_slab mm/slub.c:2709 [inline]
 ___slab_alloc+0xbeb/0x1410 mm/slub.c:3891
 __slab_alloc mm/slub.c:3981 [inline]
 __slab_alloc_node mm/slub.c:4056 [inline]
 slab_alloc_node mm/slub.c:4217 [inline]
 __do_kmalloc_node mm/slub.c:4364 [inline]
 __kmalloc_noprof+0x305/0x4f0 mm/slub.c:4377
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 fib6_info_alloc+0x30/0xf0 net/ipv6/ip6_fib.c:155
 ip6_route_info_create+0x142/0x860 net/ipv6/route.c:3811
 ip6_route_add+0x49/0x1b0 net/ipv6/route.c:3940
 addrconf_prefix_route net/ipv6/addrconf.c:2483 [inline]
 addrconf_add_linklocal+0x45f/0x6c0 net/ipv6/addrconf.c:3308
 addrconf_addr_gen+0x490/0x580 net/ipv6/addrconf.c:3437
 addrconf_init_auto_addrs+0x62d/0xa30 net/ipv6/addrconf.c:-1
 addrconf_notify+0xacc/0x1010 net/ipv6/addrconf.c:3735
 notifier_call_chain+0x1b6/0x3e0 kernel/notifier.c:85
 netif_state_change+0x284/0x3a0 net/core/dev.c:1583
page last free pid 6066 tgid 6066 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1395 [inline]
 __free_frozen_pages+0xbc4/0xd30 mm/page_alloc.c:2895
 __slab_free+0x303/0x3c0 mm/slub.c:4591
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4180 [inline]
 slab_alloc_node mm/slub.c:4229 [inline]
 kmem_cache_alloc_noprof+0x1c1/0x3c0 mm/slub.c:4236
 vm_area_alloc+0x24/0x140 mm/vma_init.c:31
 __mmap_new_vma mm/vma.c:2461 [inline]
 __mmap_region mm/vma.c:2669 [inline]
 mmap_region+0xdc7/0x20c0 mm/vma.c:2739
 do_mmap+0xc45/0x10d0 mm/mmap.c:558
 vm_mmap_pgoff+0x2a6/0x4d0 mm/util.c:579
 elf_map fs/binfmt_elf.c:384 [inline]
 elf_load+0x248/0x6c0 fs/binfmt_elf.c:407
 load_elf_binary+0x1079/0x2740 fs/binfmt_elf.c:1173
 search_binary_handler fs/exec.c:1670 [inline]
 exec_binprm fs/exec.c:1702 [inline]
 bprm_execve+0x99c/0x1450 fs/exec.c:1754
 do_execveat_common+0x510/0x6a0 fs/exec.c:1860
 do_execve fs/exec.c:1934 [inline]
 __do_sys_execve fs/exec.c:2010 [inline]
 __se_sys_execve fs/exec.c:2005 [inline]
 __x64_sys_execve+0x94/0xb0 fs/exec.c:2005
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94

Memory state around the buggy address:
 ffff88807776a300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88807776a380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88807776a400: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                     ^
 ffff88807776a480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807776a500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

