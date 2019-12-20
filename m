Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35DE5127850
	for <lists+linux-hams@lfdr.de>; Fri, 20 Dec 2019 10:37:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbfLTJhK (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 20 Dec 2019 04:37:10 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:46880 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbfLTJhK (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 20 Dec 2019 04:37:10 -0500
Received: by mail-io1-f69.google.com with SMTP id p206so5678650iod.13
        for <linux-hams@vger.kernel.org>; Fri, 20 Dec 2019 01:37:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=+SRiHYUIYqPOXXwQdb6uqMp3IkOEsDJQnj3uiqHrcuA=;
        b=jMBihiLJPHweZAyUvaSevj7PftOJf+Upkqm5hUFgjhVR3A9Tew+tRoyl2SpMaRs1so
         l3Mu6XSIinZmt5bo5g1G9G3vkKU3A49zzjLWwlB175SYTmkP8w9LLkaK0fmujQjv4Ep3
         1ZgGENO9TxQfL1zVFsjXJxPNLGbGHnzqz8EZjbdrbtw9+MAQtPFaVF20JrY7I3akN/ST
         9KLoocJMO1Kw72aMn18XjLC2LsLlttP65JKlVpEIGKpfNuzCJOJ1J+8PAaKJT0o3XylL
         8PREAmxcRDzvTNXct6Stpe0CKTM4nddJdGuhvfGxkSgXlPlJ5MrroQfZgJrLCCemRfpi
         S6XA==
X-Gm-Message-State: APjAAAUbbDwcs+rd7KoBHUaa0venx1qODCMWm9EY1VmrTU8ehUvltOim
        AmR61mK5Xg2ZuiUzGRCSxdyjidDattjXkd31HPAgjXohUJZN
X-Google-Smtp-Source: APXvYqyh4rBUg6jIvlbuqTRpqz+dSoOIG5JntiBqjSV9Er/XOFvDyCNuEuu/S5oP3MA6hGBZzZVnFUSC3nC30nTBZQWKH3rK8Oxv
MIME-Version: 1.0
X-Received: by 2002:a5e:940e:: with SMTP id q14mr8716436ioj.247.1576834629339;
 Fri, 20 Dec 2019 01:37:09 -0800 (PST)
Date:   Fri, 20 Dec 2019 01:37:09 -0800
In-Reply-To: <00000000000083c858059877d77c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f39399059a1f6b2c@google.com>
Subject: Re: KASAN: use-after-free Write in nr_release
From:   syzbot <syzbot+caa188bdfc1eeafeb418@syzkaller.appspotmail.com>
To:     davem@davemloft.net, hdanton@sina.com, linux-hams@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        ralf@linux-mips.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    7e0165b2 Merge branch 'akpm' (patches from Andrew)
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13d65fa6e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1b59a3066828ac4c
dashboard link: https://syzkaller.appspot.com/bug?extid=caa188bdfc1eeafeb418
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12d9dd51e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+caa188bdfc1eeafeb418@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in atomic_fetch_add  
include/asm-generic/atomic-instrumented.h:111 [inline]
BUG: KASAN: use-after-free in refcount_add include/linux/refcount.h:188  
[inline]
BUG: KASAN: use-after-free in refcount_inc include/linux/refcount.h:228  
[inline]
BUG: KASAN: use-after-free in sock_hold include/net/sock.h:648 [inline]
BUG: KASAN: use-after-free in nr_release+0x65/0x4c0  
net/netrom/af_netrom.c:498
Write of size 4 at addr ffff8880781a3080 by task syz-executor.0/12044

CPU: 1 PID: 12044 Comm: syz-executor.0 Not tainted 5.5.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x197/0x210 lib/dump_stack.c:118
  print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
  __kasan_report.cold+0x1b/0x41 mm/kasan/report.c:506
  kasan_report+0x12/0x20 mm/kasan/common.c:639
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x134/0x1a0 mm/kasan/generic.c:192
  __kasan_check_write+0x14/0x20 mm/kasan/common.c:101
  atomic_fetch_add include/asm-generic/atomic-instrumented.h:111 [inline]
  refcount_add include/linux/refcount.h:188 [inline]
  refcount_inc include/linux/refcount.h:228 [inline]
  sock_hold include/net/sock.h:648 [inline]
  nr_release+0x65/0x4c0 net/netrom/af_netrom.c:498
  __sock_release+0xce/0x280 net/socket.c:592
  sock_close+0x1e/0x30 net/socket.c:1270
  __fput+0x2ff/0x890 fs/file_table.c:280
  ____fput+0x16/0x20 fs/file_table.c:313
  task_work_run+0x145/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x316/0x380 arch/x86/entry/common.c:164
  prepare_exit_to_usermode arch/x86/entry/common.c:195 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:278 [inline]
  do_syscall_64+0x676/0x790 arch/x86/entry/common.c:304
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4144b1
Code: 75 14 b8 03 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 04 1b 00 00 c3 48  
83 ec 08 e8 0a fc ff ff 48 89 04 24 b8 03 00 00 00 0f 05 <48> 8b 3c 24 48  
89 c2 e8 53 fc ff ff 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007ffc1b260070 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000006 RCX: 00000000004144b1
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000005
RBP: 0000000000000001 R08: ffffffffffffffff R09: ffffffffffffffff
R10: 00007ffc1b260150 R11: 0000000000000293 R12: 000000000075c9a0
R13: 000000000075c9a0 R14: 0000000000761390 R15: 000000000075c124

Allocated by task 12049:
  save_stack+0x23/0x90 mm/kasan/common.c:72
  set_track mm/kasan/common.c:80 [inline]
  __kasan_kmalloc mm/kasan/common.c:513 [inline]
  __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:486
  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:527
  __do_kmalloc mm/slab.c:3656 [inline]
  __kmalloc+0x163/0x770 mm/slab.c:3665
  kmalloc include/linux/slab.h:561 [inline]
  sk_prot_alloc+0x23a/0x310 net/core/sock.c:1603
  sk_alloc+0x39/0xfd0 net/core/sock.c:1657
  nr_create+0xb9/0x5e0 net/netrom/af_netrom.c:411
  __sock_create+0x3ce/0x730 net/socket.c:1420
  sock_create net/socket.c:1471 [inline]
  __sys_socket+0x103/0x220 net/socket.c:1513
  __do_sys_socket net/socket.c:1522 [inline]
  __se_sys_socket net/socket.c:1520 [inline]
  __x64_sys_socket+0x73/0xb0 net/socket.c:1520
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 12044:
  save_stack+0x23/0x90 mm/kasan/common.c:72
  set_track mm/kasan/common.c:80 [inline]
  kasan_set_free_info mm/kasan/common.c:335 [inline]
  __kasan_slab_free+0x102/0x150 mm/kasan/common.c:474
  kasan_slab_free+0xe/0x10 mm/kasan/common.c:483
  __cache_free mm/slab.c:3426 [inline]
  kfree+0x10a/0x2c0 mm/slab.c:3757
  sk_prot_free net/core/sock.c:1640 [inline]
  __sk_destruct+0x5d8/0x7f0 net/core/sock.c:1724
  sk_destruct+0xd5/0x110 net/core/sock.c:1739
  __sk_free+0xfb/0x360 net/core/sock.c:1750
  sk_free+0x83/0xb0 net/core/sock.c:1761
  sock_put include/net/sock.h:1729 [inline]
  nr_release+0x3f4/0x4c0 net/netrom/af_netrom.c:532
  __sock_release+0xce/0x280 net/socket.c:592
  sock_close+0x1e/0x30 net/socket.c:1270
  __fput+0x2ff/0x890 fs/file_table.c:280
  ____fput+0x16/0x20 fs/file_table.c:313
  task_work_run+0x145/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x316/0x380 arch/x86/entry/common.c:164
  prepare_exit_to_usermode arch/x86/entry/common.c:195 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:278 [inline]
  do_syscall_64+0x676/0x790 arch/x86/entry/common.c:304
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8880781a3000
  which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 128 bytes inside of
  2048-byte region [ffff8880781a3000, ffff8880781a3800)
The buggy address belongs to the page:
page:ffffea0001e068c0 refcount:1 mapcount:0 mapping:ffff8880aa400e00  
index:0x0
raw: 00fffe0000000200 ffffea0001e06848 ffffea0001af0088 ffff8880aa400e00
raw: 0000000000000000 ffff8880781a3000 0000000100000001 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8880781a2f80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  ffff8880781a3000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8880781a3080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                    ^
  ffff8880781a3100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8880781a3180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

