Return-Path: <linux-hams+bounces-259-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 093A58C093B
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 03:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0B691F22027
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 01:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245523D548;
	Thu,  9 May 2024 01:40:38 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net [129.150.39.64])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A06510979;
	Thu,  9 May 2024 01:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.150.39.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715218838; cv=none; b=QM+LeTde4rUpvNAawTioelN7Xuc4W7AR/GWSg+gvBnr2fgdau02QBeOJm0NYqbkAYwyKSIji953dluHAiPZ4CD6i+pyANik0NZuytA8XCuff7WZBt/IDF+e+bsjmKfllUzZ8yEKVN63ochzV2qgOciSmIY0VOJzTFughnRhvmYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715218838; c=relaxed/simple;
	bh=vypeUuzuRONIjZ7ZibBQrbY2ZXTNxfDGI+HhUXXdBN4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=NiIafw/TTINftVGfcWSDAd8ZC6P71+g8P+ETiBWkLtUPswzy8IuaZYtP4ldHe0HMcnGD3lbBZH4oADWKHm+bXNhvRRGfOS858ms23C2sDQcU02UUJtXxhItoAcWznQUeO0aCBAra7nbPy1wGt3EdbPoKwVWJNl7V3ZxF4DQIAww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=129.150.39.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from duoming$zju.edu.cn ( [221.192.180.131] ) by
 ajax-webmail-mail-app4 (Coremail) ; Thu, 9 May 2024 09:40:02 +0800
 (GMT+08:00)
Date: Thu, 9 May 2024 09:40:02 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: duoming@zju.edu.cn
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Cc: "Lars Kellogg-Stedman" <lars@oddbit.com>, linux-hams@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, jreuter@yaina.de
Subject: Re: [PATCH net] ax25: Fix refcount leak issues of ax25_dev
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT5 build
 20231205(37e20f0e) Copyright (c) 2002-2024 www.mailtech.cn zju.edu.cn
In-Reply-To: <79dc1067-76dc-43b2-9413-7754f96fe08e@moroto.mountain>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <78ae8aa0-eac5-4ade-8e85-0479a22e98a3@moroto.mountain>
 <ekgwuycs3hioz6vve57e6z7igovpls6s644rvdxpxqqr7v7is6@u5lqegkuwcex>
 <1e14f4f1-29dd-4fe5-8010-de7df0866e93@moroto.mountain>
 <movur4qy7wwavdyw2ugwfsz6kvshrqlvx32ym3fyx5gg66llge@citxuw5ztgwc>
 <eb5oil2exor2bq5n3pn62575phxjdex6wdjwwjxjd3pd4je55o@4k4iu2xobel5>
 <79dc1067-76dc-43b2-9413-7754f96fe08e@moroto.mountain>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <5a4e0ffa.6776.18f5b01e5e0.Coremail.duoming@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cS_KCgDHVLJyKTxmyi1MAA--.5246W
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwIQAWY7nwoGrwABsw
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW7Jw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

T24gVHVlLCA3IE1heSAyMDI0IDExOjA4OjE0ICswMzAwIERhbiBDYXJwZW50ZXIgd3JvdGU6Cj4g
ZGlmZiAtLWdpdCBhL25ldC9heDI1L2FmX2F4MjUuYyBiL25ldC9heDI1L2FmX2F4MjUuYwo+IGlu
ZGV4IDkxNjllZmIyZjQzYS4uNGQxYWIyOTZkNTJjIDEwMDY0NAo+IC0tLSBhL25ldC9heDI1L2Fm
X2F4MjUuYwo+ICsrKyBiL25ldC9heDI1L2FmX2F4MjUuYwo+IEBAIC05Miw2ICs5Miw3IEBAIHN0
YXRpYyB2b2lkIGF4MjVfa2lsbF9ieV9kZXZpY2Uoc3RydWN0IG5ldF9kZXZpY2UgKmRldikKPiAg
CQkJCXNwaW5fdW5sb2NrX2JoKCZheDI1X2xpc3RfbG9jayk7Cj4gIAkJCQlheDI1X2Rpc2Nvbm5l
Y3QocywgRU5FVFVOUkVBQ0gpOwo+ICAJCQkJcy0+YXgyNV9kZXYgPSBOVUxMOwo+ICsJCQkJYXgy
NV9kZXZfcHV0KGF4MjVfZGV2KTsKPiAgCQkJCWF4MjVfY2JfZGVsKHMpOwo+ICAJCQkJc3Bpbl9s
b2NrX2JoKCZheDI1X2xpc3RfbG9jayk7Cj4gIAkJCQlnb3RvIGFnYWluOwo+IEBAIC0xMDEsMTEg
KzEwMiw4IEBAIHN0YXRpYyB2b2lkIGF4MjVfa2lsbF9ieV9kZXZpY2Uoc3RydWN0IG5ldF9kZXZp
Y2UgKmRldikKPiAgCQkJbG9ja19zb2NrKHNrKTsKPiAgCQkJYXgyNV9kaXNjb25uZWN0KHMsIEVO
RVRVTlJFQUNIKTsKPiAgCQkJcy0+YXgyNV9kZXYgPSBOVUxMOwo+IC0JCQlpZiAoc2stPnNrX3Nv
Y2tldCkgewo+IC0JCQkJbmV0ZGV2X3B1dChheDI1X2Rldi0+ZGV2LAo+IC0JCQkJCSAgICZzLT5k
ZXZfdHJhY2tlcik7Cj4gLQkJCQlheDI1X2Rldl9wdXQoYXgyNV9kZXYpOwo+IC0JCQl9Cj4gKwkJ
CW5ldGRldl9wdXQoYXgyNV9kZXYtPmRldiwgJnMtPmRldl90cmFja2VyKTsKPiArCQkJYXgyNV9k
ZXZfcHV0KGF4MjVfZGV2KTsKCldlIHNob3VsZCBub3QgZGVjcmVhc2UgdGhlIHJlZmNvdW50IHdp
dGhvdXQgY2hlY2tpbmcgImlmIChzay0+c2tfc29ja2V0KSIsIGJlY2F1c2UgCnRoZXJlIGlzIGEg
cmFjZSBjb25kaXRpb24gYmV0d2VlbiBheDI1X2tpbGxfYnlfZGV2aWNlKCkgYW5kIGF4MjVfcmVs
ZWFzZSgpLCBpZiB3ZQpkZWNyZWFzZSB0aGUgcmVmY291bnQgaW4gYXgyNV9yZWxlYXNlKCksIHdl
IHNob3VsZCBub3QgZGVjcmVhc2UgaXQgaGVyZSwgb3RoZXJ3aXNlIAp0aGUgcmVmY291bnQgdW5k
ZXJmbG93IHdpbGwgaGFwcGVuLgoKQmVzdCByZWdhcmRzLApEdW9taW5nIFpob3UKCgo=

