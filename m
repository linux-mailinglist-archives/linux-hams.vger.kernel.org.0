Return-Path: <linux-hams+bounces-641-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE3EB9D6CF
	for <lists+linux-hams@lfdr.de>; Thu, 25 Sep 2025 07:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B9294A5493
	for <lists+linux-hams@lfdr.de>; Thu, 25 Sep 2025 05:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B932E7F1A;
	Thu, 25 Sep 2025 05:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvRoG9vS"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697DA21ADA7
	for <linux-hams@vger.kernel.org>; Thu, 25 Sep 2025 05:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758777077; cv=none; b=O6H/+OdkGQBzFvJqAothh1AwuL62Um+3MqIMHBnAFNYtHztJBZbD0tpckAcaO0LWUP46U5Rd4GBSdP/A6zZ43mNlS0W93+n+2KIcKp97mEhAsMruFw0b1M+NdzxhCf4JWtaQewnOXQqpcLvIXNSHXUKR5uNuUhbvhSdjdjIVCH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758777077; c=relaxed/simple;
	bh=c4FMzRewIIokmtK1pzb0jNUAZ4tb4g9x531AbMNIMmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XUyux5Cma2fWaFUro7IvvZBoLqL/mGoU0wDp/HOWhPJmFVgs/n0cB2dwhZW0yr5Y583TofMKMEBjec9aUor4HBrQPMaG9esc+WbfyeLFX5G6LXyCMqknc1aJorIgNy8EXNEIPDnYTuNs5OTwTqw9NyVmfsGaSagKjjN1H8ekHf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvRoG9vS; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b4ee87cc81eso550692a12.1
        for <linux-hams@vger.kernel.org>; Wed, 24 Sep 2025 22:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758777074; x=1759381874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=33wRSADo0EqeMuRwMq4UeTMskNZ+kzlt8hrZMx5KCMA=;
        b=cvRoG9vSsLjsv1V3NrP/9rqoUKOx1oC7Mf5PepYmU37KOg97nRZJ83o/eXCVsVK4NB
         Fgvtozp4siOWW9IWgy6bDhx1pUhMj7sghSjtWDIpcapnareycvC0/60LehNMFCAAb3Nf
         BgIAw3x1rSt8vPQASSc9YNvfA5FQwbhnYDeaQ5+/0tB7O4EQ+4J+DSKPzWardBvqYxcl
         /2Isoq/gEFlL8lqJ2RfQr/6oK6r6y14bjZtMVxwwdz1UiEBr8Ortk7A1TXlx2WCcRcxA
         MOAs+AqKb4sOimkOz5iDqaO96n8WofU7BzCn0OR81Wm2XyTlJH/NRvtUF6B7/Ag7C8qm
         R/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758777074; x=1759381874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33wRSADo0EqeMuRwMq4UeTMskNZ+kzlt8hrZMx5KCMA=;
        b=Bj6SGloVgoGZ+Du38ID35g+YBItKF8GTsZXdZCCubd+TX9GyLSW+BwudasrUwusBpG
         JuptmAEsffQYDSqifJT/0Pv+MOcfkQUazTc9NpdZOPm6deRSxNeuKgFwescSz26kkiTq
         vnIC1Uy/DgTT9bXqJxi8FPYdWSmwQhm0UNpyr0w5jhIcIwrrR9rmsY6J10m/VuD77XL+
         ZMKgq8N8/FiERaoHbcVYT0TwjiFxV3BpdClHQYckxMQFuGu1KNppVJItc7xclKepz/GC
         fJ+ChSnxq6CaHSATFDtyvcZ0JpzLsA0UYdrSDGZ8sJNqJPQVId13bhYPkA1J6VFJOjMk
         lwQA==
