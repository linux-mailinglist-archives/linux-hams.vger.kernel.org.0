Return-Path: <linux-hams+bounces-701-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF6DC12A15
	for <lists+linux-hams@lfdr.de>; Tue, 28 Oct 2025 03:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7F0664E855E
	for <lists+linux-hams@lfdr.de>; Tue, 28 Oct 2025 02:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DACD1A9FBA;
	Tue, 28 Oct 2025 02:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="SvDVz/Kv"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A90F50F;
	Tue, 28 Oct 2025 02:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761617188; cv=none; b=dj7iYegM9aT2CPV8FWc5byTc0QaciQ7bP+bisZjuTLEVQBh2qgdufUYbh+AvK1JsXCdT2NS8DaIOrMv34M7xD1YRgyLUnBxgFwyAWkh8Sq/tzYCrA4D/sTA1esZG6k7DcZJPapUdurUXb6wh/8kzFAGC/dMOAU07KQOIX8BABVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761617188; c=relaxed/simple;
	bh=hB0F0f3czaGrMW/cqojaLSFWSVcNLZ93V4c7pu+q15k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VnVDGU+I9vC4U/2e6RmU3wu1DrLbFX9+Llkk5L+jeEKs6gECK481U1qX4JME441Jf7AtRuXUg/v2+p9tEs/KBuVs5+jEdDncTbHXAQy1uAnwkjxge2bpomq2ZQlayoLow/+MaZfAIFNFgrI+jblphBrlNezLtBKMGcr4v0mFLcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=SvDVz/Kv; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S0ADVC2710318;
	Mon, 27 Oct 2025 19:06:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Odw5CO1GMwiID/662eBOMWyp09TTAmRXFX0uj18/NiQ=; b=
	SvDVz/KvxVmSGMb1NU2v8jrHJK+u15XNgCpAP1SC1aA8cNRgH76fGOjsGSk9jpHF
	faemMjpur56QJh4w6GZj3AKxny4U6P5YvESNECL8y0/YnzEJAKGfdjRaAty/Uqj9
	65ueVymPHj137NSj13ebyXnXdoPeX9Qz6j97TzI9K0CfTB+8ETN0/7CiwnpLL0IV
	+S2038tW49tEaTKs02lHv4b1AgimQ+b2TkZIgQQ2MWJApyGr49WMRBCpAsBKtfNE
	DWyp0FJ+U4veS3pYQPAdBz03OqM6VFyIRpyLE9nAUFTY8CKxNg7iWCyHsmAoh3BI
	70YSADh9CAU+TiS40Hshmg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0su1jgtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Oct 2025 19:06:03 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 27 Oct 2025 19:06:03 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 27 Oct 2025 19:06:00 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <kuniyu@google.com>
CC: <davem@davemloft.net>, <edumazet@google.com>, <horms@kernel.org>,
        <jreuter@yaina.de>, <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lizhi.xu@windriver.com>,
        <netdev@vger.kernel.org>, <pabeni@redhat.com>,
        <syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH V3] net: rose: Prevent the use of freed digipeat
Date: Tue, 28 Oct 2025 10:05:59 +0800
Message-ID: <20251028020559.2527458-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAVpQUA1v+LDYfpGGcTJ3sGGhmo6BCBrwWUwaj9cUbBVrw28GQ@mail.gmail.com>
References: <CAAVpQUA1v+LDYfpGGcTJ3sGGhmo6BCBrwWUwaj9cUbBVrw28GQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=SuadKfO0 c=1 sm=1 tr=0 ts=6900250b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=edf1wS77AAAA:8 a=1XWaLZrsAAAA:8
 a=t7CeM3EgAAAA:8 a=hSkVLCK3AAAA:8 a=FmatfasXnMZaY-i_3HAA:9
 a=DcSpbTIhAlouE1Uv7lRv:22 a=FdTzh2GWekK77mhwV6Dw:22 a=cQPPKAXgyycSBL8etih5:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=cPQSjfK2_nFv0Q5t_7PE:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22
 a=SsAZrZ5W_gNWK9tOzrEV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDAxNyBTYWx0ZWRfXzutfacNwVav5
 7MzKHQcfvwS60xUlrPqY65JhS0CQkSxLb79TyXvSzMxkRKjno46VgeYfrfBTmtrXCpuyxXRP/2m
 whAt66emVDE+QhBnk8CpLgw9TSFKKSxxNkoTVbMY/ef8AGIcVamMC7l4cur6ik65HRqVv3DqJ5Y
 Uz/0GrAysNy4sxaVC7mT31fMHo6CRp/xjbMSDgAP/1E2Jzc198sRb4bxyJh9/AWAUt94z15S48y
 dhq/pJ/iUr4E88RfuNMOSdGix3zwGQTbf7o4FcisiGmzXJxaoFxI/iifvUs6ORwi9+lxnQAfWN/
 G2QTIK2cqt0kvT/FdyPySmvOHCWlNljBn9xPlAmyqmk8WZj8nu0Qe48ImStksyGtCXAcL9u3qaV
 yLAmOELluM89J/VeV1MbB/Bc/6xbzw==
