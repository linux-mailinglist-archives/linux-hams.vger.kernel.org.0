Return-Path: <linux-hams+bounces-681-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EA145C040C5
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 03:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6C0094EAB68
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 01:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA2D1DD0D4;
	Fri, 24 Oct 2025 01:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="CgmHWYUu"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576501B85F8;
	Fri, 24 Oct 2025 01:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761270626; cv=none; b=lzmNGCMna/amo1cDaVJNrlBwZx9pwfg/mZw9nMB9hSd/5xaGWJEh9ayhy06/mUNZUKJ69fatNf9lvNf3PV4dP1PM1P8k1ljncx9s3EChsCvkzid8o1Kp8fRC3DM0hFpWZqRn96qHNpUNsozpJYFN5bPAg6oVMwu+Exjd/Ts4pLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761270626; c=relaxed/simple;
	bh=4VIvTpTsm2f0/fvgxXzGFMGsIAUkGA4PmqxriXoLGMk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JTapx4XW75kDA4GVKP9qKuqLLtSKDto4RzbjH2swqfL///N4nKDsbqw2ZWnTWt4bR66Ibsa8iuGuEARIgpAIScpBU3A4GxxnjM/qk66mX/9FNx2mH9v8FKoYGu50/kqk4Of959kmN8lT+QDhDHG/05ZDH6A/OyrCJf2AdPyaL2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=CgmHWYUu; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59O0lCaO3256537;
	Fri, 24 Oct 2025 01:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2PeC5l8PW8c4J0NdtKYiZZiefOBt/vjtv77RblS5fTk=; b=
	CgmHWYUuUhgyO07hehXWFAoCkUmrJgDDDeO9mg62KdNcHNSRxI2QNSCe4ZRZH5HM
	e0W0Ll64UnbFpym1sX9APPyMVobpJP7LG9uVh2ctH1iKo4CXC4QUradAHPiBUUOY
	doJSwaA7YJyh/mWPjsOXYdn8hEEGkiDtYJWBfOGPf7RfUzVTSZ+BFw/ZKqOF+jdm
	gs0eokdfz29sR8jsLyMB8QTG4scZx+fCvAUgZ9aUwnLqNJEGstvVSO2crYXHZwNI
	kOevRDpzrNIzN22UeyWCPTI2CC0UB4hBuesN6xtJcN3QhrAKtjQdtAX+cieqmnk/
	V8hD11iA1qANCr/IH54UtQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49wrpxcpyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Oct 2025 01:31:57 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 23 Oct 2025 18:31:56 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 23 Oct 2025 18:31:54 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com>
CC: <davem@davemloft.net>, <edumazet@google.com>, <horms@kernel.org>,
        <jreuter@yaina.de>, <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <pabeni@redhat.com>, <syzkaller-bugs@googlegroups.com>
Subject: [PATCH] net: rose: Prevent the use of freed digipeat
Date: Fri, 24 Oct 2025 09:31:53 +0800
Message-ID: <20251024013153.2811796-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <68fa1bec.a70a0220.3bf6c6.004f.GAE@google.com>
References: <68fa1bec.a70a0220.3bf6c6.004f.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=b9O/I9Gx c=1 sm=1 tr=0 ts=68fad70e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8
 a=4NORwJsksWdqKwua_R8A:9 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: jO-5Dxt5SJybwZCyvBPvF-Ywgv9ywcq6
X-Proofpoint-ORIG-GUID: jO-5Dxt5SJybwZCyvBPvF-Ywgv9ywcq6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI0MDAxMSBTYWx0ZWRfXxVc9N7hWAwQm
 5djauimzOilxsoUWGkDO6wCNOTHIM36UCK42NnBOvosEmJy+ND+LWVo5196VsykbZfOhIjp7uQn
 PnZ0JGoA6weEnYoX4nLTMp7V2M42AKgqbFcPdTXdhXlXi34x7I+zeurz7M9jm2aL6RB/Lhxhv/N
 Djh7Rt57BwajXiRntHI6l6hD2oUiMVOT/UEbXoK3mmyzQHZrcKsnaeOeYfPvt7m4Kqp4zS4uE6E
 PcUQpxAumAnfq+l2HZbsPxKZQKXUuFcJaCIFktj26Tq9Z2VvOXTt8sc9t3/89PPvimUgNdx2S0B
 Z4mkiq5V4ErpgSwoznYUA5XSDcABUh0NVpzJJ+eJoJM0oYnQryxNygaQ/M5vpjJVqu3HNZjA3P+
 RfXtWhk0v6AleHpzutMxH0nA2PnTGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510240011

There is no synchronization between the two timers, rose_t0timer_expiry
and rose_timer_expiry.
rose_timer_expiry() puts the neighbor when the rose state is ROSE_STATE_2.
However, rose_t0timer_expiry() does initiate a restart request on the
neighbor.
When rose_t0timer_expiry() accesses the released neighbor member digipeat,
a UAF is triggered.

To avoid this uaf, when rose_timer_expiry() puts the neighbor, the base
member digipeat is set to NULL.

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
 call_timer_fn+0x19a/0x620 kernel/time/timer.c:1747

Fixes: dcb34659028f ("net: rose: split remove and free operations in rose_remove_neigh()")
Reported-by: syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com
Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
---
 include/net/rose.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/net/rose.h b/include/net/rose.h
index 2b5491bbf39a..9b0dc81a9589 100644
--- a/include/net/rose.h
+++ b/include/net/rose.h
@@ -163,6 +163,7 @@ static inline void rose_neigh_put(struct rose_neigh *rose_neigh)
 		if (rose_neigh->ax25)
 			ax25_cb_put(rose_neigh->ax25);
 		kfree(rose_neigh->digipeat);
+		rose_neigh->digipeat = NULL;
 		kfree(rose_neigh);
 	}
 }
-- 
2.43.0


