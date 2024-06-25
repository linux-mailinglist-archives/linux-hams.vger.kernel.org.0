Return-Path: <linux-hams+bounces-376-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 553D5916D44
	for <lists+linux-hams@lfdr.de>; Tue, 25 Jun 2024 17:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0123D1F235E9
	for <lists+linux-hams@lfdr.de>; Tue, 25 Jun 2024 15:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FFA16F8E7;
	Tue, 25 Jun 2024 15:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ON4IlMmS"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B684E16F859
	for <linux-hams@vger.kernel.org>; Tue, 25 Jun 2024 15:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719329966; cv=none; b=M3WlKoIEz9jTYqXK3EqUkcTf/UQS1USmcrjqYAbtRWPrn3EQeisAO9IYx4Zpogl+l5p2GqtJ4TJfuRS/afc7J4UZxE2jrHWX1XgDImXrnaftWKKOOAB4empFFdb9feMxFMxAEAO6hxLsq8rS2Mt3Z6iHDixn0QkPBKi0/f/jRbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719329966; c=relaxed/simple;
	bh=Ig1IYtyboG3z1Ll+1Qxf+g5iZBgTEwx+eBj4OP7lAFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9pCWTtRoyYotQvDOlVesj2jBt5tZUMBK4EshUxGZMuUkDBSzA4GGOx7y9JLWQ5YZ4aSTmogmqfwgsY2m5gpItyWe6kkrS5Zbswqf9NLwcfZ7fAClS/uE49ToB+AmcR7aZbusS58+oEG/zO5WW2YcBDs9VtGlTOXf3/rxj3HukM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ON4IlMmS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9007FC32781;
	Tue, 25 Jun 2024 15:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719329966;
	bh=Ig1IYtyboG3z1Ll+1Qxf+g5iZBgTEwx+eBj4OP7lAFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ON4IlMmSNaw4wMmt6FXjj1kwEkCdvxPEMDci3imHO6oPV0isgD5vGkfRe3c5W3MFU
	 02HaR1Vv3hHz+ogOmguocIVe3u6t+4L9XqySzpDdF2BXvgDWDHyCB9ik7DPTG5Sb9g
	 uMqTbivvAKwc3uHhwFBDSbD3DnhBZ1WcRExptMZAdG8uGT4czJ8mLkm6NjMnXoGvOp
	 ehQeaXytCNCOFsc0dISdPsXoapk/vI2dnnozspAZ8VzB7lRxZ81lwciRhF04G6tD89
	 x+uLI5wwqUzt8Pz1DCeHsY6mCKsv+tSLcl2MjvoBeTBDwRLaS5CLphoUMBfWn9RUGm
	 za9Y3ABiyK6Gw==
Date: Tue, 25 Jun 2024 17:39:23 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Dan Cross <crossd@gmail.com>
Cc: Joerg Reuter DL1BKE <jreuter@poboxes.com>, linux-hams@vger.kernel.org, 
	Chris Hofstaedtler <zeha@debian.org>
Subject: Re: remote login(1) (telnetd; innetgr(3))
Message-ID: <xyilquq3zxmrnbjgxgtxtbxdngxswhpxyd6t3aas4psm4zuy6j@xzvr3h3bsvue>
References: <ai6stmqygczrav7dtojrxliexav24wi5qn324opvtgzengwb4a@jdbhx3lnaevu>
 <CAEoi9W7YEkhYnNTmrG=NSuZLQhEXxqYid_J_BB5Wgn6gqoF=1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aja3g7oi52myv6xz"
Content-Disposition: inline
In-Reply-To: <CAEoi9W7YEkhYnNTmrG=NSuZLQhEXxqYid_J_BB5Wgn6gqoF=1A@mail.gmail.com>


--aja3g7oi52myv6xz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Dan Cross <crossd@gmail.com>
Cc: Joerg Reuter DL1BKE <jreuter@poboxes.com>, linux-hams@vger.kernel.org, 
	Chris Hofstaedtler <zeha@debian.org>
Subject: Re: remote login(1) (telnetd; innetgr(3))
References: <ai6stmqygczrav7dtojrxliexav24wi5qn324opvtgzengwb4a@jdbhx3lnaevu>
 <CAEoi9W7YEkhYnNTmrG=NSuZLQhEXxqYid_J_BB5Wgn6gqoF=1A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEoi9W7YEkhYnNTmrG=NSuZLQhEXxqYid_J_BB5Wgn6gqoF=1A@mail.gmail.com>

Hi Dan,

