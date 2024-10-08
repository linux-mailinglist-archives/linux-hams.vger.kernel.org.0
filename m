Return-Path: <linux-hams+bounces-431-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D6B9908AA
	for <lists+linux-hams@lfdr.de>; Fri,  4 Oct 2024 18:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 797A51F213F6
	for <lists+linux-hams@lfdr.de>; Fri,  4 Oct 2024 16:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2272D1AA7BD;
	Fri,  4 Oct 2024 16:08:16 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3976E1AA79F;
	Fri,  4 Oct 2024 16:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728058096; cv=none; b=Ch2O9jYnWK44VGKZE3f/CRm/R2EPN4erimlATDl1C3RbHQHWCibbVGuJ5xVyrsfRHwq7J4S0QTUZT7tGOyk21ewOYl9qEGKEfE9mDd9ITZ3MuHZiLIx2PQ8N3TuSS4ZGllV7YnzPX8YlYemEUjkX7FIDLZgFuquC//cjy8S8aCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728058096; c=relaxed/simple;
	bh=I1XuXa6OalWyijUFGD9MnOSOTu6zfj8sLod7eNVb9mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzyVoW6MTRPZQziBCLeQ/TKG9DWobvGIz0WHwtQ08qXWK6OtBi3YELUTyVXbmnV9jJ7OQuocothE2yq6bfYNyMREC4Xz0/EAdPqwiYhXG8X3Y3k0+f9rgpNpSOo2ItApsEaogy4AuQXzkd5VsNnWI3jS3H9NkDAvRRHQ9qrDQdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1swkQp-0008Tu-00; Fri, 04 Oct 2024 17:41:27 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3EBFEC0161; Fri,  4 Oct 2024 17:41:17 +0200 (CEST)
Date: Fri, 4 Oct 2024 17:41:17 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	linux-mips@vger.kernel.org, linux-hams@vger.kernel.org,
	linux-edac@vger.kernel.org, helpdesk@kernel.org
Subject: Re: Bouncing maintainer: Ralf Baechle
Message-ID: <ZwAMnZDsA18sgGN+@alpha.franken.de>
References: <20240925-flashy-innocent-goat-afdbe8@lemur>
 <alpine.DEB.2.21.2409251733580.3358@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2409251733580.3358@angie.orcam.me.uk>

On Wed, Sep 25, 2024 at 10:19:51PM +0100, Maciej W. Rozycki wrote:
> On Wed, 25 Sep 2024, Konstantin Ryabitsev wrote:
> 
> > Ralf Baechle is listed as the sole maintainer for several MIPS- and HAMS-
> > related subsystems:
> > 
> >   - EDAC-CAVIUM OCTEON
> 
>  Cc-ing <linux-edac@vger.kernel.org> for this subsystem to widen the 
> audience.

if nobody else stands up, I'll take it.

> >   - IOC3 ETHERNET DRIVER
> 
>  Thomas, is this something you want to take?  I have no such hardware.

sure, last changes in that driver are from me anyway.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

