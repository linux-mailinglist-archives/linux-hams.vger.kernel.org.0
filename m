Return-Path: <linux-hams+bounces-301-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E062F8CC550
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 19:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE2711C20F29
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 17:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02171140E5C;
	Wed, 22 May 2024 17:06:43 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE99C1F17B
	for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 17:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.78.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716397602; cv=none; b=ihjpS7GeFTeAglyKpYWyb9b3ruPPdPXB0vSKzyXnihVIDgIEiUCjCSG8N+P04wqLtscHag7q9T0kEDIwcXmJSw9uHii2vzfpIKzMd0mad5Bx0LoEOch49Mpqf4yb+PJ8j9n90s2QwlgKQj5ySggEEQxQCnBX0S2ftsmzQvZmrMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716397602; c=relaxed/simple;
	bh=W2CaKK9Kt0IlqusU8Az6Kv+Fdb4fJeRBg9rG5gtYIws=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=OFx+obOddS2H1OOnIH6iLkwmndrzpKlE7qSiRSRnm/54al6KLJBGmSDhemBkHft7roh0MM7QZWniAn1epPfVVEchX0uDQwdVyXRTpHQ03jwcY9GJZZ3jbhmJvLm6pGcJLahCSQ9ZX1k6y6nNG0t16Ls5wrUawVcyI0oWXtME0ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net; spf=pass smtp.mailfrom=trinnet.net; arc=none smtp.client-ip=96.78.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 44MH6ZsI030119;
	Wed, 22 May 2024 10:06:35 -0700
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Chris Maness <christopher.maness@gmail.com>, Dan Cross <crossd@gmail.com>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn>
 <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
 <f27710b7-253c-79ce-e214-2b8251aceead@trinnet.net>
 <c3infeyajl4hr2tuyfmmccdv4gjbhsulaxuetozigqwqtj4jga@42eucxtsfk2y>
 <CAEoi9W5cmv-mQAsKPYTfjAytfp9Mvf3WgRQ9Ni=sznrU0v+NDQ@mail.gmail.com>
 <CANnsUMG42uECBVKFAPrwprakAGd=+KPE-WOAgS47nzKjWKawuw@mail.gmail.com>
Cc: Lars Kellogg-Stedman <lars@oddbit.com>, Duoming Zhou
 <duoming@zju.edu.cn>,
        linux-hams@vger.kernel.org, dan.carpenter@linaro.org
From: David Ranch <linux-hams@trinnet.net>
Message-ID: <aaf87a7e-af08-4544-8c33-0e71396909cf@trinnet.net>
Date: Wed, 22 May 2024 10:06:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CANnsUMG42uECBVKFAPrwprakAGd=+KPE-WOAgS47nzKjWKawuw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Wed, 22 May 2024 10:06:36 -0700 (PDT)


Hello Everyone,

> I think in doing this you will orphan a lot of important software that
> relies on the kernel space ax.25 stack.

I agree with Dan's idea that moving the Linux AX.25 stack out from 
kernel space could help on the maintenance side but it would absolutely 
neuter things when it comes to all the rich packet routing options that 
the kernel offers today.

One thing that could be considered is an alternative libax25 library 
that could redirect ax25/netrom/rose packet I/O from going to the kernel 
and instead, send that traffic to a userland program.  Maybe that could 
be Direwolf or QtSoundmodem, etc.  I think this could work for most of 
standard (more simplistic) packet radio use cases.  I've mentioned this 
idea some time ago to both Thomas Osterried DL9SAU who is the maintainer 
of the "Official" AX.25 userland tools as well as Lee Woldanski VE7FET 
who maintains a fork of the AX.25 userland tools but there never has 
been much interest.

Maybe someone here on this list might be interested in taking a stab at 
it?  I don't have the programming chops to write the code but I could 
absolutely help on many other aspects (integration, testing, etc) if needed.

--David
KI6ZHD

