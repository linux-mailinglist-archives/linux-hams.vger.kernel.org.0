Return-Path: <linux-hams+bounces-636-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F607B9480E
	for <lists+linux-hams@lfdr.de>; Tue, 23 Sep 2025 08:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3810418A2C29
	for <lists+linux-hams@lfdr.de>; Tue, 23 Sep 2025 06:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6774D30E84F;
	Tue, 23 Sep 2025 06:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFNm/XXN"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D8725B1CE
	for <linux-hams@vger.kernel.org>; Tue, 23 Sep 2025 06:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758607643; cv=none; b=Sxc/4XtZhXl2sqtd1lf2ZQStVduiNadWeyo7YF4gHUmHGgCivJmViUrFvhyL9vGCQLsaZDoJIrrm9uF3GXzv9ADkTNqbDgZdq5QwpUiiie6d4hB76q/n28zAmr+LqVtWXAc2+BjTriSVubQDHu4iviriWRnDcrIo7KCGXxY+bQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758607643; c=relaxed/simple;
	bh=zIeebnKmD1CpAB3zNGRBqSsvaYPYnjzbweCaU4XO9wo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UISHaMuTsrPnTkepqBJ+adtcLcbxBZrEEOUHqIafz9n0QJdKm1tdY9cmMZ4NmSm6DLeSeNz4Ek6FO+LQUOtWx0HEj3yqeBQvX2dqHxk7szYerdZQ2E41YLZ69Wkts6LwjuMKCOyKrtSFXd290tS1OFITft8xRueiDmcMMRNvmy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFNm/XXN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-27d3540a43fso2815625ad.3
        for <linux-hams@vger.kernel.org>; Mon, 22 Sep 2025 23:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758607641; x=1759212441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+3LxoSV41O4pRbEmBipgFoQjHZW3/tDYocGhgDPfNrI=;
        b=TFNm/XXNFQvkuneWejVqEaiiob8bpxD+jiYbY7fgW7Ih4W7ePK6k7UNl6PJQcT1f4X
         Tu8CrgkHPeiCsd18R0Eck8k61uPEw1NAzCu0yCGUC6dwjqapxKqYHCA9t5iBDE3Wsv+E
         3TD9vBL3ZXO0iR8igNq8AFU9XqnP76N+Fnzf7Fst875/BKsXVl1hqiEx5FmBVUpirFqV
         YEg5FdifwcsJarNhSU0Hmi5Dbq3577eBm6fBwwcbexFOPWcGKHG1ve8mVur17WcvMYYg
         WsN0kWXSfBupIBLoRD9np0B2mFmlUdGtdcMQdPxfn+A19EdTjHrzt4Wn+117y6++9+kE
         OtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758607641; x=1759212441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3LxoSV41O4pRbEmBipgFoQjHZW3/tDYocGhgDPfNrI=;
        b=ZcEOjvYzOH6J9gaJOFSyMmdjPDUEe322SfPqMrwIsQI0zHfb15Ml6w0f/Ox55DeNyo
         tRDiEsC5HuevRlkfQ3yGGk9vZK5zw/k/qefOTzqJiJ5F07zox1PUQbaddugcTH+bd4M/
         EcwzbIR+xm95FmVNMOPnoiUqIv+rGLJaoWRJNIfpGEpUOhkolGn7rkX1RMigqWzwT7nX
         w/JBJvYybU3gZmvq5cFFqa2nuLKU0lNrdoaFHVpkKCcBbc7h0pvGUa4WIurOL94JlbDy
         jx1BiRnPBV4S/4CDi3NXiKUFpUarVuq+l3gmBB9eBcBK9ceiz5h+C9xWYJV5ytqdArGg
         y4Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVdUZvlSsdgCuBeeMQCBcqdM8E1XYvgAorSgh7EObBnmp1QgnaYky7OaUycWEZQ5XlbuhdPyGYXtP4i@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq7q/hI3enylA5mIGRVRwBUg8Ev3qxhT6rSladH9wn4LmwMLKb
	4eA+Y9UereLLZ49QnGR75YTrkq2+Y6iUWUu19T8IFMYMWyWYgNiIQ6tP
X-Gm-Gg: ASbGncsMOiRdvGTCaZwcXzbvK4Nti8n005NQP9xYJ83FJhUws07jF6HGkNGRCkkNsUH
	2ior8gvW7MIWiBaLDGbDkm/LO2BxwHDS83Rcaga7VFUR4F8FvnxOdyN8HiDvCJ8QBlEmRGprjQx
	X5+6VNoVRjJw3XD6MMcVbUdeWmAkHTkDr6FOnqpak25G+q3tIf8zro424ePgCSfwRV+Z02m82T+
	dQ+LTJFHCA0n8K/sCOrIXipgbbYs0Gwl9P+tz6V6+FImWRlE1R120ZJalbAR8YbFaQO6tJUBgvi
	n/89z1zktRg87PG/aU1oS51E3J8F7ZWqDqIobsETsewJ1nVv2V3RT3HyAINEvJzLcK5aGTNt13z
	kNKMLilMv9FsAhA==
X-Google-Smtp-Source: AGHT+IG9wVckl3J02PgzQlOHGCMc4gEZihFiU2EGjoVZPsvunoSERLnJSklfDM/IenyZlf2m3S479g==
X-Received: by 2002:a17:903:2c0b:b0:275:b1cf:6dd7 with SMTP id d9443c01a7336-27cc48a0b06mr16117835ad.34.1758607640874;
        Mon, 22 Sep 2025 23:07:20 -0700 (PDT)
Received: from gmail.com ([223.166.84.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3306064edb8sm15220223a91.7.2025.09.22.23.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 23:07:20 -0700 (PDT)
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
Cc: syzbot+5fd749c74105b0e1b302@syzkaller.appspotmail.com
Subject: [PATCH net-next] 6pack: drop redundant locking and refcounting
Date: Tue, 23 Sep 2025 14:07:06 +0800
Message-ID: <20250923060706.10232-1-dqfext@gmail.com>
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
Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
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


