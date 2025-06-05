Return-Path: <linux-hams+bounces-520-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED333ACEE28
	for <lists+linux-hams@lfdr.de>; Thu,  5 Jun 2025 12:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED5A518978F5
	for <lists+linux-hams@lfdr.de>; Thu,  5 Jun 2025 10:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75851225A3B;
	Thu,  5 Jun 2025 10:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="O04NL8IO"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6715C20E031;
	Thu,  5 Jun 2025 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120903; cv=none; b=OLLPrnenUW7O/Qcp4hl2UjhwRkKhluypX0mYDJ61QKn2/OqE7/cxzZGURfl7NO1uDq6slsf/buGWMgx0ZddERtW1kjROymPZHsbfGrb8IIeUVBrD8sMBmQuLSakDzcg12GdveSxwEtl+eR69LEODSym+A33NcW3afOJ0um1C1m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120903; c=relaxed/simple;
	bh=BJhDMBKLutN6bQ70rTQ7mqCX0KoexCLwP6/5+3FocaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lSSeJlQk0NXfu2ic+4zi/6mRt++WJeM8nQwZo1DOYM9z+BxUshVTmECDpFamOAu3Nuf+6qe5GgZVaP9IGLFWQY46d7b43J6c7m7rvi70qnDxpAblGcbZ3JAgUcHjcqmtAzOaOZdorqbCHf31xrg7r98YszgUNMEtSqPp5f5+6FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=O04NL8IO; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1749120889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D6G2HkjrkL6nr8Edkp+AWJ29iDqYOc8E5u90Ucockvc=;
	b=O04NL8IOZWVX+Hp8Fr+0MOzb9AibVZvJraKLlbPOeMwZ+/3yf9TcJ1pd/IkKenXOXpPweU
	bocqV6xzzlw9bbSZU4tQthG7/6Ea/7H1SYAxtSigTZqdUigFTw4j5jCFEA+krb0OlOcHZ2
	miPgttWqY2es/PTB4zTU8UlM/LJ7f7I=
To: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Nikita Marushkin <hfggklm@gmail.com>,
	Ilya Shchipletsov <rabbelkin@mail.ru>,
	Hongbo Li <lihongbo22@huawei.com>,
	linux-hams@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org,
	syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com
Subject: [PATCH net] netrom: fix possible deadlock in nr_rt_device_down
Date: Thu,  5 Jun 2025 13:54:48 +0300
Message-ID: <20250605105449.12803-1-arefev@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzkaller detected a possible deadlock in nr_rt_device_down [1]

Locking in concurrent threads can cause deadlock.

           CPU0                           
           ----                           
  nr_rt_device_down()
  |-> spin_lock_bh(&nr_neigh_list_lock);   capture
    . . .
  |-> spin_lock_bh(&nr_node_list_lock);    waiting and deadlock

           CPU1
           ----
  nr_del_node()
  |-> spin_lock_bh(&nr_node_list_lock);    capture
   . . .
  |-> nr_remove_neigh(nr_neigh);
      |-> spin_lock_bh(&nr_neigh_list_lock); waiting for capture

Make sure we always get nr_neigh_list_lock before nr_node_list_lock.

