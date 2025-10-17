Return-Path: <linux-hams+bounces-650-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B66BE8BA9
	for <lists+linux-hams@lfdr.de>; Fri, 17 Oct 2025 15:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B764A3A4F04
	for <lists+linux-hams@lfdr.de>; Fri, 17 Oct 2025 13:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979BD343210;
	Fri, 17 Oct 2025 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b="lq6gbyj8"
X-Original-To: linux-hams@vger.kernel.org
Received: from manage.vyzra.com (unknown [104.128.60.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE48331A61
	for <linux-hams@vger.kernel.org>; Fri, 17 Oct 2025 13:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.128.60.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706309; cv=none; b=KrV+j3GPO2qvOtrIft8k8iG47bBZD74XqTD3bqVn3mpj7BpY/4UsPRtJD8zO5VW1/w5rtgFD3Z5OgD2nkHJddGYl51FdFfnwyoTnpAgGn2D4ywyK15z0NVzhJ6a32MjD7fywrdar/l69HpLYxnMmN3hNIxOPP2oBo/OwwANzvb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706309; c=relaxed/simple;
	bh=biLnUx9jTTyVdIbdiavoTAgEZeIqqOihfb373MH/e18=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YiJg1M4Tg/DaSWraeU39yX2WWz0Md/6B21p1NZPduC4sFCVOYy4vn/oyCUbIcDQcSNSTDSJFdK2aaBJkZ+L0Go6UFLelUGFMSq6ezPUxPMyBjXPX9r7TvJV4aMkA8gkK/f4RM2Jxp++czvtuSZxTQ2nG5+c/tL96m4m0uqPULu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org; spf=none smtp.mailfrom=manage.vyzra.com; dkim=fail (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b=lq6gbyj8 reason="key not found in DNS"; arc=none smtp.client-ip=104.128.60.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=manage.vyzra.com
Received: from debtmanager.org (unknown [103.237.86.103])
	by manage.vyzra.com (Postfix) with ESMTPA id BB0034A8F6F8
	for <linux-hams@vger.kernel.org>; Fri, 17 Oct 2025 07:45:32 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=debtmanager.org;
	s=DKIM2021; t=1760705133; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=Aj8bDacQlJB5qNMC5+yWWged1+K/M8YReXQkzUminbQ=;
	b=lq6gbyj8nxJq8BnrweuT6uEkbVRetX7VmHpisMKUY/Biy+lOqktWplP8bceyk2icdlgXug
	wjNFmatwjbhESjIhR1x3QzU49oqSAJT6SCGDqG9WlDQjnAE975pOPShFFQPDM9HpLfIsDt
	NlWhKUnHrwkHcwNj8a22qrA4VsjLriZlU8Hu7iphqSmkGfgCwW6WoaRKN334fiCJdeRKdc
	pD1HqTYbM++R6F+IDJ/kOwU38moGpFxPvFG+H9urfpqoZMs4L9+fnylxLnpwZPrirKX+9Y
	7HHILUM9eEFpCvXMCQRvqA3pkXQazliDPaoY622a/rRxSTiOuVGw8A92AnjfZQ==
Reply-To: vlad.dinu@rdslink.ro
From: "Vlad Dinu" <info@debtmanager.org>
To: linux-hams@vger.kernel.org
Subject: *** Urgent Change ***
Date: 17 Oct 2025 05:45:32 -0700
Message-ID: <20251017054532.6A0A18394A0C24C6@debtmanager.org>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -0.10

Hello,

I am Vlad Dinu, the newly appointed Director of IMF Legal=20
Affairs, Security and Investigation. I have been given the=20
responsibility to look into all the payments that are still=20
pending and owed to fund beneficiaries / scam victims worldwide.

This action was taken because there have been issues with some=20
banks not being able to send or release money to the correct=20
beneficiary accounts. We have found out that some directors in=20
different organizations are moving pending funds to their own=20
chosen accounts instead of where they should go.

During my investigation, I discovered that an account was=20
reported to redirect your funds to a bank in Sweden.
The details of that account are provided below. I would like you=20
to confirm if you are aware of this new information, as we are=20
now planning to send the payment to the account mentioned.

NAME OF BENEFICIARY: ERIK KASPERSSON
BANK NAME: SWEDBANK AB
ADDRESS: REPSLAGAREGATAN 23A, 582 22 LINK=C3=96PING, SWEDEN
SWIFT CODE: SWEDSESS
ACCOUNT NUMBER: 84806-31282205


A payment instruction has been issued by the Department of=20
Treasury for an immediate release of your payment to the bank=20
account above without further prejudice. We cannot approve or=20
schedule payment to the 

given bank account without your confirmation. May we proceed with=20
the transfer to the Beneficiary: Erik Kaspersson, bank account in=20
Sweden?

I await your urgent response.

Mr. Vlad Dinu.

