Return-Path: <linux-hams+bounces-532-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F13E4AE9A0D
	for <lists+linux-hams@lfdr.de>; Thu, 26 Jun 2025 11:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3E677ACE47
	for <lists+linux-hams@lfdr.de>; Thu, 26 Jun 2025 09:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BDBC29C35F;
	Thu, 26 Jun 2025 09:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XypsRnvl"
X-Original-To: linux-hams@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E75518035
	for <linux-hams@vger.kernel.org>; Thu, 26 Jun 2025 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750930272; cv=none; b=iH1dkaRF9zi4Ktc9b3+ac08ErIdIDAiK0WPM62VA1X9izBbEdfj9lUwNLd97WxfovSLBJRfvVqwH6TAbL54No5B6Ad+FTDXVBXpefapie53wMfGiUKp5b1OtX01nkj7qeo5F+lP6DjCdiMT4inqtBina1ZzME+QsqpJ86ur8kYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750930272; c=relaxed/simple;
	bh=iV6sZecp/0ekGFb8aiEiBDamNCmKsCvEA/oF3WhwGx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNOvkNKS+M4bFq5odF9oBKRotu3MWwHpGdPZMXbpyE/vLv4vPahtnarK5+WddXPLMnwMCuhae7HGrauABYGnLMx2ZGMTw2mhYtz/+aJRexb2YxAF9qYnb3o++exk6avKjR5a/sTPtQjfoi0iA995fR2WExPN+X7ToR2O8IfVJto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XypsRnvl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750930270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JgNUE+XzivfXoCyzCi7KHp3ehpyfWekDKWAzGfVAe2I=;
	b=XypsRnvla56yBjossezeCdPoEqwoqMDNj68hKUgCLtApbaYWEGQv2nM6B1mgVIFId7g/PC
	/ZSxI2BfakmPGHpvmdGyXxHIU47xh7e0xh8PF4XygL8l57d+FXqXPUyhZpOepRDwppeJwD
	SDreU/frJHilLUvfwb5Hkds/ojF0fFM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-CXRxPiJzPkilctqZ_a7UGQ-1; Thu, 26 Jun 2025 05:31:08 -0400
X-MC-Unique: CXRxPiJzPkilctqZ_a7UGQ-1
X-Mimecast-MFC-AGG-ID: CXRxPiJzPkilctqZ_a7UGQ_1750930267
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so3938155e9.0
        for <linux-hams@vger.kernel.org>; Thu, 26 Jun 2025 02:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750930267; x=1751535067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JgNUE+XzivfXoCyzCi7KHp3ehpyfWekDKWAzGfVAe2I=;
        b=hyipLYD4Y9jk+HCGtpgKd+YQLgkUEXmgdE8BxgbuyClbg1LldxKCI1JsFE/UWQF4HZ
         0UEGUxVl9cbx7uguILDgqRlPwYCu/IKx7h9IGkHCjs9+846V73GyKLlWCauuDdb0lnw9
         nRaqTe5s24jBZzTaeDyHybpoBMoFEoilnyxZwiKWdjlsWHVo5lJKvww7DuGVPdNTvNQa
         0roFxQwtU40zJvwgzHYixyetS+AXC/R0mDUX78krJpesGahzfkNvK1vtTX6RwVWJgRvd
         en5MSw0JsShIsc5AusdXOoEcAG4mHxqXCqBXd5oIu3ByEfhGvVINuAdQ1NyAHiDNfpBP
         Ua2w==
X-Forwarded-Encrypted: i=1; AJvYcCUwnLFjw4zN85xLIpoq304mwTXGWkMZeRJjX5Qenj4f7A1N92I5JsXUV70BW/nLPythgq7dlGb6Wy0x@vger.kernel.org
X-Gm-Message-State: AOJu0YwQN3IQsJAl9DoNdKo/GRQXyXMuptKFV6gPL1QHgZJGs3QaF8Mz
	vMa+n9iobCgHrz/Oyjy8ldZPPPe2z9zJkhtlFLQp/TFxiGHsZLHqQSN+QDcGU+165A/4kpkZFkh
	AvsU5QHJMKar3+4ag/z6ZHM1NW15RnImMiuTLbrPyjHoRjKF6TxyLRIVGWrzZ0qk=
