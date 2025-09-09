Return-Path: <linux-hams+bounces-630-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7801B4FB49
	for <lists+linux-hams@lfdr.de>; Tue,  9 Sep 2025 14:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4673189200F
	for <lists+linux-hams@lfdr.de>; Tue,  9 Sep 2025 12:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B742259CB9;
	Tue,  9 Sep 2025 12:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhkEfSNC"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A666DF9C1;
	Tue,  9 Sep 2025 12:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421230; cv=none; b=jyjdMD8PluQBKOyS7fQ+ce9k9EgIamkMbwmQkOIJkzxHtv5hV5LEQJ5L+NW3UmNFdtjh9JASjR+yrErgKRvKzJqoxmM4ZolxU1SDmw2gi21wrd4w5Glf0gznzYvjt40Z+EU08GAVuwHvC5E15QHQFIiZqHDAGTYIXozdI8JJDG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421230; c=relaxed/simple;
	bh=A2tU/xtd3BTV444h9kIFQNbsYwlU0UhPoSd5+Pnl58k=;
	h=From:Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:In-Reply-To; b=J/+K9C3kaBaVIQRsn+Ai3AjCzpY+QMvGCNjkXV9mkt5x2fxtJf00Bj5BBBnXba0WmP30AeHX4arO8sEJKEyLkKWCi3r6YyEYjwqG4PI4LhaPmcq5vEngdIMHr6dhB2QLm0SXUHEcvqNeB8PUWgqlFuDXT3oGjO3+04A2/1RzmzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhkEfSNC; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3d3ff4a4d6fso3434076f8f.0;
        Tue, 09 Sep 2025 05:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757421227; x=1758026027; darn=vger.kernel.org;
        h=in-reply-to:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUN/g6V4kVXRXj3ZRDdwAAJyyX55nGHiqxjJmrcGlD8=;
        b=GhkEfSNCkmfAnOh6HY6gWAQHUr23/hfXe1eubxwWQfjVJENnpxBoWUh5oIwpLcDrEB
         MV004RaH+9QAxa9ZZ134wMdKZ5Ket0U19De7OtSd5AiitVqQNkOyEZbStrZ+BwYMAVkg
         ceX+NQiMMIJ/kTRmkiF1g6IV1D7UwYXEg5qoVXE1Is4UhQ/yx25aopRa2O251RqQtbxF
         cD5BV0Uz+3iMljWtbZRw91a9KOJIIVKiEvQxtfTqIjtFnErZNA27MLHsPK8C/L0dM+yk
         zXY4lyQyoW0uhXsia7ByjFv1drP4ic17RlHA1ha4rsJ9NHsanjHkGpUP7PbkQojkU7Eu
         3iUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757421227; x=1758026027;
        h=in-reply-to:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUN/g6V4kVXRXj3ZRDdwAAJyyX55nGHiqxjJmrcGlD8=;
        b=fz8Vtvee1m5x4I0VYcgKvjeEqlS3cf4ocHWxnxul2JHPf9+Qe97KHrh/vWALMZQNt/
         4W3c6TwQNDFTLUgbs8f74PfrLJdaoh1RhsA5BxAYtSTmK4xIsfJij9A7uESn2eO45oE6
         rna/EnjmW9YgiCVOEOlXK4slbl1wK4sAZVEL4HxEQdRTmE3aCYnu8cWF1CJjbNPmyk5b
         90frrvZ4f9xOkgI86MHu+5mXeMNEC5QK0uW/J3iiaNKkoxzPYWYZxNz6oy0xB0dL+eEA
         NWNQDZWu1Ko7bABjfj4kp4CQPI00fIvj4wpEvRAo2Z+4izJO+/hEGyODHpiiDe1qsH3v
         vuAw==
