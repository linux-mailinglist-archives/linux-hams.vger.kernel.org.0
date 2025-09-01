Return-Path: <linux-hams+bounces-603-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F74B3E230
	for <lists+linux-hams@lfdr.de>; Mon,  1 Sep 2025 14:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E01AB3BED6B
	for <lists+linux-hams@lfdr.de>; Mon,  1 Sep 2025 12:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7912580D1;
	Mon,  1 Sep 2025 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ig5OkCov"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1116A8D2
	for <linux-hams@vger.kernel.org>; Mon,  1 Sep 2025 12:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756728351; cv=none; b=PhuIdGSQzHxV7c6jZUgT0b0ImbrxR/ZPIQQirjTlp0Nxh8anIpHBU2eDwwafWoqJunnfeaeFYEhlhk1gOvyYrKCnNw2XFcTSVwpCKMgbA0Hg9AYsiHk/68rjvykZtnk+VQJHRUU3M+n2wosWmgHRRflsno9Btujdslyw4/jqKbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756728351; c=relaxed/simple;
	bh=du5Q7ZA5mGTRLEec+AGiQdCXiwOl6ljxVRwOIKZ3MCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N1cSdxv51vGofeu4IJ1EeVTEKLEFUXhAfGZcIY5yinbxp5cLatDEtVnoRAVUIKbsXjeTtCXkgnPMiOpPDmDhNOS+5+S4gTjmuHyokr57Ue1kT4WNqIev2V0HlC/rk45HJ8sdMwaygwTFENwEYWL8ySUn2xvTd2JdGO/ED++AL3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ig5OkCov; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4b109c4af9eso36996661cf.3
        for <linux-hams@vger.kernel.org>; Mon, 01 Sep 2025 05:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756728349; x=1757333149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJzQNb4HKJ+xacgzapptnjiUJYsbJXbVPEMQakQ7Z7I=;
        b=ig5OkCov0V0L0JmM7WzKFpfLT/MD9G9XECknzU/uihEggrgCdVQYKEgNWh6LWCA4uh
         rDbN1aRfd+MgyEtlF73+I5Nh1edtSFLbr/C1e5ToKKREBrfx3SI8BZrKc3Afocfh5/ja
         SrlOmGtUv2CnJr1k31d/LVQmwnFcb5azbbZd948+DeGqxB1upldFDC7Z1iHh4nJOqKDf
         MeD55Cv5n5R1SUlvdrdRUTMet8/Rg4yDiGiGUt++V8BxxEWBVyK9Kl/DT0agHgwwbGm7
         rhjcfBh+4wMvUyOwTkpuofGYbfk5QihBUk7poX9VEJ3GNT5LynOb2nKlOu0gDQvuBr/o
         obXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756728349; x=1757333149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJzQNb4HKJ+xacgzapptnjiUJYsbJXbVPEMQakQ7Z7I=;
        b=Ht+hHl+05fOUFY1GHXDd1LSJlYA/ujEXLyzCePNbDW4WQGCGr7hu69l2jWtPr96bon
         R3vNLpMshCg4CVRsFV7Eq0yfGz4nqXqvUA5n4lJN4J40qLC3r6Bk3lwYy32FLudAEnX4
         ZZpXjZevax+EiloHC7gm+HNoQYgufqVPRuYoGgAJ1pFMPzd5aTHBBvjQ4k9Km7K4hw84
         2U2hod7YYaN/amWSnmws2+wJvxQbykvd3p4pq7IOlTgOsgW00pZTxn+bzkQ3/u74hNMf
         z4eRiXk/EkJW6agWmAbAVeoWopz3er9q/Zm0AqSGe9Rn8coahKtCDlaJoX5KSemaL4cK
         x7EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs4is0FnQJqTLQyqjz7kD6eFCmD+lx8f4Cet72dyZJeAYfQwxAOfeIs6iM0VXw4e18IzmLoBMmz94I@vger.kernel.org
X-Gm-Message-State: AOJu0YykwN6WgkViEeBCUDkR4RVKsg7qhTjan6riQM1mSfakxSGmftQO
	699Zq9CG9LbONrPFREI8pdK4GitYbBhT4UztD0zWMYO1mZLsrSxAq+ZdVlFIdUG9XRYr0TwtmK2
	OOVB+8cDMMhusP0hBJbkvxyyUIi6UU2EXzXbte7yL
X-Gm-Gg: ASbGnctTyFxMvva5G/t3nsZan52SJQkoafrx1xdxMeQyT7Wk30ssy4Kyf9T29ZOcQeu
	x9N84LuAt8FPPQC4WqHOoqjGGFzDvyR6pLHGuYKV71eldiyksXM8t+cvg8O6mLk0jCNIeMHfCZS
	u5JNjD9IsGEqVRcE2nA1NTiSCN2Q26lgs+XRwJEAagEHTzY8Y0ePq/Eb/xFRZT16yRR5+m95Abo
	vakOkxhN5kvPyt2ukg9kR1E