X-Forwarded-Encrypted: i=1; AJvYcCXoHSegKFYX4snHN6mMBHiBM9RzeQX97FdcBFULPKL0e7p/e3DOadNpvFLdCjJltxHyPXW/vTj+LQlc@vger.kernel.org
X-Gm-Message-State: AOJu0YxR2ipALjc1Ps9PQstfg7nSMzrMtDwGthiYosXFBvrZrSK6iAEb
	/OGs9sqfMYC0g15DVecOiaHd1ckRlhUGTg2r8Nq1JhlYecJQ8N3B/BL+
X-Gm-Gg: ASbGnctVdGokqB+UYh03Kwe5wDjK/A8YaAUz253ayqbFnM234Sm8Wi3GmjUpMi+t6KJ
	Lbz3MmY1O3WjCZE4uKVvs/g4T0sGHRbdBGuEl/j+iRpGovyLNTK7mlyCc0BQgt1xIS/VhLCWe3N
	zZHuABEjLdwCBevRDnQpCKlAmtMxHTRst0L1uIo5w1MJFMKRXfyb9myIb0xq7tPItBdqGswcTQk
	nXqsJXcQaePG4HoTo9UR08TghIxS9lHVdcCegqxiB+7jbB0dJ14i6m7ksWBRTAAVP71tWpfcjxS
	7mV45O6xyKnZ9+isA+w83EnFMC2PiBKb6Yn5KW2N0oMLgymN26H6j6JQTnx+EhRL+Xal/v4Jb1S
	cTTaFXjp/Z4U7dg==
X-Google-Smtp-Source: AGHT+IE12SqFhdSDrT0EvYFuxMNRzaowH2gL0IZazbv1RzBMsx+ZdUDsi8mFp5LXQkIQ5duLkIfVEQ==
X-Received: by 2002:a17:902:c402:b0:25c:d4b6:f119 with SMTP id d9443c01a7336-27ed49df307mr26839895ad.12.1758777073528;
        Wed, 24 Sep 2025 22:11:13 -0700 (PDT)
