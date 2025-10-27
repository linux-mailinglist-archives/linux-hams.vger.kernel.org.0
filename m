Return-Path: <linux-hams+bounces-700-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1281C0FB8F
	for <lists+linux-hams@lfdr.de>; Mon, 27 Oct 2025 18:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A30B2463F8B
	for <lists+linux-hams@lfdr.de>; Mon, 27 Oct 2025 17:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC2431A04D;
	Mon, 27 Oct 2025 17:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MrOUfsWW"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF293161BC
	for <linux-hams@vger.kernel.org>; Mon, 27 Oct 2025 17:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761586851; cv=none; b=SFfGX8dP0V+gJ8Bg/JQfKyJa3tzWGtiDqkFF4ODziPfpceEGVVeRZ+OVlRgVS5jdRAAc4vOFcEJfRDfWcVjzTpXb/Pg10cY5kUnX8OX6RPfgYNCSPSbGZe7OsuJwdbh6YLHyxd9G+MqhEbiRn+/f4Gq67wL768/d3tT5XDzAgTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761586851; c=relaxed/simple;
	bh=yrssoTy4jgd8O3sgebe7ei17neZ6MLQm24uhci7teas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DnncI7iGJW0jtI2yh8gyCrgYSOHvrZp0S6ZZZyln1bukk/a9gC8hTavW0Sj1LaRCgWv36DXrQCHd7yHLGd82UV3/xK1OsiiqotG8WwOFDpYDXN746XdBFprEyg9islvVoCdWi77yIWFiC3ZU5C5hdw4J9fKoBnaFLim52yldhog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MrOUfsWW; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso4094952a12.3
        for <linux-hams@vger.kernel.org>; Mon, 27 Oct 2025 10:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761586847; x=1762191647; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPCmzMn2A+XBQUun/a12vKmCiqo+GJ3W6P9jrYY7W5U=;
        b=MrOUfsWWP/iTKArYbhaYldiXnaTfKohRUtmHBf8Tfm0EelKvr24IUvJ0qpvzVZUa7Z
         O4AavCKEK5bZVb/gWTCw7TIpqbOEHPyzca00GQnWruuvBJpKEoyAg0TKxc5TXXfWHep6
         yuC3nert32fn1nTetN6yHaNWWvJz9T917jQ+j13XpKg9t5L8dKvV3OBpfTjkzka5NvkK
         FKljmn2NnLqr6W900Atxyn0upaeAI9yrql3z7AslPtsna5Q86jAd4OSbDpBXQmlkdwTr
         uVJDKIbhjqRsdTgFDOuQ+yl13OJ/FMZctUW+gw9w67dLB7zcONL9yqGk/oRU5fa4bzJE
         u/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761586847; x=1762191647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPCmzMn2A+XBQUun/a12vKmCiqo+GJ3W6P9jrYY7W5U=;
        b=jAKOl/lKqYmETU8+yr428EuJggst/Olnj7sOhwckvWG5cp4dDQwBa1tIoxS+QmVpEQ
         kAZA1jdGbxlyI7Sx2aFHoa8Bnn21xeo4f9LsIkAMUDpP/OiRKbyGUXaWkTaKW2QrrL/p
         VjsB5d0DlAH4xnOT+CyenelvDEsMJX5zqO/yGpwTTxNQDZd2lrPdt9qxr7ghMRnrOFfq
         0OYAZOpFBrcAuewr81z1ZF0rXliZbqbi8ixUONCiyh87/aYYvDrRX2BUY7Z00/chB/bG
         nWa9ZVxvfPg6PpCkd5nXd7TDsjZvmNLku5wQWg8gHkYtf4o4ItIPMxKZRzpHqkVB4YGI
         DiGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVldtibft9IOaXnQrI0VdvKq89GUUurogYJ9LI6G+rtmSB2c6p7QF4hRr/0F20h8ouAsndoM9k/fiia@vger.kernel.org
X-Gm-Message-State: AOJu0YzmE9AA73ApwOvv0dhkCShH76dF5GEddtG92qu5yqPXyxL09SwQ
	zB7SVKGO/rddvMFKbpKDaddgkRzZSxKAodXdnY/HR2qg1ln1Qll53/Rp/54N/wLLxCaweIDEfd7
	m7Q/PYuBm5aeHg04CXRumgR8zRVhsQFRRLH0VXeHT
