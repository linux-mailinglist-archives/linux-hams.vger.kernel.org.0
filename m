Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E36C536D1D
	for <lists+linux-hams@lfdr.de>; Sat, 28 May 2022 15:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235834AbiE1N3l (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sat, 28 May 2022 09:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235899AbiE1N3l (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sat, 28 May 2022 09:29:41 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id EF4ED1A80A
        for <linux-hams@vger.kernel.org>; Sat, 28 May 2022 06:29:37 -0700 (PDT)
Received: by ajax-webmail-mail-app3 (Coremail) ; Sat, 28 May 2022 21:29:20
 +0800 (GMT+08:00)
X-Originating-IP: [106.117.80.109]
Date:   Sat, 28 May 2022 21:29:20 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   duoming@zju.edu.cn
To:     "Jakub Kicinski" <kuba@kernel.org>
Cc:     "Thomas Osterried" <thomas@osterried.de>,
        "David S. Miller" <davem@davemloft.net>,
        "Paolo Abeni" <pabeni@redhat.com>, linux-hams@vger.kernel.org
Subject: Re: [PATCH net] ax25: Fix ax25 session cleanup problem in
 ax25_release
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn zju.edu.cn
In-Reply-To: <20220527173312.71122dbe@kernel.org>
References: <20220525112850.102363-1-duoming@zju.edu.cn>
 <YpCHtRoxEXU7UAji@x-berg.in-berlin.de>
 <0213B378-9CFF-456E-814E-B27A132CF8F3@osterried.de>
 <20220527173312.71122dbe@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <20a99b3a.3a4c0.1810adb6a1a.Coremail.duoming@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgDni7ixI5JicYoaAQ--.25384W
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAgkEAVZdtZ7uGQABsY
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

SGVsbG8sCgpPbiBGcmksIDI3IE1heSAyMDIyIDEzOjI5OjMwICswMjAwIFRob21hcyBPc3RlcnJp
ZWQgd3JvdGU6Cgo+ID4gPiBJIFRlc3RlZCBzZXZlcmFsIGNhc2VzOiB0aGlzIHBhdGNoIHdvcmtz
IGFzIGV4cGVjdGVkLiAgCj4gPiBJZiB5b3UgYWdyZWUsIHRoYXQgbm8gY29uY3VycmVudCBwcm9j
ZXNzIGlzIGFibGUgdG8gcmUtdXNlIHRoaXMgYXgyNV9jYiwKPiA+IGFuZCBiZWNhdXNlIGFsbCB0
aW1lcnMgYXJlIHN0b3BwZWVkLCB0aGUgY2xlYW51cCB3aXRoICBheDI1X2NiX2RlbChzKTsKPiA+
IHNob3VsZCBiZSBzYWZlLgo+ID4gCj4gPiAKPiA+IE15IHN1Y2Nlc3NmdWxsIHRlc3Qgd2FzIHRo
aXM6Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9uZXQvYXgyNS9hZl9heDI1LmMgYi9uZXQvYXgyNS9h
Zl9heDI1LmMKPiA+IGluZGV4IDM2M2Q0N2Y5NDUzMi4uZGU0MTdiOTc0YzA3IDEwMDY0NAo+ID4g
LS0tIGEvbmV0L2F4MjUvYWZfYXgyNS5jCj4gPiArKysgYi9uZXQvYXgyNS9hZl9heDI1LmMKPiA+
IEBAIC05MSw2ICs5Miw3IEBAIHN0YXRpYyB2b2lkIGF4MjVfa2lsbF9ieV9kZXZpY2Uoc3RydWN0
IG5ldF9kZXZpY2UgKmRldikKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Bp
bl91bmxvY2tfYmgoJmF4MjVfbGlzdF9sb2NrKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYXgyNV9kaXNjb25uZWN0KHMsIEVORVRVTlJFQUNIKTsKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcy0+YXgyNV9kZXYgPSBOVUxMOwo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBheDI1X2NiX2RlbChzKTsKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3Bpbl9sb2NrX2JoKCZheDI1X2xpc3RfbG9jayk7Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gYWdhaW47Cj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICB9CgpUaGUgYWJvdmUgY29kZSBhbHNvIGV4aXN0cyBhIHJhY2UgY29uZGl0aW9uOgoK
ICAgICAgKFRocmVhZCAxKSAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgKFRocmVhZCAyKQph
eDI1X2tpbGxfYnlfZGV2aWNlKCkgICAgICAgICAgICAgICAgIHwgYXgyNV9yY3YoKQogIC4uLiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAuLi4KICBpZiAoIXNrKSB7ICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgICAKICAgIGF4MjVfY2JfZGVsKCkgICAgICAgICAgICAg
ICAgICAgICB8ICAgYXgyNV9kZXN0cm95X3NvY2tldCgpCiAgICAgIGlmICghaGxpc3RfdW5oYXNo
ZWQoLi4pKSAgICAgICAgfCAgICAgYXgyNV9jYl9kZWwoKQogICAgICAgIC4uLiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgICAgaWYgKCFobGlzdF91bmhhc2hlZCguLikpCiAgICAgICAg
aGxpc3RfZGVsX2luaXQoKSAgICAgICAgICAgICAgfCAgICAgIAogICAgICAgIGF4MjVfY2JfcHV0
KGF4MjUpICAgICAgICAgICAgIHwgICAgICAgICAuLi4KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgICAgICAgYXgyNV9jYl9wdXQoYXgyNSkKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgLi4uCgpJZiB3ZSB1c2UgYXgyNV9jYl9k
ZWwoKSB0byBkZWxldGUgYXgyNSBub2RlIGZyb20gdGhlIGhsaXN0LCB0aGUgYXgyNV9jYl9wdXQo
KSBzaG91bGQgb25seSBiZQpjYWxsZWQgb25jZS4gQnV0IHRoZSBhYm92ZSBwaWN0dXJlIHNob3dz
IHRoYXQgYXgyNV9jYl9wdXQoKSBpcyBjYWxsZWQgdHdpY2UgYW5kIHRoZSByZWZjb3VudApvZiB0
aGUgc2FtZSBheDI1X2NiIGlzIGRlY3JlYXNlZCB0d2ljZS4gQXMgYSByZXN1bHQsIGl0IHdpbGwg
Y2F1c2UgInJlZmNvdW50X3Q6IHVuZGVyZmxvdyIuCgpUaGUgZm9sbG93aW5nIGlzIGEgc29sdXRp
b24gdGhhdCBoYXMgYmVlbiB0ZXN0ZWQuCgpAQCAtNjIsMTIgKzYyLDEyIEBAIHN0YXRpYyB2b2lk
IGF4MjVfZnJlZV9zb2NrKHN0cnVjdCBzb2NrICpzaykKICAqLwogc3RhdGljIHZvaWQgYXgyNV9j
Yl9kZWwoYXgyNV9jYiAqYXgyNSkKIHsKKyAgICAgICBzcGluX2xvY2tfYmgoJmF4MjVfbGlzdF9s
b2NrKTsKICAgICAgICBpZiAoIWhsaXN0X3VuaGFzaGVkKCZheDI1LT5heDI1X25vZGUpKSB7Ci0g
ICAgICAgICAgICAgICBzcGluX2xvY2tfYmgoJmF4MjVfbGlzdF9sb2NrKTsKICAgICAgICAgICAg
ICAgIGhsaXN0X2RlbF9pbml0KCZheDI1LT5heDI1X25vZGUpOwotICAgICAgICAgICAgICAgc3Bp
bl91bmxvY2tfYmgoJmF4MjVfbGlzdF9sb2NrKTsKICAgICAgICAgICAgICAgIGF4MjVfY2JfcHV0
KGF4MjUpOwogICAgICAgIH0KKyAgICAgICBzcGluX3VubG9ja19iaCgmYXgyNV9saXN0X2xvY2sp
OwogfQoKQmVzdCByZWdhcmRzLApEdW9taW5nIFpob3UK
