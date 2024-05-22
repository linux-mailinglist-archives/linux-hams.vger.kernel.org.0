Return-Path: <linux-hams+bounces-300-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 985A08CC4AB
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 18:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 553BA281F5F
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 16:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BB6140E3C;
	Wed, 22 May 2024 16:10:26 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAEC013E03E
	for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 16:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.78.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716394225; cv=none; b=D5Vvmu3YTkcKcmkVK+jdBkdxYVqxEFADPK0zf2aOf0XfsMy7x0t9PaDeG+FdOnFXjbLO8WHf4CSWOWs4vhGgTGq6Hm8NxDATpsId3gCoyMN39+SoDl67UK43stqh1Arl2jZA2FnfysCJJ5dvIfGOUWJgUCKZrMN1Z8DOmZt/1Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716394225; c=relaxed/simple;
	bh=V6NbfnhpthY+Xzo+nEnldjNDyqdNeWO9/NCXuw5TF3Q=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=sioVsyPrmwbd+O89ToMKkkDrUDB5bpRW/kNSFvnUIGs4672KW/RvsmPvzFFCBiSd7x40T0JnSJRBCH1m2s8Ibyhglu+PahKDp1FK2fN5ieC1W3rWcIVOYZkl619hBkec0LvcNOpvbEsAQKVWq1APS52DN9U6JGf7uVUYHk008kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net; spf=pass smtp.mailfrom=trinnet.net; arc=none smtp.client-ip=96.78.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 44MGABY8029899;
	Wed, 22 May 2024 09:10:11 -0700
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Lars Kellogg-Stedman <lars@oddbit.com>
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
Cc: Chris Maness <christopher.maness@gmail.com>,
        Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
        dan.carpenter@linaro.org
From: David Ranch <linux-hams@trinnet.net>
Message-ID: <bdcc8a74-2218-6570-eb93-8cfc00b13781@trinnet.net>
Date: Wed, 22 May 2024 09:10:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <c3infeyajl4hr2tuyfmmccdv4gjbhsulaxuetozigqwqtj4jga@42eucxtsfk2y>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Wed, 22 May 2024 09:10:12 -0700 (PDT)


Hello Lars,

> That's good to know! I based that on the amount of traffic I see here on
> the linux-hams list, and the difficulty in getting anybody to offer an
> opinion (or an alternative to) these changes. If there is a more active
> forum where people are talking about Linux and amateur radio I'm happy
> to join there as well.

Just to name a few, consider joining:

    Direwolf software-tnc:  https://groups.io/g/direwolf

    Raspberry Pi HAM Radio: https://groups.io/g/RaspberryPi-4-HamRadio


> I think this would typically be the job of a subsystem maintainer; this
> is another way in which the lack of a maintainer hurts the
> ax.25 stack.

But since there isn't one.. why are these broken commits still being 
allowed?


> Have you put together an ax.25 test suite? I put together an automated
> test for the particular problem I'm trying to resolve (that was
> necessary in order to successfully use `git bisect run`); collecting
> these sorts of things in one place would be a great step forward.

I've offered to do so but I never received any response.  I need to know 
what is needed here:

    - Just document various testcase scenarios?

    - Create automation to run the test cases?  In what language?  Bash? 
  Python?  Perl?  JavaScript?

    - Create a set of pre-configured inter-connected VM images for 
running automated tests?  If so, what format, what CPU architecture, etc


>> I am hugely grateful to you (Lars) on being able to submit some meaningful
>> fixes and was able to get them committed to the mainline.
>
> Just to clear, that hasn't happened yet! The patch needs to get
> approved first.

Sigh... ok.


>> The next major hurdle that I would love to get feedback on is how to
>> get these new changes but also create a set of backported fixes
>> committed into various Linux distributions kernels that don't strictly
>> follow the mainline kernel.  My personal interest is in the Raspberry
>> Pi OS kernel

My primary focus is on Raspberry Pi as well but also X86 computers too.


> I'm running this patch on kernel 6.6.30 on my Raspberry Pi systems; you
> can find the patch against 6.6.30 here:
>
>   https://github.com/larsks/ax25-debugging/tree/main/patches-for-6.6.30
>
> It's made my Pis much more stable. I think that if the patch gets
> accepted for the mainline kernel it should be relatively easy to get
> into the Raspberry Pi kernel as well.

Are you patching and compiling the Raspberry Pi OS specific kernel tree 
or are you using the mainline Linux-Next or primary Linus tree?

--David
KI6ZHD

