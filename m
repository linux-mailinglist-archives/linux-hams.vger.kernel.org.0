Return-Path: <linux-hams+bounces-244-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECE78BDDBC
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 11:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A23A61F22729
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 09:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7E814D6E0;
	Tue,  7 May 2024 09:04:31 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1767314D2BB;
	Tue,  7 May 2024 09:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715072671; cv=none; b=dNy+JtYo6rsleloDPVVdG+VBDWpHQBspb1zQlaYb/NkgTwa1Rmx6aG7ASZxrBniVaN26o0PiV7nBAwAqqZUtUbjno1GKLHZpRGcKoe8Z3PQwjuGyMZ8PQb0dGq1pNBcqE/QCeoAfBPXUIKpOZu/18qplb3C9v0uCMhc0q4pH1To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715072671; c=relaxed/simple;
	bh=j2SvzrvJLCsy6kpAK+WmwwXSBx17F8WLHxiJ8YlMLuQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=UMrmm9+A1kVRMmWpR3EyFPE7VYR2d/zPOcBaBq01CwYt0kJRzgMqgHegy8chN04KLWwGkUM6rXj+v3OOTxzm2RgQ4kUmtTDHJcniMOZSL0tzMVkxzWkI1UVYcWCzurH8GQ5y7DIABT+hRRg8XAm0k5QFA4TTheOIr5br4tK42QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from duoming$zju.edu.cn ( [221.192.179.90] ) by
 ajax-webmail-mail-app3 (Coremail) ; Tue, 7 May 2024 17:04:05 +0800
 (GMT+08:00)
Date: Tue, 7 May 2024 17:04:05 +0800 (GMT+08:00)
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
Message-ID: <5f92dba3.4404.18f524bb7a6.Coremail.duoming@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cC_KCgBnMlqF7jlm2Fc3AA--.5839W
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwUOAWY4-AkVIgAAsV
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

T24gVHVlLCA3IE1heSAyMDI0IDExOjA4OjE0ICswMzAwIERhbiBDYXJwZW50ZXIgd3JvdGU6Cj4g
SSBoYXZlIHJldmlld2VkIHRoaXMgY29kZSBzb21lIG1vcmUuICBNeSB0aGVvcnkgaXM6Cj4gCj4g
YXgyNV9kZXZfZGV2aWNlX3VwKCkgPC0gc2V0cyByZWZjb3VudCB0byAxCj4gYXgyNV9kZXZfZGV2
aWNlX2Rvd24oKSA8LSBzZXQgcmVmY291bnQgdG8gMCBhbmQgZnJlZXMgaXQKPiAKPiBJZiB0aGUg
cmVmY291bnQgaXMgbm90IDEgYXQgYXgyNV9kZXZfZGV2aWNlX2Rvd24oKSB0aGVuIHNvbWV0aGlu
ZyBpcwo+IHNjcmV3ZWQgdXAuICBTbyB3aHkgZG8gd2UgZXZlbiBuZWVkIG1vcmUgcmVmY291bnRp
bmcgdGhhbiB0aGF0PyAgQnV0Cj4gYXBwYXJlbnRseSB3ZSBkby4gIEkgZG9uJ3QgcmVhbGx5IHVu
ZGVyc3RhbmQgbmV0d29ya2luZyB0aGF0IHdlbGwgc28KPiBtYXliZSB3ZSBjYW4gaGF2ZSBsaW5n
ZXJpbmcgY29ubmVjdGlvbnMgYWZ0ZXIgdGhlIGRldmljZSBpcyBkb3duLgoKV2UgZG8gbmVlZCBt
b3JlIHJlZmVyZW5jZSBjb3VudC4gQmVjYXVzZSB0aGVyZSBpcyBhIHJhY2UgY29uZGl0aW9uIApi
ZXR3ZWVuIGF4MjVfYmluZCgpIGFuZCB0aGUgY2xlYW51cCByb3V0aW5lLgoKVGhlIGNsZWFudXAg
cm91dGluZSBpcyBjb25zaXN0ZWQgb2YgdGhyZWUgcGFydHM6IGF4MjVfa2lsbF9ieV9kZXZpY2Uo
KSwKYXgyNV9ydF9kZXZpY2VfZG93bigpIGFuZCBheDI1X2Rldl9kZXZpY2VfZG93bigpLiBUaGUg
YXgyNV9raWxsX2J5X2RldmljZSgpCmlzIHVzZWQgdG8gY2xlYW51cCB0aGUgY29ubmVjdGlvbnMg
YW5kIHRoZSBheDI1X2Rldl9kZXZpY2VfZG93bigpIGlzIHVzZWQKdG8gY2xlYW51cCB0aGUgZGV2
aWNlLiBJZiB3ZSBjYWxsIGF4MjVfYmluZCgpIGFuZCBheDI1X2Nvbm5lY3QoKSBiZXR3ZWVuCnRo
ZSB3aW5kb3cgb2YgYXgyNV9raWxsX2J5X2RldmljZSgpIGFuZCBheDI1X2Rldl9kZXZpY2VfZG93
bigpLCB0aGUgYXgyNV9kZXYKaXMgZnJlZWQgaW4gYXgyNV9kZXZfZGV2aWNlX2Rvd24oKS4gV2hl
biB3ZSBjYWxsIGF4MjVfcmVsZWFzZSgpIHRvIHJlbGVhc2UKdGhlIGNvbm5lY3Rpb25zLCB0aGUg
VUFGIGJ1Z3Mgd2lsbCBoYXBwZW4uIAoKQmVzdCByZWdhcmRzLApEdW9taW5nIFpob3U=

