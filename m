Return-Path: <linux-hams+bounces-714-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 915F4C935EC
	for <lists+linux-hams@lfdr.de>; Sat, 29 Nov 2025 02:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 40E9F4E1B95
	for <lists+linux-hams@lfdr.de>; Sat, 29 Nov 2025 01:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30261AC44D;
	Sat, 29 Nov 2025 01:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="LrE6FJBV"
X-Original-To: linux-hams@vger.kernel.org
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5D83B2BA;
	Sat, 29 Nov 2025 01:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764379598; cv=none; b=rsABnOPCj29SqYAlqL+F2/1RVLKKkuTkwgazmUc3i3NqdH15KH8NelLj67H+XWKhjqZ3GiFaE/q4AA1rRo0YseHjw6G5vfXuH/iMCVwiJQeaXxKdLT+Hw/A8jXY056HP+Y+pmRH4qc1nPpgJ+sGqvO6//FzQwiYtS/oCUodbZd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764379598; c=relaxed/simple;
	bh=ewOzqBKwdXP2n5uFK7vR5ZffAKyeil1Qzl64Ul+4IRI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KFRyoPId8PpzKrUO4z9Apm/soN2rYY0zKU59suEx1XxoUZyKnaeAW09/lXYl/uWtJDTZFAvkJhlUM/+hGTl8OcZcC/lTB4quEcIvhAT/zGkiBiz66m75/er84v6qOO/IzArj5UMH7qR0G8Q+TgRcAFO1LJfDVZ4H6+z5tCVii34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=LrE6FJBV; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GiqVXD80ZeUaSSf/XrxvOWEFSml7KvNySEMk5eirPLE=;
	b=LrE6FJBVlzSyrlV6Q6dSkv9nTgGYqLICTUB2vkWq1U+3jCxQa5Am2ycQKP5ntdLfd8vVc3CjJ
	OL4aeAipKEbERHZdq+Ct1iKPLFtfgiz4BcVtrhSbAdqjaJa502jySZGPms/cWPU1b+cATx776wL
	wU3R2fOLAL/dqem+9dMS4ho=
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dJCBk5ZBCz1T4G3;
	Sat, 29 Nov 2025 09:24:46 +0800 (CST)
Received: from dggpemf500016.china.huawei.com (unknown [7.185.36.197])
	by mail.maildlp.com (Postfix) with ESMTPS id 44B42180481;
	Sat, 29 Nov 2025 09:26:33 +0800 (CST)
Received: from huawei.com (10.50.85.128) by dggpemf500016.china.huawei.com
 (7.185.36.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 29 Nov
 2025 09:26:32 +0800
From: Wang Liang <wangliang74@huawei.com>
To: <syzbot+d7abc36bbbb6d7d40b58@syzkaller.appspotmail.com>
CC: <davem@davemloft.net>, <edumazet@google.com>, <horms@kernel.org>,
	<kuba@kernel.org>, <linux-hams@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<pabeni@redhat.com>, <syzkaller-bugs@googlegroups.com>,
	<yuehaibing@huawei.com>, <zhangchangzhong@huawei.com>,
	<wangliang74@huawei.com>
Subject: Re: [syzbot] [hams?] memory leak in nr_sendmsg
Date: Sat, 29 Nov 2025 09:47:43 +0800
Message-ID: <20251129014743.1368452-1-wangliang74@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <692a2462.a70a0220.d98e3.0152.GAE@google.com>
References: <692a2462.a70a0220.d98e3.0152.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500016.china.huawei.com (7.185.36.197)

#syz test

diff --git a/net/netrom/nr_out.c b/net/netrom/nr_out.c
index 5e531394a724..2b3cbceb0b52 100644
--- a/net/netrom/nr_out.c
+++ b/net/netrom/nr_out.c
@@ -43,8 +43,10 @@ void nr_output(struct sock *sk, struct sk_buff *skb)
 		frontlen = skb_headroom(skb);
 
 		while (skb->len > 0) {
-			if ((skbn = sock_alloc_send_skb(sk, frontlen + NR_MAX_PACKET_SIZE, 0, &err)) == NULL)
+			if ((skbn = sock_alloc_send_skb(sk, frontlen + NR_MAX_PACKET_SIZE, 0, &err)) == NULL) {
+				kfree_skb(skb);
 				return;
+			}
 
 			skb_reserve(skbn, frontlen);
 
-- 
2.34.1


