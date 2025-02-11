Return-Path: <linux-hams+bounces-478-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC0AA3016B
	for <lists+linux-hams@lfdr.de>; Tue, 11 Feb 2025 03:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCAC07A228F
	for <lists+linux-hams@lfdr.de>; Tue, 11 Feb 2025 02:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D5022087;
	Tue, 11 Feb 2025 02:23:30 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D6326BDAE
	for <linux-hams@vger.kernel.org>; Tue, 11 Feb 2025 02:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739240610; cv=none; b=WJP8B8MFHMfsvt7oRYWSuATueIetzN6XiD8JZZISdr/cqTLptzs3vt5GDojnnjQaYofC+AlNpyNcgLBFipRkAbgJ7l8NnvGjjqaqDTmf823m2gFPVNSOiwYNSX2FMgFVrHbSVQ5JCsxn/XF8c4e6JMNloiqbkIjvyeObDRRAEjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739240610; c=relaxed/simple;
	bh=Zr1/YMrRfSKpbMAcCv8l2Ccd7c0b9BRBwRhG+O1JcRY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=giJ0fwzv4PIaqIelArTS7FF0gkthr8iLjidSGgLsZS4YfN5eZwHqT4OUDFNj1Sr809lVuuz2dszxH/Rxr4ftgin9NnBrWHl9qA6USFDOREKUnc9uvty7nigW4/78qYBbRXVfBUTEEbYM5/LXFQgB6u5Cx/VmeWEXw8/3dhzlO68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d158477b5fso13955145ab.0
        for <linux-hams@vger.kernel.org>; Mon, 10 Feb 2025 18:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739240607; x=1739845407;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=166LBbt64jZ5pcV15fCq8VCvbhMSg2uka6qoDR9pF6Y=;
        b=VMnxweqFUXtcQlw1YrUu3rmJN2YwQgiPvjaMQoDUSFHRK+cTDRfCP6WmxR7TLD/h6X
         qyIYK7RAJL/p+Ejsg72eVqDRAP2oQTQPk3+jhfwkbRjrZrg70vFnkex/9cCwIojz48nX
         mPdR5iLWC4du4f0Kq6V+TFwexV9twg4yWnpqvwA83hXtTA4vjVL6DVF5qYJxe1FJ2BKp
         UNYyPq7H+jpcsX+r4b2iXjlMlBZ3h+GwynG423lS8wvIDdQD2yg47MBCikhe5K0bbCrB
         vgH6RhZCd5XEqZt394D0By7LzQlY6G1kyVRcDBsJO2Dg5sWLduNYuhY3lAzxj2hqMI+l
         RPPA==
X-Forwarded-Encrypted: i=1; AJvYcCVaVp4c2qUOMtL2iXA2WjIAfS90Y7SDgkxr59PqZHS8TMC8WQo8m9Nom8sFgQEQd+DhT2wbzq0En/3X@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/AqmZW9hUZNu1160x6aDtQBEfeldeBxvJfrb8pQ+LPWlCpiYf
	R3kjb4buB8xnrX1BDpR+nd1WmYDLg4nuxLG4H9pO8708T3H15IkSnF6RGYIoSvfexTMPBCoTeW3
	4TMswUe7l/9Pv/lRpqW7tWRfdNMKjv6LIEVzDnJCojvRXQ8vpBLIJqT0=
X-Google-Smtp-Source: AGHT+IHaBPniZelBTlU5baRXYIYMNUjG3TGM8YvVe+IrDitGwDSK2DfuJxQ+7eMeFKYFdnKSW+jc2vQN4mkXPnjJaei0YrERueLY
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2142:b0:3d0:4b3d:75ba with SMTP id
 e9e14a558f8ab-3d13dcee89amr117673305ab.4.1739240607441; Mon, 10 Feb 2025
 18:23:27 -0800 (PST)
