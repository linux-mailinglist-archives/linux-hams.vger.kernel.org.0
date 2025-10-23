Return-Path: <linux-hams+bounces-679-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B14C0138B
	for <lists+linux-hams@lfdr.de>; Thu, 23 Oct 2025 14:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EBF5535916C
	for <lists+linux-hams@lfdr.de>; Thu, 23 Oct 2025 12:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942B130DEDF;
	Thu, 23 Oct 2025 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="VvEREl5w"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A07C3054EE;
	Thu, 23 Oct 2025 12:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761224074; cv=none; b=audMK7X4Cs78/tvA+qnT+Kvtm6UFp32/GIP+dXmOflFkfBKOg/InNvJIS+3C+4mPA8QhGg91Pc+fjro/ifIGBrMu8IUyv6DxKKqMtmH6BYdqJr1QzOFlJz+eA4dTg/f+tLqsqRKiryrzevgnE1+x3EgJDeMHKCvmw6VUuBqcsHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761224074; c=relaxed/simple;
	bh=R56Tgae5eqOMUOmvJxbrb67OfsMYj2vyvhqS4aSTFnU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CDf74tkEjwnaiALjWcAHUEzc3G9ZWCln64nkeibmKsgGbQe6sGeFEH9Jp2dBrNPwheH3h0mdiLji3YFtC7dSmoEL5KpiYgYMW9Q/nZJKGW3V1GbN7d0JizYvfPEvFJIi0lE1gpmmSAhcHakUAJt2VnMFE3HC7dmyehXk4h6j4NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=VvEREl5w; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59N6K0UW3308347;
	Thu, 23 Oct 2025 05:41:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=N2DkoPjHYfV4u364j48gHscPKNEgjyY/o7DFyypKuiM=; b=
	VvEREl5wO8ztAt8qO9RzI+Oxd7kwjX0/Cdy5jCfd/v0z47QzXqeOdARyqx0AWtfB
	9xN24LX98ZuHKK2ueP7IunAy2GIol5hqh9eGC6lRqrOtLSFr4pZg60VlIA626P66
	Xkg/hW3M1D4pHPvCxPGlvfQiC2AmkHZeztkpYiNRyKov3xyBqXZ8+jxlvmjdZYWj
	0TZKMpnjpNTw7+flvlXJymhA6KVbBx/uG0M3sO4I2ykgh8Mt6iLBTanhSSY3Dvbm
	LX5iNm9tioxn3NzaTh4sLa0whKeq8oHhtvlZqIZs6vOpJE6LyNt4nOmdU/TfGTlX
	6h5bXaqkH/N5pkvW5t7asw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49vadj5q0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Oct 2025 05:41:12 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 23 Oct 2025 05:41:11 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 23 Oct 2025 05:41:08 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <pabeni@redhat.com>
CC: <dan.carpenter@linaro.org>, <davem@davemloft.net>, <edumazet@google.com>,
        <horms@kernel.org>, <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lizhi.xu@windriver.com>,
        <netdev@vger.kernel.org>,
        <syzbot+2860e75836a08b172755@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH V3] netrom: Prevent race conditions between neighbor operations
