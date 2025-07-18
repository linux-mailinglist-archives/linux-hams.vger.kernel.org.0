Return-Path: <linux-hams+bounces-543-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EF3B0AABD
	for <lists+linux-hams@lfdr.de>; Fri, 18 Jul 2025 21:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 515B416F33D
	for <lists+linux-hams@lfdr.de>; Fri, 18 Jul 2025 19:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1397D207DFE;
	Fri, 18 Jul 2025 19:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b="haDDQmRU"
X-Original-To: linux-hams@vger.kernel.org
Received: from www11.qth.com (www11.qth.com [72.52.250.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ADF20E334
	for <linux-hams@vger.kernel.org>; Fri, 18 Jul 2025 19:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.52.250.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752867195; cv=none; b=oRPeVO4fGIUEnLapdgWqT3E9dLDI8WYhkd/XisDNwC6kINCaXVg9/gMpsxai6hLNmupixRRq1JNICDnOJNhiXHj7HGu0v8bYyYBn9tG5Vt4fgpVBfMcOYUEk1BWzOlBEXO3C0sG1krQHcLMzpYXDsMLOuiR3BK64SNQNdPZmU3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752867195; c=relaxed/simple;
	bh=npviOHki4LOFvJdMTKCSclNH/WHAgOIPM+iSr9gRkEs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hd9wEWBTY8HZ5Wn+7yaQKqdLKY1IRgE8zntVKlzaBe7KQEgZi8RDMzARjUTZelwdWke0rDctY2OIGdPBFhnlqXETKkfyAwVCrAd6XVRh4Pe8ShNTVy6N3KvEr1xeDZ6EzWndj7gOrhQKdm9iW9/Om7ohv3rnhtc1eH02p1RAkMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us; spf=pass smtp.mailfrom=n0nb.us; dkim=pass (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b=haDDQmRU; arc=none smtp.client-ip=72.52.250.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=n0nb.us
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
	s=default; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender
	:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hWXy48DbweJlOTQYYpbmqPVZsYp0fscyVUoCDE0Z8ys=; b=haDDQmRU0QkzUFeLSECaRqJMcK
	1zaRV09Tqp3FOyXL7UPLFAayg4bj6vyscmuaGHX8YdDDqcMAEPeaoNlMSc+uBkrbiYOv3GYvH0NSZ
	YSNVBjEF0Y7w04N4dv6y3ks3PpVXReH2nZGRnciXOCvmVX9QRlCLLoKT4yyUqeSD0pci7PWO49meR
	Q6BSIk2eDoUWqQX+muIRPX+sIQcgaa2obmYmTTDeWOoXUV+LIDOAOXaR86iJuxIG48SSczakkjo+c
	0rvWCcEXjIGMZE8UVkRJZWa7aLDHRcIFNJUQhIXO8feNpNCmstAcJjcW1IdgRc2MtscTnyKhUJEaZ
	e0omxCZg==;
Received: from [68.234.117.171] (port=55280 helo=merlin.lan)
	by www11.qth.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <n0nb@n0nb.us>)
	id 1ucqa3-0000000FwKM-1KYG;
	Fri, 18 Jul 2025 14:17:14 -0500
Received: from nate by merlin.lan with local (Exim 4.96)
	(envelope-from <n0nb@n0nb.us>)
	id 1ucqa2-00GSzX-0o;
	Fri, 18 Jul 2025 14:17:14 -0500
Date: Fri, 18 Jul 2025 14:17:14 -0500
From: Nate Bargmann <n0nb@n0nb.us>
To: Linux Hams <linux-hams@vger.kernel.org>, 
	Debian Hams <debian-hams@lists.debian.org>
Subject: [Fwd: [Hamlib-developer] Hamlib 4.6.4 release]
Message-ID: <qj6bm2dsvjdz3xmltjriyh4tikxqmzi2u6pdjuvargknrf6yia@bos2jhsa3qtg>
Mail-Followup-To: Linux Hams <linux-hams@vger.kernel.org>, 
	Debian Hams <debian-hams@lists.debian.org>
X-Operating-System: Linux 6.1.0-37-amd64 x86_64
Organization: Amateur Radio!
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uuky5ib2lq25555k"
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


--uuky5ib2lq25555k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [Fwd: [Hamlib-developer] Hamlib 4.6.4 release]
MIME-Version: 1.0

Download links are:

https://github.com/Hamlib/Hamlib/releases/tag/4.6.4

https://sourceforge.net/projects/hamlib/files/hamlib/4.6.4/

----- Forwarded message from Nate Bargmann <n0nb@n0nb.us> -----

Date: Fri, 18 Jul 2025 14:10:25 -0500
=46rom: Nate Bargmann <n0nb@n0nb.us>
To: Hamlib Developers <hamlib-developer@lists.sourceforge.net>
Subject: [Hamlib-developer] Hamlib 4.6.4 release
Organization: Amateur Radio!

Hi All.

Realizing that today is Hamlib's 25th birthday, I thought it would be
nice to just release 4.6.4 as a present to everyone!

This is a bug fix release with no new device support.

Changes are:

Version 4.6.4
        * 2025-07-18--Hamlib's 25th birthday!!!
        * Fix handling of unprintable characters in kenwood.c that broke ra=
dios
          such as the TM-D710/TM-V71 that use EOM_TH (\r) as the command te=
rminator.
          (TNX, Lars Kellogg-Stedman and George Baltz).
        * Fixed jrc_set_chan. (TNX Mark Fine).
        * Fix memory leak in rigctl_parse.c and use unique separator charac=
ter
          for each rigctld connection--closes GitHub #1748. (TNX George Bal=
tz).
        * Fix powerstat check for Icom R75 which rejects the command.  (TNX=
 Mark Fine).
        * Restore TS-590S/SG RIG_LEVEL_RFPOWER_METER, Fix rotctl \dump_caps=
 output
          (TNX, George Baltz).
        * Add CW sending capability to Flex SmartSDR.  (TNX Michael Morgan)
        * Handle spaces correctly for Fles SmartSDR.  (TNX Michael Morgan)

There may be a few more bugs that can be squashed in this branch leading
to 4.6.5, but right now that seems some time off.  Otherwise development
is moving toward the 4.7.0 release later this year.

73, Nate

--=20
"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."
Web: https://www.n0nb.us
Projects: https://github.com/N0NB
GPG fingerprint: 82D6 4F6B 0E67 CD41 F689 BBA6 FB2C 5130 D55A 8819





_______________________________________________
Hamlib-developer mailing list
Hamlib-developer@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/hamlib-developer


----- End forwarded message -----

--=20
"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."
Web: https://www.n0nb.us
Projects: https://github.com/N0NB
GPG fingerprint: 82D6 4F6B 0E67 CD41 F689 BBA6 FB2C 5130 D55A 8819


--uuky5ib2lq25555k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSC1k9rDmfNQfaJu6b7LFEw1VqIGQUCaHqduQAKCRD7LFEw1VqI
GZdKAKCiTzTD557ewSLaM84BjfOP+AnedQCeL7Smd+e3KxyG/nl2vSv3T56dR/E=
=5Wv7
-----END PGP SIGNATURE-----

--uuky5ib2lq25555k--

