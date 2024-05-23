Return-Path: <linux-hams+bounces-324-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB218CDB7E
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 22:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6B03285EC4
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 20:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D0D84DF9;
	Thu, 23 May 2024 20:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsA5TRZ+"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73F58405F;
	Thu, 23 May 2024 20:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716496807; cv=none; b=VMEje31Lx23AHQNoTFd2vMSsBUMenvWX5fmE8635PQ/0xmeDVdxZlYucEQL3spIBGg/gLC3jBmDK7Pj6wmkAWJDN3o0e2xaaDK9ijrygQDUoCAowGJUOxEzVqpevI5RoYUaHZ2mVt+1b6IQhNSwoWqLe+l/yoo1lJ0grLMUUBFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716496807; c=relaxed/simple;
	bh=iWz8GYQP4X42OUM/YyTjUj4xUI5gMTR0BQanvYiTS6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SLMuw38JMYg/8RAouXcixtkjrifFXq8sw7NQG0Wx4h9+I2Tj/3bRfkake8bkxknrJhA89I5D3UeW1RvYYAyoPK9mbcjCDkU5RzJ9HZV4RbkGqaxvM/ux0j8QdPlGlWNtIhoT+yQroE3++gASXogcudkgdfRKLFndvLuhPFw8VBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsA5TRZ+; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e724bc466fso64757861fa.3;
        Thu, 23 May 2024 13:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716496804; x=1717101604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AilYdkViuP/nS7rW0tJT2innlZPDpgBxtzZhxmmzSRg=;
        b=ZsA5TRZ+Xz0BQiushG9B11Jre7m8jLJZ19Xxo341sExocx8KVC7ul6Us/7frlJcXxL
         +wwOmt9VAMZf7p6/ianImzFt66rRe5dm80kA6uKIbMLOdqtnun0CDMMzGHP36u/KF77p
         2gprEdw+dmHi/X9ogcDBC9lHI8fr1nTFgY/QwtYuurtv1ZDuSZfdEaKz/O3utTIB05Ub
         NkEosF+JOssMWtg4aN/FUnbFLmnruFHI3Tmeoq4gmdh3qiHv+7mEaL75gRhokfr6gZ40
         oJUuAzwidx6GaJdoCJ/5xxgGee4HV9fxcVB/p0qqkPfOmqDsOLewxhHgft2TwamB8QZL
         LW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716496804; x=1717101604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AilYdkViuP/nS7rW0tJT2innlZPDpgBxtzZhxmmzSRg=;
        b=UoD6h4yge4uhs0Km5gUYnVy8yB7iE44IFkdpllNSd9/ZWukcqubXNDRP+gfut/aEOI
         AmAuDfNxZyWczJ7EQ1SBB7wy0Ka58tSTQG2Vnv9uB+39/TYTm8BueNizJ2YAyZqW/qzD
         ERXC+jU/ZhWQeLBU01cpnIIIUhV8dCleQfpqKlrulriXkdh+wCihPPyvTevkq/hMHCUw
         QX1KQC1Zj5QYoFNrEKJlb8Kwm6SvBHuN1DsjUMekKXLs+VpR0LdjWFxiZvv56XRr6lV9
         Xit6FmdHWb2ZP9emSBpabxqrwrynrV3/uNZVkwEcTOzzYHnhli/SFlXIFiVn30fB0lHw
         GpzA==
X-Forwarded-Encrypted: i=1; AJvYcCVU9E6daT5ScORX2Kjs1HgMIc7V8wtyNcvKD/7q8TndjzIMy+lYYju0ILqm2NTDv2OkpYM8ncdJGmfZW1p4xiJJzF0StWVFEFDbkxTt5SQh4Q+cyCuV1BkUoSQYVfDSqMTjRw==
X-Gm-Message-State: AOJu0YwIZM4NgFDlrmH8Tnh137meIP/4wC5Z4KbVoL0zWQYv61Ustiye
	6/iJ856/3adPLs59Em0UWWOt7Kvjj8do0IzehLt3606cEashIFJbUBBmjN7svdRuixKo25WJLjV
	z6EhI9hWkkuHH8GhaxWiBsUFr7o6ibc5sa+Y=
