Return-Path: <linux-hams+bounces-374-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C6B9161AB
	for <lists+linux-hams@lfdr.de>; Tue, 25 Jun 2024 10:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65484285CD9
	for <lists+linux-hams@lfdr.de>; Tue, 25 Jun 2024 08:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B0B148832;
	Tue, 25 Jun 2024 08:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="wauh6+LP"
X-Original-To: linux-hams@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07071474A0
	for <linux-hams@vger.kernel.org>; Tue, 25 Jun 2024 08:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719305509; cv=none; b=dWWIsorNi5XH+kJW9aA9HOa6SRRpUhIE2qzyqdAbRJT8EZVxbtvSIMbTiMfzXTe59dSBLhrXlCMtl+EkM/uZl14n4lVVfkDcvnu1Y3/FS2xv/IIZccDf0KD8MH3ab+/I0C4uQswiWNXcXc7VrEcSpw0dihyOTxz6Y8OjExS7z8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719305509; c=relaxed/simple;
	bh=R1nsQPu5v96ItcezZ1eX9oe6ClPrOneabe61Pbycyfk=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=NXRnsrdMSLto8tuq/GQBK+xEvV0lEkmBoqoftJnf8yGnNEitqbgrc+G4seYCaK9rzi75g7Q0hE7VpOx2IJ/D76E8bPYh0FHY2qmr2Qs9ljdOAnkwKQVY6tIFIDTuM0mrOgnyvvOQ6Aht5ywYSabBK/dqFwc4PViY436hQ2xKwSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=wauh6+LP; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Type:Subject:Cc:To:From:Date:
	References:In-Reply-To:Message-Id:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0Bjrm4+5ItstETSOpPsPL8YKIHdh9m/4ohAtiO+KIpQ=; b=wauh6+LPAbOsPramWd6qzmXsH2
	2Z2/Y0YjyzM/1GzckYa71FSx6QqTmO5wIo/tq2GYlHeuN2hm4DriBLQn4HIIr9H7zVz07FlNvnzm3
	LQZqDNE7vGwUlnqQ09FdGJdqlQycowa/3zJRDsX3tofL0/cO1iz3BZDws1bF5vJ/IoUipH9ocF+h5
	/cabVverG3+CTxWhxGwxsnKt78WxlaPqXxdS+qyTHl5WSLoJFHZxkK62dSNgm+Qxyz4r0MMafG6EW
	ATG8HT1injHtuKrut46PRlFtE2W0Y4eNr5IZH4wKL+n6PFPfCMoLqPVpSEjLPFtEcyP68YTBcSgQG
	vEdxDj0g==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <hibby@debian.org>)
	id 1sM1tf-001W7b-MN; Tue, 25 Jun 2024 08:51:28 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 418711200068;
	Tue, 25 Jun 2024 04:51:25 -0400 (EDT)
Received: from imap53 ([10.202.2.103])
  by compute1.internal (MEProxy); Tue, 25 Jun 2024 04:51:25 -0400
X-ME-Sender: <xms:DYV6ZsUeu0_VXMnzi53bYynKAXT6IfPFNUPrXqPXGo0sbaCPoDzciw>
    <xme:DYV6Zgk044uF_AFG9fuxJ5Q94lG9zk7ZbWw8v04iwc3JIQ-cv28ixYwbJkbH2-4E5
    RU1GFK0HCrpmbA_EA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeegfedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfffgr
    vhgvucfjihgssggvrhgufdcuoehhihgssgihseguvggsihgrnhdrohhrgheqnecuggftrf
    grthhtvghrnhepvdfhieduueeigedvueehfeevhffhffejgeehvdekkeettdehhfelhfeh
    hfdvieeknecuffhomhgrihhnpehgihhthhhusgdrtghomhdpuggvsghirghnrdhorhhgpd
    grlhgvjhgrnhgurhhoqdgtohhlohhmrghrrdgvshenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpeguodhmvghsmhhtphgruhhthhhpvghrshhonh
    grlhhithihqddugeehtdduhedvjedvqdduieeffeelfeekhedqhhhisggshieppeguvggs
    ihgrnhdrohhrghesvhgvhhhisggsvghrugdrtghomh
X-ME-Proxy: <xmx:DYV6ZgaWKW5ppilpVOZoRBcgQXnvhUii-fHtnoGszdIu0jCVrwnUxA>
    <xmx:DYV6ZrWw6QrTUJOGfr2InpQOIvjL_rEKQ1B4bwPvU4HBsBKAFiXaog>
    <xmx:DYV6ZmmfYrM6zQP8Q2xe7QWa7oijlEnG6sruV_9UxW2Cy7BUX2wOxg>
    <xmx:DYV6ZgfS6H9k16rl6WgVUtLqN-9HPL8b93JD7dAPoD4qxfR11nJ8ag>
    <xmx:DYV6ZoFI5cUxxHvBlhJzTuUxTxItmo18rTyJHCxku1zj-ZS05z_JGSin>
Feedback-ID: if431490a:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0195D3640070; Tue, 25 Jun 2024 04:51:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <916671b2-10a5-49f4-9a86-d2b31d5b961c@app.fastmail.com>
In-Reply-To: 
 <ai6stmqygczrav7dtojrxliexav24wi5qn324opvtgzengwb4a@jdbhx3lnaevu>
References: <ai6stmqygczrav7dtojrxliexav24wi5qn324opvtgzengwb4a@jdbhx3lnaevu>
Date: Tue, 25 Jun 2024 09:50:56 +0100
From: "Dave Hibberd" <hibby@debian.org>
To: "Alejandro Colomar" <alx@kernel.org>,
 "Joerg Reuter DL1BKE" <jreuter@poboxes.com>, linux-hams@vger.kernel.org
Cc: "Chris Hofstaedtler" <zeha@debian.org>
Subject: Re: remote login(1) (telnetd; innetgr(3))
Content-Type: text/plain
X-Debian-User: hibby

Hello, I mostly maintain ax25-tools in Debian, although got beaten to fixing this week's related bug!

Sadly a switch to SSH/something encrypted won't be possible in most regions - it's quite a common amateur radio regulatory requirement to only transmit cleartext data over the air.
I have experimented with the thought of a null cipher SSH in the past, but that's quite hard to do these days!

I'd be surprised if it was anyone's primary remote access tool - there might be some of the emergency response and similar communities using axspawn as a last line of protection. Radio amateurs have a fantastic skill of regularly surprising me!

Cheers,

-- 
  Hibby
  Debian Developer
  Packet Radioist
  MM0RFN

On Tue, 25 Jun 2024, at 9:09 AM, Alejandro Colomar wrote:
> Hi,
>
> We were discussing the possibility of removing support for remote login
> in shadow utils' login(1) via telnetd or similar; that is, remove the
> '-h' flag.
>
> <https://github.com/shadow-maint/shadow/pull/1022>
>
> And then Chris reported that ax25-tools uses that flag.
>
> <https://sources.debian.org/src/ax25-tools/0.0.10-rc5+git20230513+d3e6d4f-2/ax25/axspawn.c/?hl=64#L1837>
>
> Do you know if that code is actively used or if it's something from the
> past?  Would it be possible to switch to something secure like SSH, or
> is that not viable in the systems you use?
>
> Have a lovely day!
> Alex
>
> -- 
> <https://www.alejandro-colomar.es/>
>
> Attachments:
> * signature.asc