X-Gm-Gg: ASbGnctgO+XdyEB6y78nvCryZGn/hbcWlyUHuYRvdMM10jbL4Nd/ZdwLjHEgEg9t0oM
	MKijNx0M8SC5DqfaO4RCeXUtvh8iK31ObpTWyKKP/YgCKd3JvHsvSjmVlrx3W6vNJGi9fQrS5TB
	lAHtc+GeR+L885BReK4EveqiZidEpAHYEP7iPrHEtdm/qBlHgutQHxbX9Yvc8cSF6r8isjPlsG0
	yTQlKhGvJEy1LAgwOAOEqUNQGmXDPEoiV0ZcfN+6UXnqyFFJeupUp0p8qSIxZ13Y0+xF4l34l9c
	gZdpyu5m9fqeRgpmHpUT8p2xpQ==
X-Google-Smtp-Source: AGHT+IGvLrA+njYshjEDvqusYQk/lL0ezsX0X9xwbHI10HNYnNH7O8L8mtGr8v7dpjz1zoeXbp5G9y8cGj5M/gZEOiE=
X-Received: by 2002:a17:902:e845:b0:290:c5c8:941d with SMTP id
 d9443c01a7336-294cb51121fmr8719025ad.39.1761586846290; Mon, 27 Oct 2025
 10:40:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAVpQUAEBgTZF5GMvRgZybC0pHUuaN-4JBaff79L6AABNKSNWw@mail.gmail.com>
 <20251025075314.3275350-1-lizhi.xu@windriver.com>
In-Reply-To: <20251025075314.3275350-1-lizhi.xu@windriver.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 27 Oct 2025 10:40:34 -0700
X-Gm-Features: AWmQ_bnEM1KrRr71L9tmkILbF5hbRJqWIFE8_lnlj1yNvYaGqplbdRBECxLymzE
Message-ID: <CAAVpQUA1v+LDYfpGGcTJ3sGGhmo6BCBrwWUwaj9cUbBVrw28GQ@mail.gmail.com>
Subject: Re: [PATCH V3] net: rose: Prevent the use of freed digipeat
To: Lizhi Xu <lizhi.xu@windriver.com>
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	jreuter@yaina.de, kuba@kernel.org, linux-hams@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 25, 2025 at 12:53=E2=80=AFAM Lizhi Xu <lizhi.xu@windriver.com> =
wrote:
>
> On Sat, 25 Oct 2025 00:15:51 -0700, Kuniyuki Iwashima <kuniyu@google.com>=
 wrote:
