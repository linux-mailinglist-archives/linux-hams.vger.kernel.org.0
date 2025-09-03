Return-Path: <linux-hams+bounces-620-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 289A8B41B70
	for <lists+linux-hams@lfdr.de>; Wed,  3 Sep 2025 12:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B00FE17047E
	for <lists+linux-hams@lfdr.de>; Wed,  3 Sep 2025 10:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92162E92D1;
	Wed,  3 Sep 2025 10:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="VaM8pqD1"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8DB1E5B9E;
	Wed,  3 Sep 2025 10:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756894308; cv=none; b=P93FnaXw3+PHLqhEcTUgDDRIHSLriDt8/uvxInns9qbIMzHQ0H21I/GwLKPZBiBaIyktvYOS9SaMXPMYZQtGLXMCG+Z33oJyOolmuSpufUHx99Z7pKdWa+hYatVqaGiwKBKuU2LeJARZIYcRbpUhsfIzUZupG0yGvzMl1VbeL28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756894308; c=relaxed/simple;
	bh=92SZXdZY2dGlMucxdmNCsHHo+cXSnXj4bh9nJdJWRRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xb50ot8XSNBpuE0NpEtMJjpe/Py/yxFljDSuqnAjvfZQaB1CO4Oq9osdHI0ZxFZ31kP7oBhkAASQ6ls62h2c37CXfg2ZT3MjxxDyn+W5M1QjYuK29GSO7oWcTbbYh9W8IDNfrabnOq0ljG7yQlRWBDsO08tO7T28L/hVURUFIWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=VaM8pqD1; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: f6bvp@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8E19B19F740;
	Wed,  3 Sep 2025 12:11:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1756894305;
	bh=92SZXdZY2dGlMucxdmNCsHHo+cXSnXj4bh9nJdJWRRI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VaM8pqD11AkmsPG+LxOw1h03jNhKlihnCjy61Ziyqm3aJw4EdmvscNBTEkNK8o5dF
	 0Qcmw68IPAdrt0xpQTjdgbl54ezxcfBFTAbG7+lN2DsJG0Vjqe1Cdlq00E2tcZzBx2
	 j9aphMtDE7lddTXPZOI7HH37jqWtwBU1JvRuz+pgH63FVaSCQBUmNTynrPbZzAc9eQ
	 M9R7im6HjU4+QQDNL3Q78ec7ZR1gLqnXtryOCqk4fKsQhwkF1ePk3CC+TehIalclfa
	 /DxiDkUCxLZ3BVJMcY65t8YlNMF0crmdawwih3ubDEh/FJSa0VSstQ2OWeqWxbBuI3
	 3UfSW8+3DNmBg==
Message-ID: <5adc15fe-8a65-4954-8719-76ed6a132b45@free.fr>
Date: Wed, 3 Sep 2025 12:11:39 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] [ROSE] slab-use-after-free in lock_timer_base
To: Eric Dumazet <edumazet@google.com>,
 Bernard Pidoux <bernard.pidoux@free.fr>,
 Takamitsu Iwai <takamitz@amazon.co.jp>
Cc: linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>
References: <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr>
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
 <CANn89iLi=ObSPAg69uSPRS+pNwGw9jVSQJfT34ZAp3KtSrx2Gg@mail.gmail.com>
 <cd0461e0-8136-4f90-df7b-64f1e43e78d4@trinnet.net>
 <80dad7a3-3ca1-4f63-9009-ef5ac9186612@free.fr>
 <CANn89iJGdn2J-UwK9ux+m9r8mRhAND_t2kU6mLCs=RszBhCyRA@mail.gmail.com>
 <938ad48d-a4a3-4729-a46d-4473e190f1a1@free.fr>
 <CANn89i+BBuYYk1n=4HvEiZS6YhMwjdntt=psvAEAzXwcU-VKkQ@mail.gmail.com>
Content-Language: en-US
From: F6BVP <f6bvp@free.fr>
In-Reply-To: <CANn89i+BBuYYk1n=4HvEiZS6YhMwjdntt=psvAEAzXwcU-VKkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I am confused for not having CC Takamisu Iwai.

I apologize for this novice error.

Considering the syzreport report I just wanted to add my contribution to 
provide a way to easily reproduce the bug when performing rose network.


Le 03/09/2025 à 12:01, Eric Dumazet a écrit :
> On Wed, Sep 3, 2025 at 2:51 AM Bernard Pidoux <bernard.pidoux@free.fr> wrote:
>>
>> On 6.16.4 kernel patched with last ROSE commit for refcount use
>> rose_remove_node() is causing refcount_t: underflow; use-after-free
>>
>> List:       linux-stable-commits
>> Subject:    Patch "net: rose: split remove and free operations in
>> rose_remove_neigh()" has been added to the 6.1
>> From:       Sasha Levin <sashal () kernel ! org>
>> Date:       2025-08-30 20:20:24
>> Message-ID: 20250830202024.2485006-1-sashal () kernel ! org
>>
>> Bernard Pidoux
>> F6BVP / AI7BG
> 
> Any particular reason you do not CC the author ?
> 
> CC Takamitsu Iwai <takamitz@amazon.co.jp>
> 
> BTW, a syzbot report was already sent to the list.
> 
> https://syzkaller.appspot.com/bug?extid=7287222a6d88bdb559a7
> 


