Return-Path: <linux-hams+bounces-632-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D50DB5022E
	for <lists+linux-hams@lfdr.de>; Tue,  9 Sep 2025 18:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19B723B7DDB
	for <lists+linux-hams@lfdr.de>; Tue,  9 Sep 2025 16:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AE033472A;
	Tue,  9 Sep 2025 16:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="squrIVOB"
X-Original-To: linux-hams@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E41A2581;
	Tue,  9 Sep 2025 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757434325; cv=none; b=qiKRzh1jJvw2+zGIyGXk6CtXoZJ9u3odLaOd6UJvA/bpW9djqWuH8vlrNxdR1Cx2Z109ERjiAVyFEN8AFCAep4kEyuB8JQyyV1xRmpxC9vJf5RUbPcN9Gq4vAJIJljwVsLMwiERY14TyxStvVkdJBbqZC9J+ZmTnwIDoOPnZmHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757434325; c=relaxed/simple;
	bh=KWJO1mWBhaaqzegxn2s40Wj54RATRMRuHiIK0Hk3FlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYYJb7fhHg+OEIEF0VDNUTLMW2eyZrkbC1q4gKxSxkZa7u8Gta/9/QGdoJXJZ+/HnKp5ftAnhdNizK53C2SFcrxQ8aVMN3Gf43Qo+Ltm7taU+Ak91uzsE3ve1olxKlCdCht/dVbi1YO9FuWhyJ6HOSZJn3rBcXcIKTNkVHBOC2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=squrIVOB; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uzK1dUZ9FMUQmdKK3K1OXQDGNntrMAJXDWQ3xCvzia8=; b=squrIVOBNgD0IKQRbll45+J8wz
	9LrPptKJ/PaoajoPcVwmU8QSknQJiNt+e2Rce1IqrGgIq8OT/fdLRilPnb6T3PJXZZh+zG+vwBu9F
	oaZJ0ETaW6miQ8TzRA27gctPCgKXB4CKk+HWwpoSXR1xvV14+Wc/0nUdR8jlBfbNCYKM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uw0wo-007ou2-8V; Tue, 09 Sep 2025 18:11:58 +0200
Date: Tue, 9 Sep 2025 18:11:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bernard Pidoux <bernard.pidoux@free.fr>
Cc: linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	David Ranch <dranch@trinnet.net>, Lee Woldanski <ve7fet@tparc.org>,
	Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH] [AX25] fix lack of /proc/net/ax25 labels header
Message-ID: <7741c41f-ea8d-44d2-bf62-8aab659a4368@lunn.ch>
References: <E3ABD638-BF7B-4837-8534-F73A1BB7CEB3@gmail.com>
 <e949c529-947f-4206-9b03-bf6d812abbf2@free.fr>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e949c529-947f-4206-9b03-bf6d812abbf2@free.fr>

On Tue, Sep 09, 2025 at 05:38:32PM +0200, Bernard Pidoux wrote:
> 
> [PATCH]  [AX25] fix lack of /proc/net/ax25 labels header
> 
> /pro/net/ax25 never had a chance to be displayed in easily
> understandable format.
> 
> First reason was the absence of labels header, second reason was
> pourly formated proc/net/ax25 lines.
> 
> Actually ax25_info_start() did not return SEQ_START_TOKEN and there was no
> test for displaying header in ax25_info_show().
> 
> Another reason for lack of readability was poorly formatted /proc/net/ax25
> as shown:
> 
> 00000000fb21b658 ax0 F6BVP-12 * 0 0 0 0 0 10 0 3 0 300 0 0 0 10 5 2 256 0 0
> 14949
> 
> The proposed patch initializes SEQ_START_TOKEN in ax25_list_start and add a
> test for first time displaying header in ax25_info_show().
> 
> In addition this patch provides a better formated display of /proc/net/
> ax25 aka /proc/net/nr or /proc/net/rose
> 
> magic            dev src_addr  dest_addr digi1     digi2 .. st vs vr va
> t1     t2      t3     idle    n2   rtt window  paclen Snd-Q Rcv-Q  inode
> 0000000040471056 ax0 F6BVP-13  F6BVP-9   -         -         3  5  4  5
> 0/03   0/3   189/300   0/0    0/10    1   2      256    *     *     *
> 000000002f11c115 ax0 F6BVP-13  F6BVP-11  -         -         3  5  4  5
> 0/06   0/3   155/300   0/0    0/10    3   2      256    *     *     *
> 00000000c534288b ax0 F6BVP-12  *         -         -         0  0  0  0
> 0/10   0/3     0/300   0/0    0/10    5   2      256    0     0     50994
> 

All files in /proc are ABI. You need to include in your commit message
a justification for breaking the ABI backwards compatibility and
potentially breaking any applications which are using this file, even
if it is not so easy to read.

I would also suggest you read:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
https://docs.kernel.org/process/submitting-patches.html

    Andrew

---
pw-bot: cr