Received: from gmail.com ([223.166.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d6523sm10904825ad.11.2025.09.24.22.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 22:11:13 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andreas Koensgen <ajk@comnets.uni-bremen.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-hams@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	syzbot+5fd749c74105b0e1b302@syzkaller.appspotmail.com
Subject: [PATCH net-next v2] 6pack: drop redundant locking and refcounting
Date: Thu, 25 Sep 2025 13:10:59 +0800
Message-ID: <20250925051059.26876-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TTY layer already serializes line discipline operations with
tty->ldisc_sem, so the extra disc_data_lock and refcnt in 6pack
are unnecessary.

Removing them simplifies the code and also resolves a lockdep warning
reported by syzbot. The warning did not indicate a real deadlock, since
the write-side lock was only taken in process context with hardirqs
disabled.

Reported-by: syzbot+5fd749c74105b0e1b302@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/68c858b0.050a0220.3c6139.0d1c.GAE@google.com/
Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v2: add Closes tag
 - https://lore.kernel.org/netdev/20250923060706.10232-1-dqfext@gmail.com/

 drivers/net/hamradio/6pack.c | 57 ++++--------------------------------
 1 file changed, 5 insertions(+), 52 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index c5e5423e1863..885992951e8a 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -115,8 +115,6 @@ struct sixpack {
 
 	struct timer_list	tx_t;
 	struct timer_list	resync_t;
-	refcount_t		refcnt;
-	struct completion	dead;
 	spinlock_t		lock;
 };
 
@@ -353,42 +351,13 @@ static void sp_bump(struct sixpack *sp, char cmd)
 
 /* ----------------------------------------------------------------------- */
 
-/*
- * We have a potential race on dereferencing tty->disc_data, because the tty
- * layer provides no locking at all - thus one cpu could be running
- * sixpack_receive_buf while another calls sixpack_close, which zeroes
- * tty->disc_data and frees the memory that sixpack_receive_buf is using.  The
- * best way to fix this is to use a rwlock in the tty struct, but for now we
- * use a single global rwlock for all ttys in ppp line discipline.
- */
-static DEFINE_RWLOCK(disc_data_lock);
-                                                                                
-static struct sixpack *sp_get(struct tty_struct *tty)
-{
-	struct sixpack *sp;
-
-	read_lock(&disc_data_lock);
-	sp = tty->disc_data;
-	if (sp)
-		refcount_inc(&sp->refcnt);
-	read_unlock(&disc_data_lock);
-
-	return sp;
-}
-
-static void sp_put(struct sixpack *sp)
-{
-	if (refcount_dec_and_test(&sp->refcnt))
-		complete(&sp->dead);
-}
-
 /*
  * Called by the TTY driver when there's room for more data.  If we have
  * more packets to send, we send them here.
  */
 static void sixpack_write_wakeup(struct tty_struct *tty)
 {
-	struct sixpack *sp = sp_get(tty);
+	struct sixpack *sp = tty->disc_data;
 	int actual;
 
 	if (!sp)
@@ -400,7 +369,7 @@ static void sixpack_write_wakeup(struct tty_struct *tty)
 		clear_bit(TTY_DO_WRITE_WAKEUP, &tty->flags);
 		sp->tx_enable = 0;
 		netif_wake_queue(sp->dev);
-		goto out;
+		return;
 	}
 
 	if (sp->tx_enable) {
@@ -408,9 +377,6 @@ static void sixpack_write_wakeup(struct tty_struct *tty)
 		sp->xleft -= actual;
 		sp->xhead += actual;
 	}
-
-out:
-	sp_put(sp);
 }
 
 /* ----------------------------------------------------------------------- */
@@ -430,7 +396,7 @@ static void sixpack_receive_buf(struct tty_struct *tty, const u8 *cp,
 	if (!count)
 		return;
 
-	sp = sp_get(tty);
+	sp = tty->disc_data;
 	if (!sp)
 		return;
 
@@ -446,7 +412,6 @@ static void sixpack_receive_buf(struct tty_struct *tty, const u8 *cp,
 	}
 	sixpack_decode(sp, cp, count1);
 
-	sp_put(sp);
 	tty_unthrottle(tty);
 }
 
@@ -561,8 +526,6 @@ static int sixpack_open(struct tty_struct *tty)
 
 	spin_lock_init(&sp->lock);
 	spin_lock_init(&sp->rxlock);
-	refcount_set(&sp->refcnt, 1);
-	init_completion(&sp->dead);
 
 	/* !!! length of the buffers. MTU is IP MTU, not PACLEN!  */
 
@@ -638,19 +601,11 @@ static void sixpack_close(struct tty_struct *tty)
 {
 	struct sixpack *sp;
 
-	write_lock_irq(&disc_data_lock);
 	sp = tty->disc_data;
-	tty->disc_data = NULL;
-	write_unlock_irq(&disc_data_lock);
 	if (!sp)
 		return;
 
-	/*
-	 * We have now ensured that nobody can start using ap from now on, but
-	 * we have to wait for all existing users to finish.
-	 */
-	if (!refcount_dec_and_test(&sp->refcnt))
-		wait_for_completion(&sp->dead);
+	tty->disc_data = NULL;
 
 	/* We must stop the queue to avoid potentially scribbling
 	 * on the free buffers. The sp->dead completion is not sufficient
@@ -673,7 +628,7 @@ static void sixpack_close(struct tty_struct *tty)
 static int sixpack_ioctl(struct tty_struct *tty, unsigned int cmd,
 		unsigned long arg)
 {
-	struct sixpack *sp = sp_get(tty);
+	struct sixpack *sp = tty->disc_data;
 	struct net_device *dev;
 	unsigned int tmp, err;
 
@@ -725,8 +680,6 @@ static int sixpack_ioctl(struct tty_struct *tty, unsigned int cmd,
 		err = tty_mode_ioctl(tty, cmd, arg);
 	}
 
-	sp_put(sp);
-
 	return err;
 }
 
-- 
2.43.0


