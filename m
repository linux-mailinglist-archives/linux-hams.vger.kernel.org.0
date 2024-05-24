Return-Path: <linux-hams+bounces-326-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA138CE83C
	for <lists+linux-hams@lfdr.de>; Fri, 24 May 2024 17:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8D051F21047
	for <lists+linux-hams@lfdr.de>; Fri, 24 May 2024 15:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F8212C52E;
	Fri, 24 May 2024 15:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h58+iNJo"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4336E5ED;
	Fri, 24 May 2024 15:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716565665; cv=none; b=KzztouW/mFAhvQd4i8i1ovJf0BeYvUKqIHYwRPHKFTuKqtZRcyzOe1Zw6Nw3B3/p+xbEZ3Gr3phT9eucvoWMdiQoONrt44qgxPnh1TgDzZA4dpvFL3oODZmnCt6LUfuttzkeuBIcTsDdLDVSb/eqlLzZ7haa42Knh7N1xnX0yeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716565665; c=relaxed/simple;
	bh=/d5BZvoth+E9Sf9u9OTg2J1bMKJReIW4x7C7nYHOdtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KBSXjqL3bf5qoagwHaYMpPR1tHo7J4k6x4Ao2V/aj8BJIJsQTloEDZbpukyjm44Cv0TqaP8eEONU81FxDQgd43E3FotlkPsjhwIyufHIhGvwLdrm3i6Szb4ClNFsuc1aIZVHFgWFnHW9QM5Beaaj/QDKrIZsn1mOM90i9BOOrcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h58+iNJo; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e3efa18e6aso31919181fa.0;
        Fri, 24 May 2024 08:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716565661; x=1717170461; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46cZeVkPk4pmjoabJBOQxaulpYdo6gk8h21Q/Q2EujQ=;
        b=h58+iNJo725FMXZMYGr8IptxrIcoILUKb1tdSTLl+4z3YsMswTfyQMJhyhyaecFrV4
         YL2n2Ri6FvuimxfazhnmpuoMZbYRXDV7rsUcocCXbGtAWWVzmD6anNPkVUKzMllZQw0d
         WDR30wQ7U9dWEPuMZlqmmSBEq/68b3o+H2sIR9YeKcyTsdCAtzGLpUEGmSwT9O2bj06F
         tl/DBGT57sx3LL+2ib0m9Pf4HN9YqhISSxARulbYaRf1DU4oADWJzahL7avAVmkOkdM9
         DlCU4PdcVCd8udHT0uCE+z+htpAOq51ZUEDV2qQe+BKQbbcy79rWA4DXRmDzhTHWgB3f
         ZE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716565661; x=1717170461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46cZeVkPk4pmjoabJBOQxaulpYdo6gk8h21Q/Q2EujQ=;
        b=EHkBXWmKew0cYweLsAWbXUH4KwpJZmXw2DuQzJVX59H8sIhvAeLufbkipHWDWvb2EX
         ooWZe0fT6oOI7uXrW/qaUixufr5MXWUN9M9e0+Kj1gPpev68sccb+3DD/nOOfSS3RSZJ
         5SCiq8XMfw/QwNS7pw+Yjx/465KiTrJnkbUgAt8XT6P9v/ofzpcrecz4FhOFApXwLx/j
         +8FvyfDwKKFdOScdt/EhyKLyMvxEC30doKatcBFCUNTDseN0CyfCec+/HknvodoA6mkR
         7pnQTMAEslA8BR9mSI0zpc27H6Q27uRwm8+v3veVw+N0ujewudjPwEvemA+ugRXkKNFg
         bHzg==
