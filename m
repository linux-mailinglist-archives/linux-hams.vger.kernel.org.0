Return-Path: <linux-hams+bounces-607-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB9DB3EE54
	for <lists+linux-hams@lfdr.de>; Mon,  1 Sep 2025 21:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5E5D1B20FF2
	for <lists+linux-hams@lfdr.de>; Mon,  1 Sep 2025 19:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C4D32A808;
	Mon,  1 Sep 2025 19:10:29 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB7B324B35;
	Mon,  1 Sep 2025 19:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.78.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756753829; cv=none; b=GGGa0HMEUBG4//v313ENI/H3GAE2vbJGQnPYUZko4Aklip6Nma+EOj8tY4CDY1pqqGZdQ28GA9YDmCVTD6X4C+Rn3rxrDqkR1QY1RgVGzBxgwieh4I9NzW/oNSRXM9XqlPaANLmLYCFkUWWiKftZQCpd7FB0JvQkwOlRC0hufAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756753829; c=relaxed/simple;
	bh=PcCVpeII7nzMh+1zzSyCR0eY+wobWJjzPdqIMECddIM=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=N9r+O/LPqp9b7o6Te+KbJSz7ZGghMy6VQGYO6NW3Lk6gmFNq4IVP8cqhsNIhT+lRJRMB0RwgPY8hu12leM/rxo1nKRy4PZ5GtWTSfMM9i5z3iiwE4af4j1deSAAQCu1uf4Q7XtsLz1waIhQFmgFDMYtDKPbUQDrKCaU0g38sR7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net; spf=pass smtp.mailfrom=trinnet.net; arc=none smtp.client-ip=96.78.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 581JA4o8004292;
	Mon, 1 Sep 2025 12:10:04 -0700
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
 <cd0461e0-8136-4f90-df7b-64f1e43e78d4@trinnet.net>
 <80dad7a3-3ca1-4f63-9009-ef5ac9186612@free.fr>
 <CANn89iJGdn2J-UwK9ux+m9r8mRhAND_t2kU6mLCs=RszBhCyRA@mail.gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Dan Carpenter
 <dan.carpenter@linaro.org>,
        linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>,
        Dan Cross <crossd@gmail.com>,
        Folkert van Heusden <folkert@vanheusden.com>,
        Florian Westphal <fw@strlen.de>
From: David Ranch <linux-hams@trinnet.net>
Message-ID: <c7829cbe-a9b0-3c3b-d7c1-88f62a9fae0b@trinnet.net>
Date: Mon, 1 Sep 2025 12:10:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CANn89iJGdn2J-UwK9ux+m9r8mRhAND_t2kU6mLCs=RszBhCyRA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Mon, 01 Sep 2025 12:10:04 -0700 (PDT)


> Keep calm, I am just saying that the bisection pointed to a fine commit,
> but it took a _lot_ of time to root-cause the issue.
>
> And the bug is in ax25, not in Paolo patch.
>
> Please test the fix, and thank me for actually working on a fix, while
> I have more urgent work on my plate.

Much appreciated for your work on this patch but I'm curious, is the 
core issue here on this other committer's patch or just weaknesses in 
the original AX.25 stack code?

--David
KI6ZHD

