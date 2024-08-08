Return-Path: <linux-hams+bounces-390-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E4894BB51
	for <lists+linux-hams@lfdr.de>; Thu,  8 Aug 2024 12:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EF1028116C
	for <lists+linux-hams@lfdr.de>; Thu,  8 Aug 2024 10:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F71518DF66;
	Thu,  8 Aug 2024 10:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdXVePb6"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CE918CC16;
	Thu,  8 Aug 2024 10:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723113369; cv=none; b=S2Jy8sZT4cZgPi7JKFIQxrE1BNnhIkr3v9eTgGPTFynJWeCfvQnMVnZlkacIZvYgx1rJbFYjFKEMDkexS2hwJFuGEi3O9Lxhrs3WwN4WOKI9aJpbMs+ZktryP4CaVAycFky1AiMcGTa+hC2WAGgkVsRmMhQ6Xr0qTitSA7ipmGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723113369; c=relaxed/simple;
	bh=/O2/TlWp3zMCUKUw2fsXXmxsmDVNGJDzCxv0rpypKf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D5UfK8X/rj+JEKXXkRP78Ito+4NAQIOQS6SeGxWYvdCkvO3s2QZHJj8ryv/HCZe4sDFWn4Wl7Vrvf1E8GlhoA+9HppQniklE00SK7+Vg4mEl3aCWT0ZIj+AK8Teg+SZUK5qJFkrpcyYSnyae1Yok/VyAA8oJ3lPWo9B3scsIUMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdXVePb6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD53C4AF0E;
	Thu,  8 Aug 2024 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723113368;
	bh=/O2/TlWp3zMCUKUw2fsXXmxsmDVNGJDzCxv0rpypKf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mdXVePb6Di/RNjoDYR5nYcSdStYML/nClj+vPvH71JFE8fbx2mLJZxbvmXmj8z4AY
	 HpKn3mjVAD8VdATVmE6XhMdVr5Ow2LEDt12Y6P3zj73fnMwd7expUInpUi1gm35PDj
	 VEJNsUyvWDCbd33bFyqL2BVrqsqTyzoOJQBZKCqVLX1rIP4wfDBSM+txgQocIO99tS
	 bV1tiQdnqag99+u1NySc+u/PdFheuot0f0XvVHMU8/d0I/k7YjTuFCL/G8N8GW8C34
	 wPIoOb88vIHOQvAWGCpJJnjbV0RXTJ4HslocuTOpJ35W1GZGfPYa0d0LfS03WetjhQ
	 NB0LwL0OGbJog==
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
Subject: [PATCH v2 07/11] 6pack: remove sixpack::rbuff
Date: Thu,  8 Aug 2024 12:35:43 +0200
Message-ID: <20240808103549.429349-8-jirislaby@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240808103549.429349-1-jirislaby@kernel.org>
References: <20240808103549.429349-1-jirislaby@kernel.org>
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


