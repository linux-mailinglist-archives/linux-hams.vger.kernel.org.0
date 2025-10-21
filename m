Return-Path: <linux-hams+bounces-667-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 579DEBF4269
	for <lists+linux-hams@lfdr.de>; Tue, 21 Oct 2025 02:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC51718A51A1
	for <lists+linux-hams@lfdr.de>; Tue, 21 Oct 2025 00:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DD01F03D7;
	Tue, 21 Oct 2025 00:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R21UTIxD"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E471E231E
	for <linux-hams@vger.kernel.org>; Tue, 21 Oct 2025 00:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761006728; cv=none; b=C5S6J0Bs13/lyGvjR2Jdr1qYM0wSPfzzpDeGiFln2oB2qzFBNhV/I0gn/mRH1n/vRDUIuQ+QEs8FS+PwXyNLwg5Jbj22OXsNkgL3DtAsX2YfwDmX3lzpf38bpkvk0xungcOSEMXPZF20bJwjZwf7j5OrlCPdIgbSDUqgjlYrPoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761006728; c=relaxed/simple;
	bh=+Stx3Yos3Zj4FpodRRmLagmV52djBLh7XEfBTjgyG68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2uKCOXlpuF3I9QpLz2n3Zul/9hxYFe/2y6L2LXyA4RzeOPLBT1a+QWcoRU7x4+Ggc/fT8GwYSmhlIbngBj1nqo/hjU6yaWKYjCg93I7vTmKOC2tXwl9Xgkler82Rxw4mpsrNbXTB76KcWca5cDG+RPRyQbAqIBqwHZhSdasgJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R21UTIxD; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7a1603a098eso3058009b3a.1
        for <linux-hams@vger.kernel.org>; Mon, 20 Oct 2025 17:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761006726; x=1761611526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v/cpiZvdnPNi45E0SRBN32Ra3TMzhvL+cs3dmR0W4Tg=;
        b=R21UTIxDJYopFIaaGEXEOLgBYWWmCI1PcUR8eF/oplFCKbzIWEDN8E2ApPU2yrTMfK
         5MbYDQ34eCYgNtK3TIfUc9G79wP3QGJE2hkncymQJUzvGUji628rQTwE5j0akM3Xpo/f
         YlaJKYUSjjcv9NyEzOqLUyGo7YV9/BkdqUHes8aI7mUh18EjpKQag5edT66dmjFxkb0C
         9cutgdyoS52OvhbJwMeR+Y3GzmyIUJy4pGbL48J/RUy15MGCmdrpDu3OAcMau07LBINn
         v/tCBo3QWGqOeSsT2iNaQCjv7NP12BHRqIeDFxCfmGeRgVUT3iXwyih7fwCE7KWhDuEE
         l8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761006726; x=1761611526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/cpiZvdnPNi45E0SRBN32Ra3TMzhvL+cs3dmR0W4Tg=;
        b=f17bRp1yIARaC195SFo/rLR2dP2sMIxVvxgcRMzn+oxMCwvKjBJ209jDDFqVR3CyTT
         sYmaJFusJtU+TCFi8QpjCu9xpPfI8y94ggWP/y8E756a6h4OWgDMZMHin1T+KOPsc+Io
         kz+A4pCRPcF3Zj7dNX7lZB2y9+tmlqreM46Oh3OB0tNKxMDsY5DVNioRii0YcETvdXZC
         tG1FJCoKKICW7sz5x4Dj0jhvcLANVGe1OKdNGanM4wCKaKoLT05R920Tds7EyPSnYk1m
         Th446vK+jbbFBjRY+LRtB5TE34BP4HxbRYGEKnoVwZQPtJ5Xja+rwC1wJVeA5JEXyO41
         VlGg==
X-Gm-Message-State: AOJu0Yw/IOK2WcgtferR6EyhkX7khQ2Xa8oDj3qNyqpYt0j9oORaHxa5
	bWshOLJlyahKi7AnRiMqOtjS4yz/MsVUF+QJDTtG77xxV1gJCvxmLRH+
