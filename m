Return-Path: <linux-hams+bounces-293-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9340B8CB3DC
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 20:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B68A21C20381
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 18:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7934B2AEFB;
	Tue, 21 May 2024 18:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="VyGpxGt5"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp70.ord1d.emailsrvr.com (smtp70.ord1d.emailsrvr.com [184.106.54.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA27A17722
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 18:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716317499; cv=none; b=rR84oNfm04mPtaF9DOIjL4vLvtiaW3lKMZHpPO3qv1RIe4iFFQF8ShDdlxUj9z3QRO8jC8+sgPq7WQFuoLyXEeyXfUsp7hADtm2xNxF3ZgIdZjkgGNo0MQJrezxNG3gFIDO6oiAnChH8njRaeaUAD7TOShXlcR+Qn7gNwTFZxog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716317499; c=relaxed/simple;
	bh=ByLdzw4QQh8fKWrdpFofJt7a9ya4OEU9OiJLI7z5etE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oatV0jjbnhN/NwwfKhHnEy0tnz0N5TeQ7vjdBu9npQdjy8ZCPJe4Ca5+ncus9LawUr/gVcDtP/OF6TvHJcvBqVT/VE9eOmoTTgFpuVME1sn7EBCS6kp5GNEmgnwU8f2hZoLQ/p6kp469OFJeSQdU8S29VerGzKFE42Y8RVtAER8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=VyGpxGt5; arc=none smtp.client-ip=184.106.54.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1716315126;
	bh=ByLdzw4QQh8fKWrdpFofJt7a9ya4OEU9OiJLI7z5etE=;
	h=Date:From:To:Subject:From;
	b=VyGpxGt5GdXfUdff9BhjNEZR2uqudqHuCRSb25ii+BIreYRRmWifHhEG+2+XLREKC
	 1XJHN/l/RjotH3f3SrKz0o8/ykWKfLyxLD3rvYsNqPlLT/GfQ1QOypVMyYUcHzcRHT
	 RblFi64dW0119QzsDr0r1SIJ7Wb2ryWrecqLgplk=
X-Auth-ID: lars@oddbit.com
Received: by smtp9.relay.ord1d.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 70973C00A2;
	Tue, 21 May 2024 14:12:06 -0400 (EDT)
Date: Tue, 21 May 2024 14:12:06 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: David Ranch <linux-hams@trinnet.net>
Cc: Chris Maness <christopher.maness@gmail.com>, 
	Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, dan.carpenter@linaro.org
Subject: Re: Kernel 6.9.1 AX.25 Crash
Message-ID: <c3infeyajl4hr2tuyfmmccdv4gjbhsulaxuetozigqwqtj4jga@42eucxtsfk2y>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn>
 <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
 <f27710b7-253c-79ce-e214-2b8251aceead@trinnet.net>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f27710b7-253c-79ce-e214-2b8251aceead@trinnet.net>
X-Classification-ID: 1b9caa3d-c453-4f91-944f-452cd794edd7-1-1

On Tue, May 21, 2024 at 08:53:06AM GMT, David Ranch wrote:
> That said, I wanted to chime in here about your commend
> about "very few people interested in the a.25 support in the kernel".
> That's definitely not true.

That's good to know! I based that on the amount of traffic I see here on
the linux-hams list, and the difficulty in getting anybody to offer an
opinion (or an alternative to) these changes. If there is a more active
forum where people are talking about Linux and amateur radio I'm happy
to join there as well.

> The other significant issue is that the kernel branch maintainers /
> powers at be seem to just accept these changes without any real
> scrutiny and don't require any real testing results to confirm things
> still work. 

I think this would typically be the job of a subsystem maintainer; this
is another way in which the lack of a maintainer hurts the
ax.25 stack.

> I've asked if there is some form of a per-commit or daily CI
> build and regression test environment that I could offer up some basic
> toxicity test scenarios to.

Have you put together an ax.25 test suite? I put together an automated
test for the particular problem I'm trying to resolve (that was
necessary in order to successfully use `git bisect run`); collecting
these sorts of things in one place would be a great step forward.

> I am hugely grateful to you (Lars) on being able to submit some meaningful
> fixes and was able to get them committed to the mainline.

Just to clear, that hasn't happened yet! The patch needs to get
approved first.

> The next major hurdle that I would love to get feedback on is how to
> get these new changes but also create a set of backported fixes
> committed into various Linux distributions kernels that don't strictly
> follow the mainline kernel.  My personal interest is in the Raspberry
> Pi OS kernel...

I'm running this patch on kernel 6.6.30 on my Raspberry Pi systems; you
can find the patch against 6.6.30 here:

  https://github.com/larsks/ax25-debugging/tree/main/patches-for-6.6.30

It's made my Pis much more stable. I think that if the patch gets
accepted for the mainline kernel it should be relatively easy to get
into the Raspberry Pi kernel as well.

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

