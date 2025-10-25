Return-Path: <linux-hams+bounces-692-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB20DC08844
	for <lists+linux-hams@lfdr.de>; Sat, 25 Oct 2025 03:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7DFB04E95A3
	for <lists+linux-hams@lfdr.de>; Sat, 25 Oct 2025 01:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB10D2222B6;
	Sat, 25 Oct 2025 01:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="j8Qk4p2N"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3454B221DB4;
	Sat, 25 Oct 2025 01:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761356966; cv=none; b=Uad+UrBf5kULpudKi8+O0D9eV8y4HgkKLXc3HRn0WxRnNdAbXNiLJRfQHdur8m3OT6nDCEl0ZaZqMG34pxazeE8LNBhHpgorO5SyrDcUYY3uvCbC+pmiDl8W7oPZRfR4NX89U1HnS2YRn9+Burga2odF4bgvPBNV3qmvJDv+h/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761356966; c=relaxed/simple;
	bh=yiNGoDA6OPE1r+pVpkyAaNTyMJSpKFBSjzDYoQE0HoQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DNbDuU5nvvgesb1MoVd5LNLL6cYVyGJ3KVJ6/eqrdf5Iw/Ky31y3oRs+F4idqb9MfXQgFJFotEfu9MBUv+jVPJT1TUWbkbVAi/EbYYWb6cDupXRI98YUobMe0JJFOLbybS6S89h2iQW3OiKByVGq2cRrBdKZyRFa2qsi+YYxZ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=j8Qk4p2N; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59P1dhi63393619;
	Fri, 24 Oct 2025 18:48:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MjstNEhadA4FrBPkWG1GOCDYo8Zg4J9krtNfYty0zFw=; b=
	j8Qk4p2N6LCjO3O5NNq0vedbMMZo5qykHb6yrUYJWJfAQiF5GOyLWYzBw5La3FHw
	5Q0ySoXCqm5FcyRfjSqJpb+e7P1qo1IzF9IGv0359zZrvvcPvIoj5U2x+hZJNyuJ
	+l+FlE9aCjgK0wjuzKsaUIhGAqmxOKHqiXkGmPnWT0TzV6Oz5+IDJVgcDXGy9SpV
	VvOm++lBPMwun+LazxZUhGYBGEJc181BkVVuTIH7C/F95KYnW5UBSL9VDU0nDvrK
	7PFpCzzJ3GDijeJLY+0X+txNFS8F0R/B0WO7z2dWXX5gRlAUQsUwF7myGUwbmcFa
	WSL+uD3LUTt1VhxdEKdaJQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49ys00hg64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Oct 2025 18:48:51 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 24 Oct 2025 18:48:50 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 24 Oct 2025 18:48:47 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <edumazet@google.com>
CC: <davem@davemloft.net>, <horms@kernel.org>, <jreuter@yaina.de>,
        <kuba@kernel.org>, <kuniyu@google.com>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lizhi.xu@windriver.com>,
        <netdev@vger.kernel.org>, <pabeni@redhat.com>,
        <syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH V3] net: rose: Prevent the use of freed digipeat
Date: Sat, 25 Oct 2025 09:48:15 +0800
Message-ID: <20251025014847.1460236-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANn89iKxjOPyP7h-8bCtx1SwCM1FaXDAXfcdCW7uXxKsy49L3w@mail.gmail.com>
References: <CANn89iKxjOPyP7h-8bCtx1SwCM1FaXDAXfcdCW7uXxKsy49L3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAxNCBTYWx0ZWRfX2kwEV6X56zaR
 Vt4PNNUZM5Y3MlqFHiNg5Tfff+vDSjgRxKxrZQCzsdna5MDtNjG3URi20sn/lkdn5SbR8vD86Ad
 G6nEPt+xMCb0ycDi+RY5YmmZF4s0PeT6KSzRMF/Fi3j2DwpNj2acGY2wPS7WqOyqz/u6ctp5vpO
 kR3A+LiUqGRBpeRUmi6vlv4+58HyQQQuPHBaWUY1lmNMAhBXYpA5LIWsFmbwmM+d5l0T5vjeMMS
 BBXAv0GWXWVHq0JeV1xap33vFavkdWg7mpKeu20vxyEm7QqCbJlyLabBIhnb3utYOfZqpqN0hWV
 5Hqq5sSfIHgZg+n2CaY2ostdI9HTpuRap708Tt6OAslCje62pRwC+YdOPGbn29OCipz4ZbSShsB
 mnTMbWJFwI1g+4PTW8w0i9pvl3MZNA==
