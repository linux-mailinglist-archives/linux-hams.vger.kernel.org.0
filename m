Return-Path: <linux-hams+bounces-360-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F28900645
	for <lists+linux-hams@lfdr.de>; Fri,  7 Jun 2024 16:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6DBD1C21F05
	for <lists+linux-hams@lfdr.de>; Fri,  7 Jun 2024 14:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C39F194C8B;
	Fri,  7 Jun 2024 14:19:01 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C8E190672
	for <linux-hams@vger.kernel.org>; Fri,  7 Jun 2024 14:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.78.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717769940; cv=none; b=if5F57B4V6yeEQklNZs4cI1+mQReUpRQoN0uVejAAwTkieUxKaFd1Abxwfmy4baqoRjjofi6kKM5qE8Kgf0ePGu3eAu8x/M/BfhGgDUGOhTKMrWNQgWlqJhndMrdszm8zsNv1VVC2h7dlf8QzmHjol6shHKhAtwSPgZOnx6aVrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717769940; c=relaxed/simple;
	bh=SPuP/rAg8PGdYtJfXOTUFkUcAcHwuGOCcCnzL4PShI0=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=MYUmKbgXNEdFABVOoKDbHt4c0CXfEc3R0+chHX4YoaNkKckevNX4UITHqN3TiHV9e8H5vADIWJ4/4YjJvUKiUehHtl691NqcZl39f8lCQ6sDmXvzvob3LTjM91ylf6jzPGAII1rTtt1XwO+CmOcQqj7TAvr20NlKxwkLVk8lUQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net; spf=pass smtp.mailfrom=trinnet.net; arc=none smtp.client-ip=96.78.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 457DnvtO021868;
	Fri, 7 Jun 2024 06:49:58 -0700
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Lars Kellogg-Stedman <lars@oddbit.com>,
        linux-hams <linux-hams@vger.kernel.org>
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
 <6e5f3lkbpd5u725kcaja65fncl5y436wlt6q26c4gigl7ppdip@anlb3w6gyjz2>
Cc: Chris Maness <christopher.maness@gmail.com>
From: David Ranch <linux-hams@trinnet.net>
Message-ID: <416ce037-7fb1-48d5-20ff-97b3d70bfaa6@trinnet.net>
Date: Fri, 7 Jun 2024 06:49:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <6e5f3lkbpd5u725kcaja65fncl5y436wlt6q26c4gigl7ppdip@anlb3w6gyjz2>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Fri, 07 Jun 2024 06:49:58 -0700 (PDT)


Hello Lars,

Thank you and all that helped get this fix into the kernel!  Beyond the 
fix being available in 6.9.1, what can be done for the various LTS 
kernels?  I'm personally very interested in seeing this get into the 
Raspberry Pi Bookworm 6.6.x kernels.

--David
KI6ZHD


On 06/07/2024 05:01 AM, Lars Kellogg-Stedman wrote:
> On Tue, May 21, 2024 at 02:12:06PM GMT, Lars Kellogg-Stedman wrote:
>> On Tue, May 21, 2024 at 08:53:06AM GMT, David Ranch wrote:
>>> I am hugely grateful to you (Lars) on being able to submit some meaningful
>>> fixes and was able to get them committed to the mainline.
>>
>> Just to clear, that hasn't happened yet! The patch needs to get
>> approved first.
>
> The patch has been merged into the mainline kernel:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3c34fb0bd4a4237592c5ecb5b2e2531900c55774
>

