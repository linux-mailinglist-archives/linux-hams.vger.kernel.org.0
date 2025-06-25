Return-Path: <linux-hams+bounces-529-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32212AE7E04
	for <lists+linux-hams@lfdr.de>; Wed, 25 Jun 2025 11:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 502903B8770
	for <lists+linux-hams@lfdr.de>; Wed, 25 Jun 2025 09:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE68275B04;
	Wed, 25 Jun 2025 09:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="XGHkEr+3"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp-fw-52002.amazon.com (smtp-fw-52002.amazon.com [52.119.213.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BA31DEFE7;
	Wed, 25 Jun 2025 09:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845056; cv=none; b=KnVI93rw794h1GUpDlvpo3dheB/dgmYmpRBysLWQbIt+J4mX+R3bsTbRn+m9QsJHTRkt7KUvtINNM7cOVk/dTN1hPqXKiXjLUBrEWOt3iVoTs9OBueWg/BzQevg/tMH1tumLbUnD6jJfDxK7DTyJmexfdx5Hyj8fmvq/QILPjVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845056; c=relaxed/simple;
	bh=XV1nkjfUcMxl3FXXMlmgCgmpon5+5Xw73zAFoBzP0nI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uGw/TOYap4h80+c9Dmx2wVBP1AuSUSDY72C0RZtQN27FDh2vZ5OG8VOod4nYPR0K+u4K4cXOSdxTJk7wzT/Og+RV6x4YtZgnUyt7WN35/wb2Ten+Ky2GmAvP5QDu2foYUYecIDjsE9NV25YajfvA6Nq7/V0R3tDPhyrmjMun3S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=XGHkEr+3; arc=none smtp.client-ip=52.119.213.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1750845055; x=1782381055;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i9pQ+MlE5S8O+IzYQuqdhdmkfSkIm+1g1tP/i8TStbQ=;
  b=XGHkEr+3QYKvlpxVIzCK9sS5bSBFF+CQcuWkoPY1qCV0zlOAnv9joy64
   a7SYa/sYk2r6eJO4n8ciJKDBPuM1HllOr/FwBRW37PYYh3NnN2OxhAYyh
   5UB5XhCMWuf5zn9aC1w2kB4e2TDsjQrJmfJVuKOQfgVxj+cMPrz6F8KsL
   MkcWS+T+uiKouYREx4XHAU7gRXN0pTgmEf5qlc0Nl+2wCssko87bZakRB
   TwXasApLXEXsZSTovsuQhNPknAtua0zIXJmOGanPIeIgpzw/xbttY803r
   nxI1nDhRmkOLy6vuoKsrz0Won2aSOV/X0LSwv4PER8phskFcysHeHWvAB
   A==;
X-IronPort-AV: E=Sophos;i="6.16,264,1744070400"; 
   d="scan'208";a="736823987"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52002.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:50:29 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.21.151:3829]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.18:2525] with esmtp (Farcaster)
 id b83153d2-cbb2-4d13-bb3b-3d09a4fbbfc7; Wed, 25 Jun 2025 09:50:27 +0000 (UTC)
X-Farcaster-Flow-ID: b83153d2-cbb2-4d13-bb3b-3d09a4fbbfc7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 25 Jun 2025 09:50:26 +0000
Received: from b0be8375a521.amazon.com (10.37.244.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 25 Jun 2025 09:50:24 +0000
From: Kohei Enju <enjuk@amazon.com>
To: <netdev@vger.kernel.org>, <linux-hams@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Kuniyuki Iwashima
	<kuniyu@google.com>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Kohei Enju <kohei.enju@gmail.com>, Kohei Enju
	<enjuk@amazon.com>, <syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com>
Subject: [PATCH net v1] rose: fix dangling neighbour pointers in rose_rt_device_down()
Date: Wed, 25 Jun 2025 18:49:44 +0900
Message-ID: <20250625095005.66148-2-enjuk@amazon.com>
X-Mailer: git-send-email 2.48.1
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

There are two bugs in rose_rt_device_down() that can lead to
use-after-free:

1. The loop bound `t->count` is modified within the loop, which can
   cause the loop to terminate early and miss some entries.

2. When removing an entry from the neighbour array, the subsequent entries
   are moved up to fill the gap, but the loop index `i` is still
   incremented, causing the next entry to be skipped.

For example, if a node has three neighbours (A, B, A) and A is being
removed:
- 1st iteration (i=0): A is removed, array becomes (B, A, A), count=2
- 2nd iteration (i=1): We now check A instead of B, skipping B entirely
- 3rd iteration (i=2): Loop terminates early due to count=2

This leaves the second A in the array with count=2, but the rose_neigh
structure has been freed. Accessing code assumes that the first `count`
entries are valid pointers, causing a use-after-free when it accesses
the dangling pointer.

Fix both issues by iterating over the array in reverse order with a fixed
loop bound. This ensures that all entries are examined and that the removal
of an entry doesn't affect the iteration of subsequent entries.

Reported-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e04e2c007ba2c80476cb
Tested-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Kohei Enju <enjuk@amazon.com>
---
 net/rose/rose_route.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index 2dd6bd3a3011..a488fd8c4710 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -479,7 +479,7 @@ void rose_rt_device_down(struct net_device *dev)
 {
 	struct rose_neigh *s, *rose_neigh;
 	struct rose_node  *t, *rose_node;
-	int i;
+	int i, j;
 
 	spin_lock_bh(&rose_node_list_lock);
 	spin_lock_bh(&rose_neigh_list_lock);
@@ -497,22 +497,14 @@ void rose_rt_device_down(struct net_device *dev)
 			t         = rose_node;
 			rose_node = rose_node->next;
 
-			for (i = 0; i < t->count; i++) {
+			for (i = t->count - 1; i >= 0; i--) {
 				if (t->neighbour[i] != s)
 					continue;
 
 				t->count--;
 
-				switch (i) {
-				case 0:
-					t->neighbour[0] = t->neighbour[1];
-					fallthrough;
-				case 1:
-					t->neighbour[1] = t->neighbour[2];
-					break;
-				case 2:
-					break;
-				}
+				for (j = i; j < t->count; j++)
+					t->neighbour[j] = t->neighbour[j + 1];
 			}
 
 			if (t->count <= 0)
-- 
2.48.1


