Return-Path: <linux-hams+bounces-566-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 719BBB2B3FE
	for <lists+linux-hams@lfdr.de>; Tue, 19 Aug 2025 00:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E17717CDED
	for <lists+linux-hams@lfdr.de>; Mon, 18 Aug 2025 22:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B510327A931;
	Mon, 18 Aug 2025 22:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMfTw4aE"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0368F13C3F6;
	Mon, 18 Aug 2025 22:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755555153; cv=none; b=McibYb1klnGak0v5aqRwZpsvYeiX4ej+JU26AhRsSehNOL3LnnsM66UCMaJtLmXkRl5R+pYvQM7jrTFAbnLR5LS1Gx9XmnR1pE/8W1xTVEhdc89pX4Wq9xcsba4o0Im0FFX58mylopD75TXVdf/ccEoQm5jhEycWBdyEceRlTyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755555153; c=relaxed/simple;
	bh=z0WaS3shGqW0QPUywlCBkaS508vo1YK7sC8UbCZ/2Sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hIpQySLNo4vroBJe6PHsD9W+Mvo2DBCXSNOQp91qY+qoj1Jr3jcM1KP8Bo29pP2XoC80ZvAxY9PbJXWLQNS1FrQc5ekrdfa2QYoxwIRre9TF9HL6bLQTTh13fDdSMxf9L76NYPXe53lH9RIumDsl2kf4Ox4iEcX8SdCDeIAZUUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMfTw4aE; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d605c6501so40017337b3.3;
        Mon, 18 Aug 2025 15:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755555151; x=1756159951; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqNz3P5UaqdajyOjtnD6TKHOU+fmwNNN9rM4/6l4iXo=;
        b=LMfTw4aEzyYBeKRwcRskAr7MgEtFAYBs0tcl9IRiwNG6xmy8z/sYxGma4I4wbvhbsi
         E/Uu2HXfdn1R07th1rVPmMzDP6kH5t9puxyHgJdRHhn0DaLumRjteLD3Pt3QoNZy95eQ
         HZunCd+OZ5LUjZRixoSAvkG2ks2YZQJyfhK8nlFnTBeOSXqaJ9sDBQ4uvmkqM7z3aW5n
         RZ1Nc2jF8NiDHkwjjK1W0UpAT8NN5Cn713w43yrGsfMD3B6vwtGXpNcMNZF73+RcqBdY
         w8ISlI90FQhZkY4Stg3Lhqsa5NY1xTxiCbGW5oaLpRWQQGd2Hw4ToyPnVGWfvVIkkf/+
         DN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755555151; x=1756159951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqNz3P5UaqdajyOjtnD6TKHOU+fmwNNN9rM4/6l4iXo=;
        b=QuoYiHp4zaMTFQO4vPDQh1PsMlZWYvMwqFNc66p/ussDUDo081ic86NAXzElV9fXi7
         9pe2e8X5OpZq8aeQ0/H9m8xPSjdIanbYUd9rcb8aBJvSsPaeHOiTpkybKObf0J5M27Po
         mioSNmXKgJ2snBoUCXI/lqdsutWy/ShO4WPMqeCeBRc59NVJr0aWjHB58e25j5+o1LS7
         8KRE0rAAsNlHrZULM94MzueFgqoRR+o4+3UlJAsfR+HsAvlL6Pp/ICnUedGbxJYkryx+
         2z5nOrWMpi+19EyfT3aiX2ZDH8U7h1Vmt/9pzDXgULlRVmN1PInBZr+7FLQp6SH3kdpT
         A56Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgbqawQwTbf9WmFPl4QToqW0y1/BkEYLSpbpwEkqJ+f1wLeGSHej/w4QCWUmRTCFMv05jmiacW@vger.kernel.org, AJvYcCWwb9Kxi3Gsa3Bn/Hx+p4Gs5vPxaICcfQ24NA3lEi8YVaO6TWNfHsfRtV9JAHlJ9W0DVw0otTGCZyHB@vger.kernel.org
X-Gm-Message-State: AOJu0YxM+lKaEsYuHoMpyw38P7oLi6VJq5p89q/HirOEqrBXpyMscdP4
	aCaYSoeOual0+0tMyPj9ouzugPY7JlDABAQnvYBmF9B1+zoowvUIG8T/o73o4LL36zs5ZdDQJIz
	eKoKGPRpR/rKMytMiqjGKgKFe3oPS3ps=
X-Gm-Gg: ASbGncshnbvgwUKIUuQP7hGmyH1gnkUb9wXW6lWhRY5Qc//1KmS5g/ZCZYcq3fzdcv5
	+YEua6hJLzalt9ZMfeUhUsiPmMiXmuVw7ajMOSNUCI/235UnPaVmBay3c4rAaWzE1VMBNB3I406
	IZhuGLY0mzi12V8RcdqngphvVxzTxJ0nuLicZpkrX77mnuptVNFme4UVSAfMqLpbTcqZRD28eiU
	Q0yohHFQkF8zur8cHEMcaITfpjyL0avNYzI/wP5
