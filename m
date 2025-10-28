Return-Path: <linux-hams+bounces-702-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8634BC15210
	for <lists+linux-hams@lfdr.de>; Tue, 28 Oct 2025 15:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72F5E647DF8
	for <lists+linux-hams@lfdr.de>; Tue, 28 Oct 2025 14:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C326D32D7FA;
	Tue, 28 Oct 2025 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fNKqmKiP"
X-Original-To: linux-hams@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE92221F17
	for <linux-hams@vger.kernel.org>; Tue, 28 Oct 2025 14:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761660825; cv=none; b=iEJ0aSZcEZzZsFH+SmLnTfwwoCkVIdAtfGxOzte0d6VfoRp59bgFyOOFls8jpk5B3qRwUz9FKlq1+wEiV90lCUOC7vBudCUFxxDc4Gr/bc/ZXZ3ORqd5Ar8D1blSa6VUoOaIXGfKk1f2xXm0IU4zV3JebnoHU3AAqJo6ZBh63to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761660825; c=relaxed/simple;
	bh=ZYPPYcYAa1kfmT6ysEa9Ljp3mYRoXr0D4R/wdyfHVMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aPfTLpZa4aIRLB3k6CV+PuN/hfIudCG9j/VFQG9L5vCcDJqHbWGogi9Ic3dTvvoO1lwf2HlW4Nx5fC5VR4Fhdf9MgpoG4bnZMfQ2REq0KNvto9vAG8S9btsS+VSmRRDocJp2cYS32vinL+/xEdaVxR0fkJqNfTwga5e4SSsXtcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fNKqmKiP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761660822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLma0EwZTNjEWu7rLdG6tlLWGqLkYFGS9BPBZl6Fju0=;
	b=fNKqmKiPTDaUZt1zWaJKQiScGeKmHsiL0namDaoYRqOUnHV+igZ7v1pEJ9VP5BTTBw7B4Y
	nErC+8JgiOxqyRVGaRHrYYwHPB3sZGuuEuyFa9G4nWZqhAzvoqmZZKiLUBB89HCKTQoJuq
	oVEq7L0vSDkAybHp7aUkLFxkqoFkrNo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-mPek4L46Oq6K2hC0A3qloQ-1; Tue, 28 Oct 2025 10:13:41 -0400
X-MC-Unique: mPek4L46Oq6K2hC0A3qloQ-1
X-Mimecast-MFC-AGG-ID: mPek4L46Oq6K2hC0A3qloQ_1761660820
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4711899ab0aso42936175e9.2
        for <linux-hams@vger.kernel.org>; Tue, 28 Oct 2025 07:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761660820; x=1762265620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JLma0EwZTNjEWu7rLdG6tlLWGqLkYFGS9BPBZl6Fju0=;
        b=krhz0esJslAJ6o3dDgtgvLskQv0hBStHThF/KRfE1vHS+rTJLV4fEM8kForZFQIbKd
         AiRLGxysu4pSn7HdSN5Q2U11k5GREGsmarEoh4eKUOfXcOG52oMWWQYEj7ZAtdFK7aFj
         sNf/oK0S/lGFxS+mVmFhwjR9dPz9d098FK0JJJfgOWyQlZtsnTfnBNK4GDGgvKyEdKNe
         sooNEqBcFnVCC3ka3wHarUF0NmgW6+M6fty5wb9L10KtWIqfuZsXiCyDCoxCrWqen6gG
         tIX/EjPQuxtnOOJT4FBC5fwjLbV7zApSmukGRY7Ew/9CRwgVWWIMQoFUIT0015okFW5F
         rklw==
X-Forwarded-Encrypted: i=1; AJvYcCUxQ64x4woeO0B5Lx9trzTfHqC0ZgEPMrU0Bp0KKbN21vB4SU552b141M5c9ka5KZrRahIucKDzadM/@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy8sBt/9cKhc2km662YTfvwcoB/fecJizt5lF4kYBvOGBeK6fN
	yzVpPTvj6UoIIH5BTGodfBm2UKr6ZqzKyDXMrmQVn8R+BJBBWj9trmBmv3dLa7atZYHz6GKaMbz
	M4/oO+LPYdB4B2claXbqq1/CeNAW7P3VT+nPtWzkM4leva+JsCbtKG9mHENBLWfo=
