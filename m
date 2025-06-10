Return-Path: <linux-hams+bounces-524-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8920AD2BF9
	for <lists+linux-hams@lfdr.de>; Tue, 10 Jun 2025 04:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C4191712E3
	for <lists+linux-hams@lfdr.de>; Tue, 10 Jun 2025 02:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22EEC24291E;
	Tue, 10 Jun 2025 02:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b="eL1GwCc3"
X-Original-To: linux-hams@vger.kernel.org
Received: from www11.qth.com (www11.qth.com [72.52.250.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52B8219FC
	for <linux-hams@vger.kernel.org>; Tue, 10 Jun 2025 02:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.52.250.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749522859; cv=none; b=SjvonEsYKlh3OzMJsHD/UPyLjxYOr98lNeDBZYQNlGqBUDb/PD5cO5Spzb1ZQ1NlAOGHmdTZvOvdOsEGplJA/GN3FQcgLGMbIgW5ogU7Wsd0wQHluRY38oz34g8DNsz9pDrH6MUDzSdamArdjeyKdDhiiDHFYM845D0jmnueUBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749522859; c=relaxed/simple;
	bh=Hy9PyFF4XBPHD+U2uDlPG79F76gUGAdz4iVQFk3jPE8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EwOfcbMRXmtcxxbc3X0UMsmNLPdXW8esiu6+AlOgasN/TLpaOJIkQt4HpEF3ycLwf4DFgl7xmjPGQiDMAq6jn1ws+kyHH5xbhMPFyYkZwL6dh2OsjNzbvSh0GnctMLXJKNOwCrGMcQMAsrhiSF5XAJi7hJhSOGRyC8dfgTDHzDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us; spf=pass smtp.mailfrom=n0nb.us; dkim=pass (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b=eL1GwCc3; arc=none smtp.client-ip=72.52.250.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=n0nb.us
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
	s=default; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender
	:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fT/vqYEeu4DkOFp1KlTGGcU1aSTE0torJSVM56CPytk=; b=eL1GwCc3bp/9MlXWjPSUbcZJy4
	BCfp1XVWyc4qJqm8vCp7pNkU2+BHrZMpzFlgXsQQ1If+OuuIv0Wcmor1X5sXeAKHtamQu04Nw9EQi
	NNGvuGBYDpiEM9dTAghGFp0JbxA+ir7x4ccGng9UZBws5gZx/N1gzmKK21KDG9Pg7Zy76/vakI7qT
	UZdeg2cFaQ9CW+uD32BXDvKB5UTtAqtZRLxp/gySBJuA1pkwCAww35KUpOzqpHi1U2hCJLLCI9RwY
	9U8NbT51wux1EmdssALoi3+OUbKVoVTFI+faYY6S2vf89ZkyAHWDuG3DwKSE3bsBrAs8EgDrKfDiw
	+g08KPBQ==;
Received: from [68.234.117.171] (port=33798 helo=merlin.lan)
	by www11.qth.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <n0nb@n0nb.us>)
	id 1uOoTJ-00000004BpD-0t6U
	for linux-hams@vger.kernel.org;
	Mon, 09 Jun 2025 21:12:16 -0500
Received: from nate by merlin.lan with local (Exim 4.96)
	(envelope-from <n0nb@n0nb.us>)
	id 1uOoTI-00CyZ6-0w
	for linux-hams@vger.kernel.org;
	Mon, 09 Jun 2025 21:12:16 -0500
Date: Mon, 9 Jun 2025 21:12:16 -0500
From: Nate Bargmann <n0nb@n0nb.us>
To: Linux Hams <linux-hams@vger.kernel.org>
Subject: [Fwd: [Hamlib-developer] 4.6.3 released!]
Message-ID: <nrnhr7homao3vwvc7ox6tl7j5nfnejao75yv6mfh7t4dckunpa@pf2cztrocidw>
Mail-Followup-To: Linux Hams <linux-hams@vger.kernel.org>
X-Operating-System: Linux 6.1.0-37-amd64 x86_64
Organization: Amateur Radio!
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4rzprbccfw3fz4hq"
Content-Disposition: inline
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - www11.qth.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - n0nb.us
X-Get-Message-Sender-Via: www11.qth.com: authenticated_id: n0nb@n0nb.us
X-Authenticated-Sender: www11.qth.com: n0nb@n0nb.us
X-Source: 
X-Source-Args: 
X-Source-Dir: 


--4rzprbccfw3fz4hq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [Fwd: [Hamlib-developer] 4.6.3 released!]
MIME-Version: 1.0

----- Forwarded message from Nate Bargmann <n0nb@n0nb.us> -----

Date: Mon, 9 Jun 2025 21:07:48 -0500
=46rom: Nate Bargmann <n0nb@n0nb.us>
To: Hamlib Developers <hamlib-developer@lists.sourceforge.net>
Subject: [Hamlib-developer] 4.6.3 released!
Organization: Amateur Radio!

Hi all.

Thanks for all of the contributions that have made the 4.6.3 release
possible.  As always, the project continues on thanks to you.  No
question, the passing of Mike, Black, W9MDB, has left a void but we are
continuing on respecting Mike's work while making the changes necessary
to allow Hamlib to meet the needs of users in the modern amateur radio
station.

4.6.3 is available from the usual download sites:

https://github.com/Hamlib/Hamlib/releases/tag/4.6.3
https://sourceforge.net/projects/hamlib/files/hamlib/4.6.3/

Most visible updates from NEWS:

Version 4.6.3
        * 2025-06-10
        * Release dedicated to the memory of Michael Black, W9MDB (SK).  Mi=
ke was a
          long-time contributor to Hamlib and led development of the projec=
t for over
          five years from 2020 to 2025.  Mike passed away on March 28, 2025=
 due to
          complications from ALS (Lou Gehrig's disease).

        * Fix various typos in Doxygen tags.  (TNX Daniele Forsi)
        * JRC: Removed RIG_FUNC_FAGC from 535D as erroneous, Added RIG_FUNC=
_NB2
          functionality to both 535D and 545. (TNX Mark Fine)
        * Restore IC-7300 spectrum data callback - regression in 4.6 (n3gb)
        * Add locking to rig_[gs]et_level() - fixes sending CW from tlf (n3=
gb)
        * Fix attempt to use memory returned by setlocale() after being fre=
ed (TNX Mooneer Salem)
        * Language bindings configuration and build fixes (TNX Daniele Fors=
i)
        * Various build system and compilation fixes (TNX Daniele Forsi)
        * IC-705 filter selection bandwidth for FM and WFM (TNX Kenji Rikit=
ake)
        * IC-705 COMP, VD, and ID meter calibration values (TNX Kenji Rikit=
ake)
        * Fix ACLog thousands separator
        * Documentation updates, typo fixes, man page fixes (TNX Daniele Fo=
rsi)
        * Drop redundant token lookups and make local functions static (TNX=
 George Baltz)
        * Fix rigctl showing hamlib_verson when connecting to rigctld
        * Add rig CODAN 2110


73, Nate

----- End forwarded message -----

--=20
"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."
Web: https://www.n0nb.us
Projects: https://github.com/N0NB
GPG fingerprint: 82D6 4F6B 0E67 CD41 F689 BBA6 FB2C 5130 D55A 8819


--4rzprbccfw3fz4hq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSC1k9rDmfNQfaJu6b7LFEw1VqIGQUCaEeUgAAKCRD7LFEw1VqI
GV60AKC16gSg2HAqIV1chLrj7nZk37J2aQCgmIi3hgY/9RQDbb04z1Z990i7cRw=
=ecYQ
-----END PGP SIGNATURE-----

--4rzprbccfw3fz4hq--

