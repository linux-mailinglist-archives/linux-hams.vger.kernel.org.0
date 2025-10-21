Return-Path: <linux-hams+bounces-669-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12478BF458D
	for <lists+linux-hams@lfdr.de>; Tue, 21 Oct 2025 04:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A535A18C5FB1
	for <lists+linux-hams@lfdr.de>; Tue, 21 Oct 2025 02:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FC02737EE;
	Tue, 21 Oct 2025 02:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="EWJG35kv"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32FA24A058;
	Tue, 21 Oct 2025 02:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761012355; cv=none; b=Rzl2lCEp0kuvj0nPEyizPEIUEUbFtb0IYVtnsMCxvo2l6nDcAPsZPJB86u3+KA7x/pbHLiwv4Eg6anxRq+4a5tVwsCwYmg38mWEd6ah40dIp4SerLOAJ2hFwrJw4P4dqGwVlpXF8f5QNT/VC9bYKwFHZLlhHhuFzHh/QzXosxYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761012355; c=relaxed/simple;
	bh=f771sbmADVzs9LQeaRMK13QS6eL9wIksvSbwZ0HJ7h4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eZxOM/9aZVli3xDgiCCB+5SGy9LkJc3MukvksRQzTxRWgPd0j8Sv2Anb1TO73qLmZjxs42+9+yc6Z5ngoriO+zNslXCj46cx4OgNZYH8c2HG6F+ji9T8EH/5li3mTKWpZquLBGmdzfm8FBRzyNyrom7bfp0G5COJa/gw+VTM2u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=EWJG35kv; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KNo2OS3070029;
	Tue, 21 Oct 2025 02:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=BL5f/Hmeb5kOwkwf+4l6waB6+ZBgZpieNxgNqnBtByg=; b=
	EWJG35kvwc5G/L+X3nWjtLgccmAGIemwrZ1OIvji2mV7NugfjUIqXTkQfkU6wGXo
	etgB2XXcywaea5SEkBn3Yy+H6ZHR3crGEeDa8Hi92PiyZLpS+Y65XiSqIHHBQrnv
	/h8P/whj7VFiWjcHg+hlkzDI8nbSH/Up1R6QaxnhX//A6kGk7edP5jYRgf8oAYyo
	2QPps1wL3K0QVbGZIVKFdZ78QNukPfjbgZhftNRldWeFBwhE5T3Sl7t7TIBopROr
	9WbUGoJSUsiC/6X7lfS0ERBgJ/iSSQ8P7xbnakFykRiz64eh4nCzjJD6CReX3MPD
	1LsLAwsVqlhJF4DUxf+y6A==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v1v5akgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 21 Oct 2025 02:05:37 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 20 Oct 2025 19:05:36 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Mon, 20 Oct 2025 19:05:34 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <dan.carpenter@linaro.org>
CC: <lizhi.xu@windriver.com>, <davem@davemloft.net>, <edumazet@google.com>,
        <horms@kernel.org>, <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <pabeni@redhat.com>,
        <syzbot+2860e75836a08b172755@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH V2] netrom: Prevent race conditions between multiple add route
Date: Tue, 21 Oct 2025 10:05:33 +0800
Message-ID: <20251021020533.1234755-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aPZ4fLKBiCCIGr9e@stanley.mountain>
References: <aPZ4fLKBiCCIGr9e@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDAxNSBTYWx0ZWRfX878suZql/q9N
 QGNajCu1lXaG+56F8nAQDz4dIBS56QujxQBcj/Nb2Sn6NXhlZUEZZFocgV5N0qXN2MuFrPbf0ef
 MiyaGYhsowChs4QLttXn1/zB0tp9Xi7LHInsO4yEusOz5Iml9ItRFCNxPK3Lg30lAnV7+T8iOCT
 IcqyEC6aC/DGb7aTxHIyhZCWkSDTAmam8kqTQipVruw2ddP9FZPxU7SkjzoJpcNUYk5M2sz89hx
 gXfWHBGgEFnzE9aGNvv0CBnOwzNWkBiltSEy718SmUBx5QfAtbzgyD8iAWsJq+BI/6FIZx7gyqj
 qEV7ElgiiAtkTL6dbEI0/1c1//bke7WyyLN5FuCrX8BzmzfCCYvYUpZifmfiztTARDuM6arlc+V
 FWA6AvRJ89bq6fkkl5RdZ8UfqzCeEQ==
