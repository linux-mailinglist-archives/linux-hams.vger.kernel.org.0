Return-Path: <linux-hams+bounces-475-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 082F1A2D3ED
	for <lists+linux-hams@lfdr.de>; Sat,  8 Feb 2025 06:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AFAB3AAAF3
	for <lists+linux-hams@lfdr.de>; Sat,  8 Feb 2025 05:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9EF18DB23;
	Sat,  8 Feb 2025 05:02:26 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB0038FB0
	for <linux-hams@vger.kernel.org>; Sat,  8 Feb 2025 05:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738990946; cv=none; b=XMtUdPj4Po7KDw6yLYRGCM8siCNxutsCbQYkIRblQxCyFYHz55iBP7nhOyb7aH8XIQ1nvu5Js3FTipzh3d40gah4Yvaj/dOlimRR08hRN+M/z64pokoj6iqq0h6fQ6ZNNLJUWhzaSaVIyCcV7hIqHDQukAG+WzK2M7eYuVn7LYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738990946; c=relaxed/simple;
	bh=FhWnX8Dws+tE5PvQzH5KmVPXMmipMM6EM1G19il+x6c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=n68wuZ4wUyVEQ1JwLU/v4PKmhCMp731dQ1XLXScxEtseg8eyDtUwDK9MNVxHIKwQAYwuzy+JvhO9kv9ULVAuhq3ad6C+FGDHeomHsCGrZa5I4krcHFtNN9OwRHFSry5CnU0pSGd4rq05LmyVXou3SakqxP6rkxgmsEbKDLHnYLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d14a3f812fso17771185ab.3
        for <linux-hams@vger.kernel.org>; Fri, 07 Feb 2025 21:02:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738990944; x=1739595744;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pXjDlQcZtOm4ojhk77V76o5Uy/7AELAPeFe6ypJDkI4=;
        b=CZtwCSb1b6ke6m5Y/Si/qH2H5WDs/e44Bx9ITHc9gn3C5nYA04fidTAmuMNLa8bqBE
         QVv7YkDujqmNefvxG6KTaovk2iwAAYMnq28axn3Uop0gPXeTNVLdz6RJ/IO0WKXBO2l8
         4vR1eWWkw/VzPL4iFQ6jcW5JR5twuvc9m+LYHs9XCQB+vc0csZkxliDDJuYBkO9//1w5
         1SdDjqIhAXtblIyi/N9fFHVxMIwAPkZ/Zk9Z8lZXxPVdcygDb788Uz3/UG4nnWKXEGJ8
         etkcysnBZqAGWaplFbIKy5de3wIpf5fR3A/nJsUbaap2FaVHt+pBF7L4DooF9RkhZjht
         5MPA==
X-Forwarded-Encrypted: i=1; AJvYcCXETHGGUcgrLAyfRdsW8FvjOa+zuiOKNss22eIzhD3skjdgqjoaYCwqdD42oWEfREzsHE1S/Vd5/0Ln@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl7kGsqKuYFcUxMst0bU46oQeO1zx9HyWQZpe5YdJXZvNwynPj
	RgydS+r2qsAXKKnTfA8cxBE8lZH1FANzE/QY25zQyeMRFA+PFD0bJM9BH/hSVhTHMFIu+UF5eHN
	eqFMg0BAMpbAKUNr+bX85ajxPek1ft25Qym7nAm9z0v4goXPRkQaESYo=
X-Google-Smtp-Source: AGHT+IHGJbmzJqUEKvu7F3C1RmANTGtjRLJMNgGP3GONjOAz0tc4r1iww3J0mU270UJwha9nfBS6fxKBL5/WrUqy3AGtUxgwEypQ
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b49:b0:3d0:24c0:bd45 with SMTP id
 e9e14a558f8ab-3d13df5445emr40572725ab.20.1738990943836; Fri, 07 Feb 2025
 21:02:23 -0800 (PST)
