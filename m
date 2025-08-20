Return-Path: <linux-hams+bounces-572-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B79F4B2E45E
	for <lists+linux-hams@lfdr.de>; Wed, 20 Aug 2025 19:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFFE81BA2C01
	for <lists+linux-hams@lfdr.de>; Wed, 20 Aug 2025 17:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2475126F296;
	Wed, 20 Aug 2025 17:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b="AFoUTxrI"
X-Original-To: linux-hams@vger.kernel.org
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD3E26CE05;
	Wed, 20 Aug 2025 17:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755712185; cv=none; b=NWsw9Ny8iECO8YE6emIONPSHXi4D8JTcKJ8Qj0SE+91ugPuV7d/AVJh0T4O1Z5UJc7eldSzM4TT1QY0FcqL7tRQRZlG55Mw3cBKtg5Ka5LrfnAFqRKON39T36wf/M0BMpBScK8mZL/noiRTtryZJZDfYlZRr/XC7l0vGo9WuAC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755712185; c=relaxed/simple;
	bh=W+GUudQOv1ptaUzHeYuYtCA+4125myA0YUbRuhkEz84=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YKlzH+JUA1b2QwLoKUQmeqW5PdbUFmq2J2zD8iJA1R+jRqb9VNgghWX+idu5aVMkOlTTY5cAhXplrMgMtM5Qojm6+/fu7HUes7nPiSIfbSzrg0y7FBz6BVMuWa4FqBoDTvn/2SYSAaofGhCZZaW+ERyPDcqVhzG976MVaA9uYto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b=AFoUTxrI; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.jp; i=@amazon.co.jp; q=dns/txt;
  s=amazoncorp2; t=1755712184; x=1787248184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H0FjDpYVXu6gBey8SENwMcDMYJggvFN7WUpp6VgoxA4=;
  b=AFoUTxrI0UonQMvwTtng6X6YZ+6vOldto7eHU6uZZV3jey5aeW+TPnUy
   cMD7scR6+N56NIgOB3zsl1Z/WO39jqI/2Umbk6KmuDbm5/Q/PcH2+LH3E
   A+Li64LT+D9DiAUdr/WTR9TuGY8ll5moCJJ3H0TpJN0gK1y9TEbWzwsS+
   ptnMhrtbzJk2pA83cDfunSyksGa1/qF5WVy2ndyTF2GxZigDd1ya/TB88
   rQU9lR41EVpxUZfdZpbF1A7d81bbcVjf2LlOljmiHUTChYeWYLgLX4bWX
   GWhshK5nbklvqClfc/u/5/HxdKH1euon0RIOp42NM6wiSmyP3pli5lHZj
   w==;
X-CSE-ConnectionGUID: LBZE8eNJTQyLUZDxasnFMg==
X-CSE-MsgGUID: QY+0E350RmSGywNnr9E+vQ==
X-IronPort-AV: E=Sophos;i="6.17,306,1747699200"; 
   d="scan'208";a="1339118"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:49:43 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:22046]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.153:2525] with esmtp (Farcaster)
 id 0120cf40-9c23-4e3a-8b70-b453fe72a412; Wed, 20 Aug 2025 17:49:43 +0000 (UTC)
X-Farcaster-Flow-ID: 0120cf40-9c23-4e3a-8b70-b453fe72a412
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Wed, 20 Aug 2025 17:49:43 +0000
Received: from 80a9974c3af6.amazon.com (10.37.244.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Wed, 20 Aug 2025 17:49:41 +0000
From: Takamitsu Iwai <takamitz@amazon.co.jp>
To: <linux-hams@vger.kernel.org>, <netdev@vger.kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Takamitsu Iwai
	<takamitz@amazon.co.jp>, Kohei Enju <enjuk@amazon.com>, Ingo Molnar
	<mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v1 net 2/3] net: rose: convert 'use' field to refcount_t
Date: Thu, 21 Aug 2025 02:47:06 +0900
Message-ID: <20250820174707.83372-3-takamitz@amazon.co.jp>
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
X-ClientProxiedBy: EX19D039UWB003.ant.amazon.com (10.13.138.93) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

The 'use' field in struct rose_neigh is used as a reference counter but
lacks atomicity. This can lead to race conditions where a rose_neigh
structure is freed while still being referenced by other code paths.

