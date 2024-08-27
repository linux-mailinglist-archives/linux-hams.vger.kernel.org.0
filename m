Return-Path: <linux-hams+bounces-408-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F669608A3
	for <lists+linux-hams@lfdr.de>; Tue, 27 Aug 2024 13:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 499B31C2263A
	for <lists+linux-hams@lfdr.de>; Tue, 27 Aug 2024 11:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9977915535A;
	Tue, 27 Aug 2024 11:27:39 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AB119F467;
	Tue, 27 Aug 2024 11:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758059; cv=none; b=KYgf+8u0xAIM7xfvMjak6jdeR/y79u9i6VrKAGLyGCXL0AwM6Nv8SvQvhtEPR0PEOzP5f+3hl4f0tL4fLZWFlIy8IJVOZmmARkmtgZOjsxo4ttsKX/yHpoPHDcdBRdkbPrO6j8SqG1h7CawZ66GNBPlcFnLwmcstx0V0CTAZn2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758059; c=relaxed/simple;
	bh=24/ui4nF7kMcAQRDKhymRHy35ENQZccWOo9pslOEaG0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q5eIwWjVRceYBpQwfSMCdwge4wc7SKcP61USHfmZcE+kV59+hG/WbnguEU4+XJgnBPn/x69q5va82dkW93stuntZxAyuAzgsLomjLF/axcELcBkohZzHQ9SS/Ayw7NBD2pvQ2t3FBIiFpvTmVtDmOVYh0yrGOpXDQRUDSKCHTLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WtQHw5Ms7z1j7Tv;
	Tue, 27 Aug 2024 19:27:24 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 9FED9140136;
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
Subject: [PATCH net-next 6/6] net/ipv4: net: prefer strscpy over strcpy
Date: Tue, 27 Aug 2024 19:35:27 +0800
Message-ID: <20240827113527.4019856-7-lihongbo22@huawei.com>
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
 net/ipv4/ip_tunnel.c            | 2 +-
 net/ipv4/netfilter/arp_tables.c | 2 +-
 net/ipv4/netfilter/ip_tables.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 5cffad42fe8c..1c33fcbc0827 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -1326,7 +1326,7 @@ int ip_tunnel_init(struct net_device *dev)
 
 	tunnel->dev = dev;
 	tunnel->net = dev_net(dev);
-	strcpy(tunnel->parms.name, dev->name);
+	strscpy(tunnel->parms.name, dev->name, sizeof(tunnel->parms.name));
 	iph->version		= 4;
 	iph->ihl		= 5;
 
diff --git a/net/ipv4/netfilter/arp_tables.c b/net/ipv4/netfilter/arp_tables.c
index 14365b20f1c5..2fa6ea78db9e 100644
--- a/net/ipv4/netfilter/arp_tables.c
+++ b/net/ipv4/netfilter/arp_tables.c
@@ -826,7 +826,7 @@ static int get_info(struct net *net, void __user *user, const int *len)
 		       sizeof(info.underflow));
 		info.num_entries = private->number;
 		info.size = private->size;
-		strcpy(info.name, name);
+		strscpy(info.name, name, sizeof(info.name));
 
 		if (copy_to_user(user, &info, *len) != 0)
 			ret = -EFAULT;
diff --git a/net/ipv4/netfilter/ip_tables.c b/net/ipv4/netfilter/ip_tables.c
index fe89a056eb06..d853070432c6 100644
--- a/net/ipv4/netfilter/ip_tables.c
+++ b/net/ipv4/netfilter/ip_tables.c
@@ -981,7 +981,7 @@ static int get_info(struct net *net, void __user *user, const int *len)
 		       sizeof(info.underflow));
 		info.num_entries = private->number;
 		info.size = private->size;
-		strcpy(info.name, name);
+		strscpy(info.name, name, sizeof(info.name));
 
 		if (copy_to_user(user, &info, *len) != 0)
 			ret = -EFAULT;
-- 
2.34.1