[1]
WARNING: possible circular locking dependency detected
6.15.0-rc2-syzkaller-00278-gfc96b232f8e7 #0 Not tainted
------------------------------------------------------
syz-executor107/6105 is trying to acquire lock:
ffffffff902543b8 (nr_node_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffffffff902543b8 (nr_node_list_lock){+...}-{3:3}, at: nr_rt_device_down+0xb5/0x7b0 net/netrom/nr_route.c:517

but task is already holding lock:
ffffffff90254358 (nr_neigh_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffffffff90254358 (nr_neigh_list_lock){+...}-{3:3}, at: nr_rt_device_down+0x28/0x7b0 net/netrom/nr_route.c:514

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #2 (nr_neigh_list_lock){+...}-{3:3}:
       lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_remove_neigh net/netrom/nr_route.c:307 [inline]
       nr_dec_obs net/netrom/nr_route.c:472 [inline]
       nr_rt_ioctl+0x39a/0xff0 net/netrom/nr_route.c:692
       sock_do_ioctl+0x152/0x400 net/socket.c:1190
       sock_ioctl+0x644/0x900 net/socket.c:1311
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl+0xf1/0x160 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&nr_node->node_lock){+...}-{3:3}:
       lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_node_lock include/net/netrom.h:152 [inline]
       nr_dec_obs net/netrom/nr_route.c:459 [inline]
       nr_rt_ioctl+0x194/0xff0 net/netrom/nr_route.c:692
       sock_do_ioctl+0x152/0x400 net/socket.c:1190
       sock_ioctl+0x644/0x900 net/socket.c:1311
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl+0xf1/0x160 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (nr_node_list_lock){+...}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3166 [inline]
       check_prevs_add kernel/locking/lockdep.c:3285 [inline]
       validate_chain+0xa69/0x24e0 kernel/locking/lockdep.c:3909
       __lock_acquire+0xad5/0xd80 kernel/locking/lockdep.c:5235
       lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_rt_device_down+0xb5/0x7b0 net/netrom/nr_route.c:517
       nr_device_event+0x134/0x150 net/netrom/af_netrom.c:126
       notifier_call_chain+0x1a5/0x3f0 kernel/notifier.c:85
       __dev_notify_flags+0x209/0x410 net/core/dev.c:-1
       netif_change_flags+0xf0/0x1a0 net/core/dev.c:9434
       dev_change_flags+0x146/0x270 net/core/dev_api.c:68
       dev_ioctl+0x80f/0x1260 net/core/dev_ioctl.c:821
       sock_do_ioctl+0x22f/0x400 net/socket.c:1204
       sock_ioctl+0x644/0x900 net/socket.c:1311
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl+0xf1/0x160 fs/ioctl.c:892
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
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

2 locks held by syz-executor107/6105:
 #0: ffffffff900fd788 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #0: ffffffff900fd788 (rtnl_mutex){+.+.}-{4:4}, at: dev_ioctl+0x7fd/0x1260 net/core/dev_ioctl.c:820
 #1: ffffffff90254358 (nr_neigh_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
 #1: ffffffff90254358 (nr_neigh_list_lock){+...}-{3:3}, at: nr_rt_device_down+0x28/0x7b0 net/netrom/nr_route.c:514

stack backtrace:
CPU: 0 UID: 0 PID: 6105 Comm: syz-executor107 Not tainted 6.15.0-rc2-syzkaller-00278-gfc96b232f8e7 #0 PREEMPT(full)
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_circular_bug+0x2e1/0x300 kernel/locking/lockdep.c:2079
 check_noncircular+0x142/0x160 kernel/locking/lockdep.c:2211
 check_prev_add kernel/locking/lockdep.c:3166 [inline]
 check_prevs_add kernel/locking/lockdep.c:3285 [inline]
 validate_chain+0xa69/0x24e0 kernel/locking/lockdep.c:3909
 __lock_acquire+0xad5/0xd80 kernel/locking/lockdep.c:5235
 lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
 __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
 _raw_spin_lock_bh+0x35/0x50 kernel/locking/spinlock.c:178
 spin_lock_bh include/linux/spinlock.h:356 [inline]
 nr_rt_device_down+0xb5/0x7b0 net/netrom/nr_route.c:517
 nr_device_event+0x134/0x150 net/netrom/af_netrom.c:126
 notifier_call_chain+0x1a5/0x3f0 kernel/notifier.c:85
 __dev_notify_flags+0x209/0x410 net/core/dev.c:-1
 netif_change_flags+0xf0/0x1a0 net/core/dev.c:9434
 dev_change_flags+0x146/0x270 net/core/dev_api.c:68
 dev_ioctl+0x80f/0x1260 net/core/dev_ioctl.c:821
 sock_do_ioctl+0x22f/0x400 net/socket.c:1204
 sock_ioctl+0x644/0x900 net/socket.c:1311
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf1/0x160 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reported-by: syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7 
Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 net/netrom/nr_route.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index b94cb2ffbaf8..aae0923dbcf0 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -331,6 +331,7 @@ static int nr_del_node(ax25_address *callsign, ax25_address *neighbour, struct n
 		return -EINVAL;
 	}
 
+	spin_lock_bh(&nr_neigh_list_lock);
 	spin_lock_bh(&nr_node_list_lock);
 	nr_node_lock(nr_node);
 	for (i = 0; i < nr_node->count; i++) {
@@ -339,7 +340,7 @@ static int nr_del_node(ax25_address *callsign, ax25_address *neighbour, struct n
 			nr_neigh_put(nr_neigh);
 
 			if (nr_neigh->count == 0 && !nr_neigh->locked)
-				nr_remove_neigh(nr_neigh);
+				nr_remove_neigh_locked(nr_neigh);
 			nr_neigh_put(nr_neigh);
 
 			nr_node->count--;
@@ -361,13 +362,14 @@ static int nr_del_node(ax25_address *callsign, ax25_address *neighbour, struct n
 			}
 			nr_node_unlock(nr_node);
 			spin_unlock_bh(&nr_node_list_lock);
-
+			spin_unlock_bh(&nr_neigh_list_lock);
 			return 0;
 		}
 	}
 	nr_neigh_put(nr_neigh);
 	nr_node_unlock(nr_node);
 	spin_unlock_bh(&nr_node_list_lock);
+	spin_unlock_bh(&nr_neigh_list_lock);
 	nr_node_put(nr_node);
 
 	return -EINVAL;
-- 
2.43.0