X-Google-Smtp-Source: AGHT+IF2KrPxtOm/1uZK30k1wp4HlPRJSJSMmLXtLT6iIAMxP9UH2vfRb158f3j4S8ucsE4PqYnJ5UIVijqCdHLnjyQ=
X-Received: by 2002:a2e:9e10:0:b0:2df:1746:a338 with SMTP id
 38308e7fff4ca-2e95b042c4amr2092051fa.11.1716496803553; Thu, 23 May 2024
 13:40:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522183133.729159-2-lars@oddbit.com> <8fe7e2fe-3b73-45aa-b10c-23b592c6dd05@moroto.mountain>
 <CAEoi9W45jE_K6yDYdndYOTm375+r70gHuh3rWEtB729rUxNUWA@mail.gmail.com> <61368681-64b5-43f7-9a6d-5e56b188a826@moroto.mountain>
In-Reply-To: <61368681-64b5-43f7-9a6d-5e56b188a826@moroto.mountain>
From: Dan Cross <crossd@gmail.com>
Date: Thu, 23 May 2024 16:39:27 -0400
Message-ID: <CAEoi9W4vRzeASj=5XWqL-BrkD5wbh2XFGJcUXUiQcCr+7Ai3Lw@mail.gmail.com>
Subject: Re: [PATCH v4] ax25: Fix refcount imbalance on inbound connections
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: lars@oddbit.com, Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 2:23=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
> On Thu, May 23, 2024 at 11:22:43AM -0400, Dan Cross wrote:
> > On Thu, May 23, 2024 at 11:05=E2=80=AFAM Dan Carpenter <dan.carpenter@l=
inaro.org> wrote:
> > > > [snip]
> > >
> > > I've already said that I don't think the patch is correct and offered
> > > an alternative which takes a reference in accept() but also adds a
> > > matching put()...  But I can't really test my patch so if we're going=
 to
> > > do something that we know is wrong, I'd prefer to just revert Duoming=
's
> > > patch.
> >
> > Dan, may I ask how you determined that Lars's patch is incorrect?
>
> The problem is that accept() and ax25_release() are not mirrored pairs.

I'm having a hard time understanding why. Here's my reasoning; please
correct me if I'm wrong?

Taking a step back, the semantics of `accept` are that, on successful
completion, it creates a new socket associated with the accepted
connection. It makes sense that such a new socket would take a
reference on the underlying device, since the socket is inherently
tied to that device; this is what Lars's patch does. Indeed, consider
the case that a connection was accepted, and then the bound listening
socket was immediately closed, thus dropping the reference on the
device: it seems that adding a reference onto the device in the
`accept` path is necessary.

So how does `ax25_release` get called? That ends up getting invoked
from `close`; I traced this through the kernel from `sys_close` until
the invocation of the `.release` function from the `proto_ops` vector.
The call graph looks something like this:

sys_close (fs/open.c)
 -> file_close_fd (fs/file.c)
  -> file_closed_fd_locked(same)
  <- returns struct file to file_close_fd
 <- returns struct file to sys_close
 -> filp_flush (fs/open.c)
  -> ops vec `.flush` (nop for socket)
 -> __fput_sync (fs/file_table.c):  decref(f_count) =3D> __fput
  -> __fput (fs/file_table.c)
   -> fsnotify_close(file) (irrelevant)
   -> f_op->release
    -> sock_close (net/socket.c)
     -> __sock_release (net/socket.c)
      -> proto_ops vec `.release`
       -> ax25_release (net/ax25/af_ax25.c)

There may be other ways it's invoked, but that's likely the main one.
It seems clear that this will happen for sockets that have a ref on
the device either via `bind` or via `accept`.

> We're just taking the reference and never dropping it. Which fixes the
> use after free but introduces a leak.

I'm not sure that's true. It looks to me like the ref is dropped when
the accepted socket is eventually closed. What am I missing?

> > Testing so far indicates that it works as expected. On the other hand,
> > Lars tested your patch and found that it did not address the
> > underlying issue
> > (https://marc.info/?l=3Dlinux-hams&m=3D171646940902757&w=3D2).
>
> Yeah.  I've said a couple times that my patch wasn't complete.  I keep
> hoping that Duoming will chime in here...

+1!

> > If I may suggest a path forward, given that observed results show that
> > Lars's patch works as expected, perhaps we can commit that and then
> > work to incorporate a more robust ref counting strategy a la your
> > patch?
>
> The argument for this patch is that it works in testing even though we
> think it's not totally correct.  That's not really a good argument.
> Like we can revert patches that clearly don't work so we could revert
> Duoming's patch, but when we're adding code then that should work.

I agree that absence of evidence is not evidence of absence, but I'm
not sure I follow the reasoning behind their being a leak. It's not
clear to me that Lars's patch is obviously wrong. I _do_ think this
code hasn't been shown much love in a long time, and I am totally
prepared to admit that I'm wrong, but right now, I don't see it?

        - Dan C.

