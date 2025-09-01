Return-Path: <linux-hams+bounces-604-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7906EB3EBC1
	for <lists+linux-hams@lfdr.de>; Mon,  1 Sep 2025 18:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05F201888AB4
	for <lists+linux-hams@lfdr.de>; Mon,  1 Sep 2025 16:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934DD1DB15F;
	Mon,  1 Sep 2025 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="FtbqRDsy"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C552DF127;
	Mon,  1 Sep 2025 15:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756742379; cv=none; b=qUeBLkp4mkpspRtI6CzrLsY8RwuE1TrsvXLsIwH7PYO4Sx4GE2x2q9Shx91qGUyh1fHEd5Y8FVH702csiXMhr3uu9d0SQUALIAx2CsyW6dZyyfn36Cti5YtNeEKuRBb4PXTCtDTzPSCUhh7RSWJKx9RnWCwUUW2stqGk/MNT0NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756742379; c=relaxed/simple;
	bh=aRncrBP+0dOhnaydrLgLGrw9BPRrChwKvC7uSC0IlKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TmzUWExwGnE5xEllBgyM0ibNedoBLJlbSXCy8+HSQsZdY4vJsPLYfa3T4Khx25mIzYWXDHaStWIpZlDx4RGxO+9u0vY+YdSl3rS+fmrTWZy1mJ5viTvoYEeVaYYYwE5O91o+SjtPJR4BkNNo0OiLvMCuqWd3PGU7L+prLR7MSsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=FtbqRDsy; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: f6bvp@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3562D19F5A5;
	Mon,  1 Sep 2025 17:59:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1756742369;
	bh=aRncrBP+0dOhnaydrLgLGrw9BPRrChwKvC7uSC0IlKE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FtbqRDsyopgibHfUr/AtjjAovI/xUPdkpANs4141kNvXvIFJHJ0JZNzXXG1V9i6h6
	 l8SAQn5H4VHmcJu0z9z0IJoO8pLHy3cwduWWnJW22rGpfbNxZEtA8XCIyW8SCHeCun
	 LLWS+tEkJmPcW5ySZN4Smqf4dxeWuHgws1JzqGtjSNz14HCMBF0F92RZbdBZZpkIjW
	 iOaOYsvQhAxf+G0YWgWnJ9PrmHMSABQuJ7g90S2Soe8UF9VjRVFX1xnOtEeKhY8D4j
	 Q8N75eHVyomM1w1VH34PC9K2XYBwmu70Sm9Gfd069ex3UE7q2RwjdFqGEsw2r+vxCH
	 QMHPwQ8OEknpw==
Message-ID: <80dad7a3-3ca1-4f63-9009-ef5ac9186612@free.fr>
Date: Mon, 1 Sep 2025 17:59:17 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
To: David Ranch <linux-hams@trinnet.net>, Eric Dumazet <edumazet@google.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, linux-hams@vger.kernel.org,
 netdev <netdev@vger.kernel.org>, Dan Cross <crossd@gmail.com>,
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
 <CANn89iLi=ObSPAg69uSPRS+pNwGw9jVSQJfT34ZAp3KtSrx2Gg@mail.gmail.com>
 <cd0461e0-8136-4f90-df7b-64f1e43e78d4@trinnet.net>
Content-Language: en-US
From: F6BVP <f6bvp@free.fr>
In-Reply-To: <cd0461e0-8136-4f90-df7b-64f1e43e78d4@trinnet.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Radioamateur have contributed to Linux since the begining.

If a protocole should be removed from Linux kernel as soon as a commit 
breaks it, Linux itself would be t be abandonned.

AX25 is not responsible of a kernel Oops due to a commit in dev.c

Like David KI6ZHD mentionned, many hams are still experimenting using 
packet radio.

Not mentioning that a large number of pico satellites from universities 
all around the world are using AX25 for TM/TC !

Bernard Pidoux
F6BVP /AI7BG
Founder president AMSAT-France
President Dimension Parabole
http://radiotelescope-lavillette.fr


Le 01/09/2025 à 16:43, David Ranch a écrit :
> 
> Hello Eric, Everyone,
> 
>>> At some point we will have to remove ax25, this has been quite broken
>>> for a long time.
> 
> I can appreciate that the code implementing AX.25 in the kernel is very 
> old but say it needs to be removed will impact a lot of people.  There 
> is a very active community around AX.25 packet radio today and Linux's 
> native implementation still offers features and functions that aren't 
> implemented anywhere else.  There are also some large / popular projects 
> that are dependent on it for their connectivity via libax25, etc.  I 
> continue to hope someone will be willing to step forward and write a 
> modernized version of this stack (and netrom and rose too) so we can 
> continue to run things natively on Linux.
> 
> --David
> KI6ZHD


