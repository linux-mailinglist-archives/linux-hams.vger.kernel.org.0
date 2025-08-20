Return-Path: <linux-hams+bounces-571-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E59B2E45D
	for <lists+linux-hams@lfdr.de>; Wed, 20 Aug 2025 19:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B11BA1C83116
	for <lists+linux-hams@lfdr.de>; Wed, 20 Aug 2025 17:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E1C26F285;
	Wed, 20 Aug 2025 17:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b="ceurfPAk"
X-Original-To: linux-hams@vger.kernel.org
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEA936CE0C;
	Wed, 20 Aug 2025 17:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755712160; cv=none; b=eaz93LLatz2zxIwh/g8wRcWW/8KBXBoYCAyjmdTSBmsi5XLrAa2TR4o19k6kAekVd6zTCateuZgBjx3CecuKWf+UDKCd61Bs4x4c4FrK22LGdloKwHqTpDIwdg1Sp0J63aRqg3GEt1V+HkPkbPTlpZCQnfsK2YUw3oVvEAg25qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755712160; c=relaxed/simple;
	bh=j7Pj2aGMP1R1vS5FrYJpx/UXlDvU3gHbY7Rb77A9s04=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZOyWmXskclmzpLu+0Axe1bObt6YmbOUeXi0iAdufXtpvKPqDia9eEkNwPNId3JiMay110IgntSHKH/nqHdZrCUMLXT4iaKkEBJrTaTXAfvBCMIsE04q5XlZHDtdQpTNxtKSmZGLq2HP5xWGWaipI4oPTmfg1Sh6ucTvg0dE4/FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b=ceurfPAk; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.jp; i=@amazon.co.jp; q=dns/txt;
  s=amazoncorp2; t=1755712158; x=1787248158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z8HAR5JZp1tYD6fLa7KFiFRy7O1A1pnLxmdHY1yHaMg=;
  b=ceurfPAkLctui0jUDNAfYo670LnAjcHPPXbRgSw3ooF9hthxNXie10wU
   Fw9m6+PL+r3ROpL1/xPOCjLwyEdqvVhh8mlGTXytCeHYOVjEWCof733UP
   /PgAuOs2MnrpAJa2is8fTrZRZCzIw3Xmk5PoDbz9xl4SL20ATgLEIwr3S
   LPxSlDrvAI5KYQQmz62C+Yg2IH4WbQT74XpR9TVTZC26nqbH55+S5Z4BD
   dM4DmI+TJtjwq3gY/EIugN62erSDze3wk42XxHbZyUMH4alYXCOhf+xpJ
   0vwuO37USJLb8QA+rZfU/8+BPPSUHJ/V1H8XKxZVgvXShmM+o4vvyH3aF
   A==;
X-CSE-ConnectionGUID: wtzwltWmRj6QDPFk2eelLA==
X-CSE-MsgGUID: T0n3TkHOSK2gNA0FvwXGTw==
X-IronPort-AV: E=Sophos;i="6.17,306,1747699200"; 
   d="scan'208";a="1452523"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:49:18 +0000
Received: from EX19MTAUWC002.ant.amazon.com [10.0.7.35:21898]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.41.130:2525] with esmtp (Farcaster)
 id 7f745584-804d-44b1-9afa-ce75c547d01a; Wed, 20 Aug 2025 17:49:17 +0000 (UTC)
X-Farcaster-Flow-ID: 7f745584-804d-44b1-9afa-ce75c547d01a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Wed, 20 Aug 2025 17:49:17 +0000
Received: from 80a9974c3af6.amazon.com (10.37.244.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Wed, 20 Aug 2025 17:49:15 +0000
From: Takamitsu Iwai <takamitz@amazon.co.jp>
To: <linux-hams@vger.kernel.org>, <netdev@vger.kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Takamitsu Iwai
	<takamitz@amazon.co.jp>, Kohei Enju <enjuk@amazon.com>, Ingo Molnar
	<mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v1 net 1/3] net: rose: split remove and free operations in rose_remove_neigh()
