Return-Path: <linux-hams+bounces-693-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B65CAC088D3
	for <lists+linux-hams@lfdr.de>; Sat, 25 Oct 2025 04:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9E55F4E1ABA
	for <lists+linux-hams@lfdr.de>; Sat, 25 Oct 2025 02:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3348623EA8B;
	Sat, 25 Oct 2025 02:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jpg0JaAr"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BA122A813
	for <linux-hams@vger.kernel.org>; Sat, 25 Oct 2025 02:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761358740; cv=none; b=hCp3XvjFZWRIFJJzXsHemlvbHy1cV6opMlQNymwZXhM7B72x85WlyUnlDq1Stt2e5i+fhvHV0Pjnt34YCXMcxNedAhOoq4tuTT+Ti9a/bqn4YmxU/qmsqQA8JpMCKMF1I15noAUh6gTHYq6BeOrKJA016sOAOKBmb6Quf7VW8zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761358740; c=relaxed/simple;
	bh=bDUYYRciJNzA771LBf/e+NnZDQD2rgyedHYq3kTLh34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeNw9npD3XtbKpn8SnSTC/te7D8jTksB91G1WJqwSIIcot99AAs3uYkx22qHHDmBvQp0zt7e8JgaWl8jz30PO668qeFoas2qkKn0KBb+v3qebQisd+MVuz9Y579kHRyldD8s801+inSllRDbZaL32uGRJSvlbga6G+C0In7we3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jpg0JaAr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-290ac2ef203so25512205ad.1
        for <linux-hams@vger.kernel.org>; Fri, 24 Oct 2025 19:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761358738; x=1761963538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pdh//SdW7AOfLkMx7dZ5JsgWsCD402PSQSG+CEzxU10=;
        b=Jpg0JaAriLEG1ygXrWfDuEeSoWG1tGtSt7+5TqFNbtuOQnReAzYR4bHXyeu4tVJgTr
         lOM9pacVMEoUw8KXOrQVbZGiCwEZK0dPtTmV8DFvtrbCLAYnpPFlVuUSH2Bgv/Flq+xu
         ekjH0TSWNQkXzc5ei20FwbFWBFXpz7wM1XWNLPlx+Jz2N3P7roXanOsza9EpYJunDrJ1
         DYl6eW2F4IH/96FVfSnKxRYIHpEfMzqLxmzh2dF9bcZj/tt/OzHSKpD27EnSwU/RcSHo
         J+/nS0H3jfREoLdJf1fbbxqgu3jjMat21EjNUtfn3UowQtro9apLPCvSc++g01RElfIt
         rUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761358738; x=1761963538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pdh//SdW7AOfLkMx7dZ5JsgWsCD402PSQSG+CEzxU10=;
        b=j3ro49E6qVaSlgkDnQtoNoSRQIcw2QOfonCnJq46mLe4FrCt1HW8Bawr9LDKndRwwN
         uzHBWe6RdWVjpdKZiXXjGc5X68NATdaxsvebpgbmH/n0JWTs5NjseDtAwKh5kq6isrwW
         7g5p60QNPeKwtSOZCwOFpkDBHXTMtIVOXK5j7KFgFJd3M0ronOc2BInYVYXaKRhJ237S
         ZNN+kpRXezxlzeXrzTPChmjvwygkSDxfjm+QtIE6J6pZQmvzlQ8qXe8/nH1+TIPCaEBF
         19x+bSIXhg0IfOA/s5qRiG/k1hQdvCQoxk4d2gQzcY1Tl8qQ1O5Pey3vi5yA6X1HCE9Y
         i3DQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9YxO5ieYcQA/sLVDBEbXBxGTxcKvAW/EgPaxnWhhtSvXlkT1Fth9TfLCD9YOfy42tSbipu1lnWpef@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2V2wTqIn9nAkAed84s+ErS4KD9SsGNLg6C/u9EM02E9UE0Z/H
	UiFns6acaUD6VRo7quj7j79XfaAS06MdcWO7oHKZ79pBmiqgAY31gpbqdm8pXP5FZOL/dFQ8ky3
	K7HN2r72S7pKKdbeQ9WouRXelNGGsethdla+un2J9
X-Gm-Gg: ASbGncvlVnKVMx4xMs+YZj9PR3bxEVWtM42xaUUdwZjH8hYM+4PFSnAFaR8xdzMpNw7
	qJIpPe/At2N3lI8h3ys9wphPbEYxdhkH4bZ1jT6Krfq/sbs/uIco6QIqDfHBykAgHOS2RELqNev
	+o0W4qXcB1+quNOkWKV2L/62lChYslB2eL1zROYFubD2S3+qVPhhIbR3Nui2Adbu9PdYbvaWnn/
	16bYenf0rD0xDuYdPe0j/f5E9GqabL7rCRbEE9DGW5zBnNnk7kg+1ferUTIfOyTNVrtzpUntyNn
	IeKiNluEl4o5XlmUqY+k8j6bkQ==
X-Google-Smtp-Source: AGHT+IFmI7Ixh5dfHqxdYYFwlyBsopPEERAG88gvbSuwZi3OU+ZNgxIr1hG+HXoabCHtqun/qT0ni+tgPV1F6qkmJBQ=
X-Received: by 2002:a17:902:c94b:b0:271:479d:3de2 with SMTP id
 d9443c01a7336-2948b97311fmr48726135ad.13.1761358737408; Fri, 24 Oct 2025
 19:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251024093901.1202924-1-lizhi.xu@windriver.com>
