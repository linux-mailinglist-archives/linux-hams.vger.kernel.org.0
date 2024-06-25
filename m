Return-Path: <linux-hams+bounces-373-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1889160A8
	for <lists+linux-hams@lfdr.de>; Tue, 25 Jun 2024 10:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B38DFB22141
	for <lists+linux-hams@lfdr.de>; Tue, 25 Jun 2024 08:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490E414600F;
	Tue, 25 Jun 2024 08:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eaq2mBQO"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8237344F
	for <linux-hams@vger.kernel.org>; Tue, 25 Jun 2024 08:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719302951; cv=none; b=KCa9r0uWBYGiqNZEc2JPIW9ypF2644c6v99cPJVCaiQullblcdZsqLFrdeGUkWBDwXcieUsAkrhSYXqyRYUo/EEAPxeqWd5yxf5nWV5we/Ws8YkO18Hkc9PhsdUeA9900lDMgUiaL/zTP1wauStdMsendggp17ahkDdJ4ajGaQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719302951; c=relaxed/simple;
	bh=GgsPxZND9KhqVj7zyMftVvi+dxutgudRR31wCZZxI+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AuJy/gdhiD/ClK/751kB3Xd3deZM/1JNzfeKS2/ufKgYpO/ps+epC38sNcpCuDNhZYpCEX7tfq2riPHKEqXtpKJHrl5Myky+nqErkSsHSl1Ddw02msqFqqP2VDoNoGri/3+AvMAlTA2KDqZYod3go3gWDSuCG9OQaQsld4Pn/mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eaq2mBQO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5EF4C32782;
	Tue, 25 Jun 2024 08:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719302950;
	bh=GgsPxZND9KhqVj7zyMftVvi+dxutgudRR31wCZZxI+Y=;
	h=Date:From:To:Cc:Subject:From;
	b=Eaq2mBQOL1vxrCGbISMJuRd5w2Zot7SojcM0S0KU9zc/T93JhfniFPRIXYKYUDX7l
	 5SPIlr6KksLLYcdo2HdIHJDAk1efYNzxf8knVtz3/iENtYxJ4wtZZqYvf2rFLT64Uc
	 uMhnd0anQScbH8BjrVjAvdd1X5DRZGlT83NbUWRuvdWGt6JsK+m/GJCiGLZD7S6RIq
	 Ct06s/MjyCo5xiUSg8FEDjdsV8lSWVTOJlX5fPfUzupPwDfWgGUAyYS5O5v0BGq12O
	 ag4prqWzHbOa5apblLW8f5GsVSKb4XgnmFqPcG1gBk6Jhj90GNbeRtG1XKmtsybtqJ
	 ysw+KF4CU2aWQ==
Date: Tue, 25 Jun 2024 10:09:07 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Joerg Reuter DL1BKE <jreuter@poboxes.com>, linux-hams@vger.kernel.org
Cc: Chris Hofstaedtler <zeha@debian.org>
Subject: remote login(1) (telnetd; innetgr(3))
Message-ID: <ai6stmqygczrav7dtojrxliexav24wi5qn324opvtgzengwb4a@jdbhx3lnaevu>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a3ggl4l6ijilerbe"
Content-Disposition: inline


--a3ggl4l6ijilerbe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Joerg Reuter DL1BKE <jreuter@poboxes.com>, linux-hams@vger.kernel.org
Cc: Chris Hofstaedtler <zeha@debian.org>
Subject: remote login(1) (telnetd; innetgr(3))
MIME-Version: 1.0

Hi,

We were discussing the possibility of removing support for remote login
in shadow utils' login(1) via telnetd or similar; that is, remove the
'-h' flag.

<https://github.com/shadow-maint/shadow/pull/1022>

And then Chris reported that ax25-tools uses that flag.

<https://sources.debian.org/src/ax25-tools/0.0.10-rc5+git20230513+d3e6d4f-2=
/ax25/axspawn.c/?hl=3D64#L1837>

Do you know if that code is actively used or if it's something from the
past?  Would it be possible to switch to something secure like SSH, or
is that not viable in the systems you use?

Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es/>

--a3ggl4l6ijilerbe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZ6eyMACgkQnowa+77/
2zJ2zQ/6A91DSbNDJjUJ/yqFwV3847YGtgOEn3+v5VnSZMAaxV3vPzyZxUFP2Dw2
6gAgtl6OKfVxgS646SKs1vNVr33ndyg5sSohMXo+zUS8TboEo+t/U9i95DTy+BgC
qkVhv3Gvfw6qCm9Ce+Zs/AEXSwuO3+/0db5uL+Kbx+CmgrWY0PPI0zdY6cILD5uT
fKjIC4dNIUjGfxDileZPm4siKgNMgMPqwJcz/3dG5Cp22GCtTjXGyMEyT2dsxGMK
yYr++SC98MHngBKfZCXHVbHsDHsRA/wm0gppGYyL+Z6+uZiAXynB9TA3RpOx2paB
GNKM9e17tFrQFqt4k86wxJmoVcIPqA28/yCPsrcN+ParlwDml6EujBzb89ljbhv6
boidHMM7wSWfRpDC9yuQsBW0wa5msI8nMLr9HpzASn12ifSvGDGw/ydr+wNZ+FMb
kCynE2PIvu5H/CIj1XnPKOEXmNpX8qeQ+F/lnY/s7A6laNPrdlRlQ0eH8rKE9nnL
eMFxa/hdhpV+5MPJELZVstnf/MP+Z0QNiMjYeIg7NSweFCoS3+595OjK7e/GwuLU
ruU/qaQIRbDIOnOhwg4MLzzHtEiyv4VxXwDX/eSOnKj380gfOuAK+PCKn1wis5gF
ynamVjenJFVWONvF3jb0c4qQqx74n4nVjH/39vMw16dHVQv5mqs=
=MHY6
-----END PGP SIGNATURE-----

--a3ggl4l6ijilerbe--

