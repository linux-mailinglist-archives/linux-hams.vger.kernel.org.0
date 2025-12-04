Return-Path: <linux-hams+bounces-723-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD37CA2EC5
	for <lists+linux-hams@lfdr.de>; Thu, 04 Dec 2025 10:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FC7830DC006
	for <lists+linux-hams@lfdr.de>; Thu,  4 Dec 2025 09:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D071334374;
	Thu,  4 Dec 2025 09:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjArpjyo"
X-Original-To: linux-hams@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAA22741C0;
	Thu,  4 Dec 2025 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839344; cv=none; b=lrLYB1lzHz1iCTl6cI0iG6t5uVeN1NDy3dkyPMfA/OJ2KSoqHXEh8vUyRjsIw5Af4w5HrSN7HChLJUc6BJt9DZ0xGRDoj74+qy1dTeCHvEPJIpHSlxvOX5tK8KpH+UXfAzzY/rrjS8ogvD0SfcxMl8L6jaG9+bxrN6kgY9Y1fds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839344; c=relaxed/simple;
	bh=3uz+62j3aS0I7ayKubAXY/2DmW+bLoIWENB2nYvuvuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BC4dNTwXY6qrdh3sq/uvsuku2JCJ8xONhAajGYLz71BwZBdL0eewf05KGKO/xNTJLjHjLGd82nqC0UaXdGXiEbdAdEFKGVvI0DC4fF6B9ujiw0ltGMchvO5VRur0p/3dSrZb4w6H0cQPSga0PFF26i6c4rDaxeodMvuSR1DAL1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjArpjyo; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764839342; x=1796375342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3uz+62j3aS0I7ayKubAXY/2DmW+bLoIWENB2nYvuvuk=;
  b=mjArpjyoT5/lxRgEjk5kZUYLpPBADcdraGfZb6B2qLTy0eb9u0Kq02R4
   /8qtwKQwyn8QUUCKP9UGS4RrmudctC+wwNm4elbVJsqlwHR4Bv/BbkSBq
   jixC5LZICeb/jbaIjr+YWBI3/QdWv5Dse3YcobqnFQaVCWtPR4fLuRKUo
   HGQ7TxQvMwhXqwf/b5LmXXWxtAE7u2CbKsiBKWco/YOxjB7CzVH8f98QJ
   PxyQgPMjoVjuaQZnkdyn2oNcIlFDpaZePBmXNWcn1khAmtXSc1hqKyX+I
   ofxg+3rhQC39Lx/v2YqOe5Jo/AoX1pKkSxQeRIImOaqhsJ5f2NNBmhnAI
   A==;
X-CSE-ConnectionGUID: QiWvQPqVTQ6B5MUnVN+Vqg==
X-CSE-MsgGUID: WdUrFVQmTjafPjnc7k/2EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="67014017"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="67014017"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 01:09:01 -0800
X-CSE-ConnectionGUID: 7E9px2DcR92EG9AixfTn2Q==
X-CSE-MsgGUID: y0EctHCqQXmU6w7PX/xsyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="195724274"
Received: from junjie-nuc14rvs.bj.intel.com ([10.238.152.23])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 01:08:58 -0800
From: Junjie Cao <junjie.cao@intel.com>
To: pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com
Cc: horms@kernel.org,
	linux-hams@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	stable@vger.kernel.org,
	junjie.cao@intel.com
Subject: [PATCH 1/2] netrom: fix possible deadlock in nr_rt_device_down
Date: Thu,  4 Dec 2025 17:09:04 +0800
Message-ID: <20251204090905.28663-2-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204090905.28663-1-junjie.cao@intel.com>
References: <20251204090905.28663-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a circular locking dependency involving
nr_neigh_list_lock, nr_node_list_lock and nr_node->node_lock in the
NET/ROM routing code [1].

One of the problematic scenarios looks like this:

  CPU0                               CPU1
  ----                               ----
  nr_rt_device_down()                nr_rt_ioctl()
    lock(nr_neigh_list_lock);          nr_del_node()
    ...                                  lock(nr_node_list_lock);
    lock(nr_node_list_lock);            nr_remove_neigh();
                                          lock(nr_neigh_list_lock);

This creates the following lock chain:

  nr_neigh_list_lock -> nr_node_list_lock -> &nr_node->node_lock

