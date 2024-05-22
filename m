Return-Path: <linux-hams+bounces-310-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F488CC737
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 21:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 945941F21C03
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 19:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8499E5FBB3;
	Wed, 22 May 2024 19:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="UxXdBWoQ"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp75.iad3a.emailsrvr.com (smtp75.iad3a.emailsrvr.com [173.203.187.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D125659147
	for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 19:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.203.187.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716406307; cv=none; b=gx1aQ9Kh6XYM7vg4+3XsImXm+rOuYxVeUYpqMAK82x5WLQXNiUAwyiEIymApktp0YeNwctRkZWO2f3U1Y6zBIug5/IpbMlyDD7IJEj5rEpgUgU04U7SeCvBEHShME1xEIyqc0WFBKWDpop6uRNrFPe+IFfDSiY2O8gfRR5eKvXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716406307; c=relaxed/simple;
	bh=f52EbTonRRq85olqzyJ8MPOX6tGsVJx/4J76UNmI32s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rs/9T27hWuOjX6YEm1xfeK2946NdID65rs6JQOxcfOyw3PgAc53Kqf4aanuHvf2xW7cMMckwFnBtZZM4ebxDOHH5lDgRQjHIf2KDx+BYu1RL4oLPfysKjIdXejcvVMB5Xvw/APhxvIyzMGvlRyh4ZXFbVnAia7MAdHLrzWjY5dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=UxXdBWoQ; arc=none smtp.client-ip=173.203.187.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1716401623;
	bh=f52EbTonRRq85olqzyJ8MPOX6tGsVJx/4J76UNmI32s=;
	h=Date:From:To:Subject:From;
	b=UxXdBWoQXSEssMNxFDN3TvvmA0jUFHKAybFcxNPWHflBMxDP2bk2Vqs1LXBOz4DQn
	 zgF6J0nGopm/sbamWWN4JOxO2aO84SZz0sKS4wDEuWX/BxkkVHNB0ETgav9ZHvW1BI
	 sio14OOs0hpO19QjWBVKYJikcRTwx1Hkj4Hn3OQc=
X-Auth-ID: lars@oddbit.com
Received: by smtp2.relay.iad3a.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 8F9E218A6;
	Wed, 22 May 2024 14:13:43 -0400 (EDT)
Date: Wed, 22 May 2024 14:13:43 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: David Ranch <linux-hams@trinnet.net>
Cc: linux-hams@vger.kernel.org
Subject: Re: Kernel 6.9.1 AX.25 Crash
Message-ID: <sizktzzz2u7ijocui5jh62td5aztess7znhlbzrft7tcsurfjq@k7lmtpbjwqz4>
References: <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn>
 <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
 <f27710b7-253c-79ce-e214-2b8251aceead@trinnet.net>
 <c3infeyajl4hr2tuyfmmccdv4gjbhsulaxuetozigqwqtj4jga@42eucxtsfk2y>
 <bdcc8a74-2218-6570-eb93-8cfc00b13781@trinnet.net>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdcc8a74-2218-6570-eb93-8cfc00b13781@trinnet.net>
X-Classification-ID: 24a7587a-a30d-4a6f-94c4-8787b03b62bb-1-1

On Wed, May 22, 2024 at 09:10:11AM GMT, David Ranch wrote:
> Just to name a few, consider joining:

Thanks! 

> I've offered to do so but I never received any response.  I need to know
> what is needed here:

I Am Not The Maintainer :), but I think my preference would be to start
with:

>    - Just document various testcase scenarios?

And then, or at the same time, create the necessary automation to run
these scenarios. Depending on the complexity of the tasks I would start
with Bash scripts, but would probably move to Python (in preference to
Perl or Javascript) if we needed something more capable.

>    - Create a set of pre-configured inter-connected VM images for running
> automated tests?  If so, what format, what CPU architecture, etc

It seems this, or something like it, would be necessary. I've got
some convenience scripts that I'm using to boot and test kernels, you
can find them in the debugging repository I've listed previously [1].

If you'd like, maybe we can use that repository to start putting
together some sort of testing framework.

[1]: https://github.com/larsks/ax25-debugging

> Are you patching and compiling the Raspberry Pi OS specific kernel tree or
> are you using the mainline Linux-Next or primary Linus tree?

The 6.6.30 patch is against https://github.com/raspberrypi/linux (the
rpi-6.6.y branch); I didn't think it was possible to boot the mainline
kernel on the Pi.

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

