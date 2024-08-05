Return-Path: <linux-hams+bounces-382-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5C494797D
	for <lists+linux-hams@lfdr.de>; Mon,  5 Aug 2024 12:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19F861C21213
	for <lists+linux-hams@lfdr.de>; Mon,  5 Aug 2024 10:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFB715E5C1;
	Mon,  5 Aug 2024 10:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+FZoTC+"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55646156C62;
	Mon,  5 Aug 2024 10:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722853269; cv=none; b=ZzTFwMAMh7tIxtZGNH/N8EOjZrZc1iBtPqjZQzcIk7s+PBtIiZtfdp+50edbmQxqJiM4g/u6DbG8Eo4rhxQ9saSqPKnr0MN1153Wfbdsj7LpT3jeJgKDmR3+fvf3ubC/Sn/QDWsyQn7+obeFD98Ebg+KVESC9B8CzoNS/52Hn20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722853269; c=relaxed/simple;
	bh=/O2/TlWp3zMCUKUw2fsXXmxsmDVNGJDzCxv0rpypKf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f6IyuTtz3edn9roO9NsENopudVKa4RmIOki87cE04KdKiHCuNBOEJJ/PxsKi+QVLMkZwRYYbBkLkPjUGDb6Ejg/v2vosZtlkvQGfiMxcLpD9tnoVlWZDzVZbUT2cvagbayG+XTsnkvwpzj3+n3OBB4O8nYtFdFILbDeZfnGJxQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+FZoTC+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E40A4C4AF10;
	Mon,  5 Aug 2024 10:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722853269;
	bh=/O2/TlWp3zMCUKUw2fsXXmxsmDVNGJDzCxv0rpypKf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N+FZoTC+68x2Ffbm/j8evQ8oJ0Bu+jSjLMPny1gejiLok5T0S8NhgAhA7iv5a4+uX
	 8bqlzR8jbcE6J3DZfcyERozXAncaedmmJu9C9Uhd0RGJDYH/s28lR0++hH1IGC21GM
	 3ichC/HKPZADvktqDBT/iz4trfEKKuSKqKKolynWhfPvf6A1DSPmJx+mpwgI9eupUK
	 hJKZi2+3hMoT2vaAUFWp5AeA5mN4QGVH1EBRvsdZPL4FG9URkXZ58Sal2RdNy/DciZ
	 T3E7+ebGh84DfyVd0WAXzJ46PL+yjXbKoFxQ2Nh5K1cJdecy8Fowit5s3rwy9Ux1ZE
	 6MAnm8zSmiImw==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Andreas Koensgen <ajk@comnets.uni-bremen.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-hams@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 09/13] 6pack: remove sixpack::rbuff
Date: Mon,  5 Aug 2024 12:20:42 +0200
Message-ID: <20240805102046.307511-10-jirislaby@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240805102046.307511-1-jirislaby@kernel.org>
References: <20240805102046.307511-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's unused (except allocation and free).

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andreas Koensgen <ajk@comnets.uni-bremen.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org
---
 drivers/net/hamradio/6pack.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index 6ed38a3cdd73..29906901a734 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -88,7 +88,6 @@ struct sixpack {
 	struct net_device	*dev;		/* easy for intr handling  */
 
 	/* These are pointers to the malloc()ed frame buffers. */
-	unsigned char		*rbuff;		/* receiver buffer	*/
 	int			rcount;         /* received chars counter  */
 	unsigned char		*xbuff;		/* transmitter buffer	*/
 	unsigned char		*xhead;         /* next byte to XMIT */
@@ -544,7 +543,7 @@ static inline int tnc_init(struct sixpack *sp)
  */
 static int sixpack_open(struct tty_struct *tty)
 {
-	char *rbuff = NULL, *xbuff = NULL;
+	char *xbuff = NULL;
 	struct net_device *dev;
 	struct sixpack *sp;
 	unsigned long len;
@@ -574,10 +573,8 @@ static int sixpack_open(struct tty_struct *tty)
 
 	len = dev->mtu * 2;
 
-	rbuff = kmalloc(len + 4, GFP_KERNEL);
 	xbuff = kmalloc(len + 4, GFP_KERNEL);
-
-	if (rbuff == NULL || xbuff == NULL) {
+	if (xbuff == NULL) {
 		err = -ENOBUFS;
 		goto out_free;
 	}
@@ -586,7 +583,6 @@ static int sixpack_open(struct tty_struct *tty)
 
 	sp->tty = tty;
 
-	sp->rbuff	= rbuff;
 	sp->xbuff	= xbuff;
 
 	sp->mtu		= AX25_MTU + 73;
@@ -631,7 +627,6 @@ static int sixpack_open(struct tty_struct *tty)
 
 out_free:
 	kfree(xbuff);
-	kfree(rbuff);
 
 	free_netdev(dev);
 
@@ -676,7 +671,6 @@ static void sixpack_close(struct tty_struct *tty)
 	del_timer_sync(&sp->resync_t);
 
 	/* Free all 6pack frame buffers after unreg. */
-	kfree(sp->rbuff);
 	kfree(sp->xbuff);
 
 	free_netdev(sp->dev);
-- 
2.46.0