Date: Mon, 10 Feb 2025 18:23:27 -0800
In-Reply-To: <0000000000001abfb506221890b2@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67aab49f.050a0220.110943.0038.GAE@google.com>
Subject: Re: [syzbot] [hams?] possible deadlock in nr_rt_device_down (3)
From: syzbot <syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    34c84b394890 Merge branch 'netconsole-cpu-population'
git tree:       net-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=10a4fb18580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1909f2f0d8e641ce
dashboard link: https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15d372a4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14e8c3f8580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a387ecc01ea6/disk-34c84b39.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/25869f4f9e04/vmlinux-34c84b39.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bfdfecda0154/bzImage-34c84b39.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.14.0-rc1-syzkaller-00206-g34c84b394890 #0 Not tainted
------------------------------------------------------
syz-executor309/5900 is trying to acquire lock:
ffffffff8fe14a38 (nr_node_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffffffff8fe14a38 (nr_node_list_lock){+...}-{3:3}, at: nr_rt_device_down+0xb5/0x7b0 net/netrom/nr_route.c:517

but task is already holding lock:
ffffffff8fe149d8 (nr_neigh_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffffffff8fe149d8 (nr_neigh_list_lock){+...}-{3:3}, at: nr_rt_device_down+0x28/0x7b0 net/netrom/nr_route.c:514

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (nr_neigh_list_lock){+...}-{3:3}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5851
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_remove_neigh net/netrom/nr_route.c:307 [inline]
       nr_dec_obs net/netrom/nr_route.c:472 [inline]
       nr_rt_ioctl+0x398/0xfb0 net/netrom/nr_route.c:692
       sock_do_ioctl+0x158/0x460 net/socket.c:1194
       sock_ioctl+0x626/0x8e0 net/socket.c:1313
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&nr_node->node_lock){+...}-{3:3}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5851
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_node_lock include/net/netrom.h:152 [inline]
       nr_dec_obs net/netrom/nr_route.c:459 [inline]
       nr_rt_ioctl+0x192/0xfb0 net/netrom/nr_route.c:692
       sock_do_ioctl+0x158/0x460 net/socket.c:1194
       sock_ioctl+0x626/0x8e0 net/socket.c:1313
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (nr_node_list_lock){+...}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3163 [inline]
       check_prevs_add kernel/locking/lockdep.c:3282 [inline]
       validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3906
       __lock_acquire+0x1397/0x2100 kernel/locking/lockdep.c:5228
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5851
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_rt_device_down+0xb5/0x7b0 net/netrom/nr_route.c:517
       nr_device_event+0x134/0x150 net/netrom/af_netrom.c:126
       notifier_call_chain+0x1a5/0x3f0 kernel/notifier.c:85
       __dev_notify_flags+0x207/0x400
       dev_change_flags+0xf0/0x1a0 net/core/dev.c:9257
       dev_ifsioc+0x7c8/0xe70 net/core/dev_ioctl.c:563
       dev_ioctl+0x719/0x1340 net/core/dev_ioctl.c:826
       sock_do_ioctl+0x240/0x460 net/socket.c:1208
       sock_ioctl+0x626/0x8e0 net/socket.c:1313
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

2 locks held by syz-executor309/5900:
 #0: ffffffff8fcc0108 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #0: ffffffff8fcc0108 (rtnl_mutex){+.+.}-{4:4}, at: dev_ioctl+0x706/0x1340 net/core/dev_ioctl.c:825
 #1: ffffffff8fe149d8 (nr_neigh_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
 #1: ffffffff8fe149d8 (nr_neigh_list_lock){+...}-{3:3}, at: nr_rt_device_down+0x28/0x7b0 net/netrom/nr_route.c:514

stack backtrace:
CPU: 1 UID: 0 PID: 5900 Comm: syz-executor309 Not tainted 6.14.0-rc1-syzkaller-00206-g34c84b394890 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_circular_bug+0x13a/0x1b0 kernel/locking/lockdep.c:2076
 check_noncircular+0x36a/0x4a0 kernel/locking/lockdep.c:2208
 check_prev_add kernel/locking/lockdep.c:3163 [inline]
 check_prevs_add kernel/locking/lockdep.c:3282 [inline]
 validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3906
 __lock_acquire+0x1397/0x2100 kernel/locking/lockdep.c:5228
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5851
 __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
 _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
 spin_lock_bh include/linux/spinlock.h:356 [inline]
 nr_rt_device_down+0xb5/0x7b0 net/netrom/nr_route.c:517
 nr_device_event+0x134/0x150 net/netrom/af_netrom.c:126
 notifier_call_chain+0x1a5/0x3f0 kernel/notifier.c:85
 __dev_notify_flags+0x207/0x400
 dev_change_flags+0xf0/0x1a0 net/core/dev.c:9257
 dev_ifsioc+0x7c8/0xe70 net/core/dev_ioctl.c:563
 dev_ioctl+0x719/0x1340 net/core/dev_ioctl.c:826
 sock_do_ioctl+0x240/0x460 net/socket.c:1208
 sock_ioctl+0x626/0x8e0 net/socket.c:1313
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f052c137829
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 31 1a 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcc38957c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f052c137829
RDX: 0000400000000000 RSI: 0000000000008914 RDI: 0000000000000007
RBP: 0000000000000000 R08: 00007f052c185214 R09: 00007f052c185214
R10: fffffffffffffe1d R11: 0000000000000246 R12: 00007f052c1854a8
R13: 00007f052c185084 R14: 00007ffcc3895800 R15: 0000000000000000
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

