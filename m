Return-Path: <linux-hams+bounces-341-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A65F8D3A38
	for <lists+linux-hams@lfdr.de>; Wed, 29 May 2024 17:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9097B24B32
	for <lists+linux-hams@lfdr.de>; Wed, 29 May 2024 15:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E009E16EBF0;
	Wed, 29 May 2024 15:02:28 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from zg8tmtu5ljy1ljeznc42.icoremail.net (zg8tmtu5ljy1ljeznc42.icoremail.net [159.65.134.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A439E15A861;
	Wed, 29 May 2024 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.65.134.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994948; cv=none; b=gXmIMYEbXZcQyi7yXxGSTe39RMAtJdBOighpBmTgm6mmVo6HLEtjczXXUrhELo+3acMZAZMB/oGo4nmw4VZjSPGS95xWiSo6XLATjGbOXFk7qIeFYMZvM9YN9UOADywMTFrz5XAsjquksygzBjn2lOQBjW0U0qoLDVkbcF1diGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994948; c=relaxed/simple;
	bh=5CTNvleq74hIkx7CigW+o84JuXSTBHkN2WN10Osf0s4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=fLTtY8VrSATQvc04tKGhHdRv8m67p5+4ID0f9Q0fT/wtRaschIKNOA/c5u5CtsQJSlcwbWampoUlrx5Ty+kJGQN+D7mOHwtYAB4fmOqwBM6QMdQB/opGw4xcPo4QcGh0TIvfvGEaDhZn/6GRriKX6N7Oq00SN/x9cjbDiqgPZU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=159.65.134.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from duoming$zju.edu.cn ( [61.242.135.222] ) by
 ajax-webmail-mail-app2 (Coremail) ; Wed, 29 May 2024 23:01:52 +0800
 (GMT+08:00)
Date: Wed, 29 May 2024 23:01:52 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: duoming@zju.edu.cn
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Cc: "Lars Kellogg-Stedman" <lars@oddbit.com>,
	"Paolo Abeni" <pabeni@redhat.com>, linux-hams@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v4] ax25: Fix refcount imbalance on inbound connections
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT5 build
 20231205(37e20f0e) Copyright (c) 2002-2024 www.mailtech.cn zju.edu.cn
In-Reply-To: <962afcda-8f67-400f-b3eb-951bf2e46fb7@moroto.mountain>
References: <20240522183133.729159-2-lars@oddbit.com>
 <8e9a1c59f78a7774268bb6defed46df6f3771cbc.camel@redhat.com>
 <rkln7v7e5qfcdee6rgoobrz7yzuv7yelzzo7omgsmnprtsplr5@q25qrue4op7e>
 <962afcda-8f67-400f-b3eb-951bf2e46fb7@moroto.mountain>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <3cf699c4.20d18.18fc4df304a.Coremail.duoming@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:by_KCgCHEqFhQ1dmxtiJAQ--.33773W
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwMQAWZXO0UKoAACs2
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

T24gV2VkLCAyOSBNYXkgMjAyNCAxNzozNDoyMCArMDMwMCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+
IDEpIFRoZSBGaXhlcyB0YWcgcG9pbnRzIHRvIHRoZSB3cm9uZyBjb21taXQsIHRob3VnaCwgcmln
aHQ/ICBUaGUgb25lCj4geW91IGhhdmUgaGVyZSBkb2Vzbid0IG1ha2Ugc2Vuc2UgYW5kIGl0IGRv
ZXNuJ3QgbWF0Y2ggdGhlIGJpc2VjdC4KCkkgYWxzbyBoYXZlIHRlc3RlZCBMYXJzIEtlbGxvZ2ct
U3RlZG1hbmBzIHBhdGNoLCBpdCB3b3JrcyB3ZWxsLiBJIHRoaW5rIHRoZSBGaXhlcyAKdGFnIHNo
b3VkIGJlIDlmZDc1YjY2YjhmNiAoImF4MjU6IEZpeCByZWZjb3VudCBsZWFrcyBjYXVzZWQgYnkg
YXgyNV9jYl9kZWwoKSIpLgoKPiAyKSBDYW4gd2UgZWRpdCB0aGUgY29tbWl0bWVzc2FnZSBhIGJp
dCB0byBzYXkgaW5jbHVkZSB3aGF0IHlvdSB3cm90ZQo+IGFib3V0ICJidXQgcmF0aGVyIGJpbmQv
YWNjZXB0IiBiZWluZyBwYWlyZWQuICBXZSBpbmNyZW1lbnQgaW4gYmluZAo+IGFuZCB3ZSBzaG91
bGQgaW5jcmVtZW50IGluIGFjY2VwdCBhcyB3ZWxsLiAgSXQncyB0aGUgc2FtZS4KPiAKPiAzKSBU
aGUgb3RoZXIgdGhpbmcgdGhhdCBJIG5vdGljZSBpcyB0aGF0IER1b21pbmcgZHJvcHBlZCBwYXJ0
IG9mIGhpcwo+IGNvbW1pdCB3aGVuIGhlIHJlc2VudCB2Ni4KPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvNWM2MWZlYTFiMjBmM2MxNTk2ZTRmYjQ2MjgyYzNkZWRjNTQ1MTNhMy4xNzE1MDY1
MDA1LmdpdC5kdW9taW5nQHpqdS5lZHUuY24vCj4gVGhhdCBwYXJ0IG9mIHRoZSBjb21taXQgd2Fz
IGNvcnJlY3QuICBNYXliZSBpdCB3YXNuJ3QgbmVjZXNzYXJ5IGJ1dCBpdAo+IGZlZWxzIHJpZ2h0
IGFuZCBpdCdzIG1vcmUgcmVhZGFibGUgYW5kIGl0J3Mgb2J2aW91c2x5IGhhcm1sZXNzLiAgSSBj
YW4KPiByZXNlbmQgdGhhdC4KCkkgd2lsbCByZXNlbmQgaXQgbGF0dGVyLgoKQmVzdCByZWdhcmRz
LApEdW9taW5nIFpob3UKCg==

