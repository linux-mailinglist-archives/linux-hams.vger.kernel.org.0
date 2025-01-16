Return-Path: <linux-hams+bounces-468-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE59A13A07
	for <lists+linux-hams@lfdr.de>; Thu, 16 Jan 2025 13:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E908B3A5935
	for <lists+linux-hams@lfdr.de>; Thu, 16 Jan 2025 12:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E407C1DE893;
	Thu, 16 Jan 2025 12:38:11 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D211E50B;
	Thu, 16 Jan 2025 12:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737031091; cv=none; b=RLZjp5fp6tBXcCKNMaHzE2nS33YDP3DtKeQkfYGALDeWr660EkxnXH4Z5t+QFvysjBvsUycfYgeKfWTaP97dbepI5Fs/xH6emwlafxQihRs99dJBAkvVIbN2oVRJ+gjjP/DIFOMd8v6gIk4X7WpYFXoj1bWjxg8pBOPlpa+rNGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737031091; c=relaxed/simple;
	bh=jonUW3dEfOtfI8lihvuawd6C1cWCqfdoW81F2sROXnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=e0aKh4T521DBxSNnninRVVEFGPiJyL1QJY2bGwsRY6fp/Ztw0NSQCvQL510mh+ymhJU/PKob+oyIkr3ld6Z4EyoLcOYy3PfGDg6C2W+xzqUggLFLK0Vih2ljDkSLsYCPBG46VyTnmEdrx1lKm/Iw9NF8IjBX+p3j5suou61WUos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 16 Jan
 2025 15:38:02 +0300
Received: from [192.168.211.130] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 16 Jan
 2025 15:38:02 +0300
Message-ID: <f5a76ca2-33cd-471d-8997-797a9a070804@fintech.ru>
Date: Thu, 16 Jan 2025 04:37:59 -0800
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net/rose: prevent integer overflows in
 rose_setsockopt()
To: Su Hui <suhui@nfschina.com>, David Laight <david.laight.linux@gmail.com>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	<linux-hams@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>,
	<stable@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <6f79c23a-7acb-5faf-5e8d-104ca37dbb08@nfschina.com>
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Content-Language: en-US, ru-RU
In-Reply-To: <6f79c23a-7acb-5faf-5e8d-104ca37dbb08@nfschina.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Hello,

On 1/15/25 18:04, Su Hui wrote:
> On 2025/1/16 07:29, David Laight wrote:
>> On Wed, 15 Jan 2025 08:42:20 -0800
>> Nikita Zhandarovich <n.zhandarovich@fintech.ru> wrote:
>>
>>> In case of possible unpredictably large arguments passed to
>>> rose_setsockopt() and multiplied by extra values on top of that,
>>> integer overflows may occur.
>>>
>>> Do the safest minimum and fix these issues by checking the
>>> contents of 'opt' and returning -EINVAL if they are too large. Also,
>>> switch to unsigned int and remove useless check for negative 'opt'
>>> in ROSE_IDLE case.
>>>
>>> Found by Linux Verification Center (linuxtesting.org) with static
>>> analysis tool SVACE.
>>>
>>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>>> ---
>>>   net/rose/af_rose.c | 16 ++++++++--------
>>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
>>> index 59050caab65c..72c65d938a15 100644
>>> --- a/net/rose/af_rose.c
>>> +++ b/net/rose/af_rose.c
>>> @@ -397,15 +397,15 @@ static int rose_setsockopt(struct socket *sock,
>>> int level, int optname,
>>>   {
>>>       struct sock *sk = sock->sk;
>>>       struct rose_sock *rose = rose_sk(sk);
>>> -    int opt;
>>> +    unsigned int opt;
>>>         if (level != SOL_ROSE)
>>>           return -ENOPROTOOPT;
>>>   -    if (optlen < sizeof(int))
>>> +    if (optlen < sizeof(unsigned int))
>>>           return -EINVAL;
>>>   -    if (copy_from_sockptr(&opt, optval, sizeof(int)))
>>> +    if (copy_from_sockptr(&opt, optval, sizeof(unsigned int)))
>> Shouldn't all those be 'sizeof (opt)' ?
>>
>>     David
>>

Agreed, but my thinking was to keep it somewhat symmetrical to other
similar checks in XXX_setsockopt(). For instance, in net/ax25/af_ax25.c,
courtesy of commit 7b75c5a8c41 ("net: pass a sockptr_t into
->setsockopt") an explicit type is used.

I don't mind sending v2, as it would be a bit neater.

>>>           return -EFAULT;
>>>         switch (optname) {
>>> @@ -414,31 +414,31 @@ static int rose_setsockopt(struct socket *sock,
>>> int level, int optname,
>>>           return 0;
>>>         case ROSE_T1:
>>> -        if (opt < 1)
>>> +        if (opt < 1 || opt > UINT_MAX / HZ)
> 
> 'rose->t1' is unsigned long, how about 'opt > ULONG_MAX / HZ' ?
> 
> BTW, I think only in 32bit or 16bit machine when 'sizeof(int) ==
> sizeof(unsigned long)',
> this integer overflows may occur..
> 
> Su Hui
> 

Here I was influenced by commits dc35616e6c29 ("netrom: fix api breakage
in nr_setsockopt()") and 9371937092d5 ("ax25: uninitialized variable in
ax25_setsockopt()") that essentially state that we only copy 4 bytes
from userspace so opt being ulong is not desired. Even if the result of
* HZ ends up stored in ulong 'XXX->t1'.

I may be wrong but I think same principle applies to rose_setsockopt().

All we need to do here is to enable a sanity check that there is no
int/uint overflow in right hand expression before the result gets stored
in ulong.

>>>               return -EINVAL;
>>>           rose->t1 = opt * HZ;
>>>           return 0;
>>>         case ROSE_T2:
>>> -        if (opt < 1)
>>> +        if (opt < 1 || opt > UINT_MAX / HZ)
>>>               return -EINVAL;
>>>           rose->t2 = opt * HZ;
>>>           return 0;
>>>         case ROSE_T3:
>>> -        if (opt < 1)
>>> +        if (opt < 1 || opt > UINT_MAX / HZ)
>>>               return -EINVAL;
>>>           rose->t3 = opt * HZ;
>>>           return 0;
>>>         case ROSE_HOLDBACK:
>>> -        if (opt < 1)
>>> +        if (opt < 1 || opt > UINT_MAX / HZ)
>>>               return -EINVAL;
>>>           rose->hb = opt * HZ;
>>>           return 0;
>>>         case ROSE_IDLE:
>>> -        if (opt < 0)
>>> +        if (opt > UINT_MAX / (60 * HZ))
>>>               return -EINVAL;
>>>           rose->idle = opt * 60 * HZ;
>>>           return 0;
>>>

Regards,
Nikita

