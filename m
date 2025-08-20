Return-Path: <linux-hams+bounces-573-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66038B2E46D
	for <lists+linux-hams@lfdr.de>; Wed, 20 Aug 2025 19:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9F24A074D7
	for <lists+linux-hams@lfdr.de>; Wed, 20 Aug 2025 17:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF3426F295;
	Wed, 20 Aug 2025 17:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b="j8cceavp"
X-Original-To: linux-hams@vger.kernel.org
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B494125A352;
	Wed, 20 Aug 2025 17:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.13.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755712224; cv=none; b=Xr4H8WWLeAdUWdIXRoyuMGUcb6AscnAEF87MyTNadkJYufeUqbEgIX7CejEomPk3NhDCj7N2tYuMaLafkEOEIMxePeytvQAcJ6Wo9nJed/n+xZkXp9LC2yPEsHfwbd0ZJBIC7f3oF07/jotCLzo2Gbl7mB6u3Rdjk+GoTsDL5C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755712224; c=relaxed/simple;
	bh=rPg2RcgoIgKMolze2gcvmxHBrMA52rr6JIYnc2HoV0A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QS8FFolKTilw7mpU4yKpRZiXSVcnIwu16cq2QddFb+5cDYd1bsPnl8a1ZzBVguuj01wmq0rhwp3cdPyuxVKo6BaXltw2mjauyUiRVq/0JcY1qoqPD2BV8XGRDLXn37Pe8Pk3mNG5l7rcvV2pdXSzIv2Vpup+szL8UFsaHIQ2MFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b=j8cceavp; arc=none smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.jp; i=@amazon.co.jp; q=dns/txt;
  s=amazoncorp2; t=1755712222; x=1787248222;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zcghHA/6jatVro5Ji3iwGM+5UIZAvlkLHRWWn+cOMAg=;
  b=j8cceavp2y+aCxngOwIO31TfiUNvAR20UXmQ1r6l42ffqWl4wzt1v23a
   KsYDfPwtrSD5MvHOBSuJpdty/7nIXPnZrTA72cO+CuFNRHAFdVEvHBTUJ
   2JOujHf01MxBmVvjHjH/TdJ0sy3xLvN/hdjquTfB99tbFOt6+NcOS3xDi
   uyGBkFDkKDLrDiT/7m/z288xk+U53i+lC9u3mPsfZTXuf8hI30ixT7pGu
   CNBZHKRBFs+U7NbwLSBbBSMWjJEIvNBFw66NK+Or6QscoVQSgMOgsUep8
   ri56kG/6qzZttPqoloewVYYbyZqqJRhIgK0rh4q3aukhMpJaLQvhSUnnz
   A==;
X-CSE-ConnectionGUID: ph/ayWJ9QQK/+qqAZtoL5w==
X-CSE-MsgGUID: hwN9TQ0SSpCUFEtR49MZMQ==
X-IronPort-AV: E=Sophos;i="6.17,306,1747699200"; 
   d="scan'208";a="1450516"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:50:22 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.38.20:59372]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.153:2525] with esmtp (Farcaster)
 id 3b78b056-81aa-4d57-a7df-295f39ae4e00; Wed, 20 Aug 2025 17:50:22 +0000 (UTC)
X-Farcaster-Flow-ID: 3b78b056-81aa-4d57-a7df-295f39ae4e00
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Wed, 20 Aug 2025 17:50:21 +0000
Received: from 80a9974c3af6.amazon.com (10.37.244.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Wed, 20 Aug 2025 17:50:20 +0000
From: Takamitsu Iwai <takamitz@amazon.co.jp>
To: <linux-hams@vger.kernel.org>, <netdev@vger.kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Takamitsu Iwai
	<takamitz@amazon.co.jp>, Kohei Enju <enjuk@amazon.com>, Ingo Molnar
	<mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	<syzbot+942297eecf7d2d61d1f1@syzkaller.appspotmail.com>
Subject: [PATCH v1 net 3/3] net: rose: include node references in rose_neigh refcount
Date: Thu, 21 Aug 2025 02:47:07 +0900
Message-ID: <20250820174707.83372-4-takamitz@amazon.co.jp>
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
X-ClientProxiedBy: EX19D032UWA003.ant.amazon.com (10.13.139.37) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Current implementation maintains two separate reference counting
mechanisms: the 'count' field in struct rose_neigh tracks references from
rose_node structures, while the 'use' field (now refcount_t) tracks
references from rose_sock.

This patch merges these two reference counting systems using 'use' field
for proper reference management. Specifically, this patch adds incrementing
and decrementing of rose_neigh->use when rose_neigh->count is incremented
or decremented.

This patch also modifies rose_rt_free(), rose_rt_device_down() and
rose_clear_route() to properly release references to rose_neigh objects
before freeing a rose_node through rose_remove_node().

These changes ensure rose_neigh structures are properly freed only when
all references, including those from rose_node structures, are released.
As a result, this resolves a slab-use-after-free issue reported by Syzbot.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+942297eecf7d2d61d1f1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=942297eecf7d2d61d1f1
Signed-off-by: Takamitsu Iwai <takamitz@amazon.co.jp>
---
 net/rose/rose_route.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index a032543bbbc8..20e772114a39 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -178,6 +178,7 @@ static int __must_check rose_add_node(struct rose_route_struct *rose_route,
 			}
 		}
 		rose_neigh->count++;
