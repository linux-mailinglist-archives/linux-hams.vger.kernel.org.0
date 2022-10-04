Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5899C5F4043
	for <lists+linux-hams@lfdr.de>; Tue,  4 Oct 2022 11:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiJDJtH (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 4 Oct 2022 05:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbiJDJsf (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 4 Oct 2022 05:48:35 -0400
Received: from mail-io1-xd46.google.com (mail-io1-xd46.google.com [IPv6:2607:f8b0:4864:20::d46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462345A3FE
        for <linux-hams@vger.kernel.org>; Tue,  4 Oct 2022 02:46:06 -0700 (PDT)
Received: by mail-io1-xd46.google.com with SMTP id 5-20020a5d9c05000000b006a44709a638so8692609ioe.11
        for <linux-hams@vger.kernel.org>; Tue, 04 Oct 2022 02:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=YgqL6KexoQlIlR8vLI+bZehWnTZP4i0xZPCh2nTby/w=;
        b=BCI9HvHkEI03nzfyt04DgFrUPWaH2wijHk9npd0yZ00fh9ak4XqhEd6aSy6xRDppBI
         NBDFaqHhlGJXNSRKfSrtJ+uqGz0HcN9k+cCSvYhdy4adjugLXXQzPFtVCYBUgjGgIYrI
         Ez7AfCMNw8mvUm8bOEkItBWnJp1i8SbzvBdmLDJA4PmLOe1HJUAMEgCzQ0UUqQO1Wtan
         06rU5qgidLphOrVGwN+elYBHQMiNsYcEQT/WVqyTXkS/l45J+GVmpOvh/SUhUJ3WndmO
         rpMY7vLsX7Jg08c5ZlWTgdBbDDELItm+XY308rSCimPt3BeedWZMdfUfliJ5Eq8wEFYZ
         mKKQ==
X-Gm-Message-State: ACrzQf3mS7G4tkMFAtlLnK2jFo9viKtBKqyYYa6N3prrta8f6s0LBUzI
        lV8zDP/dEQyBK2SE3NArWSPck1Ea2SFmZe02OFSlJNpDdJua
X-Google-Smtp-Source: AMsMyM5FFxeSY+qMmC3ywTwK52eMerzOgiQPbGBiCYBV8deMbbd4WIDW0S2pP0wcVj8LUi7Kpx8wehotTPLIL/Pw6yvAiRJswdvJ
MIME-Version: 1.0
X-Received: by 2002:a92:ca49:0:b0:2f5:30:bfc1 with SMTP id q9-20020a92ca49000000b002f50030bfc1mr11053085ilo.224.1664876677433;
 Tue, 04 Oct 2022 02:44:37 -0700 (PDT)
Date:   Tue, 04 Oct 2022 02:44:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f4116605ea324e13@google.com>
Subject: [syzbot] WARNING: locking bug in nr_accept
From:   syzbot <syzbot+9e255dc219e012cdee75@syzkaller.appspotmail.com>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SORTED_RECIPS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    5911b92626df Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=10eecbff080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aae2d21e7dd80684
dashboard link: https://syzkaller.appspot.com/bug?extid=9e255dc219e012cdee75
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c50e57f66737/disk-5911b926.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f369b7b837e3/vmlinux-5911b926.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9e255dc219e012cdee75@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(1)
WARNING: CPU: 0 PID: 12189 at kernel/locking/lockdep.c:231 check_wait_context kernel/locking/lockdep.c:4727 [inline]
WARNING: CPU: 0 PID: 12189 at kernel/locking/lockdep.c:231 __lock_acquire+0x2b0/0x30a4 kernel/locking/lockdep.c:5003
Modules linked in:
CPU: 0 PID: 12189 Comm: syz-executor.0 Not tainted 6.0.0-rc7-syzkaller-18098-g5911b92626df #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/26/2022
pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : check_wait_context kernel/locking/lockdep.c:4727 [inline]
pc : __lock_acquire+0x2b0/0x30a4 kernel/locking/lockdep.c:5003
lr : hlock_class kernel/locking/lockdep.c:231 [inline]
lr : check_wait_context kernel/locking/lockdep.c:4727 [inline]
lr : __lock_acquire+0x298/0x30a4 kernel/locking/lockdep.c:5003
sp : ffff800012dfba30
x29: ffff800012dfbb10 x28: 0000000000000000 x27: ffff0000e8b44f80
x26: ffff0000f17c3130 x25: ffff0000e8b459b0 x24: 0000000000000000
x23: 0000000000000000 x22: 0000000000000001 x21: 0000000000000000
x20: 0000000000000000 x19: aaaaab5555430f3e x18: 000000000000013d
x17: ffff80000bffd6bc x16: ffff80000db49158 x15: ffff0000e8b44f80
x14: 0000000000000000 x13: 0000000000000012 x12: 0000000000040000
x11: 0000000000005336 x10: ffff80000dd0b198 x9 : fa0a257453282b00
x8 : 0000000000000000 x7 : 4e5241575f534b43 x6 : ffff80000819545c
x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000100000000 x0 : 0000000000000016
Call trace:
 check_wait_context kernel/locking/lockdep.c:4727 [inline]
 __lock_acquire+0x2b0/0x30a4 kernel/locking/lockdep.c:5003
 lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5666
 lock_sock_nested+0x70/0xd8 net/core/sock.c:3393
 lock_sock include/net/sock.h:1712 [inline]
 nr_accept+0x1ac/0x250 net/netrom/af_netrom.c:805
 do_accept+0x1d8/0x274 net/socket.c:1856
 __sys_accept4_file net/socket.c:1897 [inline]
 __sys_accept4+0xb4/0x12c net/socket.c:1927
 __do_sys_accept net/socket.c:1944 [inline]
 __se_sys_accept net/socket.c:1941 [inline]
 __arm64_sys_accept+0x28/0x3c net/socket.c:1941
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:636
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:654
 el0t_64_sync+0x18c/0x190 arch/arm64/kernel/entry.S:581
irq event stamp: 1543
hardirqs last  enabled at (1543): [<ffff800008161dac>] raw_spin_rq_unlock_irq kernel/sched/sched.h:1367 [inline]
hardirqs last  enabled at (1543): [<ffff800008161dac>] finish_lock_switch+0x94/0xe8 kernel/sched/core.c:4942
hardirqs last disabled at (1542): [<ffff80000bfc0a34>] __schedule+0x84/0x5a0 kernel/sched/core.c:6393
softirqs last  enabled at (1534): [<ffff80000b1bce74>] spin_unlock_bh include/linux/spinlock.h:394 [inline]
softirqs last  enabled at (1534): [<ffff80000b1bce74>] release_sock+0xf4/0x108 net/core/sock.c:3419
softirqs last disabled at (1532): [<ffff80000b1bcdac>] spin_lock_bh include/linux/spinlock.h:354 [inline]
softirqs last disabled at (1532): [<ffff80000b1bcdac>] release_sock+0x2c/0x108 net/core/sock.c:3406
---[ end trace 0000000000000000 ]---
BUG: sleeping function called from invalid context at arch/arm64/mm/fault.c:593
in_atomic(): 0, irqs_disabled(): 128, non_block: 0, pid: 12189, name: syz-executor.0
preempt_count: 0, expected: 0
RCU nest depth: 0, expected: 0
INFO: lockdep is turned off.
irq event stamp: 1543
hardirqs last  enabled at (1543): [<ffff800008161dac>] raw_spin_rq_unlock_irq kernel/sched/sched.h:1367 [inline]
hardirqs last  enabled at (1543): [<ffff800008161dac>] finish_lock_switch+0x94/0xe8 kernel/sched/core.c:4942
hardirqs last disabled at (1542): [<ffff80000bfc0a34>] __schedule+0x84/0x5a0 kernel/sched/core.c:6393
softirqs last  enabled at (1534): [<ffff80000b1bce74>] spin_unlock_bh include/linux/spinlock.h:394 [inline]
softirqs last  enabled at (1534): [<ffff80000b1bce74>] release_sock+0xf4/0x108 net/core/sock.c:3419
softirqs last disabled at (1532): [<ffff80000b1bcdac>] spin_lock_bh include/linux/spinlock.h:354 [inline]
softirqs last disabled at (1532): [<ffff80000b1bcdac>] release_sock+0x2c/0x108 net/core/sock.c:3406
CPU: 0 PID: 12189 Comm: syz-executor.0 Tainted: G        W          6.0.0-rc7-syzkaller-18098-g5911b92626df #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/26/2022
Call trace:
 dump_backtrace+0x1c4/0x1f0 arch/arm64/kernel/stacktrace.c:156
 show_stack+0x2c/0x54 arch/arm64/kernel/stacktrace.c:163
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x104/0x16c lib/dump_stack.c:106
 dump_stack+0x1c/0x58 lib/dump_stack.c:113
 __might_resched+0x208/0x218 kernel/sched/core.c:9892
 __might_sleep+0x48/0x78 kernel/sched/core.c:9821
 do_page_fault+0x214/0x79c arch/arm64/mm/fault.c:593
 do_translation_fault+0x78/0x194 arch/arm64/mm/fault.c:685
 do_mem_abort+0x54/0x130 arch/arm64/mm/fault.c:821
 el1_abort+0x3c/0x5c arch/arm64/kernel/entry-common.c:366
 el1h_64_sync_handler+0x60/0xac arch/arm64/kernel/entry-common.c:426
 el1h_64_sync+0x64/0x68 arch/arm64/kernel/entry.S:576
 hlock_class kernel/locking/lockdep.c:222 [inline]
 check_wait_context kernel/locking/lockdep.c:4728 [inline]
 __lock_acquire+0x2d0/0x30a4 kernel/locking/lockdep.c:5003
 lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5666
 lock_sock_nested+0x70/0xd8 net/core/sock.c:3393
 lock_sock include/net/sock.h:1712 [inline]
 nr_accept+0x1ac/0x250 net/netrom/af_netrom.c:805
 do_accept+0x1d8/0x274 net/socket.c:1856
 __sys_accept4_file net/socket.c:1897 [inline]
 __sys_accept4+0xb4/0x12c net/socket.c:1927
 __do_sys_accept net/socket.c:1944 [inline]
 __se_sys_accept net/socket.c:1941 [inline]
 __arm64_sys_accept+0x28/0x3c net/socket.c:1941
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:636
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:654
 el0t_64_sync+0x18c/0x190 arch/arm64/kernel/entry.S:581
Unable to handle kernel NULL pointer dereference at virtual address 00000000000000b8
Mem abort info:
  ESR = 0x0000000096000006
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000006
  CM = 0, WnR = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=00000001291bb000
[00000000000000b8] pgd=080000012933e003, p4d=080000012933e003, pud=080000012ab9a003, pmd=0000000000000000
Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 PID: 12189 Comm: syz-executor.0 Tainted: G        W          6.0.0-rc7-syzkaller-18098-g5911b92626df #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/26/2022
pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : check_wait_context kernel/locking/lockdep.c:4727 [inline]
pc : __lock_acquire+0x2d0/0x30a4 kernel/locking/lockdep.c:5003
lr : hlock_class kernel/locking/lockdep.c:231 [inline]
lr : check_wait_context kernel/locking/lockdep.c:4727 [inline]
lr : __lock_acquire+0x298/0x30a4 kernel/locking/lockdep.c:5003
sp : ffff800012dfba30
x29: ffff800012dfbb10 x28: 0000000000000000 x27: ffff0000e8b44f80
x26: ffff0000f17c3130 x25: ffff0000e8b459b0 x24: 0000000000000000
x23: 0000000000000000 x22: 0000000000000001 x21: 0000000000000000
x20: 0000000000000000 x19: aaaaab5555430f3e x18: 000000000000013d
x17: ffff80000bffd6bc x16: ffff80000db49158 x15: ffff0000e8b44f80
x14: 0000000000000000 x13: 0000000000000012 x12: 0000000000040000
x11: 0000000000005336 x10: ffff80000dd0b198 x9 : 0000000000040f3e
x8 : 0000000000000000 x7 : 4e5241575f534b43 x6 : ffff80000819545c
x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000100000000 x0 : 0000000000000016
Call trace:
 hlock_class kernel/locking/lockdep.c:222 [inline]
 check_wait_context kernel/locking/lockdep.c:4728 [inline]
 __lock_acquire+0x2d0/0x30a4 kernel/locking/lockdep.c:5003
 lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5666
 lock_sock_nested+0x70/0xd8 net/core/sock.c:3393
 lock_sock include/net/sock.h:1712 [inline]
 nr_accept+0x1ac/0x250 net/netrom/af_netrom.c:805
 do_accept+0x1d8/0x274 net/socket.c:1856
 __sys_accept4_file net/socket.c:1897 [inline]
 __sys_accept4+0xb4/0x12c net/socket.c:1927
 __do_sys_accept net/socket.c:1944 [inline]
 __se_sys_accept net/socket.c:1941 [inline]
 __arm64_sys_accept+0x28/0x3c net/socket.c:1941
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:636
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:654
 el0t_64_sync+0x18c/0x190 arch/arm64/kernel/entry.S:581
Code: b002db8a 91056210 9106614a b9400329 (3942e114) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	b002db8a 	adrp	x10, 0x5b71000
   4:	91056210 	add	x16, x16, #0x158
   8:	9106614a 	add	x10, x10, #0x198
   c:	b9400329 	ldr	w9, [x25]
* 10:	3942e114 	ldrb	w20, [x8, #184] <-- trapping instruction


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