X-Forwarded-Encrypted: i=1; AJvYcCVCs+tIcpn5y+TO20py1SesJcMV+lK87yGtTwtuFebiw3MyBFBBnf7dWhcEdQhOEn7Q4qtvwuINTg5QgxGQ4JUZp8VATWBD1p1l/aZ76MX13t28837atLzKNBeYtSc4wRWB3A==
X-Gm-Message-State: AOJu0YxuyWz9PAM46JN45wBePwVEpyduKpTZkluYIEit9biNsWly7n04
	AP+SHtmIdJS3Ctl8BHAuFRDXfNh0Ao/SjADXwZmKHa5w+TtQM8cRmN0A1q3cGR6x8Yj1s+qJZ6E
	M1Zfa3gfg4NHKQE1lUnGJe4mWqL8=
X-Google-Smtp-Source: AGHT+IHAZuEvXAcHGSKOSWDOCCXl3Chtb6eOnC2C9xKEysjUb2bg40QCQN2aeKlY51gCFUj5OQ8xD2YnyEMp2F3FeW0=
X-Received: by 2002:a05:651c:146:b0:2e2:1b1c:7462 with SMTP id
 38308e7fff4ca-2e951b6ffb3mr16777561fa.10.1716565661289; Fri, 24 May 2024
 08:47:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522183133.729159-2-lars@oddbit.com> <8fe7e2fe-3b73-45aa-b10c-23b592c6dd05@moroto.mountain>
 <CAEoi9W45jE_K6yDYdndYOTm375+r70gHuh3rWEtB729rUxNUWA@mail.gmail.com>
 <61368681-64b5-43f7-9a6d-5e56b188a826@moroto.mountain> <CAEoi9W4vRzeASj=5XWqL-BrkD5wbh2XFGJcUXUiQcCr+7Ai3Lw@mail.gmail.com>
 <wq52rxvjp64uk65rhoh245d5immjll7lat6f6lmjbrc2cru6ej@wnronkmoqbyr>
In-Reply-To: <wq52rxvjp64uk65rhoh245d5immjll7lat6f6lmjbrc2cru6ej@wnronkmoqbyr>
From: Dan Cross <crossd@gmail.com>
Date: Fri, 24 May 2024 11:47:04 -0400
Message-ID: <CAEoi9W73cDucB=4w+63X5N6-0z6MxC6argGPf4FYqH8G4x4qxg@mail.gmail.com>
Subject: Re: [PATCH v4] ax25: Fix refcount imbalance on inbound connections
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Duoming Zhou <duoming@zju.edu.cn>, 
	linux-hams@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 11:25=E2=80=AFAM Lars Kellogg-Stedman <lars@oddbit.=
com> wrote:
> On Thu, May 23, 2024 at 04:39:27PM GMT, Dan Cross wrote:
> > On Thu, May 23, 2024 at 2:23=E2=80=AFPM Dan Carpenter <dan.carpenter@li=
naro.org> wrote:
> > > The problem is that accept() and ax25_release() are not mirrored pair=
s.
>
> Right, but my in making this patch I wasn't thinking so much about
> accept/ax25_release, which as you say are not necessarily a mirrored
> pair...
>
> > It seems clear that this will happen for sockets that have a ref on
> > the device either via `bind` or via `accept`.
>
> ...but rather bind/accept, which *are*. The patch I've submitted gives
> us equivalent behavior on the code paths for inbound and outbound
> connections.
>
> Without this change, the ax.25 subsystem is completely broken. Maybe we
> can come up with a more correct fix down the road, or maybe we'll
> refactor all the things, but I would prefer to return the subsystem to a
> usable state while we figure that out.

I think the main thrust of my point yesterday was that your
accept/release _are_ paired, via `close`. It seems logical to me that
every active socket associated with a device should hold a ref against
that device, and your change does that.

Since I wrote yesterday, I've enabled a bunch of additional debugging
code in my kernel (ref tracking, memory leak detection, etc). I can
detect no evidence of leaks, despite trying several times to induce
them. Perhaps I'm not looking correctly? Dan Carpenter seems fairly
convinced that there are, but if that were the case, we ought to be
able to detect some evidence of it, no?

Absent evidence to the contrary, I believe that the patch you
submitted for integration is correct. There may be other bugs lurking
in that general area, but if so, they're only tangentially related, if
at all.

        - Dan C.

