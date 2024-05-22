Return-Path: <linux-hams+bounces-309-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3808CC6B0
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 21:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38806281934
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 19:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6104920DF4;
	Wed, 22 May 2024 19:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="oiHAQExv"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp100.iad3b.emailsrvr.com (smtp100.iad3b.emailsrvr.com [146.20.161.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CB04C9A
	for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 19:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716404523; cv=none; b=lMAhMQXiKAtSXaKyVr3U3Op9xsgyHM77sFmuj0Rupr3NOlqqFSvKzao10wwPucEhf95VZlXlrtAhfKlsaU6591UF1uNmuQrsHZcc+/DRxKzLHTPcrRoWen5s2gBDlE8+KiQ0D9ceyo+Jt3NQrl1n76N1yQwAYM935HSCrdRIi84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716404523; c=relaxed/simple;
	bh=H0zTzTCjK4soBCluEyuZgoRZslqdQkTfZ1JW+hfHOHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0fWMsqyvCsSd17aQ+NJEt4JITZI9+j7H42AQ3kHNBV6P3FH0MZbF0ah1V+fk09Jdf3j2pCeLkZWNfZs2BH9BHfuwoXEL2o0EyOM6uqhiJdSf3a07DGnqoUzy3lpjffcSb14cZsZxQ7X7XEN7Yq1qyk5YJZzv3Gf88WY4/A/ZKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=oiHAQExv; arc=none smtp.client-ip=146.20.161.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1716402337;
	bh=H0zTzTCjK4soBCluEyuZgoRZslqdQkTfZ1JW+hfHOHk=;
	h=Date:From:To:Subject:From;
	b=oiHAQExvHkQi+FCTU5AkFRv2ZiD9ZGEeVITNRlYY063hcU6W35WH5upv66LG7QzoG
	 tmeD+QECQ5J9Ek8s9qPl0ZVBvhWdF3An4TzhsqeKR7JsONYA7HLFcJmhJtO4x+b2cZ
	 eSHiW+ZkWgb3DrXMR1NQ5l6GyEfnywhpikrZ1/Xw=
X-Auth-ID: lars@oddbit.com
Received: by smtp5.relay.iad3b.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id EB525400C8;
	Wed, 22 May 2024 14:25:36 -0400 (EDT)
Date: Wed, 22 May 2024 14:25:36 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3] ax25: Fix refcount imbalance on inbound connections
Message-ID: <yzz225joxbxptlrdqjr4u2cwk4myactk6ozz7bfpv25dqbzri4@mz5ocbxbefxp>
References: <46ydfjtpinm3py3zt6lltxje4cpdvuugaatbvx4y27m7wxc2hz@4wdtoq7yfrd5>
 <20240521182323.600609-3-lars@oddbit.com>
 <20240522100701.4d9edf99@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522100701.4d9edf99@kernel.org>
X-Classification-ID: 227f8a22-6abb-4b73-b50d-84d59eab2358-1-1

On Wed, May 22, 2024 at 10:07:01AM GMT, Jakub Kicinski wrote:
> correct fixes tag for this hash would be:
> 
> Fixes: 7d8a3a477b3e ("ax25: Fix ax25 session cleanup problems")

Jakub,

Thanks for the correction; I'll submit a new patch with a correct Fixes:
tag, but...

> Please CC maintainers (per script/get_maintainer.pl)

...the ax.25 tree is currently orphaned:

    AX.25 NETWORK LAYER
    L:	linux-hams@vger.kernel.org
    S:	Orphan
    W:	https://linux-ax25.in-berlin.de
    F:	include/net/ax25.h
    F:	include/uapi/linux/ax25.h
    F:	net/ax25/

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

