Return-Path: <linux-hams+bounces-683-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D265C053D0
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 11:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 171DA1A08639
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 09:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88480308F23;
	Fri, 24 Oct 2025 09:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="ctniuQxm"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEAF3081DD;
	Fri, 24 Oct 2025 09:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761296743; cv=none; b=R93Fica7J0IBECTVdvAtfRQLUqONx1CSHoCAqyfEykw5G+VuzcOWahFlfwOR/owzzyyL+a6FsvU2GrEr9XxP2Haj6qCtUgcSjKMFzcGGMz0fGFeWls0OZ1KaJuLqS86+HDqROzYLEG7wYm6x1aRxgK5QUQzRKvc2ZY1cz/bqNrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761296743; c=relaxed/simple;
	bh=UDrxfbNfMuvmybT6v67yaBFGtzSgDdt7UdublW9CJes=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZNQdSJ0zNjGCWPWeDNDBdIjC4fqiWtVzPxmoU/2GnkTEBmfSwIdnF581SOqHidIt62bnCx1Fkhc97TznyKaYKAmyz4e2P1uvSNAWkjzev4i1rsKJQ39bWn9LhpTTFK/wz7IgAVacMOFlPDixnFTD4xtD4qT5vr6yL6UchPL84rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=ctniuQxm; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59O50hRt1354560;
	Fri, 24 Oct 2025 02:05:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=3k4BlGQ5x9MSwGyg0juXo0Qv3aQ5Xy11JMlksnMjaYQ=; b=
	ctniuQxmGx7UEc3/y5Y55IlEqHslLaQGk1Z1FDfNLcYF9VazVMXFz6YeORYOw9v/
	KHIkNVt4MPSYaQOFyq4b04d0yvZhm3i4IgQFRPJA4bP/4GvLCY39e/htT3yIUj4u
	7muWfoULL4WETc3kbrS+MxD1GAXewsq3WFpPlllr36BGNLv+JPFXWYb12wkchLII
	5ybkIAOHDHA9hIf0mPy6m4u4vuHc1E80aNacUc5+JlaNLZ8Zwq0r9DyS1sxlMMOA
	375LiSuaiCrE6Fwx5uzMMvnjafpSDVsMUrld6awDuveK/ju3QKGvJ/C4wM0Gx21G
	bZno6jVCgw6WaKp6QINzVg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49ys00gnmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Oct 2025 02:05:26 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 24 Oct 2025 02:05:25 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 24 Oct 2025 02:05:22 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <kuniyu@google.com>
CC: <davem@davemloft.net>, <edumazet@google.com>, <horms@kernel.org>,
        <jreuter@yaina.de>, <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lizhi.xu@windriver.com>,
        <netdev@vger.kernel.org>, <pabeni@redhat.com>,
        <syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH] net: rose: Prevent the use of freed digipeat
Date: Fri, 24 Oct 2025 17:05:21 +0800
Message-ID: <20251024090521.1049558-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251024031801.35583-1-kuniyu@google.com>
References: <20251024031801.35583-1-kuniyu@google.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI0MDA3OSBTYWx0ZWRfX1uXN8Tsbb+du
 vaeG0gNLCMroeNKBbdINoya2+mg+TFbDMiQtD7TEVtAIFGwWIPoRSUw0CneSwDX4ITeVUCHsVav
 v+Ax0Wx/ZSBG2zQJSGIv83Qu1rwOWBvmrwkVsJjP0GWw+0TzBpkhed8WYj4KCHfuzTeJFLdMQax
 UcnXyxQt3hCchLJF8X61UqVkspdApTj/LmyE3pu0wqPl0AMfEne3RL5zdzuoUXeE/gbXKQ8UlLk
 MRZe1BSbyJT+lWBkxW98bNnCOn1RzShLNcXNFswL7VDCAndUIsRCFUIPuW4HXhcPfK8shkBfMpK
 30C52IPbwgko0+xmbl8NS5dyoy3MG9/aTTU74ILBiGg77xpK1PX1U/3ZKkmp4PqCEkIhL8ButdJ
 NzdQfQz8/xH9VtDoLjdmCLBJm7U5GQ==
X-Proofpoint-ORIG-GUID: OGIWkOzJod8E7h8k2dCTxdIB7_K-IwJh
X-Proofpoint-GUID: OGIWkOzJod8E7h8k2dCTxdIB7_K-IwJh
X-Authority-Analysis: v=2.4 cv=N/8k1m9B c=1 sm=1 tr=0 ts=68fb4156 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8
 a=YldpWyYv74S14SR9DysA:9 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510240079

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

 include/net/rose.h   | 1 +
 net/rose/rose_link.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/net/rose.h b/include/net/rose.h
index 2b5491bbf39a..ecf37c8e24bb 100644
--- a/include/net/rose.h
+++ b/include/net/rose.h
@@ -164,6 +164,7 @@ static inline void rose_neigh_put(struct rose_neigh *rose_neigh)
 			ax25_cb_put(rose_neigh->ax25);
 		kfree(rose_neigh->digipeat);
 		kfree(rose_neigh);
+		rose_neigh = NULL;
 	}
 }
 
diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
index 7746229fdc8c..524e7935bd02 100644
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
 
+	rose_neigh_put(neigh);
 	rose_start_t0timer(neigh);
 }
 
-- 
2.43.0