X-Google-Smtp-Source: AGHT+IH/yAeQTai5bCCh1ycwypQaBZ6eCx78LXZC6tyAdTxebZlMXtOTh++I0gNVjAtOfS1MuOm2LqpFSGxFr7d1JRk=
X-Received: by 2002:a05:622a:22a4:b0:4b3:1a2c:11bd with SMTP id
 d75a77b69052e-4b31d7f0a37mr82512991cf.10.1756728348621; Mon, 01 Sep 2025
 05:05:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr> <4e4c9952-e445-41af-8942-e2f1c24a0586@free.fr>
 <90efee88-b9dc-4f87-86f2-6ab60701c39f@free.fr> <6c525868-3e72-4baf-8df4-a1e5982ef783@free.fr>
 <d073ac34a39c02287be6d67622229a1e@vanheusden.com> <6a5cf9cf-9984-4e1b-882f-b9b427d3c096@free.fr>
 <aKxZy7XVRhYiHu7c@stanley.mountain> <0c694353-2904-40c2-bf65-181fe4841ea0@free.fr>
 <CANn89iJ6QYYXhzuF1Z3nUP=7+u_-GhKmCbBb4yr15q-it4rrUA@mail.gmail.com>
 <4542b595-2398-4219-b643-4eda70a487f3@free.fr> <aK9AuSkhr37VnRQS@strlen.de>
 <eb979954-b43c-4e3d-8830-10ac0952e606@free.fr> <1713f383-c538-4918-bc64-13b3288cd542@free.fr>
 <CANn89i+Me3hgy05EK8sSCNkH1Wj5f49rv_UvgFNuFwPf4otu7w@mail.gmail.com>
In-Reply-To: <CANn89i+Me3hgy05EK8sSCNkH1Wj5f49rv_UvgFNuFwPf4otu7w@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 1 Sep 2025 05:05:37 -0700
X-Gm-Features: Ac12FXyAj3tmEi0wMbunu92--r4kUMVM0EVKotsR6UzstZGBl8Pr0vEMN-WnPyM
Message-ID: <CANn89iLi=ObSPAg69uSPRS+pNwGw9jVSQJfT34ZAp3KtSrx2Gg@mail.gmail.com>
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
To: F6BVP <f6bvp@free.fr>
Cc: Paolo Abeni <pabeni@redhat.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>, 
	Dan Cross <crossd@gmail.com>, David Ranch <dranch@trinnet.net>, 
	Folkert van Heusden <folkert@vanheusden.com>, Florian Westphal <fw@strlen.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 5:04=E2=80=AFAM Eric Dumazet <edumazet@google.com> w=
rote:
>
> On Sat, Aug 30, 2025 at 4:37=E2=80=AFPM F6BVP <f6bvp@free.fr> wrote:
> >
> > Here is a bad commit report by git bisect and the corresponding decoded
> > stack trace of kernel panic triggered when mkiss receives AX25 packet.
> >
> > All kernels following 6.14.11, i.e. starting with 6.15.1 until net-next
> > are affected by the issue.
> >
> > I would be pleased to check any patch correcting the issue.
> >
>
> Thanks for the report.
>
> At some point we will have to remove ax25, this has been quite broken
> for a long time.
>
> Please try :
>
> diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
> index 1cac25aca637..f2d66af86359 100644
> --- a/net/ax25/ax25_in.c
> +++ b/net/ax25/ax25_in.c
> @@ -433,6 +433,10 @@ static int ax25_rcv(struct sk_buff *skb, struct
> net_device *dev,
>  int ax25_kiss_rcv(struct sk_buff *skb, struct net_device *dev,
>                   struct packet_type *ptype, struct net_device *orig_dev)
>  {
> +       skb =3D skb_share_check(skb, GFP_ATOMIC);
> +       if (!skb)
> +               return NET_RX_DROP;
> +
>         skb_orphan(skb);
>
>         if (!net_eq(dev_net(dev), &init_net)) {

We had a similar fix in 2016 for phonet:

commit 7aaed57c5c2890634cfadf725173c7c68ea4cb4f
Author: Eric Dumazet <edumazet@google.com>
Date:   Tue Jan 12 08:58:00 2016 -0800

    phonet: properly unshare skbs in phonet_rcv()

    Ivaylo Dimitrov reported a regression caused by commit 7866a621043f
    ("dev: add per net_device packet type chains").

    skb->dev becomes NULL and we crash in __netif_receive_skb_core().

    Before above commit, different kind of bugs or corruptions could happen
    without major crash.

    But the root cause is that phonet_rcv() can queue skb without checking
    if skb is shared or not.

    Many thanks to Ivaylo Dimitrov for his help, diagnosis and tests.

    Reported-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
    Tested-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
    Signed-off-by: Eric Dumazet <edumazet@google.com>
    Cc: Remi Denis-Courmont <courmisch@gmail.com>
    Signed-off-by: David S. Miller <davem@davemloft.net>

