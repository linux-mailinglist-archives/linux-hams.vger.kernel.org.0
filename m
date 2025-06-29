Return-Path: <linux-hams+bounces-535-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 201CAAECB22
	for <lists+linux-hams@lfdr.de>; Sun, 29 Jun 2025 05:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39F8A3B4219
	for <lists+linux-hams@lfdr.de>; Sun, 29 Jun 2025 03:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7964917C21E;
	Sun, 29 Jun 2025 03:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="iUIUOTk+"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com [99.78.197.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1256EEAA;
	Sun, 29 Jun 2025 03:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751166540; cv=none; b=UQmJ/7Aq/XowLRF1GRKEPvsukOQsh6i+4UwL74akX9VXEqXJiKN05aUTmAzudQMxuyvVHN+VpFmU95Y+lRpy5fp5ZrKiEEhTkKjVxHH+PXuc8YPJDHqMCD5pW8PdVOnXQAgSRqyaqNSPynkzTOcL8bQVJhSHUY6s3FvYOeteJj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751166540; c=relaxed/simple;
	bh=RK5Z/8V0Cvn5MyQ2lvLJ5kvvK7okLP7oTJeIK/QJzCY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uIqU6tL5bN6cUarMTZUEfMgeCO5mErstlPbXKCizmHSFkjOxmJKZ7o/s0xjl/3qg7iMLP3WdXGJHrtdbtOTYTXeSfKnRZ2UgH3xdOotA0BKK2h9qC5S4k1w5TOGLtEifUHJs7usBkBo2EEIP8x/eRayO7KTEi5WnPykPSSAQK7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=iUIUOTk+; arc=none smtp.client-ip=99.78.197.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1751166538; x=1782702538;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/1wU96fFlsrJiBIUTivDC2RYxvB3smo0WTj2uzdXEmY=;
  b=iUIUOTk+t112J/eMsveGxNR4emEA8LKNy8JKatb/O3scM08YuW3jXknc
   yfasVGhTsHGtXhsdk4qZQOVKYT7ohY8xW9/IVBnV7j5QK8exHHT7OUu+V
   X1FonQPqpeVAgGKzZVMdef7B1WVcUJCzvppdS6vr31X/2p4t/YlXdBUaG
   06Jcl/IgCrqLeHnDDuJ9bfQfSEoQHuOlYAScUMrALGWWkVhvZ/rvdJ3f6
   STzVncbcTmO46s73RC+gf9USjUxeEm4+Q0r2LPz84cuGZWbBNDzFpYWnf
   MQVcLPw+40c6tsoVrDP+e0+CbvLOLh4UAULXTSMPtXJJnotddvIWopXKN
   g==;
X-IronPort-AV: E=Sophos;i="6.16,274,1744070400"; 
   d="scan'208";a="215563240"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80009.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 03:08:58 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.7.35:61997]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.55.172:2525] with esmtp (Farcaster)
 id db2f4156-a369-4273-8671-a3bddd2ec5a6; Sun, 29 Jun 2025 03:08:57 +0000 (UTC)
X-Farcaster-Flow-ID: db2f4156-a369-4273-8671-a3bddd2ec5a6
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Sun, 29 Jun 2025 03:08:57 +0000
Received: from b0be8375a521.amazon.com (10.37.244.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Sun, 29 Jun 2025 03:08:55 +0000
From: Kohei Enju <enjuk@amazon.com>
To: <linux-hams@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, <kohei.enju@gmail.com>,
	Kohei Enju <enjuk@amazon.com>,
	<syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com>
Subject: [PATCH net v2] rose: fix dangling neighbour pointers in rose_rt_device_down()
Date: Sun, 29 Jun 2025 12:06:31 +0900
Message-ID: <20250629030833.6680-1-enjuk@amazon.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

There are two bugs in rose_rt_device_down() that can cause
use-after-free:

1. The loop bound `t->count` is modified within the loop, which can
   cause the loop to terminate early and miss some entries.

2. When removing an entry from the neighbour array, the subsequent entries
   are moved up to fill the gap, but the loop index `i` is still
   incremented, causing the next entry to be skipped.

For example, if a node has three neighbours (A, A, B) with count=3 and A
is being removed, the second A is not checked.

    i=0: (A, A, B) -> (A, B) with count=2
          ^ checked
    i=1: (A, B)    -> (A, B) with count=2
             ^ checked (B, not A!)
    i=2: (doesn't occur because i < count is false)

This leaves the second A in the array with count=2, but the rose_neigh
structure has been freed. Code that accesses these entries assumes that
the first `count` entries are valid pointers, causing a use-after-free
when it accesses the dangling pointer.

Fix both issues by iterating over the array in reverse order with a fixed
loop bound. This ensures that all entries are examined and that the removal
of an entry doesn't affect subsequent iterations.

Reported-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e04e2c007ba2c80476cb
Tested-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Kohei Enju <enjuk@amazon.com>
---
Changes:
  v2:
    - Change commit message to describe the UAF scenario correctly
    - Replace for loop with memmove() for array shifting
  v1: https://lore.kernel.org/all/20250625095005.66148-2-enjuk@amazon.com/
---
 net/rose/rose_route.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index 2dd6bd3a3011..b72bf8a08d48 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -497,22 +497,15 @@ void rose_rt_device_down(struct net_device *dev)
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
+				memmove(&t->neighbour[i], &t->neighbour[i + 1],
+					sizeof(t->neighbour[0]) *
+						(t->count - i));
 			}
 
 			if (t->count <= 0)
-- 
2.49.0


