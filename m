Return-Path: <linux-hams+bounces-585-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7FCB327E4
	for <lists+linux-hams@lfdr.de>; Sat, 23 Aug 2025 11:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E75D16D579
	for <lists+linux-hams@lfdr.de>; Sat, 23 Aug 2025 09:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6455923AB9F;
	Sat, 23 Aug 2025 09:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b="LHcJ42Yy"
X-Original-To: linux-hams@vger.kernel.org
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873BF212545;
	Sat, 23 Aug 2025 09:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755939718; cv=none; b=tq62J3ujTwuIbdKII8g5U+XgEPQgd/UZZO1GGRuLgzKoh0NFk4G7iKqc/ytbStmv4d8T4VYfPZYfIcMKVbjfihpRW0jR/Z7GK5Bj+GmlxvcJh+P4k5q//ucKOoPIGv9kbacHuwVn7rtSBlOWDe4jrQJPYOKy0VjKy6LDZ39d9ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755939718; c=relaxed/simple;
	bh=D3vFASqPjDCmiPDNpgJvY/+g7nVIcCYSptQ1ahjgnO8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qrJV0khG/6u0+UGMobO0TIFqzh10JHdL00NjIZIckXAdnw6NE2cp0mbUANvMceUX+N1c3qI1j4L2ubx99vz6hfowTsISavI7PszRzELn+2tsIi2kkFoFF5DKojHK5JZrs+UFPli6wmB8r4ocNIzu42G9nIh+CfXcmxxILlrGcPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b=LHcJ42Yy; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.jp; i=@amazon.co.jp; q=dns/txt;
  s=amazoncorp2; t=1755939716; x=1787475716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yfr0WjtUFSH+Xc22g+u7kEHxHSSPEEsg3kvT9H82znE=;
  b=LHcJ42YyD6J+h2rb6hTd5an+bgqauZHagwEUZKVn4+zgN7pU05E1yDKo
   2K13UgpIatfu/mGH9dZrMeVUZtxRXGb5t7fIT+Rz8vQtFFSWg0h4CKcYG
   lvdDSaUdWi5SC6xfFycmR9EqmM0XxskcWAjpD27NIKujiNGqXIQrGRhBB
   B6xTz2bDZ4X7Z6gz86e/Al8wlgtxjeaxUbaCGlYltk1u7nfXXCNi72mzO
   iyzvEzcsSPTatDbwO46kGLd+s6O4hXOsZSCIpRTE7bmbAD4h5ACNyKzUD
   KFCm9hJ/TnYZwakJ5K4Dfqw2loqhSMWVjLXOY/pnVxayedCNkQWWJnpI6
   g==;
X-CSE-ConnectionGUID: fB1qgJaSSqytTAnbea5jxQ==
X-CSE-MsgGUID: GHamxantRCKxNhLDwgax0A==
X-IronPort-AV: E=Sophos;i="6.17,312,1747699200"; 
   d="scan'208";a="1668684"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 09:01:55 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.21.151:18856]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.52.244:2525] with esmtp (Farcaster)
 id 91958734-fe91-4d2d-a220-d0a76b824bb7; Sat, 23 Aug 2025 09:01:55 +0000 (UTC)
X-Farcaster-Flow-ID: 91958734-fe91-4d2d-a220-d0a76b824bb7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Sat, 23 Aug 2025 09:01:55 +0000
Received: from 80a9974c3af6.amazon.com (10.37.244.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Sat, 23 Aug 2025 09:01:53 +0000
From: Takamitsu Iwai <takamitz@amazon.co.jp>
To: <linux-hams@vger.kernel.org>, <netdev@vger.kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Takamitsu Iwai
	<takamitz@amazon.co.jp>, Kohei Enju <enjuk@amazon.com>, Ingo Molnar
	<mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Jesper Dangaard
 Brouer" <hawk@kernel.org>, Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	<syzbot+942297eecf7d2d61d1f1@syzkaller.appspotmail.com>
Subject: [PATCH v2 net 3/3] net: rose: include node references in rose_neigh refcount
Date: Sat, 23 Aug 2025 17:58:57 +0900
Message-ID: <20250823085857.47674-4-takamitz@amazon.co.jp>
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
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
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
index 8efb9033c057..1adee1fbc2ed 100644
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
@@ -1189,7 +1200,7 @@ static int rose_neigh_show(struct seq_file *seq, void *v)
 			   (rose_neigh->loopback) ? "RSLOOP-0" : ax2asc(buf, &rose_neigh->callsign),
 			   rose_neigh->dev ? rose_neigh->dev->name : "???",
 			   rose_neigh->count,
-			   refcount_read(&rose_neigh->use) - 1,
+			   refcount_read(&rose_neigh->use) - rose_neigh->count - 1,
 			   (rose_neigh->dce_mode) ? "DCE" : "DTE",
 			   (rose_neigh->restarted) ? "yes" : "no",
 			   ax25_display_timer(&rose_neigh->t0timer) / HZ,
@@ -1294,6 +1305,7 @@ void __exit rose_rt_free(void)
 	struct rose_neigh *s, *rose_neigh = rose_neigh_list;
 	struct rose_node  *t, *rose_node  = rose_node_list;
 	struct rose_route *u, *rose_route = rose_route_list;
+	int i;
 
 	while (rose_neigh != NULL) {
 		s          = rose_neigh;
@@ -1307,6 +1319,8 @@ void __exit rose_rt_free(void)
 		t         = rose_node;
 		rose_node = rose_node->next;
 
+		for (i = 0; i < t->count; i++)
+			rose_neigh_put(t->neighbour[i]);
 		rose_remove_node(t);
 	}
 
-- 
2.39.5 (Apple Git-154)