X-Proofpoint-ORIG-GUID: -lFECKA-jdaSU15fkoSs94NUC-LZVeTo
X-Proofpoint-GUID: -lFECKA-jdaSU15fkoSs94NUC-LZVeTo
X-Authority-Analysis: v=2.4 cv=N/8k1m9B c=1 sm=1 tr=0 ts=68fc2c83 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=qf4gfuq51q0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1XWaLZrsAAAA:8 a=t7CeM3EgAAAA:8 a=hSkVLCK3AAAA:8 a=ITVfLMkunuOo6j-6Sa0A:9
 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=cQPPKAXgyycSBL8etih5:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-25_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510250014

On Fri, 24 Oct 2025 04:49:55 -0700, Eric Dumazet <edumazet@google.com> wrote:
> On Fri, Oct 24, 2025 at 2:39 AM Lizhi Xu <lizhi.xu@windriver.com> wrote:
> >
> > There is no synchronization between the two timers, rose_t0timer_expiry
> > and rose_timer_expiry.
> > rose_timer_expiry() puts the neighbor when the rose state is ROSE_STATE_2.
> > However, rose_t0timer_expiry() does initiate a restart request on the
> > neighbor.
> > When rose_t0timer_expiry() accesses the released neighbor member digipeat,
> > a UAF is triggered.
> >
> > To avoid this UAF, defer the put operation to rose_t0timer_expiry() and
> > stop restarting t0timer after putting the neighbor.
> >
> > When putting the neighbor, set the neighbor to NULL. Setting neighbor to
> > NULL prevents rose_t0timer_expiry() from restarting t0timer.
> >
> > syzbot reported a slab-use-after-free Read in ax25_find_cb.
> > BUG: KASAN: slab-use-after-free in ax25_find_cb+0x3b8/0x3f0 net/ax25/af_ax25.c:237
> > Read of size 1 at addr ffff888059c704c0 by task syz.6.2733/17200
> > Call Trace:
> >  ax25_find_cb+0x3b8/0x3f0 net/ax25/af_ax25.c:237
> >  ax25_send_frame+0x157/0xb60 net/ax25/ax25_out.c:55
> >  rose_send_frame+0xcc/0x2c0 net/rose/rose_link.c:106
> >  rose_transmit_restart_request+0x1b8/0x240 net/rose/rose_link.c:198
> >  rose_t0timer_expiry+0x1d/0x150 net/rose/rose_link.c:83
> >
> > Freed by task 17183:
> >  kfree+0x2b8/0x6d0 mm/slub.c:6826
> >  rose_neigh_put include/net/rose.h:165 [inline]
> >  rose_timer_expiry+0x537/0x630 net/rose/rose_timer.c:183
> >
> > Fixes: d860d1faa6b2 ("net: rose: convert 'use' field to refcount_t")
> > Reported-by: syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com
> > Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> > ---
> > V1 -> V2: Putting the neighbor stops t0timer from automatically starting
> > V2 -> V3: add rose_neigh_putex for set rose neigh to NULL
> >
> >  include/net/rose.h   | 12 ++++++++++++
> >  net/rose/rose_link.c |  5 +++++
> >  2 files changed, 17 insertions(+)
> >
> > diff --git a/include/net/rose.h b/include/net/rose.h
> > index 2b5491bbf39a..33de310ba778 100644
> > --- a/include/net/rose.h
> > +++ b/include/net/rose.h
> > @@ -167,6 +167,18 @@ static inline void rose_neigh_put(struct rose_neigh *rose_neigh)
> >         }
> >  }
> >
> > +static inline void rose_neigh_putex(struct rose_neigh **roseneigh)
> > +{
> > +       struct rose_neigh *rose_neigh = *roseneigh;
> > +       if (refcount_dec_and_test(&rose_neigh->use)) {
> > +               if (rose_neigh->ax25)
> > +                       ax25_cb_put(rose_neigh->ax25);
> > +               kfree(rose_neigh->digipeat);
> > +               kfree(rose_neigh);
> > +               *roseneigh = NULL;
> > +       }
> > +}
> 
> You have not even compiled this patch.
580K -rw-r--r-- 1 lzx users 578K Oct 24 17:35 net/rose/rose_link.o

