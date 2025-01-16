Return-Path: <linux-hams+bounces-465-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4633A1310B
	for <lists+linux-hams@lfdr.de>; Thu, 16 Jan 2025 03:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA49B164525
	for <lists+linux-hams@lfdr.de>; Thu, 16 Jan 2025 02:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7449849652;
	Thu, 16 Jan 2025 02:05:08 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 29DB78836;
	Thu, 16 Jan 2025 02:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736993108; cv=none; b=sOzEENN3gNnrFAuHnTTPEsnzBYZpYxQ2lUEM5N7lcTUIZuzm0Wm2DArkIIV5l1IVAMUOciSa1Vx4+Evl694QYWfOmo+/Yzx/oYjnkyki/wrbOf1J4XVOb2zoovJL8JX47EtxWGLj0aB+4wm5tJo1FEYWZb7nRElU7XDYoumHbdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736993108; c=relaxed/simple;
	bh=K41LxaeY5b1PJhdqsphAZteLpi5PMaWTF/rGxvUmgEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=LL0kLTm9YmB+aH3RS/8hZ7eCbGAOypsiwhU7LKGm1kPCVoS7N2Go/pj/HtLDFRMl+ZBcaMUbl+tbW7E3vfcanihnuL60P5UfihDbF5MnWbKc7+kd8c0jyFEp8AAk3kesLvuIFGDp41dHmfL3ZBLNIK00hGlU3Q+ZhM7gHD6K63o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [172.30.20.101] (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id B711660108120;
	Thu, 16 Jan 2025 10:04:47 +0800 (CST)
Message-ID: <6f79c23a-7acb-5faf-5e8d-104ca37dbb08@nfschina.com>
Date: Thu, 16 Jan 2025 10:04:47 +0800
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH net] net/rose: prevent integer overflows in
 rose_setsockopt()
Content-Language: en-US
To: David Laight <david.laight.linux@gmail.com>,
 Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 linux-hams@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 stable@vger.kernel.org, kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <20250115232952.1d4ef002@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/1/16 07:29, David Laight wrote:
> On Wed, 15 Jan 2025 08:42:20 -0800
> Nikita Zhandarovich <n.zhandarovich@fintech.ru> wrote:
>
>> In case of possible unpredictably large arguments passed to
>> rose_setsockopt() and multiplied by extra values on top of that,
>> integer overflows may occur.
>>
>> Do the safest minimum and fix these issues by checking the
>> contents of 'opt' and returning -EINVAL if they are too large. Also,
>> switch to unsigned int and remove useless check for negative 'opt'
>> in ROSE_IDLE case.
>>
>> Found by Linux Verification Center (linuxtesting.org) with static
>> analysis tool SVACE.
>>
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>> ---
>>   net/rose/af_rose.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
>> index 59050caab65c..72c65d938a15 100644
>> --- a/net/rose/af_rose.c
>> +++ b/net/rose/af_rose.c
>> @@ -397,15 +397,15 @@ static int rose_setsockopt(struct socket *sock, int level, int optname,
>>   {
>>   	struct sock *sk = sock->sk;
>>   	struct rose_sock *rose = rose_sk(sk);
>> -	int opt;
>> +	unsigned int opt;
>>   
>>   	if (level != SOL_ROSE)
>>   		return -ENOPROTOOPT;
>>   
>> -	if (optlen < sizeof(int))
>> +	if (optlen < sizeof(unsigned int))
>>   		return -EINVAL;
>>   
>> -	if (copy_from_sockptr(&opt, optval, sizeof(int)))
>> +	if (copy_from_sockptr(&opt, optval, sizeof(unsigned int)))
> Shouldn't all those be 'sizeof (opt)' ?
>
> 	David
>
>>   		return -EFAULT;
>>   
>>   	switch (optname) {
>> @@ -414,31 +414,31 @@ static int rose_setsockopt(struct socket *sock, int level, int optname,
>>   		return 0;
>>   
>>   	case ROSE_T1:
>> -		if (opt < 1)
>> +		if (opt < 1 || opt > UINT_MAX / HZ)

'rose->t1' is unsigned long, how about 'opt > ULONG_MAX / HZ' ?

BTW, I think only in 32bit or 16bit machine when 'sizeof(int) == 
sizeof(unsigned long)',
this integer overflows may occur..

Su Hui

>>   			return -EINVAL;
>>   		rose->t1 = opt * HZ;
>>   		return 0;
>>   
>>   	case ROSE_T2:
>> -		if (opt < 1)
>> +		if (opt < 1 || opt > UINT_MAX / HZ)
>>   			return -EINVAL;
>>   		rose->t2 = opt * HZ;
>>   		return 0;
>>   
>>   	case ROSE_T3:
>> -		if (opt < 1)
>> +		if (opt < 1 || opt > UINT_MAX / HZ)
>>   			return -EINVAL;
>>   		rose->t3 = opt * HZ;
>>   		return 0;
>>   
>>   	case ROSE_HOLDBACK:
>> -		if (opt < 1)
>> +		if (opt < 1 || opt > UINT_MAX / HZ)
>>   			return -EINVAL;
>>   		rose->hb = opt * HZ;
>>   		return 0;
>>   
>>   	case ROSE_IDLE:
>> -		if (opt < 0)
>> +		if (opt > UINT_MAX / (60 * HZ))
>>   			return -EINVAL;
>>   		rose->idle = opt * 60 * HZ;
>>   		return 0;
>>

