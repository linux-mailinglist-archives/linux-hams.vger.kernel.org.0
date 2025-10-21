Return-Path: <linux-hams+bounces-668-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBC6BF4281
	for <lists+linux-hams@lfdr.de>; Tue, 21 Oct 2025 02:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5037B189A80D
	for <lists+linux-hams@lfdr.de>; Tue, 21 Oct 2025 00:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA391F463F;
	Tue, 21 Oct 2025 00:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/5WYUi6"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552748528E
	for <linux-hams@vger.kernel.org>; Tue, 21 Oct 2025 00:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761006989; cv=none; b=HWbgHnx0p6JoTBDI40q+z7mf2sLqssVGkKz/J3Fy8yq//AO900Xy1mX9/WmlmATxuEnPCiPI1tC/QdRqAfZLc7mKVemEP2bI9vsu0KDvxLSrCB3cfTe1q/tfTtGbahGttup7U2tbKvVg8fAEdp+iIOUfpnJMp70v4phEfVV0fKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761006989; c=relaxed/simple;
	bh=EH7CUSPwQHF6nPtGpFzbexRy0S5Tm7bI+w5y98H6ApM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sg5sEseu1bdx7+V7cL9aQuElY3ramX6rVNgk58p0iMWU+vdnRpjJS5oNTIP4WxszzDR2utG5eP2A7MLylR9PCfKLIMwwxyEhqcZN4N98pIAl5J7jphraFwBk10flDorvfMPSWRAZk2kLx4/rH7bwdhjz2Ujg8/uNAi4PIqEznGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/5WYUi6; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-79af647cef2so4211104b3a.3
        for <linux-hams@vger.kernel.org>; Mon, 20 Oct 2025 17:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761006987; x=1761611787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IRlpjcWAWGjhHfcS9QCWAC71fosOw+vedWLjmJk8iZA=;
        b=K/5WYUi6BDfO8y5ay6BOkBnzjyWfCmhRLHxO4qqEumu57icS/Xfhr/U/GL085qPmXo
         y9yxB23+QJFjILjXWtbv9h/jf0qEwChArdAiev54uI3gIf92nefNQm4dxnGtZ7KluQk0
         ZYw2kXy8wyi9+Y+5qQ3xfZUi1rB2zPHEj3iU/8Awdcm8DX4PH9Ndm63drQaHo8ilriC1
         pUYjLWHPEI/Ewbqd/aD9mEk8pwnDRmGq75sAquFL7Z75V6NTTwXXtZbNlxjjBnK6hM/K
         SmzS68fZmmLKPfA2Ux2apWrwB2NwAj6ITsTSHAUsdb3e90Nx73Wz+DYOmI6o8HQAg48z
         VsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761006987; x=1761611787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRlpjcWAWGjhHfcS9QCWAC71fosOw+vedWLjmJk8iZA=;
        b=GbdqPdJOxGY8wEbkcxRm6/rwDMWTZ56/LNdrwCJ6Jky+Cd4Zacq+L0U/hCF5HJrIAZ
         ikoPm33gnbS/9yoB/e7k58gNOgnrvyP48ZNW130o10fvgc0OpDW32acZpE4werKSu8VS
         vvSuYruOdXgG8nJE4TEkujFwwB5PW9jIF+p9zyWvYeMH2DkWKr1i9qJwY7KUzTNh9z4D
         yaJGWmrJyO7jLBu1UViN3bltW5mvF657aINFTFOzIeUpjXg8/Ye5L+rphiRzB4kPhrka
         zVcAI27x9gZQabzD/HCROA/eo+VvanyOn26JS82eR53jQ6E3r7ebL5SGqbxmwmadsyL/
         oNJA==
X-Gm-Message-State: AOJu0YxFCFQyXrOm80/pVdy/jhZO4r9BAx48RDDrDTYHy26Bv5VgIceN
	QyOE9EwwACwkXg1vV/pWw/fkKb8DZV1GXhp1ncrXy5Jyr5xqxYlYlEAh
