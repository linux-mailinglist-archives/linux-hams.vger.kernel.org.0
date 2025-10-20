Return-Path: <linux-hams+bounces-659-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09445BF0B78
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 13:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C1383E5E15
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 11:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCF22D9EEA;
	Mon, 20 Oct 2025 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="r0I40SDR"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8112F25A2B5;
	Mon, 20 Oct 2025 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760958190; cv=none; b=RTgefx9EnVx1mmcZrS20ZC+D5BNVc7p08xSs4xbx4EXBLcV2h6NYTt9qWh1IlrNQr7ITdD6DFmpm06WycPttl2GCQRXIn03BfRr6c1Mwo+28gWZdFRcw3kxmFjB/p5a7VyPKugQ/Ofi5QuiEb3KN0ljHvyd7jVufdD9qjQWPy7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760958190; c=relaxed/simple;
	bh=uTy13h8Bh8GmGg4viRWana9rJcoqUxHqfN60ZTJptq4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RdU3Ez3SxR9F0KDvdYohuhJnxOv7z8xaYC2I0fq0ArpkJsin1FHnMAm7+bb2JKWULxOYXvBw1wT7VluUF+rWLH6pO3SZaeUIyMul0SzqXRgFLp+I2XKfXxaEu3Uk5sLUl9MhKmIu+d58CigcSHbQQ/HCC4WDpIax3kkdo3kO/QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=r0I40SDR; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KAx3AJ2647827;
	Mon, 20 Oct 2025 11:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=AJ/Kr5Rp4wWGUhcXuXNylkJ/RJG30RRJRygVeBM29Ic=; b=
	r0I40SDR304uPkz2j/IvZ16wTozEmsmbsJ4NxJtprZ/yRHRxAIzAdI9a5G+35pSw
	A44heb+Eonc27hK8QnA9S9yR/JFpAQUnruTasWhyOWakbBzhVQb21JHZe6Sz7b/d
	7DvdB5TNNP0af76yd2rUbjEdUPzLAmru5lHUEbrEKH7+AQwCLOjfyjaTXgZZwIJG
	SeYmh4pW15qad0IreGPOB9o/3FJK7pJRAsF7SmBKK4Za4NCuUwf5ePo6CHT0PAEF
	kric26RCgm/kpl/EIPgTIXZia5+7pEUaFSX7vMtGBx+2zeCVl//1g35F4Ef6R06C
	Th13X3+d5UlTJBd0nZbKjA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v03y1t4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 20 Oct 2025 11:02:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 20 Oct 2025 04:02:47 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Mon, 20 Oct 2025 04:02:44 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <dan.carpenter@linaro.org>
CC: <davem@davemloft.net>, <edumazet@google.com>, <horms@kernel.org>,
        <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lizhi.xu@windriver.com>,
        <netdev@vger.kernel.org>, <pabeni@redhat.com>,
        <syzbot+2860e75836a08b172755@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH V2] netrom: Prevent race conditions between multiple add route
Date: Mon, 20 Oct 2025 19:02:44 +0800
Message-ID: <20251020110244.3200311-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aPYKgFTIroUhJAJA@stanley.mountain>
References: <aPYKgFTIroUhJAJA@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: UoIN2cRs8T7sjCiz6rGGAAHF70uY9LRc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDA5MCBTYWx0ZWRfXw3pTxr/o5MnW
 47s4O/RMpo7PcxLbGYhNpI9fnUfangmHN7cigXGugoAedmTSSdNv/VOfeZOKUKDO4CSCQoqZvkE
 7RbJ09PmlID3OkQAjwE7w5Y6O0LdO+bT0khWfb7ngawbDsAgTFwluSlG2uxQ7RiM71HKjFG05dZ
 hfRck2v+Wzg70eWDVq8ToD9lPdu6o6To/FKltp1t+LGqjpm0xe4U+UcIsJy+O1z0Ul/ygQWZsrq
 SUTlvtxrOS/BoeU/NC9bG8ZGgUjerBtRg89ruVQVHZkcaqNQFTmmc321uDqlLDHFeMh9dcnUdc/
 pCaBaU/3uY5iXcq3J3lhFgnsswTytv/YF0IV+9Lq6uSTwdG1CpTmASDFy2wJ9Q4BRn9DMk8RvCy
 JPKMUkk1nGeCx3WS07Kc6Wuss1gk8g==
X-Proofpoint-ORIG-GUID: UoIN2cRs8T7sjCiz6rGGAAHF70uY9LRc
X-Authority-Analysis: v=2.4 cv=Uolu9uwB c=1 sm=1 tr=0 ts=68f616d8 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8
 a=t7CeM3EgAAAA:8 a=sx0YzN9DWx7IQLKmKLYA:9 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22 a=cPQSjfK2_nFv0Q5t_7PE:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=SsAZrZ5W_gNWK9tOzrEV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510200090

The root cause of the problem is that multiple different tasks initiate
NETROM_NODE commands to add new routes, there is no lock between them to
protect the same nr_neigh.
Task0 may add the nr_neigh.refcount value of 1 on Task1 to routes[2].

When Task2 executes nr_neigh_put(nr_node->routes[2].neighbour), it will
release the neighbour because its refcount value is 1.

In this case, the following situation causes a UAF:

Task0					Task1						Task2
=====					=====						=====
nr_add_node()
nr_neigh_get_dev()			nr_add_node()
					nr_node_lock()
					nr_node->routes[2].neighbour->count--
					nr_neigh_put(nr_node->routes[2].neighbour);
					nr_remove_neigh(nr_node->routes[2].neighbour)
					nr_node_unlock()
nr_node_lock()
nr_node->routes[2].neighbour = nr_neigh
nr_neigh_hold(nr_neigh);								nr_add_node()
											nr_neigh_put()

The solution to the problem is to use a lock to synchronize each add a route
to node.

syzbot reported:
BUG: KASAN: slab-use-after-free in nr_add_node+0x25db/0x2c00 net/netrom/nr_route.c:248
Read of size 4 at addr ffff888051e6e9b0 by task syz.1.2539/8741

Call Trace:
 <TASK>
 nr_add_node+0x25db/0x2c00 net/netrom/nr_route.c:248

Reported-by: syzbot+2860e75836a08b172755@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2860e75836a08b172755
Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
---
V1 -> V2: update comments for cause uaf

 net/netrom/nr_route.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index b94cb2ffbaf8..ae1e5ee1f52f 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -102,7 +102,9 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
 	struct nr_neigh *nr_neigh;
 	int i, found;
 	struct net_device *odev;
+	static DEFINE_MUTEX(add_node_lock);
 
+	guard(mutex)(&add_node_lock);
 	if ((odev=nr_dev_get(nr)) != NULL) {	/* Can't add routes to ourself */
 		dev_put(odev);
 		return -EINVAL;
-- 
2.43.0


