Return-Path: <linux-hams+bounces-358-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F658D7946
	for <lists+linux-hams@lfdr.de>; Mon,  3 Jun 2024 02:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52B58281DB4
	for <lists+linux-hams@lfdr.de>; Mon,  3 Jun 2024 00:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C306C631;
	Mon,  3 Jun 2024 00:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="l9qsjsok"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp110.iad3a.emailsrvr.com (smtp110.iad3a.emailsrvr.com [173.203.187.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6A0620
	for <linux-hams@vger.kernel.org>; Mon,  3 Jun 2024 00:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.203.187.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717373209; cv=none; b=rB6YaA+YSOoBQvDJnctPvB4gUXJJLANcLwMlcM3ya0y3cvoaq4sCEraOFb/10Y+wpqD/+lGc7NWqZuLSpijnSeexeSU5c+S30XJuR89KrLhzd7wGBajZJMiOzewU49iPiqpa7TDJD3qnuvKc/clq/YKdESwpH1Zk15XfWuo1MvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717373209; c=relaxed/simple;
	bh=fEdyJr2xwOrft0K2KRoI8TPu48/300IApRVAjt9WA2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFcWXZQLQs2xAkq9x34ib4yV/4jgq+mspq1ZVxuq2GsGc4TGWjVzz4VmLF+Fd5H0z88gDRGLxytTweJEhYJHtyeha5Bk1Vq5fDZ7oHUoFMlHyhMP3HVF7+jgJhklKTtrjNNCNkJZjBAWBEToYTWXUmXl6leDIgUVOFOnnTcIYmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=l9qsjsok; arc=none smtp.client-ip=173.203.187.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1717368499;
	bh=fEdyJr2xwOrft0K2KRoI8TPu48/300IApRVAjt9WA2o=;
	h=Date:From:To:Subject:From;
	b=l9qsjsokvXHBl7A0rHCZx6VR3Cq4Ye70R+dk2s9+gJ6345xEZRfs/CbcTC+8f+QLh
	 LsDyFvS0Wram4aJTVP3r7voIxk9XMQgnYqVtOG+Iv/LPoBvCOev9/VJg1iPwrZmkoH
	 FX8o7TAovDlTy9wCT94fHi2wrI7ZS10w98NQq3A0=
X-Auth-ID: lars@oddbit.com
Received: by smtp6.relay.iad3a.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 3DB155238;
	Sun,  2 Jun 2024 18:48:19 -0400 (EDT)
Date: Sun, 2 Jun 2024 18:48:18 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Chris Maness <christopher.maness@gmail.com>
Cc: linux-hams@vger.kernel.org
Subject: Re: [PATCH v5] ax25: Fix refcount imbalance on inbound connections
Message-ID: <d2ubjbplmewoo6fx6xyhwil4qyhjmx2qnitxja7qncltjnzmio@dl6la6i5et52>
References: <20240529210242.3346844-2-lars@oddbit.com>
 <171728283034.4092.12616353767873504629.git-patchwork-notify@kernel.org>
 <CANnsUMG4sqomBWpU95u1q+guCAt9-G12cBCcvqsndkBWKn8zzA@mail.gmail.com>
 <CANnsUMEM7pLgiTBzMXh7Ym5=dKJ01yCcZV4DZQgD7FnAGqZDYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANnsUMEM7pLgiTBzMXh7Ym5=dKJ01yCcZV4DZQgD7FnAGqZDYg@mail.gmail.com>
X-Classification-ID: ff747624-cfa1-4ace-8b5e-5e3dead30690-1-1

On Sat, Jun 01, 2024 at 04:37:35PM GMT, Chris Maness wrote:
> Is this the only patch to get the last stable branch off of the
> mainline (6.9) up to date?

Not entirely sure what you're asking there, but this is the only patch
I've found necessary to prevent the frequent kernel crashes I was
experiencing when working with ax.25.

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

