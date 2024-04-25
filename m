Return-Path: <linux-hams+bounces-132-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 400A58B25AC
	for <lists+linux-hams@lfdr.de>; Thu, 25 Apr 2024 17:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C70021F21FA3
	for <lists+linux-hams@lfdr.de>; Thu, 25 Apr 2024 15:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A081CF8A;
	Thu, 25 Apr 2024 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="ivfuOrBY"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp111.ord1d.emailsrvr.com (smtp111.ord1d.emailsrvr.com [184.106.54.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F6114D2BB
	for <linux-hams@vger.kernel.org>; Thu, 25 Apr 2024 15:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714060307; cv=none; b=ImpFt59TGNhw7pIFJEA20nw9b9NZ2S7TF2rjpzhv1nF/OJbxGKv8NARTzA24eSO7tBS720VPlL5cql5dSNEw0l3bPPK5eASdQxomtD7Sswj9hQGJBocyPbv7coz6G6sFmE0LuwHG2OqlbjlIyVBr4VeVXZpyXUQfRzaAfRL22Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714060307; c=relaxed/simple;
	bh=8su5ddkVxLjT4CZLnwND7nRyX372j/Rz4pyZtNz6DJk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftfTNrL4XCXjOFBvRwA/0KbwD/Gp4BRXMrvjOT/NFR/9zMN7gNGNaAr8M3GE7Z/cowOit6iREUR9RYH4oB+fOmCckZO/T4ruEr5BBPC8omMbwhTALcWdp7dUYto2KWFUpnsNcaYYN76+5N87ImS68PCcUpFrWXsHEKPvHvPmrZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=ivfuOrBY; arc=none smtp.client-ip=184.106.54.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1714047288;
	bh=8su5ddkVxLjT4CZLnwND7nRyX372j/Rz4pyZtNz6DJk=;
	h=Date:From:To:Subject:From;
	b=ivfuOrBYCTZUeq5aGrSEFNuxUQP4A+hgLecb0Khj42vNaHBPPKbedx+MErdgq+3Jb
	 3Rc1+ShrxYFggy9cCFhjWnfs8h6DbtIWDwnKv0I7F6b4fhHEiGpZZBcSxvP8m7jQ3G
	 sH2870m8bKftLvXhPj1l15ZypQA1PjERiZTUKj6E=
X-Auth-ID: lars@oddbit.com
Received: by smtp6.relay.ord1d.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 8EA42E0250
	for <linux-hams@vger.kernel.org>; Thu, 25 Apr 2024 08:14:48 -0400 (EDT)
Date: Thu, 25 Apr 2024 08:14:48 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: linux-hams@vger.kernel.org
Subject: Re: unregister_netdevice: waiting for ax0 to become free
Message-ID: <krtmg7zird2nromfjnyywytlrjclvbgp3vtj56wk2ajzzoeilf@x4v2ohdtmjxt>
References: <CA+Q+rdzYUcfYF8CcX1WOWjVBYiZgidFAY1M0kR4J4KL73yN9yA@mail.gmail.com>
 <p6r6irutux5upw6fuauhczw6dedirm5tr26wnmyunlv44gzjtn@ev4nqkqdh2ip>
 <hkgoneb732pm7cqc2wisrrducn3pdcxaauoeli6u7tgdigovax@oattb6ovobyq>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hkgoneb732pm7cqc2wisrrducn3pdcxaauoeli6u7tgdigovax@oattb6ovobyq>
X-Classification-ID: a4ae6a1f-5515-4ec5-8bd6-dcdf6cc3cee8-1-1

On Tue, Apr 23, 2024 at 10:06:44PM -0400, Lars Kellogg-Stedman wrote:
> It looks like we may be failing to increment the refcount on the
> *listening* socket when a connection is established...but we're
> decrementing it when the connection is closed, leading to problems.

The above problem can be resolved by adding a call to ax25_dev_hold() in
ax25_accept(), but it looks like a similar situation exists in the
device refcount (ax25_dev->dev->dev_refcnt), which also decrements for
every connection and ultimately experiences an underflow (1 -> 0 -> -1073741824).

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

