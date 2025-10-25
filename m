Return-Path: <linux-hams+bounces-698-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 925D4C08D9F
	for <lists+linux-hams@lfdr.de>; Sat, 25 Oct 2025 09:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F1E61A62F6C
	for <lists+linux-hams@lfdr.de>; Sat, 25 Oct 2025 07:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA74286D53;
	Sat, 25 Oct 2025 07:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="mVOEc9it"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB74277C98;
	Sat, 25 Oct 2025 07:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761378831; cv=none; b=TdoZldjezhnlR+UjB9SraOuWhTSSxCsO3ycgPMa3xjCd3HdTvVq5DoJrxPQUlgspeXoZxWom00m/FGBgF4GDf1/UwQO5F7sTg0Y1jWPtL+VG98hcLGv5kD4+pDFnT49EX3Zx67q241/GXc0MwOgq7oTVfrji+YQg4SXlP1aqbPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761378831; c=relaxed/simple;
	bh=jg1+qkdhSwKS5qrLon3684aZfiA4cs2YyAL6IeIhTyA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AXtrdXitCZgQzwZMSnFXLRNTVCsvjNgxGyW9sHKU4LmO9nDMBJM5wyVYbdRTpK0hii58zrM8T5C9+C1vYKMSJYcEolnPgOBGdw6m6/6KN8HNbWszIhZzIw/JZW6DmUF4TT1ApcZnMGQDl9CjjjPlgP9W3rSESDycs2X/PhymA24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=mVOEc9it; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59P7iXid1218455;
	Sat, 25 Oct 2025 07:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ICtETx2Z8AVHEoPymap7RM0JQ8qMYAURXImZ9HBoS3U=; b=
	mVOEc9itJE/sUITOccH5W6QbMwfI9Mir+JBnAbmrG/CqyNly9d2mMMaom+fL7oe3
	l/ZlntugsQujGUFgXQJJE0axHbN2fu2g4YPNvpGFhchJBnJFTtzowpSD0PbnmAmF
	Bd0VmzADMjXi8MK9DSORSjua4EFf3RWNJTxtXBTQE3B2Nb9EidonMb2JZdgsgKYr
	JO9TURlF08xhzuE8JoUyY2hBvBOwb4YPf1nyFHl4xCrODfZmzpJGQHNBMUz8G0xR
	ZwCvh+c8DFOawl/HQsxiNJkj798vU36fXGkB4OoTxmGFfGC2lWA95t0cV/OI+nI3
	yifA++VBPrQPDUomsxz30g==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0nh5r59m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 25 Oct 2025 07:53:20 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sat, 25 Oct 2025 00:53:17 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sat, 25 Oct 2025 00:53:14 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <kuniyu@google.com>
CC: <davem@davemloft.net>, <edumazet@google.com>, <horms@kernel.org>,
        <jreuter@yaina.de>, <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lizhi.xu@windriver.com>,
        <netdev@vger.kernel.org>, <pabeni@redhat.com>,
        <syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH V3] net: rose: Prevent the use of freed digipeat
Date: Sat, 25 Oct 2025 15:53:14 +0800
Message-ID: <20251025075314.3275350-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAVpQUAEBgTZF5GMvRgZybC0pHUuaN-4JBaff79L6AABNKSNWw@mail.gmail.com>
References: <CAAVpQUAEBgTZF5GMvRgZybC0pHUuaN-4JBaff79L6AABNKSNWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nWfN72PwxcKdipTathcNAHXEIqLhYbwE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDA3MCBTYWx0ZWRfX8lalfdMngfpE
 QtTVn0jn8ZFB58jd9IFx8zniL5t9luJNszsVSyjqbuGmJfhf+2LQg97i0gRGsp1Z6xXMP0cPq6T
 yHqUkzWTKnu0Untcql+SyQDy1u1U2wA0Vkh0QeocQKT6zRhlk0xg8uNm7SuHSUb9jlcLxt/JZuK
 0mWKlm3gjFK0LGcp9UM488z5guIXZJ/e1q8ZmIDruNVaJOVxcNZw4F/ET0etMdejnfyAv1b3OfY
 EBYrw0T2PMFJeCWLBUztB96vCZs0s25RsOhbl7+PNaozXufnXi6ZmDTi1DOWXwtzna4HkHUSyne
 QDWtkg6yTw9Azl1yaV7757nhohQyLdLjK/zn5PD2LbNrXQg2rmrGZRUrvfQDU1ZMbHVAF6SEnpu
 ZhK4b3A7TtMf6r6KcOIQ1Vk99aq+eQ==