while the ioctl path may acquire the locks in the opposite order via
nr_dec_obs()/nr_del_node(), which makes lockdep complain about a
possible deadlock.

Refactor nr_rt_device_down() to avoid nested locking of
nr_neigh_list_lock and nr_node_list_lock. The function now performs
two separate passes: one that walks all nodes under nr_node_list_lock
and drops routes, and a second one that removes unused neighbours
under nr_neigh_list_lock.

Also adjust nr_rt_free() to acquire nr_node_list_lock before
nr_neigh_list_lock so that the global lock ordering remains
consistent.

[1] https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82

Reported-by: syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82
Tested-by: syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Junjie Cao <junjie.cao@intel.com>
---
 net/netrom/nr_route.c | 65 ++++++++++++++++++++++---------------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index b94cb2ffbaf8..20aacfdfccd4 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -508,40 +508,41 @@ void nr_rt_device_down(struct net_device *dev)
 {
 	struct nr_neigh *s;
 	struct hlist_node *nodet, *node2t;
-	struct nr_node  *t;
+	struct nr_node *t;
 	int i;
 
-	spin_lock_bh(&nr_neigh_list_lock);
-	nr_neigh_for_each_safe(s, nodet, &nr_neigh_list) {
-		if (s->dev == dev) {
-			spin_lock_bh(&nr_node_list_lock);
-			nr_node_for_each_safe(t, node2t, &nr_node_list) {
-				nr_node_lock(t);
-				for (i = 0; i < t->count; i++) {
-					if (t->routes[i].neighbour == s) {
-						t->count--;
-
-						switch (i) {
-						case 0:
-							t->routes[0] = t->routes[1];
-							fallthrough;
-						case 1:
-							t->routes[1] = t->routes[2];
-							break;
-						case 2:
-							break;
-						}
-					}
-				}
+	spin_lock_bh(&nr_node_list_lock);
+	nr_node_for_each_safe(t, node2t, &nr_node_list) {
+		nr_node_lock(t);
+		for (i = 0; i < t->count; i++) {
+			s = t->routes[i].neighbour;
+			if (s->dev == dev) {
+				t->count--;
 
-				if (t->count <= 0)
-					nr_remove_node_locked(t);
-				nr_node_unlock(t);
+				switch (i) {
+				case 0:
+					t->routes[0] = t->routes[1];
+					fallthrough;
+				case 1:
+					t->routes[1] = t->routes[2];
+					break;
+				case 2:
+					break;
+				}
+				i--;
 			}
-			spin_unlock_bh(&nr_node_list_lock);
+		}
 
+		if (t->count <= 0)
+			nr_remove_node_locked(t);
+		nr_node_unlock(t);
+	}
+	spin_unlock_bh(&nr_node_list_lock);
+
+	spin_lock_bh(&nr_neigh_list_lock);
+	nr_neigh_for_each_safe(s, nodet, &nr_neigh_list) {
+		if (s->dev == dev)
 			nr_remove_neigh_locked(s);
-		}
 	}
 	spin_unlock_bh(&nr_neigh_list_lock);
 }
@@ -962,23 +963,23 @@ const struct seq_operations nr_neigh_seqops = {
 void nr_rt_free(void)
 {
 	struct nr_neigh *s = NULL;
-	struct nr_node  *t = NULL;
+	struct nr_node *t = NULL;
 	struct hlist_node *nodet;
 
-	spin_lock_bh(&nr_neigh_list_lock);
 	spin_lock_bh(&nr_node_list_lock);
+	spin_lock_bh(&nr_neigh_list_lock);
 	nr_node_for_each_safe(t, nodet, &nr_node_list) {
 		nr_node_lock(t);
 		nr_remove_node_locked(t);
 		nr_node_unlock(t);
 	}
 	nr_neigh_for_each_safe(s, nodet, &nr_neigh_list) {
-		while(s->count) {
+		while (s->count) {
 			s->count--;
 			nr_neigh_put(s);
 		}
 		nr_remove_neigh_locked(s);
 	}
-	spin_unlock_bh(&nr_node_list_lock);
 	spin_unlock_bh(&nr_neigh_list_lock);
+	spin_unlock_bh(&nr_node_list_lock);
 }
-- 
2.43.0


