Return-Path: <linux-hams+bounces-610-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB3EB3F71C
	for <lists+linux-hams@lfdr.de>; Tue,  2 Sep 2025 09:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7212348573D
	for <lists+linux-hams@lfdr.de>; Tue,  2 Sep 2025 07:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031842E7BA5;
	Tue,  2 Sep 2025 07:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="AXdCv43s"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC712E7620;
	Tue,  2 Sep 2025 07:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756799675; cv=none; b=BRgBse0K3EQ4Ah9AWiNDQVKdwKEoOjpX0ligm8set3PL61uFv8rnCwg+AA+RO1268aQnmXA7aaa50I0OMjrJlXlwCrHD8RdiAT6pEhtNsyNN9xj0PukyzqlNeC+wAzGhpefl9MGaLFqJTij4SxQ4AEar6eZDFT/lZ5QKDScdQE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756799675; c=relaxed/simple;
	bh=AB+IDRvWYFJFkY3h2/31sAia7ruXBDPaMARKBTenfPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OAB4EZlv5xJgeEujBF5r1O1YWb94OSkpEmfWqZByAYC/mVzyIfa8SSFUfqhoblGTedXYmtMU2RQImLxc4GPgSfmqo0KV/WmiRNojp8F3U0piPWswMgAO9W9nNSurFg0DroKe3mFBet5/2bnsSnzQd1NDDkXgsQI/20C9qJ4aR4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=AXdCv43s; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: f6bvp@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5DB9019F72F;
	Tue,  2 Sep 2025 09:54:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1756799671;
	bh=AB+IDRvWYFJFkY3h2/31sAia7ruXBDPaMARKBTenfPw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AXdCv43s7hVYSaW4f7jnVxgelTjDJ5o7LKi/1JZsYmBkmcoNvONtQrV83FdJrXDPI
	 o5ZncDU1jOARNqz3FUx7cLQdCtoxCWVV1MQTlGVWRY/N/DwL6pDjbVkbBMhjx0b7Ly
	 dOmycPRaZJAQQ901t01jOeGCjbpOIAA/NLSYx/qOItMI8goWX/YDGtjwDYkMUp2FAK
	 yCq3lzJnmGtStjp7Zep6AJ2HQpVJZphS/VRD6vwd1OAZl/SW8lDo62+v6QufYzMiTx
	 7wAUT40wTty8FFdyT81fTOATDSLAB9gOlveCgtrl6MLVBZl7XGcgCQXoLbmyZZEce0
	 myWrV32Js6q7A==
Message-ID: <706fc70a-99eb-44bc-9468-ebc1da38de32@free.fr>
Date: Tue, 2 Sep 2025 09:54:22 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
To: Eric Dumazet <edumazet@google.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, linux-hams@vger.kernel.org,
 netdev <netdev@vger.kernel.org>, Dan Cross <crossd@gmail.com>,
 David Ranch <dranch@trinnet.net>,
 Folkert van Heusden <folkert@vanheusden.com>, Florian Westphal <fw@strlen.de>
References: <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr>
 <4e4c9952-e445-41af-8942-e2f1c24a0586@free.fr>
 <90efee88-b9dc-4f87-86f2-6ab60701c39f@free.fr>
 <6c525868-3e72-4baf-8df4-a1e5982ef783@free.fr>
 <d073ac34a39c02287be6d67622229a1e@vanheusden.com>
 <6a5cf9cf-9984-4e1b-882f-b9b427d3c096@free.fr>
 <aKxZy7XVRhYiHu7c@stanley.mountain>
 <0c694353-2904-40c2-bf65-181fe4841ea0@free.fr>
 <CANn89iJ6QYYXhzuF1Z3nUP=7+u_-GhKmCbBb4yr15q-it4rrUA@mail.gmail.com>
 <4542b595-2398-4219-b643-4eda70a487f3@free.fr> <aK9AuSkhr37VnRQS@strlen.de>
 <eb979954-b43c-4e3d-8830-10ac0952e606@free.fr>
 <1713f383-c538-4918-bc64-13b3288cd542@free.fr>
 <CANn89i+Me3hgy05EK8sSCNkH1Wj5f49rv_UvgFNuFwPf4otu7w@mail.gmail.com>
Content-Language: en-US
From: F6BVP <f6bvp@free.fr>
In-Reply-To: <CANn89i+Me3hgy05EK8sSCNkH1Wj5f49rv_UvgFNuFwPf4otu7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I tested the fix and validated it on different kernels versions.

All are doing fine : 6.14.11 , 6.15.11, 6.16.4

Congratulations and many thanks to Eric Dumazet for spending his time on
repairing AX25 mkiss serial connexions.

Hamradio fans will be able to continue experimenting with AX25 using
next Linux developments.

Bernard Pidoux
F6BVP / AI7BG
http://radiotelescope-lavillette.fr


Le 01/09/2025 à 14:04, Eric Dumazet a écrit :
> On Sat, Aug 30, 2025 at 4:37 PM F6BVP <f6bvp@free.fr> wrote:
>>
>> Here is a bad commit report by git bisect and the corresponding decoded
>> stack trace of kernel panic triggered when mkiss receives AX25 packet.
>>
>> All kernels following 6.14.11, i.e. starting with 6.15.1 until net-next
>> are affected by the issue.
>>
>> I would be pleased to check any patch correcting the issue.
>>
> 
> Thanks for the report.
> 
> At some point we will have to remove ax25, this has been quite broken
> for a long time.
> 
> Please try :
> 
> diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
> index 1cac25aca637..f2d66af86359 100644
> --- a/net/ax25/ax25_in.c
> +++ b/net/ax25/ax25_in.c
> @@ -433,6 +433,10 @@ static int ax25_rcv(struct sk_buff *skb, struct
> net_device *dev,
>   int ax25_kiss_rcv(struct sk_buff *skb, struct net_device *dev,
>                    struct packet_type *ptype, struct net_device *orig_dev)
>   {
> +       skb = skb_share_check(skb, GFP_ATOMIC);
> +       if (!skb)
> +               return NET_RX_DROP;
> +
>          skb_orphan(skb);
> 
>          if (!net_eq(dev_net(dev), &init_net)) {


