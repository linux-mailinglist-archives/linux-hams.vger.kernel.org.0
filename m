Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10D7363881
	for <lists+linux-hams@lfdr.de>; Tue,  9 Jul 2019 17:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbfGIPVH (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 9 Jul 2019 11:21:07 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:53734 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfGIPVH (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 9 Jul 2019 11:21:07 -0400
Received: by mail-io1-f69.google.com with SMTP id h3so23407900iob.20
        for <linux-hams@vger.kernel.org>; Tue, 09 Jul 2019 08:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=U47SrC59jUZEcT2zXHFHbXhcijZLr+s4w3teAwbwRn0=;
        b=rMo1RoWG8HN0dFrh491XLc8XkdGfOvsWmjp/Poi0VnsrcnNVQRfV36FDa37WpHze/6
         N3k5V3IDk0bcld643ejyHtNpdXavfznTLUQMp2X0NMkINQeb1SK2TMyzty4/mruZ+qKf
         LdOc6MrmHbUlug/4QkuNBFWMBITxByTBbCUJVc28rqoyUGLYAWghqv3tb568KPLcbh+B
         yuB60rf1cdRMYiZ0EwfkoqQz0rddGe+0r2FkGJBIjHXc7ESZcYaNDRU4YW8unCytywFg
         mls4dCpRP/hZOJRnKE+/HJRFA1AnJmvaxgIgcEsADKAyw8y+8i5PXqnugU4y3U7rL3GT
         no7w==
X-Gm-Message-State: APjAAAWkdFrHjfe97r1LUz3Ca34T+w+xzgMpmjSwT/QcD80fhvyV4SWB
        15BogtTQho16DAQlbG5FpyN+BlbmvWcqtWbJng/kmr6yKMth
X-Google-Smtp-Source: APXvYqxF/ENmrLuxq5YS3gLbLMNersWqGr+KnIZs99Lb6CcNxLN7PJtaxBANHHoZi1wrO2N/maSErJTHIf9mX2CWNdYiT4nl5Ylt
MIME-Version: 1.0
X-Received: by 2002:a05:6638:303:: with SMTP id w3mr17400786jap.103.1562685666069;
 Tue, 09 Jul 2019 08:21:06 -0700 (PDT)
Date:   Tue, 09 Jul 2019 08:21:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000595ea058d411c35@google.com>
Subject: WARNING: refcount bug in nr_insert_socket
From:   syzbot <syzbot+ec1fd464d849d91c3665@syzkaller.appspotmail.com>
To:     davem@davemloft.net, linux-hams@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        ralf@linux-mips.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    4608a726 Add linux-next specific files for 20190709
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1387b608600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a02e36d356a9a17
dashboard link: https://syzkaller.appspot.com/bug?extid=ec1fd464d849d91c3665
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16b47be8600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15172e7ba00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+ec1fd464d849d91c3665@syzkaller.appspotmail.com

------------[ cut here ]------------
refcount_t: increment on 0; use-after-free.
WARNING: CPU: 0 PID: 14391 at lib/refcount.c:156 refcount_inc_checked  
lib/refcount.c:156 [inline]
WARNING: CPU: 0 PID: 14391 at lib/refcount.c:156  
refcount_inc_checked+0x61/0x70 lib/refcount.c:154
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 14391 Comm: syz-executor638 Not tainted 5.2.0-next-20190709 #34
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  <IRQ>
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x172/0x1f0 lib/dump_stack.c:113
  panic+0x2dc/0x755 kernel/panic.c:219
  __warn.cold+0x20/0x4c kernel/panic.c:576
  report_bug+0x263/0x2b0 lib/bug.c:186
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x11b/0x200 arch/x86/kernel/traps.c:272
  do_invalid_op+0x37/0x50 arch/x86/kernel/traps.c:291
  invalid_op+0x14/0x20 arch/x86/entry/entry_64.S:1008
RIP: 0010:refcount_inc_checked lib/refcount.c:156 [inline]
RIP: 0010:refcount_inc_checked+0x61/0x70 lib/refcount.c:154
Code: 1d 83 26 64 06 31 ff 89 de e8 5b 44 35 fe 84 db 75 dd e8 12 43 35 fe  
48 c7 c7 60 04 c6 87 c6 05 63 26 64 06 01 e8 77 ab 06 fe <0f> 0b eb c1 90  
90 90 90 90 90 90 90 90 90 90 55 48 89 e5 41 57 41
RSP: 0018:ffff8880ae809bf0 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000100 RSI: ffffffff815bfa86 RDI: ffffed1015d01370
RBP: ffff8880ae809c00 R08: ffff8880988924c0 R09: fffffbfff14a7757
R10: fffffbfff14a7756 R11: ffffffff8a53bab7 R12: ffff888097414c80
R13: ffff888097414c68 R14: ffff888096051348 R15: ffff888096051320
  sock_hold include/net/sock.h:649 [inline]
  sk_add_node include/net/sock.h:701 [inline]
  nr_insert_socket+0x2d/0xe0 net/netrom/af_netrom.c:137
  nr_rx_frame+0x1605/0x1e73 net/netrom/af_netrom.c:1023
  nr_loopback_timer+0x7b/0x170 net/netrom/nr_loopback.c:59
  call_timer_fn+0x1ac/0x780 kernel/time/timer.c:1322
  expire_timers kernel/time/timer.c:1366 [inline]
  __run_timers kernel/time/timer.c:1685 [inline]
  __run_timers kernel/time/timer.c:1653 [inline]
  run_timer_softirq+0x697/0x17a0 kernel/time/timer.c:1698
  __do_softirq+0x262/0x98c kernel/softirq.c:292
  invoke_softirq kernel/softirq.c:373 [inline]
  irq_exit+0x19b/0x1e0 kernel/softirq.c:413
  exiting_irq arch/x86/include/asm/apic.h:537 [inline]
  smp_apic_timer_interrupt+0x1a3/0x610 arch/x86/kernel/apic/apic.c:1095
  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:828
  </IRQ>
RIP: 0010:arch_local_irq_restore arch/x86/include/asm/paravirt.h:767  
[inline]
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:160  
[inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0x95/0xe0  
kernel/locking/spinlock.c:191
Code: 48 c7 c0 d0 e3 d2 88 48 ba 00 00 00 00 00 fc ff df 48 c1 e8 03 80 3c  
10 00 75 39 48 83 3d d2 3e 99 01 00 74 24 48 89 df 57 9d <0f> 1f 44 00 00  
bf 01 00 00 00 e8 fc c8 14 fa 65 8b 05 6d 58 c8 78
RSP: 0018:ffff88808720fd10 EFLAGS: 00000286 ORIG_RAX: ffffffffffffff13
RAX: 1ffffffff11a5c7a RBX: 0000000000000286 RCX: 0000000000000000
RDX: dffffc0000000000 RSI: 0000000000000006 RDI: 0000000000000286
RBP: ffff88808720fd20 R08: ffff8880988924c0 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff8aa79aa8
R13: ffffffff8aa79aa0 R14: ffff88809683add0 R15: ffff88808720fdc0
  debug_object_free lib/debugobjects.c:823 [inline]
  debug_object_free+0x1f1/0x390 lib/debugobjects.c:796
  destroy_hrtimer_on_stack kernel/time/hrtimer.c:432 [inline]
  hrtimer_nanosleep+0x2d8/0x570 kernel/time/hrtimer.c:1748
  __do_sys_nanosleep kernel/time/hrtimer.c:1767 [inline]
  __se_sys_nanosleep kernel/time/hrtimer.c:1754 [inline]
  __x64_sys_nanosleep+0x1a6/0x220 kernel/time/hrtimer.c:1754
  do_syscall_64+0xfd/0x6a0 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x447811
Code: 75 14 b8 23 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 b4 1e fc ff c3 48  
83 ec 08 e8 6a 44 00 00 48 89 04 24 b8 23 00 00 00 0f 05 <48> 8b 3c 24 48  
89 c2 e8 b3 44 00 00 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007ffcca488140 EFLAGS: 00000293 ORIG_RAX: 0000000000000023
RAX: ffffffffffffffda RBX: 0000000000000048 RCX: 0000000000447811
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00007ffcca488150
RBP: 00000000006dfc6c R08: 00000000004b1a31 R09: 00000000004b1a31
R10: 00007ffcca488180 R11: 0000000000000293 R12: 00000000006dfc60
R13: 0000000000000002 R14: 000000000000002d R15: 20c49ba5e353f7cf
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
