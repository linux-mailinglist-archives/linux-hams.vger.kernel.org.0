Return-Path: <linux-hams+bounces-718-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB47C937BD
	for <lists+linux-hams@lfdr.de>; Sat, 29 Nov 2025 05:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 375FF3A9EF3
	for <lists+linux-hams@lfdr.de>; Sat, 29 Nov 2025 04:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17EDE20DD51;
	Sat, 29 Nov 2025 04:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="4NgXew0S"
X-Original-To: linux-hams@vger.kernel.org
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5C23C17;
	Sat, 29 Nov 2025 04:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764388886; cv=none; b=c7jYS8q2gIckcOk/82eRLLi1WZWzexR7Xi7aX8WFwPt1L9iEHqwcNnPc5XRJetnuer3WfrYIDM0R45mzSVI9aSB0Yz2BSnOLwPjNaI7UjVXJ6RYgV3gWzAka88/bl0z7L94RZyTIAl4Lnt/U0qD8eJKhtKNGiSMRwFlDzG+KD94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764388886; c=relaxed/simple;
	bh=3qW7JUmVgKHM+MEsT6lk1sKvrS6m1FSVEHtDSmOIfik=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G2qYjVK6ifW2qK4CT6Z3nPTj148q59D/bvFFTMu4O+zKod5Pw+NeLBau/kqUcy+ntwRajS17H75BZQDri2ClOrxKALknNbtEqT9z23zylu+JOMO2QRUubVaB1ZSUKutznlB7/FaUBEKkGwwNr8ilL3D5wAJ1v/ODnAlB6ezBOoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=4NgXew0S; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=B2Q59GRZ2Vr7+M8qAogZOt38f65MXVF5cCT2NkOwias=;
	b=4NgXew0SFtTvwTNSGUpKUyO/JXkAsDDMxgn3oZGpiqmV/ml2PR7cHkrDaiOF6BKhs8yZ0QQhN
	6oyUror0hLHmdGG5KZuvwvRrDSY6GhLI3bapwUXXo6qBeL5yE31MKiSRkEtIHXz2zHUlNel7mXk
	nqf148Z5Q6DifJzuUDZuBSc=
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4dJGcd6Vqrz12LD2;
	Sat, 29 Nov 2025 11:58:57 +0800 (CST)
Received: from dggpemf500016.china.huawei.com (unknown [7.185.36.197])
	by mail.maildlp.com (Postfix) with ESMTPS id 15142180478;
	Sat, 29 Nov 2025 12:01:22 +0800 (CST)
Received: from [10.174.177.19] (10.174.177.19) by
 dggpemf500016.china.huawei.com (7.185.36.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 29 Nov 2025 12:01:21 +0800
Message-ID: <17e41b73-3497-4ea0-b91c-4710514f7b14@huawei.com>
Date: Sat, 29 Nov 2025 12:01:20 +0800
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: netrom: fix memory leak in nr_output()
To: Deepanshu Kartikey <kartikey406@gmail.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<horms@kernel.org>
CC: <linux-hams@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<syzbot+d7abc36bbbb6d7d40b58@syzkaller.appspotmail.com>
References: <20251129034232.405203-1-kartikey406@gmail.com>
From: Wang Liang <wangliang74@huawei.com>
In-Reply-To: <20251129034232.405203-1-kartikey406@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500016.china.huawei.com (7.185.36.197)


在 2025/11/29 11:42, Deepanshu Kartikey 写道:
> When nr_output() fragments a large packet, it calls sock_alloc_send_skb()


Hi!

Coincidentally, we both are working on this issue simultaneously.

 From the syz test requests:
https://syzkaller.appspot.com/bug?extid=d7abc36bbbb6d7d40b58

I sended the test patch earlier, only a dozen seconds...

------
Best regards
Wang Liang

> in a loop to allocate skbs for each fragment. If this allocation fails,
> the function returns without freeing the original skb that was passed in,
> causing a memory leak.
>
> Add the missing kfree_skb() call before returning on allocation failure.
>
> Reported-by: syzbot+d7abc36bbbb6d7d40b58@syzkaller.appspotmail.com
> Tested-by: syzbot+d7abc36bbbb6d7d40b58@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=d7abc36bbbb6d7d40b58
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>   net/netrom/nr_out.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/net/netrom/nr_out.c b/net/netrom/nr_out.c
> index 5e531394a724..2b3cbceb0b52 100644
> --- a/net/netrom/nr_out.c
> +++ b/net/netrom/nr_out.c
> @@ -43,8 +42,11 @@ void nr_output(struct sock *sk, struct sk_buff *skb)
>   		frontlen = skb_headroom(skb);
>   
>   		while (skb->len > 0) {
> -			if ((skbn = sock_alloc_send_skb(sk, frontlen + NR_MAX_PACKET_SIZE, 0, &err)) == NULL)
> 			skbn = sock_alloc_send_skb(sk, frontlen + NR_MAX_PACKET_SIZE, 0, &err);
> 			if (skbn == NULL) {
> +				kfree_skb(skb);
>   				return;
> +			}
>   
>   			skb_reserve(skbn, frontlen);
>   

