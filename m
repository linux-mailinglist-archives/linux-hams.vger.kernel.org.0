Return-Path: <linux-hams+bounces-383-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2421947985
	for <lists+linux-hams@lfdr.de>; Mon,  5 Aug 2024 12:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E25131C21240
	for <lists+linux-hams@lfdr.de>; Mon,  5 Aug 2024 10:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC1115ECED;
	Mon,  5 Aug 2024 10:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/cvscT6"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C3315ECD7;
	Mon,  5 Aug 2024 10:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722853272; cv=none; b=BRc2YLgc1C1tHBiJ6OGBnH+PTEiLKzlNE8UHI0J6fVzKcTeTLHOEIzJter5UMHiYcFIPtIR1OZIUugbKgdhVntO+yTPVmtrLya3okE/D9f+6ko61XpcytTReyKVRUPp0oikNOU9poWvM8kt3rsTJ1aZ1UzyUi2Btdm+2OzzTEJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722853272; c=relaxed/simple;
	bh=Y/kZ6pKUemi1ebXpTMHlyUEYKL9YeGqV57QiLnAlE98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LIY+M0GOe6KL3Cy16kMSUAN6gmJpv8tl5nI1BS+QRRjVqh9a985kHbqK26TWsklHOr2hZSwI2wVeGeDiP44PGlAdleqLHQ+8/PY0E2+IpZO73Xona2bo7TlcHwFnvkJN0k4Jq84GvWNZpaU8+m+zrkYFhVBEH3cSrQzQW0LUsQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/cvscT6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3955C4AF0D;
	Mon,  5 Aug 2024 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722853272;
	bh=Y/kZ6pKUemi1ebXpTMHlyUEYKL9YeGqV57QiLnAlE98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A/cvscT6e4SLxEeXha5o18ZK46G7glG9XZgCfau+ksJVZytwWXVHuaVPeKjjpOFKK
	 CZUY+DKhf6WApVNIdoZU9bkSspTVBS54v1gR/9OqFCxjZiDUXa+5w4XkgKPoTAKMGA
	 ZXDXebW/IXtiCZE93tNttP6MXEw7R4PRIEMzkO6TdlKBcctQ4+GMc2xcqMhKkfHMF3
	 DyIzLOr4skAnvnJ1rN8tu2UhHXjshdmuYJe+I1RfSVFNwNNaxushxjlgyD+inoUOwp
	 AHIxVxA6w9Hjvlt/hIZns+MKOfj2noQb+VdvW0QKnQ3cGEFFyFNjjSvQRy46vt9ZbS
	 1jARtj3o1Tn9A==
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
Subject: [PATCH 10/13] 6pack: drop sixpack::mtu
Date: Mon,  5 Aug 2024 12:20:43 +0200
Message-ID: <20240805102046.307511-11-jirislaby@kernel.org>
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


