Return-Path: <linux-hams+bounces-611-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0E9B3F71F
	for <lists+linux-hams@lfdr.de>; Tue,  2 Sep 2025 09:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 187D13BB674
	for <lists+linux-hams@lfdr.de>; Tue,  2 Sep 2025 07:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2212E7653;
	Tue,  2 Sep 2025 07:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eXPw86tN"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8114B1F428C
	for <linux-hams@vger.kernel.org>; Tue,  2 Sep 2025 07:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756799750; cv=none; b=CWOUcMivRdJWRbz9vebwpnkMVzW6lLK6LePEtQu2J37CZVDyhZT9nRas3Qqd0fIohBXAOTBcej8FiyTaAaVBLTzBgCtj0nGeg20WZAYGuLCc7yfGSv9kzstiZ/GgPK9lk1mXqJBXe2eof3A++vZfd83Y/6RKDl/KufWuUyqQnH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756799750; c=relaxed/simple;
	bh=R5JjKpinWBFnUUW6V+Dh6HjBmrEj9fHJDeaWWnI8TTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXZC7OBN4ATbdYuOQmZ9g6AKDbgmpkNbsxzRp3gvtIb7v0tw7ZFMy/ekta20HUaybCYIH5lss6+luO8D7t0UduEG0VdusBOlCCt1cCNzZxdJdpqO4npJHy/AOMSZZupljzykLLVS19e9ajAD79eGLFOgNCiZOoQKMXGu5PzJ3Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eXPw86tN; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7e8704e9687so476890585a.1
        for <linux-hams@vger.kernel.org>; Tue, 02 Sep 2025 00:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756799747; x=1757404547; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5JjKpinWBFnUUW6V+Dh6HjBmrEj9fHJDeaWWnI8TTo=;
        b=eXPw86tNvPqSWpaNgBAANR+N24d9f2YrjVbDKiR3ud31y0lGVaukJllmZ03xW58fcQ
         3d0FY7imtT/T/qJ34iUIIjw1gLIVs+Uk+bHezJhfdyOEs13ZM2MsrCUp9+1SAK52gDSq
         7lgpr6bmu3SF5T7a3Cw/HmgnYPokuV349vb9QdNBGlMk2hm1jD2LW9qWruMabRKUBOU7
         fydSfLxtL1I3HKXZmBDw8WKb0oi9ugBAbOuhVvAwGzdzRN5diMtrYrFXntNRFUQR4zP+
         Sb5WIdcIi4wAmBrFULv5DPNHfxHFzS32FBMZPPbnCRmvAq1RM3aI3cO8M2z9rJHOmVt3
         ZSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756799747; x=1757404547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5JjKpinWBFnUUW6V+Dh6HjBmrEj9fHJDeaWWnI8TTo=;
        b=ZWuDgk8F0cit/xZBdYu+odM3kXAJJeQdkJo7qRY5feqpP8P2ZL//XlU2tNMnboz5C4
         ElHpaurfTYCFtVmujvJXKWOwDN2VYNy/1cGCduUeC1ppLpSUziGP+KJeZN3FFjxStP3o
         zmTSjHC+NIczn2LKJVH66rfbA/S+SUhpJYR+tXJX087Mv07lTMpYVoEbSAZlHTLzGqGa
         beCIvnabS0XSQr8JJkjATXbmXVnG1OEGSV6qpCq04bp3xYsh6RslIFbD/tsy/nakvlWp
         mKxeCVWH5MaMc408pPUgFojaXsh0W6kJiMVcsxCXL/mrk5YgjyDK4PkIIEyjdoWZFLSR
         SHbg==
X-Forwarded-Encrypted: i=1; AJvYcCXVzy9d4Oa9u21exf5t5GpvfT+t6Y9NiVEkHrFD0mx4jkkmoBU/UmXW8MNCYiNduj+D01ORnJRLNoQt@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd92bML2+vITijWPqvCOo4wmP0aL1Rtrbv/SxQ0k5SAeCt7oRy
	B3gS3VfQ4y0gPNaRvVJa0REkTR7SztKzEBQu4xz2MvboIZWCVsv+LaY3zseg9RTbqHOV9TUr6pt
	gLHh6OKSmgT+9vWSn4Bz+eT7k6d6m7zoUa/UYR1b7
