Return-Path: <linux-hams+bounces-706-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF758C55EEC
	for <lists+linux-hams@lfdr.de>; Thu, 13 Nov 2025 07:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48CF73AD269
	for <lists+linux-hams@lfdr.de>; Thu, 13 Nov 2025 06:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78142320A04;
	Thu, 13 Nov 2025 06:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="rIUar83v"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081E72D3A72;
	Thu, 13 Nov 2025 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763015634; cv=none; b=RQHVx1khtbBHA140MmoVy8ZWZESK5sWKhrWadW38mD8tI5ZyGSNAadtmoedepG9F8XKCaMb0xS0k0ptC+V8z8nWCU96j30ModdwzIyszeUlxbW5yB+H2XZj1pddia9Aihf16YjMIAM/6cJlFU3s7VQS3Ee0ycDD67N7hOX42R/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763015634; c=relaxed/simple;
	bh=rCLe+hr2Yusg3D9SBfWtSb9zi44W4nHl8ejnPsndC0E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vBHVTEZYx2WDSI15DwcsXDMNfM9Wncpnu+2PTSekTB/fe+Rmgur3O4eBbzWHxrQyqE0S5nOy+ftZoqV7kpr8zY6twM86YV6z+nGSVfFvFYi5CRcIlopXEY7MAUTRnxfJZw58xQao2h69afGIoQdVaa7cERbImL3MFg8bCiUJ/X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=rIUar83v; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD0Xp1f4073532;
	Wed, 12 Nov 2025 22:33:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=CK9qGSXpWvfZuDgGicN0rtlYZMBHXlyWGYkxgH85G2g=; b=
	rIUar83vqWyAXG8ZSCt2ZB/DPBqN/+U/vAbRf34EaYfhD4Dw+0sj+FZMNwMoM4Ic
	/vDW/LYwdKXOG16dL6/GkagLEBubP8OVjpO2DCqsBJ48X1Eo3E8NQwRTy427cWK4
	iL055KXu16laQQH9gZth6+54HxICXmHYqTeDrxXApYjUCOB/K32JEa8WfDUM4LEl
	Px93/Mn9hscRNgyamXdvaJmSY2BVxVFpZkdZnL0EpRvr0V5UGyjaZJkdZ64MSiR1
	vQHNDbteMrjZGSOXIqg4soERAk/hgFhatCT8mOgMVuIos17orblrxpZjJzvAtw0l
	RDROQhL+PC2i0+dAiiHs0g==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa2136sqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 12 Nov 2025 22:33:29 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 12 Nov 2025 22:33:28 -0800
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 12 Nov 2025 22:33:26 -0800
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <lizhi.xu@windriver.com>
CC: <dan.carpenter@linaro.org>, <davem@davemloft.net>, <edumazet@google.com>,
        <horms@kernel.org>, <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <syzbot+2860e75836a08b172755@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH V4] netrom: Preventing the use of abnormal neighbor
Date: Thu, 13 Nov 2025 14:33:25 +0800
Message-ID: <20251113063325.1138331-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029025904.63619-1-lizhi.xu@windriver.com>
References: <20251029025904.63619-1-lizhi.xu@windriver.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA0MyBTYWx0ZWRfX31wMgDQZ78gZ
 +G/QlkeQfhrCKQEA4aYpRhlGPxN0eZUrppG9wl24HVTXpdwVo53z8LwcvfCMYOaWOlwGlUxHy6j
 obMs6tSpRvFmt//LysnoynM1sj+zWs6oJhmyQ9iqwl2rHQpXuAyBwjHQ/S0xm2qt2v0PEY9NSo9
 tC6AQEGq8DczsShQjmiAE0zReYDGGQpy2J9yBbThqlq2rEGPzekbIPs9JJ2kBmsQJf13toY6pQH
 Uh1C58t2pZPboFyV9hmCb6J7c61bxyojYx/gzmruj9lGIT9scMjUJ9rXm0DZX/U2z6Qng4st6WP
 5nzYW2sGPj92qxhtnWk7LSXoIHIyQmnsvh5xlyuH6jDvWfWLjOeegxsRGSzq3xF36eCQd1rru/3
 mPuarR9CuRZOw1EKVyOIU3lWevqReA==
X-Proofpoint-ORIG-GUID: FbHNTj-2p3VHIkuMwxWdA5NdTSBoVSUX
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=69157bb9 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=dZbOZ2KzAAAA:8
 a=f1zZ7Z5adhlBXb41_NkA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: FbHNTj-2p3VHIkuMwxWdA5NdTSBoVSUX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130043

On Wed, 29 Oct 2025 10:59:04 +0800, Lizhi Xu wrote:
> > > The root cause of the problem is that multiple different tasks initiate
> > > SIOCADDRT & NETROM_NODE commands to add new routes, there is no lock
> > > between them to protect the same nr_neigh.
> > >
> > > Task0 can add the nr_neigh.refcount value of 1 on Task1 to routes[2].
> > > When Task2 executes nr_neigh_put(nr_node->routes[2].neighbour), it will
> > > release the neighbour because its refcount value is 1.
> > >
> > > In this case, the following situation causes a UAF on Task2:
> > >
> > > Task0					Task1						Task2
> > > =====					=====						=====
> > > nr_add_node()
> > > nr_neigh_get_dev()			nr_add_node()
> > > 					nr_node_lock()
> > > 					nr_node->routes[2].neighbour->count--
> > > 					nr_neigh_put(nr_node->routes[2].neighbour);
> > > 					nr_remove_neigh(nr_node->routes[2].neighbour)
> > > 					nr_node_unlock()
> > > nr_node_lock()
> > > nr_node->routes[2].neighbour = nr_neigh
> > > nr_neigh_hold(nr_neigh);								nr_add_node()
> > > 											nr_neigh_put()
> > > 											if (nr_node->routes[2].neighbour->count
> > > Description of the UAF triggering process:
> > > First, Task 0 executes nr_neigh_get_dev() to set neighbor refcount to 3.
> > > Then, Task 1 puts the same neighbor from its routes[2] and executes
> > > nr_remove_neigh() because the count is 0. After these two operations,
> > > the neighbor's refcount becomes 1. Then, Task 0 acquires the nr node
> > > lock and writes it to its routes[2].neighbour.
> > > Finally, Task 2 executes nr_neigh_put(nr_node->routes[2].neighbour) to
> > > release the neighbor. The subsequent execution of the neighbor->count
> > > check triggers a UAF.
> > 
> > I looked at the code quite a bit and I think this could possibly avoid
> > the above mentioned race, but this whole area looks quite confusing to me.
> > 
> > I think it would be helpful if you could better describe the relevant
> > scenario starting from the initial setup (no nodes, no neighs).
> OK. Let me fill in the origin of neigh.
> 
> Task3
> =====
> nr_add_node()
> [146]if ((nr_neigh = kmalloc(sizeof(*nr_neigh), GFP_ATOMIC)) == NULL)
> [253]nr_node->routes[2].neighbour = nr_neigh;
> [255]nr_neigh_hold(nr_neigh);
> [256]nr_neigh->count++;
> 
> neigh is created on line 146 in nr_add_node(), and added to node on
> lines 253-256. It occurs before all Task0, Task1, and Task2.
> 
> Note:
> 1. [x], x is line number.
> 2. During my debugging process, I didn't pay attention to where the node
> was created, and I apologize that I cannot provide the relevant creation
> process.
Hi everyone, 
Today is my last day at WindRiver. Starting tomorrow, my email address
lizhi.xu@windriver.com will no longer be used;
I will use eadavis@qq.com thereafter.

BR,
Lizhi

