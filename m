Return-Path: <linux-hams+bounces-424-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 178699792F8
	for <lists+linux-hams@lfdr.de>; Sat, 14 Sep 2024 20:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98B381F21013
	for <lists+linux-hams@lfdr.de>; Sat, 14 Sep 2024 18:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2321D1312;
	Sat, 14 Sep 2024 18:32:35 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A07C1E489
	for <linux-hams@vger.kernel.org>; Sat, 14 Sep 2024 18:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726338755; cv=none; b=CO1Bhgvj0pmaRB8bGyI64YVF8pHwRiIaj2/Mqs604nqeczVXnCIB1FL4JX4NK3usIeAu3balQS/szFcbvYZIo+cgfuUqRyvAcPhTuuzO26lzrs8gfMJ68B+QJWCNKx5090RHv3dZUNhbjsKKTRTCfVvSFd/1YqIo6JvjMabhuH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726338755; c=relaxed/simple;
	bh=4NzyaYcFLyFdiwFlH1SF4vhTsrTJ+gOMxR6mOjJ10TY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=PHQxlkPJeoI8ZrLuZX1zzCC5R8hFSEP4azTIb63uUqzyn61SVs0efopDGzeUMHc5SHmAQCUiZ59xfaKbVHGMsWIQt3/0hkMFNwWe8DAP1Jb//4WI9+Eq8hhzzZrEUAKtfU6nF5Qzt6lDBEh+85TkKTlaiJ+5tYvGb9e7dXnOTBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-82cfa70028fso720489339f.1
        for <linux-hams@vger.kernel.org>; Sat, 14 Sep 2024 11:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726338752; x=1726943552;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vCk7m8bdTlsEaBcbvj4x/KUx6uyEvQuBhZ5cw+5b2WI=;
        b=iCtVqtkx37CACMqJ48bTYUW45XWp/ebKQ2J3rNsx9iPmXDLhsXsSPsxoTS3I6JGFGh
         Si65NGOXTzkBe3JO4pLUEOGrCHxXbOlXk6t0LkIkqhiUfi9/VqCjH27v+i3KvBYhqWYC
         XsyZUlumrODspCiyucMrv7sDh8peFyQ7m6C16wElB8UdfYhG4B7maC+HNWlUuvks19xZ
         7G6R5iSWpws5Kuo1FRMKiA6efCvz6zwZTetmZ/k3kNT4yd4SNSb4jAYeGm3Fj6KZsqa3
         mX7gRhyMM2XD4wpqwr167s9XaDYYF5rseH3cURfZ8aXDDExOdythu3UZ+5zYvxSwFIV+
         M4yw==
X-Forwarded-Encrypted: i=1; AJvYcCULVR7Q33uMNDCLgfrp3b2l42nTjHP3FQRW5eY/bUdVCwmFT9v/4A5BEvzd8WTRXZWEhNTDeIt0oFe7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw86y27U82FHLqozSPnVoSovFeMD1C9o6z9Ji7HnbNLjZbT3tDW
	2vlHFJhcwgMgCyfqp5ZGkMIWD/WOv6okY3sqj3rYvnx8EgbdcBcujzjZ/Uc9carYQLXqqWGTwY6
	B6/ws9oQjT0FBsM3ok6JUACcK75itng2cx102qlcwq3PwLUiyC0rtI6M=
X-Google-Smtp-Source: AGHT+IHxfv/r6206/lgRVgpCntlAQjD6LhnnFmcb01k6yxsxSfB4NczYR/dBfZGAaVKF2C2l3+Akv3WNu1DvjkO7Gq66zDDgSjMc
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d88:b0:395:e85e:f2fa with SMTP id
 e9e14a558f8ab-3a084611b38mr89973065ab.1.1726338752490; Sat, 14 Sep 2024
 11:32:32 -0700 (PDT)
Date: Sat, 14 Sep 2024 11:32:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001abfb506221890b2@google.com>
Subject: [syzbot] [hams?] possible deadlock in nr_rt_device_down (3)
From: syzbot <syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4c8002277167 fou: fix initialization of grc
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=10513877980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=660f6eb11f9c7dc5
dashboard link: https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9058e311cdd1/disk-4c800227.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1659255894d5/vmlinux-4c800227.xz
kernel image: https://storage.googleapis.com/syzbot-assets/04227ccb2e58/bzImage-4c800227.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.11.0-rc6-syzkaller-00180-g4c8002277167 #0 Not tainted
------------------------------------------------------
syz.1.4509/22182 is trying to acquire lock:
ffffffff8fde86d8 (nr_node_list_lock){+...}-{2:2}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffffffff8fde86d8 (nr_node_list_lock){+...}-{2:2}, at: nr_rt_device_down+0xb5/0x7b0 net/netrom/nr_route.c:517

