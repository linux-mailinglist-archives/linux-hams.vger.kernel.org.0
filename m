Return-Path: <linux-hams+bounces-696-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5118DC08C55
	for <lists+linux-hams@lfdr.de>; Sat, 25 Oct 2025 08:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C658E3BF559
	for <lists+linux-hams@lfdr.de>; Sat, 25 Oct 2025 06:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94303280A29;
	Sat, 25 Oct 2025 06:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="pawxbhdZ"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A2C27380A;
	Sat, 25 Oct 2025 06:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761374803; cv=none; b=IqeacRBEw6zTnpILVHqIRoKP1/plAJRDm/i/Oq0+M5Yq4DpmeA371+MQhoV9HNGacQWrlkDjLueu5m+MoN+GByWYWp/lybMBMj2FZgOO9JTIOdE7eRhUc32wLhyKPYFGutWThVZmoFfySK59f3NoIyAMyhgMI8/ltGdulU/cp6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761374803; c=relaxed/simple;
	bh=FSJHWW9m9cdy0TRoQ5njzCk1BM0S5lweNjXmNAaJi/o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L77oNr+IVzPyc9Ead1xl1ElG31nlb8kWv66UK7Bp8E6ySfSOCPYwBNZ3gfCucWCEZpiU9RyO8C8L9D+kzUsoSCXSI4nibYKRntuTdcav7Q7ao4qHP8daDxopkwg7eFF1Vfhh8qz3D0bCdDvephOJm/DlijjF2t7sZBxMMrTwb4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=pawxbhdZ; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59P6kTKO3887718;
	Fri, 24 Oct 2025 23:46:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=kulrq5VcxRmjBR/rmKsV6NKlKnOQcqaQRJRATTGOT3A=; b=
	pawxbhdZ7GXWEuiG7cpIWEMgRKiwhJfsquYEfjRdFvxZu7L3+kaii1VHIpGumjKs
	DB1DBTft4Bj+3jbUcDyoBTfNnDiarKx0CxBau2EsleVHE3MUXVDpnp4QAU4pmQbe
	qrQIiXkJhJ78UuwVNkmZtrWcmsnWOJgddtmQkoiJtGnOwRtwl2WYmb/cpwDtC3mw
	1YuKU4r6VgcVhag70ES3jzVOkMyfXJNJcE8Mnq4z561koLvX+m43dJAwzcw1q6Tf
	wOXcEv5swLhPw9F1nxvpdZ3Ja6eH/9IFPhnlAVcuLW06bjgKa9w58ZUnqqdIY70P
	RMc2xjetv9MyA/EZ8up6Ww==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49ys00hmkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Oct 2025 23:46:29 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 24 Oct 2025 23:46:28 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 24 Oct 2025 23:46:24 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <kuniyu@google.com>
CC: <davem@davemloft.net>, <edumazet@google.com>, <horms@kernel.org>,
        <jreuter@yaina.de>, <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lizhi.xu@windriver.com>,
        <netdev@vger.kernel.org>, <pabeni@redhat.com>,
        <syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH V3] net: rose: Prevent the use of freed digipeat
Date: Sat, 25 Oct 2025 14:46:24 +0800
Message-ID: <20251025064624.2972311-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAVpQUA_CqqUfoJb=NaQ7YnBUbW0UWQS4W++TXwRFekenkDM8Q@mail.gmail.com>
References: <CAAVpQUA_CqqUfoJb=NaQ7YnBUbW0UWQS4W++TXwRFekenkDM8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDA1OCBTYWx0ZWRfX1kmP4GP2+Wwx
 hT4zW3pd0jCNXK2GyVuudk1dlySOvZZ/cs8C+So1rGaYgovG9O4W2r1rhaWtSSn8T7Rxe/zB93Z
 Yg37ym5qub8Eq8S2qJkYaEeHdIUCmlKJyUR15DC4nCLYUErXExKrgLbYvVq5+tK7jSg3INlFniL
 rtsFx2qbq6AJf0NeOuz24u55uLI52MjBbDRaXTGi3nypvVHRcKLL0dZW51GXc1krN4f+YCUkDC6
 zdSe0BfyVdMOtQS9bypzFxSTAEryb5s0/X3ZdgRkssGVVbD1POoC4SW2+6rFpSA2xtca1c7XyUM
 7ZyOSbGoHXx0iPYu9hQpJMQLbfgCy1kgmF4T4CGkNtuOP7n6y1KjSoYT/mjLKR28aD9KfFPLhXw
 8ooqHchAY/jHyhHZktp+WWZ9YOh8iw==
