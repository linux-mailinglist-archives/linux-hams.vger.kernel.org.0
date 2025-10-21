Return-Path: <linux-hams+bounces-671-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B4DBF5499
	for <lists+linux-hams@lfdr.de>; Tue, 21 Oct 2025 10:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E8D83B0095
	for <lists+linux-hams@lfdr.de>; Tue, 21 Oct 2025 08:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7048B3191CF;
	Tue, 21 Oct 2025 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="iNs3URlg"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB330272E54;
	Tue, 21 Oct 2025 08:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761035675; cv=none; b=itIZLvragvELtkC8fKGrFk4B/LnBuwyfX8ed2XXsCdnRDdKcovLpAzQt8w4OJ0Dq+lQ4ObE1zOsRB5jJv+jMRLzr9rQIUEKCi7O6VdZGWfG9jbsiX9CNI/J173D+hXa7ppjZ/D2CHA5p4ESNE3uz1cJza0r+r+P1erwAbHU9yBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761035675; c=relaxed/simple;
	bh=GrQpC7g18WmliQ2jkFlU2fcGER8Sic8GYNzsd9nRZBA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=coZ08xPgBwGIgo0UaoMfplAKMVKNcFTpr+G1qrSgXmDfxJp+M4ClvnB1GZUbpZZMooRhSMrHkfGfw6L8664D9FvGrGoxEgLBYXZoNwtlm3zvSCdZJgjtCJPKp1EUNQbZMYha4N3tRQ5Frwkw66RqRzEVbRx7+QQn2sI8TymBjQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=iNs3URlg; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59L58v453589434;
	Tue, 21 Oct 2025 08:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=99W/ZpBfJOr+nLgQNc9iEE3Y0ZR5aVXxhXtWNCpu93c=; b=
	iNs3URlgFqm57oODVfHjxZOIqoqAI4hZxZKAZsPLiYiaFFhcSM/kE0bMir5PehKZ
	nOOeq/9B7Q5U3Dk1Z1wKOTqsIGJmh8bSLoSO9UzpEKbH+DqfwU6Og0MsLKrMjJX4
	KOrvw6O/Hs2Sa+/+lm5AxJVJMgvMp/Jt+1gBr208T76kcvRKs4Yxo+dI8Vg0J5pw
	elylv49ZrIEXeSW6YyKLerWambCuFWVw2mPPRH8q/WGBLMJ2FYfAJ5b4o7y7bok+
	AKf6BbeF/kyYhrAGVLswhfqiaTLV7EfMzAp0AitNBE/cYnodTtA4HVUkjJ7WqqP5
	tWQjexirjb65rsJ3GelF4A==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v1v5auwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 21 Oct 2025 08:34:10 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 21 Oct 2025 01:34:08 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Tue, 21 Oct 2025 01:34:05 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <dan.carpenter@linaro.org>
CC: <lizhi.xu@windriver.com>, <davem@davemloft.net>, <edumazet@google.com>,
        <horms@kernel.org>, <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <pabeni@redhat.com>,
        <syzbot+2860e75836a08b172755@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH V2] netrom: Prevent race conditions between multiple add route
Date: Tue, 21 Oct 2025 16:34:05 +0800
Message-ID: <20251021083405.3047161-1-lizhi.xu@windriver.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDA2NyBTYWx0ZWRfX4Itbi3mLl7WO
 eoYEbrT59+owC0M8g0I8Wle30NM7T4uYf/WBVTWzgRI9FIDQNMxCY3NNnAseMdk2xLcpgdolZb2
 cEBVkLIml4N3w1RYSiWQED0+U+kH5PJP9SQ07/6uUNyUszSeK3GS+M2ucz64ykwmRu6RuNGvosx
 TIWKOo9h1QaMz61AjvXKUlJCk1T7lNnL1P1pIGKHW94EqO6b+gbgd+TILjfFf5qYJmUd1C3E+xb
 vD4g3DEXzCry1BetBZugyGkWqcGU1euLNNSGuRUptflcDSqT2hAcSGniS1WF5VWjBzFtabBL3Hz
 wNxC4ulzD70qNAvKi/W1x/DdNZNz9VSFMpAfD2RT/vowWA/LiYTcEzI1URQOQ7+UxmXBeTiE5du
 Pl1JB/pfJ6aim/49hGZERgKaBXQz8w==
X-Proofpoint-GUID: zpbkvUCkazKmXR29pK48h2M8zG7mgDdZ
X-Proofpoint-ORIG-GUID: zpbkvUCkazKmXR29pK48h2M8zG7mgDdZ
X-Authority-Analysis: v=2.4 cv=ANdmIO46 c=1 sm=1 tr=0 ts=68f74582 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=vNcuKCLI83lUjvyxQX4A:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510210067

