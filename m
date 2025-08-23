Return-Path: <linux-hams+bounces-584-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E7566B327DB
	for <lists+linux-hams@lfdr.de>; Sat, 23 Aug 2025 11:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CFF594E1E34
	for <lists+linux-hams@lfdr.de>; Sat, 23 Aug 2025 09:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A60923B62A;
	Sat, 23 Aug 2025 09:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b="NST/2SGs"
X-Original-To: linux-hams@vger.kernel.org
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EE61E5B9E;
	Sat, 23 Aug 2025 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.26.1.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755939692; cv=none; b=qnQDWujMGdeOpoZy62HLCMg8fcHATnaH82WECd32A2JqmLuERhMeh7fdiFIws/9R6ckE/P2wmAGcpPcPAMQK2qVjB1xYyWQOHGK0Ve4r/AzfIxEMNS5FemGD4SnIDWqJGIOglDUGPMhUzb9YXe/pT37AGFwQQvJT4fYjEWXszJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755939692; c=relaxed/simple;
	bh=AnH6dJ81yyiY7349PlcN0tKhdOnDdRE8dt8NiSrE9cM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D5xN6UVqKNBVJ4udvizxRwbVKme2wwbdKIjJKAnThM7xtR1Be5FJovqYbMud/LnbaGICeIcCLnnJwL8kDTk1lCROU0pSRkJqdXfZByvsXxlnzIY8JL9hef/7/MqE4FXo/E82KTYC0sjctOkEsMyve9DAToEqRzoV7HEJtgVHmqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b=NST/2SGs; arc=none smtp.client-ip=52.26.1.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.jp; i=@amazon.co.jp; q=dns/txt;
  s=amazoncorp2; t=1755939691; x=1787475691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u88nRk6FBaQdQE5IRPVOSXnN/LeBz7DoKoub1vocLrk=;
  b=NST/2SGsGfrI0HU4ZbpIRC89GNq5KjEISmjsOcQNE6It5oS9osxTkSZl
   Ddt6TtwRXEc/d8s3Q9VWmCUo2Jps6Zf+oRerwOGc6EKvI2/auRoH1sfNo
   Lwmqpqpxi11Q6YDubqr1oE00Fsht+v9rIG9ck+3I71m7a/pUXSY76TffB
   Nu88xzJ8mvd44AMIx80pAOt0Cewak/fjGoozP6c7eQVCRbs+WZCOYLazp
   l054rv2y1xibppVWrDgecqtA3vgC3ZW5sb7GysOT92gWSjCKAI7GUBypy
   gWg8optOQG/0BS7+q1TEYbMFs5MHOCttoLhWY4EV/HIyBsMaPsSma2N52
   A==;
X-CSE-ConnectionGUID: nW/mOE+rTvydo1/3e0IRpg==
X-CSE-MsgGUID: cmkhH++AQZumRRq1/qR7gg==
X-IronPort-AV: E=Sophos;i="6.17,312,1747699200"; 
   d="scan'208";a="1667687"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 09:01:30 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.38.20:40978]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.153:2525] with esmtp (Farcaster)
 id 204512f4-8108-40f0-bf61-78792134707e; Sat, 23 Aug 2025 09:01:30 +0000 (UTC)
