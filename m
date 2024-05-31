Return-Path: <linux-hams+bounces-352-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C62E8D64C1
	for <lists+linux-hams@lfdr.de>; Fri, 31 May 2024 16:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19B43288811
	for <lists+linux-hams@lfdr.de>; Fri, 31 May 2024 14:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B824957888;
	Fri, 31 May 2024 14:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="NemfQdvc"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp95.iad3a.emailsrvr.com (smtp95.iad3a.emailsrvr.com [173.203.187.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E5256448
	for <linux-hams@vger.kernel.org>; Fri, 31 May 2024 14:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.203.187.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717166811; cv=none; b=YSd7Zifcq2S67Kngh/ujKrAw7/agE+DewTeTdmsdl+dvGl1AgEgw1bLyhSrm7+tNjMXDsXj3Grak9l7nKby3eMdjXwkXLnETS+onul7YCIdca2HBX1ksde9/bve6/QXVAnG++7KYviM2k+Am1i9rp++AY/rMVrnG10QpFE3j/9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717166811; c=relaxed/simple;
	bh=JB9QpwF6z4UCQRIkzEa4XaW6aldVA5NcHNimULkqBmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6TSklWYVOZ8sIOIXmycOR7PvGlXZkXoSnH2Ncvg5G0I/Qa2O3YkCaNL7zSRLl01otkLxUk+4eu6KNmFyq8h0mxfKjZi/uxHxfBOs7cHwz7affCXkhXiRM/4haETQTUZQC+2rnwChnJO6wzk1kqOUksSbcjNXkA6K630oKQu51Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=NemfQdvc; arc=none smtp.client-ip=173.203.187.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1717165631;
	bh=JB9QpwF6z4UCQRIkzEa4XaW6aldVA5NcHNimULkqBmg=;
	h=Date:From:To:Subject:From;
	b=NemfQdvclzfSqb56pjylFjyZe3PjAyPHQ8q1mJzuAvTosdJ+voXmVYL2+LH4fGrb6
	 EowLVybBon0IYCqhVnMSxAj4M1OV+mWP1iGQ1QniBTCjBrR8yZfrY6jer+8lPeJDta
	 GkJGM1rgj4FF+UoibFAR9yGf7NwONmJMZ8WTasiE=
X-Auth-ID: lars@oddbit.com
Received: by smtp28.relay.iad3a.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 6DF415BF8;
	Fri, 31 May 2024 10:27:11 -0400 (EDT)
Date: Fri, 31 May 2024 10:27:11 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Mike Quin <mike@elite.uk.com>
Cc: linux-hams <linux-hams@vger.kernel.org>
Subject: Re: Kernel fails to flush queues when closing sockets
Message-ID: <pjzz5muu67xvq5qldilqb5r3h2zlkqlzme5w7rk4t2ocabqheo@2g226jrueeas>
References: <2qncrme5xuch2w2vzznk5eoiebdiiwcwck3dmxet73mzos7zh2@lgdxko4x5bsj>
 <6B8661C5-4FC3-44DB-8B3B-AD1621091988@elite.uk.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6B8661C5-4FC3-44DB-8B3B-AD1621091988@elite.uk.com>
X-Classification-ID: dd727b0e-e382-4427-a7c7-7bfaeeb9342a-1-1

On Thu, May 30, 2024 at 09:50:55PM GMT, Mike Quin wrote:
> I encountered similar issues running simple commands (such as fortune)
> from ax25d - it was necessary to add a "sleep 1” to the end of the
> script to get any output at all.

Mike,

Thanks for chiming in. If I put together a patch for this (no guarantees :) ), I'll ping you
for testing.

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

