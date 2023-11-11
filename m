Return-Path: <linux-hams+bounces-5-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FDE7E897B
	for <lists+linux-hams@lfdr.de>; Sat, 11 Nov 2023 07:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA812B20C0C
	for <lists+linux-hams@lfdr.de>; Sat, 11 Nov 2023 06:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924D56FC7;
	Sat, 11 Nov 2023 06:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKjnFmH2"
X-Original-To: linux-hams@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF196FBD;
	Sat, 11 Nov 2023 06:16:30 +0000 (UTC)
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E02421C;
	Fri, 10 Nov 2023 22:16:28 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-58786e23d38so1582878eaf.3;
        Fri, 10 Nov 2023 22:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699683387; x=1700288187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QrI9vZKDek1tIeFt5gh+W4x7vSBsa7cCvKx3i4hMZUg=;
        b=hKjnFmH2b5nfNiYNvebscUwBdRBrxfu+2/5DVUBZQe00MJvAC3x6OQf+GoE7HMoM47
         9wh8rIN2+UVqxk7i7/CUup5rB7862l90rVR2ElnWFA5vD7cqFSIMwCj6h862ntwKS+0B
         kFI+n6fza5ZOyHfYO+Zkhv/ZCEm8DxCttpze/wXFyA9pk/6xSnNRiOGqh24l+beFoVM4
         V6Af55RJbUcO2T7kLlSx09bvNZSN87GWcTwCyI6oMNOljmB0UpoK8JlnplASd4i4rbzw
         qkkAs66BVFBYl/nMY0iT4hGgcxiBzlfvSIufHFdt/MHRaG9F8IvAyAly3xpu/SoWXgtp
         C7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699683387; x=1700288187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrI9vZKDek1tIeFt5gh+W4x7vSBsa7cCvKx3i4hMZUg=;
        b=fipReqBYac9yxdazikbDPjslmBlfYZhx2U3R7on89N1q9uNDVKsvSodkCGdUFHuIjA
         IbE8ZO0Qwoac1y2uhCjLAVjRZSNZvGDFc4I7huzKtimasKOScr5Vtcxg8oHrg1y6lIjZ
         q8gWZm4pXtD7uEO9G/ap+SSVU5gzIPiIjiFhGXrxwOzCODOBsvTQdunBxDWgFzv+5wS8
         09VtBed4uRqgMVsqpivZIcj7lYx8pGgeWpFxlCJpneI1TzJmpKEDw7nKyDVnku9ME3I5
         IhEsZpogdIEwgJCCUk+ScletuS1eSaiLBEWyYB0esnvrmlT/n/tYAvPTBtKU1WiBsmO7
         pLBg==
X-Gm-Message-State: AOJu0Ywq7J/84UiOJzR/P4Ry1FWWs+qERW4FOtM+hA6sXuT8wRF4aKeu
	fktM6VloWHBjys8tBs0/RTA=
X-Google-Smtp-Source: AGHT+IHxm7+O8Lnr+DnWRJVJqFYhjmXh8x+psbnYQVwlMKTgGCoLSjY7aHLGhQCng5I/mHuSev/HuQ==
X-Received: by 2002:a05:6870:fb87:b0:1e9:bd5c:ae40 with SMTP id kv7-20020a056870fb8700b001e9bd5cae40mr1873631oab.38.1699683387478;
        Fri, 10 Nov 2023 22:16:27 -0800 (PST)
Received: from [192.168.1.4] ([59.182.200.204])
        by smtp.gmail.com with ESMTPSA id e16-20020aa78250000000b006c346c98a90sm680322pfn.92.2023.11.10.22.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 22:16:26 -0800 (PST)
Message-ID: <16a0e7e8-a03a-401e-a25a-a12b07d621a3@gmail.com>
Date: Sat, 11 Nov 2023 11:46:20 +0530
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: memory leak in nr_rx_frame
Content-Language: en-US
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org,
 syzbot+0145ea560de205bc09f0@syzkaller.appspotmail.com
References: <20231110173632.2511-1-bragathemanick0908@gmail.com>
 <20231110213147.68823-1-kuniyu@amazon.com>
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
In-Reply-To: <20231110213147.68823-1-kuniyu@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/11/23 03:01, Kuniyuki Iwashima wrote:
> From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
> Date: Fri, 10 Nov 2023 23:06:32 +0530
>> The condition (make = nr_make_new(sk)) == NULL suggests
>> that nr_make_new allocates memory and returns a pointer.
>> If this allocation fails (returns NULL), it indicates a
>> potential memory leak.
> If make is NULL, nothing is allocated and leaked here, and
> your code will never be executed as "if (make)" is always false.
>
>
>> Added sock_put() for make which can potentially solve
>> this issue
> Sounds like the patch is not tested with kmemleak.

Yes, Had some issue with reproducer. So, haven't tested it

>
>
>> Reported-by: syzbot+0145ea560de205bc09f0@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=0145ea560de205bc09f0
>> Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
>> ---
>>   net/netrom/af_netrom.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
>> index 0eed00184adf..7d7cda4ae300 100644
>> --- a/net/netrom/af_netrom.c
>> +++ b/net/netrom/af_netrom.c
>> @@ -970,6 +970,8 @@ int nr_rx_frame(struct sk_buff *skb, struct net_device *dev)
>>   		nr_transmit_refusal(skb, 0);
>>   		if (sk)
>>   			sock_put(sk);
>> +		if (make)
>> +			sock_put(make);
> Also, make could be uninitialised here if the first two
> condition is true.
>
>     if (sk == NULL || sk_acceptq_is_full(sk) ||
>
>
>>   		return 0;
>>   	}
>>   
>> -- 
>> 2.34.1


Sorry for the inconvenience, let me check the code and get back properly.

Thanks,
Bragathe



