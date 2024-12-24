Return-Path: <linux-hams+bounces-455-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 331639FC10C
	for <lists+linux-hams@lfdr.de>; Tue, 24 Dec 2024 18:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA02D164FDD
	for <lists+linux-hams@lfdr.de>; Tue, 24 Dec 2024 17:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD7E212B22;
	Tue, 24 Dec 2024 17:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b="W6pSFEi7"
X-Original-To: linux-hams@vger.kernel.org
Received: from www11.qth.com (www11.qth.com [72.52.250.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C059A26ACB
	for <linux-hams@vger.kernel.org>; Tue, 24 Dec 2024 17:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.52.250.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735062033; cv=none; b=WDmbvvpxAzxpKgBRBr/LV6emS+mznfPZk685oXgVwrhry6YqZ0Uz6hwaFWLD39arWS5zocLe7ue5BOOUX2ilSQ9KgH59p0kLuDI23GCaSPJ9uT+UepizpD24xYFgA9ZFaJbC66bn7oMBKXGKURWsJUT91En8cJGIzreLrURE9Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735062033; c=relaxed/simple;
	bh=JQZwjXrT5iXVhyUhgvub4Zm+GzxZFP6HtgBIMfTxeGc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q6r2/ffHpsAVVuodOPSB59BLIHXhWUx2S31uBFVi5n0FWcBaJB+vEhBzIK3okFkRCtf7Zymi6GpLjDYqu/pOxSuPGMK7FeZV+4EA5UMDpZluFLXDgu9Rgp+1F3O9D1GD1Y8FAWGGTQzDg8h8kVRXWT9Q+5IgycyqOR9trXwoZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us; spf=pass smtp.mailfrom=n0nb.us; dkim=pass (2048-bit key) header.d=n0nb.us header.i=@n0nb.us header.b=W6pSFEi7; arc=none smtp.client-ip=72.52.250.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=n0nb.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=n0nb.us
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
	s=default; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender
	:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bdcGKcCfbt+ysoenIpfv3lqgT88w9c7VeTOYJi7svGY=; b=W6pSFEi7xo83130gC2YgUVfBBO
	0phpEusXc7qbexcnBLWgcaLqCkOlsAIyC7KS5bk1txunm7JgpPytB+KWlsLIAw5nJi6TdjXsGdHRG
	kwUzSQUM9Z/CkFr8WV2DUxoj91eq0+/9ICNgwkBQWUfZicRRozK0N5VYe/56DHJwgNRssYguwYmxP
	ehGzAmzSFrRbbZPoZ+ML1sOCoM2KlxtrvG2kL0J0q+paogR6fLhtT0pwxUojDcxf4pFNn4eEez29A
	TWwLr3j/CQzQWa3P1Nysd36U+WHnSoaI+iSjqUQQn5mh6/gbR12GTgxs3GzRCxgeluieN9nI/HNgx
	NqblZooA==;
Received: from [68.234.117.148] (port=36706 helo=merlin)
	by www11.qth.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <n0nb@n0nb.us>)
	id 1tQ8d9-00000005ZHc-0HII
	for linux-hams@vger.kernel.org;
	Tue, 24 Dec 2024 11:23:38 -0600
Received: from nate by merlin with local (Exim 4.96)
	(envelope-from <n0nb@n0nb.us>)
	id 1tQ8d7-00HVS6-2M
	for linux-hams@vger.kernel.org;
	Tue, 24 Dec 2024 11:23:37 -0600
Date: Tue, 24 Dec 2024 11:23:37 -0600
From: Nate Bargmann <n0nb@n0nb.us>
To: Linux Hams <linux-hams@vger.kernel.org>
Subject: Hamlib 4.6 released
Message-ID: <d2235pqajgrifqamvmuseyt5jtx2z3ecw7hwevpf6pg6xkbmup@7y5fir2yit4w>
Mail-Followup-To: Linux Hams <linux-hams@vger.kernel.org>
X-Operating-System: Linux 6.1.0-28-amd64 x86_64
Organization: Amateur Radio!
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bybver7qcljy7awc"
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


--bybver7qcljy7awc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Hamlib 4.6 released
MIME-Version: 1.0

Hi All.

This morning I released Hamlib 4.6.

The tarball can be downloaded from:

https://sourceforge.net/projects/hamlib/files/hamlib/4.6/

or:

https://github.com/Hamlib/Hamlib/releases/tag/4.6

73, Nate

--=20
"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."
Web: https://www.n0nb.us
Projects: https://github.com/N0NB
GPG fingerprint: 82D6 4F6B 0E67 CD41 F689 BBA6 FB2C 5130 D55A 8819


--bybver7qcljy7awc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSC1k9rDmfNQfaJu6b7LFEw1VqIGQUCZ2ruGQAKCRD7LFEw1VqI
GVx0AKCI1pEEX/KbVSj0+v/kYl66y7lUcACcDWxcEvG96Z1JMm4DIxjo2pk4pno=
=9F5B
-----END PGP SIGNATURE-----

--bybver7qcljy7awc--

