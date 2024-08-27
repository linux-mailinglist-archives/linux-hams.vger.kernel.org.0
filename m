Return-Path: <linux-hams+bounces-405-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFEE96089B
	for <lists+linux-hams@lfdr.de>; Tue, 27 Aug 2024 13:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 084371F23AB1
	for <lists+linux-hams@lfdr.de>; Tue, 27 Aug 2024 11:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DA41A01BD;
	Tue, 27 Aug 2024 11:27:38 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD19215D5B6;
	Tue, 27 Aug 2024 11:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758058; cv=none; b=JMgKK4/mYfzzWxksw682eSdqcaPWTFIP+1qv8nrjOCUwuYSIrCpWF4qUvJ1J1yxn98Zon+5tMkb5SCuAdUuwgATQRV+UwqYuLECIb0BvyQCmJosAZ1Q2OtLMlXq8ieS2LGLTgQSKrteYRASd1yYMvC1FxonjUxo6nDK6R+ZbzrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758058; c=relaxed/simple;
	bh=oc1IHk3saXNkwAHJbOp8stezWZFf4PzZGuHh9QzYHgY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PVlt+3W1iW9SKCAuYd5knhXVV7N28WXW1oxP47+kjZMHynUQL2aHuZkRFHpdFA+7/we/kicD3N67MSIHX1dNCRuVSLK3w6cOOvFD0u4aahTGN33W2NA+xwR5ah3iSIyFZHUX8kwSkqYScbW/bPCrYRsvU+nz0ENwWncexbdbPl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WtQFr6fJWz1xwLn;
	Tue, 27 Aug 2024 19:25:36 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 27EBE140136;
	Tue, 27 Aug 2024 19:27:34 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 19:27:33 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <dsahern@kernel.org>, <ralf@linux-mips.org>,
	<jmaloy@redhat.com>, <ying.xue@windriver.com>
CC: <netdev@vger.kernel.org>, <linux-hams@vger.kernel.org>,
	<netfilter-devel@vger.kernel.org>
Subject: [PATCH net-next 3/6] net/netrom: prefer strscpy over strcpy
Date: Tue, 27 Aug 2024 19:35:24 +0800
Message-ID: <20240827113527.4019856-4-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827113527.4019856-1-lihongbo22@huawei.com>
References: <20240827113527.4019856-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500022.china.huawei.com (7.185.36.66)

The deprecated helper strcpy() performs no bounds checking on the
destination buffer. This could result in linear overflows beyond
the end of the buffer, leading to all kinds of misbehaviors.
The safe replacement is strscpy() [1].

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 net/netrom/nr_route.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index bd2b17b219ae..e4e8c188cbc9 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -189,7 +189,7 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
 		}
 
 		nr_node->callsign = *nr;
-		strcpy(nr_node->mnemonic, mnemonic);
+		strscpy(nr_node->mnemonic, mnemonic, sizeof(nr_node->mnemonic));
 
 		nr_node->which = 0;
 		nr_node->count = 1;
@@ -214,7 +214,7 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
 	nr_node_lock(nr_node);
 
 	if (quality != 0)
-		strcpy(nr_node->mnemonic, mnemonic);
+		strscpy(nr_node->mnemonic, mnemonic, sizeof(nr_node->mnemonic));
 
 	for (found = 0, i = 0; i < nr_node->count; i++) {
 		if (nr_node->routes[i].neighbour == nr_neigh) {
-- 
2.34.1