X-Forwarded-Encrypted: i=1; AJvYcCUFqK5JROsWlrs5smcXi1loe5bnNTXSFum5gUCN0vhpjfYnoscJy/kJlrFQB7/NLmueUFWZVJ6+@vger.kernel.org, AJvYcCV3AiloQUuD48BprW9Mme9GzuZEuA9m0flbpyJJYePNrqtm5+KWbHCxdsX2Iq4xyubwiSkXThjFOi9jmEHR@vger.kernel.org, AJvYcCW7WtFtf3uGthLIgMrHoqjmtwvHPaqHLBuuANMwn2JXxxl43BtFzc/hHuQ5+96b4QwIXu1H5NIup3ip@vger.kernel.org, AJvYcCWeaY3cOUh00/Kvxd0Lf1X88/Csai8EUQrTHDqxnBiFNK0o6YYbsDkewksRLLOaZjWcig16l6kK@vger.kernel.org
X-Gm-Message-State: AOJu0YyySz3/1GnCeFFGt9VT8WWnMBblK52bNhkHTj0vVEdu4Dd3Y9+M
	Sb5itGqB3P/6xMUzLdLeSinjGwuJ+IELJOXxK41Shai9Tj/RgLICvPAK
X-Gm-Gg: ASbGncsp+IwQpV6V/jVgtJxg/Tff4EaU+dg37TcFtoYkvweUPYqojgWSc8zQQjzJ3as
	A9j+Ur8tAU+ZroqfJyGpakqvyS0/AC8wy0/n/rz7E/fMV3rdrsUKza9yMbvuWvb7rylmUY+7+DP
	CGKLfM9l8wJd0L1d8IAYv0rFSGO+ayI1wWE5oKkw+49FG+U1OiuzzXNG98hWKvI+6JLOmzWLFXy
	ly1xlPCOM08cMphNrQjp9ewkVxL7AUkCV1bEBC5Zb37mZDhBU28+edkUZyAQ6wvAD4hlBqCVl7k
	Edt4U09P/Lz/F4vZFjoYkjn+39YQWnISB1QyaGl0h7kHBdY1rKuXWrmNprErU22/+gaIo1iK+jS
	K70C2kJJFt9AnUyIgP0f+mdpi0ZDiKCB2elbfZ/2cssybK+p8FrEne7KUUAeMwVsY6B6pP7rDdT
	xZojxDAo+4KSokv4CAX4Iv3dQ=
X-Google-Smtp-Source: AGHT+IFlkQK50ca3C17gUkoUMoMzGvDi+z/z00TwTRAcGETJUKzh9++kDWY5aR6gX8xFu6ldN68iNA==
X-Received: by 2002:a05:6000:2489:b0:3e5:13bc:1fea with SMTP id ffacd0b85a97d-3e642f91885mr9562517f8f.31.1757421226657;
        Tue, 09 Sep 2025 05:33:46 -0700 (PDT)