but task is already holding lock:
ffffffff8fde8678 (nr_neigh_list_lock){+...}-{2:2}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffffffff8fde8678 (nr_neigh_list_lock){+...}-{2:2}, at: nr_rt_device_down+0x28/0x7b0 net/netrom/nr_route.c:514

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (nr_neigh_list_lock){+...}-{2:2}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_remove_neigh net/netrom/nr_route.c:307 [inline]
       nr_dec_obs net/netrom/nr_route.c:472 [inline]
       nr_rt_ioctl+0x398/0xfb0 net/netrom/nr_route.c:692
       sock_do_ioctl+0x158/0x460 net/socket.c:1222
       sock_ioctl+0x629/0x8e0 net/socket.c:1341
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:907 [inline]
       __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:893
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&nr_node->node_lock){+...}-{2:2}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_node_lock include/net/netrom.h:152 [inline]
       nr_dec_obs net/netrom/nr_route.c:459 [inline]
       nr_rt_ioctl+0x192/0xfb0 net/netrom/nr_route.c:692
       sock_do_ioctl+0x158/0x460 net/socket.c:1222
       sock_ioctl+0x629/0x8e0 net/socket.c:1341
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:907 [inline]
       __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:893
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (nr_node_list_lock){+...}-{2:2}:
       check_prev_add kernel/locking/lockdep.c:3133 [inline]
       check_prevs_add kernel/locking/lockdep.c:3252 [inline]
       validate_chain+0x18e0/0x5900 kernel/locking/lockdep.c:3868
       __lock_acquire+0x137a/0x2040 kernel/locking/lockdep.c:5142
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_rt_device_down+0xb5/0x7b0 net/netrom/nr_route.c:517
       nr_device_event+0x134/0x150 net/netrom/af_netrom.c:126
       notifier_call_chain+0x19f/0x3e0 kernel/notifier.c:93
       call_netdevice_notifiers_extack net/core/dev.c:2032 [inline]
       call_netdevice_notifiers net/core/dev.c:2046 [inline]
       dev_close_many+0x33c/0x4c0 net/core/dev.c:1587
       dev_close+0x1c0/0x2c0 net/core/dev.c:1609
       bpq_device_event+0x372/0x8b0 drivers/net/hamradio/bpqether.c:547
       notifier_call_chain+0x19f/0x3e0 kernel/notifier.c:93
       __dev_notify_flags+0x207/0x400
       dev_change_flags+0xf0/0x1a0 net/core/dev.c:8915
       dev_ifsioc+0x7c8/0xe70 net/core/dev_ioctl.c:527
       dev_ioctl+0x719/0x1340 net/core/dev_ioctl.c:784
       sock_do_ioctl+0x240/0x460 net/socket.c:1236
       sock_ioctl+0x629/0x8e0 net/socket.c:1341
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:907 [inline]
       __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:893
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

2 locks held by syz.1.4509/22182:
 #0: ffffffff8fc8be48 (rtnl_mutex){+.+.}-{3:3}, at: dev_ioctl+0x706/0x1340 net/core/dev_ioctl.c:783
 #1: ffffffff8fde8678 (nr_neigh_list_lock){+...}-{2:2}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
 #1: ffffffff8fde8678 (nr_neigh_list_lock){+...}-{2:2}, at: nr_rt_device_down+0x28/0x7b0 net/netrom/nr_route.c:514

stack backtrace:
CPU: 1 UID: 0 PID: 22182 Comm: syz.1.4509 Not tainted 6.11.0-rc6-syzkaller-00180-g4c8002277167 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:93 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:119
 check_noncircular+0x36a/0x4a0 kernel/locking/lockdep.c:2186
 check_prev_add kernel/locking/lockdep.c:3133 [inline]
 check_prevs_add kernel/locking/lockdep.c:3252 [inline]
 validate_chain+0x18e0/0x5900 kernel/locking/lockdep.c:3868
 __lock_acquire+0x137a/0x2040 kernel/locking/lockdep.c:5142
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
 __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
 _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
 spin_lock_bh include/linux/spinlock.h:356 [inline]
 nr_rt_device_down+0xb5/0x7b0 net/netrom/nr_route.c:517
 nr_device_event+0x134/0x150 net/netrom/af_netrom.c:126
 notifier_call_chain+0x19f/0x3e0 kernel/notifier.c:93
 call_netdevice_notifiers_extack net/core/dev.c:2032 [inline]
 call_netdevice_notifiers net/core/dev.c:2046 [inline]
 dev_close_many+0x33c/0x4c0 net/core/dev.c:1587
 dev_close+0x1c0/0x2c0 net/core/dev.c:1609
 bpq_device_event+0x372/0x8b0 drivers/net/hamradio/bpqether.c:547
 notifier_call_chain+0x19f/0x3e0 kernel/notifier.c:93
 __dev_notify_flags+0x207/0x400
 dev_change_flags+0xf0/0x1a0 net/core/dev.c:8915
 dev_ifsioc+0x7c8/0xe70 net/core/dev_ioctl.c:527
 dev_ioctl+0x719/0x1340 net/core/dev_ioctl.c:784
 sock_do_ioctl+0x240/0x460 net/socket.c:1236
 sock_ioctl+0x629/0x8e0 net/socket.c:1341
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fdcda77def9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fdcdb4b4038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fdcda935f80 RCX: 00007fdcda77def9
RDX: 0000000020000700 RSI: 0000000000008914 RDI: 000000000000000b
RBP: 00007fdcda7f09f6 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fdcda935f80 R15: 00007ffe2567ade8
 </TASK>


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

