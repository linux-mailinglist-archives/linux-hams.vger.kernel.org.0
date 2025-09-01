Return-Path: <linux-hams+bounces-605-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10261B3EBD3
	for <lists+linux-hams@lfdr.de>; Mon,  1 Sep 2025 18:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D12DA7A36E2
	for <lists+linux-hams@lfdr.de>; Mon,  1 Sep 2025 16:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14FB2DF123;
	Mon,  1 Sep 2025 16:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3tbZzDd9"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2624732F77B
	for <linux-hams@vger.kernel.org>; Mon,  1 Sep 2025 16:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756742598; cv=none; b=lfaIWCw9BFUrmzKxWyVTuxKhEuqhZE66ylTPUl0M4lUD9IfvzfHBduvd41ZsMZJdJDXrD6AiXERyaqSMD3dxUn+Fzq/0SVFz4LAP5D012VB/8KeKWnE9nY7BqrJpoqRqE0/w7HmQIvLgVd/a+32mTBQqu6I+k9SbOMuHveRpwW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756742598; c=relaxed/simple;
	bh=IOoORleQs7f91C96Vt2AcppBT6fXCGOIlq5noFDQZ9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C0SWkw9/YL9LzBeogahiETLk8L7EVK7QNEK4zwYK06xPUt/loP7g12C/ZpWGJtxo2lT3YO52KWmPEQQr9rWc0n/NSQgNwxJQU+fWifIzAT+jIqHx3qBGH8iSTVhm2ydHUsJBEX0bXmfXPkHu6HTJxEDGJRuHtgHPHE9hhsmLzb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3tbZzDd9; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b109c59dc9so55330401cf.3
        for <linux-hams@vger.kernel.org>; Mon, 01 Sep 2025 09:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756742596; x=1757347396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrHjywpVWOxLiuGlgvlpfoOPzmdh7KmLBudw0S2dHIk=;
        b=3tbZzDd99ZadWbxUje0SQ/ctsNaBNDa2y1tET+3/ym3mroEXMK1lnEGTkhtuZ4O3Ng
         m9+77N6M6nOd+tcRrdrdoXCm/YMNqicYVIAMXnfKEhjHJz1O5mw6D2YNvyBpddT6SL7F
         o4ZQJoTyA+yXIwKBpF6qmSYtbDIOPqPfBRFtU0O1KN1Ts5p8liD1F6HfHqkXyAOLL8GH
         KOZpVGiIpDxD00Pln0HTaFpuDYSTOejBy4o4MqmEzNc7ujNtdWARPQaJWIQ/0x+XsWOV
         d8mEz/bN6GJt8O0PyU7GFS0eN9xx7q4gIftZ26Olh/MqzS+HoOOFRiHwHuxtMnG4n0YB
         keVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756742596; x=1757347396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrHjywpVWOxLiuGlgvlpfoOPzmdh7KmLBudw0S2dHIk=;
        b=EDgRp8Kqrd3BqmPhfkb9VEooVOLJmG+NdQyrN4jRFX+z9aauhaHnpmEmAD5jK7I4Ic
         sqOZkfidwFa6YzpBUDtK59qBywFnnV0OFm0EKrwIe9KWXJbavfINpuZJz0viRgrIi2m6
         nz9AudIv1pMJQFT5Niz9lytlaUXx/5T9zQMElO/BTuTEqlD5d9CPMud6tUdlr/dB9aIN
         A7zUX8oX8liT3tGmMKG1BOtw8TsgyJwk6kcxUWxbt1TKQtr7gdflJeUKuXnG4VceKZN1
         7L6bWNXt11yNBuZM7CqHbzNJnYRHMi0BcpZEWcHBMKFwumESSSW3xAWPnaQruABh6Qvk
         3tDA==
X-Forwarded-Encrypted: i=1; AJvYcCX+FSKruPZpaGJzaZu9uu0SCaGYMYf8BUoDWQSvKTOnuHXyO0WFyMQ8+BJeTdP30X3oWkYCRRXmW8g/@vger.kernel.org
X-Gm-Message-State: AOJu0YwQZ3M/56CGth1Q2i7oYNHc27jaRnHwlzfXk6qWezW83ODDp0ev
	+7gqWeDpnSwsdOHEWh+4WeNjzV6YU86W1ImXyWFWQfMAr7c3LoMt2ypUU5dN4ZRf9sp93gDx6MZ
	HgnmoJ1u4AEKRUG/iqDdfCDdoRkTl5b/XoLoHDbtW