For example, when rose_neigh->use becomes zero during an ioctl operation
via rose_rt_ioctl(), the structure may be removed while its timer is
still active, potentially causing use-after-free issues.

This patch changes the type of 'use' from unsigned short to refcount_t and
updates all code paths to use rose_neigh_hold() and rose_neigh_put() which
operate reference counts atomically.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Takamitsu Iwai <takamitz@amazon.co.jp>
---
 include/net/rose.h    | 18 +++++++++++++-----
 net/rose/af_rose.c    | 10 ++++------
 net/rose/rose_in.c    | 12 ++++++------
 net/rose/rose_route.c | 26 +++++++++++++-------------
 net/rose/rose_timer.c |  2 +-
 5 files changed, 37 insertions(+), 31 deletions(-)

diff --git a/include/net/rose.h b/include/net/rose.h
index 174b4f605d84..2b5491bbf39a 100644
--- a/include/net/rose.h
+++ b/include/net/rose.h
@@ -8,6 +8,7 @@
 #ifndef _ROSE_H
 #define _ROSE_H 
 
+#include <linux/refcount.h>
 #include <linux/rose.h>
 #include <net/ax25.h>
 #include <net/sock.h>
@@ -96,7 +97,7 @@ struct rose_neigh {
 	ax25_cb			*ax25;
 	struct net_device		*dev;
 	unsigned short		count;
-	unsigned short		use;
+	refcount_t		use;
 	unsigned int		number;
 	char			restarted;
 	char			dce_mode;
@@ -151,12 +152,19 @@ struct rose_sock {
 
 #define rose_sk(sk) ((struct rose_sock *)(sk))
 
+static inline void rose_neigh_hold(struct rose_neigh *rose_neigh)
+{
+	refcount_inc(&rose_neigh->use);
+}
+
 static inline void rose_neigh_put(struct rose_neigh *rose_neigh)
 {
-	if (rose_neigh->ax25)
-		ax25_cb_put(rose_neigh->ax25);
-	kfree(rose_neigh->digipeat);
-	kfree(rose_neigh);
+	if (refcount_dec_and_test(&rose_neigh->use)) {
+		if (rose_neigh->ax25)
+			ax25_cb_put(rose_neigh->ax25);
+		kfree(rose_neigh->digipeat);
+		kfree(rose_neigh);
+	}
 }
 
 /* af_rose.c */
diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index 4e72b636a46a..6d0846e2be30 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -170,7 +170,7 @@ void rose_kill_by_neigh(struct rose_neigh *neigh)
 
 		if (rose->neighbour == neigh) {
 			rose_disconnect(s, ENETUNREACH, ROSE_OUT_OF_ORDER, 0);
-			rose->neighbour->use--;
+			rose_neigh_put(rose->neighbour);
 			rose->neighbour = NULL;
 		}
 	}
@@ -212,7 +212,7 @@ static void rose_kill_by_device(struct net_device *dev)
 		if (rose->device == dev) {
 			rose_disconnect(sk, ENETUNREACH, ROSE_OUT_OF_ORDER, 0);
 			if (rose->neighbour)
-				rose->neighbour->use--;
+				rose_neigh_put(rose->neighbour);
 			netdev_put(rose->device, &rose->dev_tracker);
 			rose->device = NULL;
 		}
@@ -655,7 +655,7 @@ static int rose_release(struct socket *sock)
 		break;
 
 	case ROSE_STATE_2:
-		rose->neighbour->use--;
+		rose_neigh_put(rose->neighbour);
 		release_sock(sk);
 		rose_disconnect(sk, 0, -1, -1);
 		lock_sock(sk);
@@ -874,8 +874,6 @@ static int rose_connect(struct socket *sock, struct sockaddr *uaddr, int addr_le
 
 	rose->state = ROSE_STATE_1;
 
-	rose->neighbour->use++;
-
 	rose_write_internal(sk, ROSE_CALL_REQUEST);
 	rose_start_heartbeat(sk);
 	rose_start_t1timer(sk);
@@ -1077,7 +1075,7 @@ int rose_rx_call_request(struct sk_buff *skb, struct net_device *dev, struct ros
 			     GFP_ATOMIC);
 	make_rose->facilities    = facilities;
 
-	make_rose->neighbour->use++;
+	rose_neigh_hold(make_rose->neighbour);
 
 	if (rose_sk(sk)->defer) {
 		make_rose->state = ROSE_STATE_5;
diff --git a/net/rose/rose_in.c b/net/rose/rose_in.c
index 3e99181e759f..0276b393f0e5 100644
--- a/net/rose/rose_in.c
+++ b/net/rose/rose_in.c
@@ -56,7 +56,7 @@ static int rose_state1_machine(struct sock *sk, struct sk_buff *skb, int framety
 	case ROSE_CLEAR_REQUEST:
 		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
 		rose_disconnect(sk, ECONNREFUSED, skb->data[3], skb->data[4]);
-		rose->neighbour->use--;
+		rose_neigh_put(rose->neighbour);
 		break;
 
 	default:
@@ -79,12 +79,12 @@ static int rose_state2_machine(struct sock *sk, struct sk_buff *skb, int framety
 	case ROSE_CLEAR_REQUEST:
 		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
 		rose_disconnect(sk, 0, skb->data[3], skb->data[4]);
-		rose->neighbour->use--;
+		rose_neigh_put(rose->neighbour);
 		break;
 
 	case ROSE_CLEAR_CONFIRMATION:
 		rose_disconnect(sk, 0, -1, -1);
-		rose->neighbour->use--;
+		rose_neigh_put(rose->neighbour);
 		break;
 
 	default:
@@ -121,7 +121,7 @@ static int rose_state3_machine(struct sock *sk, struct sk_buff *skb, int framety
 	case ROSE_CLEAR_REQUEST:
 		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
 		rose_disconnect(sk, 0, skb->data[3], skb->data[4]);
-		rose->neighbour->use--;
+		rose_neigh_put(rose->neighbour);
 		break;
 
 	case ROSE_RR:
@@ -234,7 +234,7 @@ static int rose_state4_machine(struct sock *sk, struct sk_buff *skb, int framety
 	case ROSE_CLEAR_REQUEST:
 		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
 		rose_disconnect(sk, 0, skb->data[3], skb->data[4]);
-		rose->neighbour->use--;
+		rose_neigh_put(rose->neighbour);
 		break;
 
 	default:
@@ -254,7 +254,7 @@ static int rose_state5_machine(struct sock *sk, struct sk_buff *skb, int framety
 	if (frametype == ROSE_CLEAR_REQUEST) {
 		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
 		rose_disconnect(sk, 0, skb->data[3], skb->data[4]);
-		rose_sk(sk)->neighbour->use--;
+		rose_neigh_put(rose_sk(sk)->neighbour);
 	}
 
 	return 0;
diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index 0c44c416f485..a032543bbbc8 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -93,11 +93,11 @@ static int __must_check rose_add_node(struct rose_route_struct *rose_route,
 		rose_neigh->ax25      = NULL;
 		rose_neigh->dev       = dev;
 		rose_neigh->count     = 0;
-		rose_neigh->use       = 0;
 		rose_neigh->dce_mode  = 0;
 		rose_neigh->loopback  = 0;
 		rose_neigh->number    = rose_neigh_no++;
 		rose_neigh->restarted = 0;
+		refcount_set(&rose_neigh->use, 1);
 
 		skb_queue_head_init(&rose_neigh->queue);
 
@@ -255,10 +255,10 @@ static void rose_remove_route(struct rose_route *rose_route)
 	struct rose_route *s;
 
 	if (rose_route->neigh1 != NULL)
-		rose_route->neigh1->use--;
+		rose_neigh_put(rose_route->neigh1);
 
 	if (rose_route->neigh2 != NULL)
-		rose_route->neigh2->use--;
+		rose_neigh_put(rose_route->neigh2);
 
 	if ((s = rose_route_list) == rose_route) {
 		rose_route_list = rose_route->next;
@@ -323,7 +323,7 @@ static int rose_del_node(struct rose_route_struct *rose_route,
 		if (rose_node->neighbour[i] == rose_neigh) {
 			rose_neigh->count--;
 
-			if (rose_neigh->count == 0 && rose_neigh->use == 0) {
+			if (rose_neigh->count == 0) {
 				rose_remove_neigh(rose_neigh);
 				rose_neigh_put(rose_neigh);
 			}
@@ -375,11 +375,11 @@ void rose_add_loopback_neigh(void)
 	sn->ax25      = NULL;
 	sn->dev       = NULL;
 	sn->count     = 0;
-	sn->use       = 0;
 	sn->dce_mode  = 1;
 	sn->loopback  = 1;
 	sn->number    = rose_neigh_no++;
 	sn->restarted = 1;
+	refcount_set(&sn->use, 1);
 
 	skb_queue_head_init(&sn->queue);
 
@@ -561,8 +561,7 @@ static int rose_clear_routes(void)
 		s          = rose_neigh;
 		rose_neigh = rose_neigh->next;
 
-		if (s->use == 0 && !s->loopback) {
-			s->count = 0;
+		if (!s->loopback) {
 			rose_remove_neigh(s);
 			rose_neigh_put(s);
 		}
@@ -680,6 +679,7 @@ struct rose_neigh *rose_get_neigh(rose_address *addr, unsigned char *cause,
 			for (i = 0; i < node->count; i++) {
 				if (node->neighbour[i]->restarted) {
 					res = node->neighbour[i];
+					rose_neigh_hold(node->neighbour[i]);
 					goto out;
 				}
 			}
@@ -780,13 +780,13 @@ static void rose_del_route_by_neigh(struct rose_neigh *rose_neigh)
 		}
 
 		if (rose_route->neigh1 == rose_neigh) {
-			rose_route->neigh1->use--;
+			rose_neigh_put(rose_route->neigh1);
 			rose_route->neigh1 = NULL;
 			rose_transmit_clear_request(rose_route->neigh2, rose_route->lci2, ROSE_OUT_OF_ORDER, 0);
 		}
 
 		if (rose_route->neigh2 == rose_neigh) {
-			rose_route->neigh2->use--;
+			rose_neigh_put(rose_route->neigh2);
 			rose_route->neigh2 = NULL;
 			rose_transmit_clear_request(rose_route->neigh1, rose_route->lci1, ROSE_OUT_OF_ORDER, 0);
 		}
@@ -915,7 +915,7 @@ int rose_route_frame(struct sk_buff *skb, ax25_cb *ax25)
 			rose_clear_queues(sk);
 			rose->cause	 = ROSE_NETWORK_CONGESTION;
 			rose->diagnostic = 0;
-			rose->neighbour->use--;
+			rose_neigh_put(rose->neighbour);
 			rose->neighbour	 = NULL;
 			rose->lci	 = 0;
 			rose->state	 = ROSE_STATE_0;
@@ -1058,8 +1058,8 @@ int rose_route_frame(struct sk_buff *skb, ax25_cb *ax25)
 	rose_route->lci2      = new_lci;
 	rose_route->neigh2    = new_neigh;
 
-	rose_route->neigh1->use++;
-	rose_route->neigh2->use++;
+	rose_neigh_hold(rose_route->neigh1);
+	rose_neigh_hold(rose_route->neigh2);
 
 	rose_route->next = rose_route_list;
 	rose_route_list  = rose_route;
@@ -1186,7 +1186,7 @@ static int rose_neigh_show(struct seq_file *seq, void *v)
 			   (rose_neigh->loopback) ? "RSLOOP-0" : ax2asc(buf, &rose_neigh->callsign),
 			   rose_neigh->dev ? rose_neigh->dev->name : "???",
 			   rose_neigh->count,
-			   rose_neigh->use,
+			   refcount_read(&rose_neigh->use) - 1,
 			   (rose_neigh->dce_mode) ? "DCE" : "DTE",
 			   (rose_neigh->restarted) ? "yes" : "no",
 			   ax25_display_timer(&rose_neigh->t0timer) / HZ,
diff --git a/net/rose/rose_timer.c b/net/rose/rose_timer.c
index 020369c49587..bb60a1654d61 100644
--- a/net/rose/rose_timer.c
+++ b/net/rose/rose_timer.c
@@ -180,7 +180,7 @@ static void rose_timer_expiry(struct timer_list *t)
 		break;
 
 	case ROSE_STATE_2:	/* T3 */
-		rose->neighbour->use--;
+		rose_neigh_put(rose->neighbour);
 		rose_disconnect(sk, ETIMEDOUT, -1, -1);
 		break;
 
-- 
2.39.5 (Apple Git-154)


