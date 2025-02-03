Return-Path: <linux-hams+bounces-473-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DF1A2558A
	for <lists+linux-hams@lfdr.de>; Mon,  3 Feb 2025 10:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CE863A2EE2
	for <lists+linux-hams@lfdr.de>; Mon,  3 Feb 2025 09:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D411FC7FF;
	Mon,  3 Feb 2025 09:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="P125CUKK"
X-Original-To: linux-hams@vger.kernel.org
Received: from ksmg02.maxima.ru (ksmg02.maxima.ru [81.200.124.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1506288B1;
	Mon,  3 Feb 2025 09:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.200.124.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573973; cv=none; b=io6yGr/220+WIEdtfFHdAjLIMbIms/j1AK9RWOmcSSQHfRxFR4qA+BLkqNEkM+qssTTyHJ/NoWpeQMFg57bUgak25cUHGHw+mm86bcqWbgLFtyIHo77epseHw6U1geCS7VKdf691yZACxUUUEwfqmizh1iVL42yMHMz0v7n61Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573973; c=relaxed/simple;
	bh=qU9KXRq+H2Z1sv2iZph3rQ1H/PzmLspdXPrOSKfyQ5A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hL9vAAInPhT2PFOKQetoaZkTAUxMU4M89M+9jAkWnBoXTdnBlWN3pwV9QC7YXag1DnhKdmETUvld1QH9wXtnK5BCu4Xye+x49y8hOvj4siA0ne+2rWExKD7XHPywSCYxItUKV9T3MS+CI7c0XsMLf3wzVsAs+LeNWYJfaGy8FWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru; spf=pass smtp.mailfrom=mt-integration.ru; dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b=P125CUKK; arc=none smtp.client-ip=81.200.124.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt-integration.ru
Received: from ksmg02.maxima.ru (localhost [127.0.0.1])
	by ksmg02.maxima.ru (Postfix) with ESMTP id B1F3B1E0006;
	Mon,  3 Feb 2025 12:12:39 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg02.maxima.ru B1F3B1E0006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
	s=sl; t=1738573959; bh=daXqeLp8l6RQ2s3+98xXPxQ0X3qczwkmRnhtEpYSICY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=P125CUKKGzyoh4PE3QieGXX0BAVtED5hSL8VPxkD0yYdWgAcNwdwKX+OOkzr7r3Yg
	 RThqFjVMmZt2C54WSkK2DJcHT2WWNhciu9D24nPYM6DCUuJoeWYttQAzGmEbOMZdry
	 V51CpTsWcaKV2xt/nKiDkwWi3Mv9whtttg6PX5Ylo4xDqxFxq+MRDbi8JB66CIPfw8
	 yibGP7mJuKQ78MYQo01HknF4PJvkpymdeV6KJgi2HBeLTedkOD/NEYmq2QX0+daW0s
	 PR/Zc8M+KhCNAqmcstQumv0rcH6AHvl2UuKLV+gBYyejgo+edDp1Ci3l9AC9JebQoX
	 5rNkR6mChrAHA==
Received: from ksmg02.maxima.ru (autodiscover.maxima.ru [81.200.124.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.maxima.ru", Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
	by ksmg02.maxima.ru (Postfix) with ESMTPS;
	Mon,  3 Feb 2025 12:12:39 +0300 (MSK)
Received: from GS-NOTE-190.mt.ru (10.0.247.120) by mmail-p-exch02.mt.ru
 (81.200.124.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.4; Mon, 3 Feb 2025
 12:12:37 +0300
From: Murad Masimov <m.masimov@mt-integration.ru>
To: Joerg Reuter <jreuter@yaina.de>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Duoming Zhou
	<duoming@zju.edu.cn>, <linux-hams@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, Murad Masimov
	<m.masimov@mt-integration.ru>, <stable@vger.kernel.org>,
	<syzbot+33841dc6aa3e1d86b78a@syzkaller.appspotmail.com>
Subject: [PATCH] ax25: Fix refcount leak caused by setting SO_BINDTODEVICE sockopt
Date: Mon, 3 Feb 2025 12:12:03 +0300
Message-ID: <20250203091203.1744-1-m.masimov@mt-integration.ru>
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
X-KSMG-AntiPhishing: NotDetected, bases: 2025/02/03 08:24:00
X-KSMG-AntiSpam-Auth: dmarc=none header.from=mt-integration.ru;spf=none smtp.mailfrom=mt-integration.ru;dkim=none
X-KSMG-AntiSpam-Envelope-From: m.masimov@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 50 0.3.50 df4aeb250ed63fd3baa80a493fa6caee5dd9e10f, {rep_avail}, {Tracking_one_url, url3}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, mt-integration.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;81.200.124.62:7.1.2;ksmg02.maxima.ru:7.1.1;syzkaller.appspot.com:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 81.200.124.62
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 190746 [Feb 03 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/02/03 07:33:00 #27201296
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2025/02/03 08:24:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 7

If an AX25 device is bound to a socket by setting the SO_BINDTODEVICE
socket option, a refcount leak will occur in ax25_release().

Commit 9fd75b66b8f6 ("ax25: Fix refcount leaks caused by ax25_cb_del()")
added decrement of device refcounts in ax25_release(). In order for that
to work correctly the refcounts must already be incremented when the
device is bound to the socket. An AX25 device can be bound to a socket
by either calling ax25_bind() or setting SO_BINDTODEVICE socket option.
In both cases the refcounts should be incremented, but in fact it is done
only in ax25_bind().

This bug leads to the following issue reported by Syzkaller:

================================================================
refcount_t: decrement hit 0; leaking memory.
WARNING: CPU: 1 PID: 5932 at lib/refcount.c:31 refcount_warn_saturate+0x1ed/0x210 lib/refcount.c:31
Modules linked in:
CPU: 1 UID: 0 PID: 5932 Comm: syz-executor424 Not tainted 6.13.0-rc4-syzkaller-00110-g4099a71718b0 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:refcount_warn_saturate+0x1ed/0x210 lib/refcount.c:31
Call Trace:
 <TASK>
 __refcount_dec include/linux/refcount.h:336 [inline]
 refcount_dec include/linux/refcount.h:351 [inline]
 ref_tracker_free+0x710/0x820 lib/ref_tracker.c:236
 netdev_tracker_free include/linux/netdevice.h:4156 [inline]
 netdev_put include/linux/netdevice.h:4173 [inline]
 netdev_put include/linux/netdevice.h:4169 [inline]
 ax25_release+0x33f/0xa10 net/ax25/af_ax25.c:1069
 __sock_release+0xb0/0x270 net/socket.c:640
 sock_close+0x1c/0x30 net/socket.c:1408
 ...
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
 ...
 </TASK>
================================================================

Fix the implementation of ax25_setsockopt() by adding increment of
refcounts for the new device bound, and decrement of refcounts for
the old unbound device.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: 9fd75b66b8f6 ("ax25: Fix refcount leaks caused by ax25_cb_del()")
Cc: stable@vger.kernel.org
Reported-by: syzbot+33841dc6aa3e1d86b78a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=33841dc6aa3e1d86b78a
Signed-off-by: Murad Masimov <m.masimov@mt-integration.ru>
---
 net/ax25/af_ax25.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index aa6c714892ec..9f3b8b682adb 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -685,6 +685,15 @@ static int ax25_setsockopt(struct socket *sock, int level, int optname,
 			break;
 		}

+		if (ax25->ax25_dev) {
+			if (dev == ax25->ax25_dev->dev) {
+				rcu_read_unlock();
+				break;
+			}
+			netdev_put(ax25->ax25_dev->dev, &ax25->dev_tracker);
+			ax25_dev_put(ax25->ax25_dev);
+		}
+
 		ax25->ax25_dev = ax25_dev_ax25dev(dev);
 		if (!ax25->ax25_dev) {
 			rcu_read_unlock();
@@ -692,6 +701,8 @@ static int ax25_setsockopt(struct socket *sock, int level, int optname,
 			break;
 		}
 		ax25_fillin_cb(ax25, ax25->ax25_dev);
+		netdev_hold(dev, &ax25->dev_tracker, GFP_ATOMIC);
+		ax25_dev_hold(ax25->ax25_dev);
 		rcu_read_unlock();
 		break;

--
2.39.2


