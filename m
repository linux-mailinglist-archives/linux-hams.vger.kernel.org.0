Return-Path: <linux-hams+bounces-672-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C0EBF54BA
	for <lists+linux-hams@lfdr.de>; Tue, 21 Oct 2025 10:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0522B403F29
	for <lists+linux-hams@lfdr.de>; Tue, 21 Oct 2025 08:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B573064B7;
	Tue, 21 Oct 2025 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="sYwUqKAZ"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8531926A0BD;
	Tue, 21 Oct 2025 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761035721; cv=none; b=Eyy4yMpOBN2POMHVMazdjKFTpopGH/zq8VZtLOsiT2cUbwz22rlEyvZ1r7Obvvf+lKtJGx8SvwErF+sgPBQaH5+feHWFwF/8pD2IcqdpRxryVl8PvRoOIma2bZA2Tf7QFHUEw6kDx+PAWC052nwdmpqBYO4gYQacf68bcAfrNMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761035721; c=relaxed/simple;
	bh=OO4nIMufSB4ldrgsSdF9mAmKfDFf2t053EM8hj0JaG0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DRgVtihELWAQN+DIl3lKum70B/a5Xi0Vuj1ZgoeVl2G1rjTbHxJiiWRZWEMZNDqVFhX7LZAPPI88smPxC0OnzwDYhq84pv802f3qCk5R0JovqfMdBbxH1FScEs3twdJWFU67uFez73uffMDWIVm1xF+3VZ/0A2IkLn/xGK2+pl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=sYwUqKAZ; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59L5wDft312028;
	Tue, 21 Oct 2025 08:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2fnFQR+6jm3xGhhZsm58t7caj5CpzncJi/HtLQWUUSo=; b=
	sYwUqKAZhz6MHBodZbwY1L/U4zn2AYbivcDn5M50GMWrFAhAUP+uaxJmUh7wyIUg
	NSwu1HwhEP/gfzY4uvSDsg1YFgaFaommFO7hRtKneDRc2ErHJHAR4J/IvLX0bgGv
	ejKIeomOFA/nJS7aKvoQ/GLJgR2JzvkeyC4hQghczrZf2MGHN7vIrLxFP/ovToDy
	ogLAZ54KOAQ7njaTP+L2ioVg73UX55Jfdq1thD3jrngGX82INWwkcwQgV/UVS3hs
	Z7ZHchmH1zfSF1DKOOCgEKVN7mYUNDlWCXDLbu5wZZEnyVrHuLn4wNktpLoyPnl6
	1G72eyVq8qKXlotxa3jKbw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49wrpx8rd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 21 Oct 2025 08:35:10 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 21 Oct 2025 01:35:09 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Tue, 21 Oct 2025 01:35:06 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <dan.carpenter@linaro.org>
CC: <davem@davemloft.net>, <edumazet@google.com>, <horms@kernel.org>,
        <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lizhi.xu@windriver.com>,
        <netdev@vger.kernel.org>, <pabeni@redhat.com>,
        <syzbot+2860e75836a08b172755@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH V3] netrom: Prevent race conditions between neighbor operations
Date: Tue, 21 Oct 2025 16:35:05 +0800
Message-ID: <20251021083505.3049794-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aPcp_xemzpDuw-MW@stanley.mountain>
References: <aPcp_xemzpDuw-MW@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=b9O/I9Gx c=1 sm=1 tr=0 ts=68f745be cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8
 a=t7CeM3EgAAAA:8 a=BnyrbAF_MDX3GoWRWn8A:9 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=cPQSjfK2_nFv0Q5t_7PE:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=SsAZrZ5W_gNWK9tOzrEV:22
X-Proofpoint-GUID: LZ8KSgBZEumey4C32dDrVBSPbxChGpA7
X-Proofpoint-ORIG-GUID: LZ8KSgBZEumey4C32dDrVBSPbxChGpA7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDA2NyBTYWx0ZWRfX5xlvyd63P3uk
 bBbfxBw0zI1fRr1OI0D1wIIDjfl0aeleapFPZCd1/2LaelAORbgSslR85VYL1o0Gx4uSVuUEwVi
 gl1pVvptYoB027QyjeOVuAqVf+CCPh+TXpPmPu6Q2Sa12jXiULJCGoUbqclOUKzcT68ZEAuczR8
 lrZQV2cXH1jFe/HHP4I84jd2sVf+teDcLogInTiI22SCoT5ukY9dFdo/D3JRwHhvREMTAuvgyYE
 nxnh7F+ULXZV2jGo0k1d2xoIF+mo+RWWla6niKPUCJ2ibo6zsiywlt0kvxBsYgBHxgBhSDQjfTf
 wjM0fSbFCKsJbVqIYemATZExXxWjDiwf0bVUruyyL61nPHOT6OJWsoOBFOrTvGdaOy27FtCUJJb
 v3YxaIr+KNOE1x2+0Zdu3ZEnXADmpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510210067

The root cause of the problem is that multiple different tasks initiate
SIOCADDRT & NETROM_NODE commands to add new routes, there is no lock
between them to protect the same nr_neigh.

Task0 can add the nr_neigh.refcount value of 1 on Task1 to routes[2].
When Task2 executes nr_neigh_put(nr_node->routes[2].neighbour), it will
release the neighbour because its refcount value is 1.

In this case, the following situation causes a UAF on Task2:

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
											if (nr_node->routes[2].neighbour->count
Description of the UAF triggering process:
First, Task 0 executes nr_neigh_get_dev() to set neighbor refcount to 3.
Then, Task 1 puts the same neighbor from its routes[2] and executes
nr_remove_neigh() because the count is 0. After these two operations,
the neighbor's refcount becomes 1. Then, Task 0 acquires the nr node
lock and writes it to its routes[2].neighbour.
Finally, Task 2 executes nr_neigh_put(nr_node->routes[2].neighbour) to
release the neighbor. The subsequent execution of the neighbor->count
check triggers a UAF.

The solution to the problem is to use a lock to synchronize each add a
route to node, but for rigor, I'll add locks to related ioctl and route
frame operations to maintain synchronization.

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
V2 -> V3: sync neighbor operations in ioctl and route frame, update comments

 net/netrom/nr_route.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index b94cb2ffbaf8..debe3e925338 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -40,6 +40,7 @@ static HLIST_HEAD(nr_node_list);
 static DEFINE_SPINLOCK(nr_node_list_lock);
 static HLIST_HEAD(nr_neigh_list);
 static DEFINE_SPINLOCK(nr_neigh_list_lock);
+static DEFINE_MUTEX(neighbor_lock);
 
 static struct nr_node *nr_node_get(ax25_address *callsign)
 {
@@ -633,6 +634,8 @@ int nr_rt_ioctl(unsigned int cmd, void __user *arg)
 	ax25_digi digi;
 	int ret;
 
+	guard(mutex)(&neighbor_lock);
+
 	switch (cmd) {
 	case SIOCADDRT:
 		if (copy_from_user(&nr_route, arg, sizeof(struct nr_route_struct)))
@@ -765,6 +768,7 @@ int nr_route_frame(struct sk_buff *skb, ax25_cb *ax25)
 	nr_dest = (ax25_address *)(skb->data + 7);
 
 	if (ax25 != NULL) {
+		guard(mutex)(&neighbor_lock);
 		ret = nr_add_node(nr_src, "", &ax25->dest_addr, ax25->digipeat,
 				  ax25->ax25_dev->dev, 0,
 				  READ_ONCE(sysctl_netrom_obsolescence_count_initialiser));
-- 
2.43.0