Received: from [44.168.19.11] (lfbn-idf1-1-366-193.w86-195.abo.wanadoo.fr. [86.195.82.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e752238755sm2452242f8f.32.2025.09.09.05.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 05:33:46 -0700 (PDT)
From: Bernard f6bvp <bernard.f6bvp@gmail.com>
X-Google-Original-From: Bernard f6bvp <Bernard.f6bvp@gmail.com>
Content-Type: multipart/mixed; boundary="------------HEfVPYCwXgP0W2a0zLzMq9AJ"
Message-ID: <f56f4d49-4175-4863-b523-aae628394e2c@gmail.com>
Date: Tue, 9 Sep 2025 14:33:45 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4] netrom: linearize and validate lengths in
 nr_rx_frame()
To: Jakub Kicinski <kuba@kernel.org>
Cc: stanislav.fort@aisle.com, davem@davemloft.net, disclosure@aisle.com,
 edumazet@google.com, horms@kernel.org, linux-hams@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 security@kernel.org, stable@vger.kernel.org
References: <FDBA9F48-A844-4E65-A8B1-6FB660754342@gmail.com>
 <20250908174331.47d895a0@kernel.org>
Content-Language: en-US
In-Reply-To: <20250908174331.47d895a0@kernel.org>

This is a multi-part message in MIME format.
--------------HEfVPYCwXgP0W2a0zLzMq9AJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

There was also an additional tab in line 14...

Here is well formated patch I applied after fixing it for my own use.

NetRom is performing fine.

Thanks,

Bernard

Le 09/09/2025 à 02:43, Jakub Kicinski a écrit :
> On Sun, 7 Sep 2025 16:32:03 +0200 Bernard Pidoux wrote:
>> While applying netrom PATCH net v4
>> patch says that
>> it is malformed on line 12.
> 
> FWIW the version I received is completely mangled. There's a leading
> space before each +. You can try B4 relay if your mail server is giving
> you grief.

--------------HEfVPYCwXgP0W2a0zLzMq9AJ
Content-Type: text/plain; charset=UTF-8;
 name="NetRom_patch_09-25_malformed.patch"
Content-Disposition: attachment; filename="NetRom_patch_09-25_malformed.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL25ldC9uZXRyb20vYWZfbmV0cm9tLmMgYi9uZXQvbmV0cm9tL2FmX25l
dHJvbS5jDQppbmRleCAzMzMxNjY5Li5mMDY2MGRkIDEwMDY0NA0KLS0tIGEvbmV0L25ldHJv
bS9hZl9uZXRyb20uYw0KKysrIGIvbmV0L25ldHJvbS9hZl9uZXRyb20uYw0KQEAgLTg4NSw2
ICs4ODUsMTEgQEAgaW50IG5yX3J4X2ZyYW1lKHN0cnVjdCBza19idWZmICpza2IsIHN0cnVj
dCBuZXRfZGV2aWNlICpkZXYpDQogCSAqCXNrYi0+ZGF0YSBwb2ludHMgdG8gdGhlIG5ldHJv
bSBmcmFtZSBzdGFydA0KIAkgKi8NCiANCisJaWYgKHNrYl9saW5lYXJpemUoc2tiKSkNCisJ
CXJldHVybiAwOw0KKwlpZiAoc2tiLT5sZW4gPCBOUl9ORVRXT1JLX0xFTiArIE5SX1RSQU5T
UE9SVF9MRU4pDQorCQlyZXR1cm4gMDsNCisNCiAJc3JjICA9IChheDI1X2FkZHJlc3MgKiko
c2tiLT5kYXRhICsgMCk7DQogCWRlc3QgPSAoYXgyNV9hZGRyZXNzICopKHNrYi0+ZGF0YSAr
IDcpOw0KIA0KQEAgLTkyNyw2ICs5MzIsMTEgQEAgaW50IG5yX3J4X2ZyYW1lKHN0cnVjdCBz
a19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpDQogCX0NCiANCiAJaWYgKHNr
ICE9IE5VTEwpIHsNCisJCWlmIChmcmFtZXR5cGUgPT0gTlJfQ09OTkFDSyAmJg0KKwkJICAg
IHNrYi0+bGVuIDwgTlJfTkVUV09SS19MRU4gKyBOUl9UUkFOU1BPUlRfTEVOICsgMSkgew0K
KwkJCXNvY2tfcHV0KHNrKTsNCisJCQlyZXR1cm4gMDsNCisJCX0NCiAJCWJoX2xvY2tfc29j
ayhzayk7DQogCQlza2JfcmVzZXRfdHJhbnNwb3J0X2hlYWRlcihza2IpOw0KIA0KQEAgLTk2
MSwxMCArOTcxLDE0IEBAIGludCBucl9yeF9mcmFtZShzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBz
dHJ1Y3QgbmV0X2RldmljZSAqZGV2KQ0KIAkJcmV0dXJuIDA7DQogCX0NCiANCi0Jc2sgPSBu
cl9maW5kX2xpc3RlbmVyKGRlc3QpOw0KKwkvKiBOZWVkIHdpbmRvdyAoYnl0ZSAyMCkgYW5k
IHVzZXIgYWRkcmVzcyAoYnl0ZXMgMjEtMjcpICovDQorCWlmIChza2ItPmxlbiA8IE5SX05F
VFdPUktfTEVOICsgTlJfVFJBTlNQT1JUX0xFTiArIDEgKyBBWDI1X0FERFJfTEVOKQ0KKwkJ
cmV0dXJuIDA7DQogDQogCXVzZXIgPSAoYXgyNV9hZGRyZXNzICopKHNrYi0+ZGF0YSArIDIx
KTsNCiANCisJc2sgPSBucl9maW5kX2xpc3RlbmVyKGRlc3QpOw0KKw0KIAlpZiAoc2sgPT0g
TlVMTCB8fCBza19hY2NlcHRxX2lzX2Z1bGwoc2spIHx8DQogCSAgICAobWFrZSA9IG5yX21h
a2VfbmV3KHNrKSkgPT0gTlVMTCkgew0KIAkJbnJfdHJhbnNtaXRfcmVmdXNhbChza2IsIDAp
Ow0K

--------------HEfVPYCwXgP0W2a0zLzMq9AJ--

