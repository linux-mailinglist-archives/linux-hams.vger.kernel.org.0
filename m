Return-Path: <linux-hams+bounces-686-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C485BC0561A
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 11:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F3784E1C6C
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 09:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8A030BBAB;
	Fri, 24 Oct 2025 09:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="TNDLV88d"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30092308F24;
	Fri, 24 Oct 2025 09:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761298764; cv=none; b=c67qiSl7hXmdIdG63NLBKZgMA+UeMXgVno/mrvAJen/hJcOtZpKlsnMhdqJnFZcVIHkXueNXe18QIWdhuzSvBkt86ThSPTYZtJt2djMKRiFSGc4k8Z6nRmVcTlBdkbvr79Cd1/OD4ygAhQl3uc9GX+7xb8Yt3eMxzbbbleYFQyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761298764; c=relaxed/simple;
	bh=0RYoFADo1EPuktB0O9d6dPLkdJjpepS5ikmz2890HCw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ly2IirJsps01rJ1EKQbKajUD4szdkBOwOyZoS7qIq2BBOp740QCZ0uxvRAUMH0OwwvAOwQerJdDPy2Ra2a9j2cjL6wlgIkYGqoLac8eIX7W0CXuWNJxtTsjYEMGSDuH8tpgZ9bl1GddmpwPoO7ozdRv4pkQEMOJ+kIPl9J/MLEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=TNDLV88d; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59O6FvCf3793347;
	Fri, 24 Oct 2025 09:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=JwGjQsJ2w
	kdo6/actkEfv+tcXoAKIynQ/bX0pzAr1dc=; b=TNDLV88dO4J+4qoqrRxk4gKky
	etdUE5VQXi4we/w5c+EDD+eUJdDPNPwm4YAiIdAUNEbJFeBwmMEPCdwilXkUU2MN
	vhxgTxAPVm716aaHPVqMjefLkMzCVHAg4XiifPohSwOu087B+FtvoJV0sUyfo1GF
	YRN2YgnwA/NEbJuiWdvhKxrCMTKfJRq1fFG1tzjfinNWIe1K2LklRXppLRavuFYg
	YS2mttoVVDC2VihYCG8XSw7wnVtLigRgnWQ1P29IPhalPYvfKZ5SAQrNPpM/9M7H
	TfQSJ4BuD4K4CFbPplvrXK0/ayPZ9xMcS3cMF6HlVTclF01xc1nst/8X5STTw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49wrpxd234-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Oct 2025 09:39:07 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 24 Oct 2025 02:39:04 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 24 Oct 2025 02:39:01 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <edumazet@google.com>
CC: <davem@davemloft.net>, <horms@kernel.org>, <jreuter@yaina.de>,
        <kuba@kernel.org>, <kuniyu@google.com>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lizhi.xu@windriver.com>,
        <netdev@vger.kernel.org>, <pabeni@redhat.com>,
        <syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH V3] net: rose: Prevent the use of freed digipeat
Date: Fri, 24 Oct 2025 17:39:01 +0800
Message-ID: <20251024093901.1202924-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=b9O/I9Gx c=1 sm=1 tr=0 ts=68fb493b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8
 a=gSEv5m7Pi2YCfdlV860A:9 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: EitY1rHNFda6al5u31pAczI-Va6z52-1
X-Proofpoint-ORIG-GUID: EitY1rHNFda6al5u31pAczI-Va6z52-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI0MDA4NSBTYWx0ZWRfX/NPJeP1CEAzk
 oxSYTL5kESDtVFvYyFPDndPtFeugj11OBkg20Kg2EMiOWio5Pm1pFr07KNq3DhLIESejjdQFun7
 f2IdACeFiNEavcKjHle8w4yffmlRGLvnes8XJ4SICcH0xB2JxVS8RygWfb+H6ZncSwXzyVb5B+g
 5zdjKnL0B7nSnmyFSb8eeVlXdEXqaUcgQ6xQA5izmEt+lZ1Y7sZDN1POfl3nM3TNzOkioBi951m
 pQhU4yNzXTJ1kQWWUhOnorD4mnxGdZGb25QNKApFGID3JZbfqN59PMpZdcik7PskEo/TJdm6YpK
 AezSBL7GOZy0Vl1nSTr3/vrbhTIZmtuj77sjbHPRzRJowYU4C6xtmWG/ggbNM0Fhbk/G+tDo031
 xJIQsCo/o/nIG3gBz0tDUrkeCAwWFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510240085

