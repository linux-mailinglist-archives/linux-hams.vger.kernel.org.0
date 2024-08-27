Return-Path: <linux-hams+bounces-407-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7169C9608A4
	for <lists+linux-hams@lfdr.de>; Tue, 27 Aug 2024 13:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCA9EB22AB3
	for <lists+linux-hams@lfdr.de>; Tue, 27 Aug 2024 11:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0941A073F;
	Tue, 27 Aug 2024 11:27:39 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6727B19F482;
	Tue, 27 Aug 2024 11:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758059; cv=none; b=VG4S9QX7E00kh+zXx9IcSNrxgbJyjan1LhjuauCpTW0DGcUY3QkfSnFan74pz3k1hOxHnTuRSKOfzsarhjqn2/hJu5wxCZ6HwcTjfbn6ee+vtOkj53B7q6P8D400aQ2awQpOHeQVpEle50wEu/hzs3ZnvlT8Vy1oi+orgwZcW+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758059; c=relaxed/simple;
	bh=o7Q9UZQtQ4RFG4lo7+eI/EacyNTw2iaqqD8X7EAZg+w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GiWOeodsO6hdn9SeW31wMJ85aFQ0FLaYSPNt29QxrhznKz+tGdt9c2ThLlq/MMlB4T7JzoMwYr8C3/oIQnKOJo0x94Yo71mVw2AeobWGhYboUAQNXI3rSQVcjiluiYUxSEL3WrVeOCD2t9uZE5nl2BO7W/gxFx+4JoZTOmtfe54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WtQDH5k77z1HHFw;
	Tue, 27 Aug 2024 19:24:15 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A102180044;
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
Subject: [PATCH net-next 5/6] net/tipc: replace deprecated strcpy with strscpy
Date: Tue, 27 Aug 2024 19:35:26 +0800
Message-ID: <20240827113527.4019856-6-lihongbo22@huawei.com>
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
 net/tipc/bearer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/tipc/bearer.c b/net/tipc/bearer.c
index 3c9e25f6a1d2..125a92e6aa3c 100644
--- a/net/tipc/bearer.c
+++ b/net/tipc/bearer.c
@@ -326,7 +326,7 @@ static int tipc_enable_bearer(struct net *net, const char *name,
 	if (!b)
 		return -ENOMEM;
 
-	strcpy(b->name, name);
+	strscpy(b->name, name, sizeof(b->name));
 	b->media = m;
 	res = m->enable_media(net, b, attr);
 	if (res) {
-- 
2.34.1


