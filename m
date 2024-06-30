Return-Path: <linux-hams+bounces-379-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 020EA91D091
	for <lists+linux-hams@lfdr.de>; Sun, 30 Jun 2024 10:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3506A1C20AAD
	for <lists+linux-hams@lfdr.de>; Sun, 30 Jun 2024 08:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF213A267;
	Sun, 30 Jun 2024 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJ/Tv6lr"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4883A1BF
	for <linux-hams@vger.kernel.org>; Sun, 30 Jun 2024 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719736366; cv=none; b=B79KgRtEdlTICGs0v7xKrcZDbNHVkQ6FVaNzckBe+gqkmEwerf07+0folGxGRKmxfNUUT1sZ7et0OC4iFbyIroHX0p+kkfKRrM/aK02GlZRxeefCO/rIq4GiZr4dcyer/uRSk2gkUis0eiLmSP42GY0KWetdpbToAMFL+edW7Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719736366; c=relaxed/simple;
	bh=V/XGtrWVHkRY+ZCVQ/BT50PZ5X272FOVcVmpbbOzlPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+IOHNBnIGjFANDy1A1YtZcn4C4Iy3e+WO7hK38BVEuWxtCP0DXcHzwn1DgNwPfmO3VAsGr9aJjLn3qElFiQlp2pAzSKv2xAnXz7R9wAWom8VhhzLDOthH+vXxgZETHcaiv7MZGOl/li+xWRiA6aaO7Q3xKS8kzyEmL/iHSNLis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJ/Tv6lr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B8DC2BD10;
	Sun, 30 Jun 2024 08:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719736366;
	bh=V/XGtrWVHkRY+ZCVQ/BT50PZ5X272FOVcVmpbbOzlPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJ/Tv6lrq+tN9Sby+skU5SDM3/CFRHo9jNG8U9dYKJvcAMxuYoTl/NysJdNlqguTJ
	 RW1e0CcXkUQw6vIFMyJKJYjTXHbqCcOtQBRZy/WAypI1wouUD6+qg47+y7qGtlUUlC
	 4Ff+P6gDi4u8Xf0rhZuaG3wxFQ/EL2385Ev+kWl2IUedxevvcZZ8XaFs0aAjN/7Y9H
	 BnblHk7nAuRaaT9ogmsbqzFZOJawdoXu373v6CrXtuc65ZFfm6/Xnc0n5qWxS05ztg
	 dfarCR6TnAZ70fTLOv4SORLnBfsDGdjypM1s99dMWMIhP7zUEI1c/XkIiesRhAi2Kd
	 pRTdI7GoYhPaA==
Date: Sun, 30 Jun 2024 10:32:43 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Joerg Reuter <jreuter@yaina.de>, linux-hams@vger.kernel.org
Cc: Chris Hofstaedtler <zeha@debian.org>
Subject: Re: remote login(1) (telnetd; innetgr(3))
Message-ID: <y4bhmtci7ggpavky5jfogduyoqf6cwa6ky57wconv6yrpa4lu7@e66257rxezxm>
References: <ai6stmqygczrav7dtojrxliexav24wi5qn324opvtgzengwb4a@jdbhx3lnaevu>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sxh7xz4eorpps2pm"
Content-Disposition: inline
In-Reply-To: <ai6stmqygczrav7dtojrxliexav24wi5qn324opvtgzengwb4a@jdbhx3lnaevu>


--sxh7xz4eorpps2pm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Joerg Reuter <jreuter@yaina.de>, linux-hams@vger.kernel.org
Cc: Chris Hofstaedtler <zeha@debian.org>
Subject: Re: remote login(1) (telnetd; innetgr(3))
References: <ai6stmqygczrav7dtojrxliexav24wi5qn324opvtgzengwb4a@jdbhx3lnaevu>
MIME-Version: 1.0
In-Reply-To: <ai6stmqygczrav7dtojrxliexav24wi5qn324opvtgzengwb4a@jdbhx3lnaevu>

The mail bounced from Joerg's other address.  I've changed it so that it
arrives to him.

On Tue, Jun 25, 2024 at 10:09:10AM GMT, Alejandro Colomar wrote:
> Hi,
>=20
> We were discussing the possibility of removing support for remote login
> in shadow utils' login(1) via telnetd or similar; that is, remove the
> '-h' flag.
>=20
> <https://github.com/shadow-maint/shadow/pull/1022>
>=20
> And then Chris reported that ax25-tools uses that flag.
>=20
> <https://sources.debian.org/src/ax25-tools/0.0.10-rc5+git20230513+d3e6d4f=
-2/ax25/axspawn.c/?hl=3D64#L1837>
>=20
> Do you know if that code is actively used or if it's something from the
> past?  Would it be possible to switch to something secure like SSH, or
> is that not viable in the systems you use?
>=20
> Have a lovely day!
> Alex
>=20
> --=20
> <https://www.alejandro-colomar.es/>



--=20
<https://www.alejandro-colomar.es/>

--sxh7xz4eorpps2pm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmaBGCoACgkQnowa+77/
2zIw1Q//WUWVJ8YE9TqejnaaYlXHFKLS4tIsklpnRgTi0/E/rcXIGf8jwDvoOeC0
gLEAxm1ib5BJNThLAeoXCrqTXidX42Ug7m9B82l9fJ6JmxrpGyCjjlF4vo+sVBur
6pF2ReYQEl43pc/mebVzkRBbZSYYFamoBp7ZeUcGSqVIAnbG5cpkj0hm/ZkJ74VS
b+4nRAyxHizoPDPGpyAlkJeioCOE9lowTf0sV3pPvcZ3hODZ4plvKmhqlIWrnoyI
fEm3mRZ2qlKwMr2ccTUL8o+ND/LLId9dyw3hMkDzzVs1+w3qeCv3qW+eXEEBHYOW
qpQlGnHSXVAib4e79gdulhPFBXGhsiJP/IYqEz7iz//50M+1tG2s7M1GHlLYKjN1
RXbGZ1g2VGqglIHrzKG6HXLhLFOC753rcBbF1bb5Z3y82szZgOf+hmSq/k4egoBp
o+aUtlPpMe1HpapiscEdcpTT+MuFNb3nw5BHdErR9X2VjYDBiEoJyQMQQBZz9ORn
QEkdUrym07Ws6ptxbSabhmwcZrGBHldkBHWMUMuA215XwkoEHz4RL6vwtcB3EzGi
XJzg6VRju7qZHzd6+cNwsofDiG7RcngKBqwMePn6XZbMeaSMVkkV4ESYa+BwDwan
hWOaQZi34q6DOX+mWTosM5yJbgUBsCaTeC+EnctNEw1+b3uHIi8=
=QmVv
-----END PGP SIGNATURE-----

--sxh7xz4eorpps2pm--

