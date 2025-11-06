Return-Path: <linux-hams+bounces-704-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A77FEC39DFE
	for <lists+linux-hams@lfdr.de>; Thu, 06 Nov 2025 10:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2C1AB350864
	for <lists+linux-hams@lfdr.de>; Thu,  6 Nov 2025 09:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736DC2C0F8E;
	Thu,  6 Nov 2025 09:45:33 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B422652B2
	for <linux-hams@vger.kernel.org>; Thu,  6 Nov 2025 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762422333; cv=none; b=bOnQYlChrAw+a2ykwMWGa2iLSOYFaHrJyftRx9rkfC4WkN1aUif1pV6x2fqvungxtuHsazLL8AOeWT4MFplT4DUeTSNwmQWTFVpcRi8XtgMf2XGJ7WmSYXILNHWlU1Cydsgx5/PF+GHMc1Gx0wh9JM9CrTwfMvI9stsSgqUa/Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762422333; c=relaxed/simple;
	bh=T1JG3gRzFohCXeutxQ1/hQSof93zQqaQskwwtXst5fI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=k6QSithpy0FYtW8t/5qMfyLV0tXSo9BgiG28Duun2OHfHRJn7DSL3IVahcF6OY4bZpRdJOJuGSGEMK98iVz7wwAln40nBiWY4+hGbW5w5y1KLRH+NKjy7V1WPDwRNb2p2X702TOp5pH+vaYVadFByb7SMvQyexd6ByHSvWsAS3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-94866b3853cso8678139f.3
        for <linux-hams@vger.kernel.org>; Thu, 06 Nov 2025 01:45:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762422330; x=1763027130;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTcgL6H5oY5FCjggOzmzN/zMv4D73ZQd/MUlTuqioEA=;
        b=K2hJY1Fmm5Ec24NbVBHRgaHMUQFklxYkmlMgIGZRNV45lsWgMpkvB1rQYj27gVJDdj
         0C70cMb1chUuvO+Lvo1IzIwaXlXcuH2iQgJDtrm6jayog4JBIEyNtUgpfOP5u+gCLBXS
         CT/cNpv7iDk+sgYDe6PIelVmQ/Buxd854eK9Jy3qyfsd1QP0BMkRZtk6XFyIzBkNooEQ
         /BZC35nWn7L0ty3vIolJv26Ks4N9wBJJq6hYMW4CnevXcm6wwk9F4UGboa4CQvLHSqiE
         Pd7XMnRe6yJEPz1Ho37m9Kpv5iRdrrU1KEpOPlHJyXIbvZfXhRuZLDpG5J+XFWpTpBSL
         tb0g==
X-Forwarded-Encrypted: i=1; AJvYcCUilfCg2Ok65VWzO3uJGqaEGswEHyogVB27CL563EVbAHAtREi0izsxRYVBL8/8TozwR+ZOKU3C8Pmd@vger.kernel.org
X-Gm-Message-State: AOJu0YzlD42CYN7Vlg/ITsCw3y6Zu5aU8X2qT+Gqobi3NxMDnqIrp7Eb
	1j8sGmnSRsiA8fc1LQ2qEj0ZBHRIpcD/89U009JeQrAhlRR10ykmXk9a1oUrqI2VCXakSrjZatB
	76Xk4FVnQuzHtn5LTFCykiDxdO2CWaF1FIasVgqMMylxhtEi9wwmQTXDDRh4=
X-Google-Smtp-Source: AGHT+IG0cB2j9bryLBdBpOtLE59pe4+E5rx7ZQ1JMEg73jOxwVU5mtzuatZQPVVXpnM3zAoO92cxRI9GgLGlEkV958n2FokGzRRi
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6b08:b0:943:5c83:d68e with SMTP id
 ca18e2360f4ac-94869cb498bmr905272739f.1.1762422330444; Thu, 06 Nov 2025
 01:45:30 -0800 (PST)
