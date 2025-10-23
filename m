Return-Path: <linux-hams+bounces-680-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA34C018A9
	for <lists+linux-hams@lfdr.de>; Thu, 23 Oct 2025 15:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE9773B09E2
	for <lists+linux-hams@lfdr.de>; Thu, 23 Oct 2025 13:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44D73164AF;
	Thu, 23 Oct 2025 13:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="Skz6t56Y"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6876315D35;
	Thu, 23 Oct 2025 13:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227452; cv=none; b=I5JLTpuMnBFPBrtAwgv7Su2I6kNoqH4KKtvY+AQoiS+HBDmN3hXtz8/cqcmo3c4Rhx7Xwc0BUosQjG03PCC1zmvblF6VKPZSn0Ub4K6LeW2js3FiKYcTNdXJwtSJunZhNriYpaLli9dH65t+BXfQdBXOVu09zoOZ9q0TcP8TKrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227452; c=relaxed/simple;
	bh=feVYHMj5sXKOUBXsJdwlT4SZfoanL2q2It5MfSI0AKI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r+jCx44RVNsOL3kPsKqPLtuUQPTDbfUNjq1DhmTBhD02WEPmEsigIH8gPugZmyPo5QMmSfCAo4pL52m3h7HXtaUu9QDSM4JACcljP6mRNP5soGfhc751tMsjaUjIsq7SfXft1S+WwNAttUrvE/0sDvRVI0zi2Oa0vl7bCDaJHu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=Skz6t56Y; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59N6mD2h4193043;
	Thu, 23 Oct 2025 06:50:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=B5JCElPINd/nu9Ri1BZDX8/bUatruKvcDu96nOQeCrg=; b=
	Skz6t56YyEmZb+5qmsbi5bsPmWkvkQ9Uh8xRl84f5xrnnVZgIK6XUTiqIe7MsHJC
	t8qU6mBHsNQ6hDdAdZlEh0bpYy3SaziPpdqxiZ0v0ruzKoUfuJt3F46F+a4ee+Dp
	aGAX/2/kBdPtD1/pbvZCy4m4ZbJM3ug1+xotmbb+S3W2CqXxx3NJ2/rr1rAMcxsm
	a5Vy/k5YvxJg8ixZqxigUcHbIGcQl1FSmJaxxEGdWhGdGs2sZlLWCrJLHRtA1KqZ
	bc6KhuChE+qBjrOjvqUl8IH/ZpHpgTxKGRTwP5rjO0m3FTk59C/vtfezgljWVhMg
	2VzMucDY5PYnZtY8LJdQ8w==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v660dxna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Oct 2025 06:50:36 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 23 Oct 2025 06:50:36 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 23 Oct 2025 06:50:33 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <lizhi.xu@windriver.com>
CC: <dan.carpenter@linaro.org>, <davem@davemloft.net>, <edumazet@google.com>,
        <horms@kernel.org>, <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <pabeni@redhat.com>,
        <syzbot+2860e75836a08b172755@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH V4] netrom: Preventing the use of abnormal neighbor
Date: Thu, 23 Oct 2025 21:50:32 +0800
Message-ID: <20251023135032.3759443-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023124107.3405829-1-lizhi.xu@windriver.com>
References: <20251023124107.3405829-1-lizhi.xu@windriver.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=VN3QXtPX c=1 sm=1 tr=0 ts=68fa32ad cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8
 a=t7CeM3EgAAAA:8 a=RxrogctecK5Tx9zfPZ8A:9 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22 a=cPQSjfK2_nFv0Q5t_7PE:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=SsAZrZ5W_gNWK9tOzrEV:22
X-Proofpoint-ORIG-GUID: 7T9l9RVoVlpTbmTy9ywhfzQyIGM620ap
X-Proofpoint-GUID: 7T9l9RVoVlpTbmTy9ywhfzQyIGM620ap
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEyNiBTYWx0ZWRfX6+rycQcSy7G6
 6Xy54YNNf6JRP27KrvukY9OjsgXua4gKeepaPA6gdoddyt642Qsy/vtKeVb5iatQEU8+8DYJ+Uz
 2Eqq8hAzFxGqGF/msOzMzwPf/WSrPicq+9pfgDB+kbavNkEL0AGdb3Zkb6qcXi2uZ9DZpk9F8hb
 uwwlTCV9bNTo49hmsELfS5LVezQEgSkoCpabxlmAgg+IND5R76XhE6WuIr97cI0HGvhPVFfRqsT
 sOevgrnY9PtE213s67xYjL2U294Bc6gvSZbP8n4LjIF3pzcRX8UtI3XUjTV8HFGr05VpytHQJrF
 FX9Z72f4GCuVMnC8H3GbIwAFyjt5cQpfbV/1Vhkoqez+vOXlZZ44HCJXKXaUbJaSy82zxUtqAxY
 yfC1cB32UmUW7zTye/ZaMc/OHeWLcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510230126

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

Filter out neighbors with a refcount of 1 to avoid unsafe conditions.

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
V3 -> V4: Preventing the use of neighbors with a reference count of 1

 net/netrom/nr_route.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index b94cb2ffbaf8..1ef2743a5ec0 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -100,7 +100,7 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
 {
 	struct nr_node  *nr_node;
 	struct nr_neigh *nr_neigh;
-	int i, found;
+	int i, found, ret = 0;
 	struct net_device *odev;
 
 	if ((odev=nr_dev_get(nr)) != NULL) {	/* Can't add routes to ourself */
@@ -212,6 +212,10 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
 		return 0;
 	}
 	nr_node_lock(nr_node);
+	if (refcount_read(&nr_neigh->refcount) == 1) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	if (quality != 0)
 		strscpy(nr_node->mnemonic, mnemonic);
@@ -279,10 +283,11 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
 		}
 	}
 
+out:
 	nr_neigh_put(nr_neigh);
 	nr_node_unlock(nr_node);
 	nr_node_put(nr_node);
-	return 0;
+	return ret;
 }
 
 static void nr_remove_node_locked(struct nr_node *nr_node)
-- 
2.43.0


