Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B256536401
	for <lists+linux-hams@lfdr.de>; Fri, 27 May 2022 16:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235427AbiE0OXg (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 27 May 2022 10:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233574AbiE0OXg (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 27 May 2022 10:23:36 -0400
Received: from azure-sdnproxy-2.icoremail.net (azure-sdnproxy.icoremail.net [52.175.55.52])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 71D2FED714
        for <linux-hams@vger.kernel.org>; Fri, 27 May 2022 07:23:32 -0700 (PDT)
Received: by ajax-webmail-mail-app2 (Coremail) ; Fri, 27 May 2022 22:23:12
 +0800 (GMT+08:00)
X-Originating-IP: [106.117.80.109]
Date:   Fri, 27 May 2022 22:23:12 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   duoming@zju.edu.cn
To:     "Thomas Osterried" <thomas@osterried.de>
Cc:     "David S. Miller" <davem@davemloft.net>,
        "Jakub Kicinski" <kuba@kernel.org>,
        "Paolo Abeni" <pabeni@redhat.com>, linux-hams@vger.kernel.org
Subject: Re: [PATCH net] ax25: Fix ax25 session cleanup problem in
 ax25_release
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn zju.edu.cn
In-Reply-To: <0213B378-9CFF-456E-814E-B27A132CF8F3@osterried.de>
References: <20220525112850.102363-1-duoming@zju.edu.cn>
 <YpCHtRoxEXU7UAji@x-berg.in-berlin.de>
 <0213B378-9CFF-456E-814E-B27A132CF8F3@osterried.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <59bfaaa3.3a392.18105e65f66.Coremail.duoming@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: by_KCgD3S0DR3pBijPDpAA--.22218W
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAgYDAVZdtZ6taAABsi
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

SGVsbG8sCgpPbiBGcmksIDI3IE1heSAyMDIyIDEzOjI5OjMwICswMjAwIFRob21hcyB3cm90ZToK
Cj4gPiBJIFRlc3RlZCBzZXZlcmFsIGNhc2VzOiB0aGlzIHBhdGNoIHdvcmtzIGFzIGV4cGVjdGVk
Lgo+IAo+IFVuZm9ydHVuYXRlbHksIHRoZXJlJ3MgYW4gb3RoZXIgY2FzZSB3aGVyZSBzZXNzaW9u
cyBhcmUgbm90IGNsZWFuZWQgdXA6Cj4gCj4gUmVtb3RlIHNpdGUgY29ubmVjdHM6Cj4gYnBxMDog
Zm0gREw5U0FVLTE1IHRvIERMOVNBVS0xIGN0bCBTQUJNKyAxMjo1NjozMC42MjQ4NDUgCj4gYnBx
MDogZm0gREw5U0FVLTEgdG8gREw5U0FVLTE1IGN0bCBVQS0gMTI6NTY6MzAuNjI2MDAwIAo+IAo+
IAo+IEF0IERMOVNBVS0xOgo+IAo+ICMgbmV0c3RhdCAtLWF4MjUKPiBBY3RpdmUgQVguMjUgc29j
a2V0cwo+IERlc3QgICAgICAgU291cmNlICAgICBEZXZpY2UgIFN0YXRlICAgICAgICBWci9WcyAg
ICBTZW5kLVEgIFJlY3YtUQo+IERMOVNBVS0xNSAgREw5U0FVLTEgICBicHEwICAgIEVTVEFCTElT
SEVEICAwMDAvMDAwICAwICAgICAgIDAgICAgIAo+IAo+ICMgaWZjb25maWcgYnBxMCBkb3duCj4g
IyBuZXRzdGF0IC0tYXgyNQo+IEFjdGl2ZSBBWC4yNSBzb2NrZXRzCj4gRGVzdCAgICAgICBTb3Vy
Y2UgICAgIERldmljZSAgU3RhdGUgICAgICAgIFZyL1ZzICAgIFNlbmQtUSAgUmVjdi1RCj4gREw5
U0FVLTE1ICBETDlTQVUtMSAgID8/PyAgICAgTElTVEVOSU5HICAgIDAwMC8wMDAgIDAgICAgICAg
MCAgICAgCj4gIyAKPiAKPiBXYWl0ZWQgc29tZSB0aW1lLiBObyBjaGFuZ2UuCj4gCj4gIyBybW1v
ZCBicHFldGhlcgo+ICMgbmV0c3RhdCAtLWF4MjUKPiBBY3RpdmUgQVguMjUgc29ja2V0cwo+IERl
c3QgICAgICAgU291cmNlICAgICBEZXZpY2UgIFN0YXRlICAgICAgICBWci9WcyAgICBTZW5kLVEg
IFJlY3YtUQo+IERMOVNBVS0xNSAgREw5U0FVLTEgICA/Pz8gICAgIExJU1RFTklORyAgICAwMDAv
MDAwICAwICAgICAgIDAgICAKPiAKPiAKPiBUaGlzIGlzIHRoZSBjb25kaXRpb246Cj4gYXgyNV9r
aWxsX2J5X2RldmljZSgpCj4gICAuLi4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmICgh
c2spIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrX2JoKCZh
eDI1X2xpc3RfbG9jayk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBheDI1X2Rp
c2Nvbm5lY3QocywgRU5FVFVOUkVBQ0gpOwo+IAkJCQlzLT5heDI1X2RldiA9IE5VTEw7Cj4gICAu
Li4KPiAKPiA9PiBheDI1X2Rpc2Nvbm5lY3QoKToKPiAgICAgICAgIGlmIChyZWFzb24gPT0gRU5F
VFVOUkVBQ0gpIHsKPiAgICAgICAgICAgICAgICAgZGVsX3RpbWVyX3N5bmMoJmF4MjUtPnRpbWVy
KTsKPiAKPiAKPiAKPiAtPiBOb3RoaW5nIGNsZWFucyB0aGUgYXgyNV9jYiB1cC4KPiBheDI1X3Jl
bGVhc2UoKSBpcyBub3QgcGFydCBvZiB0aGF0IGtpbmQgb2Ygc2Vzc2lvbnMuCj4gYXgyNV9kaXNj
b25lY3QoKSBzdG9wcGVkIHRpbWVycy4KPiAKPiAKPiBJZiB5b3UgYWdyZWUsIHRoYXQgbm8gY29u
Y3VycmVudCBwcm9jZXNzIGlzIGFibGUgdG8gcmUtdXNlIHRoaXMgYXgyNV9jYiwKPiBhbmQgYmVj
YXVzZSBhbGwgdGltZXJzIGFyZSBzdG9wcGVlZCwgdGhlIGNsZWFudXAgd2l0aCAgYXgyNV9jYl9k
ZWwocyk7Cj4gc2hvdWxkIGJlIHNhZmUuCgpJIGFncmVlLCB0aGUgYXgyNV9jYiBjb3VsZCBub3Qg
YmUgcmUtdXNlZC4KCj4gTXkgc3VjY2Vzc2Z1bGwgdGVzdCB3YXMgdGhpczoKPiAKPiBkaWZmIC0t
Z2l0IGEvbmV0L2F4MjUvYWZfYXgyNS5jIGIvbmV0L2F4MjUvYWZfYXgyNS5jCj4gaW5kZXggMzYz
ZDQ3Zjk0NTMyLi5kZTQxN2I5NzRjMDcgMTAwNjQ0Cj4gLS0tIGEvbmV0L2F4MjUvYWZfYXgyNS5j
Cj4gKysrIGIvbmV0L2F4MjUvYWZfYXgyNS5jCj4gQEAgLTkxLDYgKzkyLDcgQEAgc3RhdGljIHZv
aWQgYXgyNV9raWxsX2J5X2RldmljZShzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3Bpbl91bmxvY2tfYmgoJmF4MjVfbGlzdF9sb2NrKTsK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGF4MjVfZGlzY29ubmVjdChzLCBFTkVU
VU5SRUFDSCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzLT5heDI1X2RldiA9
IE5VTEw7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBheDI1X2NiX2RlbChzKTsK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNwaW5fbG9ja19iaCgmYXgyNV9saXN0
X2xvY2spOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBhZ2FpbjsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICB9Cj4gCgpJIGFncmVlLCBidXQgd2Ugc2hvdWxkIGFsc28g
YWRkIGF4MjVfY2JfZGVsKHMpIGluIHRoZSBmb2xsb3dpbmcgcGxhY2U6CgpAQCAtMTA0LDYgKzEw
Niw3IEBAIHN0YXRpYyB2b2lkIGF4MjVfa2lsbF9ieV9kZXZpY2Uoc3RydWN0IG5ldF9kZXZpY2Ug
KmRldikKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBheDI1X2Rldl9wdXQoYXgyNV9k
ZXYpOwogICAgICAgICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICAgICAgICAgIHJl
bGVhc2Vfc29jayhzayk7CisgICAgICAgICAgICAgICAgICAgICAgIGF4MjVfY2JfZGVsKHMpOwog
ICAgICAgICAgICAgICAgICAgICAgICBzcGluX2xvY2tfYmgoJmF4MjVfbGlzdF9sb2NrKTsKICAg
ICAgICAgICAgICAgICAgICAgICAgc29ja19wdXQoc2spOwogICAgICAgICAgICAgICAgICAgICAg
ICAvKiBUaGUgZW50cnkgY291bGQgaGF2ZSBiZWVuIGRlbGV0ZWQgZnJvbSB0aGUKCkJlc3QgcmVn
YXJkcywKRHVvbWluZyBaaG91Cg==