X-Gm-Gg: ASbGnctJEGNJ+SVDHB+RpFSpAtG7UUFAWl13CdSevXWoH4whGaQUxAS6O9SMbsIbz2+
	zlGS1RbalL/HWpBXetNkr3NEdUoWm+BGVWQMdicFxvYIIm91SGJ+e32VL2KINqLJDNCi2EQK7hT
	iv+J5B4kFLo8kQUzkvYQqEBXPoR6YaMPphXgDjaIn0v81zu69RIvC24ajtpcaZDGiFEU3iHtD2Q
	kMvX7e0ewVJZ9A9OdeYD+IezB16OX/bf+CSkXOOFXRN+t5UbbBsyKYk1cD0f7RhDLxVzBFAXhJY
	+Dqzl+AYAQ3mydp8Id86G2w3U2sBnPVZ8dCUTOM5bLLsf08nUdoTGmbJsP1xpoPRC0WYN6g9JDm
	bOu8b28b9NX6whASF3cMkFAr6V81zJME4afBxfuYbAPqv1Qo=
X-Received: by 2002:a05:600c:8216:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-47717e30970mr30854215e9.26.1761660820100;
        Tue, 28 Oct 2025 07:13:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMJoIr+9VMwEM/UpHxSZ5ud3h8YOPEJx3EhGLMpRMZ3b2fEAstiZZWHLqNm0zTaKo1M5X22w==
X-Received: by 2002:a05:600c:8216:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-47717e30970mr30853985e9.26.1761660819662;
        Tue, 28 Oct 2025 07:13:39 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd03585esm197768795e9.6.2025.10.28.07.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 07:13:39 -0700 (PDT)
Message-ID: <785c8add-ab09-47b2-94bf-a4bfe8c13388@redhat.com>
Date: Tue, 28 Oct 2025 15:13:37 +0100
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] netrom: Preventing the use of abnormal neighbor
To: Lizhi Xu <lizhi.xu@windriver.com>
Cc: dan.carpenter@linaro.org, davem@davemloft.net, edumazet@google.com,
 horms@kernel.org, kuba@kernel.org, linux-hams@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 syzbot+2860e75836a08b172755@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
References: <20251023124107.3405829-1-lizhi.xu@windriver.com>
 <20251023135032.3759443-1-lizhi.xu@windriver.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251023135032.3759443-1-lizhi.xu@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/23/25 3:50 PM, Lizhi Xu wrote:
> The root cause of the problem is that multiple different tasks initiate
> SIOCADDRT & NETROM_NODE commands to add new routes, there is no lock
> between them to protect the same nr_neigh.
> 
> Task0 can add the nr_neigh.refcount value of 1 on Task1 to routes[2].
> When Task2 executes nr_neigh_put(nr_node->routes[2].neighbour), it will
> release the neighbour because its refcount value is 1.
> 
> In this case, the following situation causes a UAF on Task2:
> 
> Task0					Task1						Task2
> =====					=====						=====
> nr_add_node()
> nr_neigh_get_dev()			nr_add_node()
> 					nr_node_lock()
> 					nr_node->routes[2].neighbour->count--
> 					nr_neigh_put(nr_node->routes[2].neighbour);
> 					nr_remove_neigh(nr_node->routes[2].neighbour)
> 					nr_node_unlock()
> nr_node_lock()
> nr_node->routes[2].neighbour = nr_neigh
> nr_neigh_hold(nr_neigh);								nr_add_node()
> 											nr_neigh_put()
> 											if (nr_node->routes[2].neighbour->count
> Description of the UAF triggering process:
> First, Task 0 executes nr_neigh_get_dev() to set neighbor refcount to 3.
> Then, Task 1 puts the same neighbor from its routes[2] and executes
> nr_remove_neigh() because the count is 0. After these two operations,
> the neighbor's refcount becomes 1. Then, Task 0 acquires the nr node
> lock and writes it to its routes[2].neighbour.
> Finally, Task 2 executes nr_neigh_put(nr_node->routes[2].neighbour) to
> release the neighbor. The subsequent execution of the neighbor->count
> check triggers a UAF.

I looked at the code quite a bit and I think this could possibly avoid
the above mentioned race, but this whole area looks quite confusing to me.

I think it would be helpful if you could better describe the relevant
scenario starting from the initial setup (no nodes, no neighs).

Thanks,

Paolo


