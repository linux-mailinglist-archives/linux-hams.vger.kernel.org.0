Return-Path: <linux-hams+bounces-279-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC478CA59C
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 03:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 899E8B21494
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 01:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D402FBEA;
	Tue, 21 May 2024 01:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="M88JcXmn"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp126.ord1d.emailsrvr.com (smtp126.ord1d.emailsrvr.com [184.106.54.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845307F
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 01:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716253608; cv=none; b=KZJTeYbYH6TERoNrplUnRNN+8dDNujI5/4CGjGUAZC3UaIGFvJUzZtFcgLx1KkfhWR3VNvgPPQL5hpxSEqUYj6PtOm/vCmmMObm//2J1cTahdYNUnboF+6PRIeuM3HHM1G5V/cpL1Wld1+xxO7ffo2KW7GMxTMUKQc6hGPZkoZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716253608; c=relaxed/simple;
	bh=QhMOyL8mPSp93+TVzadwweOCMfRfM1Z2duJHkOmGYWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WeMRjDqJw1VIf559TWlA/ePICjvmUoGgASh//ax20H46K0oGAj7IqmFk+ckZ46B1sn71OGuL2J0alnOUGRxkML3/1kiggn3D7mycBp4VMLm5lhxz/egQH6ne1bWpEx9iDlVNsZmy1xKRHs41uF8M5sPGnS0EGc3Ca8OxwSIy9YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=M88JcXmn; arc=none smtp.client-ip=184.106.54.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1716252514;
	bh=QhMOyL8mPSp93+TVzadwweOCMfRfM1Z2duJHkOmGYWA=;
	h=Date:From:To:Subject:From;
	b=M88JcXmnT1+0nwPAvq8fD/V5un/7NSomDtYin1crsZHAlbgnvAqzFJqLOmAv4h5y1
	 e3GFMuUeDO761C9dg7dXo5hmInCPffP8QkAHEo2rFLfqYihcse3hkCLzW7+cOJ8RvL
	 /BS0fb6U+xix/DFY/4ha/n0AEZUpfvKiAkNJYH4E=
X-Auth-ID: lars@oddbit.com
Received: by smtp8.relay.ord1d.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 9E2E3C006D;
	Mon, 20 May 2024 20:48:34 -0400 (EDT)
Date: Mon, 20 May 2024 20:48:34 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Chris Maness <christopher.maness@gmail.com>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, 
	dan.carpenter@linaro.org
Subject: Re: Kernel 6.9.1 AX.25 Crash
Message-ID: <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn>
 <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
X-Classification-ID: 63ff0e7a-65fc-41b4-8063-11896e14bd17-1-1

On Mon, May 20, 2024 at 05:11:39PM GMT, Chris Maness wrote:
> Your patch seems to have fixed the issue so far.

That's great! I'm glad it helped.

> How come this patch is not included in the mainline source?

Well, partly because you're the first person to confirm that it works
for someone besides me :). Dan (Cross) has offered to test it out as
well; if I can get a couple of confirmations that it's working, I'll
probably go ahead and submit it to netdev.

The bigger issue has been that there are very few people interested in
the ax.25 support in the kernel; there's not a real maintainer, so it's
difficult to get code approved. There were some concerns expressed that
maybe this isn't the *correct* fix, but I would argue that even if it's
not the most correct fix we should try to get it in anyway, since
otherwise ax.25 is completely broken.

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

