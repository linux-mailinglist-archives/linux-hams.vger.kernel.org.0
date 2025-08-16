Return-Path: <linux-hams+bounces-560-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3884BB29023
	for <lists+linux-hams@lfdr.de>; Sat, 16 Aug 2025 20:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 248DF1BC2C19
	for <lists+linux-hams@lfdr.de>; Sat, 16 Aug 2025 18:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3DE1EFF92;
	Sat, 16 Aug 2025 18:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="LC78k60W"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1551C2DB2;
	Sat, 16 Aug 2025 18:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755369953; cv=none; b=e94UCbyxE9HtHWPM/UpyiBHukguMtZ5yqy2UQSqvVomKNwtDDYjncs6qIqGWsoVT9nVk7lwcvsCAbIs/zhB/wUpLd3FmaRCLt278DwAJa8dU5DsHzvvxAn+GcI1f11xQJwqcCUOmBxaKrqOl3CbfjfwKYgBx5KSDEmsi67ExRps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755369953; c=relaxed/simple;
	bh=8aYSOySoEz7FCu7GTPtcv6KZfxK2OsnYq3gGWh5IHSA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=anHEA2VZHzNe7yWCddHCQMhP+RtelWuQE4y+bT0vkUUQ7KeZiH2ypxP+WE15Lqxh8cYiViUv/8zaIPTm+78YibcBfROg+1MadIlYZTb/xRo4auD6ePPzNxvePaHr5Ffp64SkFf0DTxmdYkMKOVM2gsL9IlmB5/jPvFI2cXdUStk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=LC78k60W; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: bernard.pidoux@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id E7E6219F5BA;
	Sat, 16 Aug 2025 20:45:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1755369949;
	bh=8aYSOySoEz7FCu7GTPtcv6KZfxK2OsnYq3gGWh5IHSA=;
	h=Date:Subject:From:To:Reply-To:References:In-Reply-To:From;
	b=LC78k60W+P0RXRlTG3oMP72KzlfV2ZaVwqumlh85/3xm8Ty245jBPMhp3TCKJruO9
	 rHrC+6s2iiVlWa6nS13XRX7K+DfabpZXXIGnLIMeXVVSB1vda3CPRmxccU9n8Ga1gD
	 b4+B9ahbFhmbU53q/fwsk5fW7BuhFLDLr6odDGR2/qxmxeYN2Xnr54Bu072jSrJke+
	 82b2+InFztAtfD5cdL2l5uWfaqem0eqvb2B+YBM0obAe9FJ5Ay5TFJuHo071OdiP24
	 BMsjp+kDES5sljky8mgetFxVOeX1aSxUtWo6nBQUVjwgPfJnxfUXcXfHda135MIRp1
	 EtZQp4yoxlW5Q==
Message-ID: <e92e23a7-1503-454f-a7a2-cedab6e55fe2@free.fr>
Date: Sat, 16 Aug 2025 20:45:46 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
From: Bernard Pidoux <bernard.pidoux@free.fr>
To: David Ranch <dranch@trinnet.net>, linux-hams@vger.kernel.org,
 netdev <netdev@vger.kernel.org>
Reply-To: Bernard Pidoux <bernard.pidoux@free.fr>
References: <11c5701d-4bf9-4661-ad8a-06690bbe1c1c@free.fr>
 <fff0b3eb-ea42-4475-970d-30622dc25dca@free.fr>
Content-Language: en-US
In-Reply-To: <fff0b3eb-ea42-4475-970d-30622dc25dca@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

David,

For some reason my messages are not accepted by vger.kernel.org despite 
I configured thunderbird not to send html.

I just compiled and loaded kernel 6.15.1.

Up to now FPAC 4.1.4 is running fine and performing connexions with 
neighbour ROSE nodes.

I will let it run a while before starting to apply progressively the 
AX25 and ROSE patches committed in kernels 15.2 to 15.10

I will start with ax25 ones and see what happens.

73 de Bernard f6bvp / ai7bg



Le 16/08/2025 à 19:49, Bernard Pidoux a écrit :
> Hi David,
> 
> Actually Ubuntu stops responding without any message. No more response 
> from keyboard or mouse. Only switch power !
> 
> I am working on activating kernel messages on oops.
> 
> The bug is already present in 6.15.10 so there is no reason to look at a 
> more recent version.
> 
> I will report any progress if I find something interesting.
> 
> This is quite a challenge for me as I did not perform this kind of 
> kernel investigations since nearly a decade...and I am not getting younger !
> 
> 73 de Bernard, f6bvp / ai7bg
> 
> 
> Le 16/08/2025 à 19:32, David Ranch a écrit :
>>
>> Hey Bernard,
>>
>> Thanks for posting this issue.  Can you copy/paste in the Oops you're 
>> seeing?  I did see a recent ROSE issue on 6.16.0-rc6-next-20250718- 
>> syzkaller and I wonder if that could have created this issue:
>>
>> https://groups.google.com/g/syzkaller-bugs/c/0TmBbcJ2PKE
>>
>> Btw, I would say that posting this to netdev@vger.kernel.org would 
>> probably be more important than this Debian list since this is most 
>> likely a kernel issue and not a distro issue per se.
>>
>> --David
>> KI6ZHD
>>
>>
>> On 08/16/2025 10:02 AM, Bernard Pidoux wrote:
>>> Hi,
>>>
>>> I am continuously working on AX25 ROSE/FPAC node since decades, 
>>> running a number of RaspBerry Pi (Raspi OS 64bit) plus Ubuntu LTS on 
>>> a mini PC.
>>>
>>> Stable FPAC version 4.1.4 is performing packet switch quite well 
>>> although some improvements are underway.
>>>
>>> FPAC runs flawlessly with kernel 6.14.11.
>>>
>>> However, trying FPAC under stable kernel 6.15.10 experienced a frozen 
>>> system when issuing some commands like connect request.
>>>
>>> Investigations seem to show that ax25 connect is fine and that the 
>>> bug is probably in ROSE module .
>>>
>>> I am presently trying to find the faulty bug that triggers the kernel 
>>> oops by compiling and installing previous kernel versions starting 
>>> with 6.15.1.
>>>
>>> 73s de Bernard, f6bvp / ai7bg
>>>
>>> http://f6bvp.org
>>>
>>