+		rose_neigh_hold(rose_neigh);
 
 		goto out;
 	}
@@ -187,6 +188,7 @@ static int __must_check rose_add_node(struct rose_route_struct *rose_route,
 		rose_node->neighbour[rose_node->count] = rose_neigh;
 		rose_node->count++;
 		rose_neigh->count++;
+		rose_neigh_hold(rose_neigh);
 	}
 
 out:
@@ -322,6 +324,7 @@ static int rose_del_node(struct rose_route_struct *rose_route,
 	for (i = 0; i < rose_node->count; i++) {
 		if (rose_node->neighbour[i] == rose_neigh) {
 			rose_neigh->count--;
+			rose_neigh_put(rose_neigh);
 
 			if (rose_neigh->count == 0) {
 				rose_remove_neigh(rose_neigh);
@@ -430,6 +433,7 @@ int rose_add_loopback_node(const rose_address *address)
 	rose_node_list  = rose_node;
 
 	rose_loopback_neigh->count++;
+	rose_neigh_hold(rose_loopback_neigh);
 
 out:
 	spin_unlock_bh(&rose_node_list_lock);
@@ -461,6 +465,7 @@ void rose_del_loopback_node(const rose_address *address)
 	rose_remove_node(rose_node);
 
 	rose_loopback_neigh->count--;
+	rose_neigh_put(rose_loopback_neigh);
 
 out:
 	spin_unlock_bh(&rose_node_list_lock);
@@ -500,6 +505,7 @@ void rose_rt_device_down(struct net_device *dev)
 				memmove(&t->neighbour[i], &t->neighbour[i + 1],
 					sizeof(t->neighbour[0]) *
 						(t->count - i));
+				rose_neigh_put(s);
 			}
 
 			if (t->count <= 0)
@@ -543,6 +549,7 @@ static int rose_clear_routes(void)
 {
 	struct rose_neigh *s, *rose_neigh;
 	struct rose_node  *t, *rose_node;
+	int i;
 
 	spin_lock_bh(&rose_node_list_lock);
 	spin_lock_bh(&rose_neigh_list_lock);
@@ -553,8 +560,12 @@ static int rose_clear_routes(void)
 	while (rose_node != NULL) {
 		t         = rose_node;
 		rose_node = rose_node->next;
-		if (!t->loopback)
+
+		if (!t->loopback) {
+			for (i = 0; i < rose_node->count; i++)
+				rose_neigh_put(t->neighbour[i]);
 			rose_remove_node(t);
+		}
 	}
 
 	while (rose_neigh != NULL) {
@@ -1186,7 +1197,7 @@ static int rose_neigh_show(struct seq_file *seq, void *v)
 			   (rose_neigh->loopback) ? "RSLOOP-0" : ax2asc(buf, &rose_neigh->callsign),
 			   rose_neigh->dev ? rose_neigh->dev->name : "???",
 			   rose_neigh->count,
-			   refcount_read(&rose_neigh->use) - 1,
+			   refcount_read(&rose_neigh->use) - rose_neigh->count - 1,
 			   (rose_neigh->dce_mode) ? "DCE" : "DTE",
 			   (rose_neigh->restarted) ? "yes" : "no",
 			   ax25_display_timer(&rose_neigh->t0timer) / HZ,
@@ -1291,6 +1302,7 @@ void __exit rose_rt_free(void)
 	struct rose_neigh *s, *rose_neigh = rose_neigh_list;
 	struct rose_node  *t, *rose_node  = rose_node_list;
 	struct rose_route *u, *rose_route = rose_route_list;
+	int i;
 
 	while (rose_neigh != NULL) {
 		s          = rose_neigh;
@@ -1304,6 +1316,8 @@ void __exit rose_rt_free(void)
 		t         = rose_node;
 		rose_node = rose_node->next;
 
+		for (i = 0; i < t->count; i++)
+			rose_neigh_put(t->neighbour[i]);
 		rose_remove_node(t);
 	}
 
-- 
2.39.5 (Apple Git-154)