X-Gm-Gg: ASbGnct4oz3cn3wA/e78GtS4gfh4//+q9mZ/VewJOKYAqNQpaaI33hko78upFbOxCfZ
	Majn8HeK7+bW2iTqDfVXsrkSBbqGmt+IgYOoVUo/w+htCmDTtJQ7go6hNSd3R1NrmTvNlmvJ9ha
	klHSH1cNjQlYWpmppln/Y+P9z18cNx8yF3naY2kHDImu0+pgqzxFgOV783yiaCfR6+P9KZWu2qH
	DjS/QwBmAbZp7vUhF5YzqsWD11lbxuZ5HgXGQsq5DTU+3MHu5oclxvsIwjVgkD32vHw3GsBWxE6
	D0COHyvVruiRXgEkhOraWZLiXWQQzSFs8CceTJsaMynNOBn0hchU9aYdc2KQnZzUcx8tGVWizqq
	gg1RURo0C7a6Vd2PclsyhShfi5rDw1939e8z+Anggqlbxa8TQWSp5uZDR/rSIF++71pbRjFdoCm
	VhnMZd04l6Fo+r0w==
X-Google-Smtp-Source: AGHT+IEsUPJvzG8we/lPr0Ah4Byy7131lhTqUy6IYRR/KgOr9A5mhJJoZH9DBN/+obua52bJEsmONw==
X-Received: by 2002:a17:902:e944:b0:290:b14c:4f36 with SMTP id d9443c01a7336-290cba4edaemr170898085ad.31.1761006725838;
        Mon, 20 Oct 2025 17:32:05 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d5971sm91702065ad.56.2025.10.20.17.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 17:32:04 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 2E36D412B0A6; Tue, 21 Oct 2025 07:32:02 +0700 (WIB)
Date: Tue, 21 Oct 2025 07:32:02 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org
Cc: linux-hams@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: networking: ax25: update the mailing list
 info.
Message-ID: <aPbUghAytyXEZAra@archie.me>
References: <20251020052716.3136773-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GkTDwKgTYWZMUyjt"
Content-Disposition: inline
In-Reply-To: <20251020052716.3136773-1-rdunlap@infradead.org>


--GkTDwKgTYWZMUyjt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 19, 2025 at 10:27:16PM -0700, Randy Dunlap wrote:
> Update the mailing list subscription information for the linux-hams
> mailing list.
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: linux-hams@vger.kernel.org
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/networking/ax25.rst |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> --- linux-next-20251016.orig/Documentation/networking/ax25.rst
> +++ linux-next-20251016/Documentation/networking/ax25.rst
> @@ -11,6 +11,7 @@ found on https://linux-ax25.in-berlin.de
> =20
>  There is a mailing list for discussing Linux amateur radio matters
>  called linux-hams@vger.kernel.org. To subscribe to it, send a message to
> -majordomo@vger.kernel.org with the words "subscribe linux-hams" in the b=
ody
> -of the message, the subject field is ignored.  You don't need to be
> -subscribed to post but of course that means you might miss an answer.
> +linux-hams+subscribe@vger.kernel.org or use the web interface at
> +https://vger.kernel.org. The subject and body of the message are
> +ignored.  You don't need to be subscribed to post but of course that
> +means you might miss an answer.

vger mailing lists has been moved to subspace infrastructure though (and
so does subscribing information [1]).

[1]: https://subspace.kernel.org/subscribing.html

--=20
An old man doll... just what I always wanted! - Clara

--GkTDwKgTYWZMUyjt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPbUgQAKCRD2uYlJVVFO
oxZzAQDVOGnv/ATVv5w6QV/t85wZvi3c09MTXjDU04j04yxQpAEAkxwHtFWG0Kb9
I7AC36LLnSDWXI5ugl6JsU/TUeE3FgA=
=WAqV
-----END PGP SIGNATURE-----

--GkTDwKgTYWZMUyjt--

