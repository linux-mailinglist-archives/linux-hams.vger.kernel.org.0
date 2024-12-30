Return-Path: <linux-hams+bounces-458-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 303A49FE20A
	for <lists+linux-hams@lfdr.de>; Mon, 30 Dec 2024 03:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A4E63A1C55
	for <lists+linux-hams@lfdr.de>; Mon, 30 Dec 2024 02:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DB013AA3E;
	Mon, 30 Dec 2024 02:36:21 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364242AF04
	for <linux-hams@vger.kernel.org>; Mon, 30 Dec 2024 02:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735526181; cv=none; b=QUtzfs6GV/fb9ulpsUeJhYcCMDZZsLaD0Tk/ExB/ByIIpe5y0jtmeU91kzeyoZjXikQRsXzvPvfcCzsen1gqOAnxGDZ5dfJU7P++gJHHnxJT8jVpJwZzmHYBtxOu8FeANH8Tf6EH4I7QDIvl2Qxyf3wxkPd1veyNHTtS92lMvLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735526181; c=relaxed/simple;
	bh=AAex1vwLjtyFnFBS/VWuuc0wR/fsqUuC2MnEn+zeYBo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=iw1qaho9pRBsNyaLENSU3VXeSF2EAm4jReT6gPcGYNd/lYSZ/Zf2lrwdnIRlnTsb287wEOMKSEdavvXJdvFZRAHjuV9QOQzGAXyzyZhaABpuJTllljTINusJ8eZ/zZSKWT0tueyyHR2UT3vuhVWC8d2yEcQ8+/g9nox47TkCD/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3a7e4bfae54so86128095ab.0
        for <linux-hams@vger.kernel.org>; Sun, 29 Dec 2024 18:36:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735526178; x=1736130978;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oS6vXvKEsJYLLHGQLNWVwGR1z8uRjTiHLXlW2aW0wbU=;
        b=O69O7tLKnn1HCNwwo1/ZykbKejHMYpJMRJWasFEQcrpmmIoX/eNrZ5DQ5zW1227lAP
         0+pSbvSOl9tc8huHQNSc2fx7PMLzEARtpzZ2au1mMKS/DtKB7QFl70CsiZjPHrx46/bB
         W8U98eew4NXJnJBEgiA0Veg4Kf/RKYYO7x/hMQqpzyTf1tOeeNlS9f8T/CjS121EG6CZ
         TmNiQBHqoiFynnguV0Sy7vgFhpuHRfc01ckLuk1dqEH+VCCLZiCXCOBTsNf0CSU8CTGO
         r1CAGmWi/V0Ydz6J/9vq3TZEkLvwdcjGao7BWpEUvZXTrSp+ORMfmedAP6AmkY3pKH6R
         Vqxw==
X-Forwarded-Encrypted: i=1; AJvYcCVPnSt94obHGV5cB9FQN2u1PKteNGpYoTEmFly+Xk/yYuopmesoFusNxHV+2S4k/lqAyPN3tMHo6jO7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9vWgi59/eNxFXEL8m14yedopMaLCazYR6svnqindzcm91Ppes
	M8sksOMkw6gTrzD6pueYNpWeWD0fOpyk2CXQ5HSnVIdeg6ig0RTesqSt9tMIkoPpQjX+v/tt4ut
	5sdz84gIRfGIxkB89CiooCzR217HRMpskz1602JSJb3H9Q0yf564Kf10=
X-Google-Smtp-Source: AGHT+IGF46cyHl/0GKSnuPgUgnaLZU5LFLRYESpagt856Z11El2MrqFzp9AwPR5kxEOBGvLqqflPjASoQI0zpcjDrwo81G3wqx8k
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1705:b0:3a7:e800:7d36 with SMTP id
 e9e14a558f8ab-3c2d2279c01mr280785475ab.10.1735526178397; Sun, 29 Dec 2024
 18:36:18 -0800 (PST)
