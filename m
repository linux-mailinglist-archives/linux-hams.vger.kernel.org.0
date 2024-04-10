Return-Path: <linux-hams+bounces-92-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A14D89E7A8
	for <lists+linux-hams@lfdr.de>; Wed, 10 Apr 2024 03:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98E01282747
	for <lists+linux-hams@lfdr.de>; Wed, 10 Apr 2024 01:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6EC64A;
	Wed, 10 Apr 2024 01:19:01 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C538B38D
	for <linux-hams@vger.kernel.org>; Wed, 10 Apr 2024 01:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.78.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712711941; cv=none; b=Fcc2pljvNzjRUpyMXqWLX1S/wXNKYXBuxstDs8e+HVQfJmoTnXgVK6flO9o7POTxvDHB+RE5FhSc/QWeer04E5Tu7KAnusubzhRJlnjboYiBo5mb+2IpHi67d8YdQj0j9i9A5HxFQcWGfknm8EtMLgthomzxvyQBGAznpIW2z+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712711941; c=relaxed/simple;
	bh=tdcd2ppPWgTtbNxpiBd/UuKD56B9kTcacroWWUbGepE=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Vmmk5XMlSxUuXdZ5/WA1JRdW1Bhs8JoyomkzWgjrCUkPPtNKLK+qHMPiFZo/wrMNjg2czomEp6fy0GcR7xYqVcunH0DmZ/LD3N5ULFDfnau0KkjQ0xDG9/dSMQVLtmEyMBpNEtTM1Jr9pfNBNOelrOnG7LyZ3wUpG0hCey75MGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trinnet.net; spf=pass smtp.mailfrom=trinnet.net; arc=none smtp.client-ip=96.78.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 43A0KaQe031736;
	Tue, 9 Apr 2024 17:20:36 -0700
Subject: Re: unregister_netdevice: waiting for ax0 to become free
To: Lars Kellogg-Stedman <lars@oddbit.com>, linux-hams@vger.kernel.org
References: <CA+Q+rdzYUcfYF8CcX1WOWjVBYiZgidFAY1M0kR4J4KL73yN9yA@mail.gmail.com>
From: David Ranch <linux-hams@trinnet.net>
Message-ID: <ec2c8d79-2efa-3607-7cb6-f57b46c7fdae@trinnet.net>
Date: Tue, 9 Apr 2024 17:20:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CA+Q+rdzYUcfYF8CcX1WOWjVBYiZgidFAY1M0kR4J4KL73yN9yA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Tue, 09 Apr 2024 17:20:37 -0700 (PDT)


Hello Lars,

> First, apologies if this isn't the right place for this. I know this
> is primarily a development list, but I'm trying to track down patches
> for a kernel issue.
This is the right place for this Linux AX.25 kernel bug


> I'm running a kernel built from 2c71fdf02a9, which includes the recent
> use-after-free patch from Duoming Zhou in fd819ad3ec.

Few questions:

   - Which specific kernel version does that commit go into?
   - What distro and version of distro
   - Which ax.25 lib/apps/tools are you using (distro provided, 
official, ve7fet, other) and which versions?


> After bringing
> up ax.25 (see below), If I make a single ax.25 connection to the host
> (to an ax25d hosted service), it will subsequently fail to reboot; the
> kernel gets stuck waiting for an ax.25 interface:
>
>       3   [  217.717327] unregister_netdevice: waiting for ax0 to
> become free. Usage count = 0

Yup.. I've seen that and if you have people making connections to you 
that later time out, you will probably see stale sessions per "netstat 
-A ax25 -an".  Pay attention to the DESTINATION column.  I know Ubuntu 
20.04 with both it's standard and ESM kernels being impacted.  I 
recently started testing with the Raspberry Pi Bookworm 6.6.20 kernel 
but have only been running it for a week.  The reality here is that 
unless you know exactly what commits have been applied to a specific 
vendor's kernel, the version number alone cannot tell you if the fix is 
present.


> The kernel will get stuck here indefinitely (or until the watchdog
> triggers). I know this isn't a new problem, but is it one for which
> patches exist? There's a lot of older information out there

There are various threads about this very issue on various lists be it 
this one, Pat (winlink client), etc.   Here is a sample of my running 
list of issues:
--
Last good known kernel version
-----------------------------------------------------------
02/04/24:

I know I am jumping in late here, but the AX.25 stuff mostly works on 
kernel version 4.19, and does ok on 5.15 with some patches. Version 6 
just seems to explode.  I am running my linux/AX.25 on an old version of 
Slackware (13.37) that runs kernel version 2.6, and it is running 
perfectly for all the stuff I am using.  It is kind of sad that this has 
been neglected for that long.

-Chris KQ6UP


Raspberry Pi OS specific:
    - Bullseye, which should have the 5.15.xx kernel.

    - Buster has a release of 4.19 kernel I'll test also.


2/2/24: ve1jot@eastlink.ca
Ahh, well, there's been work done since kernel 5.15, I think it was 
kernel 6.2 I was trying, and that was for a different reason than 
crashing..there was an issue with axip/axudp links going dead and I 
found that kernel 6.2 seemed to resolve this issue, but I'm not sure if 
any of the recent patches address all problems, or just a few hi...

2/5/23:  jon-bousselot@pacbell.net
If I'm seeing this correctly, the stable kernel tree for rpi does NOT 
have the ax25 patches applied.
The ax25 patches do appear in 5.15.y and the 6.1.y.  The only two I 
checked.



Patches
-----------------------------------------------------------

Detailed 5.10.x fixes and a good kernel compile howto from Chris Madness:
https://groups.io/g/KM4ACK-Pi/topic/howto_patch_the_kernel_for/95904470?p=,,,20,0,0,0::recentpostdate/sticky,,,20,0,0,95904470,previd%3D0,nextid%3D1691495389076951633&previd=0&nextid=1691495389076951633


https://blog.habets.se/2021/11/AX25-user-space.html
    - known issues
    - proposed userspace solution

1/8/24: known kernel issues
https://groups.io/g/RaspberryPi-4-HamRadio/message/15430

12/23/24: Other reports of kernel panics, bugs:
https://groups.io/g/RaspberryPi-4-HamRadio/topic/103374879#15603

5/22/22:  stale sessions
https://github.com/la5nta/pat/issues/352

--


> website in the mailing list welcome message
> (https://radio.linux.org.au/) appears to have gone away.

Where did you see that?  That site has been gone for years and whatever 
is giving you that old link needs to be updated.


> I'm running a test environment with a pair of AXUDP interfaces; I'm
> configuring things like this:

While I don't see why it isn't legal, I've never seen people use socat 
to link together kissttach'ed link.

--David
KI6ZHD

