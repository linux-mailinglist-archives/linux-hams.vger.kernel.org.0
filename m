Return-Path: <linux-hams+bounces-406-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D6096089F
	for <lists+linux-hams@lfdr.de>; Tue, 27 Aug 2024 13:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF6AE1F23AFD
	for <lists+linux-hams@lfdr.de>; Tue, 27 Aug 2024 11:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC601A0730;
	Tue, 27 Aug 2024 11:27:39 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A3019EEDC;
	Tue, 27 Aug 2024 11:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758059; cv=none; b=tdkiER/RcW5PRKRaE7Ps92lEFLTMPnQKSkrKHmsr2YbfEpJatJB8RmODu8SlmSC8DIUCf+qx9p4TEkGWHHuvWYT0EEVT5OvzaBQjQAxeYFOeYHyLtC0QvKEVhnFVewvx1wBxzn7g/65jMm7TkCJI8BzvI2BirINzbYCx3xl3OXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758059; c=relaxed/simple;
	bh=A+bz62SURqJ0evb7/+/XFnOmCo6+sJBPI7g1X0ozhQE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T9mnog/GBpZvJcbP5pqJo/FtS0mBko01MSF+SSyKHshAxM6Fb8J/Ucl3trHVuSbsF3NmgAkg5FXdOtqpxTr1husy/1r+eVWlOO6Olqjo3cMlFqyg3dDTLwH6EnTF6ck37iiWU2K1OQCe4E3JR5/EbBp8fBqGJhE4Y6CBmRnQM7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WtQG95ZCmzpTcn;
	Tue, 27 Aug 2024 19:25:53 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 521AC180105;
	Tue, 27 Aug 2024 19:27:34 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 19:27:34 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <dsahern@kernel.org>, <ralf@linux-mips.org>,
	<jmaloy@redhat.com>, <ying.xue@windriver.com>
CC: <netdev@vger.kernel.org>, <linux-hams@vger.kernel.org>,
	<netfilter-devel@vger.kernel.org>
Subject: [PATCH net-next 4/6] net/netfilter: replace deprecated strcpy with strscpy
Date: Tue, 27 Aug 2024 19:35:25 +0800
Message-ID: <20240827113527.4019856-5-lihongbo22@huawei.com>
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
 net/netfilter/xt_recent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netfilter/xt_recent.c b/net/netfilter/xt_recent.c
index 588a5e6ad899..06af3afa1d32 100644
--- a/net/netfilter/xt_recent.c
+++ b/net/netfilter/xt_recent.c
@@ -400,7 +400,7 @@ static int recent_mt_check(const struct xt_mtchk_param *par,
 	t->nstamps_max_mask = nstamp_mask;
 
 	memcpy(&t->mask, &info->mask, sizeof(t->mask));
-	strcpy(t->name, info->name);
+	strscpy(t->name, info->name, sizeof(t->name));
 	INIT_LIST_HEAD(&t->lru_list);
 	for (i = 0; i < ip_list_hash_size; i++)
 		INIT_LIST_HEAD(&t->iphash[i]);
-- 
2.34.1