X-Authority-Analysis: v=2.4 cv=FOoWBuos c=1 sm=1 tr=0 ts=68fc81f0 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=edf1wS77AAAA:8 a=1XWaLZrsAAAA:8
 a=t7CeM3EgAAAA:8 a=hSkVLCK3AAAA:8 a=F4dupCkMKLVTJLQvDq8A:9
 a=DcSpbTIhAlouE1Uv7lRv:22 a=FdTzh2GWekK77mhwV6Dw:22 a=cQPPKAXgyycSBL8etih5:22
 a=cPQSjfK2_nFv0Q5t_7PE:22 a=poXaRoVlC6wW9_mwW8W4:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22
 a=SsAZrZ5W_gNWK9tOzrEV:22
X-Proofpoint-ORIG-GUID: nWfN72PwxcKdipTathcNAHXEIqLhYbwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-25_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510250070

On Sat, 25 Oct 2025 00:15:51 -0700, Kuniyuki Iwashima <kuniyu@google.com> wrote:
> On Fri, Oct 24, 2025 at 11:46 PM Lizhi Xu <lizhi.xu@windriver.com> wrote:
> >
> > On Fri, 24 Oct 2025 21:25:20 -0700, Kuniyuki Iwashima <kuniyu@google.com> wrote:
> > > On Fri, Oct 24, 2025 at 8:51 PM Lizhi Xu <lizhi.xu@windriver.com> wrote:
> > > >
> > > > On Fri, 24 Oct 2025 19:18:46 -0700, Kuniyuki Iwashima <kuniyu@google.com> wrote:
> > > > > On Fri, Oct 24, 2025 at 2:39 AM Lizhi Xu <lizhi.xu@windriver.com> wrote:
> > > > > >
> > > > > > There is no synchronization between the two timers, rose_t0timer_expiry
> > > > > > and rose_timer_expiry.
> > > > > > rose_timer_expiry() puts the neighbor when the rose state is ROSE_STATE_2.
> > > > > > However, rose_t0timer_expiry() does initiate a restart request on the
> > > > > > neighbor.
> > > > > > When rose_t0timer_expiry() accesses the released neighbor member digipeat,
> > > > > > a UAF is triggered.
> > > > > >
> > > > > > To avoid this UAF, defer the put operation to rose_t0timer_expiry() and
> > > > > > stop restarting t0timer after putting the neighbor.
> > > > > >
> > > > > > When putting the neighbor, set the neighbor to NULL. Setting neighbor to
> > > > > > NULL prevents rose_t0timer_expiry() from restarting t0timer.
> > > > > >
> > > > > > syzbot reported a slab-use-after-free Read in ax25_find_cb.
> > > > > > BUG: KASAN: slab-use-after-free in ax25_find_cb+0x3b8/0x3f0 net/ax25/af_ax25.c:237
> > > > > > Read of size 1 at addr ffff888059c704c0 by task syz.6.2733/17200
> > > > > > Call Trace:
> > > > > >  ax25_find_cb+0x3b8/0x3f0 net/ax25/af_ax25.c:237
> > > > > >  ax25_send_frame+0x157/0xb60 net/ax25/ax25_out.c:55
> > > > > >  rose_send_frame+0xcc/0x2c0 net/rose/rose_link.c:106
> > > > > >  rose_transmit_restart_request+0x1b8/0x240 net/rose/rose_link.c:198
> > > > > >  rose_t0timer_expiry+0x1d/0x150 net/rose/rose_link.c:83
> > > > > >
> > > > > > Freed by task 17183:
> > > > > >  kfree+0x2b8/0x6d0 mm/slub.c:6826
> > > > > >  rose_neigh_put include/net/rose.h:165 [inline]
> > > > > >  rose_timer_expiry+0x537/0x630 net/rose/rose_timer.c:183
> > > > > >
> > > > > > Fixes: d860d1faa6b2 ("net: rose: convert 'use' field to refcount_t")
> > > > > > Reported-by: syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com
> > > > > > Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> > > > > > ---
> > > > > > V1 -> V2: Putting the neighbor stops t0timer from automatically starting
> > > > > > V2 -> V3: add rose_neigh_putex for set rose neigh to NULL
> > > > > >
> > > > > >  include/net/rose.h   | 12 ++++++++++++
> > > > > >  net/rose/rose_link.c |  5 +++++
> > > > > >  2 files changed, 17 insertions(+)
> > > > > >
> > > > > > diff --git a/include/net/rose.h b/include/net/rose.h
> > > > > > index 2b5491bbf39a..33de310ba778 100644
> > > > > > --- a/include/net/rose.h
> > > > > > +++ b/include/net/rose.h
> > > > > > @@ -167,6 +167,18 @@ static inline void rose_neigh_put(struct rose_neigh *rose_neigh)
> > > > > >         }
> > > > > >  }
> > > > > >
> > > > > > +static inline void rose_neigh_putex(struct rose_neigh **roseneigh)
> > > > > > +{
> > > > > > +       struct rose_neigh *rose_neigh = *roseneigh;
> > > > > > +       if (refcount_dec_and_test(&rose_neigh->use)) {
> > > > > > +               if (rose_neigh->ax25)
> > > > > > +                       ax25_cb_put(rose_neigh->ax25);
> > > > > > +               kfree(rose_neigh->digipeat);
> > > > > > +               kfree(rose_neigh);
> > > > > > +               *roseneigh = NULL;
> > > > > > +       }
> > > > > > +}
> > > > > > +
> > > > > >  /* af_rose.c */
> > > > > >  extern ax25_address rose_callsign;
> > > > > >  extern int  sysctl_rose_restart_request_timeout;
> > > > > > diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> > > > > > index 7746229fdc8c..334c8cc0876d 100644
> > > > > > --- a/net/rose/rose_link.c
> > > > > > +++ b/net/rose/rose_link.c
> > > > > > @@ -43,6 +43,9 @@ void rose_start_ftimer(struct rose_neigh *neigh)
> > > > > >
> > > > > >  static void rose_start_t0timer(struct rose_neigh *neigh)
> > > > > >  {
> > > > > > +       if (!neigh)
> > > > > > +               return;
> > > > > > +
> > > > > >         timer_delete(&neigh->t0timer);
> > > > > >
> > > > > >         neigh->t0timer.function = rose_t0timer_expiry;
> > > > > > @@ -80,10 +83,12 @@ static void rose_t0timer_expiry(struct timer_list *t)
> > > > > >  {
> > > > > >         struct rose_neigh *neigh = timer_container_of(neigh, t, t0timer);
> > > > > >
> > > > >
> > > > > What prevents rose_timer_expiry() from releasing the
> > > > > last refcnt here ?
> > > > The issue reported by syzbot is that rose_t0timer_expiry() is triggered
> > > > first, followed by rose_timer_expiry().
> > >
> > > I don't see how you read that ordering from the report.
> > > https://syzkaller.appspot.com/bug?extid=caa052a0958a9146870d
> > Here's my understanding: See the two calltraces below.
> 
> The same question still applies.
> 
> What prevents rose_timer_expiry() from releasing the last
> refcnt before [1] ?
@@ -80,10 +83,12 @@ static void rose_t0timer_expiry(struct timer_list *t)
 {
 	struct rose_neigh *neigh = timer_container_of(neigh, t, t0timer);

+	rose_neigh_hold(neigh); // [3] This prevents rose_timer_expiry() from putting neigh.
 	rose_transmit_restart_request(neigh);

 	neigh->dce_mode = 0;

+	rose_neigh_putex(&neigh); // [4] This prevents t0timer from restarting by setting neigh to NULL.
 	rose_start_t0timer(neigh);
 }
> 
> For example, why is accessing neigh->dev in rose_send_frame()
> safe then ?
> 
> The commit message mentions that two timers are not
> synchronised, but the diff adds no such synchronisation.
> 
> 
> > [1] Line 111 occurs after rose_neigh_put(). Otherwise, accessing
> > neigh->digipeat would result in a UAF. Therefore, rose_t0timer_expiry()
> > must be triggered before rose_timer_expiry().
> >
> > [2] syzbot reports that line 237 generates a UAF when accessing digi->ndigi.
> >
> > UAF Task1:
> > rose_t0timer_expiry()->
> >   rose_transmit_restart_request()->
> >     rose_send_frame(.., neigh->digipeat, ..)-> // [1] line 111
> >       ax25_find_cb()->
> >         if (digi != NULL && digi->ndigi != 0)  // [2] line 237
> >
> > Freed neigh Task2:
> >  rose_timer_expiry()->
> >    rose_neigh_put(neigh)->
> >      kfree(neigh)
> > >
> > > The only ordering I can find is that kfree() in rose_timer_expiry()
> > > happened before ax25_find_cb () in rose_t0timer_expiry().
> > >
> > > > Therefore, in rose_t0timer_expiry(), the reference count of neigh is
> > > > increased before entering rose_transmit_restart_request() to prevent
> > > > neigh from being put in rose_timer_expiry(). Then, in rose_t0timer_expiry(),
> > > > neigh is put before executing rose_start_t0timer() and the neigh value is
> > > > set to NULL to prevent t0timer restarts.
> > > >
> > > > The case where rose_timer_expiry() is triggered before rose_t0timer_expiry()
> > > > is not considered at this time.
> > >
> > > So this change just papers over the root cause.
> > >
> > >
> > > > >
> > > > > The t0timer could be triggered even after that happens.
> > > > >
> > > > >
> > > > > > +       rose_neigh_hold(neigh);
> > > > > >         rose_transmit_restart_request(neigh);
> > > > > >
> > > > > >         neigh->dce_mode = 0;
> > > > > >
> > > > > > +       rose_neigh_putex(&neigh);
> > > > > >         rose_start_t0timer(neigh);
> > > > > >  }
> > > > > >
> > > > > > --
> > > > > > 2.43.0
> > > > > >

