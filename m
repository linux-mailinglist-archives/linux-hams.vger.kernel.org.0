Return-Path: <linux-hams+bounces-456-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5669FC89F
	for <lists+linux-hams@lfdr.de>; Thu, 26 Dec 2024 06:34:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A41071622B5
	for <lists+linux-hams@lfdr.de>; Thu, 26 Dec 2024 05:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C21D14B08A;
	Thu, 26 Dec 2024 05:34:22 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFB712B71
	for <linux-hams@vger.kernel.org>; Thu, 26 Dec 2024 05:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735191262; cv=none; b=jk5zRHboxTVn4Eksz5eQp5AuBl7d+w8YaAgjfRYSpZGFsIH7GeFD0fjWiMiSVNcbuHMEy9wXjVzSfE+G4meXPfV8OD62TU/HV+LBjFc035aESA1wwaXgCJpq/BI8Kil3mi0JDa6qirYkLj6HZRZPVom5bpILUvJoM7wylqIQeNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735191262; c=relaxed/simple;
	bh=3zN5L2d2pShtbUr7bIhYL/ZnPVC1ATHvv2uvV2gFUmc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JnJU9YZrjAsPEGm0Q3nRUHflo8/wW0xs4se5q7xozzt0kybFwUMJxCDlLQd+/AIoQ48Ltoh5vWI4aF15DYnjwz9PhBLVk3DFn6Xi2awaVpcl41QnIBqGIBUMAl4pJAE3ACq+l9Y/OD16jBjojpOcOw8pYEbZ98uWJCixPqgnS+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3a81357cdc7so67505675ab.1
        for <linux-hams@vger.kernel.org>; Wed, 25 Dec 2024 21:34:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735191260; x=1735796060;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gNPeUisoQQAFO3VDEvaYZUuTZRGUT5moESeK0PP4yJU=;
        b=p6tLwf9ixlxU7MhO0GKXmUPyDXTTEfh1RUzET8Vh6Km1olclypcwdUhKoCpk7BakYq
         twNprK8jf+Ey6PJ+/fuouycPn1W3bUU5nP0kI3qMEVmjL2jK+ghDANZr0uBA6rSECWum
         iOMF8Cm38dzt2yTMxdUy5aboY9c0dcJrPhN6KGPLjjDk4+jz7qLxw4zX8rW7m6zREtEV
         uXiU81zVqEJi0RdFLjrEyJaKFreKHXrqVhQLflwe2X4zVLasEFYKzcsO8HOM5nMBFElZ
         zRONdYohCEcVqi962elnHPxzumRBTWw1Rdm15wObd7KKDI+goFo7zqVVcX0SiZvXMApP
         vhhA==
X-Forwarded-Encrypted: i=1; AJvYcCVtYwVHoJ77qVEPv/L1hR4AKaRRgu8L/Hh8/muVs9iU8duwy8jW5d9oImknBUMnle0AVOD1diaHzwU1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw95Bwh5RomwEgJo7SKiYo8RohKTG7Ar8WbFiPNRSpTV96aclBQ
	1RDyr8q0OihLNuF8UrkMKx2UoZH+vZIGiO14lnokiQghrYpEXIgwm5IPjoc61Yd1HUEIN0JN/1+
	RnVj9d1vIBiyv7FaCVTqTuQCfIW0KwJ23zQb+OzDHlb/73I0iMW4UPXg=
X-Google-Smtp-Source: AGHT+IGioBFpENLsTTK5hhzuFbpuu0NtWfpraxEanwMyYeP/bhnmOEmhaHAxrOSvoseHcaOkAvcGGgvS1MrMQ7PRSbRO6JzpBUsF
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:d703:0:b0:3ab:502c:b523 with SMTP id
 e9e14a558f8ab-3c02ceb2239mr164734945ab.4.1735191259801; Wed, 25 Dec 2024
 21:34:19 -0800 (PST)
