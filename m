Return-Path: <linux-hams+bounces-359-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1997190046E
	for <lists+linux-hams@lfdr.de>; Fri,  7 Jun 2024 15:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F46E28511E
	for <lists+linux-hams@lfdr.de>; Fri,  7 Jun 2024 13:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1F419067A;
	Fri,  7 Jun 2024 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="sb+iuZow"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp70.ord1d.emailsrvr.com (smtp70.ord1d.emailsrvr.com [184.106.54.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06671422C6
	for <linux-hams@vger.kernel.org>; Fri,  7 Jun 2024 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717766208; cv=none; b=k0G+U5PePdMoK4rs25xtfr+8BfV40rVerXXNlqMU9I0198YrE1qXya+lpBtQ6t9QobVYkFavztAiqaJJP39kifYP5h4lvCrGqBV7+MLcLQUysGnY16wuo3D2V0UCRukEcMpBB67E7N+Rg0zlXs/OZzEPdwWLNqkJ5La3cg/6sUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717766208; c=relaxed/simple;
	bh=PPhx+VY27nLmGXCLmlW9wQI0gt4mncezRtrSsBgvPrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sigw/IrrIwo7s6ZpnBl05tTFFAG7HQUYybW9WeRhc3azpQ3tPd2erHBqQzSBcr590gROXe46xoNZNZvEboA+hUvmqy8hVO4oS45BDYgQ6q36ct1Hk/AQ8n72tubBPUzXZg1O6rpetuK1/yJvB2HAEf+Tas0ikV4HcUeTgnkRPsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=sb+iuZow; arc=none smtp.client-ip=184.106.54.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1717761669;
	bh=PPhx+VY27nLmGXCLmlW9wQI0gt4mncezRtrSsBgvPrs=;
	h=Date:From:To:Subject:From;
	b=sb+iuZowcJHYYdJ09K7Z4ZzpjXusEAvXElvZyTnsn2lsE8aiUvoYakdWyrwvPB+QI
	 FT5NH12YDm6C1lTKUhqs+5XrMqQ0bZdu1MJK//3crf61nYer7zKPWN9jKNAPl/A9Nx
	 3/FBiKhhoMZvG6KZEglwjfVLrr2qKwKFeNvSh1cw=
X-Auth-ID: lars@oddbit.com
Received: by smtp9.relay.ord1d.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 35B8EC00BC;
	Fri,  7 Jun 2024 08:01:09 -0400 (EDT)
Date: Fri, 7 Jun 2024 08:01:08 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: linux-hams <linux-hams@vger.kernel.org>
Cc: David Ranch <linux-hams@trinnet.net>, 
	Chris Maness <christopher.maness@gmail.com>
Subject: Re: Kernel 6.9.1 AX.25 Crash
Message-ID: <6e5f3lkbpd5u725kcaja65fncl5y436wlt6q26c4gigl7ppdip@anlb3w6gyjz2>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn>
 <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
 <f27710b7-253c-79ce-e214-2b8251aceead@trinnet.net>
 <c3infeyajl4hr2tuyfmmccdv4gjbhsulaxuetozigqwqtj4jga@42eucxtsfk2y>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3infeyajl4hr2tuyfmmccdv4gjbhsulaxuetozigqwqtj4jga@42eucxtsfk2y>
X-Classification-ID: cecdb30a-c29d-4355-8f2d-c028264d8fad-1-1

On Tue, May 21, 2024 at 02:12:06PM GMT, Lars Kellogg-Stedman wrote:
> On Tue, May 21, 2024 at 08:53:06AM GMT, David Ranch wrote:
> > I am hugely grateful to you (Lars) on being able to submit some meaningful
> > fixes and was able to get them committed to the mainline.
> 
> Just to clear, that hasn't happened yet! The patch needs to get
> approved first.

The patch has been merged into the mainline kernel:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3c34fb0bd4a4237592c5ecb5b2e2531900c55774

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

