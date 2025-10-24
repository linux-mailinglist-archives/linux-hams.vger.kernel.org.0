Return-Path: <linux-hams+bounces-684-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 688D8C054A6
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 11:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01042401BEE
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 09:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC38308F0B;
	Fri, 24 Oct 2025 09:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="H26klUfk"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A095B302162;
	Fri, 24 Oct 2025 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761296810; cv=none; b=ssP8jex6NiGln2NJBiWm6gbaQZcMRDt1f6cggaw/RvCEk6fpddPMtsADYzC2Bm5Nh9s/cUVDyupumq02kqKg1Snn8mraUJwvKkEJ6YdD36LjngTTulzTqTrLgKWh9Z8rQEWiqoOx1/8rmjH+OxonbtMTPsgpjVRFHM0H/OsUlpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761296810; c=relaxed/simple;
	bh=UDrxfbNfMuvmybT6v67yaBFGtzSgDdt7UdublW9CJes=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=htqUksOVZOlEWx/J6MjwD/ma2nXGtF++0OZldj2eqNNFyzd6BLjUlHheobBxKbGZVLqprPFlgatXeeaRakLhK68IqwNlLRDvmVzdv8AJ2XBSDVh8/S+2sxxsvZUkkv3uCYqUeWpKDBONJHwhy7P8htjDmupTrtRJk0krMkWSN8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=H26klUfk; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59O6ASuf2312247;
	Fri, 24 Oct 2025 02:06:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=3k4BlGQ5x
	9MSwGyg0juXo0Qv3aQ5Xy11JMlksnMjaYQ=; b=H26klUfk0x3+12vespgdu/RO4
	L5OZVx+4iBTs3MHvk0y7xhr+uJmQhycNrYVPT1Uiyy8mr7DxdRmc5JsvIcXjRRZU
	lUcT1UFw3GlFPxZMXHZFe03UdfzbdyQBX+/0EprZQZyOhZELe6MbglPP89fKklpU
	7miakoXupDHGg7JkprWtYXCfKLNqNyM4R15zZb7sJYyzJbCwvRjiUvBI+zHdvgPa
	pxfrG72jVrAuWYdRZTjY8xBi47ZLVbNY1RepuT32fACXZ2d01/z7cRyBZ1THsYcJ
	jVrob/j1ncuEFzCZAQLfCZ2MJGv2UFryO3YtpkasOMpk57JYErOetkD52XbYw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v660ey8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Oct 2025 02:06:34 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 24 Oct 2025 02:06:34 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 24 Oct 2025 02:06:31 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <kuniyu@google.com>
CC: <davem@davemloft.net>, <edumazet@google.com>, <horms@kernel.org>,
        <jreuter@yaina.de>, <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lizhi.xu@windriver.com>,
        <netdev@vger.kernel.org>, <pabeni@redhat.com>,
        <syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH V2] net: rose: Prevent the use of freed digipeat
Date: Fri, 24 Oct 2025 17:06:30 +0800
Message-ID: <20251024090630.1053294-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=VN3QXtPX c=1 sm=1 tr=0 ts=68fb419a cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8
 a=YldpWyYv74S14SR9DysA:9 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: zJS42X9AF1vCOeMa_9GF9Ehd8jt1NmFa
X-Proofpoint-GUID: zJS42X9AF1vCOeMa_9GF9Ehd8jt1NmFa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI0MDA3OSBTYWx0ZWRfXycDl0DGDHzQx
 bLIRbQRu4aJb+O2Q6TcKIgymFoZbFzBk25WmJ6YekVJtKV7Won6TCZmQoovrbW6pXBAVv9nWKrY
 ZbEDM1/aCXbZCsPKxPJ0RCjt8Bkg/Fm1W0bR4B7wcM6xV5uQh+4q4x8cUFu41sEvjRhvAQBmZoi
 L67Spjal0eoheftLCz5589XYwR3AdC+QbNVdoC3iW22udDDddPygPYBzA4Aay9Yu4yuzu8s3x5d
 zxYosA0XLEkmCwPCowyS8UFLxaK14XvF8ONaboQZWwW01E6YlgpOi9UEDPvDXjvIdKYOp7bR+8g
 eU7wV39dC7O7YvTYNajh1zisQZe6XGaNhSU3EGRE6AbEs+UTuvsvwhLbq/bVKHgElglyBN/uHXI
 GocgrOG4BUMHa18y3qjMlxa4VAaVYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510240079

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