X-Proofpoint-GUID: eIPEPaC6TD0wL_su1l6R_PHRRa5GQyLH
X-Proofpoint-ORIG-GUID: eIPEPaC6TD0wL_su1l6R_PHRRa5GQyLH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280017

On Mon, 27 Oct 2025 10:40:34 -0700, Kuniyuki Iwashima <kuniyu@google.com> wrote:
> On Sat, Oct 25, 2025 at 12:53 AM Lizhi Xu <lizhi.xu@windriver.com> wrote:
> >
> > On Sat, 25 Oct 2025 00:15:51 -0700, Kuniyuki Iwashima <kuniyu@google.com> wrote:
> > > On Fri, Oct 24, 2025 at 11:46 PM Lizhi Xu <lizhi.xu@windriver.com> wrote:
> > > >
> > > > On Fri, 24 Oct 2025 21:25:20 -0700, Kuniyuki Iwashima <kuniyu@google.com> wrote:
> > > > > On Fri, Oct 24, 2025 at 8:51 PM Lizhi Xu <lizhi.xu@windriver.com> wrote:
> > > > > >
> > > > > > On Fri, 24 Oct 2025 19:18:46 -0700, Kuniyuki Iwashima <kuniyu@google.com> wrote:
> > > > > > > On Fri, Oct 24, 2025 at 2:39 AM Lizhi Xu <lizhi.xu@windriver.com> wrote:
> > > > > > > >
> > > > > > > > There is no synchronization between the two timers, rose_t0timer_expiry
> > > > > > > > and rose_timer_expiry.
> > > > > > > > rose_timer_expiry() puts the neighbor when the rose state is ROSE_STATE_2.
> > > > > > > > However, rose_t0timer_expiry() does initiate a restart request on the
> > > > > > > > neighbor.
> > > > > > > > When rose_t0timer_expiry() accesses the released neighbor member digipeat,
> > > > > > > > a UAF is triggered.
> > > > > > > >
> > > > > > > > To avoid this UAF, defer the put operation to rose_t0timer_expiry() and
> > > > > > > > stop restarting t0timer after putting the neighbor.
> > > > > > > >
> > > > > > > > When putting the neighbor, set the neighbor to NULL. Setting neighbor to
> > > > > > > > NULL prevents rose_t0timer_expiry() from restarting t0timer.
> > > > > > > >
> > > > > > > > syzbot reported a slab-use-after-free Read in ax25_find_cb.
> > > > > > > > BUG: KASAN: slab-use-after-free in ax25_find_cb+0x3b8/0x3f0 net/ax25/af_ax25.c:237
> > > > > > > > Read of size 1 at addr ffff888059c704c0 by task syz.6.2733/17200
> > > > > > > > Call Trace:
> > > > > > > >  ax25_find_cb+0x3b8/0x3f0 net/ax25/af_ax25.c:237
> > > > > > > >  ax25_send_frame+0x157/0xb60 net/ax25/ax25_out.c:55
> > > > > > > >  rose_send_frame+0xcc/0x2c0 net/rose/rose_link.c:106
> > > > > > > >  rose_transmit_restart_request+0x1b8/0x240 net/rose/rose_link.c:198
> > > > > > > >  rose_t0timer_expiry+0x1d/0x150 net/rose/rose_link.c:83
> > > > > > > >
> > > > > > > > Freed by task 17183:
> > > > > > > >  kfree+0x2b8/0x6d0 mm/slub.c:6826
> > > > > > > >  rose_neigh_put include/net/rose.h:165 [inline]
> > > > > > > >  rose_timer_expiry+0x537/0x630 net/rose/rose_timer.c:183
> > > > > > > >
> > > > > > > > Fixes: d860d1faa6b2 ("net: rose: convert 'use' field to refcount_t")
> > > > > > > > Reported-by: syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com
> > > > > > > > Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> > > > > > > > ---
> > > > > > > > V1 -> V2: Putting the neighbor stops t0timer from automatically starting
> > > > > > > > V2 -> V3: add rose_neigh_putex for set rose neigh to NULL
> > > > > > > >
> > > > > > > >  include/net/rose.h   | 12 ++++++++++++
> > > > > > > >  net/rose/rose_link.c |  5 +++++
> > > > > > > >  2 files changed, 17 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/include/net/rose.h b/include/net/rose.h
> > > > > > > > index 2b5491bbf39a..33de310ba778 100644
> > > > > > > > --- a/include/net/rose.h
> > > > > > > > +++ b/include/net/rose.h
> > > > > > > > @@ -167,6 +167,18 @@ static inline void rose_neigh_put(struct rose_neigh *rose_neigh)
> > > > > > > >         }
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +static inline void rose_neigh_putex(struct rose_neigh **roseneigh)
> > > > > > > > +{
> > > > > > > > +       struct rose_neigh *rose_neigh = *roseneigh;
> > > > > > > > +       if (refcount_dec_and_test(&rose_neigh->use)) {
> > > > > > > > +               if (rose_neigh->ax25)
> > > > > > > > +                       ax25_cb_put(rose_neigh->ax25);
> > > > > > > > +               kfree(rose_neigh->digipeat);
> > > > > > > > +               kfree(rose_neigh);
> > > > > > > > +               *roseneigh = NULL;
> > > > > > > > +       }
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  /* af_rose.c */
> > > > > > > >  extern ax25_address rose_callsign;
> > > > > > > >  extern int  sysctl_rose_restart_request_timeout;
> > > > > > > > diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> > > > > > > > index 7746229fdc8c..334c8cc0876d 100644
> > > > > > > > --- a/net/rose/rose_link.c
> > > > > > > > +++ b/net/rose/rose_link.c
> > > > > > > > @@ -43,6 +43,9 @@ void rose_start_ftimer(struct rose_neigh *neigh)
> > > > > > > >
> > > > > > > >  static void rose_start_t0timer(struct rose_neigh *neigh)
> > > > > > > >  {
> > > > > > > > +       if (!neigh)
> > > > > > > > +               return;
> > > > > > > > +
> > > > > > > >         timer_delete(&neigh->t0timer);
> > > > > > > >
> > > > > > > >         neigh->t0timer.function = rose_t0timer_expiry;
> > > > > > > > @@ -80,10 +83,12 @@ static void rose_t0timer_expiry(struct timer_list *t)
> > > > > > > >  {
> > > > > > > >         struct rose_neigh *neigh = timer_container_of(neigh, t, t0timer);
> > > > > > > >
> > > > > > >
> > > > > > > What prevents rose_timer_expiry() from releasing the
> > > > > > > last refcnt here ?
> > > > > > The issue reported by syzbot is that rose_t0timer_expiry() is triggered
> > > > > > first, followed by rose_timer_expiry().
> > > > >
> > > > > I don't see how you read that ordering from the report.
> > > > > https://syzkaller.appspot.com/bug?extid=caa052a0958a9146870d
> > > > Here's my understanding: See the two calltraces below.
> > >
> > > The same question still applies.
> > >
> > > What prevents rose_timer_expiry() from releasing the last
> > > refcnt before [1] ?
> > @@ -80,10 +83,12 @@ static void rose_t0timer_expiry(struct timer_list *t)
> >  {
> >         struct rose_neigh *neigh = timer_container_of(neigh, t, t0timer);
> >
> > +       rose_neigh_hold(neigh); // [3] This prevents rose_timer_expiry() from putting neigh.
> 
> If you ask yourself the same question once more here,
> you will notice the fix is broken.
> 
> What prevents rose_timer_expiry() from releasing the
> last refcnt before rose_neigh_hold() ?
The UAF issue reported by syzbot is shown below:
	CPU0				CPU1
	====				====
 rose_t0timer_expiry()
 rose_transmit_restart_request()
 rose_send_frame()
 ax25_send_frame()			rose_timer_expiry()
 					rose_neigh_put()
					kfree(neigh)
 ax25_find_cb()

My patch calls rose_neigh_hold() before executing rose_transmit_restart_request()
in rose_t0timer_expiry(). It then calls rose_neigh_putex() to release and
set neigh to NULL before executing rose_start_t0timer(). This also prevents
timer0 from restarting.

I think the only questionable part of the patch is the expiration time of
rose_timer. I don't know the expiration time because I don't have a reproducer.
If the value is very small, the result may be different.

