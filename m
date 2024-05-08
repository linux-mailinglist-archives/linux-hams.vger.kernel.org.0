Return-Path: <linux-hams+bounces-257-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C24BC8C0030
	for <lists+linux-hams@lfdr.de>; Wed,  8 May 2024 16:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2F1B1C23CE3
	for <lists+linux-hams@lfdr.de>; Wed,  8 May 2024 14:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0B2127E0F;
	Wed,  8 May 2024 14:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="dSCLPu9V"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp102.ord1d.emailsrvr.com (smtp102.ord1d.emailsrvr.com [184.106.54.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94438626F
	for <linux-hams@vger.kernel.org>; Wed,  8 May 2024 14:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715179007; cv=none; b=q4oe4Pzl27aP90aZAS0za4zg6cFVI8bHunPrO8Lq8PJ+5yXeIA+adwGW+b3vZMdpOVRk6ZXop9tx6V3Lj10/LunO7+2g+Px040ujQk284cTLmMZjf3NQScG4TDRWHE3HVcCZQurw8JKQqoYc5rjIqwxThhhitW2AoJmM0aS5p2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715179007; c=relaxed/simple;
	bh=tW2Ka3LtJ3vuQo5sg1Kxam0pLpTMK7FI8wRB+1RlNW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oParfE2igY0pLY+/RexUloN35Vbz/0YDRfvBv1C4MhLyiLVlExI2m5qY7yO9dwNQ2RYry8w4BmlXGR8mO0hF5MH/hmjeuMLzwb4CfwBkX7q6UjA/4OMGLoUUomIN5BMMHsgoog8vre+APL59eBKWwBbKhTqWQ4cQVW2qS7MougI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=dSCLPu9V; arc=none smtp.client-ip=184.106.54.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1715178685;
	bh=tW2Ka3LtJ3vuQo5sg1Kxam0pLpTMK7FI8wRB+1RlNW8=;
	h=Date:From:To:Subject:From;
	b=dSCLPu9VCRQic6XkSYLVr/ufKldkJuONPjPrOn0i/fbs3124JgbrRb28hiifq3VGT
	 CbCMYDd87ByOkYf6su03phpCzN6JqeWXjwxWyWK4enIDBDlJfKb6GIEtkOt92zdw42
	 +xqD8YClJxOTV84aUoq5z0jiCZ3V7YbcOzYBRClw=
X-Auth-ID: lars@oddbit.com
Received: by smtp5.relay.ord1d.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 3A2EFA01C6;
	Wed,  8 May 2024 10:31:25 -0400 (EDT)
Date: Wed, 8 May 2024 10:31:24 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, 
	jreuter@yaina.de
Subject: Re: [PATCH net v5 1/4] ax25: Use kernel universal linked list to
 implement ax25_dev_list
Message-ID: <5o3kmbi6sq3c36a2qufxcii7si6qbmbinplqwugncvzcqpuk33@jvrftug6332q>
References: <cover.1715065005.git.duoming@zju.edu.cn>
 <bd49e83817604e61a12c9bf688a0825f116e67c0.1715065005.git.duoming@zju.edu.cn>
 <sijkuyypbnelg3w2shbxm3y6zu3qhfurvpvkoij5eluolnqr5w@y5dq74ycxzkm>
 <z5l3dfardxqrwf2lzzpktuifqaxvv2clrgah5gnz4t6iphskeb@otrcl5cwyghx>
 <e4751c30-b950-411b-aeab-5259915f649e@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4751c30-b950-411b-aeab-5259915f649e@moroto.mountain>
X-Classification-ID: e9de2cc1-e8db-4627-9dda-6371280745c9-1-1

On Wed, May 08, 2024 at 12:26:59PM GMT, Dan Carpenter wrote:
> Let's drop all the other netdev people from the CC list.
> 
> On Tue, May 07, 2024 at 07:46:51PM -0400, Lars Kellogg-Stedman wrote:
> > On Tue, May 07, 2024 at 03:43:11PM GMT, Lars Kellogg-Stedman wrote:
> > > On Tue, May 07, 2024 at 03:03:39PM GMT, Duoming Zhou wrote:
> > > >  typedef struct ax25_dev {
> > > > -	struct ax25_dev		*next;
> > > > +	struct list_head	list;
> > > 
> > > Would it make sense to replace this with:
> > >
> > > LIST_HEAD(ax25_dev_list);
> > 
> > Sorry, *this*:
> > 
> > > +static struct list_head ax25_dev_list;
> 
> I'm not sure I understand.  The code is correct though...

I was suggested using:

    LIST_HEAD(list_name);

Rather than:

    static struct list_head list_name;

...and then later on initializing the list using
INIT_LIST_HEAD(list_name).

There's not really a functional difference, but using LIST_HEAD saves us
a couple of extra lines of initialization code.

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

