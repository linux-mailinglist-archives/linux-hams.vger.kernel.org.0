Return-Path: <linux-hams+bounces-368-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B26290A318
	for <lists+linux-hams@lfdr.de>; Mon, 17 Jun 2024 06:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFEA41F21D38
	for <lists+linux-hams@lfdr.de>; Mon, 17 Jun 2024 04:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99862161320;
	Mon, 17 Jun 2024 04:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="W/oJXc1z"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp124.ord1d.emailsrvr.com (smtp124.ord1d.emailsrvr.com [184.106.54.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8D2819
	for <linux-hams@vger.kernel.org>; Mon, 17 Jun 2024 04:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718599307; cv=none; b=uU98w5SQ9FyReUKyLXh6HZehZ7QmkOaTzrCLaLcNWrueBwDL4oT75ATA0jcE08NEwWxGx+872nuazUeLMvyDQ5KS0ZrSZVDFOhMGkZ53lv6dDOEmExfAZVK/cCuiUac7hxZaMGrPK8nhW80TgBig1ak0n+j5arpcYvnmXPuaWTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718599307; c=relaxed/simple;
	bh=OdvDZFrP3cD1rXPcUcaNGAOH28kXrgD8s50mGDHncm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOEVJnAyThubJ/Hp8zft8lrr5l+2PaZ+Nd4b4Im/ktpxmzWg6YjdLYmmLFBC6ajpEPi0Xglyl+SK2v+8fEN/IsgVISoyntH3TzAn7zzRmKRIs+tr6v52Cy2vWbrUveXr5QWwRLq34whN3fw1zrtaKSdkgu/qEJESkmH5evhGfpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=W/oJXc1z; arc=none smtp.client-ip=184.106.54.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1718594559;
	bh=OdvDZFrP3cD1rXPcUcaNGAOH28kXrgD8s50mGDHncm0=;
	h=Date:From:To:Subject:From;
	b=W/oJXc1z+PNrLkpZNEtL/QhUMyx7UipRmPFbcW77TbJAImT1HogeTnikuAmN0Tm0M
	 ZAtzbC5yhrbTkG+EGBaWZh3AjgDyedZS5fUk8soKYFaUaC8g/ozMYNMyakI5y7ntGd
	 YnI0QW6erkHhIGzyCTUnqANEG6P7P1l9QjiMjvC4=
X-Auth-ID: lars@oddbit.com
Received: by smtp8.relay.ord1d.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 1422EC0182;
	Sun, 16 Jun 2024 23:22:39 -0400 (EDT)
Date: Sun, 16 Jun 2024 23:22:38 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Chris Maness <christopher.maness@gmail.com>
Cc: linux-hams@vger.kernel.org
Subject: Re: Backports to Longterm Releases?
Message-ID: <6ibu2l5uqq5ifnpyeo3soos2y3yqihhd5hbm37fekvbw25yc7u@shkd7t5ttmlk>
References: <CANnsUMGvdJqDa8eJJP5mub-rxMK-wJDRPG=9VPmgBuTbf_S+pA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANnsUMGvdJqDa8eJJP5mub-rxMK-wJDRPG=9VPmgBuTbf_S+pA@mail.gmail.com>
X-Classification-ID: f0fe1a74-5781-418c-a6b6-743a4fa6ba82-1-1

On Mon, Jun 10, 2024 at 10:20:53PM GMT, Chris Maness wrote:
> I am wondering what needs to be done to get the code in 6.10
> backported to the longterm forks?  I tried just taking Lars' patch and
> applying it to 5.15.145, and failed to compile, so I am thinking there
> are a bunch of changes leading up to that that need to be applied.  I
> have no idea what tho.

I took a look at v5.19 and it seems to have a different set of problems.
Just running my standard test (create an ax25 listener, connect to it,
and power down), I see at least four kernel traces (and a bunch of
"reference already released" errors).

It looks like a different problem than what I fixed (although as before
most of the issues appear to be caused by reference counting problems)..

A solution would probably involve looking at all the patches impacting
net/ax25/ and drivers/net/hamradio/ and trying to apply them to 5.19 in
sequence, fixing conflicts as they arise.

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

