Return-Path: <linux-hams+bounces-340-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 055008D39FB
	for <lists+linux-hams@lfdr.de>; Wed, 29 May 2024 16:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4ACA28ABC9
	for <lists+linux-hams@lfdr.de>; Wed, 29 May 2024 14:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41803D27E;
	Wed, 29 May 2024 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="GS4NmDpp"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp80.ord1d.emailsrvr.com (smtp80.ord1d.emailsrvr.com [184.106.54.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2F8159216
	for <linux-hams@vger.kernel.org>; Wed, 29 May 2024 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994489; cv=none; b=TRUiLcZVvX1yzNb47RrV0aGcdepQ5oiMhqpFmfTVYwCMl4SzWwP+JN6NvAYliKlSou04zlH2PcAnOuXLw36bbTYu190VqV7rNQL/XiACfXd7IotreaUPoeEodRxozaWx8X9THZUt++AmvZg94towfdDV1L6aC519wZUQD8LEJT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994489; c=relaxed/simple;
	bh=TSfhHAiAhkZdYEAhFRcGd6VDPBN75N82iN2594O2A8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3UnzeQ9WGicm70o4En1JCBN4T1XwOGinzbwN20Xj4jZFiu6OrGyer2UBtZ7bo1YxuFn93JGKxRTOW7PUbsmwxO6nWe21Xa59ygvYy5jbYlBuPcPMo/sojl9wUpo3fwrig4f/kCVtKQBuS1WDhzZfZdzZ/sVIegkjy/D/bcz4+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=GS4NmDpp; arc=none smtp.client-ip=184.106.54.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1716994486;
	bh=TSfhHAiAhkZdYEAhFRcGd6VDPBN75N82iN2594O2A8M=;
	h=Date:From:To:Subject:From;
	b=GS4NmDpp4K8rkHiMiM5/ljnuDHtXFrEHORTSu4axRKa0JoXn6W7FC+vQGvyVB5/Tm
	 8130eyG0JQVJZN7EJunCGycO7lIXU/TFvf2Shku1LE3H6PaNTBqtUW6HDEOnxQ5dmU
	 iUouaxGuucfwkZ+vImQ9gynzG/OPYjnfjToO6M/I=
X-Auth-ID: lars@oddbit.com
Received: by smtp19.relay.ord1d.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 39B6060145;
	Wed, 29 May 2024 10:54:46 -0400 (EDT)
Date: Wed, 29 May 2024 10:54:45 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Paolo Abeni <pabeni@redhat.com>, linux-hams@vger.kernel.org, 
	netdev@vger.kernel.org, Duoming Zhou <duoming@zju.edu.cn>
Subject: Re: [PATCH v4] ax25: Fix refcount imbalance on inbound connections
Message-ID: <7bfn3g46beatmbp3bzxauahdiitb67ncfixp6znjdc6e5gj6mc@ldmt3i2wnqpf>
References: <20240522183133.729159-2-lars@oddbit.com>
 <8e9a1c59f78a7774268bb6defed46df6f3771cbc.camel@redhat.com>
 <rkln7v7e5qfcdee6rgoobrz7yzuv7yelzzo7omgsmnprtsplr5@q25qrue4op7e>
 <962afcda-8f67-400f-b3eb-951bf2e46fb7@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <962afcda-8f67-400f-b3eb-951bf2e46fb7@moroto.mountain>
X-Classification-ID: 3dcf9346-471f-4221-a472-c556085dd322-1-1

On Wed, May 29, 2024 at 05:34:20PM GMT, Dan Carpenter wrote:
> 1) The Fixes tag points to the wrong commit, though, right?  The one
> you have here doesn't make sense and it doesn't match the bisect.

I'll double check that; thanks for checking.

> 2) Can we edit the commitmessage a bit to say include what you wrote
> about "but rather bind/accept" being paired.  We increment in bind
> and we should increment in accept as well.  It's the same.

I'll update the wording.

> 3) The other thing that I notice is that Duoming dropped part of his
> commit when he resent v6.
> https://lore.kernel.org/all/5c61fea1b20f3c1596e4fb46282c3dedc54513a3.1715065005.git.duoming@zju.edu.cn/
> That part of the commit was correct.  Maybe it wasn't necessary but it
> feels right and it's more readable and it's obviously harmless.  I can
> resend that.

Just so that I'm clear, with that comment you're not suggesting any
changes to my patch, right?

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

