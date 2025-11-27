Return-Path: <linux-hams+bounces-712-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A96AC8D61A
	for <lists+linux-hams@lfdr.de>; Thu, 27 Nov 2025 09:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E831E3AEE04
	for <lists+linux-hams@lfdr.de>; Thu, 27 Nov 2025 08:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BCF3242BE;
	Thu, 27 Nov 2025 08:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SdI6h346"
X-Original-To: linux-hams@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F167D2356A4;
	Thu, 27 Nov 2025 08:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764232864; cv=none; b=DPYoldY9wfjfkaXL48W/mF7CZDekRF+T/CihX8ubgINA31mkzvfbzx6Naa5+cjzRAVsdLGU/RV2l6z7ILVGgKLtG2ULPkJHda7IBOrVAPDyZ9klJcxBajojxuyrI0tkfqVgFJI6NExfeQOYAeqS90ZiyP+Nw23pixvc7iY4JDzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764232864; c=relaxed/simple;
	bh=jwpF5p7Btj34ZHiu4EGv+DefCVkf1TvTSypgzdIwT7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rEUIJDivAGS/qugcTDIYvJmkrawiZqIggA4KZQSDyBl160OvCKEY2cKPlvpFDzM1LWSpbAL7lJiY1BFCN4v4wsyScXzitd1fCNF6yMVQYQdJbVK3QKBpBP/Dsmj+alsDDpt5BhL2qdJvGgakj3aa5WvF1tQwuu0t3PagJ+S/rOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SdI6h346; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764232863; x=1795768863;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jwpF5p7Btj34ZHiu4EGv+DefCVkf1TvTSypgzdIwT7E=;
  b=SdI6h346857Q6KTEFgxSBq6LbxznyT33v9WkTvXtOchwZj635aPG3iRl
   8G1DSNEFNnl2V8RX0lI0poXJidM9AteBaaFO3d0J517ijcLRpZby7z4sA
   D2CGUhFBrTkiqx65N16ilM445k5Xa5qfp/hu+iP1KZRdDIeW6pfNLGQsk
   UEeQD9TH/WwnyFmOB9uK+bg0Ta42xeMjCf+ZkpekMC0/tKgEIS4gbC0/S
   3uDPHEr1kN5Qaxg8RVV1+SlQ1qd8wMSFyPU3oaKSIioJmTPUkOFf5m75c
   uC7gSXUcE5rYcEtnb6yUvGDt/ZLBgnY5iEIj9O1E69BCWdi15r7waXTaF
   Q==;
X-CSE-ConnectionGUID: /klX917wRBG3hkL6563k0w==
X-CSE-MsgGUID: h5UpO9A5QZ2xspsX9NB1gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65988441"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="65988441"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 00:41:02 -0800
X-CSE-ConnectionGUID: Nc8FAxgaTtuOrKnhIBW+MQ==
X-CSE-MsgGUID: vWf86RVcSzmTNVlSS3CfYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="192305036"
Received: from junjie-nuc14rvs.bj.intel.com ([10.238.152.23])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 00:40:59 -0800
From: Junjie Cao <junjie.cao@intel.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com
Cc: horms@kernel.org,
	linux-hams@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	stable@vger.kernel.org,
	junjie.cao@intel.com
Subject: [PATCH] netrom: fix possible deadlock between nr_rt_ioctl() and nr_rt_device_down()
Date: Thu, 27 Nov 2025 16:41:12 +0800
Message-ID: <20251127084112.123837-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
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
nr_neigh_list_lock and nr_node_list_lock.  The function now performs
two separate passes: one that walks all nodes under nr_node_list_lock
and drops routes / reference counts, and a second one that removes
unused neighbours under nr_neigh_list_lock.

This also fixes a reference count leak of nr_neigh in the node route
removal path.

[1] https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82

Reported-by: syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82
Tested-by: syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Junjie Cao <junjie.cao@intel.com>
---
 net/netrom/nr_route.c | 61 +++++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index b94cb2ffbaf8..cc8c47e1340a 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -511,37 +511,40 @@ void nr_rt_device_down(struct net_device *dev)
 	struct nr_node  *t;
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
+				s->count--;
+				nr_neigh_put(s);
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
@@ -965,8 +968,8 @@ void nr_rt_free(void)
 	struct nr_node  *t = NULL;
 	struct hlist_node *nodet;
 
-	spin_lock_bh(&nr_neigh_list_lock);
 	spin_lock_bh(&nr_node_list_lock);
+	spin_lock_bh(&nr_neigh_list_lock);
 	nr_node_for_each_safe(t, nodet, &nr_node_list) {
 		nr_node_lock(t);
 		nr_remove_node_locked(t);
@@ -979,6 +982,6 @@ void nr_rt_free(void)
 		}
 		nr_remove_neigh_locked(s);
 	}
-	spin_unlock_bh(&nr_node_list_lock);
 	spin_unlock_bh(&nr_neigh_list_lock);
+	spin_unlock_bh(&nr_node_list_lock);
 }
-- 
2.43.0


