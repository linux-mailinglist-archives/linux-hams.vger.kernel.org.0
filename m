Return-Path: <linux-hams+bounces-399-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0E0950845
	for <lists+linux-hams@lfdr.de>; Tue, 13 Aug 2024 16:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C63AB23AD5
	for <lists+linux-hams@lfdr.de>; Tue, 13 Aug 2024 14:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A28C19E804;
	Tue, 13 Aug 2024 14:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b="NCizkQTb"
X-Original-To: linux-hams@vger.kernel.org
Received: from www11.qth.com (www11.qth.com [72.52.250.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5C119B3D3
	for <linux-hams@vger.kernel.org>; Tue, 13 Aug 2024 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.52.250.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723560891; cv=none; b=YTKIZYaFXxKsSIkJ9SZIqcZtepqT99OeShW3pDdyGoSHfczXbsZRS7m9Z/J36kMyrDcvwy6jB6/DLXeXrxCXwNfZulLJS57BEqAj+dyLRGFyLHO32N3CQ5rebV9fIMo7xiikrByPG420VA09jwwSXOsQEQLK1Xc97YsgU7g8zck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723560891; c=relaxed/simple;
	bh=JIgriQZEgf5wlFHZWjau2AVbUAOuWzYAULBSmHIlCV4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgFH1U6Reb/bGFb7xtuuJOpSCso70fZAcunCw7heoWvD5zjVTQzOMq1C9ZkE8VDPQI2GDgGWQv3taiRVDssjElhoijxJh7ekXU/33B0RdFCXpP3ra1MEURWhdoLHp184Vxp7MzYDKhs1/SDzC9F/XA25VKwCOrIF/O79oQUDOrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us; spf=pass smtp.mailfrom=n0nb.us; dkim=pass (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b=NCizkQTb; arc=none smtp.client-ip=72.52.250.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=n0nb.us
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
	s=default; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=H3ze/Q9erJeziQnEcAmEnRf/2gHvm9yHUieTWg6hIoE=; b=NCizkQTb2Uddm5ZrP+ci/ddfMs
	xcIJ+jQG+qChr3RxJTD+AkyHzGJftV2pIXxWPMSVWSpvvQwSqadTsvUdUnTYbnkuuMTJbfX+rXE8b
	fhRARQgVu5ezg0UGO7CaAHODcBuM4/bcKwCspybA87fHv8JvnqZnpaLxlE8ppKPuXknfbnFVl3g5j
	ljgbR/8iIswO4nmrCwcNaCR1NZZSgbmBlWDBOMpH5X/AqbQ2GaMV507yr+mN0dnaMFfEW7kih4n82
	Qhe7DOMLU4/f0+6LGcz9uM66w7bEBfdpxGmlIShfywZ/tluaZQC0884NFfGaWal0GQLGXS3SQXtMu
	Qto9GJ/Q==;
Received: from [68.234.117.148] (port=42930 helo=merlin)
	by www11.qth.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <n0nb@n0nb.us>)
	id 1sdsYr-00000000gHo-0wr0
	for linux-hams@vger.kernel.org;
	Tue, 13 Aug 2024 09:31:41 -0500
Received: from nate by merlin with local (Exim 4.96)
	(envelope-from <n0nb@n0nb.us>)
	id 1sdsYm-00FsxM-1g
	for linux-hams@vger.kernel.org;
	Tue, 13 Aug 2024 09:31:40 -0500
Date: Tue, 13 Aug 2024 09:31:40 -0500
From: Nate Bargmann <n0nb@n0nb.us>
To: linux-hams@vger.kernel.org
Subject: Re: source-code aprs
Message-ID: <20240813143140.qitu4e73kuga4gv7@n0nb.us>
Mail-Followup-To: linux-hams@vger.kernel.org
X-Operating-System: Linux 6.1.0-23-amd64 x86_64
Organization: Amateur Radio!
References: <0ea34aa4-d9cd-4c0e-9115-c8e68f02eae5@skypro.be>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fthmcxhiayuzxz6a"
Content-Disposition: inline
In-Reply-To: <0ea34aa4-d9cd-4c0e-9115-c8e68f02eae5@skypro.be>
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


--fthmcxhiayuzxz6a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Direwolf comes to mind as one such project: https://github.com/wb2osz/direw=
olf

Another is APRX:  https://github.com/PhirePhly/aprx

Both are primarily written in C.

73, Nate

--=20
"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."
Web: https://www.n0nb.us
Projects: https://github.com/N0NB
GPG fingerprint: 82D6 4F6B 0E67 CD41 F689 BBA6 FB2C 5130 D55A 8819


--fthmcxhiayuzxz6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSC1k9rDmfNQfaJu6b7LFEw1VqIGQUCZrtuSAAKCRD7LFEw1VqI
GVvWAJ95QgFjChDPmPPn+O7ADlCOPv/20gCfbngKF3bHBdg4bj+xXqmZzaQN/fQ=
=Fk0P
-----END PGP SIGNATURE-----

--fthmcxhiayuzxz6a--