X-Proofpoint-GUID: FAgoz_CITOh0pcZ0grgHcl-G_46ABxAW
X-Proofpoint-ORIG-GUID: FAgoz_CITOh0pcZ0grgHcl-G_46ABxAW
X-Authority-Analysis: v=2.4 cv=ANdmIO46 c=1 sm=1 tr=0 ts=68f6ea72 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=AKGgawUbhjWeLciGq18A:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510210015

On Mon, 20 Oct 2025 20:59:24 +0300, Dan Carpenter wrote:
> On Mon, Oct 20, 2025 at 09:49:12PM +0800, Lizhi Xu wrote:
> > On Mon, 20 Oct 2025 21:34:56 +0800, Lizhi Xu wrote:
> > > > Task0					Task1						Task2
> > > > =====					=====						=====
> > > > [97] nr_add_node()
> > > > [113] nr_neigh_get_dev()		[97] nr_add_node()
> > > > 					[214] nr_node_lock()
> > > > 					[245] nr_node->routes[2].neighbour->count--
> > > > 					[246] nr_neigh_put(nr_node->routes[2].neighbour);
> > > > 					[248] nr_remove_neigh(nr_node->routes[2].neighbour)
> > > > 					[283] nr_node_unlock()
> > > > [214] nr_node_lock()
> > > > [253] nr_node->routes[2].neighbour = nr_neigh
> > > > [254] nr_neigh_hold(nr_neigh);							[97] nr_add_node()
> > > > 											[XXX] nr_neigh_put()
> > > >                                                                                         ^^^^^^^^^^^^^^^^^^^^
> > > >
> > > > These charts are supposed to be chronological so [XXX] is wrong because the
> > > > use after free happens on line [248].  Do we really need three threads to
> > > > make this race work?
> > > The UAF problem occurs in Task2. Task1 sets the refcount of nr_neigh to 1,
> > > then Task0 adds it to routes[2]. Task2 releases routes[2].neighbour after
> > > executing [XXX]nr_neigh_put().
> > Execution Order:
> > 1 -> Task0
> > [113] nr_neigh_get_dev() // After execution, the refcount value is 3
> >
> > 2 -> Task1
> > [246] nr_neigh_put(nr_node->routes[2].neighbour);   // After execution, the refcount value is 2
> > [248] nr_remove_neigh(nr_node->routes[2].neighbour) // After execution, the refcount value is 1
> >
> > 3 -> Task0
> > [253] nr_node->routes[2].neighbour = nr_neigh       // nr_neigh's refcount value is 1 and add it to routes[2]
> >
> > 4 -> Task2
> > [XXX] nr_neigh_put(nr_node->routes[2].neighbour)    // After execution, neighhour is freed
> > if (nr_node->routes[2].neighbour->count == 0 && !nr_node->routes[2].neighbour->locked)  // Uaf occurs this line when accessing neighbour->count
> 
> Let's step back a bit and look at the bigger picture design.  (Which is
> completely undocumented so we're just guessing).
> 
> When we put nr_neigh into nr_node->routes[] we bump the nr_neigh_hold()
> reference count and nr_neigh->count++, then when we remove it from
> ->routes[] we drop the reference and do nr_neigh->count--.
> 
> If it's the last reference (and we are not holding ->locked) then we
> remove it from the &nr_neigh_list and drop the reference count again and
> free it.  So we drop the reference count twice.  This is a complicated
> design with three variables: nr_neigh_hold(), nr_neigh->count and
> ->locked.  Why can it not just be one counter nr_neigh_hold().  So
> instead of setting locked = true we would just take an extra reference?
> The nr_neigh->count++ would be replaced with nr_neigh_hold() as well.
locked controls whether the neighbor quality can be automatically updated;
count controls the number of different routes a neighbor is linked to;
refcount is simply used to manage the neighbor lifecycle.
> 
> Because that's fundamentally the problem, right?  We call
> nr_neigh_get_dev() so we think we're holding a reference and we're
> safe, but we don't realize that calling neighbour->count-- can
> result in dropping two references.
After nr_neigh_get_dev() retrieves a neighbor, there shouldn't be an
unfinished nr_add_node() call operating on the neighbor in the route.
Therefore, we need to use a lock before the nr_neigh_get_dev() operation
begins to ensure that the neighbor is added atomically to the routing table.

BR,
Lizhi

