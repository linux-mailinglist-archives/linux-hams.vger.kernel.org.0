Return-Path: <linux-hams+bounces-481-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB249A64B42
	for <lists+linux-hams@lfdr.de>; Mon, 17 Mar 2025 11:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70C113A31E2
	for <lists+linux-hams@lfdr.de>; Mon, 17 Mar 2025 10:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85994235375;
	Mon, 17 Mar 2025 10:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="p+VdAfW2"
X-Original-To: linux-hams@vger.kernel.org
Received: from ksmg02.maxima.ru (ksmg02.maxima.ru [81.200.124.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4753A38DD8;
	Mon, 17 Mar 2025 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.200.124.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742208925; cv=none; b=l0pU0VGptVtC5QjGhZ8PXgq1ttejdFzzaW/TWY6eG90pg5+VxqyuKqrFVEy//gC3bGJN0zCLUnMeP5O+auTdF1d7k4do31ngi1ey/n+A2D0yt//KTbXBO2IuFxDFoWFC5J2S35xwX6YwjfQyYlbXU8QXPbUWilb9HDkTjuhr0yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742208925; c=relaxed/simple;
	bh=iSJkqmvbpB3JMwQgPR0cfXGE9pxa4Is0Ta0HqVFVxTw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hSd7cx7k8Jy4BLYJoXRgJw0/bm6Ycygh3zp9+jw4XBlpRXxuaNWT2auX0XL0ycXO6ATAyJGbJ3HOZ5X0ClFwvQ+WyPTX8lJkyHbjNSaxL8inCl+r65llMxpokZDR4Vv2yB0uFMa4uS9BBdHF2TZoXITyqBbIF00Re16ohBzKlQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru; spf=pass smtp.mailfrom=mt-integration.ru; dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b=p+VdAfW2; arc=none smtp.client-ip=81.200.124.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt-integration.ru
Received: from ksmg02.maxima.ru (localhost [127.0.0.1])
	by ksmg02.maxima.ru (Postfix) with ESMTP id 36FBF1E0008;
	Mon, 17 Mar 2025 13:55:12 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg02.maxima.ru 36FBF1E0008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
	s=sl; t=1742208912; bh=d7t7HcGDv3eC8v3jJtrr1V6WrxNJcqQgvMQo8uuswlI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=p+VdAfW2oK0Fgl/+ac0tLGZJeuw7L4tw/biEMfQwCn+6rtJvuygB3m4dl/zjs6Vqd
	 w3BoT36vhFcvzvVee9FzViCPcetQpqXjWYs+BFwlm+en5bd5mYLWDUR3KI4jGnLs7O
	 ibZrQfVJctzgfLkqp97Jtg/m8HbrkHFAaQhr1X/Y5y5cmWQLWqlwZJoMRKI+2pcDvl
	 /id0rFUvmN2o7ANri8ktx2tRCiiSvRiRYVG/Kmjw7AjFPkrZpLatWrNvvjv6h/3YN/
	 E8Mt2zaQHH0x48mDNMZolhfPQXC0yHTkOgSNkkWPp1JvqoL7uZ/mN4Fsxr6luwTEmZ
	 4bT2K9IudeOpw==
Received: from ksmg02.maxima.ru (mail.maxima.ru [81.200.124.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.maxima.ru", Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
	by ksmg02.maxima.ru (Postfix) with ESMTPS;
	Mon, 17 Mar 2025 13:55:12 +0300 (MSK)
Received: from GS-NOTE-190.mt.ru (10.0.246.183) by mmail-p-exch02.mt.ru
 (81.200.124.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.4; Mon, 17 Mar
 2025 13:55:10 +0300
From: Murad Masimov <m.masimov@mt-integration.ru>
To: "David S. Miller" <davem@davemloft.net>
CC: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Joerg
 Reuter <jreuter@yaina.de>, Kuniyuki Iwashima <kuniyu@amazon.com>, Murad
 Masimov <m.masimov@mt-integration.ru>, <linux-hams@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>,
	<syzbot+33841dc6aa3e1d86b78a@syzkaller.appspotmail.com>
Subject: [PATCH] ax25: Remove broken autobind
Date: Mon, 17 Mar 2025 13:53:52 +0300
Message-ID: <20250317105352.412-1-m.masimov@mt-integration.ru>
X-Mailer: git-send-email 2.46.0.windows.1
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mt-exch-01.mt.ru (91.220.120.210) To mmail-p-exch02.mt.ru
 (81.200.124.62)
X-KSMG-AntiPhishing: NotDetected, bases: 2025/03/17 09:30:00
X-KSMG-AntiSpam-Auth: dmarc=none header.from=mt-integration.ru;spf=none smtp.mailfrom=mt-integration.ru;dkim=none
X-KSMG-AntiSpam-Envelope-From: m.masimov@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {rep_avail}, {Tracking_one_url}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, 81.200.124.62:7.1.2;mt-integration.ru:7.1.1;127.0.0.199:7.1.2;ksmg02.maxima.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;syzkaller.appspot.com:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 81.200.124.62
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 191835 [Mar 17 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/03/17 05:57:00 #27790323
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2025/03/17 09:27:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 7

Binding AX25 socket by using the autobind feature leads to memory leaks
in ax25_connect() and also refcount leaks in ax25_release(). Memory
leak was detected with kmemleak:

================================================================
unreferenced object 0xffff8880253cd680 (size 96):
backtrace:
__kmalloc_node_track_caller_noprof (./include/linux/kmemleak.h:43)
kmemdup_noprof (mm/util.c:136)
ax25_rt_autobind (net/ax25/ax25_route.c:428)
ax25_connect (net/ax25/af_ax25.c:1282)
__sys_connect_file (net/socket.c:2045)
__sys_connect (net/socket.c:2064)
__x64_sys_connect (net/socket.c:2067)
do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83)
entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
================================================================

When socket is bound, refcounts must be incremented the way it is done
in ax25_bind() and ax25_setsockopt() (SO_BINDTODEVICE). In case of
autobind, the refcounts are not incremented.

This bug leads to the following issue reported by Syzkaller:

================================================================
ax25_connect(): syz-executor318 uses autobind, please contact jreuter@yaina.de
------------[ cut here ]------------
refcount_t: decrement hit 0; leaking memory.
WARNING: CPU: 0 PID: 5317 at lib/refcount.c:31 refcount_warn_saturate+0xfa/0x1d0 lib/refcount.c:31
Modules linked in:
CPU: 0 UID: 0 PID: 5317 Comm: syz-executor318 Not tainted 6.14.0-rc4-syzkaller-00278-gece144f151ac #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:refcount_warn_saturate+0xfa/0x1d0 lib/refcount.c:31
...
Call Trace:
 <TASK>
 __refcount_dec include/linux/refcount.h:336 [inline]
 refcount_dec include/linux/refcount.h:351 [inline]
 ref_tracker_free+0x6af/0x7e0 lib/ref_tracker.c:236
 netdev_tracker_free include/linux/netdevice.h:4302 [inline]
 netdev_put include/linux/netdevice.h:4319 [inline]
 ax25_release+0x368/0x960 net/ax25/af_ax25.c:1080
 __sock_release net/socket.c:647 [inline]
 sock_close+0xbc/0x240 net/socket.c:1398
 __fput+0x3e9/0x9f0 fs/file_table.c:464
 __do_sys_close fs/open.c:1580 [inline]
 __se_sys_close fs/open.c:1565 [inline]
 __x64_sys_close+0x7f/0x110 fs/open.c:1565
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
 ...
 </TASK>
================================================================

Considering the issues above and the comments left in the code that say:
"check if we can remove this feature. It is broken."; "autobinding in this
may or may not work"; - it is better to completely remove this feature than
to fix it because it is broken and leads to various kinds of memory bugs.

Now calling connect() without first binding socket will result in an
error (-EINVAL). Userspace software that relies on the autobind feature
might get broken. However, this feature does not seem widely used with
this specific driver as it was not reliable at any point of time, and it
is already broken anyway. E.g. ax25-tools and ax25-apps packages for
popular distributions do not use the autobind feature for AF_AX25.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+33841dc6aa3e1d86b78a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=33841dc6aa3e1d86b78a
Signed-off-by: Murad Masimov <m.masimov@mt-integration.ru>
---
 include/net/ax25.h    |  1 -
 net/ax25/af_ax25.c    | 30 ++++++------------
 net/ax25/ax25_route.c | 74 -------------------------------------------
 3 files changed, 10 insertions(+), 95 deletions(-)

diff --git a/include/net/ax25.h b/include/net/ax25.h
index 4ee141aae0a2..a7bba42dde15 100644
--- a/include/net/ax25.h
+++ b/include/net/ax25.h
@@ -418,7 +418,6 @@ void ax25_rt_device_down(struct net_device *);
 int ax25_rt_ioctl(unsigned int, void __user *);
 extern const struct seq_operations ax25_rt_seqops;
 ax25_route *ax25_get_route(ax25_address *addr, struct net_device *dev);
-int ax25_rt_autobind(ax25_cb *, ax25_address *);
 struct sk_buff *ax25_rt_build_path(struct sk_buff *, ax25_address *,
 				   ax25_address *, ax25_digi *);
 void ax25_rt_free(void);
diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 9f3b8b682adb..3ee7dba34310 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1270,28 +1270,18 @@ static int __must_check ax25_connect(struct socket *sock,
 		}
 	}

-	/*
-	 *	Must bind first - autobinding in this may or may not work. If
-	 *	the socket is already bound, check to see if the device has
-	 *	been filled in, error if it hasn't.
-	 */
+	/* Must bind first - autobinding does not work. */
 	if (sock_flag(sk, SOCK_ZAPPED)) {
-		/* check if we can remove this feature. It is broken. */
-		printk(KERN_WARNING "ax25_connect(): %s uses autobind, please contact jreuter@yaina.de\n",
-			current->comm);
-		if ((err = ax25_rt_autobind(ax25, &fsa->fsa_ax25.sax25_call)) < 0) {
-			kfree(digi);
-			goto out_release;
-		}
+		kfree(digi);
+		err = -EINVAL;
+		goto out_release;
+	}

-		ax25_fillin_cb(ax25, ax25->ax25_dev);
-		ax25_cb_add(ax25);
-	} else {
-		if (ax25->ax25_dev == NULL) {
-			kfree(digi);
-			err = -EHOSTUNREACH;
-			goto out_release;
-		}
+	/* Check to see if the device has been filled in, error if it hasn't. */
+	if (ax25->ax25_dev == NULL) {
+		kfree(digi);
+		err = -EHOSTUNREACH;
+		goto out_release;
 	}

 	if (sk->sk_type == SOCK_SEQPACKET &&
diff --git a/net/ax25/ax25_route.c b/net/ax25/ax25_route.c
index 69de75db0c9c..10577434f40b 100644
--- a/net/ax25/ax25_route.c
+++ b/net/ax25/ax25_route.c
@@ -373,80 +373,6 @@ ax25_route *ax25_get_route(ax25_address *addr, struct net_device *dev)
 	return ax25_rt;
 }

-/*
- *	Adjust path: If you specify a default route and want to connect
- *      a target on the digipeater path but w/o having a special route
- *	set before, the path has to be truncated from your target on.
- */
-static inline void ax25_adjust_path(ax25_address *addr, ax25_digi *digipeat)
-{
-	int k;
-
-	for (k = 0; k < digipeat->ndigi; k++) {
-		if (ax25cmp(addr, &digipeat->calls[k]) == 0)
-			break;
-	}
-
-	digipeat->ndigi = k;
-}
-
-
-/*
- *	Find which interface to use.
- */
-int ax25_rt_autobind(ax25_cb *ax25, ax25_address *addr)
-{
-	ax25_uid_assoc *user;
-	ax25_route *ax25_rt;
-	int err = 0;
-
-	ax25_route_lock_use();
-	ax25_rt = ax25_get_route(addr, NULL);
-	if (!ax25_rt) {
-		ax25_route_lock_unuse();
-		return -EHOSTUNREACH;
-	}
-	rcu_read_lock();
-	if ((ax25->ax25_dev = ax25_dev_ax25dev(ax25_rt->dev)) == NULL) {
-		err = -EHOSTUNREACH;
-		goto put;
-	}
-
-	user = ax25_findbyuid(current_euid());
-	if (user) {
-		ax25->source_addr = user->call;
-		ax25_uid_put(user);
-	} else {
-		if (ax25_uid_policy && !capable(CAP_NET_BIND_SERVICE)) {
-			err = -EPERM;
-			goto put;
-		}
-		ax25->source_addr = *(ax25_address *)ax25->ax25_dev->dev->dev_addr;
-	}
-
-	if (ax25_rt->digipeat != NULL) {
-		ax25->digipeat = kmemdup(ax25_rt->digipeat, sizeof(ax25_digi),
-					 GFP_ATOMIC);
-		if (ax25->digipeat == NULL) {
-			err = -ENOMEM;
-			goto put;
-		}
-		ax25_adjust_path(addr, ax25->digipeat);
-	}
-
-	if (ax25->sk != NULL) {
-		local_bh_disable();
-		bh_lock_sock(ax25->sk);
-		sock_reset_flag(ax25->sk, SOCK_ZAPPED);
-		bh_unlock_sock(ax25->sk);
-		local_bh_enable();
-	}
-
-put:
-	rcu_read_unlock();
-	ax25_route_lock_unuse();
-	return err;
-}

 struct sk_buff *ax25_rt_build_path(struct sk_buff *skb, ax25_address *src,
 	ax25_address *dest, ax25_digi *digi)
--
2.39.2


