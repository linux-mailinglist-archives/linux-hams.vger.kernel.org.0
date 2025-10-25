Return-Path: <linux-hams+bounces-694-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F39C08A8D
	for <lists+linux-hams@lfdr.de>; Sat, 25 Oct 2025 05:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7D123A5B37
	for <lists+linux-hams@lfdr.de>; Sat, 25 Oct 2025 03:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2261E2550DD;
	Sat, 25 Oct 2025 03:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="pRhuJTkq"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3717615D5B6;
	Sat, 25 Oct 2025 03:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761364337; cv=none; b=VCSpmq+Eoq190AAmb6ItZOP4s7SItwswgl/uvI9sWGWCuZ9jr26b/nsniL3vC+TX5tXOk//CJzhvLMYZ4y6xHtH/ZgK0bFxDjrYK+mxsibNEBexEMpqtmgHxGiPhJ1xLGQBcqFqd/xlT9cCcEKLSTvMcW1YSe99iSbjt3yKKk60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761364337; c=relaxed/simple;
	bh=YTYW5vBSfsEO9ayaSEhP488bKkk/YHs07xurfRZzw80=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SDKfF2LjFXqeRgY2LKhB6mESorimAYQdE4p6lMO651nVtbE3u18pamNWqSyvVXAszp4fbG1gk14eulmJ/k00zC3zi2yBQawmLuHWqFq3kF0I+5MjQ9X1i7zm2IkpTCI695V1mv474XbjT9KWsCNu1ZTt6RhE9I/4HltXsQXCSL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=pRhuJTkq; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59P3bxjc3584526;
	Fri, 24 Oct 2025 20:51:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=z/MBNB4kMT7awnjGpg1dffl9f7Fr2jprPP9E98or9OQ=; b=
	pRhuJTkq6B3GJbi1HE82r2hpchT86TrolEVc5LWkFOfH+543jVIMt0tBM2c64LUm
	tTG6wpEtPSka2WhQha2IT0mZUFYvB5K/gjnu06DJH06qSt7kUpKYshUx+BDVMMDb
	oNNiLQ36NpVwnUAJlGXWucRWzL+5Ti8gOzNsGtVw/lkjsVEqEVOkhyttY3YM29vA
	pn8gnTmaANZ2Dr7MZqRFV7HQ21rSIhgm8pAYaRNt5NrdDq1NzoHxtGZMd52asOhA
	LY3c9eKgiY0reD8dwJ8mXYVxk+5bfKlNQHIfy2CclolxOgPfvvnEhghvsNYRpAQC
	IvqzAR5Cyv1Z3MNvjP1ruQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49ys00hja7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Oct 2025 20:51:52 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 24 Oct 2025 20:51:51 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 24 Oct 2025 20:51:48 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <kuniyu@google.com>
CC: <davem@davemloft.net>, <edumazet@google.com>, <horms@kernel.org>,
        <jreuter@yaina.de>, <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lizhi.xu@windriver.com>,
        <netdev@vger.kernel.org>, <pabeni@redhat.com>,
        <syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH V3] net: rose: Prevent the use of freed digipeat
Date: Sat, 25 Oct 2025 11:51:44 +0800
Message-ID: <20251025035147.2094258-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAVpQUCx9MOJobomXXBcXsCNgSn__U3mJp8LFxD515o-boyr=w@mail.gmail.com>
References: <CAAVpQUCx9MOJobomXXBcXsCNgSn__U3mJp8LFxD515o-boyr=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAzMCBTYWx0ZWRfX2TBbPm4+q2wt
 IQH9NWdbgJGzEPPaVaF/nZmz30SjEKuo+u5d45B7KaANvljQOs4Ehthg0QIIPxoVdZ4/aC34ku/
 0gIVZAK/D3Ce9C0o9up7lB8ir0ZOc+dmx2ThpVeKqU0PZfBRn4CdDsQAUYVAlrqngrXyo9pNlLw
 pmudLwWU0yzcqG3uDCDVjmVo+R2YU03ZFXPEXdzeIKVQ8u72WfTlqrHLAIMa8zL1SxMijDozYDD
 3XsliMZAmdbGP8ECrv26erd4AmRHc2QG6lcEagqseRMLix3++7QsJHEiD/TEKC6YfJQpXsLgs2z
 kaPrU2hNxoGTqXOvVPinohVe0FfDZcl0wYBlUJPbMBCzU+FSyUOOj/7/8MpZKjNTRvYFH9zcgsh
 Kwi8hIiErCmxOWRu7C/xOB2f7MHOmw==
X-Proofpoint-ORIG-GUID: j7opWahkZIPjUOdo93v6udwLHq2hoTfi
X-Proofpoint-GUID: j7opWahkZIPjUOdo93v6udwLHq2hoTfi
X-Authority-Analysis: v=2.4 cv=N/8k1m9B c=1 sm=1 tr=0 ts=68fc4958 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=qf4gfuq51q0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1XWaLZrsAAAA:8 a=t7CeM3EgAAAA:8 a=hSkVLCK3AAAA:8 a=1RhtLw8l69tUTrcMIoMA:9
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
 definitions=main-2510250030

On Fri, 24 Oct 2025 19:18:46 -0700, Kuniyuki Iwashima <kuniyu@google.com> wrote:
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
> > +
> >  /* af_rose.c */
> >  extern ax25_address rose_callsign;
> >  extern int  sysctl_rose_restart_request_timeout;
> > diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> > index 7746229fdc8c..334c8cc0876d 100644
> > --- a/net/rose/rose_link.c
> > +++ b/net/rose/rose_link.c
> > @@ -43,6 +43,9 @@ void rose_start_ftimer(struct rose_neigh *neigh)
> >
> >  static void rose_start_t0timer(struct rose_neigh *neigh)
> >  {
> > +       if (!neigh)
> > +               return;
> > +
> >         timer_delete(&neigh->t0timer);
> >
> >         neigh->t0timer.function = rose_t0timer_expiry;
> > @@ -80,10 +83,12 @@ static void rose_t0timer_expiry(struct timer_list *t)
> >  {
> >         struct rose_neigh *neigh = timer_container_of(neigh, t, t0timer);
> >
> 
> What prevents rose_timer_expiry() from releasing the
> last refcnt here ?
The issue reported by syzbot is that rose_t0timer_expiry() is triggered
first, followed by rose_timer_expiry().
Therefore, in rose_t0timer_expiry(), the reference count of neigh is
increased before entering rose_transmit_restart_request() to prevent
neigh from being put in rose_timer_expiry(). Then, in rose_t0timer_expiry(),
neigh is put before executing rose_start_t0timer() and the neigh value is
set to NULL to prevent t0timer restarts.

The case where rose_timer_expiry() is triggered before rose_t0timer_expiry()
is not considered at this time.
> 
> The t0timer could be triggered even after that happens.
> 
> 
> > +       rose_neigh_hold(neigh);
> >         rose_transmit_restart_request(neigh);
> >
> >         neigh->dce_mode = 0;
> >
> > +       rose_neigh_putex(&neigh);
> >         rose_start_t0timer(neigh);
> >  }
> >
> > --
> > 2.43.0
> >