Date: Thu, 06 Nov 2025 01:45:30 -0800
In-Reply-To: <685d4c2a.a00a0220.2e5631.028c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <690c6e3a.050a0220.3d0d33.0123.GAE@google.com>
Subject: Re: [syzbot] [hams?] possible deadlock in nr_rt_ioctl (2)
From: syzbot <syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com>
To: davem@davemloft.net, eadavis@qq.com, edumazet@google.com, hdanton@sina.com, 
	horms@kernel.org, kuba@kernel.org, linux-hams@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    dc77806cf3b4 Merge tag 'rust-fixes-6.18' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14c0e114580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=609c87dcb0628493
dashboard link: https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17feb812580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15fb5812580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-dc77806c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/eef2d5e8c3fb/vmlinux-dc77806c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e6323f5f18c6/bzImage-dc77806c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com

bond0: (slave rose0): Error: Device is in use and cannot be enslaved
======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz.0.18/6086 is trying to acquire lock:
ffffffff9033ef98 (nr_neigh_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffffffff9033ef98 (nr_neigh_list_lock){+...}-{3:3}, at: nr_remove_neigh net/netrom/nr_route.c:307 [inline]
ffffffff9033ef98 (nr_neigh_list_lock){+...}-{3:3}, at: nr_del_node net/netrom/nr_route.c:342 [inline]
ffffffff9033ef98 (nr_neigh_list_lock){+...}-{3:3}, at: nr_rt_ioctl+0x2007/0x29b0 net/netrom/nr_route.c:678

but task is already holding lock:
ffff88802acfc870 (&nr_node->node_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffff88802acfc870 (&nr_node->node_lock){+...}-{3:3}, at: nr_node_lock include/net/netrom.h:152 [inline]
ffff88802acfc870 (&nr_node->node_lock){+...}-{3:3}, at: nr_del_node net/netrom/nr_route.c:335 [inline]
ffff88802acfc870 (&nr_node->node_lock){+...}-{3:3}, at: nr_rt_ioctl+0x29d/0x29b0 net/netrom/nr_route.c:678

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&nr_node->node_lock){+...}-{3:3}:
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_node_lock include/net/netrom.h:152 [inline]
       nr_del_node net/netrom/nr_route.c:335 [inline]
       nr_rt_ioctl+0x29d/0x29b0 net/netrom/nr_route.c:678
       nr_ioctl+0x19a/0x2d0 net/netrom/af_netrom.c:1254
       sock_do_ioctl+0x118/0x280 net/socket.c:1254
       sock_ioctl+0x227/0x6b0 net/socket.c:1375
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:597 [inline]
       __se_sys_ioctl fs/ioctl.c:583 [inline]
       __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0xfa0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (nr_node_list_lock){+...}-{3:3}:
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_rt_device_down+0xd3/0x810 net/netrom/nr_route.c:517
       nr_device_event+0x126/0x170 net/netrom/af_netrom.c:126
       notifier_call_chain+0xbc/0x410 kernel/notifier.c:85
       call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:2229
       call_netdevice_notifiers_extack net/core/dev.c:2267 [inline]
       call_netdevice_notifiers net/core/dev.c:2281 [inline]
       netif_close_many+0x319/0x630 net/core/dev.c:1784
       netif_close net/core/dev.c:1797 [inline]
       netif_close+0x17f/0x230 net/core/dev.c:1791
       dev_close+0xaa/0x240 net/core/dev_api.c:220
       bpq_device_event+0x6a9/0x910 drivers/net/hamradio/bpqether.c:528
       notifier_call_chain+0xbc/0x410 kernel/notifier.c:85
       call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:2229
       call_netdevice_notifiers_extack net/core/dev.c:2267 [inline]
       call_netdevice_notifiers net/core/dev.c:2281 [inline]
       netif_close_many+0x319/0x630 net/core/dev.c:1784
       netif_close net/core/dev.c:1797 [inline]
       netif_close+0x17f/0x230 net/core/dev.c:1791
       dev_close+0xaa/0x240 net/core/dev_api.c:220
       bond_setup_by_slave drivers/net/bonding/bond_main.c:1567 [inline]
       bond_enslave+0x1e42/0x5de0 drivers/net/bonding/bond_main.c:1972
       bond_do_ioctl+0x601/0x6c0 drivers/net/bonding/bond_main.c:4615
       dev_siocbond net/core/dev_ioctl.c:516 [inline]
       dev_ifsioc+0xe9c/0x1f70 net/core/dev_ioctl.c:666
       dev_ioctl+0x223/0x10e0 net/core/dev_ioctl.c:838
       sock_do_ioctl+0x19d/0x280 net/socket.c:1268
       sock_ioctl+0x227/0x6b0 net/socket.c:1375
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:597 [inline]
       __se_sys_ioctl fs/ioctl.c:583 [inline]
       __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0xfa0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (nr_neigh_list_lock){+...}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3165 [inline]
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x126f/0x1c90 kernel/locking/lockdep.c:5237
       lock_acquire kernel/locking/lockdep.c:5868 [inline]
       lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5825
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_remove_neigh net/netrom/nr_route.c:307 [inline]
       nr_del_node net/netrom/nr_route.c:342 [inline]
       nr_rt_ioctl+0x2007/0x29b0 net/netrom/nr_route.c:678
       nr_ioctl+0x19a/0x2d0 net/netrom/af_netrom.c:1254
       sock_do_ioctl+0x118/0x280 net/socket.c:1254
       sock_ioctl+0x227/0x6b0 net/socket.c:1375
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:597 [inline]
       __se_sys_ioctl fs/ioctl.c:583 [inline]
       __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0xfa0 arch/x86/entry/syscall_64.c:94
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

2 locks held by syz.0.18/6086:
 #0: ffffffff9033eff8 (nr_node_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
 #0: ffffffff9033eff8 (nr_node_list_lock){+...}-{3:3}, at: nr_del_node net/netrom/nr_route.c:334 [inline]
 #0: ffffffff9033eff8 (nr_node_list_lock){+...}-{3:3}, at: nr_rt_ioctl+0x221/0x29b0 net/netrom/nr_route.c:678
 #1: ffff88802acfc870 (&nr_node->node_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
 #1: ffff88802acfc870 (&nr_node->node_lock){+...}-{3:3}, at: nr_node_lock include/net/netrom.h:152 [inline]
 #1: ffff88802acfc870 (&nr_node->node_lock){+...}-{3:3}, at: nr_del_node net/netrom/nr_route.c:335 [inline]
 #1: ffff88802acfc870 (&nr_node->node_lock){+...}-{3:3}, at: nr_rt_ioctl+0x29d/0x29b0 net/netrom/nr_route.c:678

stack backtrace:
CPU: 3 UID: 0 PID: 6086 Comm: syz.0.18 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_circular_bug+0x275/0x350 kernel/locking/lockdep.c:2043
 check_noncircular+0x14c/0x170 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3165 [inline]
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain kernel/locking/lockdep.c:3908 [inline]
 __lock_acquire+0x126f/0x1c90 kernel/locking/lockdep.c:5237
 lock_acquire kernel/locking/lockdep.c:5868 [inline]
 lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5825
 __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
 _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:178
 spin_lock_bh include/linux/spinlock.h:356 [inline]
 nr_remove_neigh net/netrom/nr_route.c:307 [inline]
 nr_del_node net/netrom/nr_route.c:342 [inline]
 nr_rt_ioctl+0x2007/0x29b0 net/netrom/nr_route.c:678
 nr_ioctl+0x19a/0x2d0 net/netrom/af_netrom.c:1254
 sock_do_ioctl+0x118/0x280 net/socket.c:1254
 sock_ioctl+0x227/0x6b0 net/socket.c:1375
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5a58b8f6c9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff0134ba58 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f5a58de5fa0 RCX: 00007f5a58b8f6c9
RDX: 0000200000000680 RSI: 000000000000890c RDI: 000000000000000a
RBP: 00007f5a58c11f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f5a58de5fa0 R14: 00007f5a58de5fa0 R15: 0000000000000003
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

