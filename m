Return-Path: <linux-hams+bounces-703-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F95C181B5
	for <lists+linux-hams@lfdr.de>; Wed, 29 Oct 2025 03:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6A4274E6A3B
	for <lists+linux-hams@lfdr.de>; Wed, 29 Oct 2025 02:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7C52EC562;
	Wed, 29 Oct 2025 02:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="sBl827Su"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C1817A310;
	Wed, 29 Oct 2025 02:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761706777; cv=none; b=SOqc2cuA4COEjeTrCLmAO2yBl2lxQs7xxNvNGGXbcs3Qbq8A4BVhvTJQ2a9qfW82SxBoKfZGRZUvZpwflzzQpzr+k/v2+c4Pwh2ogHmAfmq+yBJYU0svE7UC/n3dnhad+RmSJHY8OrL54s5XBHEOWyPrMmX/PJHOQmPMM0/y8o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761706777; c=relaxed/simple;
	bh=3C4LK3yhmTxdX/lbtOU2wNo/rvyXok5BkicTvWpPRiM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FGA0vTYKcYjcLyfmPwvZmqhYutEPWa+9VkonZzHU0/hB+Daq1co0EGUrSx5t7A90syjvSOuPjWiATC0F44avdeJ4kAace57Jw8kwmJZDJMN/rqeYD4SbnwIqYqlUbyU2Mz+uQaJ3haHwWXd/+2VXpsDgyuuitVpHB5UQBGJ/nHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=sBl827Su; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T1vjWq2567042;
	Wed, 29 Oct 2025 02:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=orvursf417qpdmLDGFURg5es0bnAKOClQ3zlkzfPbMk=; b=
	sBl827SuBXPAP9R31QUsWhh48Qqo1juED9NyAAOtXDBKrjcG4f/4mA199zb6Uw6b
	BcQljI8H5D/uO5YSTsRyQ2BOO2a0m7TK3Sw/7R8gNHLUZ8MRAbZHdx2GomEFfzBj
	UUhz6gi2WOTTP4m3I1BhMfR1NM3ol0c2wfsOVYjgWGj7hvVFDrM+cdzWEXZpmoZ8
	dKuNsl9T4L5N1fREHdAkf8zw8vp25gK1Q1Xtghk+cwDrpz19uyno/WUGpk95a5jV
	RhrOTX+35Gz51xwClEnbShyxTMHV01gE4H1/E+GCo3u5KGUBkYFb8cNaD7ccCeZz
	pTX4d0FP08atCuhPK/Ldbw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a3489gaxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 29 Oct 2025 02:59:09 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 28 Oct 2025 19:59:07 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 28 Oct 2025 19:59:05 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <pabeni@redhat.com>
CC: <dan.carpenter@linaro.org>, <davem@davemloft.net>, <edumazet@google.com>,
        <horms@kernel.org>, <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lizhi.xu@windriver.com>,
        <netdev@vger.kernel.org>,
        <syzbot+2860e75836a08b172755@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH V4] netrom: Preventing the use of abnormal neighbor
Date: Wed, 29 Oct 2025 10:59:04 +0800
Message-ID: <20251029025904.63619-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <785c8add-ab09-47b2-94bf-a4bfe8c13388@redhat.com>
References: <785c8add-ab09-47b2-94bf-a4bfe8c13388@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Qle8lwbp3_mE3r4qzFcLBoM2_DByylm7
X-Proofpoint-ORIG-GUID: Qle8lwbp3_mE3r4qzFcLBoM2_DByylm7
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=690182fd cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=U1BIhdE-NrZgBzzozqwA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAyMiBTYWx0ZWRfX8NiZpAPpJ0kE
 OyuQrvyW2k95RzHJ7+045dpCsNvrqha9RVty0Xmpgu4FFgJ9I2j2Nzr7fpg90zVfonHO8KgKh0o
 xh/iOMVz6hvRoS32IblrE56m6FsTDComHjNNZ5EdkDLZ9h47D6gAZHjy+hgmkDGvYBIdp/aBXcN
 Z0gLQV5XXxXvMo/vliksVRfWFrriXAFxbdjQpbwdp9BIxP6nA2Ppa8/O0UCOEQwQAJ2bFWU0aaF
 W+038DlYHCk/pnAHfLQI+3YVd/k4iMj1kewXxlZFwNlM7f5TogYUBNDkXIkS3jlfzi+Ww14kxi/
 UB5KZ+AR0qnKWuZKbhuY/+tu8QN9Mf86vvAo8fcqXVsd6RDZ3xoRLQg9AqobMmnRnAubnZnfWx7
 BHqSD3WUI/TVWdFsFL+1siibuqAztQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290022

On Tue, 28 Oct 2025 15:13:37 +0100, Paolo Abeni wrote:
> > The root cause of the problem is that multiple different tasks initiate
> > SIOCADDRT & NETROM_NODE commands to add new routes, there is no lock
> > between them to protect the same nr_neigh.
> >
> > Task0 can add the nr_neigh.refcount value of 1 on Task1 to routes[2].
> > When Task2 executes nr_neigh_put(nr_node->routes[2].neighbour), it will
> > release the neighbour because its refcount value is 1.
> >
> > In this case, the following situation causes a UAF on Task2:
> >
> > Task0					Task1						Task2
> > =====					=====						=====
> > nr_add_node()
> > nr_neigh_get_dev()			nr_add_node()
> > 					nr_node_lock()
> > 					nr_node->routes[2].neighbour->count--
> > 					nr_neigh_put(nr_node->routes[2].neighbour);
> > 					nr_remove_neigh(nr_node->routes[2].neighbour)
> > 					nr_node_unlock()
> > nr_node_lock()
> > nr_node->routes[2].neighbour = nr_neigh
> > nr_neigh_hold(nr_neigh);								nr_add_node()
> > 											nr_neigh_put()
> > 											if (nr_node->routes[2].neighbour->count
> > Description of the UAF triggering process:
> > First, Task 0 executes nr_neigh_get_dev() to set neighbor refcount to 3.
> > Then, Task 1 puts the same neighbor from its routes[2] and executes
> > nr_remove_neigh() because the count is 0. After these two operations,
> > the neighbor's refcount becomes 1. Then, Task 0 acquires the nr node
> > lock and writes it to its routes[2].neighbour.
> > Finally, Task 2 executes nr_neigh_put(nr_node->routes[2].neighbour) to
> > release the neighbor. The subsequent execution of the neighbor->count
> > check triggers a UAF.
> 
> I looked at the code quite a bit and I think this could possibly avoid
> the above mentioned race, but this whole area looks quite confusing to me.
> 
> I think it would be helpful if you could better describe the relevant
> scenario starting from the initial setup (no nodes, no neighs).
OK. Let me fill in the origin of neigh.

Task3
=====
nr_add_node()
[146]if ((nr_neigh = kmalloc(sizeof(*nr_neigh), GFP_ATOMIC)) == NULL)
[253]nr_node->routes[2].neighbour = nr_neigh;
[255]nr_neigh_hold(nr_neigh);
[256]nr_neigh->count++;

neigh is created on line 146 in nr_add_node(), and added to node on
lines 253-256. It occurs before all Task0, Task1, and Task2.

Note:
1. [x], x is line number.
2. During my debugging process, I didn't pay attention to where the node
was created, and I apologize that I cannot provide the relevant creation
process.

BR,
Lizhi