Date: Fri, 07 Feb 2025 21:02:23 -0800
In-Reply-To: <67720722.050a0220.2f3838.04b4.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a6e55f.050a0220.3d72c.001f.GAE@google.com>
Subject: Re: [syzbot] [hams?] possible deadlock in nr_remove_neigh (2)
From: syzbot <syzbot+8863ad36d31449b4dc17@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    7ee983c850b4 Merge tag 'drm-fixes-2025-02-08' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14b661b0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a7ddf49cf33ba213
dashboard link: https://syzkaller.appspot.com/bug?extid=8863ad36d31449b4dc17
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=137a5df8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17148bdf980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ecfa63f9f35c/disk-7ee983c8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e9bfce21362e/vmlinux-7ee983c8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2942fdcc30b7/bzImage-7ee983c8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8863ad36d31449b4dc17@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.14.0-rc1-syzkaller-00181-g7ee983c850b4 #0 Not tainted
------------------------------------------------------
syz-executor270/7031 is trying to acquire lock:
ffffffff90146478 (nr_neigh_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffffffff90146478 (nr_neigh_list_lock){+...}-{3:3}, at: nr_remove_neigh+0x1a/0x290 net/netrom/nr_route.c:307

but task is already holding lock:
ffff888145b6b970 (&nr_node->node_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffff888145b6b970 (&nr_node->node_lock){+...}-{3:3}, at: nr_node_lock include/net/netrom.h:152 [inline]
ffff888145b6b970 (&nr_node->node_lock){+...}-{3:3}, at: nr_add_node+0x60b/0x2be0 net/netrom/nr_route.c:214

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&nr_node->node_lock){+...}-{3:3}:
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_node_lock include/net/netrom.h:152 [inline]
       nr_rt_device_down+0x188/0x7f0 net/netrom/nr_route.c:519
       nr_device_event+0x126/0x170 net/netrom/af_netrom.c:126
       notifier_call_chain+0xb7/0x410 kernel/notifier.c:85
       call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:2141
       call_netdevice_notifiers_extack net/core/dev.c:2179 [inline]
       call_netdevice_notifiers net/core/dev.c:2193 [inline]
       __dev_notify_flags+0x1f9/0x2e0 net/core/dev.c:9213
       dev_change_flags+0x10c/0x160 net/core/dev.c:9249
       dev_ifsioc+0x9d8/0x10d0 net/core/dev_ioctl.c:563
       dev_ioctl+0x224/0x10c0 net/core/dev_ioctl.c:826
       sock_do_ioctl+0x19e/0x280 net/socket.c:1213
       sock_ioctl+0x228/0x6c0 net/socket.c:1318
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl fs/ioctl.c:892 [inline]
       __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (nr_node_list_lock){+...}-{3:3}:
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_rt_device_down+0xd5/0x7f0 net/netrom/nr_route.c:517
       nr_device_event+0x126/0x170 net/netrom/af_netrom.c:126
       notifier_call_chain+0xb7/0x410 kernel/notifier.c:85
       call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:2141
       call_netdevice_notifiers_extack net/core/dev.c:2179 [inline]
       call_netdevice_notifiers net/core/dev.c:2193 [inline]
       __dev_notify_flags+0x1f9/0x2e0 net/core/dev.c:9213
       dev_change_flags+0x10c/0x160 net/core/dev.c:9249
       dev_ifsioc+0x9d8/0x10d0 net/core/dev_ioctl.c:563
       dev_ioctl+0x224/0x10c0 net/core/dev_ioctl.c:826
       sock_do_ioctl+0x19e/0x280 net/socket.c:1213
       sock_ioctl+0x228/0x6c0 net/socket.c:1318
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl fs/ioctl.c:892 [inline]
       __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (nr_neigh_list_lock){+...}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3163 [inline]
       check_prevs_add kernel/locking/lockdep.c:3282 [inline]
       validate_chain kernel/locking/lockdep.c:3906 [inline]
       __lock_acquire+0x249e/0x3c40 kernel/locking/lockdep.c:5228
       lock_acquire.part.0+0x11b/0x380 kernel/locking/lockdep.c:5851
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_remove_neigh+0x1a/0x290 net/netrom/nr_route.c:307
       nr_add_node+0x23d1/0x2be0 net/netrom/nr_route.c:249
       nr_rt_ioctl+0x126e/0x29e0 net/netrom/nr_route.c:651
       nr_ioctl+0x19a/0x2e0 net/netrom/af_netrom.c:1254
       sock_do_ioctl+0x116/0x280 net/socket.c:1199
       sock_ioctl+0x228/0x6c0 net/socket.c:1318
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl fs/ioctl.c:892 [inline]
       __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
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

1 lock held by syz-executor270/7031:
 #0: ffff888145b6b970 (&nr_node->node_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
 #0: ffff888145b6b970 (&nr_node->node_lock){+...}-{3:3}, at: nr_node_lock include/net/netrom.h:152 [inline]
 #0: ffff888145b6b970 (&nr_node->node_lock){+...}-{3:3}, at: nr_add_node+0x60b/0x2be0 net/netrom/nr_route.c:214

stack backtrace:
CPU: 1 UID: 0 PID: 7031 Comm: syz-executor270 Not tainted 6.14.0-rc1-syzkaller-00181-g7ee983c850b4 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_circular_bug+0x490/0x760 kernel/locking/lockdep.c:2076
 check_noncircular+0x31a/0x400 kernel/locking/lockdep.c:2208
 check_prev_add kernel/locking/lockdep.c:3163 [inline]
 check_prevs_add kernel/locking/lockdep.c:3282 [inline]
 validate_chain kernel/locking/lockdep.c:3906 [inline]
 __lock_acquire+0x249e/0x3c40 kernel/locking/lockdep.c:5228
 lock_acquire.part.0+0x11b/0x380 kernel/locking/lockdep.c:5851
 __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
 _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:178
 spin_lock_bh include/linux/spinlock.h:356 [inline]
 nr_remove_neigh+0x1a/0x290 net/netrom/nr_route.c:307
 nr_add_node+0x23d1/0x2be0 net/netrom/nr_route.c:249
 nr_rt_ioctl+0x126e/0x29e0 net/netrom/nr_route.c:651
 nr_ioctl+0x19a/0x2e0 net/netrom/af_netrom.c:1254
 sock_do_ioctl+0x116/0x280 net/socket.c:1199
 sock_ioctl+0x228/0x6c0 net/socket.c:1318
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcbef4bd2e9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 1f 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe540a63c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fcbef4bd2e9
RDX: 00002000000001c0 RSI: 000000000000890b RDI: 0000000000000008
RBP: 0000000000000000 R08: 00007ffe540a6400 R09: 00007ffe540a6400
R10: 00007ffe540a6400 R11: 0000000000000246 R12: 00007ffe540a63e8
R13: 00007ffe540a6420 R14: 00000000000000de R15: 431bde82d7b634db
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