Date: Sun, 29 Dec 2024 18:36:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67720722.050a0220.2f3838.04b4.GAE@google.com>
Subject: [syzbot] [hams?] possible deadlock in nr_remove_neigh (2)
From: syzbot <syzbot+8863ad36d31449b4dc17@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    059dd502b263 Merge tag 'block-6.13-20241228' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=150b2af8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aa8dc22aa6de51f5
dashboard link: https://syzkaller.appspot.com/bug?extid=8863ad36d31449b4dc17
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/27659a620a43/disk-059dd502.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/996b6ce6c350/vmlinux-059dd502.xz
kernel image: https://storage.googleapis.com/syzbot-assets/094cd4888c06/bzImage-059dd502.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8863ad36d31449b4dc17@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.13.0-rc4-syzkaller-00078-g059dd502b263 #0 Not tainted
------------------------------------------------------
syz.2.1275/10378 is trying to acquire lock:
ffffffff90129eb8 (nr_neigh_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffffffff90129eb8 (nr_neigh_list_lock){+...}-{3:3}, at: nr_remove_neigh+0x1a/0x290 net/netrom/nr_route.c:307

but task is already holding lock:
ffff88802369c470 (&nr_node->node_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffff88802369c470 (&nr_node->node_lock){+...}-{3:3}, at: nr_node_lock include/net/netrom.h:152 [inline]
ffff88802369c470 (&nr_node->node_lock){+...}-{3:3}, at: nr_add_node+0x60b/0x2be0 net/netrom/nr_route.c:214

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
       call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:1996
       call_netdevice_notifiers_extack net/core/dev.c:2034 [inline]
       call_netdevice_notifiers net/core/dev.c:2048 [inline]
       dev_close_many+0x333/0x6a0 net/core/dev.c:1589
       dev_close net/core/dev.c:1611 [inline]
       dev_close+0x181/0x230 net/core/dev.c:1605
       bpq_device_event+0x820/0xaf0 drivers/net/hamradio/bpqether.c:547
       notifier_call_chain+0xb7/0x410 kernel/notifier.c:85
       call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:1996
       call_netdevice_notifiers_extack net/core/dev.c:2034 [inline]
       call_netdevice_notifiers net/core/dev.c:2048 [inline]
       dev_close_many+0x333/0x6a0 net/core/dev.c:1589
       dev_close net/core/dev.c:1611 [inline]
       dev_close+0x181/0x230 net/core/dev.c:1605
       bond_setup_by_slave drivers/net/bonding/bond_main.c:1631 [inline]
       bond_enslave+0x1f67/0x6040 drivers/net/bonding/bond_main.c:2043
       bond_do_ioctl+0x60e/0x6d0 drivers/net/bonding/bond_main.c:4685
       dev_siocbond net/core/dev_ioctl.c:471 [inline]
       dev_ifsioc+0x1ea/0x10b0 net/core/dev_ioctl.c:613
       dev_ioctl+0x224/0x10c0 net/core/dev_ioctl.c:783
       sock_do_ioctl+0x19e/0x280 net/socket.c:1223
       sock_ioctl+0x228/0x6c0 net/socket.c:1328
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
       call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:1996
       call_netdevice_notifiers_extack net/core/dev.c:2034 [inline]
       call_netdevice_notifiers net/core/dev.c:2048 [inline]
       dev_close_many+0x333/0x6a0 net/core/dev.c:1589
       dev_close net/core/dev.c:1611 [inline]
       dev_close+0x181/0x230 net/core/dev.c:1605
       bpq_device_event+0x820/0xaf0 drivers/net/hamradio/bpqether.c:547
       notifier_call_chain+0xb7/0x410 kernel/notifier.c:85
       call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:1996
       call_netdevice_notifiers_extack net/core/dev.c:2034 [inline]
       call_netdevice_notifiers net/core/dev.c:2048 [inline]
       dev_close_many+0x333/0x6a0 net/core/dev.c:1589
       dev_close net/core/dev.c:1611 [inline]
       dev_close+0x181/0x230 net/core/dev.c:1605
       bond_setup_by_slave drivers/net/bonding/bond_main.c:1631 [inline]
       bond_enslave+0x1f67/0x6040 drivers/net/bonding/bond_main.c:2043
       bond_do_ioctl+0x60e/0x6d0 drivers/net/bonding/bond_main.c:4685
       dev_siocbond net/core/dev_ioctl.c:471 [inline]
       dev_ifsioc+0x1ea/0x10b0 net/core/dev_ioctl.c:613
       dev_ioctl+0x224/0x10c0 net/core/dev_ioctl.c:783
       sock_do_ioctl+0x19e/0x280 net/socket.c:1223
       sock_ioctl+0x228/0x6c0 net/socket.c:1328
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl fs/ioctl.c:892 [inline]
       __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (nr_neigh_list_lock){+...}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3161 [inline]
       check_prevs_add kernel/locking/lockdep.c:3280 [inline]
       validate_chain kernel/locking/lockdep.c:3904 [inline]
       __lock_acquire+0x249e/0x3c40 kernel/locking/lockdep.c:5226
       lock_acquire.part.0+0x11b/0x380 kernel/locking/lockdep.c:5849
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_remove_neigh+0x1a/0x290 net/netrom/nr_route.c:307
       nr_add_node+0x23d1/0x2be0 net/netrom/nr_route.c:249
       nr_rt_ioctl+0x126e/0x29e0 net/netrom/nr_route.c:651
       nr_ioctl+0x19a/0x2e0 net/netrom/af_netrom.c:1254
       sock_do_ioctl+0x116/0x280 net/socket.c:1209
       sock_ioctl+0x228/0x6c0 net/socket.c:1328
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

1 lock held by syz.2.1275/10378:
 #0: ffff88802369c470 (&nr_node->node_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
 #0: ffff88802369c470 (&nr_node->node_lock){+...}-{3:3}, at: nr_node_lock include/net/netrom.h:152 [inline]
 #0: ffff88802369c470 (&nr_node->node_lock){+...}-{3:3}, at: nr_add_node+0x60b/0x2be0 net/netrom/nr_route.c:214

stack backtrace:
CPU: 0 UID: 0 PID: 10378 Comm: syz.2.1275 Not tainted 6.13.0-rc4-syzkaller-00078-g059dd502b263 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_circular_bug+0x419/0x5d0 kernel/locking/lockdep.c:2074
 check_noncircular+0x31a/0x400 kernel/locking/lockdep.c:2206
 check_prev_add kernel/locking/lockdep.c:3161 [inline]
 check_prevs_add kernel/locking/lockdep.c:3280 [inline]
 validate_chain kernel/locking/lockdep.c:3904 [inline]
 __lock_acquire+0x249e/0x3c40 kernel/locking/lockdep.c:5226
 lock_acquire.part.0+0x11b/0x380 kernel/locking/lockdep.c:5849
 __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
 _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:178
 spin_lock_bh include/linux/spinlock.h:356 [inline]
 nr_remove_neigh+0x1a/0x290 net/netrom/nr_route.c:307
 nr_add_node+0x23d1/0x2be0 net/netrom/nr_route.c:249
 nr_rt_ioctl+0x126e/0x29e0 net/netrom/nr_route.c:651
 nr_ioctl+0x19a/0x2e0 net/netrom/af_netrom.c:1254
 sock_do_ioctl+0x116/0x280 net/socket.c:1209
 sock_ioctl+0x228/0x6c0 net/socket.c:1328
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f66b7b85d29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f66b89c2038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f66b7d76080 RCX: 00007f66b7b85d29
RDX: 0000000020000280 RSI: 000000000000890b RDI: 0000000000000004
RBP: 00007f66b7c01b08 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f66b7d76080 R15: 00007fff012efa98
 </TASK>
bond0: (slave rose0): Error: Device is in use and cannot be enslaved


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

