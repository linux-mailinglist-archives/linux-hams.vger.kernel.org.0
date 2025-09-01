Return-Path: <linux-hams+bounces-606-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C655B3EE4A
	for <lists+linux-hams@lfdr.de>; Mon,  1 Sep 2025 21:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2393B487F3B
	for <lists+linux-hams@lfdr.de>; Mon,  1 Sep 2025 19:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D654225FA3B;
	Mon,  1 Sep 2025 19:05:24 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1115222F77E;
	Mon,  1 Sep 2025 19:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.78.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756753524; cv=none; b=FwruxXniRPLbeOegX4stezjEsSKNn5atVoTy/fy+sNd/SemUtUTdfvKdeJZtXOIpnOhC1E2Pk8Uo0ZwwyzvMkSALYFylYFoJPGz1soJj0DnJORQPnVB5Rbj4v1DHBVnga2TNt+/rpqmM5azGgytDqz0nqdB68ntjQ+VnB2eIKSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756753524; c=relaxed/simple;
	bh=muqd/SyuO3uY4Nf5+DN+wt0saTbYhOC5bkfEx3tWYQI=;
	h=From:Subject:To:References:Cc:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=o4P4wm4lLfbnFJNU6nHQMubViUjQk0TogtehjLedC+2O9BizRXsc479KdiuD3ZhBkAZ4Vc1G2xo8khgoOggfnZyVCZQUagnyPnC1ocdDoYnC0vXhk6x4+8aWTe1rwbHudAgk+ebl/Cf6Jp4qTlRf/azI/pmaq4hTNHLMAcYVG4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net; spf=pass smtp.mailfrom=trinnet.net; arc=none smtp.client-ip=96.78.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 581J4npA004262;
	Mon, 1 Sep 2025 12:04:49 -0700
From: David Ranch <linux-hams@trinnet.net>
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
To: Eric Dumazet <edumazet@google.com>, F6BVP <f6bvp@free.fr>
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
 <CANn89iLi=ObSPAg69uSPRS+pNwGw9jVSQJfT34ZAp3KtSrx2Gg@mail.gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Dan Carpenter
 <dan.carpenter@linaro.org>,
        linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>,
        Dan Cross <crossd@gmail.com>,
        Folkert van Heusden <folkert@vanheusden.com>,
        Florian Westphal <fw@strlen.de>
Message-ID: <f75c91be-9d17-7cb7-39b3-02a817aaaf7c@trinnet.net>
Date: Mon, 1 Sep 2025 12:04:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CANn89iLi=ObSPAg69uSPRS+pNwGw9jVSQJfT34ZAp3KtSrx2Gg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Mon, 01 Sep 2025 12:04:51 -0700 (PDT)


Hello Eric, Everyone,

>> At some point we will have to remove ax25, this has been quite broken
>> for a long time.

I can appreciate that the code implementing AX.25 in the kernel is very 
old but say it needs to be removed will impact a lot of people.  There 
is a very active community around AX.25 packet radio today and Linux's 
native implementation still offers features and functions that aren't 
implemented anywhere else.  There are also some large / popular projects 
that are dependent on it for their connectivity via libax25, etc.  I 
continue to hope someone will be willing to step forward and write a 
modernized version of this stack (and netrom and rose too) so we can 
continue to run things natively on Linux.

--David
KI6ZHD

