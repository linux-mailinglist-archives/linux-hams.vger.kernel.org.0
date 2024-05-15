Return-Path: <linux-hams+bounces-273-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A81FE8C6453
	for <lists+linux-hams@lfdr.de>; Wed, 15 May 2024 11:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB413B22F99
	for <lists+linux-hams@lfdr.de>; Wed, 15 May 2024 09:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882665A788;
	Wed, 15 May 2024 09:52:58 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38074EB45;
	Wed, 15 May 2024 09:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715766778; cv=none; b=IxBRZkiMcQFijI2xHmVGdHqMKmElC+RaY8AKpyteR1JbymmUiXgFuGsWOv44kx+NJ5muC7hE36CDWKGFwnmFPb9bNc98SbWImsj7KlIHObbo+5OMhZ3tswi+7GPyKATCQ7H3m29r4bzeiMjg8CqoHunFVP5Lszs9s3RYYQeFVyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715766778; c=relaxed/simple;
	bh=OCHKhs8Cm8aoHBT0E1a8uUJBNZF8AziQdz9PQz0Ura8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=nTcraJOPCvxU5OGqdengg/RZgZBL5+ZTYLyozoScsewapdfSE5bV2FcXHft2Gkm+TnF7hUL7q/sPLviw2tJU+OvY6z7G9b2iCHGp6MuyVFaBEJgs2E0aZPrz7zhzfl5k3EeiAVt7Gx8qsDp2q2WX/W5NC7czeJd4xj2joaXYEFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from duoming$zju.edu.cn ( [221.192.180.251] ) by
 ajax-webmail-mail-app3 (Coremail) ; Wed, 15 May 2024 17:52:25 +0800
 (GMT+08:00)
Date: Wed, 15 May 2024 17:52:25 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: duoming@zju.edu.cn
To: "Lars Kellogg-Stedman" <lars@oddbit.com>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org,
	edumazet@google.com, davem@davemloft.net, jreuter@yaina.de,
	dan.carpenter@linaro.org
Subject: Re: [PATCH net] ax25: Fix refcount leak issues of ax25_dev
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT5 build
 20231205(37e20f0e) Copyright (c) 2002-2024 www.mailtech.cn zju.edu.cn
In-Reply-To: <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cC_KCgDnPlXahURmYOeTAA--.14308W
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwUCAWZDiAoNowA6s2
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

