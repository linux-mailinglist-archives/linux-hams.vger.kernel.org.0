Return-Path: <linux-hams+bounces-410-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A6096219A
	for <lists+linux-hams@lfdr.de>; Wed, 28 Aug 2024 09:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A7F91F21CA0
	for <lists+linux-hams@lfdr.de>; Wed, 28 Aug 2024 07:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D959415958D;
	Wed, 28 Aug 2024 07:43:38 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B2C1552EB;
	Wed, 28 Aug 2024 07:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724831018; cv=none; b=tmOj6R3ZFL0gew4kE910oSIeddMbKsttX5hUm5WeGGVamXqxZRxOEBrJhx+MecKwYypXIT6LZm2RRYDpaeA9Pu/ZAOJjO8MFpPQm3kMY5Ccgsn6FcvE/bWQ+hiEai02TrY5Yw40aiOtYRGljRD1ivblxU++7c2Sd5ILwVVmdrzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724831018; c=relaxed/simple;
	bh=GknQbk+A9qg0msLydJWzhZ++kBXfEcNx2h5Uh4aO4A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rmZDqpYPY19TLTknIMhuy0kKH8GC1G6NEfovCyec17xycmXPpxVus2GiYeei955ZdJvkEE3RK9IL2xFJ6yWeiI/s9N11lWwBq7KGVnrUD469bYobdZldpAgW8iEImS9IBgfjFkYuMBnSztq25/g7isdbGnRCtUEzA4fKW8dRnPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WtxGv2cWLz1S9Dw;
	Wed, 28 Aug 2024 15:43:19 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E3F01401F2;
	Wed, 28 Aug 2024 15:43:31 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 15:43:30 +0800
Message-ID: <7fd81130-b747-4f70-978c-7f029a9137f3@huawei.com>
Date: Wed, 28 Aug 2024 15:43:30 +0800
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/6] net: prefer strscpy over strcpy
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <dsahern@kernel.org>, <ralf@linux-mips.org>,
	<jmaloy@redhat.com>, <ying.xue@windriver.com>, <netdev@vger.kernel.org>,
	<linux-hams@vger.kernel.org>, <netfilter-devel@vger.kernel.org>
References: <20240827113527.4019856-1-lihongbo22@huawei.com>
 <20240827113527.4019856-2-lihongbo22@huawei.com>
 <a60d4c8f-409e-4149-9eae-64bb3ea2e6bf@stanley.mountain>
Content-Language: en-US
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <a60d4c8f-409e-4149-9eae-64bb3ea2e6bf@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500022.china.huawei.com (7.185.36.66)



On 2024/8/27 20:30, Dan Carpenter wrote:
> On Tue, Aug 27, 2024 at 07:35:22PM +0800, Hongbo Li wrote:
>> The deprecated helper strcpy() performs no bounds checking on the
>> destination buffer. This could result in linear overflows beyond
>> the end of the buffer, leading to all kinds of misbehaviors.
>> The safe replacement is strscpy() [1].
>>
>> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
>>
>> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
>> ---
>>   net/core/dev.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/net/core/dev.c b/net/core/dev.c
>> index 0d0b983a6c21..f5e0a0d801fd 100644
>> --- a/net/core/dev.c
>> +++ b/net/core/dev.c
>> @@ -11121,7 +11121,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
>>   	if (!dev->ethtool)
>>   		goto free_all;
>>   
>> -	strcpy(dev->name, name);
>> +	strscpy(dev->name, name, sizeof(dev->name));
> 
> You can just do:
> 
> 	strscpy(dev->name, name);
> 
> I prefer this format because it ensures that dev->name is an array and not a
> pointer.  Also shorter.
ok, I'll remove the len.(Most of these are an array, not a pointer)

Thanks,
Hongbo

> 
> regards,
> dan carpenter
> 

