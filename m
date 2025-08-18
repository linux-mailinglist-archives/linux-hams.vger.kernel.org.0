Return-Path: <linux-hams+bounces-562-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD765B29EE3
	for <lists+linux-hams@lfdr.de>; Mon, 18 Aug 2025 12:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F2CE17A988
	for <lists+linux-hams@lfdr.de>; Mon, 18 Aug 2025 10:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F2B3112B6;
	Mon, 18 Aug 2025 10:13:10 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from vps001.vanheusden.com (fatelectron.soleus.nu [94.142.246.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DCE273D65;
	Mon, 18 Aug 2025 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.246.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755511990; cv=none; b=LzdUnSvwUCPH20R1mzAGNj624hUxtQnFVm8HqpY31Qj+gPORNrxZhUksqAinOgqRTEvLultTPiIJ2yUDmsAwV+lio8BJKiXVmvSf/jgC7LbCP+wOq12K0WUXvD9lXD9txpzuCrw6n+qBs73CbiqjX2yWKAbk8xNp10a99ng6xYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755511990; c=relaxed/simple;
	bh=ZlxYiXZYWSzDfPDTW01mRTD49zmTG73+TBn2R9YARug=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=lhVOlX+85/0mx555i6j7vtWbbGgCfKXzWLdYsPmerhyIO+IxCwvEIeKpp/wDC/trOvosy+rT4Vk8a5mkeY5/8NfDrHXszg1Bt4avMYNJJlyG+PtQEMPWwu2OrTtpTpRkxELlNUe675HGcruBZCefDfQE7f1LZJr+krmWtanBD8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vanheusden.com; spf=pass smtp.mailfrom=vanheusden.com; arc=none smtp.client-ip=94.142.246.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vanheusden.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vanheusden.com
Received: from webmail.vanheusden.com (unknown [172.29.0.1])
	by vps001.vanheusden.com (Postfix) with ESMTPA id 26F245008F8;
	Mon, 18 Aug 2025 12:04:17 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 18 Aug 2025 12:04:17 +0200
From: Folkert van Heusden <folkert@vanheusden.com>
To: Bernard Pidoux <bernard.pidoux@free.fr>
Cc: David Ranch <dranch@trinnet.net>, linux-hams@vger.kernel.org, netdev
 <netdev@vger.kernel.org>
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
In-Reply-To: <acd04154-25a5-4721-a62b-36827a6e4e47@free.fr>
References: <11c5701d-4bf9-4661-ad8a-06690bbe1c1c@free.fr>
 <fff0b3eb-ea42-4475-970d-30622dc25dca@free.fr>
 <e92e23a7-1503-454f-a7a2-cedab6e55fe2@free.fr>
 <acd04154-25a5-4721-a62b-36827a6e4e47@free.fr>
Message-ID: <af3344165cd51561f92449a27841f41d@vanheusden.com>
X-Sender: folkert@vanheusden.com
Organization: www.vanheusden.com
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Looks like the issue I reported a few weeks ago.
In my case not related to rose, only new connections.

On 2025-08-18 12:00, Bernard Pidoux wrote:
> Hi,
> 
> I captured a screen picture of kernel panic in linux-6.16.0 that 
> displays [mkiss]. See included picture.
> 
> Bernard
> 
> 
> Le 16/08/2025 à 20:45, Bernard Pidoux a écrit :
>> David,
>> 
>> For some reason my messages are not accepted by vger.kernel.org 
>> despite I configured thunderbird not to send html.
>> 
>> I just compiled and loaded kernel 6.15.1.
>> 
>> Up to now FPAC 4.1.4 is running fine and performing connexions with 
>> neighbour ROSE nodes.
>> 
>> I will let it run a while before starting to apply progressively the 
>> AX25 and ROSE patches committed in kernels 15.2 to 15.10
>> 
>> I will start with ax25 ones and see what happens.
>> 
>> 73 de Bernard f6bvp / ai7bg
>> 
>> 
>> 
>> Le 16/08/2025 à 19:49, Bernard Pidoux a écrit :
>>> Hi David,
>>> 
>>> Actually Ubuntu stops responding without any message. No more 
>>> response from keyboard or mouse. Only switch power !
>>> 
>>> I am working on activating kernel messages on oops.
>>> 
>>> The bug is already present in 6.15.10 so there is no reason to look 
>>> at a more recent version.
>>> 
>>> I will report any progress if I find something interesting.
>>> 
>>> This is quite a challenge for me as I did not perform this kind of 
>>> kernel investigations since nearly a decade...and I am not getting 
>>> younger !
>>> 
>>> 73 de Bernard, f6bvp / ai7bg
>>> 
>>> 
>>> Le 16/08/2025 à 19:32, David Ranch a écrit :
>>>> 
>>>> Hey Bernard,
>>>> 
>>>> Thanks for posting this issue.  Can you copy/paste in the Oops 
>>>> you're seeing?  I did see a recent ROSE issue on 
>>>> 6.16.0-rc6-next-20250718- syzkaller and I wonder if that could have 
>>>> created this issue:
>>>> 
>>>> https://groups.google.com/g/syzkaller-bugs/c/0TmBbcJ2PKE
>>>> 
>>>> Btw, I would say that posting this to netdev@vger.kernel.org would 
>>>> probably be more important than this Debian list since this is most 
>>>> likely a kernel issue and not a distro issue per se.
>>>> 
>>>> --David
>>>> KI6ZHD
>>>> 
>>>> 
>>>> On 08/16/2025 10:02 AM, Bernard Pidoux wrote:
>>>>> Hi,
>>>>> 
>>>>> I am continuously working on AX25 ROSE/FPAC node since decades, 
>>>>> running a number of RaspBerry Pi (Raspi OS 64bit) plus Ubuntu LTS 
>>>>> on a mini PC.
>>>>> 
>>>>> Stable FPAC version 4.1.4 is performing packet switch quite well 
>>>>> although some improvements are underway.
>>>>> 
>>>>> FPAC runs flawlessly with kernel 6.14.11.
>>>>> 
>>>>> However, trying FPAC under stable kernel 6.15.10 experienced a 
>>>>> frozen system when issuing some commands like connect request.
>>>>> 
>>>>> Investigations seem to show that ax25 connect is fine and that the 
>>>>> bug is probably in ROSE module .
>>>>> 
>>>>> I am presently trying to find the faulty bug that triggers the 
>>>>> kernel oops by compiling and installing previous kernel versions 
>>>>> starting with 6.15.1.
>>>>> 
>>>>> 73s de Bernard, f6bvp / ai7bg
>>>>> 
>>>>> http://f6bvp.org
>>>>> 
>>>> 
>> 


-- 
www.vanheusden.com

