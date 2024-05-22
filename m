Return-Path: <linux-hams+bounces-305-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF6F8CC64C
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 20:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59B4A1F21A4B
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 18:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D791145B13;
	Wed, 22 May 2024 18:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="A2KBYUUv"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp103.ord1d.emailsrvr.com (smtp103.ord1d.emailsrvr.com [184.106.54.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37F6D51E
	for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 18:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716402406; cv=none; b=FjV3j/+pGzEpMKFSOnQVFbWCqiCNb8xBCfChDXNpEhRJKi4D9pAdpOe92sTyuRr1FO8R7B0fTwYYwTUUjokOP9IIJPiVfxrZ+kME6h+U2tjg8zYU9t917/7qqld+FkaCr9aZEqz25fhE1kwhCQTY7kZpkX5ZZHoSs7tb6BSJMss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716402406; c=relaxed/simple;
	bh=7+rDlcXaUh4ux9t3wZq0fu178Z1NgmDSi81MEvBSBbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/3PoTp8fHFwZwsdDZa6wTGMWn5pYyxct35Vuz5Em0J7DzkOUftqRdS9PDCd5YpuNLE507F50zECvqCm/l7enaXfuZUb4kx5zWOvY158Tra0mxPwC3o7+lNyK9yFD66jowoNmaSuwg5VcU/n1XkyySMCLx6uLJen2hgLC9wHuIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=A2KBYUUv; arc=none smtp.client-ip=184.106.54.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1716401847;
	bh=7+rDlcXaUh4ux9t3wZq0fu178Z1NgmDSi81MEvBSBbQ=;
	h=Date:From:To:Subject:From;
	b=A2KBYUUvm9lnJJcjD3VGNyIIijJ9MKcDoSPsRRcbDlLKY1qztHKQS3NDPB45nfeER
	 tBr5ESmkPgzqa5UZMLs+StiqkqK1hc9KaER1Scyg50qwf013NC/9x9DDXv/oFmx9y1
	 BzqSaNmFncNnKG5kgRUSrTRIGthA9465jlZiMcC4=
X-Auth-ID: lars@oddbit.com
Received: by smtp13.relay.ord1d.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id B7FB4C01A8;
	Wed, 22 May 2024 14:17:26 -0400 (EDT)
Date: Wed, 22 May 2024 14:17:26 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Dan Cross <crossd@gmail.com>
Cc: David Ranch <linux-hams@trinnet.net>, 
	Chris Maness <christopher.maness@gmail.com>, Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, 
	dan.carpenter@linaro.org
Subject: Re: Kernel 6.9.1 AX.25 Crash
Message-ID: <v6ybd4paw7eossjr2qiqvi5zqmvub7avy4cxpd6oyhfattia6j@ygablb7u2rpr>
References: <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn>
 <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
 <f27710b7-253c-79ce-e214-2b8251aceead@trinnet.net>
 <c3infeyajl4hr2tuyfmmccdv4gjbhsulaxuetozigqwqtj4jga@42eucxtsfk2y>
 <CAEoi9W5cmv-mQAsKPYTfjAytfp9Mvf3WgRQ9Ni=sznrU0v+NDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEoi9W5cmv-mQAsKPYTfjAytfp9Mvf3WgRQ9Ni=sznrU0v+NDQ@mail.gmail.com>
X-Classification-ID: f5d8cd7f-9ba0-4089-93a8-0e97a4460eaa-1-1

On Wed, May 22, 2024 at 11:32:21AM GMT, Dan Cross wrote:
> My personal belief is that the best way forward is to rip AX.25,
> NETROM, and Rose out of the kernel and go with a pure user-space
> implementation.

I'm generally in favor of this idea, as long as we sequence things so
that we have a stable, functioning userspace before ax.25 support is
dropped from the kernel (and that we're able to maintain compatability
-- as much as possible -- with the existing tools).

Dan, are you volunteering to spearhead this effort? I'm happy to help
out, but I don't think I should be driving; I don't have enough
familiarity with the protocols involved.

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

