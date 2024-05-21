Return-Path: <linux-hams+bounces-291-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB5E8CB352
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 20:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A1541F22A53
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 18:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7163338FB0;
	Tue, 21 May 2024 18:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="aJ5lZZok"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp104.iad3a.emailsrvr.com (smtp104.iad3a.emailsrvr.com [173.203.187.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE34F23775
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 18:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.203.187.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716315111; cv=none; b=AR4zCAzuoR51EkqJazcD90qpCNSo4QDPkMotnxKPxyyjyTgeYbz60IOcam66vJmYmT8gDdo7Y0mmTgAdi+qUlAGPZOx7/6F71sOajwrcI1UFVefKRJbf8h8FAV7lf1sllizkVJxZe16Tt81jKWJPFyb0Ebudvv44L0QQxnp07VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716315111; c=relaxed/simple;
	bh=mXg2m7FaBh7geKTtC/c09GEHC57YZLr2naympotFbfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0EgLoejO5oaIg6K9yo7WnDP++kRNLVBD0G+cnglUZso1F/lxo1NvDdIS5B5vIlqoLSvTXsvT93m+NrLeWVXKTOqOkmDJRV238XJUMwD5iqUWdnt9XbfOIvTa4lF0r3W7BtwVA/SRbL1ubuE6bB6iUxKo61F30hxIGe30UchLhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=aJ5lZZok; arc=none smtp.client-ip=173.203.187.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1716314198;
	bh=mXg2m7FaBh7geKTtC/c09GEHC57YZLr2naympotFbfM=;
	h=Date:From:To:Subject:From;
	b=aJ5lZZokxzaR/t4WX1otFlmoJ6tHyM5YEXU9peFa81uzfFJPoUAXVLhoTnmJvRtHN
	 GWaIfQJ0+4P9wEei15Pyakg29cp5eOVkji4oOPB8cXf2XRJC+TE1TzTbNDH8FkqW99
	 65xu9mhfSRMyX2SO0/URPpyVYbSopmtyMCPtc7zY=
X-Auth-ID: lars@oddbit.com
Received: by smtp14.relay.iad3a.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id C7D9725133;
	Tue, 21 May 2024 13:56:37 -0400 (EDT)
Date: Tue, 21 May 2024 13:56:37 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Naveen Mamindlapalli <naveenm@marvell.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>
Subject: Re: [PATCH v2] ax25: Fix refcount imbalance on inbound connections
Message-ID: <5hsingm5tdmbdnbvx2yksu2n2edqprpm6mgzodjcq4wgwksxbo@vcnxk3luaqw7>
References: <46ydfjtpinm3py3zt6lltxje4cpdvuugaatbvx4y27m7wxc2hz@4wdtoq7yfrd5>
 <SJ2PR18MB5635B7ADC7339BEDB79B183DA2EA2@SJ2PR18MB5635.namprd18.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ2PR18MB5635B7ADC7339BEDB79B183DA2EA2@SJ2PR18MB5635.namprd18.prod.outlook.com>
X-Classification-ID: 68cc4d66-4adf-4eab-bc9f-58be46a5af1b-1-1

On Tue, May 21, 2024 at 05:21:40PM GMT, Naveen Mamindlapalli wrote:
> > socket *newsock,
> >  	DEFINE_WAIT(wait);
> >  	struct sock *sk;
> >  	int err = 0;
> > +	ax25_cb *ax25;
> > +	ax25_dev *ax25_dev;
> 
> nit: Please follow reverse Christmas tree.

That is a new phrase for me; I had to look it up. Do you mean this:

        DEFINE_WAIT(wait);
        struct sock *sk;
        int err = 0;
+	      ax25_dev *ax25_dev;
+	      ax25_cb *ax25;

Or should I apply this to the entire block of variable declarations,
like this:

        struct sk_buff *skb;
        struct sock *newsk;
+       ax25_dev *ax25_dev;
        DEFINE_WAIT(wait);
        struct sock *sk;
+       ax25_cb *ax25;
        int err = 0;

Thanks,

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

