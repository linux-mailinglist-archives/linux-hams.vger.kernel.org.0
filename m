Return-Path: <linux-hams+bounces-26-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F02A82ADB0
	for <lists+linux-hams@lfdr.de>; Thu, 11 Jan 2024 12:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6E6F1C217C8
	for <lists+linux-hams@lfdr.de>; Thu, 11 Jan 2024 11:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C55615493;
	Thu, 11 Jan 2024 11:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g8rq6gQH"
X-Original-To: linux-hams@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D001A15482
	for <linux-hams@vger.kernel.org>; Thu, 11 Jan 2024 11:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704973181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kMKCIpE0wiCp7+YtFSxYYd2cnjckEjaYhS/9FJcVna4=;
	b=g8rq6gQH5lmg/PRTNJpZzYpc3awNotHeXCOVum1h3mS0ck1U9Jom+eTnQsaEmyEGFVDi4n
	Db5CSmcMlw6b+TpcawI29BWDX4f24mI3royMxr0sy/74C7Aoq5FrVhIgHd9JB0d99R8VjG
	2IH+a/nQhSv9EYj5OwHbvRBtPdmGFBE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-cbVBgtoWN965KMQI2rKVmw-1; Thu, 11 Jan 2024 06:39:40 -0500
X-MC-Unique: cbVBgtoWN965KMQI2rKVmw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40e476c518eso6599295e9.0
        for <linux-hams@vger.kernel.org>; Thu, 11 Jan 2024 03:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704973179; x=1705577979;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMKCIpE0wiCp7+YtFSxYYd2cnjckEjaYhS/9FJcVna4=;
        b=ej4UosyWN1+hfQ1RKbzn8oIbBouTjGxrO5m+BLacotX+JppwBw243H5i6zU+E8pi8S
         /SV9XzHqIYeV3eNpluW7LvIOHwdamr0oJ8mByFyp9goyyIPFi0UQltkH0gsBhOdOpN0G
         QhN1Fj27ZitCySLKGk4/mKW5c3raB5xHy4++gumnme6lypQ/WtI68pnWxCEiV+CH4Nhe
         Z9H6Ffo6YiTaco0SJemMubQWsNBqpJqjMnaRESR1E0yPbwA48eOhScwVY8HolKxli8XK
         pUlJ+iFmsPesDRNAk0pVwiytS5RtQe1henjJXaoDo/uOHYKChk6lPB0rDdN0csuYwhTn
         mVAg==
X-Gm-Message-State: AOJu0YzEupF1p+2WtdkJ6J31T3Tzp/VwWCR8e5ficzz58TXQbGtc8L6m
	sRvRElio394gdvd75HC9TZ5oW71jVhOwGgEv2XsMBVOfTaO3NdX23MvRvw8G9vnlx/+ch0vsrVA
	QKL9Yk+ndAGZvBQ07kGoUAUa59B0l5A==
X-Received: by 2002:a5d:530b:0:b0:336:8103:6ce9 with SMTP id e11-20020a5d530b000000b0033681036ce9mr766159wrv.7.1704973179322;
        Thu, 11 Jan 2024 03:39:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5kz32VLP3PNrE5R/FOU6wBZGTNLs9edmqQTpdY/fMBI7v/AmV9aNhXzXVGWCtGYTSGySNgA==
X-Received: by 2002:a5d:530b:0:b0:336:8103:6ce9 with SMTP id e11-20020a5d530b000000b0033681036ce9mr766146wrv.7.1704973178979;
        Thu, 11 Jan 2024 03:39:38 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-244-191.dyn.eolo.it. [146.241.244.191])
        by smtp.gmail.com with ESMTPSA id a14-20020a056000100e00b003371e7113d4sm1014793wrx.24.2024.01.11.03.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 03:39:38 -0800 (PST)
Message-ID: <ca2de714f0a5ae5eb70e7b471fad9daad1a56da0.camel@redhat.com>
Subject: Re: [PATCH net 6/7] MAINTAINERS: mark ax25 as Orphan
From: Paolo Abeni <pabeni@redhat.com>
To: Eric Johnson <micromashor@gmail.com>, Simon Horman <horms@kernel.org>, 
	Jakub Kicinski
	 <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, Ralf
	Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org
Date: Thu, 11 Jan 2024 12:39:37 +0100
In-Reply-To: <95dc4923-9796-4007-b132-599555ed9eab@gmail.com>
References: <20240109164517.3063131-1-kuba@kernel.org>
	 <20240109164517.3063131-7-kuba@kernel.org>
	 <20240110152200.GE9296@kernel.org>
	 <95dc4923-9796-4007-b132-599555ed9eab@gmail.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-01-10 at 21:11 -0600, Eric Johnson wrote:
> On Wed 10 Jan 2024 09:22 -0600, Simon Horman wrote:
> > On Tue, Jan 09, 2024 at 08:45:16AM -0800, Jakub Kicinski wrote:
> > > We haven't heard from Ralf for two years, according to lore.
> > > We get a constant stream of "fixes" to ax25 from people using
> > > code analysis tools. Nobody is reviewing those, let's reflect
> > > this reality in MAINTAINERS.
> > >=20
> > > Subsystem AX.25 NETWORK LAYER
> > >   Changes 9 / 59 (15%)
> > >   (No activity)
> > >   Top reviewers:
> > >     [2]: mkl@pengutronix.de
> > >     [2]: edumazet@google.com
> > >     [2]: stefan@datenfreihafen.org
> > >   INACTIVE MAINTAINER Ralf Baechle <ralf@linux-mips.org>
> > >=20
> > > Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> > Reviewed-by: Simon Horman <horms@kernel.org>
> >=20
> I didn't realize this wasn't actively being maintained, but I am
> familiar with the code in the AX.25 layer. I use it pretty frequently,
> so I would happily look after this if nobody else is interested.

Unfortunately both lore and the git log show no trace of your activity.

Before stepping-in as a maintainer, you should start providing reviews
on the ML and looking after the not so infrequent syzkaller report.

Thanks,

Paolo