X-Proofpoint-ORIG-GUID: 9X3lRVVseBSacNSTyCcuC6vCqUnXmT-u
X-Proofpoint-GUID: 9X3lRVVseBSacNSTyCcuC6vCqUnXmT-u
X-Authority-Analysis: v=2.4 cv=N/8k1m9B c=1 sm=1 tr=0 ts=68fc7245 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=edf1wS77AAAA:8 a=1XWaLZrsAAAA:8
 a=t7CeM3EgAAAA:8 a=hSkVLCK3AAAA:8 a=vLL4qzFmy0LRcLh0ccMA:9
 a=DcSpbTIhAlouE1Uv7lRv:22 a=FdTzh2GWekK77mhwV6Dw:22 a=cQPPKAXgyycSBL8etih5:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=cPQSjfK2_nFv0Q5t_7PE:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22
 a=SsAZrZ5W_gNWK9tOzrEV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-25_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510250058

On Fri, 24 Oct 2025 21:25:20 -0700, Kuniyuki Iwashima <kuniyu@google.com> wrote:
> On Fri, Oct 24, 2025 at 8:51 PM Lizhi Xu <lizhi.xu@windriver.com> wrote:
> >
> > On Fri, 24 Oct 2025 19:18:46 -0700, Kuniyuki Iwashima <kuniyu@google.com> wrote:
> > > On Fri, Oct 24, 2025 at 2:39 AM Lizhi Xu <lizhi.xu@windriver.com> wrote:
> > > >
> > > > There is no synchronization between the two timers, rose_t0timer_expiry
> > > > and rose_timer_expiry.
> > > > rose_timer_expiry() puts the neighbor when the rose state is ROSE_STATE_2.
> > > > However, rose_t0timer_expiry() does initiate a restart request on the
> > > > neighbor.
> > > > When rose_t0timer_expiry() accesses the released neighbor member digipeat,
> > > > a UAF is triggered.
> > > >
> > > > To avoid this UAF, defer the put operation to rose_t0timer_expiry() and
> > > > stop restarting t0timer after putting the neighbor.
> > > >
> > > > When putting the neighbor, set the neighbor to NULL. Setting neighbor to
> > > > NULL prevents rose_t0timer_expiry() from restarting t0timer.
> > > >
> > > > syzbot reported a slab-use-after-free Read in ax25_find_cb.
> > > > BUG: KASAN: slab-use-after-free in ax25_find_cb+0x3b8/0x3f0 net/ax25/af_ax25.c:237
> > > > Read of size 1 at addr ffff888059c704c0 by task syz.6.2733/17200
> > > > Call Trace:
> > > >  ax25_find_cb+0x3b8/0x3f0 net/ax25/af_ax25.c:237
> > > >  ax25_send_frame+0x157/0xb60 net/ax25/ax25_out.c:55
> > > >  rose_send_frame+0xcc/0x2c0 net/rose/rose_link.c:106
> > > >  rose_transmit_restart_request+0x1b8/0x240 net/rose/rose_link.c:198
> > > >  rose_t0timer_expiry+0x1d/0x150 net/rose/rose_link.c:83
> > > >
> > > > Freed by task 17183:
> > > >  kfree+0x2b8/0x6d0 mm/slub.c:6826
> > > >  rose_neigh_put include/net/rose.h:165 [inline]
> > > >  rose_timer_expiry+0x537/0x630 net/rose/rose_timer.c:183
> > > >
> > > > Fixes: d860d1faa6b2 ("net: rose: convert 'use' field to refcount_t")
> > > > Reported-by: syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com
> > > > Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> > > > ---
> > > > V1 -> V2: Putting the neighbor stops t0timer from automatically starting
> > > > V2 -> V3: add rose_neigh_putex for set rose neigh to NULL
> > > >
> > > >  include/net/rose.h   | 12 ++++++++++++
> > > >  net/rose/rose_link.c |  5 +++++
> > > >  2 files changed, 17 insertions(+)
> > > >
> > > > diff --git a/include/net/rose.h b/include/net/rose.h
> > > > index 2b5491bbf39a..33de310ba778 100644
> > > > --- a/include/net/rose.h
> > > > +++ b/include/net/rose.h
> > > > @@ -167,6 +167,18 @@ static inline void rose_neigh_put(struct rose_neigh *rose_neigh)
> > > >         }
> > > >  }
> > > >
> > > > +static inline void rose_neigh_putex(struct rose_neigh **roseneigh)
> > > > +{
> > > > +       struct rose_neigh *rose_neigh = *roseneigh;
> > > > +       if (refcount_dec_and_test(&rose_neigh->use)) {
> > > > +               if (rose_neigh->ax25)
> > > > +                       ax25_cb_put(rose_neigh->ax25);
> > > > +               kfree(rose_neigh->digipeat);
> > > > +               kfree(rose_neigh);
> > > > +               *roseneigh = NULL;
> > > > +       }
> > > > +}
> > > > +
> > > >  /* af_rose.c */
> > > >  extern ax25_address rose_callsign;
> > > >  extern int  sysctl_rose_restart_request_timeout;
> > > > diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> > > > index 7746229fdc8c..334c8cc0876d 100644
> > > > --- a/net/rose/rose_link.c
> > > > +++ b/net/rose/rose_link.c
> > > > @@ -43,6 +43,9 @@ void rose_start_ftimer(struct rose_neigh *neigh)
> > > >
> > > >  static void rose_start_t0timer(struct rose_neigh *neigh)
> > > >  {
> > > > +       if (!neigh)
> > > > +               return;
> > > > +
> > > >         timer_delete(&neigh->t0timer);
> > > >
> > > >         neigh->t0timer.function = rose_t0timer_expiry;
> > > > @@ -80,10 +83,12 @@ static void rose_t0timer_expiry(struct timer_list *t)
> > > >  {
> > > >         struct rose_neigh *neigh = timer_container_of(neigh, t, t0timer);
> > > >
> > >
> > > What prevents rose_timer_expiry() from releasing the
> > > last refcnt here ?
> > The issue reported by syzbot is that rose_t0timer_expiry() is triggered
> > first, followed by rose_timer_expiry().
> 
> I don't see how you read that ordering from the report.
> https://syzkaller.appspot.com/bug?extid=caa052a0958a9146870d
Here's my understanding: See the two calltraces below.
[1] Line 111 occurs after rose_neigh_put(). Otherwise, accessing
neigh->digipeat would result in a UAF. Therefore, rose_t0timer_expiry()
must be triggered before rose_timer_expiry().

[2] syzbot reports that line 237 generates a UAF when accessing digi->ndigi.

UAF Task1:
rose_t0timer_expiry()->
  rose_transmit_restart_request()->
    rose_send_frame(.., neigh->digipeat, ..)-> // [1] line 111
      ax25_find_cb()->
        if (digi != NULL && digi->ndigi != 0)  // [2] line 237

Freed neigh Task2:
 rose_timer_expiry()->
   rose_neigh_put(neigh)->
     kfree(neigh)
> 
> The only ordering I can find is that kfree() in rose_timer_expiry()
> happened before ax25_find_cb () in rose_t0timer_expiry().
> 
> > Therefore, in rose_t0timer_expiry(), the reference count of neigh is
> > increased before entering rose_transmit_restart_request() to prevent
> > neigh from being put in rose_timer_expiry(). Then, in rose_t0timer_expiry(),
> > neigh is put before executing rose_start_t0timer() and the neigh value is
> > set to NULL to prevent t0timer restarts.
> >
> > The case where rose_timer_expiry() is triggered before rose_t0timer_expiry()
> > is not considered at this time.
> 
> So this change just papers over the root cause.
> 
> 
> > >
> > > The t0timer could be triggered even after that happens.
> > >
> > >
> > > > +       rose_neigh_hold(neigh);
> > > >         rose_transmit_restart_request(neigh);
> > > >
> > > >         neigh->dce_mode = 0;
> > > >
> > > > +       rose_neigh_putex(&neigh);
> > > >         rose_start_t0timer(neigh);
> > > >  }
> > > >
> > > > --
> > > > 2.43.0
> > > >