In-Reply-To: <20251024093901.1202924-1-lizhi.xu@windriver.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 24 Oct 2025 19:18:46 -0700
X-Gm-Features: AS18NWAyugeNKm7Hp5qAgLdmuPQUETlgM-5DwLDqkUiM2xinU82JuTnZkgQCSOc
Message-ID: <CAAVpQUCx9MOJobomXXBcXsCNgSn__U3mJp8LFxD515o-boyr=w@mail.gmail.com>
Subject: Re: [PATCH V3] net: rose: Prevent the use of freed digipeat
To: Lizhi Xu <lizhi.xu@windriver.com>
Cc: edumazet@google.com, davem@davemloft.net, horms@kernel.org, 
	jreuter@yaina.de, kuba@kernel.org, linux-hams@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 2:39=E2=80=AFAM Lizhi Xu <lizhi.xu@windriver.com> w=
rote:
>
> There is no synchronization between the two timers, rose_t0timer_expiry
> and rose_timer_expiry.
> rose_timer_expiry() puts the neighbor when the rose state is ROSE_STATE_2=
.
> However, rose_t0timer_expiry() does initiate a restart request on the
> neighbor.
> When rose_t0timer_expiry() accesses the released neighbor member digipeat=
,
> a UAF is triggered.
>
> To avoid this UAF, defer the put operation to rose_t0timer_expiry() and
> stop restarting t0timer after putting the neighbor.
>
> When putting the neighbor, set the neighbor to NULL. Setting neighbor to
> NULL prevents rose_t0timer_expiry() from restarting t0timer.
>
> syzbot reported a slab-use-after-free Read in ax25_find_cb.
> BUG: KASAN: slab-use-after-free in ax25_find_cb+0x3b8/0x3f0 net/ax25/af_a=
x25.c:237
> Read of size 1 at addr ffff888059c704c0 by task syz.6.2733/17200
> Call Trace:
>  ax25_find_cb+0x3b8/0x3f0 net/ax25/af_ax25.c:237
>  ax25_send_frame+0x157/0xb60 net/ax25/ax25_out.c:55
>  rose_send_frame+0xcc/0x2c0 net/rose/rose_link.c:106
>  rose_transmit_restart_request+0x1b8/0x240 net/rose/rose_link.c:198
>  rose_t0timer_expiry+0x1d/0x150 net/rose/rose_link.c:83
>
> Freed by task 17183:
>  kfree+0x2b8/0x6d0 mm/slub.c:6826
>  rose_neigh_put include/net/rose.h:165 [inline]
>  rose_timer_expiry+0x537/0x630 net/rose/rose_timer.c:183
>
> Fixes: d860d1faa6b2 ("net: rose: convert 'use' field to refcount_t")
> Reported-by: syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com
> Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> ---
> V1 -> V2: Putting the neighbor stops t0timer from automatically starting
> V2 -> V3: add rose_neigh_putex for set rose neigh to NULL
>
>  include/net/rose.h   | 12 ++++++++++++
>  net/rose/rose_link.c |  5 +++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/include/net/rose.h b/include/net/rose.h
> index 2b5491bbf39a..33de310ba778 100644
> --- a/include/net/rose.h
> +++ b/include/net/rose.h
> @@ -167,6 +167,18 @@ static inline void rose_neigh_put(struct rose_neigh =
*rose_neigh)
>         }
>  }
>
> +static inline void rose_neigh_putex(struct rose_neigh **roseneigh)
> +{
> +       struct rose_neigh *rose_neigh =3D *roseneigh;
> +       if (refcount_dec_and_test(&rose_neigh->use)) {
> +               if (rose_neigh->ax25)
> +                       ax25_cb_put(rose_neigh->ax25);
> +               kfree(rose_neigh->digipeat);
> +               kfree(rose_neigh);
> +               *roseneigh =3D NULL;
> +       }
> +}
> +
>  /* af_rose.c */
>  extern ax25_address rose_callsign;
>  extern int  sysctl_rose_restart_request_timeout;
> diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> index 7746229fdc8c..334c8cc0876d 100644
> --- a/net/rose/rose_link.c
> +++ b/net/rose/rose_link.c
> @@ -43,6 +43,9 @@ void rose_start_ftimer(struct rose_neigh *neigh)
>
>  static void rose_start_t0timer(struct rose_neigh *neigh)
>  {
> +       if (!neigh)
> +               return;
> +
>         timer_delete(&neigh->t0timer);
>
>         neigh->t0timer.function =3D rose_t0timer_expiry;
> @@ -80,10 +83,12 @@ static void rose_t0timer_expiry(struct timer_list *t)
>  {
>         struct rose_neigh *neigh =3D timer_container_of(neigh, t, t0timer=
);
>

What prevents rose_timer_expiry() from releasing the
last refcnt here ?

The t0timer could be triggered even after that happens.


> +       rose_neigh_hold(neigh);
>         rose_transmit_restart_request(neigh);
>
>         neigh->dce_mode =3D 0;
>
> +       rose_neigh_putex(&neigh);
>         rose_start_t0timer(neigh);
>  }
>
> --
> 2.43.0
>

