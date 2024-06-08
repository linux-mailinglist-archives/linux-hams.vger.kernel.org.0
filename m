Return-Path: <linux-hams+bounces-361-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E877900F29
	for <lists+linux-hams@lfdr.de>; Sat,  8 Jun 2024 03:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 255BCB23888
	for <lists+linux-hams@lfdr.de>; Sat,  8 Jun 2024 01:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F1E847A;
	Sat,  8 Jun 2024 01:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="UQ2LrWlK"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp97.iad3b.emailsrvr.com (smtp97.iad3b.emailsrvr.com [146.20.161.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4997B441F
	for <linux-hams@vger.kernel.org>; Sat,  8 Jun 2024 01:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717811960; cv=none; b=IrhQoGV2s35eN8GFU0LQzcrc6EzfIBR8PoQw5q8eYSKq+9GniZ5c2Wp2hte/PaXbwdW/xx8LZvCBk6JJOMXin9ZGh7P7SwR6G7pKCJDFAypyBWp1Hfinm+6jl95u6qYtM93191eMZCXyWYWCmLcEbBQKI2n8Vd/JOv10I6MMMvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717811960; c=relaxed/simple;
	bh=NIi9qXbqFcVUeLB2+3fT6Ihi6iGqA+s2JXaI9c5BUxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUM1oW5y26twKz+pFlOcuQmgFH+oWUHpc5vh/FjIkGqGUIPi8HYtKHEY7j4JH38UeI5mkbbtsFsi5b28UIIMQdffhDU+Ap+6Mzsf3kYXHSNotTlfMwOi8fKhSu6+h2RSFN2HnZWrirNSIfDv3eJiu9IylZM5fcmqN1MvO/bf5AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=UQ2LrWlK; arc=none smtp.client-ip=146.20.161.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1717811952;
	bh=NIi9qXbqFcVUeLB2+3fT6Ihi6iGqA+s2JXaI9c5BUxs=;
	h=Date:From:To:Subject:From;
	b=UQ2LrWlKanSSVn+KXLSYYanaXYY3YTVbN6kMUJY2ZlBkoN8jtIFW4BJKyH6+Cl6Ck
	 7S019/cL5t34JYdooa/Mpm52pKiRIdLBhlWTniUPXLROKFyCeOlzyR2iKDAj9gReap
	 foDVvoFsIooBP6JEh/2XA/yjreeE+mKzK1miMHX4=
X-Auth-ID: lars@oddbit.com
Received: by smtp13.relay.iad3b.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 8077D602C4;
	Fri,  7 Jun 2024 21:59:12 -0400 (EDT)
Date: Fri, 7 Jun 2024 21:59:12 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: David Ranch <linux-hams@trinnet.net>
Cc: linux-hams <linux-hams@vger.kernel.org>
Subject: Re: Kernel 6.9.1 AX.25 Crash
Message-ID: <3a4sohalyrvgnxyia3kmt3pbohcixtalk2vmxjxqio4a4e4hyl@tjt2ntm6a6rp>
References: <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn>
 <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
 <f27710b7-253c-79ce-e214-2b8251aceead@trinnet.net>
 <c3infeyajl4hr2tuyfmmccdv4gjbhsulaxuetozigqwqtj4jga@42eucxtsfk2y>
 <6e5f3lkbpd5u725kcaja65fncl5y436wlt6q26c4gigl7ppdip@anlb3w6gyjz2>
 <416ce037-7fb1-48d5-20ff-97b3d70bfaa6@trinnet.net>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <416ce037-7fb1-48d5-20ff-97b3d70bfaa6@trinnet.net>
X-Classification-ID: a9d43f46-41cc-497b-9a57-bfc4e4d100be-1-1

On Fri, Jun 07, 2024 at 06:49:57AM GMT, David Ranch wrote:
> I'm personally very interested in seeing this get into the Raspberry
> Pi Bookworm 6.6.x kernels.

I've submitted a pull request [1] against the Raspberry Pi 6.6.x kernel
tree. I don't know if that's the right way to do it or not; I guess
we'll find out.

[1]: https://github.com/raspberrypi/linux/pull/6213

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