X-Gm-Gg: ASbGnctyluDAh2g97Y/CkUJHAoJ/jMeCQYpAuJrZMnT0k3XxztzR63ue7AAxMbM+Hqu
	OLINBpOakX4NECcB6xWUcVXmPLZ0ObcQ7S3WShQr2vDZpFY3XC27BrdN27M1yr1ZzOeHdAncVuO
	hS0VtsdHuPG9KrC7pZjFsdW9E4247JYLXCXlaKKlL0qKdhm6E696w6KkeFUB33MSpWpf8uzd4kP
	YMA/FDnc2Cl4Q==
X-Google-Smtp-Source: AGHT+IHwAZKT0aZbzbfWuLsZXJKBD/GhUchw6Q63tg13Zgd5wPmtPtvc6zZo/NfSBzSGVGoyuLWlYycCksxAC2i4gFo=
X-Received: by 2002:a05:622a:1c18:b0:4b1:d93:b4c with SMTP id
 d75a77b69052e-4b31dd25fc9mr90238191cf.64.1756742595395; Mon, 01 Sep 2025
 09:03:15 -0700 (PDT)
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
 <CANn89iLi=ObSPAg69uSPRS+pNwGw9jVSQJfT34ZAp3KtSrx2Gg@mail.gmail.com>
 <cd0461e0-8136-4f90-df7b-64f1e43e78d4@trinnet.net> <80dad7a3-3ca1-4f63-9009-ef5ac9186612@free.fr>
In-Reply-To: <80dad7a3-3ca1-4f63-9009-ef5ac9186612@free.fr>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 1 Sep 2025 09:03:03 -0700
X-Gm-Features: Ac12FXwH99kJ-Dtf-uAdYSkmL2ir2VipyymTecFfFMeH-sUMpg5SS9DLNW2i3Os
Message-ID: <CANn89iJGdn2J-UwK9ux+m9r8mRhAND_t2kU6mLCs=RszBhCyRA@mail.gmail.com>
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
To: F6BVP <f6bvp@free.fr>
Cc: David Ranch <linux-hams@trinnet.net>, Paolo Abeni <pabeni@redhat.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-hams@vger.kernel.org, 
	netdev <netdev@vger.kernel.org>, Dan Cross <crossd@gmail.com>, 
	Folkert van Heusden <folkert@vanheusden.com>, Florian Westphal <fw@strlen.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 8:59=E2=80=AFAM F6BVP <f6bvp@free.fr> wrote:
>
> Radioamateur have contributed to Linux since the begining.
>
> If a protocole should be removed from Linux kernel as soon as a commit
> breaks it, Linux itself would be t be abandonned.
>
> AX25 is not responsible of a kernel Oops due to a commit in dev.c
>
> Like David KI6ZHD mentionned, many hams are still experimenting using
> packet radio.
>
> Not mentioning that a large number of pico satellites from universities
> all around the world are using AX25 for TM/TC !
>

Keep calm, I am just saying that the bisection pointed to a fine commit,
but it took a _lot_ of time to root-cause the issue.

And the bug is in ax25, not in Paolo patch.

Please test the fix, and thank me for actually working on a fix, while
I have more urgent work on my plate.

> Bernard Pidoux
> F6BVP /AI7BG
> Founder president AMSAT-France
> President Dimension Parabole
> http://radiotelescope-lavillette.fr
>
>
> Le 01/09/2025 =C3=A0 16:43, David Ranch a =C3=A9crit :
> >
> > Hello Eric, Everyone,
> >
> >>> At some point we will have to remove ax25, this has been quite broken
> >>> for a long time.
> >
> > I can appreciate that the code implementing AX.25 in the kernel is very
> > old but say it needs to be removed will impact a lot of people.  There
> > is a very active community around AX.25 packet radio today and Linux's
> > native implementation still offers features and functions that aren't
> > implemented anywhere else.  There are also some large / popular project=
s
> > that are dependent on it for their connectivity via libax25, etc.  I
> > continue to hope someone will be willing to step forward and write a
> > modernized version of this stack (and netrom and rose too) so we can
> > continue to run things natively on Linux.
> >
> > --David
> > KI6ZHD
>