T24gV2VkLCAxIE1heSAyMDI0IDIxOjI5OjE2IC0wNDAwIExhcnMgS2VsbG9nZy1TdGVkbWFuIHdy
b3RlOgo+IEFzc3VtZSB3ZSBoYXZlIHRoZSBmb2xsb3dpbmcgdHdvIGludGVyZmFjZXMgY29uZmln
dXJlZCBvbiBhIHN5c3RlbToKPiAKPiAgICAgJCBjYXQgL2V0Yy9heDI1L2F4cG9ydHMKPiAgICAg
dWRwMCB0ZXN0MC0wIDk2MDAgMjU1IDIgYXh1ZHAwCj4gICAgIHVkcDEgdGVzdDAtMSA5NjAwIDI1
NSAyIGF4dWRwMQo+IAo+IEFuZCB3ZSBoYXZlIGF4MjVkIGxpc3RlbmluZyBvbiBib3RoIGludGVy
ZmFjZXM6Cj4gCj4gICAgIFt1ZHAwXQo+ICAgICBkZWZhdWx0ICAqICogKiAqICogKiAgLSByb290
ICAvdXNyL3NiaW4vYXh3cmFwcGVyIGF4d3JhcHBlciAtLSAvYmluL3NoIHNoIC9ldGMvYXgyNS9l
eGFtcGxlLW91dHB1dC5zaAo+ICAgICBbdWRwMV0KPiAgICAgZGVmYXVsdCAgKiAqICogKiAqICog
IC0gcm9vdCAgL3Vzci9zYmluL2F4d3JhcHBlciBheHdyYXBwZXIgLS0gL2Jpbi9zaCBzaCAvZXRj
L2F4MjUvZXhhbXBsZS1vdXRwdXQuc2gKPiAKPiBVc2luZyB0aGUgJ2F4LWRldnMnIGFuZCAnYXgt
c29ja2V0cycgZ2RiIGNvbW1hbmRzIHNob3duIGF0IHRoZSBlbmQgb2YKPiB0aGlzIG1lc3NhZ2Us
IHdlIHN0YXJ0IHdpdGg6Cj4gCj4gICAgIChnZGIpIGF4LWRldnMKPiAgICAgYXgxIGF4X3JlZmNu
dDoyIGRldl9yZWZjbnQ6OSBkZXZfdW50cmFja2VkOjEgZGV2X25vdHJhY2s6MQo+ICAgICBheDAg
YXhfcmVmY250OjIgZGV2X3JlZmNudDo5IGRldl91bnRyYWNrZWQ6MSBkZXZfbm90cmFjazoxCj4g
ICAgIChnZGIpIGF4LXNvY2tldHMKPiAgICAgMHhmZmZmODg4MTAwMmI2ODAwIGlmOmF4MSBzdGF0
ZTowIHJlZmNudDoyIGRldl90cmFja2VyOjB4ZmZmZjg4ODEwMGRlZDIwMAo+ICAgICAweGZmZmY4
ODgxMDFhYzRlMDAgaWY6YXgwIHN0YXRlOjAgcmVmY250OjIgZGV2X3RyYWNrZXI6MHhmZmZmODg4
MTAwZGVjNGMwCj4gCj4gV2UgaW5pdGlhdGUgYSBjb25uZWN0aW9uIGZyb20gYXgwIHRvIGF4MToK
PiAKPiAgICAgY2FsbCAtciB1ZHAwIHRlc3QwLTEKPiAKPiBXaGVuIHdlIGZpcnN0IGVudGVyIGF4
MjVfcmN2LCB3ZSBoYXZlOgo+IAo+ICAgICAoZ2RiKSBheC1kZXZzCj4gICAgIGF4MSBheF9yZWZj
bnQ6MiBkZXZfcmVmY250OjkgZGV2X3VudHJhY2tlZDoxIGRldl9ub3RyYWNrOjEKPiAgICAgYXgw
IGF4X3JlZmNudDozIGRldl9yZWZjbnQ6MTAgZGV2X3VudHJhY2tlZDoxIGRldl9ub3RyYWNrOjEK
PiAgICAgKGdkYikgYXgtc29ja2V0cwo+ICAgICAweGZmZmY4ODgxMDFhYzgwMDAgaWY6YXgwIHN0
YXRlOjEgcmVmY250OjIgZGV2X3RyYWNrZXI6MHhmZmZmODg4MTAwZGVkYjgwCj4gICAgIDB4ZmZm
Zjg4ODEwMDJiNjgwMCBpZjpheDEgc3RhdGU6MCByZWZjbnQ6MiBkZXZfdHJhY2tlcjoweGZmZmY4
ODgxMDBkZWQyMDAKPiAgICAgMHhmZmZmODg4MTAxYWM0ZTAwIGlmOmF4MCBzdGF0ZTowIHJlZmNu
dDoyIGRldl90cmFja2VyOjB4ZmZmZjg4ODEwMGRlYzRjMAo+IAo+IEFmdGVyIHdlIHJlYWNoIGxp
bmUgNDEzIChpbiBuZXQvYXgyNS9heDI1X2luLmMpIGFuZCBhZGQgYSBuZXcgY29udHJvbAo+IGJs
b2NrOgo+IAo+ICAgICBheDI1X2NiX2FkZChheDI1KQo+IAo+IFdlIGhhdmU6Cj4gCj4gICAgIChn
ZGIpIGF4LWRldnMKPiAgICAgYXgxIGF4X3JlZmNudDoyIGRldl9yZWZjbnQ6OSBkZXZfdW50cmFj
a2VkOjEgZGV2X25vdHJhY2s6MQo+ICAgICBheDAgYXhfcmVmY250OjMgZGV2X3JlZmNudDoxMCBk
ZXZfdW50cmFja2VkOjEgZGV2X25vdHJhY2s6MQo+ICAgICAoZ2RiKSBheC1zb2NrZXRzCj4gICAg
IDB4ZmZmZjg4ODEwMjQ1YWMwMCBpZjpheDEgc3RhdGU6MyByZWZjbnQ6MiBkZXZfdHJhY2tlcjow
eDAgPGZpeGVkX3BlcmNwdV9kYXRhPgo+ICAgICAweGZmZmY4ODgxMDI0NWJhMDAgaWY6YXgwIHN0
YXRlOjEgcmVmY250OjIgZGV2X3RyYWNrZXI6MHhmZmZmODg4MTAxMzZjODAwCj4gICAgIDB4ZmZm
Zjg4ODEwMGM3OWUwMCBpZjpheDEgc3RhdGU6MCByZWZjbnQ6MiBkZXZfdHJhY2tlcjoweGZmZmY4
ODgxMDEzNmM2ZTAKPiAgICAgMHhmZmZmODg4MTAxOGU5ODAwIGlmOmF4MCBzdGF0ZTowIHJlZmNu
dDoyIGRldl90cmFja2VyOjB4ZmZmZjg4ODEwMTcwYzg2MAo+IAo+IE5vdGUgdGhhdCAoYSkgYXgy
NS0+ZGV2X3RyYWNrZXIgaXMgTlVMTCwgYW5kIChiKSB3ZSBoYXZlIGluY3JlbWV0ZWQgdGhlCj4g
cmVmY291bnQgb24gYXgwICh0aGUgc291cmNlIGludGVyZmFjZSksIGJ1dCBub3Qgb24gYXgxICh0
aGUgZGVzdGluYXRpb24KPiBpbnRlcmZhY2UpLiBXaGVuIHdlIGNhbGwgYXgyNV9yZWxlYXNlIGZv
ciB0aGlzIGNvbnRyb2wgYmxvY2ssIHdlIGdldCB0bzoKPiAKPiAgICAgbmV0ZGV2X3B1dChheDI1
X2Rldi0+ZGV2LCAmYXgyNS0+ZGV2X3RyYWNrZXIpOwo+ICAgICBheDI1X2Rldl9wdXQoYXgyNV9k
ZXYpOwo+IAo+IFdpdGg6Cj4gCj4gICAgIChnZGIpIGF4LWRldnMKPiAgICAgYXgxIGF4X3JlZmNu
dDoyIGRldl9yZWZjbnQ6OSBkZXZfdW50cmFja2VkOjEgZGV2X25vdHJhY2s6MQo+ICAgICBheDAg
YXhfcmVmY250OjMgZGV2X3JlZmNudDoxMCBkZXZfdW50cmFja2VkOjEgZGV2X25vdHJhY2s6MQo+
IAo+IEFmdGVyIHRoZSBjYWxscyB0byBuZXRkZXZfcHV0KCkgYW5kIGF4MjVfZGV2X3B1dCgpLCB3
ZSBoYXZlOgo+IAo+ICAgICAoZ2RiKSBheC1kZXZzCj4gICAgIGF4MSBheF9yZWZjbnQ6MSBkZXZf
cmVmY250OjggZGV2X3VudHJhY2tlZDotMTA3Mzc0MTgyNCBkZXZfbm90cmFjazoxCj4gICAgIGF4
MCBheF9yZWZjbnQ6MiBkZXZfcmVmY250OjkgZGV2X3VudHJhY2tlZDoxIGRldl9ub3RyYWNrOjEK
PiAKPiBZb3UgY2FuIHNlZSB0aGF0IChhKSBheDI1X2Rldi0+ZGV2LT5yZWZjbnRfdHJhY2tlci0+
dW50cmFja2VkIGlzIG5vdwo+IGludmFsaWQsIGFuZCBheDI1X2Rldi0+ZGV2LT5kZXZfcmVmY250
IGlzIGluIHRyb3VibGU6IGl0IGRlY3JlbWVudHMgYnkKPiBvbmUgZm9yIGVhY2ggY2xvc2VkIGNv
bm5lY3Rpb24sIGV2ZW4gdGhvdWdoIGl0IHdhcyBuZXZlciBpbmNyZW1lbnRlZAo+IHdoZW4gd2Ug
YWNjZXB0ZWQgdGhlIGNvbm5lY3Rpb24uIFRoZSB1bmRlcmZsb3cgaW4KPiAuLi5yZWZjbnRfdHJh
Y2tlci0+dW50cmFja2VkIHlpZWxkcyB0aGUgdHJhY2ViYWNrIHdpdGg6Cj4gCj4gICAgIHJlZmNv
dW50X3Q6IGRlY3JlbWVudCBoaXQgMDsgbGVha2luZyBtZW1vcnkuCj4gCj4gQWRkaXRpb25hbCBj
b25uZWN0aW9ucyB3aWxsIGV2ZW50dWFsbHkgdHJpZ2dlciBtb3JlIHByb2JsZW1zOyB3ZSB3aWxs
Cj4gdWx0aW1hdGVseSB1bmRlcmZsb3cgYXgyNV9kZXYtPmRldi0+ZGV2X3JlZmNudCwgYnV0IHdl
IG1heSBhbHNvIHJ1biBpbnRvCj4gbWVtb3J5IGNvcnJ1cHRpb24gYmVjYXVzZSBvZiB0aGUgaW52
YWxpZCB0cmFja2VyIGRhdGEsIHJlc3VsdGluZyBpbjoKPiAKPiAgICAgQlVHOiB1bmFibGUgdG8g
aGFuZGxlIHBhZ2UgZmF1bHQgZm9yIGFkZHJlc3M6IDAwMDAwMDEwMDAwMDAzYjAKCkRvIHlvdSBr
bm93IGhvdyB0byB0cmlnZ2VyIHRoaXMgYnVnPyBDb3VsZCB5b3Ugc2hhcmUgdGhlIFBPQz8KCkJl
c3QgcmVnYXJkcywKRHVvbWluZyBaaG91Cg==

