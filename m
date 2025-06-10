Return-Path: <linux-hams+bounces-526-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFEFAD3FCC
	for <lists+linux-hams@lfdr.de>; Tue, 10 Jun 2025 19:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50BFA189DF8D
	for <lists+linux-hams@lfdr.de>; Tue, 10 Jun 2025 17:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB722376EF;
	Tue, 10 Jun 2025 17:00:43 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89BD1EBA09;
	Tue, 10 Jun 2025 17:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.78.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749574843; cv=none; b=DSXmDoy+OyFi9dz5C4BY97/OEPTjIAI5sCHzJwieRKQM/wMM7C47v45Ty9f8QmjveOmK0Egpyjk9ZAUmOWUrX1Lm1vNkH5ZPJpJquhT5ClKoLHXM7b+rWt6Tyxv1atLet5rs7ZWFQUYKskTFjPKakLRcfOBwqU3C9Y3LtfXJxqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749574843; c=relaxed/simple;
	bh=Rwc4NuErVkFpHBkoUx3q2sPM3JKnIPVvz372v7HbkF4=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FnnI+RMMmo/bPaPx0AE4ITj3VDsH26EXFjTBAWhSSouyH4HswX9RaS1C/+uQHV1L6IswhZrPAo5G/cNEDm5CeKjs8pdXYtdBhwQsKLFO8S3ZHdgBRogbRcZmHwXPgKrHWYdjLhE0aou3F1HY2QUIo2oZbdI7bzk7PeuVq3iBZ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net; spf=pass smtp.mailfrom=trinnet.net; arc=none smtp.client-ip=96.78.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 55AH05eh017638;
	Tue, 10 Jun 2025 10:00:05 -0700
Subject: Re: [PATCH net] netrom: fix possible deadlock in nr_rt_device_down
To: Dan Cross <crossd@gmail.com>
References: <20250605105449.12803-1-arefev@swemel.ru>
 <20250609155729.7922836d@kernel.org>
 <5f821879-6774-3dc2-e97d-e33b76513088@trinnet.net>
 <20250609162642.7cb49915@kernel.org>
 <4cfc85af-c13a-aa9c-a57c-bf4b6e0f2186@trinnet.net>
 <CAEoi9W57D-BfpYUAe5M3zjJvTUQUL4UUB+iWkpRO_o8JWfS7FQ@mail.gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Denis Arefev <arefev@swemel.ru>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Nikita Marushkin <hfggklm@gmail.com>,
        Ilya Shchipletsov <rabbelkin@mail.ru>,
        Hongbo Li <lihongbo22@huawei.com>, linux-hams@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org, stable@vger.kernel.org,
        syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com
From: David Ranch <linux-hams@trinnet.net>
Message-ID: <50676604-b8c9-cc57-1ce0-a4db4758b190@trinnet.net>
Date: Tue, 10 Jun 2025 10:00:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAEoi9W57D-BfpYUAe5M3zjJvTUQUL4UUB+iWkpRO_o8JWfS7FQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Tue, 10 Jun 2025 10:00:07 -0700 (PDT)

Yes, this seems like a reasonable approach though I understand all this=20
code is old, overly complicated, and when proposed changes are=20
available, little to no proper testing is done before it's commited and=20
it takes a very long time to get properly fixed.

I only bring this all up as the Linux AX.25 community has been badly=20
bitten by similar commits in the last few years.  I've tried to help=20
find a new maintainer and/or find somewhere to possibly create and run=20
CI tests to catch issues but I've been unsuccessful so far.

I am happy to try helping on the testing side once I know what the test=20
harness is but I'm out of my league when it comes to the code side.

--David
KI6ZHD


On 06/10/2025 06:36 AM, Dan Cross wrote:
> On Mon, Jun 9, 2025 at 7:31=E2=80=AFPM David Ranch <linux-hams@trinnet.=
net> wrote:
>> That's unclear to me but maybe someone else knowing the code better th=
an
>> myself can chime in.  I have to assume having these locks present
>> are for a reason.
>
> The suggestion was not to remove locking, but rather, to fold multiple
> separate locks into one. That is, have a single lock that covers both
> the neighbor list and the node list. Naturally, there would be more
> contention around a single lock in contrast to multiple, more granular
> locks. But given that NETROM has very low performance requirements,
> and that the data that these locks protect doesn't change that often,
> that's probably fine and would eliminate the possibility of deadlock
> due to lock ordering issues.
>
>         - Dan C.
>
>> On 06/09/2025 04:26 PM, Jakub Kicinski wrote:
>>> On Mon, 9 Jun 2025 16:16:32 -0700 David Ranch wrote:
>>>> I'm not sure what you mean by "the only user of this code".  There a=
re
>>>> many people using the Linux AX.25 + NETROM stack but we unfortunatel=
y
>>>> don't have a active kernel maintainer for this code today.
>>>
>>> Alright, sorry. Either way - these locks are not performance critical=

>>> for you, right?
>>>
>>