X-Gm-Gg: ASbGncuwNo879GfgWPHkad1KVGVkHTHKUZwvIFJbCjDXofU7eCxUEaYCSWSpJJOARRl
	/7ibJMZcjnqSzVjUmbbakX53GU4SbmU7grjHFAavybgoBAeW+biy8CFOAXBlc5ZQnbTg2/lirNq
	vxzSIGbNXKaWvN8nLzHKULEGtkqKhZl1b92CL2RuQ4eZ44NA9T7CKEd5m+vabRqenBdbAllV8bc
	XmFYxpPpTGonX7b/J7S0QzJ
X-Google-Smtp-Source: AGHT+IGbwtGdrMFQZ6o9HkrZ8v5t2SSqHd4hp6DHCZ4rLDynbaulRNdShi8IFB6n5mcJNPHAyAg0ACU3bKwX6hPljxQ=
X-Received: by 2002:a05:620a:3950:b0:804:c43:1b68 with SMTP id
 af79cd13be357-8040c431f3emr614482485a.37.1756799746971; Tue, 02 Sep 2025
 00:55:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr> <4e4c9952-e445-41af-8942-e2f1c24a0586@free.fr>
 <90efee88-b9dc-4f87-86f2-6ab60701c39f@free.fr> <6c525868-3e72-4baf-8df4-a1e5982ef783@free.fr>
 <d073ac34a39c02287be6d67622229a1e@vanheusden.com> <6a5cf9cf-9984-4e1b-882f-b9b427d3c096@free.fr>
 <aKxZy7XVRhYiHu7c@stanley.mountain> <0c694353-2904-40c2-bf65-181fe4841ea0@free.fr>
 <CANn89iJ6QYYXhzuF1Z3nUP=7+u_-GhKmCbBb4yr15q-it4rrUA@mail.gmail.com>
 <4542b595-2398-4219-b643-4eda70a487f3@free.fr> <aK9AuSkhr37VnRQS@strlen.de>
 <eb979954-b43c-4e3d-8830-10ac0952e606@free.fr> <1713f383-c538-4918-bc64-13b3288cd542@free.fr>
 <CANn89i+Me3hgy05EK8sSCNkH1Wj5f49rv_UvgFNuFwPf4otu7w@mail.gmail.com>
 <CANn89iLi=ObSPAg69uSPRS+pNwGw9jVSQJfT34ZAp3KtSrx2Gg@mail.gmail.com>
 <cd0461e0-8136-4f90-df7b-64f1e43e78d4@trinnet.net> <80dad7a3-3ca1-4f63-9009-ef5ac9186612@free.fr>
 <CANn89iJGdn2J-UwK9ux+m9r8mRhAND_t2kU6mLCs=RszBhCyRA@mail.gmail.com> <e901a424-fe95-4adc-9777-31d54464d2c5@free.fr>
In-Reply-To: <e901a424-fe95-4adc-9777-31d54464d2c5@free.fr>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 2 Sep 2025 00:55:36 -0700
X-Gm-Features: Ac12FXwRiNH6f-m_ly0qAGDfsRps5QoJbfAaPta3A9HiVXiyeBrarvblQGapAEc
Message-ID: <CANn89iKe3x4yEO940oDLfypDNoejjaX5xf+ksnnpMXpBpApQJA@mail.gmail.com>
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
To: F6BVP <f6bvp@free.fr>
Cc: David Ranch <linux-hams@trinnet.net>, Paolo Abeni <pabeni@redhat.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-hams@vger.kernel.org, 
	netdev <netdev@vger.kernel.org>, Dan Cross <crossd@gmail.com>, 
	Folkert van Heusden <folkert@vanheusden.com>, Florian Westphal <fw@strlen.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 12:45=E2=80=AFAM F6BVP <f6bvp@free.fr> wrote:
>
> I tested the fix and validated it on different kernels versions.
>
> All are doing fine : 6.14.11 , 6.15.11, 6.16.4
>
> Congratulations and many thanks to Eric Dumazet for spending his time on
> repairing AX25 mkiss serial connexions.
>
> Hamradio fans will be able to continue experimenting with AX25 using
> next Linux developments.
>

Great, many thanks again for your report, bisection, and tests.

I will send the formal patch right away.


> Bernard Pidoux
> F6BVP / AI7BG
> http://radiotelescope-lavillette.fr
>
>
> Le 01/09/2025 =C3=A0 18:03, Eric Dumazet a =C3=A9crit :
>
> > Keep calm, I am just saying that the bisection pointed to a fine commit=
,
> > but it took a _lot_ of time to root-cause the issue.
> >
> > And the bug is in ax25, not in Paolo patch.
> >
> > Please test the fix, and thank me for actually working on a fix, while
> > I have more urgent work on my plate.

