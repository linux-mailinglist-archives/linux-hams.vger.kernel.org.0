Return-Path: <linux-hams+bounces-314-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E8F8CC936
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 00:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3588F1F2211E
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 22:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A900146A6A;
	Wed, 22 May 2024 22:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="bFvVaIks"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp126.ord1d.emailsrvr.com (smtp126.ord1d.emailsrvr.com [184.106.54.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C8A7CF30
	for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 22:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716418312; cv=none; b=MBo5PC0YvkSOddrpBlO9NbbaGdgsvM7hGmt/l1hzS5p6a3bqT5iSR0mjWRxYXnaXsjQf9BrDNG5u5WUiDyIHw0LVh+IFGLrKN2oh9EOemGLhtqzhHxfw8TKOh0j774z9vEAYWB+OCciIIseXKAIZzqAhzVtbQrg/6w3rmHweKRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716418312; c=relaxed/simple;
	bh=l/FccT+yMiE4V1ssiZ2VkHTDCvT91Dl29uaYTB9Hp0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gCQpzXWZSB8W710jQZVyEPfLmgyJ0LWfyIubRj4ZQq86wOYqkuzCmRkLFX0pG2XnyGDOTeilWXDXROgl2qV2PU8lDtYWd7vW8mCh/D0wEV7yaSc/jTfNy/SkcKrF01kKfW9a7bwSQF7TX/lbAxxWBtMIZLndmbtMEqG79lg4bPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=bFvVaIks; arc=none smtp.client-ip=184.106.54.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1716417129;
	bh=l/FccT+yMiE4V1ssiZ2VkHTDCvT91Dl29uaYTB9Hp0U=;
	h=Date:From:To:Subject:From;
	b=bFvVaIksctSFaFJjPMUczsO5B59xbJzWsF/+N2QBtQQdP7VdLqwJlpkykwpkOXXC8
	 xiC4y2TWIJoPk025w2FLT4Nx55WuA08yCfNjwCVCZAg5r0Pefx6E1Av4k4sDSWE529
	 Cl9I7BPMsFdVbKLpv5AKX338EhPa3/+NlErJNnc0=
X-Auth-ID: lars@oddbit.com
Received: by smtp24.relay.ord1d.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id C3616A0158;
	Wed, 22 May 2024 18:32:08 -0400 (EDT)
Date: Wed, 22 May 2024 18:32:08 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: David Ranch <linux-hams@trinnet.net>
Cc: Dan Cross <crossd@gmail.com>, 
	Chris Maness <christopher.maness@gmail.com>, Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, 
	dan.carpenter@linaro.org
Subject: Re: Kernel 6.9.1 AX.25 Crash
Message-ID: <ez5cmqa4pymxrmjbidataky7reydp5ztvfot7hb435izkuwevz@t3mpdp5slp6c>
References: <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
 <f27710b7-253c-79ce-e214-2b8251aceead@trinnet.net>
 <c3infeyajl4hr2tuyfmmccdv4gjbhsulaxuetozigqwqtj4jga@42eucxtsfk2y>
 <CAEoi9W5cmv-mQAsKPYTfjAytfp9Mvf3WgRQ9Ni=sznrU0v+NDQ@mail.gmail.com>
 <v6ybd4paw7eossjr2qiqvi5zqmvub7avy4cxpd6oyhfattia6j@ygablb7u2rpr>
 <CAEoi9W7VJhnSMD=YJX-92Lmxo+y6if_rFCAPrJiwJ8iuxz_7Bw@mail.gmail.com>
 <g2tpfzyhdwq2ink7phx3hpt4djjqpihf2efmcz4lwypwkgnhon@ihnhjwbj6lp7>
 <e0643fcd-fc41-0d56-0497-684fc7c157ae@trinnet.net>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0643fcd-fc41-0d56-0497-684fc7c157ae@trinnet.net>
X-Classification-ID: 9f63362b-31a0-4fac-abfe-0b0432b6d004-1-1

On Wed, May 22, 2024 at 03:22:05PM GMT, David Ranch wrote:
> I've already asked several people about this and the reality is that the
> Direwolf AX.25 protocol stack is currently only accessible via the AGW
> interface.  I then asked if the Linux libax25 user-space library could be
> adapted to make AGW calls and the answer I've received was: partially.

I wasn't really suggesting that we integrate with Direwolf; I was
suggesting that if we were going to rip an existing AX.25 implementation
out of something in order to create a general purpose user space
implementation, maybe the Direwolf code would be a better choice than
the kernel code (since it has been much more actively maintained).

We'd end up with something like "libdirewolf".

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

