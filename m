Return-Path: <linux-hams+bounces-296-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DD78CB646
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 01:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D04CE1C20BD9
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 23:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689C614430B;
	Tue, 21 May 2024 23:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=elite.uk.com header.i=@elite.uk.com header.b="Caq6btGs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fDhK9mL+"
X-Original-To: linux-hams@vger.kernel.org
Received: from wfhigh5-smtp.messagingengine.com (wfhigh5-smtp.messagingengine.com [64.147.123.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB956BFD5
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 23:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716332851; cv=none; b=tlA5mMS5961nCTxhxT3hq7EnEGawBjMqGGKishToddAsN5RivyI3pcBQD1ilfT5TdSE1L2anKGXnP1v2bPHEwVzAPhHHlw+KS/wP795hbsbGBBcJ04GI3enn46JoJx7AT71U60tftjUj0iN0p2fFH/0YbXMKO26EqiA/aKp+Xvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716332851; c=relaxed/simple;
	bh=S8JYKztMjBRGodOBEEilmdgDz9VJAHEA9/Kwy4ksn5w=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=of6imfeK6t2Z5xHAAEcxJc7P+bYjdBXxpMo+z9Qo3MUDH7QmoKuVgVc+rlBksum4Y38os0IiCAV+kbOUrOXlQZiHECm0tVlkOTFPmvuAvfEoa5tchTG4/7jle9gKTntlMAoXopxApeI5XbO1V4zcu6M/awc65FebWBFobQObH3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=elite.uk.com; spf=pass smtp.mailfrom=elite.uk.com; dkim=pass (2048-bit key) header.d=elite.uk.com header.i=@elite.uk.com header.b=Caq6btGs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fDhK9mL+; arc=none smtp.client-ip=64.147.123.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=elite.uk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=elite.uk.com
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.west.internal (Postfix) with ESMTP id C87E21800128;
	Tue, 21 May 2024 19:07:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Tue, 21 May 2024 19:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elite.uk.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1716332847;
	 x=1716419247; bh=rJinv/cP8PuI6ybVpqcVW4yS0/JgRqNQ2DLBtpbCZcg=; b=
	Caq6btGsYQKPEibGw3nEAu8xfqtppNUQIrb3WJ8oUFvda2m8UyRCWA5c7vrX6gvx
	NVyKRM3Hl2jOHFZUVMey93qsp8wn94H7fWdP9VoBp/HW/EtjNizUyFnI4k2m5g4e
	oElLJxDZ4ef+FwpErP/99wSb4e1aWTcvGe4ImkfV3Ve9BdkQ4SngL3gIjBYl1Q7t
	rhgwkAswU6qoeF4Lh4KxvktRCjjnb3Yw/EQYHicOYJjlBUtLcgbU2/YqUXYHoOWV
	GTCmyY/j9EKS82Fv27FDzPSsylDdpNrXEZtTbDPxQsaWsb2qq4KnwdUMnf9xEQ8L
	4n00UPaOyXBySnksgC41Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716332847; x=
	1716419247; bh=rJinv/cP8PuI6ybVpqcVW4yS0/JgRqNQ2DLBtpbCZcg=; b=f
	DhK9mL+69QzWvcIxrauHcvsHtdG4gCaIqLOgDwBJvYm+zYgHpZoGTKevlcvcNa5L
	kY1G2bI2yz57z8AyF3pQ5/nRF9nRg6uCGCe53NY1nAos9xrypxa6ZNzzNWO/HOIG
	j/e5eEecRWGjL6J0h5Lf7yRb8KDlU1lF4z6S3JbdxmGfOd2eiAOgRUIJuqQWs1lg
	/kF0dfyHUQWFsJLkI4CU25yzTs5v7y0896I38pjh9gHcfP1KDYEXnOEjKFG6XZtZ
	LpiKHzQ7JeRtWwNgAxn1hcO1601mzlYriczWuf/JfqH9pgsuPGgBHeNMAkh2Z/di
	2bSNquCbJf8L5JryXFv2w==
X-ME-Sender: <xms:LylNZkYmg05ZzSwd9U54CFpKmKPPlxQ0saDBN9jIF-_Z_mO-joO5fQ>
    <xme:LylNZvZLuIaXs9b-Fm-59QIqJZ_hY2OBBLLv_CXyaAlJ3PqaV3Skj3g3l__T3ih1Q
    pM2JzIdJhdVp7FDv7g>
X-ME-Received: <xmr:LylNZu-z30IqtLNyYuCZTWiCuPpOf2gOPr0MrkLkqfeki3tVWVyW7vciFxUMLAJ_4YxGqUK_05B15TOXZ2lQ39p6GZo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeifedgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpefoihhk
    vgcusfhuihhnuceomhhikhgvsegvlhhithgvrdhukhdrtghomheqnecuggftrfgrthhtvg
    hrnhepgffffeefuddtvdfhleeivdetveethefgheffveejveefgeelvdegjeelgfetueff
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhikh
    gvsegvlhhithgvrdhukhdrtghomh
X-ME-Proxy: <xmx:LylNZurCH9zrXaPgTQwEPfoS7kZzSHe5B4w1qYCknA95ZI4wR50QrA>
    <xmx:LylNZvr9nxqRz2_H8Rik8VFyv-R2b7nn0MrBedpaiK5K2ixLwTJdAg>
    <xmx:LylNZsRbrIOn0Xs_huHKBq2fbUlhW_Nc_Y85CedKhVUx7McUPFR-_g>
    <xmx:LylNZvq7Iu5KA0j5IYD9u7_CpjE-8vqW55_zMLvnbxU9JhlGTlbmQQ>
    <xmx:LylNZm0QS4WowTgF5tCZsGBPdBM-4Asw96sD8V0pFMmeQcPQOBT61SDg>
Feedback-ID: i55a1499f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 May 2024 19:07:26 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: Kernel 6.9.1 AX.25 Crash
From: Mike Quin <mike@elite.uk.com>
In-Reply-To: <CANnsUMEUnWLnRgJv-xQeP184TTKmMS0-mnKXp+uEgoj4cf_E8w@mail.gmail.com>
Date: Wed, 22 May 2024 00:07:15 +0100
Cc: linux-hams@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D0567111-9B53-44C2-B6F9-195C33BE7ED9@elite.uk.com>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn>
 <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
 <CAEoi9W7LN5MQPGKXZJOdtcaXvyK4PPU9yW7HWOBdq1AP3Fs7nA@mail.gmail.com>
 <CANnsUMF=ywvcmfLjXdz_hWLSo5jC2Z0K7Qe4Pcv7j3dr6K99Jg@mail.gmail.com>
 <a0890c99-0f42-44bb-b1f3-cdc66efdad50@app.fastmail.com>
 <CANnsUMGf744psJZCqKoKw4ysRuH4KjhTpjR1CZZNbPr2DPQ99g@mail.gmail.com>
 <0CF70E80-C650-469D-B52D-436EC16BCBE3@elite.uk.com>
 <CANnsUMEUnWLnRgJv-xQeP184TTKmMS0-mnKXp+uEgoj4cf_E8w@mail.gmail.com>
To: Chris Maness <christopher.maness@gmail.com>
X-Mailer: Apple Mail (2.3774.600.62)



> On 22 May 2024, at 00:02, Chris Maness <christopher.maness@gmail.com> =
wrote:
>=20
> My test bed is Slackware-current because it has the latest kernel
> source built right in.  So I have to use either VE7FET's userspace, or
> the stock Linux-hams stuff as Slackware does not have a repository per
> se.  It is just all lumped together with no package dependency
> checking.  This is good and bad for somethings, but turns out to make
> it really easy to test sock code -- because it is all just the way it
> was written with very little system specific patches.  The kernel code
> has absolutely no distro specific modifications.
>=20
> So whatever aps come ax25-tools and ax25-apps is all I have.

Looks like it=E2=80=99s just called =E2=80=98call=E2=80=99 int the =
original ax25-apps.


