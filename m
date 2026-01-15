Return-Path: <linux-hams+bounces-745-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF53D28660
	for <lists+linux-hams@lfdr.de>; Thu, 15 Jan 2026 21:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3801E300A9BF
	for <lists+linux-hams@lfdr.de>; Thu, 15 Jan 2026 20:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912173242BE;
	Thu, 15 Jan 2026 20:26:26 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ot1-f80.google.com (mail-ot1-f80.google.com [209.85.210.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4BC30B501
	for <linux-hams@vger.kernel.org>; Thu, 15 Jan 2026 20:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768508786; cv=none; b=b7vQt51B79R3F8yVNnpA4rG/fC0udYe1yo1MCVSh8OinnyFa7/iWqWRr37dHfR9qAhOw8kUe0tjMk3pHxueEAI17zkO8dNsYsB/iywZBS+kuro0WpA3NhpMAdlNlCD2ZhcL5VfItUEqfTUNzBN1HOXM9cksC8bD5x9pNg2cCuRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768508786; c=relaxed/simple;
	bh=XB4ErrQFB0KLgAzlVb/xiZ9NOQoQbnjiJF6vDNAOYmw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Hmrvh0c7KncOUisJ3xXb9zga2leENnRramvWrIUgH19IJrJw2NTuTnb4iAxrmwS4RnHqNywKTey/iRw3Az3CjkZ78hm80iciusGy6mIlSJpuAofAWMQkDfGxeGlgT9Lnlxa+s9jZgA6r90U8XgIixwiA5LOdYKKMx4HHXxO4xPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f80.google.com with SMTP id 46e09a7af769-7cfdd2f521bso1060437a34.1
        for <linux-hams@vger.kernel.org>; Thu, 15 Jan 2026 12:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768508784; x=1769113584;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pDerMcvJvjVZBTQQNOgnpXc2pKb8nEWU+8nI5RDtk7U=;
        b=C0OVM/eNB9AV9VZ2ZO7iPVWQx6fIp9BIkSDoSQSz8HWBJjoy1B8DhEa61OBYxE5CLp
         5kezFqVV+Sw3xhWCndNTfI4oeSMrNUihbQRc7dqwk3igbZ92e+oSc7RqMKOERHa9QHYP
         v3OoF6JsrInPOAIEA1zMjJJE+UiZvON9pzwVkV8nBH32yitFPHz2/Q1iYH6yDyBNZxBo
         AXMuMl96JDDsQSeLPPD9XqE0L9nFkK2bNwqGR3j6r8iy2XClFHk8BUZZpPS/M/tbHbJV
         kJyN5t9GxXf0cEYolCsSErVFqwuStPuVkPsoQ434dYSlfSwqCdJnXNd7VAPUiGWmN5CH
         f77A==
X-Forwarded-Encrypted: i=1; AJvYcCXUYdlNSiNfjEBbPCszPMeTAi0BWvt9M+2FtZuNcMBCqC6dG3dY0QxtSuXF2ICNNESdGykQc332jqmD@vger.kernel.org
X-Gm-Message-State: AOJu0YzvFhoChw6ndnenSaE1N1ukpBaw/iCAC/z9jMhrTqJ7AslW2S2j
	ZdhbdDZg6d8YdrvF5O9qE2yQgit0oTGeR4Fx63qSiMgP0eDoKk51iUEl6vR28CZo2mr5Z/fg4qt
	iVc3WcAVddZ8dYqVDAzOliYdIiiieRrn0od3/fSn9Z4GH3865Z/u6T3uUDTQ=
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:480f:b0:65d:88b:c00d with SMTP id
 006d021491bc7-661179db260mr412053eaf.66.1768508783780; Thu, 15 Jan 2026
 12:26:23 -0800 (PST)
Date: Thu, 15 Jan 2026 12:26:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69694d6f.050a0220.58bed.0028.GAE@google.com>
Subject: [syzbot] [hams?] possible deadlock in nr_del_node (2)
From: syzbot <syzbot+6eb7834837cf6a8db75b@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4427259cc7f7 Merge tag 'riscv-for-linus-6.18-rc6' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13eadc12580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=929790bc044e87d7
dashboard link: https://syzkaller.appspot.com/bug?extid=6eb7834837cf6a8db75b
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=125eb0b4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15f3f17c580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-4427259c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5a19e3326bed/vmlinux-4427259c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/582f300a9de8/bzImage-4427259c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6eb7834837cf6a8db75b@syzkaller.appspotmail.com

bond0: (slave rose0): Error: Device is in use and cannot be enslaved
======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz.0.18/5503 is trying to acquire lock:
ffffffff8f428318 (nr_neigh_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffffffff8f428318 (nr_neigh_list_lock){+...}-{3:3}, at: nr_remove_neigh net/netrom/nr_route.c:307 [inline]
ffffffff8f428318 (nr_neigh_list_lock){+...}-{3:3}, at: nr_del_node+0x517/0x8d0 net/netrom/nr_route.c:342

but task is already holding lock:
ffff88804c3b2c70 (&nr_node->node_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffff88804c3b2c70 (&nr_node->node_lock){+...}-{3:3}, at: nr_node_lock include/net/netrom.h:152 [inline]
ffff88804c3b2c70 (&nr_node->node_lock){+...}-{3:3}, at: nr_del_node+0x152/0x8d0 net/netrom/nr_route.c:335

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&nr_node->node_lock){+...}-{3:3}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x36/0x50 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_node_lock include/net/netrom.h:152 [inline]
       nr_del_node+0x152/0x8d0 net/netrom/nr_route.c:335
       nr_rt_ioctl+0x989/0xd50 net/netrom/nr_route.c:678
       sock_do_ioctl+0xdc/0x300 net/socket.c:1254
       sock_ioctl+0x576/0x790 net/socket.c:1375
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:597 [inline]
       __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (nr_node_list_lock){+...}-{3:3}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x36/0x50 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_rt_device_down+0xa9/0x720 net/netrom/nr_route.c:517
       nr_device_event+0x137/0x150 net/netrom/af_netrom.c:126
       notifier_call_chain+0x1b6/0x3e0 kernel/notifier.c:85
       call_netdevice_notifiers_extack net/core/dev.c:2267 [inline]
       call_netdevice_notifiers net/core/dev.c:2281 [inline]
       netif_close_many+0x29c/0x410 net/core/dev.c:1784
       netif_close+0x158/0x210 net/core/dev.c:1797
       dev_close+0x10a/0x220 net/core/dev_api.c:220
       bpq_device_event+0x377/0x6a0 drivers/net/hamradio/bpqether.c:528
       notifier_call_chain+0x1b6/0x3e0 kernel/notifier.c:85
       call_netdevice_notifiers_extack net/core/dev.c:2267 [inline]
       call_netdevice_notifiers net/core/dev.c:2281 [inline]
       netif_close_many+0x29c/0x410 net/core/dev.c:1784
       netif_close+0x158/0x210 net/core/dev.c:1797
       dev_close+0x10a/0x220 net/core/dev_api.c:220
       bond_setup_by_slave+0x5f/0x3f0 drivers/net/bonding/bond_main.c:1567
       bond_enslave+0x6ca/0x3850 drivers/net/bonding/bond_main.c:1972
       bond_do_ioctl+0x635/0x9b0 drivers/net/bonding/bond_main.c:4615
       dev_siocbond net/core/dev_ioctl.c:516 [inline]
       dev_ifsioc+0x90b/0xf00 net/core/dev_ioctl.c:666
       dev_ioctl+0x7b4/0x1150 net/core/dev_ioctl.c:838
       sock_do_ioctl+0x22c/0x300 net/socket.c:1268
       sock_ioctl+0x576/0x790 net/socket.c:1375
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:597 [inline]
       __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (nr_neigh_list_lock){+...}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3165 [inline]
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3908
       __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5237
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x36/0x50 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_remove_neigh net/netrom/nr_route.c:307 [inline]
       nr_del_node+0x517/0x8d0 net/netrom/nr_route.c:342
       nr_rt_ioctl+0x989/0xd50 net/netrom/nr_route.c:678
       sock_do_ioctl+0xdc/0x300 net/socket.c:1254
       sock_ioctl+0x576/0x790 net/socket.c:1375
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:597 [inline]
       __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  nr_neigh_list_lock --> nr_node_list_lock --> &nr_node->node_lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&nr_node->node_lock);
                               lock(nr_node_list_lock);
                               lock(&nr_node->node_lock);
  lock(nr_neigh_list_lock);

 *** DEADLOCK ***

2 locks held by syz.0.18/5503:
 #0: ffffffff8f428378 (nr_node_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
 #0: ffffffff8f428378 (nr_node_list_lock){+...}-{3:3}, at: nr_del_node+0xfc/0x8d0 net/netrom/nr_route.c:334
 #1: ffff88804c3b2c70 (&nr_node->node_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
 #1: ffff88804c3b2c70 (&nr_node->node_lock){+...}-{3:3}, at: nr_node_lock include/net/netrom.h:152 [inline]
 #1: ffff88804c3b2c70 (&nr_node->node_lock){+...}-{3:3}, at: nr_del_node+0x152/0x8d0 net/netrom/nr_route.c:335

stack backtrace:
CPU: 0 UID: 0 PID: 5503 Comm: syz.0.18 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_circular_bug+0x2ee/0x310 kernel/locking/lockdep.c:2043
 check_noncircular+0x134/0x160 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3165 [inline]
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3908
 __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5237
 lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
 __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
 _raw_spin_lock_bh+0x36/0x50 kernel/locking/spinlock.c:178
 spin_lock_bh include/linux/spinlock.h:356 [inline]
 nr_remove_neigh net/netrom/nr_route.c:307 [inline]
 nr_del_node+0x517/0x8d0 net/netrom/nr_route.c:342
 nr_rt_ioctl+0x989/0xd50 net/netrom/nr_route.c:678
 sock_do_ioctl+0xdc/0x300 net/socket.c:1254
 sock_ioctl+0x576/0x790 net/socket.c:1375
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc3e5b8f6c9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe09c753a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fc3e5de5fa0 RCX: 00007fc3e5b8f6c9
RDX: 0000200000000680 RSI: 000000000000890c RDI: 000000000000000a
RBP: 00007fc3e5c11f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fc3e5de5fa0 R14: 00007fc3e5de5fa0 R15: 0000000000000003
 </TASK>


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

