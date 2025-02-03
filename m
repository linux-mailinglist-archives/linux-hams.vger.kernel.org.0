Return-Path: <linux-hams+bounces-474-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B1DA260EE
	for <lists+linux-hams@lfdr.de>; Mon,  3 Feb 2025 18:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3084A3A350F
	for <lists+linux-hams@lfdr.de>; Mon,  3 Feb 2025 17:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB82120D509;
	Mon,  3 Feb 2025 17:06:24 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E7320B814
	for <linux-hams@vger.kernel.org>; Mon,  3 Feb 2025 17:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738602384; cv=none; b=NHq6ma1yGv58zOy0MYpBtva2NNHgbFWHg55/pIHEpOq9zsWjDCnkGwiC0/Wwt0IHE/zPuyzDd5HmMQCh99OcmfAUZ8EYHOpsKqHBSqj9GGlauThEVUU5g6UYN2K7eDzC748Sqk04bHEUV19EhDsadWddc5kDv/nyCQjD2p4nuWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738602384; c=relaxed/simple;
	bh=BrCxbpYcd+JnXrPkcfr6lCs/aTPwdnfGgVrzCmZxKnQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=m7Vk/vLb2RGpEGd6fnR+ye6Ky+JA8iWdEAzxaSErenfnlMF/Pkv7guHl8xhK+PIzSkMHL90xkEvdhA1cTumdKiwx5ZpC5OsCITkDVLQtQ4AV8/yMsHDGOde0XnKpen+n0zBgJYlQCRaHPu87zxWTfr0W6UXj8VZZAQd4XAwbCNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-851a991cf8bso328794839f.0
        for <linux-hams@vger.kernel.org>; Mon, 03 Feb 2025 09:06:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738602382; x=1739207182;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EvIJAMDztJTBQDqmwsIIAqNRRzmhnnKPFMl2MQnHWFs=;
        b=vbM1oX0dsBfk9lM0xm/98becIc/j0rsPYwI6v4JkAsoQjw3MSEMIAQ3KjYrykuaT2k
         M8Tp9RYAW7YiotQM87MVFZj2mLADtzyzMUZRtfKG4tJV5P0WA93K09llfaS77J3LIqZX
         +gXMoa91dcg8Jc9Bn/IPEN07IY+cRhlhAjsRm7cEDNlZvwULqP45hnDT8Kau0MsbcVYc
         uduEa0kaQIuH7yi6z5sBgd3kDS2bwbx9u7nCkVRW7Wz/Z0xWfrUoaYsl9wBlXMRDl3oP
         Kfbt9mfKzSxg8nDvUNo8GH9ekNNOQ3H9pcIQ7AYuMV7TaQRru0ZpUPsN2Dsrm5jdVyup
         Hq3g==
X-Forwarded-Encrypted: i=1; AJvYcCV0xIt98+zWDOBoRDgBbaCI9eE9HpSdrOSYmZgbMWYUizDFZDymZI8NzXUHfY/Y9FAG+N1sIyYgr4GU@vger.kernel.org
X-Gm-Message-State: AOJu0YwUhELbMruzCZyrpwq3aCQOyogzPXfDC4vTjZIWLOQR6QQ/obnK
	zIM3kI2xc32RRJ8jof2GTOHOI6YOvmWd/dIo1F9ERGWQLkWQQgaSSWbtzu1s7iasegi9ZsgtLyf
	GF65wqMPAi9ft9K0FIkS0KnT+2FKFwaANV0zXpgY/QNaJyMaEnaNwyt0=
X-Google-Smtp-Source: AGHT+IFK9hAgpJhY7Jr0yXxf8XJkawng8GwmfeYpkqFFGFi7+/+QAD3e0sWxk3BAQvw4z/PjcMzqIARG48F19gP7ndd1WRd81iLh
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:a0:b0:3cf:ba90:6ad9 with SMTP id
 e9e14a558f8ab-3d03f4fc490mr222185ab.9.1738602381964; Mon, 03 Feb 2025
 09:06:21 -0800 (PST)
