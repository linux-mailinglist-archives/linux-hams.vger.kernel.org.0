Return-Path: <linux-hams+bounces-366-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5F290459D
	for <lists+linux-hams@lfdr.de>; Tue, 11 Jun 2024 22:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC721B25DE0
	for <lists+linux-hams@lfdr.de>; Tue, 11 Jun 2024 20:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F57152533;
	Tue, 11 Jun 2024 20:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="dZaFJ8vN"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp81.iad3a.emailsrvr.com (smtp81.iad3a.emailsrvr.com [173.203.187.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A7E156253
	for <linux-hams@vger.kernel.org>; Tue, 11 Jun 2024 20:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.203.187.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718136714; cv=none; b=MVG9jna8BVAlPwDk0I9ffDl3nYUjjltoG3aDcUNrbRd8l4f3FMuoCY6FnpjH9R2M1EsVtKmRtooII4njbNT5vrUOfuGN5yFQNmxPykYqfvLvMdwLsVVMDRTm8KL5DjtYThnNMgSi2UR6bwjxQSxkvQoT0U4kLR0Z2SQN893uvqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718136714; c=relaxed/simple;
	bh=KT7S0sXY5oVXxSzd3wtwA2qQSejOEMm9+u5UtxJpiLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AK8kwxnoaIPECZgTa5Hjw4KXv+HNRC/sdhoy5hpgsrKRI+YCMxiwOZEG1pJconfzX53CrZccJTqotcy1ZdDxVfz4oQFumx3S8EJTv58SZI8mgM37ydPYRsTwaIQjl5aXKTy9iCVtPZZSVLrH5JAQ2FlDIk7W53y7DXHjgZMhJyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=dZaFJ8vN; arc=none smtp.client-ip=173.203.187.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1718135560;
	bh=KT7S0sXY5oVXxSzd3wtwA2qQSejOEMm9+u5UtxJpiLA=;
	h=Date:From:To:Subject:From;
	b=dZaFJ8vNeyei8x7znLfdWMmBDoXtZ5vO6zA5Orgv5832LnS4oH083K+9cBFtn6dFv
	 tyvukZsTKsd6z76XVKLDhKGpJxQyT2U8lJTQ3mBlgTk2LJaqtPLghCHNoK3828NvOg
	 /5x7r9amDHC/AxeKRg3LxUoYrhfe/SSheS1qT/Xg=
X-Auth-ID: lars@oddbit.com
Received: by smtp19.relay.iad3a.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 3F6865369;
	Tue, 11 Jun 2024 15:52:40 -0400 (EDT)
Date: Tue, 11 Jun 2024 15:52:39 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Chris Maness <christopher.maness@gmail.com>
Cc: linux-hams@vger.kernel.org
Subject: Re: Backports to Longterm Releases?
Message-ID: <67fl4i565pq33sdomssxpxu4pg3jwpjzs7y7np6tiefli3sefm@76py5ouqljcd>
References: <CANnsUMGvdJqDa8eJJP5mub-rxMK-wJDRPG=9VPmgBuTbf_S+pA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANnsUMGvdJqDa8eJJP5mub-rxMK-wJDRPG=9VPmgBuTbf_S+pA@mail.gmail.com>
X-Classification-ID: a4c37e7d-0954-44dd-b67d-46b00e0c178f-1-1

On Mon, Jun 10, 2024 at 10:20:53PM GMT, Chris Maness wrote:
> I am wondering what needs to be done to get the code in 6.10
> backported to the longterm forks?  I tried just taking Lars' patch and
> applying it to 5.15.145, and failed to compile, so I am thinking there
> are a bunch of changes leading up to that that need to be applied.

I haven't looked at the 5.x series; it's possible that's a different set
of problems. I'll try poking at it this week to see if the issue (and
resolution) are similar.

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

