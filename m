Return-Path: <linux-hams+bounces-350-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F978D5406
	for <lists+linux-hams@lfdr.de>; Thu, 30 May 2024 22:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E30411F24A09
	for <lists+linux-hams@lfdr.de>; Thu, 30 May 2024 20:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E2E17E442;
	Thu, 30 May 2024 20:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=elite.uk.com header.i=@elite.uk.com header.b="hslqOwFG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eeAQ66Uu"
X-Original-To: linux-hams@vger.kernel.org
Received: from wfout8-smtp.messagingengine.com (wfout8-smtp.messagingengine.com [64.147.123.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2140917D35E
	for <linux-hams@vger.kernel.org>; Thu, 30 May 2024 20:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717102271; cv=none; b=VRJLve3jytxvDTcmzU4k1fpc711Ro1WEa/K8uv3q19qbhIccl3pOGDJmD6Dc09HDmNIaFUZDA1iiCOJGxiUt0EjlpOOTDFC6c9YdrUQWzWWnM9duNxXrPWQ3uwyP/heENf334q1k8Tl0kRhEAu4OordjpFZKAP7IM209q8Of4L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717102271; c=relaxed/simple;
	bh=SgXIsh50+oIHqinbpwcTDvPskk+A2YpkLx4cMtbhU0k=;
	h=From:Content-Type:Mime-Version:Subject:Date:References:To:
	 In-Reply-To:Message-Id; b=FlCkB4sUPxMGmsPnFn8eAGCav0+tl5ZFEPdJYo4+ohZNT9NUZZ+knzeEKevVFnnM+pvlym61KeHRi9LyU864G7aohFeE3oha3hFLbmeBdlrCkpWWESmZB1CVI/C0Ai196aVugfgUrFcfl7tLTgYdAtwnlCM0dJDPpvV6Ba0OoRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=elite.uk.com; spf=pass smtp.mailfrom=elite.uk.com; dkim=pass (2048-bit key) header.d=elite.uk.com header.i=@elite.uk.com header.b=hslqOwFG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eeAQ66Uu; arc=none smtp.client-ip=64.147.123.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=elite.uk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=elite.uk.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.west.internal (Postfix) with ESMTP id 1F8661C00090
	for <linux-hams@vger.kernel.org>; Thu, 30 May 2024 16:51:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 30 May 2024 16:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elite.uk.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1717102267;
	 x=1717188667; bh=SgXIsh50+oIHqinbpwcTDvPskk+A2YpkLx4cMtbhU0k=; b=
	hslqOwFGMhpR0l8mMXFOOpwbxeoK/pRFvG22gIKLkrIVRoLNMNulTlO1rnpnjXeZ
	viERKdQiUKwDlkp+GmGSw9wyIKPiSLWs0pY96fgG7+DNU8SFVFUUd/xjxVpr2bSG
	nwjDXUBh7MwXOo31N5zznMx4w573Dbw3P1nApkpiEdGo8DTKJnhhgNyOK3t/ihnQ
	2uqWpRESLoV/Fs/E+AzF8xOHpt6ZDZeiG+kmd9R6i6MuTb5405W/IjvoeGvoQcCi
	G6Mx9ULr3oK+IGQX7D1hvrfQDF2ixYKRNzbM6OImT+d+Q8KQvdPUqfPoLtk22RTH
	bJdBgoikV3xrCO7/O9GjhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717102267; x=
	1717188667; bh=SgXIsh50+oIHqinbpwcTDvPskk+A2YpkLx4cMtbhU0k=; b=e
	eAQ66Uuw0mRDD+vOfhG6bE3xE4ovUUAh97mcjcbkokFxajTDGtPLcOHm+qWmI7k3
	mjfGHvVfsT0gg02hbZmOsk/xvye8dyIH9jGrFFSH7X2RRWrywzLF+OIBcHHGhCjK
	mKSrBjBNNomDncCokOHpigppuDIdMyrr8zCGNgoISnOssCW0c2D5aDHJK/b3uFaN
	moWZm3jYpAdM0dMSB5tc4KsY+AP9q+PaxyYUop+DuiWFJgXYiBN7EawAD/D2V9Lo
	5unyoyeS96vAjeMaXxi5QT0ViM0/dJmb/RVXYNuLd+50nfWXJlRoFj4fZwvPuzCl
	ZDz6MTmy9WT8Q7FxJO/hQ==
X-ME-Sender: <xms:u-ZYZgQ-zp7-jmsjvxLsRqZvqhto2Me1NWfsG8mYKigrRPBgqX4cJg>
    <xme:u-ZYZtwbLtUpE6Ipe6D5ggMYYbl2VtfUyHbRqSvKG8ypQE5Fd6VVW_y-9svlkZ8XB
    j5qenriE7n9cIjV0Rs>
X-ME-Received: <xmr:u-ZYZt3c2Z9X8ng9WBlBvig-3vNcXfIhoxvOTRXKtl2u1KYDRfDe-_pdHZnz560hlnMLPAIgHT-_dly06jCzlU1qAME>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekgedgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephfgtgfgguffffhfvjgfkofesth
    hqmhdthhdtjeenucfhrhhomhepofhikhgvucfsuhhinhcuoehmihhkvgesvghlihhtvgdr
    uhhkrdgtohhmqeenucggtffrrghtthgvrhhnpeettdefieeuieekkeejhfeffeetvddtve
    ekheeguedvffdukeefieelieefffegtdenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehmihhkvgesvghlihhtvgdruhhkrdgtohhm
X-ME-Proxy: <xmx:u-ZYZkAE0VJJWWX-PJ-gMeQKrc4neYwG-w83nm2ppk_w0coDR7b7ag>
    <xmx:u-ZYZpgTFLT6bWwrIowv0owcXjNPbAacrpJP94fXNcbplthsNiRISg>
    <xmx:u-ZYZgqELRd0tF_Rt9JKFu4v4eed4vbPmxPlFGTfQSY8ilqFYS1igQ>
    <xmx:u-ZYZsjF15oCWteUVOL101h1XcI9LnP8SOqnjxpNQ4L-A_f3uhUhPw>
    <xmx:u-ZYZpZXLPeD1BHXCSG42eSY1ZPowv9DqadeZNLSMhVsKgKEKlVC-tcT>
Feedback-ID: i55a1499f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-hams@vger.kernel.org>; Thu, 30 May 2024 16:51:07 -0400 (EDT)
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
Subject: Re: Kernel fails to flush queues when closing sockets
Date: Thu, 30 May 2024 21:50:55 +0100
References: <2qncrme5xuch2w2vzznk5eoiebdiiwcwck3dmxet73mzos7zh2@lgdxko4x5bsj>
To: linux-hams <linux-hams@vger.kernel.org>
In-Reply-To: <2qncrme5xuch2w2vzznk5eoiebdiiwcwck3dmxet73mzos7zh2@lgdxko4x5bsj>
Message-Id: <6B8661C5-4FC3-44DB-8B3B-AD1621091988@elite.uk.com>
X-Mailer: Apple Mail (2.3774.600.62)

I encountered similar issues running simple commands (such as fortune) =
from ax25d - it was necessary to add a "sleep 1=E2=80=9D to the end of =
the script to get any output at all.

=E2=80=94=20
Mike 2M0MQN