Date: Thu, 21 Aug 2025 02:47:05 +0900
Message-ID: <20250820174707.83372-2-takamitz@amazon.co.jp>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250820174707.83372-1-takamitz@amazon.co.jp>
References: <20250820174707.83372-1-takamitz@amazon.co.jp>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D035UWA003.ant.amazon.com (10.13.139.86) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

The current rose_remove_neigh() performs two distinct operations:
1. Removes rose_neigh from rose_neigh_list
2. Frees the rose_neigh structure

Split these operations into separate functions to improve maintainability
and prepare for upcoming refcount_t conversion. The timer cleanup remains
in rose_remove_neigh() because free operations can be called from timer
itself.

This patch introduce rose_neigh_put() to handle the freeing of rose_neigh
structures and modify rose_remove_neigh() to handle removal only.

Signed-off-by: Takamitsu Iwai <takamitz@amazon.co.jp>
---
 include/net/rose.h    |  8 ++++++++
 net/rose/rose_route.c | 15 ++++++---------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/include/net/rose.h b/include/net/rose.h
index 23267b4efcfa..174b4f605d84 100644
--- a/include/net/rose.h
+++ b/include/net/rose.h
@@ -151,6 +151,14 @@ struct rose_sock {
 
 #define rose_sk(sk) ((struct rose_sock *)(sk))
 
+static inline void rose_neigh_put(struct rose_neigh *rose_neigh)
+{
+	if (rose_neigh->ax25)
+		ax25_cb_put(rose_neigh->ax25);
+	kfree(rose_neigh->digipeat);
+	kfree(rose_neigh);
+}
+
 /* af_rose.c */
 extern ax25_address rose_callsign;
 extern int  sysctl_rose_restart_request_timeout;
diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index b72bf8a08d48..0c44c416f485 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -234,20 +234,12 @@ static void rose_remove_neigh(struct rose_neigh *rose_neigh)
 
 	if ((s = rose_neigh_list) == rose_neigh) {
 		rose_neigh_list = rose_neigh->next;
-		if (rose_neigh->ax25)
-			ax25_cb_put(rose_neigh->ax25);
-		kfree(rose_neigh->digipeat);
-		kfree(rose_neigh);
 		return;
 	}
 
 	while (s != NULL && s->next != NULL) {
 		if (s->next == rose_neigh) {
 			s->next = rose_neigh->next;
-			if (rose_neigh->ax25)
-				ax25_cb_put(rose_neigh->ax25);
-			kfree(rose_neigh->digipeat);
-			kfree(rose_neigh);
 			return;
 		}
 
@@ -331,8 +323,10 @@ static int rose_del_node(struct rose_route_struct *rose_route,
 		if (rose_node->neighbour[i] == rose_neigh) {
 			rose_neigh->count--;
 
-			if (rose_neigh->count == 0 && rose_neigh->use == 0)
+			if (rose_neigh->count == 0 && rose_neigh->use == 0) {
 				rose_remove_neigh(rose_neigh);
+				rose_neigh_put(rose_neigh);
+			}
 
 			rose_node->count--;
 
@@ -513,6 +507,7 @@ void rose_rt_device_down(struct net_device *dev)
 		}
 
 		rose_remove_neigh(s);
+		rose_neigh_put(s);
 	}
 	spin_unlock_bh(&rose_neigh_list_lock);
 	spin_unlock_bh(&rose_node_list_lock);
@@ -569,6 +564,7 @@ static int rose_clear_routes(void)
 		if (s->use == 0 && !s->loopback) {
 			s->count = 0;
 			rose_remove_neigh(s);
+			rose_neigh_put(s);
 		}
 	}
 
@@ -1301,6 +1297,7 @@ void __exit rose_rt_free(void)
 		rose_neigh = rose_neigh->next;
 
 		rose_remove_neigh(s);
+		rose_neigh_put(s);
 	}
 
 	while (rose_node != NULL) {
-- 
2.39.5 (Apple Git-154)


