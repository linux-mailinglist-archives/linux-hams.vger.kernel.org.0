Return-Path: <linux-hams+bounces-398-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E23399502BF
	for <lists+linux-hams@lfdr.de>; Tue, 13 Aug 2024 12:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12A9C1C21F87
	for <lists+linux-hams@lfdr.de>; Tue, 13 Aug 2024 10:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321F776025;
	Tue, 13 Aug 2024 10:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blemings.org header.i=@blemings.org header.b="B+6mo/Fg"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFDF8BF3
	for <linux-hams@vger.kernel.org>; Tue, 13 Aug 2024 10:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723545928; cv=none; b=OKO94mmn5505NCW53T3FLHW9WwHn9c0VR/EmA0Qq3H//QDLRpYzlH6ThPWoB8QGUgmopi/tCr29UIE+DX6PKx9EjfvD0OU+dYD6dWziTUHXKq3aTZVE/d65+vbknEPJ67T8OdTI8ECz74gkU8O/cdFfcY+HUiMj51o46ziuHpkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723545928; c=relaxed/simple;
	bh=FSptDAdWtnpyOKbFF2AscBNkParHVVpoDVlMqG3RFsY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=WdHjvNlC/ID+mqWuQWs7AgmOZPX8xIpZNvU+O/zsGFn+RWoYWVu3FUt/FE2zThirBhsN+pY6LQIgw4oI1sKT9C6HBOzg0S1RbD78vIsO9qbGi52jTBLhPskC2l93Wkp1q2asX5vBWPbdIdJFVgZkWLsLQWbY8KRJbefRUQO15m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blemings.org; spf=pass smtp.mailfrom=blemings.org; dkim=pass (2048-bit key) header.d=blemings.org header.i=@blemings.org header.b=B+6mo/Fg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blemings.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blemings.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blemings.org;
	s=201708; t=1723545923;
	bh=1NbscYmQFALUCDjzuh2R+rY1lMELtST8xvTwTRORK5Y=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=B+6mo/FgsGsO9+HSlR5FFmewGSdUyvCRU4Kx0lpPWqM74Yqe9Cn2u3VG+FbvPjpir
	 KVzZRGTsqHTrP/Ks1NDEx+xA1x6nfcKWIEjlAS+0KLE1ug2TCAAf9+Rdx6kuVMJBLS
	 2d6ZGEjINND7VOV9t8pGVrFQFXFzmlgeqcHLpM7abXzR3VWMz5/b7EjMx91ZabEoIS
	 +jSrfNreWb4dKUr++QbdM46F6jE6ZkcrPK6xQqL/cQILj9SzUU6oIouz5KS4apZHlE
	 Om2mzFtT7YODCOwwiU8feg9vDxkZtlhzh2j4Ga1laqOJxWIAAgGlMIQlXrGxdGAYEs
	 cpD7UPPbQxltA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wjp1v1Bp1z4x6l;
	Tue, 13 Aug 2024 20:45:22 +1000 (AEST)
Message-ID: <1907cec3-4501-471f-b0ad-c4924adf94b3@blemings.org>
Date: Tue, 13 Aug 2024 20:45:22 +1000
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hugh Blemings <hugh@blemings.org>
Subject: Re: what does an APRS packet actually look like
To: Kristoff <kristoff@skypro.be>, linux-hams@vger.kernel.org
References: <0ea34aa4-d9cd-4c0e-9115-c8e68f02eae5@skypro.be>
 <5a8b4906-192f-4ea3-b483-f3bd25887f7d@skypro.be>
Content-Language: en-AU
In-Reply-To: <5a8b4906-192f-4ea3-b483-f3bd25887f7d@skypro.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kristoff, All,

I'll try give a little context, but it's from distant memory - others 
may well have a more recent perspective.

On 13/8/24 20:26, Kristoff wrote:

> [...]
>
> I am working to incorporate APRS into OpenRTX (an open-source firmware 
> for handheld radios project).
>
>
>
> Does anybody have an idea how to create a APRS-packet "in the real world".
>
> I have found all the needed information on how to create a 
> HDLC/AX.25/APRS packet according the specs, .. but I guess that 'real 
> life' application still do it differently.
>
Yes I would recall there being a certain amount of variation between the 
spec and what was used in the wild, particularly in the context of APRS 
where there were some optimisations/shortcuts used to minimise on air time
>
>
> I did some decoding of APRS packets I received on-air. I have three 
> questions:
>
> - the packet (obviously) needs a sync-pattern in front of the HDLC 
> packet, probably a '010101' pattern.
>
> How many sync-bits should one add to a APRS packet?
>
Most devices would allow this to be configured to suit local conditions 
and/or local norms for the particular APRS network in use
>
> How many should one add to a Mic-E packet?
>
Again it was usually configurable or set in firmware.

I seem to recall these were deliberately kept short as Mic-E was usually 
TX only so there was a motivation to mimise transmit time in case it was 
conflicting with another station.

It's a bit clumsy but you might find some hints on best practice in the 
older news group archives ?

> - On some website, I found references to packets containing not one, 
> but multiple 'HDLC flag' bytes and the beginning and the end of the 
> packet.
>
> Is that a good idea? How many should one do?
>
Unsure, sorry :(

>
> - The packets I have received and demodulated had -for some reason- a 
> 400 baud FSK (FSK not AFSK!) burst after the APRS packet.
> No idea why. It contained no data, just the burst with all '01'
>
> Anybody any idea why this is?
> (Or perhaps it's a bug? )
>
I would guess a bug.

Hope that helps, or at least gives another datapoint

vy73/Cheers,
Hugh
VK3YYZ/AD5RV

>
>
>
> Thanks in advance.
>
>
> Kristoff (ON1ARF)
>
>
>
>
>
>
> Op 08.08.24 om 09:06 schreef Kristoff:
>>
>> Hi all,
>>
>>
>> I am looking for source-code (C or C++) to implement APRS (APRS, AX25 
>> and micE) for an embedded device.
>>
>> What would be the best source for that?
>>
>> Is there "reference-code" for this?
>>
>>
>>
>> Cheerio! Kr. Bonne (ON1ARF)
>>

