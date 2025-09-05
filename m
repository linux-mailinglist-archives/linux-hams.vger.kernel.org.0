Return-Path: <linux-hams+bounces-625-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FDDB46752
	for <lists+linux-hams@lfdr.de>; Sat,  6 Sep 2025 01:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD7AC1CC0F32
	for <lists+linux-hams@lfdr.de>; Fri,  5 Sep 2025 23:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B94259CB3;
	Fri,  5 Sep 2025 23:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b="MtuZIrwa"
X-Original-To: linux-hams@vger.kernel.org
Received: from www11.qth.com (www11.qth.com [72.52.250.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB201FBEA2
	for <linux-hams@vger.kernel.org>; Fri,  5 Sep 2025 23:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.52.250.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757116363; cv=none; b=X0CMdpoKGwyN+yI5r+cuaA7SeA4ylLVY2YKuKhiYW7vYpqZ2yym+FUaiNh1YUilnihO8I/Sgwh4DHIoDY5ikuR9PurAi1n1A4sFnqz8ySty9iGDwIcmpYn6p8QjfJlmqnw/NgrNOAVzQhiy1lhG71EKJpjJhSpa30pFOEr75c8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757116363; c=relaxed/simple;
	bh=Z/emCZkjNq7OBSI9TL82nh9dWTCiYl2I9Gy9k3ltguQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GgPPjBCjeC/GdFoVDGCfoU0pY/QjsZlND6Lk1cEg/yMMNfbhZC0XEv9A2XZz4Us9ULkIVOzI82Bf+NRBWv1WWppOxoiZ6zoyvvR++V/aoSUUUuudXUz01SUYoyzBgncJQWrjPSrGruFKrS5zhOcm9RAoeGjL2nn1nipyVvGKBeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us; spf=pass smtp.mailfrom=n0nb.us; dkim=pass (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b=MtuZIrwa; arc=none smtp.client-ip=72.52.250.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=n0nb.us
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
	s=default; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender
	:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rWk9RRpm/VZAJk9BjYcRw/e0nmU9s8IPiu7icZtjsNE=; b=MtuZIrwau44pXVel8Ulo4Y/rw9
	NF0ag7Y0HqJ832Ay9BTKe7FDR0QHRV68kuVAV3NBQqbwNTee0dWmzMBHgN73XtT0BcxoSafYxkn7K
	4Eilo5c4dOMM0h0QpgP8xp5d2nABG5vXdj5Kr18kQcefzGNxp0v5CRnMXDYA5XcduK9YW9r6F0/9V
	aWA3gdv8XZG4VM4gOMUTQB0ihtbJLlQZ2H3+M/Kg4gqyNQRYGJlq0R9WaTZ7QdCwlfyAcvL6YFn+w
	/C5oucls7JQ764nz2TmLIQPFfLnYUvC9PFS65DMspHlfe7qLil3NZZaGr4JgHBpfE1i2LpaUNoCXv
	vc6oQatw==;
Received: from [68.234.117.171] (port=33570 helo=merlin.lan)
	by www11.qth.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <n0nb@n0nb.us>)
	id 1uuft1-0000000D5X3-05cW;
	Fri, 05 Sep 2025 18:30:31 -0500
Received: from nate by merlin.lan with local (Exim 4.96)
	(envelope-from <n0nb@n0nb.us>)
	id 1uuft0-000juj-0x;
	Fri, 05 Sep 2025 18:30:30 -0500
Date: Fri, 5 Sep 2025 18:30:30 -0500
From: Nate Bargmann <n0nb@n0nb.us>
To: Hamlib Developers <hamlib-developer@lists.sourceforge.net>, 
	Debian Hams <debian-hams@lists.debian.org>, Linux Hams <linux-hams@vger.kernel.org>
Subject: Hamlib 4.6.5 release
Message-ID: <sdxfczhgemq4pfntydazogkxuv67ywxsxotmsbotu44szmaqu5@53dlyyzvcwl6>
Mail-Followup-To: Hamlib Developers <hamlib-developer@lists.sourceforge.net>, 
	Debian Hams <debian-hams@lists.debian.org>, Linux Hams <linux-hams@vger.kernel.org>
X-Operating-System: Linux 6.1.0-38-amd64 x86_64
Organization: Amateur Radio!
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5wmw4pl5rlbuymm2"
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


--5wmw4pl5rlbuymm2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Hamlib 4.6.5 release
MIME-Version: 1.0

On behalf of the Hamlib project and its contributors I am pleased to
release version 4.6.5.  This is a bug fix only release with no new
device support.

Noted changes are:

Version 4.6.5
        * 2025-09-05
        * Update Kenwood CW buffer max message size, fix one byte buffer
          overrun in icom.c.  (TNX George Baltz).
        * Fix Segmentation Fault in rigs/dummy/netrigctl.c. (TNX Daniele Fo=
rsi)
        * Fix segfault with set_parm KEYERTYPE in rigctl_parse.c. (TNX Dani=
ele
          Forsi)

This is expected to be the last release of the 4.6.x series.

Development continues on the 4.7 series with an eye toward Hamlib 5 as a
major release.  Plan is for 4.7.0 to be released by the end of 2025 and
Hamlib 5 toward the end of 2026, if all goes well.  Hamlib 5 will be an
API and ABI breaking release which will impact programs that directly
link to the library.  Programs that utilize the *ctld daemons will
likely be minimally impacted.

73, Nate

--=20
"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."
Web: https://www.n0nb.us
Projects: https://github.com/N0NB
GPG fingerprint: 82D6 4F6B 0E67 CD41 F689 BBA6 FB2C 5130 D55A 8819


--5wmw4pl5rlbuymm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSC1k9rDmfNQfaJu6b7LFEw1VqIGQUCaLtylQAKCRD7LFEw1VqI
GburAKCOsonTbgvtUQKyiPf9oBPrYKqbuACdHFSc4oCw6c51lHJErh1LYq751Eg=
=l0Z+
-----END PGP SIGNATURE-----

--5wmw4pl5rlbuymm2--

