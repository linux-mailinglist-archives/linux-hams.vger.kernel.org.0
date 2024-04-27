Return-Path: <linux-hams+bounces-152-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 742428B4741
	for <lists+linux-hams@lfdr.de>; Sat, 27 Apr 2024 19:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0341282350
	for <lists+linux-hams@lfdr.de>; Sat, 27 Apr 2024 17:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C505D140E22;
	Sat, 27 Apr 2024 17:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="ToeFpH9b"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp84.iad3a.emailsrvr.com (smtp84.iad3a.emailsrvr.com [173.203.187.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17BB4EB3C
	for <linux-hams@vger.kernel.org>; Sat, 27 Apr 2024 17:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.203.187.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714239110; cv=none; b=ro4lFqWFxSECPWsD7cEiEiuEkpMBYpRKrAYZPzk5iSB+yPW8PEE0w0EfmkLW9LKfnR/MaXyrUMl1WESqNNJmlbt9XQ7ya7Wg+JD8xL2NKiVqJn2P743hXbV4ExabNC7Bni66yvlevEBHaaaGX2zo8Jy0iFgsyVlFZvU2ivlvXRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714239110; c=relaxed/simple;
	bh=dGKpasMsufKDPemrUE+vqVzfUszoU/WHxImgo/Iod9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jd1zHQD+Hvj8JKXmJgLoKsV9mf99KiFnp5PEETcb5gx7QzwXFuvFLk0IGAqb3zcV/zpY221iUpvd8z7OuDql3NBwDvCZKzR6XhqQQ9aTgUl5bpUaJFQgxivVpMjoWZEzwOkKzpj3upsk/FETwEV0SLyXGExkLxRcb+BDhyQvQe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=ToeFpH9b; arc=none smtp.client-ip=173.203.187.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1714238139;
	bh=dGKpasMsufKDPemrUE+vqVzfUszoU/WHxImgo/Iod9w=;
	h=Date:From:To:Subject:From;
	b=ToeFpH9bRNBje/nfLd5HoHtfFe0Z66ki6F9vBklwCNK0LjCtRHvOMFcyYj16n+xWB
	 E6tsvbc+gBmRsdPEDBiz0ELp+NC984jHvSuDMbgIvIIVCF33pWC/mkmh6m10xuU4OE
	 5yNqBKzhS3tLKLpSVvgxE4DUXL3UbRwqWUmcejMQ=
X-Auth-ID: lars@oddbit.com
Received: by smtp11.relay.iad3a.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 26F3642CA;
	Sat, 27 Apr 2024 13:15:39 -0400 (EDT)
Date: Sat, 27 Apr 2024 13:15:38 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org
Subject: Re: [PATCH RFC] ax25: Fix (more) netdev refcount issues
Message-ID: <c2xhy6qnfvog4efddy32yrzd2ohjqmfixrqfuujvamsubkjbv6@vpidhqtxfcag>
References: <6kant25vimoq36blyb5sjqgq3xxjcqbqeskbgf5zihdho3iulb@ni2lvhiytfrg>
 <472cb9d6-708e-4acd-b938-e12c3a19591e@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <472cb9d6-708e-4acd-b938-e12c3a19591e@moroto.mountain>
X-Classification-ID: 96d9a937-d4ed-4cf5-a36c-9f811291e408-1-1

On Sat, Apr 27, 2024 at 11:48:48AM GMT, Dan Carpenter wrote:
> The commit message needs a Fixes tag.
> 
> Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")

This wasn't meant explicitly as a fix for that commit. Is the Fixes: tag
still appropriate?

> Let me add Duoming Zhou to the CC list.  That commit is two years old
> now.  This sort of bug should have been caught by basic testing, right?

You'd think, right? The errors were trivial to reproduce (and can be
tested by anyone; you don't need a radio to exercise the ax.25 stack).

> Could you confirm that that's actually the commit which breaks it?

I'll see what I can do. There are already several patches on top of
d01ffb9eee4a (I count 19), so figuring that out might be tricky.

Thanks for taking a look!

> regards,
> dan carpenter
> 
> On Fri, Apr 26, 2024 at 05:29:40PM -0400, Lars Kellogg-Stedman wrote:
> > Folks,
> > 
> > I'm posting the following patch here before sending it to netdev in the
> > hopes that someone can take a look at the change and comment on the
> > correctness. This resolves all of the issues I've been experiencing
> > recently with ax.25.
> > 
> > ...
> > 
> > When closing a socket, the ax.25 code releases references via
> > netdev_put() and ax25_dev_put(). In the case when the socket was the
> > result of an incoming connection, these references were never allocated in
> > the first place, causing underflows in both ax25_dev->refcount and
> > ax25_dev->dev->refcnt_tracker->untracked. This would result in a variety of
> > errors:
> > 
> > - After an initial connection and then again after several subsequent
> >   connections:
> > 
> >       refcount_t: decrement hit 0; leaking memory.
> > 
> > - After several subsequent connections:
> > 
> >       refcount_t: underflow; use-after-free.
> > 
> > A typical call trace for the above two issues would look like:
> > 
> >     Call Trace:
> >     <TASK>
> >     ? show_regs+0x64/0x70
> >     ? __warn+0x83/0x120
> >     ? refcount_warn_saturate+0xb2/0x100
> >     ? report_bug+0x158/0x190
> >     ? prb_read_valid+0x20/0x30
> >     ? handle_bug+0x3e/0x70
> >     ? exc_invalid_op+0x1c/0x70
> >     ? asm_exc_invalid_op+0x1f/0x30
> >     ? refcount_warn_saturate+0xb2/0x100
> >     ? refcount_warn_saturate+0xb2/0x100
> >     ax25_release+0x2ad/0x360
> >     __sock_release+0x35/0xa0
> >     sock_close+0x19/0x20
> >     [...]
> > 
> > On reboot, the kernel would get stuck in an infinite loop:
> > 
> >     unregister_netdevice: waiting for ax1 to become free. Usage count = 0
> > 
> > The attached patch corrects all three of the above problems by ensuring
> > that we call netdev_hold() and ax25_dev_hold() for incoming connections.
> > 
> > Signed-off-by: Lars Kellogg-Stedman <lars@oddbit.com>
> > ---
> >  net/ax25/ax25_in.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
> > index 1cac25aca63..35a55ad05f2 100644
> > --- a/net/ax25/ax25_in.c
> > +++ b/net/ax25/ax25_in.c
> > @@ -411,6 +411,8 @@ static int ax25_rcv(struct sk_buff *skb, struct net_device *dev,
> >  	ax25->state = AX25_STATE_3;
> >  
> >  	ax25_cb_add(ax25);
> > +	netdev_hold(ax25_dev->dev, &ax25->dev_tracker, GFP_ATOMIC);
> > +	ax25_dev_hold(ax25_dev);
> >  
> >  	ax25_start_heartbeat(ax25);
> >  	ax25_start_t3timer(ax25);
> > -- 
> > 2.44.0
> > 
> > -- 
> > Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
> > http://blog.oddbit.com/                | N1LKS

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

