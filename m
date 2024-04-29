Return-Path: <linux-hams+bounces-166-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A098B613F
	for <lists+linux-hams@lfdr.de>; Mon, 29 Apr 2024 20:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06D3DB20EBF
	for <lists+linux-hams@lfdr.de>; Mon, 29 Apr 2024 18:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8721350E3;
	Mon, 29 Apr 2024 18:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="IpWY+iVX"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp87.ord1d.emailsrvr.com (smtp87.ord1d.emailsrvr.com [184.106.54.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D24134725
	for <linux-hams@vger.kernel.org>; Mon, 29 Apr 2024 18:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714416107; cv=none; b=A6L02eBX5SfHM7AMGTVMaCskYqO5tY8ZDovhEA/wDbY1VAQo3z6wPaP5OYpTvqqQZK3uGm+EiqgmY99ASugXh8ET6qrOvSLcvWBZmUv5T6aH2Mkp1Dpu+/VLO+cuLHTLfFgSErlCjXarOWoRj657RPVsvgftLNuu9OJL6Fvd9GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714416107; c=relaxed/simple;
	bh=SCDbbo14IriVcLJFmm5bOPJ41dkjXf+yvfcH9ina2Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eql/LrZA+SmmRQ5iEIuZUAjndzTAputg7cTV9Tpbo87blPymk57a/w8h9X6qaVsJi3hl/V8sz5WMYUDFQqQNVClWFyGlylGqngcxEnvodPg+YFs8WbyToEaZsz0ay3UDuvNQGIrqXDGC3UoSX0r8pBuVD1VV+P+baMeJEzqhJe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=IpWY+iVX; arc=none smtp.client-ip=184.106.54.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1714413990;
	bh=SCDbbo14IriVcLJFmm5bOPJ41dkjXf+yvfcH9ina2Zs=;
	h=Date:From:To:Subject:From;
	b=IpWY+iVX2SJAJYDB5YQwggWt2JhrmzMSR/BffeW/dOPh5oeUdDpuln1vCFVenGGfB
	 v0yp/4mceuXwU3ZgSH7SUSqdMDE4mIKZ6Ch0MeE+01Q/0V993gwbMk33Evjcgm9zL6
	 TzZOsEPcri9z57Tx16XARL7HFXGj1UiPNRt5xTLc=
X-Auth-ID: lars@oddbit.com
Received: by smtp19.relay.ord1d.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id ADB7F6036B;
	Mon, 29 Apr 2024 14:06:30 -0400 (EDT)
Date: Mon, 29 Apr 2024 14:06:30 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org
Subject: Re: [PATCH RFC] ax25: Fix (more) netdev refcount issues
Message-ID: <tkgm4hbsiccrlehjhbpmsigo5r2fmght72evmcdz47cynqewpb@7yevwv7wma6d>
References: <6kant25vimoq36blyb5sjqgq3xxjcqbqeskbgf5zihdho3iulb@ni2lvhiytfrg>
 <472cb9d6-708e-4acd-b938-e12c3a19591e@moroto.mountain>
 <c2xhy6qnfvog4efddy32yrzd2ohjqmfixrqfuujvamsubkjbv6@vpidhqtxfcag>
 <34c0f87f-793e-4815-8f50-9cf632dafe21@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34c0f87f-793e-4815-8f50-9cf632dafe21@moroto.mountain>
X-Classification-ID: 95bf76a2-b4ed-4783-bd0c-b4ef5402c019-1-1

On Sun, Apr 28, 2024 at 02:01:54PM +0300, Dan Carpenter wrote:
> We would want to have a Fixes tag to say how the bug was introduced.
> That's the commit which introduced the underflow I think.

It doesn't look like d01ffb9eee4a introduced either of the problems.

I ran a couple of git bisects between d01ffb9eee4a and c942a0cd36
(that's the HEAD of my local repository, 6.9.0-rc5); the traces
involving ax25_release first show up in 9fd75b66b8f ("ax25: Fix refcount
leaks caused by ax25_cb_del()"). The "waiting for ax* to become free"
problem first shows up in feef318c855 ("ax25: fix UAF bugs of net_device
caused by rebinding operation").  Since feef318c855 is the older commit,
I guess we pick that one as the target for the Fixes: tag.

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

