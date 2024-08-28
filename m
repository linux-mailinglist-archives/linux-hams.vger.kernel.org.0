Return-Path: <linux-hams+bounces-414-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 171519626F1
	for <lists+linux-hams@lfdr.de>; Wed, 28 Aug 2024 14:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4588D1C2116D
	for <lists+linux-hams@lfdr.de>; Wed, 28 Aug 2024 12:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B16E177982;
	Wed, 28 Aug 2024 12:24:34 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0A8171E40;
	Wed, 28 Aug 2024 12:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724847874; cv=none; b=soTv3BElye9uGhRfNfhyd01EHtHyBaxxic6mYlvnKzaK5H67K3ntTfjYqfFtFoW80KfQSJ8kA8kv4EOoHzeR9zc9+u3ZHvSqwzqh1BYoUS4zvwwJ+NO91+F41HQF5eQkPN+r461y2hdYJ6DGxQTT5PrrnRh2YbGHMxiDBLtk/ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724847874; c=relaxed/simple;
	bh=qYAFoQfx9FFxQ69I03wOJ1UUT/sKe3hcsz0+FUYZxSQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gzu/1mBSIH74sfcm6c1IZswrsr9laWqBQ/90dmoKKCA6c0L5rYtnSuhbsTXxRKwEOBTzsQcqbAxd0SOLQVBIi7E0gKZW0qCIG2RjTIm79YMhoepZBomXyGlEymwdB9mRnkHZTykOsJGDwppqsi7fvd+jRE2tE40gh21nB0e1Zx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wv3Vl67jTzyRCW;
	Wed, 28 Aug 2024 20:23:59 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 4734C180AE7;
	Wed, 28 Aug 2024 20:24:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 Aug
 2024 20:24:30 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <dsahern@kernel.org>, <ralf@linux-mips.org>,
	<jmaloy@redhat.com>, <ying.xue@windriver.com>, <dan.carpenter@linaro.org>
CC: <netdev@vger.kernel.org>, <linux-hams@vger.kernel.org>,
	<netfilter-devel@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH net-next v2 5/6] net/tipc: replace deprecated strcpy with strscpy
Date: Wed, 28 Aug 2024 20:32:23 +0800
Message-ID: <20240828123224.3697672-6-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828123224.3697672-1-lihongbo22@huawei.com>
References: <20240828123224.3697672-1-lihongbo22@huawei.com>
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
 net/tipc/bearer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/tipc/bearer.c b/net/tipc/bearer.c
index 3c9e25f6a1d2..ae1ddbf71853 100644
--- a/net/tipc/bearer.c
+++ b/net/tipc/bearer.c
@@ -326,7 +326,7 @@ static int tipc_enable_bearer(struct net *net, const char *name,
 	if (!b)
 		return -ENOMEM;
 
-	strcpy(b->name, name);
+	strscpy(b->name, name);
 	b->media = m;
 	res = m->enable_media(net, b, attr);
 	if (res) {
-- 
2.34.1


