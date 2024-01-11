Return-Path: <linux-hams+bounces-27-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C226882B20A
	for <lists+linux-hams@lfdr.de>; Thu, 11 Jan 2024 16:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 708CA285B49
	for <lists+linux-hams@lfdr.de>; Thu, 11 Jan 2024 15:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C147A4D10E;
	Thu, 11 Jan 2024 15:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8hMKgJh"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F5B3C6A4;
	Thu, 11 Jan 2024 15:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d3e6c86868so46284245ad.1;
        Thu, 11 Jan 2024 07:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704987953; x=1705592753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HOcCkRQ8RUlCHwekXL0t9bf+BGZ+oRXfDovBJVhrCE=;
        b=m8hMKgJhyVdPVAC1EOa2eftpTRXO2KQE4zNsk1OGhsfx9iZKcD9Ukz8SVqVu/PZQ13
         SP6egcclNMz3OVeIagzpZDMczvoFWSLUXvXPLOendVeg3LI8/Q9wh68nqCUwpmZrQEEB
         Ih6riixtMPdmOXiWA825kA0qGtNoDLGdpmtfuboG6DVyjHvplNwfQsI/8tcHA1JMYUu8
         Yq9DFfU/736X90CWL9P+lbSBaOedKF9brjFXEOKMEYCqbEb+yDNsvrCEz5OhdQYCzRGw
         senODlyqzIpd0nOhoN8Tb8Z3cCMSu2Os2Ytz36/ywtHGAfoZ0LTo2vkDO1Ci1YqFEF/H
         JIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704987953; x=1705592753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HOcCkRQ8RUlCHwekXL0t9bf+BGZ+oRXfDovBJVhrCE=;
        b=LmYAzeDPsmqAjGw5ou/UjURwP1kqoSsPO9CEOYi4yZoWlPeQNy37E6vaMAnWayZBsE
         3Bx6ki4k1624tTvXk2JXKl28X0PCJU0sH35l4Y60/ucz8Tnq7iHe5bw7cDph35+O0zGM
         VEKYTjdSVOlq4Dx59kwVkf+HVg79Y8pCJvp7jLwCvqfd3E+uZQOL3wC7zH74DQwdfCdz
         D3AqnYWCnZhhscHGIBQmQhhMJWsmVaPXuqp4FQ0oawYMGJHt9g2uLc0Kj8L/pSIQCeyC
         LsPYXHfEQ/dXu0MR0OozxZFl4ZWcCeqpR+ecEF0hrrOMcRiCZ4GxeWbqi0SpAxjqwJ7X
         Zzrg==
X-Gm-Message-State: AOJu0YyLT6u47MnRqzRJR5guLJHzjN2ij5VLHySM4czBhZBv+qV0Jki4
	TRFrhLvcwbA3fP1Oxlb0DBYmMiUHAZdpQBpqFgJeNVG3DSyG7g==
X-Google-Smtp-Source: AGHT+IEpMq5ueY2T2g3FufB5jge5ph/ptuma+HeDVUyaslsYbOsDidp+6aopdvdC74fd1bxz1BrIUaf2+XA0B1c/Xh8=
X-Received: by 2002:a17:902:db0c:b0:1d3:7f26:b3b0 with SMTP id
 m12-20020a170902db0c00b001d37f26b3b0mr1867562plx.104.1704987953031; Thu, 11
 Jan 2024 07:45:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109164517.3063131-1-kuba@kernel.org> <20240109164517.3063131-7-kuba@kernel.org>
 <20240110152200.GE9296@kernel.org> <95dc4923-9796-4007-b132-599555ed9eab@gmail.com>
 <ca2de714f0a5ae5eb70e7b471fad9daad1a56da0.camel@redhat.com>
In-Reply-To: <ca2de714f0a5ae5eb70e7b471fad9daad1a56da0.camel@redhat.com>
From: Michael <mikecress@gmail.com>
Date: Thu, 11 Jan 2024 10:45:59 -0500
Message-ID: <CAG9xq4Gc0y3gkhforr+6DdQaMGZkBSUoS5atnpwRnKoR0+MmSA@mail.gmail.com>
Subject: Re: [PATCH net 6/7] MAINTAINERS: mark ax25 as Orphan
To: Paolo Abeni <pabeni@redhat.com>
Cc: Eric Johnson <micromashor@gmail.com>, Simon Horman <horms@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, netdev@vger.kernel.org, 
	edumazet@google.com, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your email Paolo. Would you mind taking a moment to
address the questions in my email?

Thank you,

Michael

On Thu, Jan 11, 2024 at 6:39=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On Wed, 2024-01-10 at 21:11 -0600, Eric Johnson wrote:
> > On Wed 10 Jan 2024 09:22 -0600, Simon Horman wrote:
> > > On Tue, Jan 09, 2024 at 08:45:16AM -0800, Jakub Kicinski wrote:
> > > > We haven't heard from Ralf for two years, according to lore.
> > > > We get a constant stream of "fixes" to ax25 from people using
> > > > code analysis tools. Nobody is reviewing those, let's reflect
> > > > this reality in MAINTAINERS.
> > > >
> > > > Subsystem AX.25 NETWORK LAYER
> > > >   Changes 9 / 59 (15%)
> > > >   (No activity)
> > > >   Top reviewers:
> > > >     [2]: mkl@pengutronix.de
> > > >     [2]: edumazet@google.com
> > > >     [2]: stefan@datenfreihafen.org
> > > >   INACTIVE MAINTAINER Ralf Baechle <ralf@linux-mips.org>
> > > >
> > > > Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> > > Reviewed-by: Simon Horman <horms@kernel.org>
> > >
> > I didn't realize this wasn't actively being maintained, but I am
> > familiar with the code in the AX.25 layer. I use it pretty frequently,
> > so I would happily look after this if nobody else is interested.
>
> Unfortunately both lore and the git log show no trace of your activity.
>
> Before stepping-in as a maintainer, you should start providing reviews
> on the ML and looking after the not so infrequent syzkaller report.
>
> Thanks,
>
> Paolo
>
>