On Tue, Jun 25, 2024 at 11:28:52AM GMT, Dan Cross wrote:
> On Tue, Jun 25, 2024 at 4:09=E2=80=AFAM Alejandro Colomar <alx@kernel.org=
> wrote:
> > We were discussing the possibility of removing support for remote login
> > in shadow utils' login(1) via telnetd or similar; that is, remove the
> > '-h' flag.
> >
> > <https://github.com/shadow-maint/shadow/pull/1022>
> >
> > And then Chris reported that ax25-tools uses that flag.
> >
> > <https://sources.debian.org/src/ax25-tools/0.0.10-rc5+git20230513+d3e6d=
4f-2/ax25/axspawn.c/?hl=3D64#L1837>
> >
> > Do you know if that code is actively used or if it's something from the
> > past?  Would it be possible to switch to something secure like SSH, or
> > is that not viable in the systems you use?
>=20
> Variations of it are actively used. See, for example,
> https://kz2x.radio/posts/complex/
>=20
> However, looking at the linked code you pointed to, it appears that
> the `-h` flag is only used to insert the _protocol_ a user uses to
> connect with into the `ut_host` field of the utmp file; one of the
> empty string, "AX.25", "NET/ROM" or "Rose". Presumably this is so that
> if one runs `w` or `who` or `finger` or `last` something on a host
> that a user has logged into using `axspawn`, one would know what
> protocol they used. It's subjective, but I don't know how valuable
> that information is; I suspect not very, given what's already a pretty
> niche case.
>=20
> More to the point, one could remove the lines from `axspawn` that add
> the `-h` option and its argument to `login` and `axspawn` would
> continue to work for its intended purpose; just a small bit of
> information would no longer be present about the connection itself.
> For that matter, nothing prevents `axspawn` from logging that
> information via other means (syslog, for instance).

Hmmm.  Thanks!  Would you mind reviewing the patches here:
<https://github.com/shadow-maint/shadow/pull/1022> to make sure I can do
it without breaking anything for you.

If there's any chance we can break stuff, just let me know and I'll drop
my patches.

Have a lovely day!
Alex

> Something like `ssh` won't work in this case, I'm afraid, but not only
> for the reason already listed about regulatory restrictions on
> encryption in the amateur radio service. Rather, `axspawn` is designed
> for use with one of the connected-mode amateur-specific protocols, not
> TCP/IP: though AX.25 is technically a link-layer protocol, it is based
> on X.25, which predates the OSI model and its categorization as layer
> 2 is a bit of an approximation. In particular, it contains a
> semi-reliable "connected" mode that can be used for "keyboard to
> keyboard" communication, and that's the sort of thing that `axspawn`
> uses. NET/ROM and Rose are both protocols layered on top of AX.25 that
> provide something closer to what we'd recognize as a combination of
> network- and transport-layer protocols. Anyway, to my knowledge, no
> one has produced a version of `ssh` that can use AX.25 addresses, or
> any protocol other than TCP/IP.

Ok; thanks.

>=20
>         - Dan C.

--=20
<https://www.alejandro-colomar.es/>

--aja3g7oi52myv6xz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZ65KsACgkQnowa+77/
2zLWfxAAgiW1EVJk4n/qm2qq0+wwlZIp5tfsEAbEN28yaNPE2j54d+awT2CuytNy
UD8C1nSTRC9FwU7Uq9np4vIptCVpLL0DiUMvKri4uawFz1UgM+g3JPaUbRyErcQ9
aBYQbgG5mlqqaGtZBzmX4P5fDzb0Nne7nQkDxSeSwBI/lXRsoZPu3NG1j4qLslqm
t4WhX/19rPuwxvL+L02+rO40mnm3HlmSkEmAy2qEqJt1aTri5G2ZQnd+NmikemxJ
Q0siYR14FsjLDYTK0QOP1g3S2IPELpCSZJEJrY/3RvbVclH4Rolvg0uVWQDng+Rb
nYCMMm0JY5RDUCk5m+s9H6MRFj8R3/t1yMqT8bEjEZoW0kpekV1JteQLINQEnCmY
Ate6YGe8qeCK9ytYIZ42S4Mupd/mGRmtMXMyYGroVF2h8lF4vvV0zSuua2RWuMsL
OUM6Nu36PhYptJPU+De+JTB4wpeK9+unntlioiiLu8NUz3WNWcC18+s2l+7058hQ
4UISruQAyu9rCuEYf9urDiFZ6FYUJbROAKzGXuQCr3j/thVpLuzIE24WmTZyVpyR
/YfuffYtry5YvFDUiKPk/Ldr7hcrxlH4djAdQXdg7HKUUgq88TWL3Ma73fcQ28sa
JQlsNqBUcSUScKgSq5C/YeBTpaIR4vpb5EssW21p6NiVwcsWlUw=
=NDU5
-----END PGP SIGNATURE-----

--aja3g7oi52myv6xz--

