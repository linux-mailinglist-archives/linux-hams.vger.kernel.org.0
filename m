Return-Path: <linux-hams+bounces-294-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 829508CB426
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 21:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3C2F1C227A9
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 19:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853C31482ED;
	Tue, 21 May 2024 19:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=elite.uk.com header.i=@elite.uk.com header.b="DeFfLBsF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FvBYzyFt"
X-Original-To: linux-hams@vger.kernel.org
Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BB714883E
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 19:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716319248; cv=none; b=tbA8kQYnTBJth1sWyNeJjOq1JBG3/Qd7KLHTotFZEvXz0osECBtjWFbSm4wHGLMvtazpfqd5KvPjt2CJ7VC/xEbooznpr7THBDamafH+tRYRFJ/POjuRiiimFvojbemf/hRGueFEOgE/rhWQkjIvAKJXifBPV5VS0C/2NUIrZEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716319248; c=relaxed/simple;
	bh=YCFyATdwsQd6Wpk4eayNDlG/hUh1ad9D3nN/Gl9Pehc=;
	h=From:Content-Type:Mime-Version:Subject:Date:References:To:
	 In-Reply-To:Message-Id; b=McWplEMqjPYG8EEfn2oGs4OxyttwKFNtJdOeLZmAkwtkBJzSiLByK5M9MIiy4iA1xbZoygvGUVzt+HTr975sCCIN/fiDn4PHNt6E8uIgWLHbsXNJ8nDdXgw470DpfTqJnRZ5fvgdhpYrz49ADFpGlqmGhh+llUzio60tffVBU6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=elite.uk.com; spf=pass smtp.mailfrom=elite.uk.com; dkim=pass (2048-bit key) header.d=elite.uk.com header.i=@elite.uk.com header.b=DeFfLBsF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FvBYzyFt; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=elite.uk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=elite.uk.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id 12F6A1800188
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 15:20:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 21 May 2024 15:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elite.uk.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1716319244;
	 x=1716405644; bh=TIFl1AkLrwBI3y1fLTOpvo+Kk/x/RkEwU64ED1Ay5Qw=; b=
	DeFfLBsF+7W6ay2uymzvz+Q58Swlh4RGeky/7lUrGlbUNz2+PCFqO6W4K4Ow5oRF
	AOSlVDUPuIMosCwi3e3Xf6j077MEJMQLXxxafzvqvSpMHTpyhzrt3112yLvLjXxP
	ZArdharwYL9OuwNDxv7zzpeiYWOS6gjt8DuXxS1YS6UpL01BtWZ8X7Qbw7vPRKkw
	9w/NZBSsKAO0eeVYQxGw9q7I5ZDT/5p9fk1lsUCxaQ01/5UmBo18eVMBWxSEusIY
	96ZEXf0yDyPXh/1lRiq5Zaa9aNA4d3ESz5SkbRHtbZMHszNMEhAfhXgu6hF+fnOG
	GHz44Si6GFcosw99idEwjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716319244; x=
	1716405644; bh=TIFl1AkLrwBI3y1fLTOpvo+Kk/x/RkEwU64ED1Ay5Qw=; b=F
	vBYzyFtHtji6DrV6pWgx+w2dFuYMJ3x3snHwoatrKH/cRha4k5mPjxGvHpHJhDjr
	gvvTBceNhUatUjZYmq6MV/HicNEYdu4fXXzAMRsV6g0qoJ+JfwtO8fJzfaoFgiXx
	oStTd59AvGleeCO5rtdvRCIh3bGINS59pO5hdeD4Fs1HgWYDkPb7sSlaKfouyopw
	KNFIKTmXwUZ1L/SVKCq6ASdweaXdEjWKLr4Zy9nErfsXnP3/3oIvCvJQUN4fNwVo
	Uw7JYQ0/c4RMe7AThUF+Xbnl4SmjbsKPffj6iyPG8fBvaK+3Kn6I4Y2GlwOK/6mp
	L04arx3Bwy79y5jO/WH0A==
X-ME-Sender: <xms:DPRMZmUSw2jB6NWXYiuao9AbCHcpXrcWbjvsec8Wds8lL7Yq4OOy1A>
    <xme:DPRMZimvp7A3i3JixFt1JQkMsmNqEoIVM_dH3pI92HUmDgeDnRKTPZk9Bub7NYTjU
    85OkAIwoC_ZxukRtAc>
X-ME-Received: <xmr:DPRMZqbC8N1prQvzjly5TY7FRxXo7lJxBEkO1RLam-mWwxHg7RsbHuJxl8FwN1XDtB89XT7WTfD8VZJWg0TyNUy494I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeivddgudefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephfgtgfgguffffhfvjgfkofesth
    hqmhdthhdtjeenucfhrhhomhepofhikhgvucfsuhhinhcuoehmihhkvgesvghlihhtvgdr
    uhhkrdgtohhmqeenucggtffrrghtthgvrhhnpeettdefieeuieekkeejhfeffeetvddtve
    ekheeguedvffdukeefieelieefffegtdenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehmihhkvgesvghlihhtvgdruhhkrdgtohhm
X-ME-Proxy: <xmx:DPRMZtVwT3jiKbSXChzk8X7OI8H1oxBCplz2sSJfQP15yCiQoDgHkw>
    <xmx:DPRMZgkt0o-BI9kHN_95kwPQEDexSfcEdYu0qWOGAxz3UiupVgzafQ>
    <xmx:DPRMZiffJeRZqqO1PEBV_rULBljAlco_0kiTpzUGKJaBPSDxV3m4Bg>
    <xmx:DPRMZiGfLicyjoBg_K6O5gnXY9I2J2J008MEgwOUTZE6yxd6GmsGhA>
    <xmx:DPRMZsvhcY7jKLhXbZ-uNgNIWSnbOET7b7TsvSbTfSXhaMPgJe1EorhW>
Feedback-ID: i55a1499f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-hams@vger.kernel.org>; Tue, 21 May 2024 15:20:44 -0400 (EDT)
From: Mike Quin <mike@elite.uk.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: Kernel 6.9.1 AX.25 Crash
Date: Tue, 21 May 2024 20:20:32 +0100
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
To: linux-hams@vger.kernel.org
In-Reply-To: <CANnsUMGf744psJZCqKoKw4ysRuH4KjhTpjR1CZZNbPr2DPQ99g@mail.gmail.com>
Message-Id: <0CF70E80-C650-469D-B52D-436EC16BCBE3@elite.uk.com>
X-Mailer: Apple Mail (2.3774.600.62)



> On 21 May 2024, at 13:03, Chris Maness <christopher.maness@gmail.com> =
wrote:
>=20
> netrom_call has not worked for ages.  I am using VE7FET's forked
> userspace, not the official.  I could build another
> system with the official userspace I suppose.  My understanding is
> that VE7FET fixed some bugs, and I have had
> better luck with it for the most part.

I=E2=80=99ve found axcall (as opposed to ax25_call, netrom_call etc) as =
shipped by Debian works fine for making netrom connections.

To echo other comments in the thread, thanks to the folks working on =
this. I=E2=80=99m one of a number of amateurs who=E2=80=99ve taken a =
recent interest in packet and I=E2=80=99ve love to make more use of =
Linux for it.