X-Google-Smtp-Source: AGHT+IG1Xf8IES8SjgayLID8xC/CuGhwHDMGirJW5U5y2dngifDjnA/vAwdOBP+gB+eCFrarealiYHb6SnOY5OuGLHU=
X-Received: by 2002:a05:690c:7485:b0:71e:7ee9:839a with SMTP id
 00721157ae682-71f9d4dd78fmr5382767b3.2.1755555150984; Mon, 18 Aug 2025
 15:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <11c5701d-4bf9-4661-ad8a-06690bbe1c1c@free.fr> <fff0b3eb-ea42-4475-970d-30622dc25dca@free.fr>
 <e92e23a7-1503-454f-a7a2-cedab6e55fe2@free.fr> <acd04154-25a5-4721-a62b-36827a6e4e47@free.fr>
 <CAEoi9W6kb0jZXY_Tu27CU7jkyx5O1ne5FOgvYqCk_GFBvnseiw@mail.gmail.com> <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr>
In-Reply-To: <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr>
From: Dan Cross <crossd@gmail.com>
Date: Mon, 18 Aug 2025 18:11:55 -0400
X-Gm-Features: Ac12FXzClq1nspIzLv0EknXdXf9yT1FEP3tio8_UBvXs4Vf7Ans-5TuQmuNCc0c
Message-ID: <CAEoi9W5gAMyLtf9TYKuZ7EUAQspmcHADr-bvRNDVXpL+or2dSQ@mail.gmail.com>
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
To: F6BVP <f6bvp@free.fr>
Cc: Bernard Pidoux <bernard.pidoux@free.fr>, David Ranch <dranch@trinnet.net>, 
	linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 2:29=E2=80=AFPM F6BVP <f6bvp@free.fr> wrote:
> I agree that it must be the same bug and mkiss module is involved in
> both cases although the environment is quite different.
> I am using ROSE/FPAC nodes on different machines for AX25 messages
> routing with LinFBB BBS.
> Nowadays I do not have radio anymore and all are interconnected via
> Internet using IP over AX25 encapsulation with ax25ipd (UDP ports).
>
> I am running two RaspBerry Pi 3B+ with RaspiOS 64Bit and kernel 6.12.14.
> AX25 configuration is performed via kissattach to create ax0 device.
> ROSE / FPAC suite of applications manage ROSE, NetRom and AX25 protocols
> for communications. FBB BBS forwards via rose0 port and TCP port 23
> (telnet).
>
> I do not observe any issue on those RasPiOS systems.
>
> Another mini PC with Ubuntu 24-04 LTS and kernel 6-14.0-27-generic is
> configured identiquely with FPAC/ROSE node and have absolutely no issues
> with mkiss, ROSE or NetRom.
>
> A few years ago I had been quite active on debugging ROSE module. As I
> wanted to restart AX25 debugging I installed Linux-6.15.10 stable
> kernel. This was the beginning of my kernel panic hunting...
>
> My strategy is to find the most recent kernel that do not have any issue
> with mkiss and progressively add AX25 patches in order to find the
> guilty instruction. I will use a buch of printk in order to localize the
> wrong code. We will see if it works.

Bernard,

    Very good. A caveat is that the issue seems to be the bug
manifests itself in the `skbuff` infrastructure, independent of the
specific AX.25/NETROM/ROSE code: it may be that some other change
elsewhere in the kernel failed made a change that was incompatible
with AX.25 that gave rise to this bug.

    I've found the oops to be very reproducible. Given that you seem
to have a known working kernel version, you may get more mileage out
of using `git bisect` to narrow things down to a specific failing
commit, instead of trying to forward-apply AX.25-specific commits.

        - Dan C.

> Le 18/08/2025 =C3=A0 18:30, Dan Cross a =C3=A9crit :
> > On Mon, Aug 18, 2025 at 6:02=E2=80=AFAM Bernard Pidoux <bernard.pidoux@=
free.fr> wrote:
> >> Hi,
> >>
> >> I captured a screen picture of kernel panic in linux-6.16.0 that
> >> displays [mkiss]. See included picture.
> >
> > Hi Bernard,
> >
> >      This is the same issue that I and a few other folks have run into.
> > Please see the analysis in
> > https://lore.kernel.org/linux-hams/CAEoi9W4FGoEv+2FUKs7zc=3DXoLuwhhLY8f=
8t_xQ6MgTJyzQPxXA@mail.gmail.com/#R
> >
> >      There, I traced the issue far enough to see that it comes from
> > `sbk->dev` being NULL on these connections. I haven't had time to look
> > further into why that is, or what changed that made that the case. I
> > now think that this occurs on the _first_ of the two loops I
> > mentioned, not the second, however.
> >
> >          - Dan C.
> >
> > (Aside: I'm pretty sure that `linux-hams@vger.kernel.org` is not a
> > Debian-specific list.)
>

