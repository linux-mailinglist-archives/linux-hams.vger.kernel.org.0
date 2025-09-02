Return-Path: <linux-hams+bounces-609-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 069A4B3F6DF
	for <lists+linux-hams@lfdr.de>; Tue,  2 Sep 2025 09:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 562792032F1
	for <lists+linux-hams@lfdr.de>; Tue,  2 Sep 2025 07:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA782E7652;
	Tue,  2 Sep 2025 07:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="efrNk8qZ"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97A52E764C;
	Tue,  2 Sep 2025 07:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756799111; cv=none; b=oxhIPRX/An+pXSYKz+f+mfUaZcrch2cnYIvBXocJBOaUAt50Jl4KC7DoUMTDUL5+gd75X6Kp56bR/pqbCDFyjFEi9XKInFf4oc7NsXqiwtTnDLwT66C5SLJSWpF+ubS8otGpwkB640uXm7ksPqSRCsGr3PuzL1Y1nl5g9wx2dR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756799111; c=relaxed/simple;
	bh=ZHxQkWdECosmY0fOSP56UT2lC9ZKVuJZ/zaN1wniSIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pOmnTn7+Qn/Feow7yOMzNkDC422kxMfXbujZ43A6JcfbU5pibCWcyDgI1jmtrVboJQ+NyCFwXSpjQhbev7Fl1ilJRlJ42C42yrZONTOWBPem4EIVfTB4Kx8TACL/lFp6T4cjJjFCkSbhMnFXzEActEpJpVDu087sLEpNLyJm5qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=efrNk8qZ; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: f6bvp@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id E307819F73D;
	Tue,  2 Sep 2025 09:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1756799106;
	bh=ZHxQkWdECosmY0fOSP56UT2lC9ZKVuJZ/zaN1wniSIQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=efrNk8qZSRTSn2FdjGT56UEOhM1idGvJuKk5poVvscOISXuDpwhCz67cy0vbefEzx
	 n4gO62o32danQLe4ukSEWlgRK1/CJVIwYasMriMv5BCYoRDsr/Yk2fX4BDCmXR6PP2
	 Q58qKciRfcP4fRp18Yshb6JYwi5WLWcz6kWKpbDDlb7V0P0WPI1GCx17z8QyrOMhap
	 6Qez+YKoKbZS/Td48vnN5IqJ2/u5fyAwpTIOWthq4oQeEhGNadlA6WS8fTO0pDKJCv
	 BtqTtpKWsPdCh0awTRrs4Mpm3mQnveI0m6Sz3w2dXH1X7lfnTu86iHJWxRt57QKhZn
	 E9mCS4SojRBCQ==
Message-ID: <e901a424-fe95-4adc-9777-31d54464d2c5@free.fr>
Date: Tue, 2 Sep 2025 09:44:56 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ROSE] [AX25] 6.15.10 long term stable kernel oops
To: Eric Dumazet <edumazet@google.com>
Cc: David Ranch <linux-hams@trinnet.net>, Paolo Abeni <pabeni@redhat.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, linux-hams@vger.kernel.org,
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
 <80dad7a3-3ca1-4f63-9009-ef5ac9186612@free.fr>
 <CANn89iJGdn2J-UwK9ux+m9r8mRhAND_t2kU6mLCs=RszBhCyRA@mail.gmail.com>
Content-Language: en-US
From: F6BVP <f6bvp@free.fr>
In-Reply-To: <CANn89iJGdn2J-UwK9ux+m9r8mRhAND_t2kU6mLCs=RszBhCyRA@mail.gmail.com>
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


Le 01/09/2025 à 18:03, Eric Dumazet a écrit :

> Keep calm, I am just saying that the bisection pointed to a fine commit,
> but it took a _lot_ of time to root-cause the issue.
> 
> And the bug is in ax25, not in Paolo patch.
> 
> Please test the fix, and thank me for actually working on a fix, while
> I have more urgent work on my plate.

