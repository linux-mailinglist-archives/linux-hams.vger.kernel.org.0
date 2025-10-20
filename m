Return-Path: <linux-hams+bounces-657-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 54539BEFDD1
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 10:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 77A564E184D
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 08:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BD32E9ED5;
	Mon, 20 Oct 2025 08:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="ipuNKsAt"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EE42E9735;
	Mon, 20 Oct 2025 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760948073; cv=none; b=PCu03w4oJYWWNKYiAU8/3Pfehy4Qj2FT1E3/kHuNwfA0VoqlZEJrkiciJUqmgB3t+0h9pa0d1lh6MLK5FfvnY6jnlOWlgwJS3VJi+HGOgUJrh0g0EdTn+POfAW8uPoLd4/78p73pJEYPC2vWXol55G6HdUkFuom8rWKlKBlAjUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760948073; c=relaxed/simple;
	bh=b7RcGC+rlOoyYyHWy6EpOI4bZ4qo0j1xZf2JnvT1XSQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ij/zcR3kkLuFvQqG8gOWYoNbc9mbIPywLwFFMEUo0VgZK+oDKJL3nW5TiRSTwvsn0PusLBpRPdWhoEJncXXF83+BEUucWJrWr+NMImmLTL2cL/1of05B+SHsen5d9LJliSs9EnnTphQz0R3GSzzvw8XE+vydln+UKW/m13ydzfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=ipuNKsAt; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59K5U2Id1267559;
	Mon, 20 Oct 2025 08:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=0SyO3Eu4R2RtY8+48nADsC4nchute0+HCCVr0S74e6k=; b=
	ipuNKsAt60mRKZbY/FAF03XSlDEDsUL8jrIUmgoUFphDDj+N4vkdnUz3r5nw1lSg
	2E26ExM5BIiKyPfcl2v9eMdKMM+OOmpBT7C5KtTcbHG3DzbCnk1U3h3FD0fBQ6mN
	+6SHLPsKdI9rHm6V4UxAfY9/muh5xWIecFbSzU6COt1O/3ffKrY7lTj/FEaXYvzs
	PtGtgxVZsK85381+uO5YcKdVu+3NehH35EU5c88T256sOx2mGltbVAgLewytDFuW
	yfPKOPLLvwjlTS6fKw3v/TXNl4ktpYaScvr3pOjIFZVtisrCb/38ESsW7+Y8Nqtq
	zRr/DY4DcMyWzrab9RLDSw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v1v59kbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 20 Oct 2025 08:14:04 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 20 Oct 2025 01:14:03 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Mon, 20 Oct 2025 01:14:00 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <syzbot+2860e75836a08b172755@syzkaller.appspotmail.com>
CC: <davem@davemloft.net>, <edumazet@google.com>, <horms@kernel.org>,
        <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <pabeni@redhat.com>, <syzkaller-bugs@googlegroups.com>
Subject: [PATCH] netrom: Prevent race conditions between multiple add route
Date: Mon, 20 Oct 2025 16:13:59 +0800
Message-ID: <20251020081359.2711482-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <68f3fa8a.050a0220.91a22.0433.GAE@google.com>
References: <68f3fa8a.050a0220.91a22.0433.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDA2NSBTYWx0ZWRfXzhP8++/29DF1
 8fFM8v0qi7ohb96j1oFsi5fMiV4l7ZbKgrnqtbsH0zAWC//Kq0f2Rn+EAE1Rfz6RWXYEHWtYRjI
 ol6cb9FGkPKtRHlJ1jmR1SVrQ8h0cIYE/5EGm9x5Dmt5NAsQV+ZwctPLua9d24lIFqHcRGu5VN6
 WNdvSsLMrXsuPOkx7ug926uI+pBBSQ3vxwVx0UfH6DeVUBkFML9PsuEr6zsnA5TYX8PerFqrgXs
 4Yy5NVwbE6omLPr5A5L0zpI62vM0izhogYxOaLDTXoSBdpghAS3p4a4MYVtFfdZYpXif7JMEnqU
 sL9JMRprtTxiy8qMWwXO3UD+JdIRIsnXzh2C6p8XEM0lYQgMrRI2wOeE8e41y6a5nEwJ8XEux1w
 xyO/13AtZ1fbHJaN9q3HG1+COeqFiA==
X-Proofpoint-GUID: RDysNcMdUX6tPpqmO3otGQJ6KL4IUTyk
X-Proofpoint-ORIG-GUID: RDysNcMdUX6tPpqmO3otGQJ6KL4IUTyk
X-Authority-Analysis: v=2.4 cv=ANdmIO46 c=1 sm=1 tr=0 ts=68f5ef4c cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8
 a=t7CeM3EgAAAA:8 a=sx0YzN9DWx7IQLKmKLYA:9 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22 a=cPQSjfK2_nFv0Q5t_7PE:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=SsAZrZ5W_gNWK9tOzrEV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510200065

The root cause of the problem is that multiple different tasks initiate
NETROM_NODE commands to add new routes, there is no lock between them to
protect the same nr_neigh.
Task0 may add the nr_neigh.refcount value of 1 on Task1 to routes[2].
When Task3 executes nr_neigh_put(nr_node->routes[2].neighbour), it will
release the neighbour because its refcount value is 1.

In this case, the following situation causes a UAF:

Task0					Task1
=====					=====
nr_add_node()
nr_neigh_get_dev()			nr_add_node()
					nr_node->routes[2].neighbour->count--
					nr_neigh_put(nr_node->routes[2].neighbour);
					nr_remove_neigh(nr_node->routes[2].neighbour)
nr_node->routes[2].neighbour = nr_neigh
nr_neigh_hold(nr_neigh);

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


