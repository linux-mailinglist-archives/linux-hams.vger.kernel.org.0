Return-Path: <linux-hams+bounces-335-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DD48D0246
	for <lists+linux-hams@lfdr.de>; Mon, 27 May 2024 15:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 844C91C214EF
	for <lists+linux-hams@lfdr.de>; Mon, 27 May 2024 13:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F2C15EFA7;
	Mon, 27 May 2024 13:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="KTUzP/4J"
X-Original-To: linux-hams@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866001640B
	for <linux-hams@vger.kernel.org>; Mon, 27 May 2024 13:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716818283; cv=none; b=YBgwe9be6nKCQbrkoXS9wRr5tGD5k+MpXSvUf+8X3oZkLhCJ1uRKdzbk5R0s88wxjPnGOysBu4A84KrsjMI1EDVBJ0eW/RUehrRO6Bwzr1mCoxILLaCMzSa3XnLhxdMvjt8yJjmpcq5ZXkCmyLB1uLmS1lyRg1Vm0lqNPOxdVkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716818283; c=relaxed/simple;
	bh=ls5FQ0pMMMNynB6gGOstfj3kn9x4lqCFeM2nDGaAk7g=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=MF79vdB/+i3WnOMc3du5go3F5rJBLdxWez+ghrSq/zKTWwQ1gjsebkLYrwTEKM6VLR3TNxDPpFSelEAqHNhS//67Y3AO72NHcYOh7trVqBAPrT9sGfYSv/ZCaaS306F1je6E8c/8W+leMNVaRqY1eePb4UZ6RTDunHpSDPLQpuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=KTUzP/4J; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:Subject:To:From:Date:References:In-Reply-To:Message-Id:MIME-Version:Reply-To
	:Cc:Content-ID:Content-Description;
	bh=qKIWk7E0UCo+BdBQlRVvwAryvd0SEMQRW6GeEIfPJq8=; b=KTUzP/4JXSnddYc+1buT1ZPFvn
	frF7NFNdob0uY63pyKAIL8z1cktWsmRgq+qf39Zrji3Te5ewKLbP9MkIqtHClMJrxww3VUuDBHu0d
	THxTXAXdzu8DOs6do8oqILiLrZlVgDU0P1VJ+dgC2RT6rLtrn2+rnIRei3l/WUjmiwKUWc1VArsxD
	2qjwTGPY8qGB2p6PgnvAZfvEFxbdexYzqzLE+027pF4svrm7VtgPSElUdXE04++NHn0NnukGryba9
	4OVDPreoFOFQRCH8vMzIXLzqCls714nE6aXZACakxF9FtE9Xxtxf0rx0e/cZbcprevVTXNFCsJ7qI
	ocZzUR5g==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <hibby@debian.org>)
	id 1sBarJ-000bPW-1b
	for linux-hams@vger.kernel.org; Mon, 27 May 2024 13:57:53 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 04BF31200066
	for <linux-hams@vger.kernel.org>; Mon, 27 May 2024 09:57:50 -0400 (EDT)
Received: from imap53 ([10.202.2.103])
  by compute1.internal (MEProxy); Mon, 27 May 2024 09:57:51 -0400
X-ME-Sender: <xms:XpFUZsB_KSnYWhF0p-d7GPng6vLgDxnP4NRan6UCqoEA4PG94rFf4Q>
    <xme:XpFUZugAaFxfDSyUxf4CkCtzO72PpkBxD2cCeqNbdAKYYX-kayTimWosEUOuaFXGN
    cVFsdIFXbDYwIdcRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgoufhushhpvggtthffohhmrghinhculdegledmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedfffgr
    vhgvucfjihgssggvrhgufdcuoehhihgssgihseguvggsihgrnhdrohhrgheqnecuggftrf
    grthhtvghrnhepfefflefgudfftdehkeefffeuieejffffhfeuteffjefhgedvffevfeek
    tddvgeevnecuffhomhgrihhnpehgihhthhhusgdrihhonecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepugdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqudeghedtudehvdejvddqudeifeefleefkeehqdhhihgssgihpeepug
    gvsghirghnrdhorhhgsehvvghhihgssggvrhgurdgtohhm
X-ME-Proxy: <xmx:XpFUZvkqWcaQofb2p6Hb1qz356GhrJcf3y-Fi0sSTqpwnDHTzGgDfw>
    <xmx:XpFUZixuAmGKdXzLtY4ChtmciraxYzRFGG2RI-SIUFYEbMzzStxoKA>
    <xmx:XpFUZhQ12HG2LO6A_KIxGS6CLEGIDVlvmJHrITdm3WXgdp2zyzAPmA>
    <xmx:XpFUZtYtFYBl4M2ax-XBwd9mXVbQ8vwNZPSEzi7PX7_V6nCSA8PilA>
    <xmx:XpFUZqRZGNjXsTmdhGAgeAvRjUaQxCRJ-yorYiXJ3euDgG2XUKhExcqt>
Feedback-ID: if431490a:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B444B364006F; Mon, 27 May 2024 09:57:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <22ac3e39-191c-4b92-a72c-0802a301bef7@app.fastmail.com>
In-Reply-To: 
 <CANnsUMH9Of7q4NyTnWPE6e-XdezTTxiQeRVDPWzofW82Smj+zg@mail.gmail.com>
References: 
 <CANnsUMGJvG6Cs57_ar-iixCpyRKq_ScMZFNaq-SpdHX53ou6fQ@mail.gmail.com>
 <CANnsUMFWHd1kvbDubMnX4aS9La=0EpiCzee7NDNqkCMUwLXPaw@mail.gmail.com>
 <5d40d8ee-e4e6-41cb-a8d7-b2590b549494@moroto.mountain>
 <CANnsUMH9Of7q4NyTnWPE6e-XdezTTxiQeRVDPWzofW82Smj+zg@mail.gmail.com>
Date: Mon, 27 May 2024 14:57:30 +0100
From: "Dave Hibberd" <hibby@debian.org>
To: linux-hams@vger.kernel.org
Subject: Re: Mainline Kernel Question
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Debian-User: hibby

I will update my private repo[1] to include kernels for users of Debian =
Testing, Stable, Ubuntu 22.04 and 24.04 and set up another RF node near =
me to get my own in-person testing running too.

I can also support raspberry pi but I have found building and distriutin=
g kernels for that platform particularly challenging!

Cheers,
Hibby

[1]  https://online-amateur-radio-club-m0ouk.github.io/oarc-packages/

--=20
  Hibby
  Debian Developer
  Packet Radioist
  MM0RFN

On Mon, 27 May 2024, at 2:30 PM, Chris Maness wrote:
> I would be happy to.  I already have the system for it.
>
> On Mon, May 27, 2024 at 2:30=E2=80=AFAM Dan Carpenter <dan.carpenter@l=
inaro.org> wrote:
>
>
> --=20
> Thanks,
> Chris Maness