X-Gm-Gg: ASbGncv7wXRViq/3gqA8JTJRfSrHkTmPryLTCxptFUwyBOY012RdgZKnZkoVdmrvR62
	8IRvPB8whDrQUSp4QMsQLJYjvjlJp6MTUezdod35s/iJFOp0PDpAEUNQ37KCHwScaTadYvGOvR/
	+JQvKHVmEmI1ZyH0E80qDKMHlxXLs8wYMZBekvUp2+91r80gbV3MZXcjadInihtYNu+EfBZWWBX
	z3fwC29ADwuBe668xfHmi24TBRW6zoIFNGxBez/TPU6Ng0WF0Kl+eKAN5FurhN+aDKtfPS6Qzfa
	NFJ9TpP0DSHKKkt8n/3Ioxo7vQaopEgXXaASXMxt1dfQE9oy+6CXeanvC2l+qzLvrl+ekw==
X-Received: by 2002:a05:600c:3b03:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-45381af6a8fmr68716325e9.16.1750930267150;
        Thu, 26 Jun 2025 02:31:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgfmk2x3IGT4lfFfPj29nqAbQAOK8g0wuOO6mRNZ2Gy9Qr0EEdkOBTfnWk8apILg5ZGN1W9A==
X-Received: by 2002:a05:600c:3b03:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-45381af6a8fmr68715815e9.16.1750930266654;
        Thu, 26 Jun 2025 02:31:06 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:bd10:2bd0:124a:622c:badb? ([2a0d:3344:244f:bd10:2bd0:124a:622c:badb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453814ae64fsm31617725e9.1.2025.06.26.02.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 02:31:06 -0700 (PDT)
Message-ID: <7a25c9c4-610c-4e93-8855-1ec335cd2b64@redhat.com>
Date: Thu, 26 Jun 2025 11:31:04 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v1] rose: fix dangling neighbour pointers in
 rose_rt_device_down()
To: Kohei Enju <enjuk@amazon.com>
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org,
 kohei.enju@gmail.com, kuba@kernel.org, kuniyu@google.com,
 linux-hams@vger.kernel.org, mingo@kernel.org, netdev@vger.kernel.org,
 syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com, tglx@linutronix.de
References: <20250625095005.66148-2-enjuk@amazon.com>
 <20250625133911.29344-1-enjuk@amazon.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250625133911.29344-1-enjuk@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/25 3:38 PM, Kohei Enju wrote:
>> Message-ID: <20250625095005.66148-2-enjuk@amazon.com> (raw)
>>
>> There are two bugs in rose_rt_device_down() that can lead to
>> use-after-free:
>>
>> 1. The loop bound `t->count` is modified within the loop, which can
>>    cause the loop to terminate early and miss some entries.
>>
>> 2. When removing an entry from the neighbour array, the subsequent entries
>>    are moved up to fill the gap, but the loop index `i` is still
>>    incremented, causing the next entry to be skipped.
>>
>> For example, if a node has three neighbours (A, B, A) and A is being
>> removed:
>> - 1st iteration (i=0): A is removed, array becomes (B, A, A), count=2
>> - 2nd iteration (i=1): We now check A instead of B, skipping B entirely
>> - 3rd iteration (i=2): Loop terminates early due to count=2
>>
>> This leaves the second A in the array with count=2, but the rose_neigh
>> structure has been freed. Accessing code assumes that the first `count`
>> entries are valid pointers, causing a use-after-free when it accesses
>> the dangling pointer.
> 
> (Resending because I forgot to cite the patch, please ignore the former 
> reply from me. Sorry for messing up.)

This resend was not needed.

> 
> The example ([Senario2] below) in the commit message was incorrect. 

Please send an updated version of the patch including the correct
description in the commit message.

[...]
>> @@ -497,22 +497,14 @@ void rose_rt_device_down(struct net_device *dev)
>>  			t         = rose_node;
>>  			rose_node = rose_node->next;
>>  
>> -			for (i = 0; i < t->count; i++) {
>> +			for (i = t->count - 1; i >= 0; i--) {
>>  				if (t->neighbour[i] != s)
>>  					continue;
>>  
>>  				t->count--;
>>  
>> -				switch (i) {
>> -				case 0:
>> -					t->neighbour[0] = t->neighbour[1];
>> -					fallthrough;
>> -				case 1:
>> -					t->neighbour[1] = t->neighbour[2];
>> -					break;
>> -				case 2:
>> -					break;
>> -				}
>> +				for (j = i; j < t->count; j++)
>> +					t->neighbour[j] = t->neighbour[j + 1];

You can possibly use memmove() here instead of adding another loop.

/P


