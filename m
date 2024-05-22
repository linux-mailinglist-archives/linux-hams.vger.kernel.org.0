Return-Path: <linux-hams+bounces-312-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 105848CC84B
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 23:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCD32281191
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 21:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BE51420BB;
	Wed, 22 May 2024 21:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="MwI1z262"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp102.ord1d.emailsrvr.com (smtp102.ord1d.emailsrvr.com [184.106.54.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E120D1BF2A
	for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 21:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716414708; cv=none; b=e0wTGHdJInviE2f3bOa5BIX9RcGtHeE0YUJmRumkalm6ckOe3cec8wTlMu+rKNstry2sfxHpEy9igdYhAEOWfL7QrhZ7o6VZY5jkrRg19vp06Rnei6F0zGvu1a1Jm6FaZm8ZnXfw19bc5lCUoEKSzpWBXWvXetOdXt1e41lVSXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716414708; c=relaxed/simple;
	bh=LXIPduKO6O1n0ro4vsxYdIEglx5SujULQ8vkdQwSi9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAX6acxsrz6XLWc59ka42qowt4ecitupS/35DMMN0zmUwkGPhplI+nFivvblvwXDob28LaQVN1e28a37zy2vj+GRD/Ydo2zW1HeeFQDAeRB2yZw+I+ymMjPNaCUuCKQxeL68Wgs0mfsR9IVsjIsjmJM64O+KQCRkReG91Zv23OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=MwI1z262; arc=none smtp.client-ip=184.106.54.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1716405827;
	bh=LXIPduKO6O1n0ro4vsxYdIEglx5SujULQ8vkdQwSi9w=;
	h=Date:From:To:Subject:From;
	b=MwI1z262xpFJ861CUXvU0V+GYSt73KCVUMixpojwW2Z/nwok+J63/inS7zsYpyefh
	 vH9JVKr6hMgLkmNZ6MaQYVLhYrq7djT53VTl0DYP/ghwN3s6/5SPrBQvUW0CxI3yM0
	 FL0VW+1bBh7iyHov0HAdUR19czxDn2cR8HjVm4jY=
X-Auth-ID: lars@oddbit.com
Received: by smtp21.relay.ord1d.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 510126014D;
	Wed, 22 May 2024 15:23:47 -0400 (EDT)
Date: Wed, 22 May 2024 15:23:46 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Dan Cross <crossd@gmail.com>
Cc: David Ranch <linux-hams@trinnet.net>, 
	Chris Maness <christopher.maness@gmail.com>, Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, 
	dan.carpenter@linaro.org
Subject: Re: Kernel 6.9.1 AX.25 Crash
Message-ID: <g2tpfzyhdwq2ink7phx3hpt4djjqpihf2efmcz4lwypwkgnhon@ihnhjwbj6lp7>
References: <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
 <f27710b7-253c-79ce-e214-2b8251aceead@trinnet.net>
 <c3infeyajl4hr2tuyfmmccdv4gjbhsulaxuetozigqwqtj4jga@42eucxtsfk2y>
 <CAEoi9W5cmv-mQAsKPYTfjAytfp9Mvf3WgRQ9Ni=sznrU0v+NDQ@mail.gmail.com>
 <v6ybd4paw7eossjr2qiqvi5zqmvub7avy4cxpd6oyhfattia6j@ygablb7u2rpr>
 <CAEoi9W7VJhnSMD=YJX-92Lmxo+y6if_rFCAPrJiwJ8iuxz_7Bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEoi9W7VJhnSMD=YJX-92Lmxo+y6if_rFCAPrJiwJ8iuxz_7Bw@mail.gmail.com>
X-Classification-ID: 2941b35e-0db9-4391-8fca-1c9d7e608afd-1-1

On Wed, May 22, 2024 at 02:37:06PM GMT, Dan Cross wrote:
> Maybe the best way to proceed is an informal PoC that amounts
> to, "look, here's a git repo and a Makefile that'll generate a bunch
> of unlinkable object files, but compiled entirely out of tree and in
> userspace."

+1 :).

Wondering out loud: Direwolf already has a user-space ax.25 implementation
(and apparently IL2P); would that be a better starting point than the
kernel implementation?

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

