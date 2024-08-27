Return-Path: <linux-hams+bounces-403-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE71A960897
	for <lists+linux-hams@lfdr.de>; Tue, 27 Aug 2024 13:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A3722845D3
	for <lists+linux-hams@lfdr.de>; Tue, 27 Aug 2024 11:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD8F1A00F8;
	Tue, 27 Aug 2024 11:27:38 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7295915535A;
	Tue, 27 Aug 2024 11:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758058; cv=none; b=qRfUhs5g8rB4Ko8P0770GUOrOgp8uqVLijD1ktBBHIl0m+Dob882Sas4lukigO/gXe1GcFP4oZv1xvg4lgRqogVmY9GR3S2cMwGN0+LqLANcNNeahsueVRh94A/5lGk56GyBYr64/pggnQNU2fjduR57tAvW32JHgBBfxoyUskE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758058; c=relaxed/simple;
	bh=DSngizSiJ08ipddfWD9GtUALHF9xXbtk6JJr0iHbQMI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MSn6w7KKnYfbQLvKX/OnE8NqAqq+fNfCFqjbvyNQInlRFjCjzWbKtCbytzt0GImaOEWDLi0jj34Esi6vTAnvIKFcufU/D9bjjqWJCFUjUG+rmsIRz79QeKGw+4f+hpiLBxp6Uc5nDMpavcIj/gp9lnCiZvCSomm7yov64a7cIwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WtQG91sFMzpTpP;
	Tue, 27 Aug 2024 19:25:53 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id C7E83180AE7;
	Tue, 27 Aug 2024 19:27:33 +0800 (CST)
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
Subject: [PATCH net-next 1/6] net: prefer strscpy over strcpy
Date: Tue, 27 Aug 2024 19:35:22 +0800
Message-ID: <20240827113527.4019856-2-lihongbo22@huawei.com>
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
 net/core/dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 0d0b983a6c21..f5e0a0d801fd 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -11121,7 +11121,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 	if (!dev->ethtool)
 		goto free_all;
 
-	strcpy(dev->name, name);
+	strscpy(dev->name, name, sizeof(dev->name));
 	dev->name_assign_type = name_assign_type;
 	dev->group = INIT_NETDEV_GROUP;
 	if (!dev->ethtool_ops)
-- 
2.34.1