> > On Fri, Oct 24, 2025 at 11:46 PM Lizhi Xu <lizhi.xu@windriver.com> wrot=
e:
> > >
> > > On Fri, 24 Oct 2025 21:25:20 -0700, Kuniyuki Iwashima <kuniyu@google.=
com> wrote:
> > > > On Fri, Oct 24, 2025 at 8:51 PM Lizhi Xu <lizhi.xu@windriver.com> w=
rote:
> > > > >
> > > > > On Fri, 24 Oct 2025 19:18:46 -0700, Kuniyuki Iwashima <kuniyu@goo=
gle.com> wrote:
> > > > > > On Fri, Oct 24, 2025 at 2:39 AM Lizhi Xu <lizhi.xu@windriver.co=
m> wrote:
> > > > > > >
> > > > > > > There is no synchronization between the two timers, rose_t0ti=
mer_expiry
> > > > > > > and rose_timer_expiry.
> > > > > > > rose_timer_expiry() puts the neighbor when the rose state is =
ROSE_STATE_2.
> > > > > > > However, rose_t0timer_expiry() does initiate a restart reques=
t on the
> > > > > > > neighbor.
> > > > > > > When rose_t0timer_expiry() accesses the released neighbor mem=
ber digipeat,
> > > > > > > a UAF is triggered.
> > > > > > >
> > > > > > > To avoid this UAF, defer the put operation to rose_t0timer_ex=
piry() and
> > > > > > > stop restarting t0timer after putting the neighbor.
> > > > > > >
> > > > > > > When putting the neighbor, set the neighbor to NULL. Setting =
neighbor to
> > > > > > > NULL prevents rose_t0timer_expiry() from restarting t0timer.
> > > > > > >
> > > > > > > syzbot reported a slab-use-after-free Read in ax25_find_cb.
> > > > > > > BUG: KASAN: slab-use-after-free in ax25_find_cb+0x3b8/0x3f0 n=
et/ax25/af_ax25.c:237
> > > > > > > Read of size 1 at addr ffff888059c704c0 by task syz.6.2733/17=
200
> > > > > > > Call Trace:
> > > > > > >  ax25_find_cb+0x3b8/0x3f0 net/ax25/af_ax25.c:237
> > > > > > >  ax25_send_frame+0x157/0xb60 net/ax25/ax25_out.c:55
> > > > > > >  rose_send_frame+0xcc/0x2c0 net/rose/rose_link.c:106
> > > > > > >  rose_transmit_restart_request+0x1b8/0x240 net/rose/rose_link=
.c:198
> > > > > > >  rose_t0timer_expiry+0x1d/0x150 net/rose/rose_link.c:83
> > > > > > >
> > > > > > > Freed by task 17183:
> > > > > > >  kfree+0x2b8/0x6d0 mm/slub.c:6826
> > > > > > >  rose_neigh_put include/net/rose.h:165 [inline]
> > > > > > >  rose_timer_expiry+0x537/0x630 net/rose/rose_timer.c:183
> > > > > > >
> > > > > > > Fixes: d860d1faa6b2 ("net: rose: convert 'use' field to refco=
unt_t")
> > > > > > > Reported-by: syzbot+caa052a0958a9146870d@syzkaller.appspotmai=
l.com
> > > > > > > Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> > > > > > > ---
> > > > > > > V1 -> V2: Putting the neighbor stops t0timer from automatical=
ly starting
> > > > > > > V2 -> V3: add rose_neigh_putex for set rose neigh to NULL
> > > > > > >
> > > > > > >  include/net/rose.h   | 12 ++++++++++++
> > > > > > >  net/rose/rose_link.c |  5 +++++
> > > > > > >  2 files changed, 17 insertions(+)
> > > > > > >
> > > > > > > diff --git a/include/net/rose.h b/include/net/rose.h
> > > > > > > index 2b5491bbf39a..33de310ba778 100644
> > > > > > > --- a/include/net/rose.h
> > > > > > > +++ b/include/net/rose.h
> > > > > > > @@ -167,6 +167,18 @@ static inline void rose_neigh_put(struct=
 rose_neigh *rose_neigh)
> > > > > > >         }
> > > > > > >  }
> > > > > > >
> > > > > > > +static inline void rose_neigh_putex(struct rose_neigh **rose=
neigh)
> > > > > > > +{
> > > > > > > +       struct rose_neigh *rose_neigh =3D *roseneigh;
> > > > > > > +       if (refcount_dec_and_test(&rose_neigh->use)) {
> > > > > > > +               if (rose_neigh->ax25)
> > > > > > > +                       ax25_cb_put(rose_neigh->ax25);
> > > > > > > +               kfree(rose_neigh->digipeat);
> > > > > > > +               kfree(rose_neigh);
> > > > > > > +               *roseneigh =3D NULL;
> > > > > > > +       }
> > > > > > > +}
> > > > > > > +
> > > > > > >  /* af_rose.c */
> > > > > > >  extern ax25_address rose_callsign;
> > > > > > >  extern int  sysctl_rose_restart_request_timeout;
> > > > > > > diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> > > > > > > index 7746229fdc8c..334c8cc0876d 100644
> > > > > > > --- a/net/rose/rose_link.c
> > > > > > > +++ b/net/rose/rose_link.c
> > > > > > > @@ -43,6 +43,9 @@ void rose_start_ftimer(struct rose_neigh *n=
eigh)
> > > > > > >
> > > > > > >  static void rose_start_t0timer(struct rose_neigh *neigh)
> > > > > > >  {
> > > > > > > +       if (!neigh)
> > > > > > > +               return;
> > > > > > > +
> > > > > > >         timer_delete(&neigh->t0timer);
> > > > > > >
> > > > > > >         neigh->t0timer.function =3D rose_t0timer_expiry;
> > > > > > > @@ -80,10 +83,12 @@ static void rose_t0timer_expiry(struct ti=
mer_list *t)
> > > > > > >  {
> > > > > > >         struct rose_neigh *neigh =3D timer_container_of(neigh=
, t, t0timer);
> > > > > > >
> > > > > >
> > > > > > What prevents rose_timer_expiry() from releasing the
> > > > > > last refcnt here ?
> > > > > The issue reported by syzbot is that rose_t0timer_expiry() is tri=
ggered
> > > > > first, followed by rose_timer_expiry().
> > > >
> > > > I don't see how you read that ordering from the report.
> > > > https://syzkaller.appspot.com/bug?extid=3Dcaa052a0958a9146870d
> > > Here's my understanding: See the two calltraces below.
> >
> > The same question still applies.
> >
> > What prevents rose_timer_expiry() from releasing the last
> > refcnt before [1] ?
> @@ -80,10 +83,12 @@ static void rose_t0timer_expiry(struct timer_list *t)
>  {
>         struct rose_neigh *neigh =3D timer_container_of(neigh, t, t0timer=
);
>
> +       rose_neigh_hold(neigh); // [3] This prevents rose_timer_expiry() =
from putting neigh.

If you ask yourself the same question once more here,
you will notice the fix is broken.

What prevents rose_timer_expiry() from releasing the
last refcnt before rose_neigh_hold() ?

Do you add another rose_neigh_hold() before
rose_neigh_hold() ?

... and the same question applies as long as you are
trying to fix the bug by adding changes in rose_t0timer_expiry().


>         rose_transmit_restart_request(neigh);
>
>         neigh->dce_mode =3D 0;
>
> +       rose_neigh_putex(&neigh); // [4] This prevents t0timer from resta=
rting by setting neigh to NULL.
>         rose_start_t0timer(neigh);
>  }
> >
> > For example, why is accessing neigh->dev in rose_send_frame()
> > safe then ?
> >
> > The commit message mentions that two timers are not
> > synchronised, but the diff adds no such synchronisation.
> >
> >
> > > [1] Line 111 occurs after rose_neigh_put(). Otherwise, accessing
> > > neigh->digipeat would result in a UAF. Therefore, rose_t0timer_expiry=
()
> > > must be triggered before rose_timer_expiry().
> > >
> > > [2] syzbot reports that line 237 generates a UAF when accessing digi-=
>ndigi.
> > >
> > > UAF Task1:
> > > rose_t0timer_expiry()->
> > >   rose_transmit_restart_request()->
> > >     rose_send_frame(.., neigh->digipeat, ..)-> // [1] line 111
> > >       ax25_find_cb()->
> > >         if (digi !=3D NULL && digi->ndigi !=3D 0)  // [2] line 237
> > >
> > > Freed neigh Task2:
> > >  rose_timer_expiry()->
> > >    rose_neigh_put(neigh)->
> > >      kfree(neigh)
> > > >
> > > > The only ordering I can find is that kfree() in rose_timer_expiry()
> > > > happened before ax25_find_cb () in rose_t0timer_expiry().
> > > >
> > > > > Therefore, in rose_t0timer_expiry(), the reference count of neigh=
 is
> > > > > increased before entering rose_transmit_restart_request() to prev=
ent
> > > > > neigh from being put in rose_timer_expiry(). Then, in rose_t0time=
r_expiry(),
> > > > > neigh is put before executing rose_start_t0timer() and the neigh =
value is
> > > > > set to NULL to prevent t0timer restarts.
> > > > >
> > > > > The case where rose_timer_expiry() is triggered before rose_t0tim=
er_expiry()
> > > > > is not considered at this time.
> > > >
> > > > So this change just papers over the root cause.
> > > >
> > > >
> > > > > >
> > > > > > The t0timer could be triggered even after that happens.
> > > > > >
> > > > > >
> > > > > > > +       rose_neigh_hold(neigh);
> > > > > > >         rose_transmit_restart_request(neigh);
> > > > > > >
> > > > > > >         neigh->dce_mode =3D 0;
> > > > > > >
> > > > > > > +       rose_neigh_putex(&neigh);
> > > > > > >         rose_start_t0timer(neigh);
> > > > > > >  }
> > > > > > >
> > > > > > > --
> > > > > > > 2.43.0
> > > > > > >

