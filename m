Return-Path: <linux-hams+bounces-699-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED8CC09BB1
	for <lists+linux-hams@lfdr.de>; Sat, 25 Oct 2025 18:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E4BE54F8228
	for <lists+linux-hams@lfdr.de>; Sat, 25 Oct 2025 16:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BCB322C7F;
	Sat, 25 Oct 2025 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pwh/i1eT"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A104322C7B;
	Sat, 25 Oct 2025 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409749; cv=none; b=A7WxaiTAqZecE0tzx0CBSVE0ZdA7AY/dXV6WOITAbgwv5co+1gvYVNfA4oZfuWN9R2eiZgYfEi6q14kacGyhOAfzS7tYJt5Jni76dQIfU8mBRR01az9A5lZI+xBGexMIG509Q2yvSBM6/WtCw9PhZo7HbChvFBUqxrY4e3qCK1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409749; c=relaxed/simple;
	bh=Vu+wD33d1YlGxDkl7HpSd6DylFyUTaEPLabn+LJ72NU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LyrWF1ay4DsmxiVZpNS4iIOTcaaYArc3UIV1oJhBioI44uAfXpVEoDxQb3J2FzwvqY6O4xzTXvWIkXPN0UWETeZKqEPnRKznltu5IWYHTWGQCaSMNz7p6LN7S6Vr+yvxv26gLhkGFvp19PbCQPE1ZYZbJ8ez1oPKnTDUJf+i/ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pwh/i1eT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A27EC4CEFB;
	Sat, 25 Oct 2025 16:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409749;
	bh=Vu+wD33d1YlGxDkl7HpSd6DylFyUTaEPLabn+LJ72NU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pwh/i1eTLQ2buPI7odlOaTHqCi9yQKKKawWBsuBvN4k8iVTqukd7XIqXzwr4gB6nq
	 6+I5gzvxOBkStpYe1MEBS4FGIR7X+jRrVXIICMzDY+3yZ5l39a9yPhufNO5LlWnAuc
	 JsMVrTzqxSm0QIOm0oB9v4nzCG+rTiD9NvlcGoQ5tCzUgJjOdQlYXArCARr9Ss3K2Q
	 OFfaOVfEfODzW/rudnUaWbo3JsVDy1Bnc+9aiIkDQIA+glj31bym+1AEHC5dZ8DviB
	 q6QikycSaWtmHjPI94Qg2nL+crY1rFv8zunuEuQcU25kdrGjk9t06OSui2oR/nP2qc
	 dyV+mhwjzS4/w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Qingfang Deng <dqfext@gmail.com>,
	syzbot+5fd749c74105b0e1b302@syzkaller.appspotmail.com,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	ajk@comnets.uni-bremen.de,
	linux-hams@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.1] 6pack: drop redundant locking and refcounting
Date: Sat, 25 Oct 2025 12:01:19 -0400
Message-ID: <20251025160905.3857885-448-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Qingfang Deng <dqfext@gmail.com>

[ Upstream commit 38b04ed7072e54086102eae2d05d03ffcdb4b695 ]

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
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
Link: https://patch.msgid.link/20250925051059.26876-1-dqfext@gmail.com
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES
- The patch only touches the 6pack line discipline: it drops the private
  rwlock/refcount machinery from `drivers/net/hamradio/6pack.c` (see the
  struct changes at lines 101-118 and the updated consumers at 358-379,
  390-415, 600-683). Those sites now read `tty->disc_data` directly, but
  every entry point already executes under the TTY core’s
  `tty->ldisc_sem` read lock—`tty_port_default_receive_buf()` grabs it
  via `tty_ldisc_ref()` (`drivers/tty/tty_port.c:23-41`), `tty_wakeup()`
  does the same before calling `write_wakeup`
  (`drivers/tty/tty_io.c:507-517`), and `tty_ioctl()` surrounds
  `ld->ops->ioctl` with `tty_ldisc_ref_wait()`/`tty_ldisc_deref()`
  (`drivers/tty/tty_io.c:2796-2805`).
- `sixpack_close()` is invoked with the write side of that semaphore
  held (`drivers/tty/tty_ldisc.c:449-455`), so removing the
  refcount/`completion` still guarantees all in-flight readers finish
  before the netdev teardown in `sixpack_close()`
  (`drivers/net/hamradio/6pack.c:600-624`). Timers continue to be shut
  down with `timer_delete_sync()`, so there are no other async users
  left racing with the free.
- This is a pure locking cleanup that fixes a syzbot lockdep warning
  without changing behaviour or adding dependencies. Stable kernels
  already provide the same `tty_ldisc_*` lifetime rules, so the backport
  is mechanically straightforward and low risk.
- I looked through the remaining call sites and found no paths that
  access `tty->disc_data` without the TTY helpers, so the behavioural
  surface is unchanged aside from the warning disappearing.

 drivers/net/hamradio/6pack.c | 57 ++++--------------------------------
 1 file changed, 5 insertions(+), 52 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index c5e5423e18633..885992951e8a6 100644
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
2.51.0


