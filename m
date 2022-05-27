Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAC2535892
	for <lists+linux-hams@lfdr.de>; Fri, 27 May 2022 06:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242321AbiE0Esf (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 27 May 2022 00:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231515AbiE0Esf (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 27 May 2022 00:48:35 -0400
Received: from azure-sdnproxy-2.icoremail.net (azure-sdnproxy.icoremail.net [52.175.55.52])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 5ECCA45ACD
        for <linux-hams@vger.kernel.org>; Thu, 26 May 2022 21:48:31 -0700 (PDT)
Received: by ajax-webmail-mail-app2 (Coremail) ; Fri, 27 May 2022 12:48:19
 +0800 (GMT+08:00)
X-Originating-IP: [106.117.80.109]
Date:   Fri, 27 May 2022 12:48:19 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   duoming@zju.edu.cn
To:     "Thomas Osterried" <thomas@osterried.de>
Cc:     "Dan Carpenter" <dan.carpenter@oracle.com>,
        linux-hams@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        "Paolo Abeni" <pabeni@redhat.com>
Subject: Re: Regression in "ax25: Fix UAF bugs in ax25 timers", patch
 82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn zju.edu.cn
In-Reply-To: <CE99195A-25DD-4715-BABF-A83B2E572635@osterried.de>
References: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
 <20220523135214.GE4009@kadam>
 <B0C9F5C5-898E-4682-8B32-9802E1605A9E@osterried.de>
 <56fec66b.2f2d0.180f5ae1971.Coremail.duoming@zju.edu.cn>
 <FF735FC8-5566-4E32-ACD4-7F9BC278B53F@osterried.de>
 <19ff1cc8.2f102.180f910a87a.Coremail.duoming@zju.edu.cn>
 <CE99195A-25DD-4715-BABF-A83B2E572635@osterried.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <52d4c593.3891f.18103d80b22.Coremail.duoming@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: by_KCgBXX4sTWJBi5q3hAA--.13508W
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAgUDAVZdtZ5+XAAAsH
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWDJw
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

CkhlbGxvLAoKT24gRnJpLCAyNyBNYXkgMjAyMiAwMDo1NjozNyArMDIwMCB0aG9tYXMgd3JvdGU6
Cgo+IEknbSBub3Qgc28gaGFwcHkgd2l0aCBhZGRpbmcgbmV3IHN0YXRlcyB0byB0aGUgYXgyNV9k
ZXYgc3RydWN0Lgo+IFdoZW4gSSBhc2tlZCAiSWYgd2UgbGlrZSB0byBkZWxldGUgdGhlIHRpbWVy
cyBoZXJlIGJlY2F1c2Ugd2UgYXJlIGluIGF4MjVfcmVsZWFzZSBkdWUKPiAgIHRvIHRoZSBheDI1
X2tpbGxfYnlfZGV2aWNlL2F4MjVfZGV2X2RldmljZV9kb3duIGV2ZW50LCBkbyB3ZSBoYXZlIGFu
b3RoZXIgb3B0aW9uIHRvCj4gICBzZWUgd2hhdCBjYWxsZWQgdXMsIGFuZCBmb3IgYmVpbmcgYWJs
ZSB0byBoYW5kbGUgdGhlIGNhc2UgY29ycmVjdGx5PyIsCj4gSSBoYWQgaW4gbWluZCBpZiB3ZSBj
b3VsZCBzZWUgdGhpcyBzaXR1YXRpb24gaW4gdGhlIGN1cnJlbnQgc3RhdGUgaW5zaWRlCj4gdGhl
IGF4MjVfY2IsIGxpa2UgYXgyNS0+c3RhdGUgb3IgYXgyNS0+c2stPi4uCj4gCj4gQnV0IGluIGNh
c2Ugb2YgYXgyNS0+c3RhdGUsIGF4MjVfY29ubmVjdCgpIGNoYW5nZXMgdGhlIHN0YXRlIHdoZW4g
ZXhlY3V0ZWQgaW4KPiBhIHBhcmFsbGVsIHRocmVhZCBhZnRlciBheDI1X2tpbGxfYnlfZGV2aWNl
KCkgLT4gdGhhdCdzIG5vIG9wdGlvbgoKVGhlICJheDI1LT5zdGF0ZSIgb3IgImF4MjUtPnNrLT4u
LiIgaW5zaWRlIGF4MjVfY2IgY291bGQgbm90IGJlIHVzZWQsIGJlY2F1c2UgdGhlc2UgZmxhZ3Mg
Y291bGQKYmUgY2hhbmdlZCBpbiBtYW55IHBsYWNlcyBzdWNoIGFzIGF4MjVfZGVzdHJveV9zb2Nr
ZXQoKSwgYXgyNV9jcmVhdGVfY2IoKSBvciBheDI1X2Rpc2Nvbm5lY3QoKS4KV2UgbmVlZCBhIGZs
YWcgdGhhdCBvbmx5IHJlcHJlc2VudHMgdGhlIGF4MjVfa2lsbF9ieV9kZXZpY2UoKSBoYXMgYmVl
biBleGVjdXRlZC4KCj4gQW5vdGhlciBvbmUgSSB0aG91Z2h0IGFib3V0IHdhcyBhbiBhc3N1cmFu
Y2UgaW4gYXgyNV9zdGFydF94eHhfdGltZXIoKSBmdW5jdGlvbnMsCj4gdGhhdCB0aW1lciBzaG91
bGQgbm90IHN0YXJ0IGlmIGF4MjVfY2ItPmF4MjVfZGV2ID09IE5VTEwsCj4gYnV0IHlvdXIgZXhh
bXBsZXMgc2hvd2VkLCB0aGF0Cj4gICBtb2RfdGltZXIoJmF4MjUtPnQxdGltZXIsLi4pCj4gaXMg
YWxzbyB1c2VkIGRpcmVjdGx5IHRvIG1vZGlmeSBydW5uaW5nIHRpbWVyLgo+IAo+IAo+IEFuIG90
aGVyIG9wdGlvbiBtYXkgYmUgYXNzdXJhbmNlcyBpbiBheDI1X3h4eF9leHBpcnkoKSB0byBpbW1l
ZGlhdGVseSByZXR1cm4gaWYKPiBheDI1X2NiLT5heDI1X2RldiA9PSBOVUxMLgo+IAo+IEluZGVl
ZCwgSSBzZWUgaW4gYXgyNV9oZWFydGJlYXRfZXhwaXJ5KHN0cnVjdCB0aW1lcl9saXN0ICp0KSB0
aGlzIGFzc3VyYW5jZToKPiAgICAgICAgICAgaWYgKGF4MjUtPmF4MjVfZGV2KQo+ICAgICAgICAg
ICAgICAgICBwcm90byA9IGF4MjUtPmF4MjVfZGV2LT52YWx1ZXNbQVgyNV9WQUxVRVNfUFJPVE9D
T0xdOwo+IFVuZm9ydHVuYXRlbHksIHRob3NlIGNoZWNrcyBhcmUgbWlzc2luZyBpbiB0aGUgb3Ro
ZXIgdGltZXJfZXhwaXJ5IGZ1bmN0aW9ucyBhbmQKPiBvbmUgb2YgdGhlbSBpcyBheDI1X3QxdGlt
ZXJfZXhwaXJ5LCBmb3Igd2hpY2ggeW91IHNob3dlZCBpbiB5b3VyIGtlcm5lbCBwYW5pYwo+IGJh
Y2t0cmFjZS4KClRoZSAiaWYoYXgyNS0+YXgyNV9kZXYpIiBjaGVjayBpbiBheDI1X2hlYXJ0YmVh
dF9leHBpcnkoKSBpcyB1c2VsZXNzLCBiZWNhdXNlIHRoZXJlCmlzIG5vdCBhbnkgbG9jayB0aGF0
IGNvdWxkIHN5bmNocm9uaXplIHdpdGggYXgyNV9raWxsX2J5X2RldmljZSgpLCBheDI1X2Rldl9k
ZXZpY2VfZG93bigpCm9yIGF4MjVfcmVsZWFzZSgpLiBFdmVuIGlmIHdlIGFkZCAiaWYoYXgyNS0+
YXgyNV9kZXYpIiBjaGVjayBpbiBvdGhlciB0aW1lcl9leHBpcnkgZnVuY3Rpb25zLAp0aGUgcmFj
ZSBjb25kaXRpb24gd2lsbCBhbHNvIGhhcHBlbi4KCj4gSWYgSSBzZWUgaXQgY29ycmVjdGx5LCB0
aGlzIHdvdWxkIHNvbHZlIHRoZSBpc3N1ZSB5b3UgaGFkIHdpdGggdGhlIHJ1bm5pbmcKPiB0aW1l
cnMsIHdpdGhvdXQgZm9yY2VkLXN0b3BwaW5nIHRoZW0gaW4gYXgyNV9yZWxlYXNlKCkuCj4gQnV0
IG9uIHRoZSBvdGhlciBoYW5kOiBpZiB0aGUgaW50ZXJmYWNlIGlzIHJlYWxseSBkb3duLCB0aGVy
ZSdzIG5vIG5lZWQKPiBmb3IgdGhlIHRpbWVycyB0byBrZWVwIHJ1bm5pbmcsIGFuZCBrZWVwaW5n
IHRoaW5ncyBydW5uaW5nIHdoZXJlIHBhcnRzCj4gbWF5IGFscmVhZHkgYmUgZnJlZWQgaXMgZGFu
Z2Vyb3VzLiBUaGUgc2Vzc2lvbiBoYXMgdG8gYmVlbiBjbGVhbmVkIHVwIGltbWVkaWF0ZWx5Lgo+
IC0+IFRoaXMgY2xlYXJseSBzcGVha3MgZm9yIHlvdXIgbGF0ZXN0IGFwcHJvYWNoLgoKVGhlIHRp
bWVycyB3aWxsIHN0YXJ0IHdoZW4gd2UgY2FsbCBheDI1X2JpbmQoKS0tPmF4MjVfY29ubmVjdCgp
IHRvIGVzdGFibGlzaCBhIHNlc3Npb24gb3IKZHVyaW5nIHRoZSBwZXJpb2Qgb2Ygc2Vzc2lvbiBj
bGVhbnVwLiAKCklmIHdlIG9ubHkgdXNlIGF4MjVfZGV2X2RldmljZV91cCgpIHRvIHR1cm4gdGhl
IGRldmljZSBvbiBpbnN0ZWFkIG9mIHVzaW5nIGF4MjVfYmluZCgpLS0+YXgyNV9jb25uZWN0KCkK
dG8gZXN0YWJsaXNoIGEgc2Vzc2lvbiwgbm8gdGltZXJzIHdpbGwgc3RhcnQuIFNvIGlmIHRoZSBp
bnRlcmZhY2UgaXMgZG93biwgdGhlcmUgYXJlIG5vIHRpbWVycyBydW5uaW5nLgoKSW4gc29tZSBj
YXNlcywgdGhlIHRpbWVycyBjb3VsZCBub3QgYmUgc3RvcHBlZCBpbiBheDI1X2tpbGxfYnlfZGV2
aWNlKCkuIElmIHlvdSBjYWxsIGF4MjVfa2lsbF9ieV9kZXZpY2UoKQpiZWZvcmUgYXgyNV9iaW5k
KCksIHdoaWNoIGlzIHNob3duIGJlbG93LiBZb3UgY291bGQgbm90IHN0b3AgdGltZXJzIGluIGF4
MjVfa2lsbF9ieV9kZXZpY2UoKSwgYmVjYXVzZSBpdCAKaGFzIGFscmVhZHkgYmVlbiBleGVjdXRl
ZC4KCiAgICAgIChUaHJlYWQgMSkgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAoVGhyZWFk
IDIpCmF4MjVfZGV2X2RldmljZV91cCgpICAgICAgICAgICAgICAgICAgIHwKLi4uICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBheDI1X2tpbGxfYnlfZGV2aWNlKCkKYXgyNV9i
aW5kKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgfApheDI1X2Nvbm5lY3QoKSAgLy8hIHRp
bWVycyBzdGFydCAgICAgICB8IC4uLgogYXgyNV9zdGRfZXN0YWJsaXNoX2RhdGFfbGluaygpICAg
ICAgICB8CiAgYXgyNV9zdGFydF90MXRpbWVyKCkgICAgICAgICAgICAgICAgIHwgYXgyNV9kZXZf
ZGV2aWNlX2Rvd24oKQogICBtb2RfdGltZXIoJmF4MjUtPnQxdGltZXIsLi4pICAgICAgICB8CiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgYXgyNV9yZWxlYXNlKCkKICAg
KHdhaXQgYSB0aW1lKSAgICAgICAgICAgICAgICAgICAgICAgfCAgLi4uCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIGF4MjVfZGV2X3B1dChheDI1X2RldikgLy9GUkVF
CiAgIGF4MjVfdDF0aW1lcl9leHBpcnkoKSAgICAgICAgICAgICAgIHwKICAgIGF4MjUtPmF4MjVf
ZGV2LT52YWx1ZXNbLi5dIC8vVVNFICAgfCAgLi4uCiAgICAgLi4uICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwKCldlIGhhdmUgdG8gdXNlIGRlbF90aW1lcl9zeW5jKCkgaW4gYXgyNV9y
ZWxlYXNlKCkgdG8gc3RvcCB0aW1lcnMsIGJlY2F1c2UgdGhlIGRldmljZSBjb3VsZApvbmx5IGJl
IHJlbW92ZWQgb25jZSBpbiB0aGUgcmVhbCB3b3JsZC4gV2hhdCdzIG1vcmUsIElmIHdlIHVzZSBh
eDI1X2JpbmQoKS0tPmF4MjVfY29ubmVjdCgpCnRvIGVzdGFibGlzaCBhIHNlc3Npb24sIHdlIG5l
ZWQgdG8gY2FsbCBheDI1X3JlbGVhc2UoKSB0byBjbG9zZSB0aGUgc2Vzc2lvbiBpbiBub3JtYWwg
Y2FzZS4KU28gcHV0dGluZyB0aGUgZGVsX3RpbWVyX3N5bmMoKSBpbiBheDI1X3JlbGVhc2UoKSBp
cyByZWFzb25hYmxlLgoKPiBQZXJoYXBzIGl0J3MgYSBnb29kIGlkZWEgYW55d2F5IHRvIGFkZCB0
aGUgYXNzdXJhbmNlIChsaWtlIGF4MjVfaGVhcnRiZWF0X2V4cGlyeSgpCj4gZG9lcykgdG8gdGhl
IG90aGVyIGF4MjVfeHh4X2V4cGlyeSgpIGZ1bmN0aW9ucy4gCgpJIGRpc2FncmVlLCB0aGVyZSBp
cyBub3QgYW55IGxvY2sgdGhhdCBjb3VsZCBzeW5jaHJvbml6ZSB3aXRoIG90aGVyIGZ1bmN0aW9u
cyBpbiAKYXgyNV94eHhfZXhwaXJ5KCkgZnVuY3Rpb25zLgoKPiBBbiBvdGhlciBhcHByb2FjaCBJ
IGhhZCBpbiBtaW5kIHdhcyBhIHZhcmlhYmxlIGluIHN0cnVjdCBheDI1X2NiLCB0aGF0IHRoZSBj
Ygo+IGlzIGluIHByb2dyZXNzIG9mIGJlaW5nIGNsZWFuZWQgdXAuCj4gVGhpcyB3YXksIHdlIGNv
dWxkIHByb2hpYml0IHN0YXJ0aW5nIG9yIG1vZGlmeWluZyB0aW1lcnMuCj4gVW5mb3J0dW5hdGVs
eSwgdGhlcmUgbWlnaHQgYmUgbWFueSBjaGVja3MgaW4gdmFyaW91cyBmdW5jdGlvbnMgbmVjZXNz
YXJ5Lgo+IC0+IFRoaXMgY2xlYXJseSBzcGVha3MgZm9yIHlvdXIgbGF0ZXN0IGFwcHJvYWNoLgo+
IAo+IFBlcmhhcHMgaXQncyBhIGdvb2QgaWRlYSB0byBhbHNvIHRlc3QgaW4KPiBheDI1X3NldHNv
Y2tvcHQgU09fQklORFRPREVWSUNFCj4gYW5kIGluCj4gYXgyNV9iaW5kX3RvX2RldmljZQo+IGlm
IGF4MjVfIGRldi0+ZGV2aWNlX3VwIGZsYWcgaXMgMCwgYW5kIGlmIHNvLCByZXR1cm4gaW4gIC1F
Tk9ERVY7CgpJdCBpcyB1bm5lY2Vzc2FyeSB0byBhZGQgYXgyNV9kZXYtPmRldmljZV91cCBmbGFn
IGluIGF4MjVfc2V0c29ja29wdCBTT19CSU5EVE9ERVZJQ0UKb3IgYXgyNV9iaW5kKCkuIEJlY2F1
c2UgdGhlcmUgaXMgbm8gYnVnIGFuZCB3ZSBuZWVkIHRvIGFkZCBleHRyYSBsb2NrcyBpbiBvcmRl
ciB0byAKc3luY2hyb25pemUgd2l0aCBheDI1X2Rldi0+ZGV2aWNlX3VwIGluIGF4MjVfa2lsbF9i
eV9kZXZpY2UoKSwgd2hpY2ggaXMgdGVkaW91cy4KIAo+IE9mZi10b3BpYy1xdWVzdGlvbjogYWJv
dXQgdGhlIHF1aXRlLW5ldyBkZXZfaG9sZF90cmFjaygpOgo+IHdoaWxlIGxvb2tpbmcgdG8gCj4g
YXgyNV9zZXRzb2Nrb3B0KCkgYW5kIGF4MjVfYmluZCgpIGZvciBTT19CSU5EVE9ERVZJQ0UsCj4g
SSBzZSBvbmx5IHRoYXQgZGV2X2hvbGRfdHJhY2soKSBpcyBjYWxsZWQgaW4gYXgyNV9iaW5kKCks
Cj4gYnV0IG5vdCBpbiBheDI1X3NldHNvY2tvcHQoKSBmb3IgU09fQklORFRPREVWSUNFLgo+IElz
IGl0IGNvcnJlY3QgdGhhdCBheDI1X3NldHNvY2tvcHQoKSBmb3IgU09fQklORFRPREVWSUNFCj4g
ZG9lcyBub3QgbmVlZCB0byB0cmlnZ2VyIHRoZSB0cmFja2VyPwoKVGhlcmUgaXMgbm8gbmVlZCB0
byBhZGQgcmVmY291bnQgb2YgbmV0X2RldmljZSBpbiBTT19CSU5EVE9ERVZJQ0UsIGJlY2F1c2Ug
dGhlcmUgaXMKcnRubF9sb2NrKCkgd2hpY2ggaXMgd2VsbCBzeW5jaHJvbml6ZWQgaW4gaXQuCgpC
ZXN0IHJlZ2FyZHMsCkR1b21pbmcgWmhvdQo=
