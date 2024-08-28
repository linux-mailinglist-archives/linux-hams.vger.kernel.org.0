Return-Path: <linux-hams+bounces-416-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AD99626F9
	for <lists+linux-hams@lfdr.de>; Wed, 28 Aug 2024 14:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BADB1C21C38
	for <lists+linux-hams@lfdr.de>; Wed, 28 Aug 2024 12:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D40017AE1D;
	Wed, 28 Aug 2024 12:24:35 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2581176233;
	Wed, 28 Aug 2024 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724847875; cv=none; b=eh+venkpb0R2FvpuRl/eMM12bVxvgEaWoQQIMUMoek5v491WZzuDcB65aDX32++FuuW0XfBkvlrE9HWGN29TgdOB3txHSXSTT8K74R3FEbi79T/R4e++82XsUG8afIA9zBPjmFos3ZJvwF02cUecXPglbhwRLrJlVIXgauSfP9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724847875; c=relaxed/simple;
	bh=yamfc4O+Z5YpW9l7oNEwgRHuIPAHfmVkTKB8P+Ojc7A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f2G6bEL0zwA1TyE9XDNWGzOizx4hRF+3LaVqXzF8rueUu3f8X1IVhSzIoAdRaLwKihrjbSQ996pWjyTo63Msv8pwFIR6/yXTcNvl77/hyP5H4R9gVvOEcNgsHuExCff77tCyF1QUoE/8eU5M/rVsf0OA98n5nx8k8kbqOfBLXvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wv3Pn01MXz20n1m;
	Wed, 28 Aug 2024 20:19:40 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F7C61A016C;
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
Subject: [PATCH net-next v2 6/6] net/ipv4: net: prefer strscpy over strcpy
Date: Wed, 28 Aug 2024 20:32:24 +0800
Message-ID: <20240828123224.3697672-7-lihongbo22@huawei.com>
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
 net/ipv4/ip_tunnel.c            | 2 +-
 net/ipv4/netfilter/arp_tables.c | 2 +-
 net/ipv4/netfilter/ip_tables.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 5cffad42fe8c..0cd2f3de100c 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -1326,7 +1326,7 @@ int ip_tunnel_init(struct net_device *dev)
 
 	tunnel->dev = dev;
 	tunnel->net = dev_net(dev);
-	strcpy(tunnel->parms.name, dev->name);
+	strscpy(tunnel->parms.name, dev->name);
 	iph->version		= 4;
 	iph->ihl		= 5;
 
diff --git a/net/ipv4/netfilter/arp_tables.c b/net/ipv4/netfilter/arp_tables.c
index 14365b20f1c5..42c34e8952da 100644
--- a/net/ipv4/netfilter/arp_tables.c
+++ b/net/ipv4/netfilter/arp_tables.c
@@ -826,7 +826,7 @@ static int get_info(struct net *net, void __user *user, const int *len)
 		       sizeof(info.underflow));
 		info.num_entries = private->number;
 		info.size = private->size;
-		strcpy(info.name, name);
+		strscpy(info.name, name);
 
 		if (copy_to_user(user, &info, *len) != 0)
 			ret = -EFAULT;
diff --git a/net/ipv4/netfilter/ip_tables.c b/net/ipv4/netfilter/ip_tables.c
index fe89a056eb06..97e754ddc155 100644
--- a/net/ipv4/netfilter/ip_tables.c
+++ b/net/ipv4/netfilter/ip_tables.c
@@ -981,7 +981,7 @@ static int get_info(struct net *net, void __user *user, const int *len)
 		       sizeof(info.underflow));
 		info.num_entries = private->number;
 		info.size = private->size;
-		strcpy(info.name, name);
+		strscpy(info.name, name);
 
 		if (copy_to_user(user, &info, *len) != 0)
 			ret = -EFAULT;
-- 
2.34.1


