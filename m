Return-Path: <linux-hams+bounces-162-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 898C58B5549
	for <lists+linux-hams@lfdr.de>; Mon, 29 Apr 2024 12:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4F3EB22951
	for <lists+linux-hams@lfdr.de>; Mon, 29 Apr 2024 10:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA3139FE0;
	Mon, 29 Apr 2024 10:27:05 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from newsmtp.uns.ac.rs (smtp.uns.ac.rs [147.91.173.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F2B374E3
	for <linux-hams@vger.kernel.org>; Mon, 29 Apr 2024 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.91.173.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386425; cv=none; b=NIlFTKgNfMDyV89DFC0Mllv6Cr25Qr4bAJvCYFU72eoSkeEhZaZ+jJXAeSVSUO414bMBpWuyotXIY1vhVgyXDiAcDa9AdYt5Gjxls/aQQDktFCBSe3w1ez3BK7d/+BdUAn7RcofnYuWwkPaQHOyoHc1aKVoUe8WRKtzAUo3G5lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386425; c=relaxed/simple;
	bh=1rOJzk/RmPNx5X5HPiMqQNUci2rZ7zUtw6R+smzArc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VT6GdS1paQENuBO999C+AyYZj7D30K71mUGhE8Yrd1B+Dcc+Bb9jjwzUFd7QV/coZAcqWgQa14iDEJuj9ZNL4oP1E9X25KmVgwzLbJGzMD6o9kEe+y19VJjm36IkB9C8U8c+1UEiQev5xnkOMn/ybJlPocmrHzYTdFgZAZzCbGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uns.ac.rs; spf=pass smtp.mailfrom=uns.ac.rs; arc=none smtp.client-ip=147.91.173.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uns.ac.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uns.ac.rs
Received: from newsmtp.uns.ac.rs (localhost.localdomain [127.0.0.1])
	by localhost (Postfix) with ESMTP id 1572B259BD3;
	Mon, 29 Apr 2024 12:27:00 +0200 (CEST)
Received: from [147.91.175.29] (unknown [147.91.175.29])
	by smtp.uns.ac.rs (Postfix) with ESMTP id C52CB259BC4;
	Mon, 29 Apr 2024 12:26:58 +0200 (CEST)
Message-ID: <671c9c5b-4ed9-6463-224d-bf30338250ed@uns.ac.rs>
Date: Mon, 29 Apr 2024 12:19:43 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [...] unregister_netdevice: waiting for ax0 to become free. Usage
 count = -1
To: David Ranch <linux-hams@trinnet.net>, linux-hams@vger.kernel.org
References: <dd43a40e-ab22-a751-185f-3931ade2fa8f@uns.ac.rs>
 <840d1156-4aa0-8d13-5a17-7109eb771ef9@trinnet.net>
Content-Language: en-GB
From: Miroslav Skoric <skoric@uns.ac.rs>
In-Reply-To: <840d1156-4aa0-8d13-5a17-7109eb771ef9@trinnet.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Thank you, David. I'll check the link.

The machine experiencing the bug is Ubuntu 18.04 (i386 version that 
cannot be upgraded to any newer one.) And the kernel is an old one 
4.15.0-212-generic #223-Ubuntu SMP.

I suppose that any change will not be possible any time soon because 
that machine is not on the Internet, however serves me well for other 
purposes.

I just wanted to check if the issue was my fault or not :-)

Misko YT7MPB



On 4/28/24 10:03 PM, David Ranch wrote:
> 
> Hello Misko,
> 
> This is a kernel bug and has been discussed in the list (see the 
> archives): http://vger.kernel.org/vger-lists.html#linux-hams
> 
>     I recently responded with: 
> https://www.spinics.net/lists/linux-hams/msg05486.html
> 
> it seems to me that different kernel versions can hit this issue in 
> different ways but I can confirm that the Ubuntu 20.04 distro's 5.15.0 
> kernel hits this issue.  I'm also starting to believe that if 
> Canonical's kernel "LivePatch" feature is enabled and you have stale 
> AX.25 connections, the kernel starts to have issues and maybe after 
> ?5-7? days of decay, the machine will eventually hard lock up.  You 
> won't see the panic output if you're running X as the GUI displays hides 
> the output.  Btw, it's also becoming painfully obvious that different 
> Linux distro's version of "their" kernel might or might not be taking on 
> some of these new kernel "fixes" that break or fix parts of the AX.25 
> stack.  It's very clear to me, these patches are coming in w/o any real 
> testing and as long as it passes a visual review and it compiles, it's 
> committed into the tree.
> 
> I've since moved from u20.04 over to a Raspberry Pi OS Bookworm 6.6.20 
> kernel setup for ~2wks.  So far I haven't seen any similar issues 
> (except I found a new issue with the axparms tool now corrupting the 
> callsign+ssid stack).
> 
> --David
> KI6ZHD
> 
> 
> 
> 
> 
> 
> 
> Re: unregister_netdevice: waiting for ax0 to become free
> 
> 
> On 04/28/2024 08:57 AM, Miroslav Skoric wrote:
>> Hi,
>>
>> One of my two machines in the LAN goes into 'endless' repeating of the 
>> following lines when I want to shut it down. (Ok, not really endless 
>> but it does take some half an hour.) That comp runs an older version 
>> of ax25 subsystem and on top of it runs FPAC node and FBB mailbox. The 
>> issue happens whenever the *other* machine has some netrom activity 
>> such as a BPQ node/bbs or like.
>>
>> [...] unregister_netdevice: waiting for ax0 to become free. Usage 
>> count = -1
>> [...] unregister_netdevice: waiting for ax0 to become free. Usage 
>> count = -1
>> [...] unregister_netdevice: waiting for ax0 to become free. Usage 
>> count = -1
>> ...
>> ...
>>
>>
>> after some 30 minutes there appear two other lines:
>>
>>
>> [TIME] Timed out starting Power-Off.
>> [ !! ] Forcibly powering off: job timed out
>>
>>
>> and it resumes repeating the above for a while:
>>
>>
>> [...] unregister_netdevice: waiting for ax0 to become free. Usage 
>> count = -1
>> [...] unregister_netdevice: waiting for ax0 to become free. Usage 
>> count = -1
>>
>>
>> and it finally powers off after a minute or so.
>>
>> It makes me wonder why it behaves like that. I tested that behaviour 
>> thoroughly (by having the other machine running, or not running some 
>> packet node stuff) and realized that it shuts down properly, without 
>> any delay only when the other machine is not having any packet node 
>> active. (The other comp can be switched on, but without any node/bbs 
>> running.)
>>
>> Any idea?
>>
>> Misko YT7MPB
>>
> 
> 
> 


