Return-Path: <linux-hams+bounces-393-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C7894BB63
	for <lists+linux-hams@lfdr.de>; Thu,  8 Aug 2024 12:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 426BA1F23A94
	for <lists+linux-hams@lfdr.de>; Thu,  8 Aug 2024 10:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B508818E77F;
	Thu,  8 Aug 2024 10:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAb341py"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5D718E76E;
	Thu,  8 Aug 2024 10:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723113377; cv=none; b=cUhiG4nPdnUj9bKtl94hK/ADIGJYtfjPoJQv8rVJAKfa9Gi2lwgscVq2FYif0pSY9z3x+imYS9bcXhDElgRmMgpKrHR3yb9n93FSm7ey4xBUFPYOL9jMEFrtVsxo+HGKrDfP0v1ZwAbK+ULBLeNaNqLpUZkvRCGDhcD8Ro7/6F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723113377; c=relaxed/simple;
	bh=NHQzYLisZFxJp8w+mTR6u58VzbcedQc9/+93I90ZlQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ud48QEOGK7wOzUUZ6vtGGyC4ilXMmy1ABBH2pg+GY28xk3ethfGGT2znxZhuHn30U6MG47u3yV/GWL6/dYMgTXYgi1mf90boWBlerDMCrAX4580Qinj7oc0AtdNrdjRlvAf+mcGtm9c+wSB0q+3z8pjJPUsj397OP1uGmR4ZeVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAb341py; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF896C4AF09;
	Thu,  8 Aug 2024 10:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723113377;
	bh=NHQzYLisZFxJp8w+mTR6u58VzbcedQc9/+93I90ZlQo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hAb341pyz+s3nsD9kdJ+a1lrA9XhPOHcA+Q1GrOBSymsTz8PUfOvAX6T688hI92WX
	 a9aqjjM9xLG2A1NCfIDwVTnySxf8vq30c+vrDdZQoiP2hROcp/5ZdMc7CLAGdEpi9X
	 Gr9AroIuK1TUkwayLuMNwhTD5sb8T/bNDe/yafhO2xEyW9wz6QDIuZbQfnT0O0KB3H
	 4oofAT6T6PDxKF5gAs9+YieGSOWDy/q2m65AgJhL5Exvg8KpuJK+4Y+TbbLE1YoXVm
	 yxGiflXt1NHpNflv3k80wfKuk02g+Px1gHjWdxYQPhSNiPvY/C8U8dtR80geEOucE6
	 q1JVun6kUN3Zw==
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
Subject: [PATCH v2 10/11] 6pack: remove global strings
Date: Thu,  8 Aug 2024 12:35:46 +0200
Message-ID: <20240808103549.429349-11-jirislaby@kernel.org>
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

They are __init, so they are freed after init is done. But this
obfuscates the code.

Provided these days, we usually don't print anything if everything has
gone fine, drop the info print completely (along with now unused and
always artificial SIXPACK_VERSION).

And move the other string into the printk proper (while converting from
KERN_ERR to pr_err()).

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
 drivers/net/hamradio/6pack.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index 25d6d2308130..5c47730f5d58 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -37,8 +37,6 @@
 #include <linux/semaphore.h>
 #include <linux/refcount.h>
 
-#define SIXPACK_VERSION    "Revision: 0.3.0"
-
 /* sixpack priority commands */
 #define SIXP_SEOF		0x40	/* start and end of a 6pack frame */
 #define SIXP_TX_URUN		0x48	/* transmit overrun */
@@ -745,21 +743,14 @@ static struct tty_ldisc_ops sp_ldisc = {
 
 /* Initialize 6pack control device -- register 6pack line discipline */
 
-static const char msg_banner[]  __initconst = KERN_INFO \
-	"AX.25: 6pack driver, " SIXPACK_VERSION "\n";
-static const char msg_regfail[] __initconst = KERN_ERR  \
-	"6pack: can't register line discipline (err = %d)\n";
-
 static int __init sixpack_init_driver(void)
 {
 	int status;
 
-	printk(msg_banner);
-
 	/* Register the provided line protocol discipline */
 	status = tty_register_ldisc(&sp_ldisc);
 	if (status)
-		printk(msg_regfail, status);
+		pr_err("6pack: can't register line discipline (err = %d)\n", status);
 
 	return status;
 }
-- 
2.46.0