X-Gm-Gg: ASbGncsw/uh8gD1ntHNyJuJLoBgu48B7tVLF74hoDRKtqc/g0scM+R78gb3KAsQZMZ1
	oKZjQI+uX+J6MD81ArwL4tWGIosLK7fuYlLgDVaVoPBbdmOCxv9F9rLyeTv7fzx1xdPQ4G8ruk9
	tmyGzqxsQk3bmmAcseGKu0kASemy9m4e0ISF39xwcU6WCxovHtOEFOvvMlHqTkY/JaIHucWwp9/
	Pw6G9SLWf4gb4cecF3zGShK1/CcIZjELEt2/ooqvePlJnE/pLuEjYY8oFlWBMMxCU15l4Iw/zc5
	cF/dv+EHhJlYfEpNS4+PMsXW0/4bj1W/Y2ef0tJNZM3PHiOCj0ciMaici1HuYupVl9aJg68j+V8
	cHKyYf+JjCNY53qgMpDYJljLI1da1UckLhykpOsuditVXVwV9pBESVRYW+0bPNPbUVzCG4MF8S4
	0c1LfNAlQxAZthfw==
X-Google-Smtp-Source: AGHT+IEMvnZcSxpcwUi2wv1kb+TVT/VkjPcJxEJEJ7ojWOTGJ65Zw8PWswzDzBYCA122UQkqJnkdVg==
X-Received: by 2002:a05:6a00:3d04:b0:77f:3db0:630f with SMTP id d2e1a72fcca58-7a220c2c960mr20730043b3a.28.1761006987485;
        Mon, 20 Oct 2025 17:36:27 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f258dsm9827671b3a.43.2025.10.20.17.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 17:36:26 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E62D5412B0A6; Tue, 21 Oct 2025 07:36:23 +0700 (WIB)
Date: Tue, 21 Oct 2025 07:36:23 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org
Cc: linux-hams@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: networking: ax25: update the mailing list
 info.
Message-ID: <aPbVh3F18xVTKa6B@archie.me>
References: <20251020052716.3136773-1-rdunlap@infradead.org>
 <aPbUghAytyXEZAra@archie.me>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Iu0xxtkt2gcNvAO"
Content-Disposition: inline
In-Reply-To: <aPbUghAytyXEZAra@archie.me>


--/Iu0xxtkt2gcNvAO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 07:32:02AM +0700, Bagas Sanjaya wrote:
> On Sun, Oct 19, 2025 at 10:27:16PM -0700, Randy Dunlap wrote:
> >  There is a mailing list for discussing Linux amateur radio matters
> >  called linux-hams@vger.kernel.org. To subscribe to it, send a message =
to
> > -majordomo@vger.kernel.org with the words "subscribe linux-hams" in the=
 body
> > -of the message, the subject field is ignored.  You don't need to be
> > -subscribed to post but of course that means you might miss an answer.
> > +linux-hams+subscribe@vger.kernel.org or use the web interface at
> > +https://vger.kernel.org. The subject and body of the message are
> > +ignored.  You don't need to be subscribed to post but of course that
> > +means you might miss an answer.
>=20
> vger mailing lists has been moved to subspace infrastructure though (and
> so does subscribing information [1]).
>=20
> [1]: https://subspace.kernel.org/subscribing.html

Oops, I didn't see that the subscribing address stayed the same after
the migration to subspace.

--=20
An old man doll... just what I always wanted! - Clara

--/Iu0xxtkt2gcNvAO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPbVhwAKCRD2uYlJVVFO
o01mAP9s3OU2TdIY6nDzQYLze/hVObQqmEg+lQqq1FfxPE+eHgEA9CSV/S7NKPAb
xtVmU00pQua0uRtIzeATVLhAW8oSAgw=
=Vbi7
-----END PGP SIGNATURE-----

--/Iu0xxtkt2gcNvAO--

