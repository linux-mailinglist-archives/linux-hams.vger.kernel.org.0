Return-Path: <linux-hams+bounces-391-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2E094BB57
	for <lists+linux-hams@lfdr.de>; Thu,  8 Aug 2024 12:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 822911F22E0C
	for <lists+linux-hams@lfdr.de>; Thu,  8 Aug 2024 10:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2503918DF97;
	Thu,  8 Aug 2024 10:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="It5DTZ7l"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD12618DF83;
	Thu,  8 Aug 2024 10:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723113371; cv=none; b=FQ9BtLP0lFPpr8wzaIZt8KCLgf34qYOzzUhQsvt/iAb1lDPHCYOanUJCjDpPed78fXU4Em2F/3kCfJTdOfTyubMV2uikq2nV/t7eV7bTaQ0eCP7REdcnjdaiBFtPQrWjVKm0erYJ69zINfzA4hV9oHxxsfkTbNKrsvefQhFjjNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723113371; c=relaxed/simple;
	bh=Y/kZ6pKUemi1ebXpTMHlyUEYKL9YeGqV57QiLnAlE98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V7XcC7JPPNkX+h+z8nHvnkbOOts2AmMUXYjIbPCnqHkn1ekh+5exqtZanFf3U7QQ0ZbJTiP1GTve4Qbh4A2N4gZFEGVhFs6MHGqVuGRgUKUbvF/KmxgseRaNycPRAjUH10G/ajGIb2sG20FXx+yOki5r9Y5NF+wmooGWkIUoXqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=It5DTZ7l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7F2C4AF0D;
	Thu,  8 Aug 2024 10:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723113371;
	bh=Y/kZ6pKUemi1ebXpTMHlyUEYKL9YeGqV57QiLnAlE98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=It5DTZ7l/sA5ueD/unBsBOvGe19RYLsCYi+EtQwfEWNjolcw6/KF8r0KHDJd7S+Ro
	 ObKgy0j2U2OUvPYa2Hag9OSr4mpqjV6i39V/zaQTGH/sCfZA0Fje+JKMElUmWwKgQs
	 MSsNFCtZzX7keFFx+FCh82H9SE41Kko/rZ3TPb3i1fk+vRzb9Yn3S16CuIdt8IRXWa
	 kvcIC4iVZ4J5x2sV4yZNBlva39jbLZjp2/V7hJy9o2iyXhhV2A2TeKxroTzeOtWQ3R
	 UEdGCHD9cNqu0iajGfKB6XI6Fz0xEqLHg5tHazqlq7e7o3rSp0lOSjNoFxznEND7rY
	 xkKAC1+LcBi8w==
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
Subject: [PATCH v2 08/11] 6pack: drop sixpack::mtu
Date: Thu,  8 Aug 2024 12:35:44 +0200
Message-ID: <20240808103549.429349-9-jirislaby@kernel.org>
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

It holds a constant (AX25_MTU + 73), so use that constant in place of
the single use directly.

And remove the stale comment.

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
 drivers/net/hamradio/6pack.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index 29906901a734..f8235b1b60e9 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -100,7 +100,6 @@ struct sixpack {
 	unsigned int		rx_count_cooked;
 	spinlock_t		rxlock;
 
-	int			mtu;		/* Our mtu (to spot changes!) */
 	int			buffsize;       /* Max buffers sizes */
 
 	unsigned long		flags;		/* Flag values/ mode etc */
@@ -166,7 +165,7 @@ static void sp_encaps(struct sixpack *sp, unsigned char *icp, int len)
 	unsigned char *msg, *p = icp;
 	int actual, count;
 
-	if (len > sp->mtu) {	/* sp->mtu = AX25_MTU = max. PACLEN = 256 */
+	if (len > AX25_MTU + 73) {
 		msg = "oversized transmit packet!";
 		goto out_drop;
 	}
@@ -585,7 +584,6 @@ static int sixpack_open(struct tty_struct *tty)
 
 	sp->xbuff	= xbuff;
 
-	sp->mtu		= AX25_MTU + 73;
 	sp->buffsize	= len;
 	sp->rcount	= 0;
 	sp->rx_count	= 0;
-- 
2.46.0