Date: Wed, 25 Dec 2024 21:34:19 -0800
In-Reply-To: <0000000000001abfb506221890b2@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <676ceadb.050a0220.226966.007a.GAE@google.com>
Subject: Re: [syzbot] [hams?] possible deadlock in nr_rt_device_down (3)
From: syzbot <syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    9b2ffa6148b1 Merge tag 'mtd/fixes-for-6.13-rc5' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11dac0b0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4c4096b0d467a682
dashboard link: https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14869adf980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/dbe249d9f678/disk-9b2ffa61.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ef6ad79e83bf/vmlinux-9b2ffa61.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4d67490d157d/bzImage-9b2ffa61.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.13.0-rc4-syzkaller-00012-g9b2ffa6148b1 #0 Not tainted
------------------------------------------------------
syz.3.1344/8689 is trying to acquire lock:
ffffffff8fdf2318 (nr_node_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffffffff8fdf2318 (nr_node_list_lock){+...}-{3:3}, at: nr_rt_device_down+0xb5/0x7b0 net/netrom/nr_route.c:517

but task is already holding lock:
ffffffff8fdf22b8 (nr_neigh_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffffffff8fdf22b8 (nr_neigh_list_lock){+...}-{3:3}, at: nr_rt_device_down+0x28/0x7b0 net/netrom/nr_route.c:514

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (nr_neigh_list_lock){+...}-{3:3}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5849
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_remove_neigh net/netrom/nr_route.c:307 [inline]
       nr_dec_obs net/netrom/nr_route.c:472 [inline]
       nr_rt_ioctl+0x398/0xfb0 net/netrom/nr_route.c:692
       sock_do_ioctl+0x158/0x460 net/socket.c:1209
       sock_ioctl+0x626/0x8e0 net/socket.c:1328
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&nr_node->node_lock){+...}-{3:3}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5849
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_node_lock include/net/netrom.h:152 [inline]
       nr_dec_obs net/netrom/nr_route.c:459 [inline]
       nr_rt_ioctl+0x192/0xfb0 net/netrom/nr_route.c:692
       sock_do_ioctl+0x158/0x460 net/socket.c:1209
       sock_ioctl+0x626/0x8e0 net/socket.c:1328
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (nr_node_list_lock){+...}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3161 [inline]
       check_prevs_add kernel/locking/lockdep.c:3280 [inline]
       validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3904
       __lock_acquire+0x1397/0x2100 kernel/locking/lockdep.c:5226
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5849
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_rt_device_down+0xb5/0x7b0 net/netrom/nr_route.c:517
       nr_device_event+0x134/0x150 net/netrom/af_netrom.c:126
       notifier_call_chain+0x1a5/0x3f0 kernel/notifier.c:85
       __dev_notify_flags+0x207/0x400
       dev_change_flags+0xf0/0x1a0 net/core/dev.c:9026
       dev_ifsioc+0x7c8/0xe70 net/core/dev_ioctl.c:526
       dev_ioctl+0x719/0x1340 net/core/dev_ioctl.c:783
       sock_do_ioctl+0x240/0x460 net/socket.c:1223
       sock_ioctl+0x626/0x8e0 net/socket.c:1328
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  nr_node_list_lock --> &nr_node->node_lock --> nr_neigh_list_lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(nr_neigh_list_lock);
                               lock(&nr_node->node_lock);
                               lock(nr_neigh_list_lock);
  lock(nr_node_list_lock);

 *** DEADLOCK ***

2 locks held by syz.3.1344/8689:
 #0: ffffffff8fca0788 (rtnl_mutex){+.+.}-{4:4}, at: dev_ioctl+0x706/0x1340 net/core/dev_ioctl.c:782
 #1: ffffffff8fdf22b8 (nr_neigh_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
 #1: ffffffff8fdf22b8 (nr_neigh_list_lock){+...}-{3:3}, at: nr_rt_device_down+0x28/0x7b0 net/netrom/nr_route.c:514

stack backtrace:
CPU: 1 UID: 0 PID: 8689 Comm: syz.3.1344 Not tainted 6.13.0-rc4-syzkaller-00012-g9b2ffa6148b1 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_circular_bug+0x13a/0x1b0 kernel/locking/lockdep.c:2074
 check_noncircular+0x36a/0x4a0 kernel/locking/lockdep.c:2206
 check_prev_add kernel/locking/lockdep.c:3161 [inline]
 check_prevs_add kernel/locking/lockdep.c:3280 [inline]
 validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3904
 __lock_acquire+0x1397/0x2100 kernel/locking/lockdep.c:5226
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5849
 __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
 _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
 spin_lock_bh include/linux/spinlock.h:356 [inline]
 nr_rt_device_down+0xb5/0x7b0 net/netrom/nr_route.c:517
 nr_device_event+0x134/0x150 net/netrom/af_netrom.c:126
 notifier_call_chain+0x1a5/0x3f0 kernel/notifier.c:85
 __dev_notify_flags+0x207/0x400
 dev_change_flags+0xf0/0x1a0 net/core/dev.c:9026
 dev_ifsioc+0x7c8/0xe70 net/core/dev_ioctl.c:526
 dev_ioctl+0x719/0x1340 net/core/dev_ioctl.c:783
 sock_do_ioctl+0x240/0x460 net/socket.c:1223
 sock_ioctl+0x626/0x8e0 net/socket.c:1328
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f610cf85d29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f610dd56038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f610d176160 RCX: 00007f610cf85d29
RDX: 0000000020000000 RSI: 0000000000008914 RDI: 0000000000000004
RBP: 00007f610d001aa8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f610d176160 R15: 00007ffe09d33fa8
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

