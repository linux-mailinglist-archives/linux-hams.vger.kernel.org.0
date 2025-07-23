Return-Path: <linux-hams+bounces-545-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED35FB0F45A
	for <lists+linux-hams@lfdr.de>; Wed, 23 Jul 2025 15:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60FCFAA2E8F
	for <lists+linux-hams@lfdr.de>; Wed, 23 Jul 2025 13:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994B42E7F1F;
	Wed, 23 Jul 2025 13:45:24 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CA02E88A5
	for <linux-hams@vger.kernel.org>; Wed, 23 Jul 2025 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753278324; cv=none; b=c8uB8XCG1YuumtfTM+CoxBs4SL2xs3+kN37J3Ty+XsX3i8YZloELYPyiSw6l8/wMSW4K/sYVKyNIWQC0nBfm7yXxGImM7XKeFW058L6am76jHMug5cGyKwIT9maMxH1lI8PhuLOX0MzufaqpGA33XGBU3jyzwVHpKP7NIwWw26k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753278324; c=relaxed/simple;
	bh=ipfyAy5qRr3WO8cAlAMPbwyFhX93HqNE0GpQ52Yt+fA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHv84HVwiXBA4d7uumOddspUs19jfjGfVdHkBtOg746T5jtySARyrIwLPq2mvSLCWvdYobE3ZT/DJo5LCa+2JI4jWblaJEv9F35OIgdNShIWrKfoMKGmJLoqr8j8tfgRdANIGQmTU7w4p8qSjMNWm7HWA59J9fsbmWa7Zk98gjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=df7cb.de; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=df7cb.de
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bnFkd0N2tz9thj;
	Wed, 23 Jul 2025 15:45:13 +0200 (CEST)
Date: Wed, 23 Jul 2025 15:45:12 +0200
From: Christoph Berg <myon@debian.org>
To: Linux Hams <linux-hams@vger.kernel.org>,
	Debian Hams <debian-hams@lists.debian.org>
Subject: Re: [Fwd: [Hamlib-developer] Hamlib 4.6.4 release]
Message-ID: <aIDnaMVGDXbSBuXV@msg.df7cb.de>
Mail-Followup-To: Christoph Berg <myon@debian.org>,
	Linux Hams <linux-hams@vger.kernel.org>,
	Debian Hams <debian-hams@lists.debian.org>
References: <qj6bm2dsvjdz3xmltjriyh4tikxqmzi2u6pdjuvargknrf6yia@bos2jhsa3qtg>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qj6bm2dsvjdz3xmltjriyh4tikxqmzi2u6pdjuvargknrf6yia@bos2jhsa3qtg>

Re: Nate Bargmann
> Realizing that today is Hamlib's 25th birthday, I thought it would be
> nice to just release 4.6.4 as a present to everyone!

Congrats :)

Debian upload is on the way.

Christoph