There is no synchronization between the two timers, rose_t0timer_expiry
and rose_timer_expiry.
rose_timer_expiry() puts the neighbor when the rose state is ROSE_STATE_2.
However, rose_t0timer_expiry() does initiate a restart request on the
neighbor.
When rose_t0timer_expiry() accesses the released neighbor member digipeat,
a UAF is triggered.

To avoid this UAF, defer the put operation to rose_t0timer_expiry() and
stop restarting t0timer after putting the neighbor.

When putting the neighbor, set the neighbor to NULL. Setting neighbor to
NULL prevents rose_t0timer_expiry() from restarting t0timer.

syzbot reported a slab-use-after-free Read in ax25_find_cb.
BUG: KASAN: slab-use-after-free in ax25_find_cb+0x3b8/0x3f0 net/ax25/af_ax25.c:237
Read of size 1 at addr ffff888059c704c0 by task syz.6.2733/17200
Call Trace:
 ax25_find_cb+0x3b8/0x3f0 net/ax25/af_ax25.c:237
 ax25_send_frame+0x157/0xb60 net/ax25/ax25_out.c:55
 rose_send_frame+0xcc/0x2c0 net/rose/rose_link.c:106
 rose_transmit_restart_request+0x1b8/0x240 net/rose/rose_link.c:198
 rose_t0timer_expiry+0x1d/0x150 net/rose/rose_link.c:83

Freed by task 17183:
 kfree+0x2b8/0x6d0 mm/slub.c:6826
 rose_neigh_put include/net/rose.h:165 [inline]
 rose_timer_expiry+0x537/0x630 net/rose/rose_timer.c:183

Fixes: d860d1faa6b2 ("net: rose: convert 'use' field to refcount_t")
Reported-by: syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com
Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
---
V1 -> V2: Putting the neighbor stops t0timer from automatically starting
V2 -> V3: add rose_neigh_putex for set rose neigh to NULL

 include/net/rose.h   | 12 ++++++++++++
 net/rose/rose_link.c |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/include/net/rose.h b/include/net/rose.h
index 2b5491bbf39a..33de310ba778 100644
--- a/include/net/rose.h
+++ b/include/net/rose.h
@@ -167,6 +167,18 @@ static inline void rose_neigh_put(struct rose_neigh *rose_neigh)
 	}
 }
 
+static inline void rose_neigh_putex(struct rose_neigh **roseneigh)
+{
+	struct rose_neigh *rose_neigh = *roseneigh;
+	if (refcount_dec_and_test(&rose_neigh->use)) {
+		if (rose_neigh->ax25)
+			ax25_cb_put(rose_neigh->ax25);
+		kfree(rose_neigh->digipeat);
+		kfree(rose_neigh);
+		*roseneigh = NULL;
+	}
+}
+
 /* af_rose.c */
 extern ax25_address rose_callsign;
 extern int  sysctl_rose_restart_request_timeout;
diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
index 7746229fdc8c..334c8cc0876d 100644
--- a/net/rose/rose_link.c
+++ b/net/rose/rose_link.c
@@ -43,6 +43,9 @@ void rose_start_ftimer(struct rose_neigh *neigh)
 
 static void rose_start_t0timer(struct rose_neigh *neigh)
 {
+	if (!neigh)
+		return;
+
 	timer_delete(&neigh->t0timer);
 
 	neigh->t0timer.function = rose_t0timer_expiry;
@@ -80,10 +83,12 @@ static void rose_t0timer_expiry(struct timer_list *t)
 {
 	struct rose_neigh *neigh = timer_container_of(neigh, t, t0timer);
 
+	rose_neigh_hold(neigh);
 	rose_transmit_restart_request(neigh);
 
 	neigh->dce_mode = 0;
 
+	rose_neigh_putex(&neigh);
 	rose_start_t0timer(neigh);
 }
 
-- 
2.43.0