X-Farcaster-Flow-ID: 204512f4-8108-40f0-bf61-78792134707e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Sat, 23 Aug 2025 09:01:28 +0000
Received: from 80a9974c3af6.amazon.com (10.37.244.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Sat, 23 Aug 2025 09:01:26 +0000
From: Takamitsu Iwai <takamitz@amazon.co.jp>
To: <linux-hams@vger.kernel.org>, <netdev@vger.kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Takamitsu Iwai
	<takamitz@amazon.co.jp>, Kohei Enju <enjuk@amazon.com>, Ingo Molnar
	<mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Jesper Dangaard
 Brouer" <hawk@kernel.org>, Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH v2 net 2/3] net: rose: convert 'use' field to refcount_t
Date: Sat, 23 Aug 2025 17:58:56 +0900
Message-ID: <20250823085857.47674-3-takamitz@amazon.co.jp>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250823085857.47674-1-takamitz@amazon.co.jp>
References: <20250823085857.47674-1-takamitz@amazon.co.jp>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D040UWA004.ant.amazon.com (10.13.139.93) To
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
 net/rose/af_rose.c    | 13 +++++++------
 net/rose/rose_in.c    | 12 ++++++------
 net/rose/rose_route.c | 33 ++++++++++++++++++---------------
 net/rose/rose_timer.c |  2 +-
 5 files changed, 45 insertions(+), 33 deletions(-)

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
index 4e72b636a46a..543f9e8ebb69 100644
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
@@ -823,6 +823,7 @@ static int rose_connect(struct socket *sock, struct sockaddr *uaddr, int addr_le
 	rose->lci = rose_new_lci(rose->neighbour);
 	if (!rose->lci) {
 		err = -ENETUNREACH;
+		rose_neigh_put(rose->neighbour);
 		goto out_release;
 	}
 
@@ -834,12 +835,14 @@ static int rose_connect(struct socket *sock, struct sockaddr *uaddr, int addr_le
 		dev = rose_dev_first();
 		if (!dev) {
 			err = -ENETUNREACH;
+			rose_neigh_put(rose->neighbour);
 			goto out_release;
 		}
 
 		user = ax25_findbyuid(current_euid());
 		if (!user) {
 			err = -EINVAL;
+			rose_neigh_put(rose->neighbour);
 			dev_put(dev);
 			goto out_release;
 		}
@@ -874,8 +877,6 @@ static int rose_connect(struct socket *sock, struct sockaddr *uaddr, int addr_le
 
 	rose->state = ROSE_STATE_1;
 
-	rose->neighbour->use++;
-
 	rose_write_internal(sk, ROSE_CALL_REQUEST);
 	rose_start_heartbeat(sk);
 	rose_start_t1timer(sk);
@@ -1077,7 +1078,7 @@ int rose_rx_call_request(struct sk_buff *skb, struct net_device *dev, struct ros
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
index 0c44c416f485..8efb9033c057 100644
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
@@ -691,6 +691,7 @@ struct rose_neigh *rose_get_neigh(rose_address *addr, unsigned char *cause,
 				for (i = 0; i < node->count; i++) {
 					if (!rose_ftimer_running(node->neighbour[i])) {
 						res = node->neighbour[i];
+						rose_neigh_hold(node->neighbour[i]);
 						goto out;
 					}
 					failed = 1;
@@ -780,13 +781,13 @@ static void rose_del_route_by_neigh(struct rose_neigh *rose_neigh)
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
@@ -915,7 +916,7 @@ int rose_route_frame(struct sk_buff *skb, ax25_cb *ax25)
 			rose_clear_queues(sk);
 			rose->cause	 = ROSE_NETWORK_CONGESTION;
 			rose->diagnostic = 0;
-			rose->neighbour->use--;
+			rose_neigh_put(rose->neighbour);
 			rose->neighbour	 = NULL;
 			rose->lci	 = 0;
 			rose->state	 = ROSE_STATE_0;
@@ -1040,12 +1041,12 @@ int rose_route_frame(struct sk_buff *skb, ax25_cb *ax25)
 
 	if ((new_lci = rose_new_lci(new_neigh)) == 0) {
 		rose_transmit_clear_request(rose_neigh, lci, ROSE_NETWORK_CONGESTION, 71);
-		goto out;
+		goto put_neigh;
 	}
 
 	if ((rose_route = kmalloc(sizeof(*rose_route), GFP_ATOMIC)) == NULL) {
 		rose_transmit_clear_request(rose_neigh, lci, ROSE_NETWORK_CONGESTION, 120);
-		goto out;
+		goto put_neigh;
 	}
 
 	rose_route->lci1      = lci;
@@ -1058,8 +1059,8 @@ int rose_route_frame(struct sk_buff *skb, ax25_cb *ax25)
 	rose_route->lci2      = new_lci;
 	rose_route->neigh2    = new_neigh;
 
-	rose_route->neigh1->use++;
-	rose_route->neigh2->use++;
+	rose_neigh_hold(rose_route->neigh1);
+	rose_neigh_hold(rose_route->neigh2);
 
 	rose_route->next = rose_route_list;
 	rose_route_list  = rose_route;
@@ -1071,6 +1072,8 @@ int rose_route_frame(struct sk_buff *skb, ax25_cb *ax25)
 	rose_transmit_link(skb, rose_route->neigh2);
 	res = 1;
 
+put_neigh:
+	rose_neigh_put(new_neigh);
 out:
 	spin_unlock_bh(&rose_route_list_lock);
 	spin_unlock_bh(&rose_neigh_list_lock);
@@ -1186,7 +1189,7 @@ static int rose_neigh_show(struct seq_file *seq, void *v)
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