Date: Mon, 03 Feb 2025 09:06:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a0f78d.050a0220.d7c5a.00a0.GAE@google.com>
Subject: [syzbot] [hams?] BUG: soft lockup in rose_loopback_timer
From: syzbot <syzbot+7ff41b5215f0c534534e@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    573067a5a685 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1189ff30580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cd7202b56d469648
dashboard link: https://syzkaller.appspot.com/bug?extid=7ff41b5215f0c534534e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15f4ffe8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1663aadf980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9d3b5c855aa0/disk-573067a5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0c06fc1ead83/vmlinux-573067a5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3390e59b9e4b/Image-573067a5.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7ff41b5215f0c534534e@syzkaller.appspotmail.com

watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:0]
Modules linked in:
irq event stamp: 232963
hardirqs last  enabled at (232962): [<ffff80008b69c960>] __el1_irq arch/arm64/kernel/entry-common.c:565 [inline]
hardirqs last  enabled at (232962): [<ffff80008b69c960>] el1_interrupt+0x58/0x68 arch/arm64/kernel/entry-common.c:575
hardirqs last disabled at (232963): [<ffff80008b69c92c>] __el1_irq arch/arm64/kernel/entry-common.c:557 [inline]
hardirqs last disabled at (232963): [<ffff80008b69c92c>] el1_interrupt+0x24/0x68 arch/arm64/kernel/entry-common.c:575
softirqs last  enabled at (228290): [<ffff80008030e7b4>] softirq_handle_end kernel/softirq.c:407 [inline]
softirqs last  enabled at (228290): [<ffff80008030e7b4>] handle_softirqs+0xb44/0xd34 kernel/softirq.c:589
softirqs last disabled at (228401): [<ffff800080020db4>] __do_softirq+0x14/0x20 kernel/softirq.c:595
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.13.0-rc3-syzkaller-g573067a5a685 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : preempt_count arch/arm64/include/asm/preempt.h:13 [inline]
pc : in_softirq_really kernel/kcov.c:171 [inline]
pc : check_kcov_mode kernel/kcov.c:183 [inline]
pc : write_comp_data kernel/kcov.c:246 [inline]
pc : __sanitizer_cov_trace_cmp4+0x38/0xa0 kernel/kcov.c:288
lr : rose_find_socket+0x7c/0x130 net/rose/af_rose.c:309
sp : ffff800080007b60
x29: ffff800080007b70 x28: 1ffff00012f27be0 x27: 0000000000000000
x26: 00000000000003e7 x25: dfff800000000000 x24: 0000000000000033
x23: dfff800000000000 x22: 0000000000000000 x21: ffff0000c2c8e000
x20: 0000000000000033 x19: ffff0000d2670400 x18: ffff800080007840
x17: 0000000000015d97 x16: ffff80008069d55c x15: ffff700010000f54
x14: 1ffff00010000f54 x13: 0000000000000004 x12: ffffffffffffffff
x11: ffff700010000f54 x10: 0000000000ff0100 x9 : 0000000000000302
x8 : ffff80008f9c67c0 x7 : 0000000000000000 x6 : 0000000000000000
x5 : ffff8000935a9f90 x4 : 0000000000000008 x3 : ffff80008047cdcc
x2 : 0000000000000001 x1 : 0000000000000033 x0 : 0000000000000000
Call trace:
 in_softirq_really kernel/kcov.c:171 [inline] (P)
 check_kcov_mode kernel/kcov.c:183 [inline] (P)
 write_comp_data kernel/kcov.c:246 [inline] (P)
 __sanitizer_cov_trace_cmp4+0x38/0xa0 kernel/kcov.c:288 (P)
 rose_loopback_timer+0x1bc/0x4bc net/rose/rose_loopback.c:91
 call_timer_fn+0x1b4/0x8b8 kernel/time/timer.c:1793
 expire_timers kernel/time/timer.c:1844 [inline]
 __run_timers kernel/time/timer.c:2418 [inline]
 __run_timer_base+0x56c/0x7b4 kernel/time/timer.c:2430
 run_timer_base kernel/time/timer.c:2439 [inline]
 run_timer_softirq+0xcc/0x194 kernel/time/timer.c:2449
 handle_softirqs+0x320/0xd34 kernel/softirq.c:561
 __do_softirq+0x14/0x20 kernel/softirq.c:595
 ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:81
 call_on_irq_stack+0x24/0x4c arch/arm64/kernel/entry.S:891
 do_softirq_own_stack+0x20/0x2c arch/arm64/kernel/irq.c:86
 invoke_softirq kernel/softirq.c:442 [inline]
 __irq_exit_rcu+0x1d8/0x544 kernel/softirq.c:662
 irq_exit_rcu+0x14/0x84 kernel/softirq.c:678
 __el1_irq arch/arm64/kernel/entry-common.c:561 [inline]
 el1_interrupt+0x38/0x68 arch/arm64/kernel/entry-common.c:575
 el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:580
 el1h_64_irq+0x6c/0x70 arch/arm64/kernel/entry.S:596
 __daif_local_irq_enable arch/arm64/include/asm/irqflags.h:26 [inline] (P)
 arch_local_irq_enable+0x8/0xc arch/arm64/include/asm/irqflags.h:48 (P)
 cpuidle_idle_call kernel/sched/idle.c:185 [inline]
 do_idle+0x1ec/0x4e0 kernel/sched/idle.c:325
 cpu_startup_entry+0x5c/0x74 kernel/sched/idle.c:423
 rest_init+0x2dc/0x2f4 init/main.c:747
 start_kernel+0x3f4/0x4f4 init/main.c:1102
 __primary_switched+0x8c/0x94 arch/arm64/kernel/head.S:246
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 6586 Comm: syz-executor306 Not tainted 6.13.0-rc3-syzkaller-g573067a5a685 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : queued_spin_lock_slowpath+0x15c/0xd04 kernel/locking/qspinlock.c:380
lr : queued_spin_lock_slowpath+0x168/0xd04 kernel/locking/qspinlock.c:380
sp : ffff8000a3887920
x29: ffff8000a38879e0 x28: 1ffff00012545d44 x27: dfff800000000000
x26: 1ffff00014710f50 x25: ffff8000a3887960 x24: dfff800000000000
x23: ffff8000a38879a0 x22: ffff700014710f2c x21: 0000000000000001
x20: 1ffff00014710f34 x19: ffff800092a2ea20 x18: 0000000000000000
x17: 0000000000000000 x16: ffff800080bf1494 x15: 0000000000000001
x14: 1ffff00012545d44 x13: 0000000000000000 x12: 0000000000000000
x11: ffff700012545d45 x10: 1ffff00012545d44 x9 : 0000000000000000
x8 : 0000000000000001 x7 : ffff80008a73b3a4 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000001 x3 : ffff80008b6c1928
x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000000000001
Call trace:
 __cmpwait_case_8 arch/arm64/include/asm/cmpxchg.h:229 [inline] (P)
 __cmpwait arch/arm64/include/asm/cmpxchg.h:257 [inline] (P)
 queued_spin_lock_slowpath+0x15c/0xd04 kernel/locking/qspinlock.c:380 (P)
 queued_spin_lock include/asm-generic/qspinlock.h:114 [inline]
 do_raw_spin_lock+0x2ec/0x334 kernel/locking/spinlock_debug.c:116
 __raw_spin_lock_bh include/linux/spinlock_api_smp.h:127 [inline]
 _raw_spin_lock_bh+0x50/0x60 kernel/locking/spinlock.c:178
 spin_lock_bh include/linux/spinlock.h:356 [inline]
 rose_insert_socket+0x2c/0x15c net/rose/af_rose.c:261
 rose_bind+0x490/0x640 net/rose/af_rose.c:753
 __sys_bind_socket net/socket.c:1827 [inline]
 __sys_bind+0x1ac/0x248 net/socket.c:1858
 __do_sys_bind net/socket.c:1863 [inline]
 __se_sys_bind net/socket.c:1861 [inline]
 __arm64_sys_bind+0x7c/0x94 net/socket.c:1861
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600


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