Date: Thu, 23 Oct 2025 20:41:07 +0800
Message-ID: <20251023124107.3405829-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7232849d-cf15-47e1-9ffb-ed0216358be8@redhat.com>
References: <7232849d-cf15-47e1-9ffb-ed0216358be8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TfujjiZhNxZ2zJOxy6LAYKu6heWEY77d
X-Authority-Analysis: v=2.4 cv=K+4v3iWI c=1 sm=1 tr=0 ts=68fa2268 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=edf1wS77AAAA:8 a=P-IC7800AAAA:8
 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8 a=be5ax3V_b8f36URrEVAA:9
 a=DcSpbTIhAlouE1Uv7lRv:22 a=d3PnA9EDa4IxuAV0gXij:22 a=cQPPKAXgyycSBL8etih5:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=poXaRoVlC6wW9_mwW8W4:22 a=cPQSjfK2_nFv0Q5t_7PE:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=SsAZrZ5W_gNWK9tOzrEV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDExNSBTYWx0ZWRfX0NydGD5W6Qu9
 U7+MBGGor6EA87dJFV/2H4L+rBwH7dOVjsfmeJquU3/n7XAVPI9gHP8snOfAzWhc/flpjEbEU+Y
 awJqID0dUHXp3P1TV6z3t0cz09j91poJ/64U9sK/knDmEk94/0r13Ma2mfN2luZQlN+6LcABNCY
 gXvlFpNYONgR2hCKsVrJnm7wL8iSEYtYggbHhT1zfoIVRxH+QUPvi05oIcR1B29XIre1UOQuAr6
 qn0aWUYbknLUylil28M0o+IUIjyFsM655nsNXmJ3lAgtoDp6/KFGZVFSdSq9J+DHR6r67SZvbyU
 nt/gTz0EWBMV5F5n07aumv/ktj2kYP6RHqn4ZG+HEETwhhXVTcgaQUowi/pflnaF0OJ2ADDqm6v
 maPtquH7k26XKCOoMR1D5EUt/1WhnA==
X-Proofpoint-GUID: TfujjiZhNxZ2zJOxy6LAYKu6heWEY77d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510230115

On Thu, 23 Oct 2025 13:44:18 +0200, Paolo Abeni wrote:
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
> >
> > The solution to the problem is to use a lock to synchronize each add a
> > route to node, but for rigor, I'll add locks to related ioctl and route
> > frame operations to maintain synchronization.
> 
> I think that adding another locking mechanism on top of an already
> complex and not well understood locking and reference infra is not the
> right direction.
> 
> Why reordering the statements as:
> 
> 	if (nr_node->routes[2].neighbour->count == 0 &&
> !nr_node->routes[2].neighbour->locked)
> 		nr_remove_neigh(nr_node->routes[2].neighbour);
> 	nr_neigh_put(nr_node->routes[2].neighbour);
> 
> is not enough?
This is not enough, the same uaf will appear, nr_remove_neigh() will also
execute nr_neigh_put(), and then executing nr_neigh_put() again will
trigger the uaf.
> 
> > syzbot reported:
> > BUG: KASAN: slab-use-after-free in nr_add_node+0x25db/0x2c00 net/netrom/nr_route.c:248
> > Read of size 4 at addr ffff888051e6e9b0 by task syz.1.2539/8741
> >
> > Call Trace:
> >  <TASK>
> >  nr_add_node+0x25db/0x2c00 net/netrom/nr_route.c:248
> >
> > Reported-by: syzbot+2860e75836a08b172755@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=2860e75836a08b172755
> > Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> 
> 
> 
> > ---
> > V1 -> V2: update comments for cause uaf
> > V2 -> V3: sync neighbor operations in ioctl and route frame, update comments
> >
> >  net/netrom/nr_route.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
> > index b94cb2ffbaf8..debe3e925338 100644
> > --- a/net/netrom/nr_route.c
> > +++ b/net/netrom/nr_route.c
> > @@ -40,6 +40,7 @@ static HLIST_HEAD(nr_node_list);
> >  static DEFINE_SPINLOCK(nr_node_list_lock);
> >  static HLIST_HEAD(nr_neigh_list);
> >  static DEFINE_SPINLOCK(nr_neigh_list_lock);
> > +static DEFINE_MUTEX(neighbor_lock);
> >
> >  static struct nr_node *nr_node_get(ax25_address *callsign)
> >  {
> > @@ -633,6 +634,8 @@ int nr_rt_ioctl(unsigned int cmd, void __user *arg)
> >  	ax25_digi digi;
> >  	int ret;
> >
> > +	guard(mutex)(&neighbor_lock);
> 
> See:
> 
> https://elixir.bootlin.com/linux/v6.18-rc1/source/Documentation/process/maintainer-netdev.rst#L395
Using guard is not recommended. I'll reconsider.

BR,
Lizhi