On Tue, 21 Oct 2025 09:36:47 +0300, Dan Carpenter wrote:
> On Tue, Oct 21, 2025 at 10:05:33AM +0800, Lizhi Xu wrote:
> > On Mon, 20 Oct 2025 20:59:24 +0300, Dan Carpenter wrote:
> > > On Mon, Oct 20, 2025 at 09:49:12PM +0800, Lizhi Xu wrote:
> > > > On Mon, 20 Oct 2025 21:34:56 +0800, Lizhi Xu wrote:
> > > > > > Task0					Task1						Task2
> > > > > > =====					=====						=====
> > > > > > [97] nr_add_node()
> > > > > > [113] nr_neigh_get_dev()		[97] nr_add_node()
> > > > > > 					[214] nr_node_lock()
> > > > > > 					[245] nr_node->routes[2].neighbour->count--
> > > > > > 					[246] nr_neigh_put(nr_node->routes[2].neighbour);
> > > > > > 					[248] nr_remove_neigh(nr_node->routes[2].neighbour)
> > > > > > 					[283] nr_node_unlock()
> > > > > > [214] nr_node_lock()
> > > > > > [253] nr_node->routes[2].neighbour = nr_neigh
> > > > > > [254] nr_neigh_hold(nr_neigh);							[97] nr_add_node()
> > > > > > 											[XXX] nr_neigh_put()
> > > > > >                                                                                         ^^^^^^^^^^^^^^^^^^^^
> > > > > >
> > > > > > These charts are supposed to be chronological so [XXX] is wrong because the
> > > > > > use after free happens on line [248].  Do we really need three threads to
> > > > > > make this race work?
> > > > > The UAF problem occurs in Task2. Task1 sets the refcount of nr_neigh to 1,
> > > > > then Task0 adds it to routes[2]. Task2 releases routes[2].neighbour after
> > > > > executing [XXX]nr_neigh_put().
> > > > Execution Order:
> > > > 1 -> Task0
> > > > [113] nr_neigh_get_dev() // After execution, the refcount value is 3
> > > >
> > > > 2 -> Task1
> > > > [246] nr_neigh_put(nr_node->routes[2].neighbour);   // After execution, the refcount value is 2
> > > > [248] nr_remove_neigh(nr_node->routes[2].neighbour) // After execution, the refcount value is 1
> > > >
> > > > 3 -> Task0
> > > > [253] nr_node->routes[2].neighbour = nr_neigh       // nr_neigh's refcount value is 1 and add it to routes[2]
> > > >
> > > > 4 -> Task2
> > > > [XXX] nr_neigh_put(nr_node->routes[2].neighbour)    // After execution, neighhour is freed
> > > > if (nr_node->routes[2].neighbour->count == 0 && !nr_node->routes[2].neighbour->locked)  // Uaf occurs this line when accessing neighbour->count
> > >
> > > Let's step back a bit and look at the bigger picture design.  (Which is
> > > completely undocumented so we're just guessing).
> > >
> > > When we put nr_neigh into nr_node->routes[] we bump the nr_neigh_hold()
> > > reference count and nr_neigh->count++, then when we remove it from
> > > ->routes[] we drop the reference and do nr_neigh->count--.
> > >
> > > If it's the last reference (and we are not holding ->locked) then we
> > > remove it from the &nr_neigh_list and drop the reference count again and
> > > free it.  So we drop the reference count twice.  This is a complicated
> > > design with three variables: nr_neigh_hold(), nr_neigh->count and
> > > ->locked.  Why can it not just be one counter nr_neigh_hold().  So
> > > instead of setting locked = true we would just take an extra reference?
> > > The nr_neigh->count++ would be replaced with nr_neigh_hold() as well.
> > locked controls whether the neighbor quality can be automatically updated;
>
> I'm not sure your patch fixes the bug because we could still race against
> nr_del_node().
This is fine in this issue, but for rigor, I'll add locks to all related
ioctl and route frame operations to maintain synchronization.
I will send V3 patch to improve it.
> 
> I'm not saying get rid of locked completely, I'm saying get rid of code like
> this:
> 		if (nr_node->routes[2].neighbour->count == 0 && !nr_node->routes[2].neighbour->locked)
> 			nr_remove_neigh(nr_node->routes[2].neighbour);
> 
> Right now, locked serves as a special kind of reference count, because we
> don't drop the reference if it's true.
I don't think this is correct.
> 
> > count controls the number of different routes a neighbor is linked to;
> 
> Sure, that is interesting information for the user, so keep it around to
> print in the proc file, but don't use it as a reference count.
> 
> > refcount is simply used to manage the neighbor lifecycle.
> 
> The bug is caused because our reference counting is bad.
> 
> So right now what happens is we allocate nr_neigh and we put it on the
> &nr_neigh_list.  Then we lock it or we add it to ->routes[] and each of
> those has a different reference count.  Then when we drop those references
> we do:
> 
> 		if (nr_node->routes[2].neighbour->count == 0 && !nr_node->routes[2].neighbour->locked)
> 			nr_remove_neigh(nr_node->routes[2].neighbour);
> 
> This removes it from the list, and hopefully this is the last reference
> and it frees it.
> 
> It would be much simpler to say, we only use nr_neigh_hold()/put() for
> reference counting.  When we set locked we do:
> 
> 	nr_neigh_hold(nr_neigh);
> 	nr_neigh->locked  = true;
> 
> Incrementing the refcount means it can't be freed.
No, setting locked = 1 is only done in nr_add_neigh(), and nr_neigh_hold()
is not executed, and the refcount value is 1.
> 
> Then when we remove nr_neigh from ->routes[] we wouldn't "remove it from
> the list", instead we would just drop a reference.  When we dropped the
> last reference, nr_neigh_put() would remove it from the list.
> 
> My proposal would be a behavior change because right now what happens is:
> 
> 1: allocate nr_neigh
> 2: add it to ->routes[]
> 3: remove it from ->routes[]
>    (freed automatically because we drop two references)
No, No, I know where your analysis went wrong, it is here.

The problem is not when allocating neigh and adding it to routes[2],
but when nr_add_node is executed twice later, one is Task0 as I mentioned
above, and the other is Task1.
After Task1 moves the neighbor out of routes, Task0 uses nr_neigh_get_dev()
to get the neighbor that Task1 moved out, and then adds it to its routes.
This is wrong. Task0 should not use nr_neigh_get_dev() to obtain the neighbor
before other tasks move it out. This will interfere with the reference count
of the neighbor, which is the root cause of the problem.

BR,
Lizhi

