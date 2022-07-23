Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 461D357ED5C
	for <lists+linux-hams@lfdr.de>; Sat, 23 Jul 2022 11:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbiGWJza (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sat, 23 Jul 2022 05:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbiGWJz3 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sat, 23 Jul 2022 05:55:29 -0400
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D476213E06;
        Sat, 23 Jul 2022 02:55:24 -0700 (PDT)
Received: from [44.168.19.21] (unknown [86.242.59.24])
        (Authenticated sender: f6bvp@free.fr)
        by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4D13413FA37;
        Sat, 23 Jul 2022 11:55:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
        s=smtp-20201208; t=1658570123;
        bh=2amTBDr7UZzf/QgemlY36R9hPW8RKXF9Vgybt8Yi4UM=;
        h=Date:To:Cc:References:Subject:From:In-Reply-To:From;
        b=ZkmqffzgKv6Q58tAjn8KOfLGx1YyYHXDrdTj2qwMpnZzoqcuck+HSvvh7bc3hoYgK
         WZLxjMCYkIpgXw7juXSqprp5t174o58/BdWC+eaNTyCeq+TxWbnzVymNPVtur71gRi
         4NZJiEmLE76tMJ/TfRgIwcXqwruxVU42IwhByi3ZjYp3Cv+8AyL35pUoQ7AuPHoRwW
         +8wk10imBdilc2ZfcZBdHSngiAdzdmtO/Prkf/5HJZNxeUqtvrFB9kh/hC4xrrNpya
         kFyC/0yI6SLy8c/7/eAwxyfw/47B/KQR/R7fBzy6+OrWwN92Dq1LMbpPl6MmxVRoJj
         SjhqHWki7cnSw==
Content-Type: multipart/mixed; boundary="------------dl132MwUT8hB4I7T8hDR0oJH"
Message-ID: <fb7544a1-f42e-9254-18cc-c9b071f4ca70@free.fr>
Date:   Sat, 23 Jul 2022 11:55:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To:     edumazet@google.com
Cc:     davem@davemloft.net, duoming@zju.edu.cn, f6bvp@free.fr,
        kuba@kernel.org, linux-hams@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        pabeni@redhat.com, ralf@linux-mips.org
References: <CANn89i+-THx+jTzsLDxaX9diV4hz7z4mYqwn2CjtydFp+U4gow@mail.gmail.com>
Subject: Re: [PATCH] net: rose: fix unregistered netdevice: waiting for rose0
 to become free
Content-Language: en-US
From:   Bernard f6bvp <f6bvp@free.fr>
Organization: Dimension Parabole
In-Reply-To: <CANn89i+-THx+jTzsLDxaX9diV4hz7z4mYqwn2CjtydFp+U4gow@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

This is a multi-part message in MIME format.
--------------dl132MwUT8hB4I7T8hDR0oJH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


I modified .config according to
CONFIG_NET_DEV_REFCNT_TRACKER=y
then compiled moduled and ran my usual AX25 and ROSE applications.

Attached is (I hope) relevant dmesg dump.



--------------dl132MwUT8hB4I7T8hDR0oJH
Content-Type: text/plain; charset=UTF-8; name="dmesg_tracker.txt"
Content-Disposition: attachment; filename="dmesg_tracker.txt"
Content-Transfer-Encoding: base64

ClsgICAgMC4wMDAwMDBdIG1pY3JvY29kZTogbWljcm9jb2RlIHVwZGF0ZWQgZWFybHkgdG8g
cmV2aXNpb24gMHgyNiwgZGF0ZSA9IDIwMTktMTEtMTIKWyAgICAwLjAwMDAwMF0gTGludXgg
dmVyc2lvbiA1LjE4LjExLUY2QlZQIChyb290QHVidW50dS1mNmJ2cCkgKGdjYyAoVWJ1bnR1
IDExLjIuMC0xOXVidW50dTEpIDExLjIuMCwgR05VIGxkIChHTlUgQmludXRpbHMgZm9yIFVi
dW50dSkgMi4zOCkgIzMgU01QIFBSRUVNUFRfRFlOQU1JQyBTYXQgSnVsIDIzIDAxOjE0OjIz
IENFU1QgMjAyMgpbICAgIDAuMDAwMDAwXSBDb21tYW5kIGxpbmU6IEJPT1RfSU1BR0U9L2Jv
b3Qvdm1saW51ei01LjE4LjExLUY2QlZQIHJvb3Q9VVVJRD0zYmE5ZWY5Zi03OWZlLTQ5ZGQt
YjMwMS05YTUwOTU3MWY3YTYgcm8gcXVpZXQgc3BsYXNoIHZ0LmhhbmRvZmY9NwpbICAgIDAu
MDAwMDAwXSBLRVJORUwgc3VwcG9ydGVkIGNwdXM6ClsgICAgMC4wMDAwMDBdICAgSW50ZWwg
R2VudWluZUludGVsClsgICAgMC4wMDAwMDBdICAgQU1EIEF1dGhlbnRpY0FNRApbICAgIDAu
MDAwMDAwXSAgIEh5Z29uIEh5Z29uR2VudWluZQpbICAgIDAuMDAwMDAwXSAgIENlbnRhdXIg
Q2VudGF1ckhhdWxzClsgICAgMC4wMDAwMDBdICAgemhhb3hpbiAgIFNoYW5naGFpICAKLi4u
ClsgICA0OC40ODU1MDldIE5FVDogUmVnaXN0ZXJlZCBQRl9BWDI1IHByb3RvY29sIGZhbWls
eQpbICAgNDguNTIwNjc3XSBORVQ6IFJlZ2lzdGVyZWQgUEZfUk9TRSBwcm90b2NvbCBmYW1p
bHkKWyAgIDU2Ljg1NDYzNV0gTkVUOiBVbnJlZ2lzdGVyZWQgUEZfUk9TRSBwcm90b2NvbCBm
YW1pbHkKWyAgIDU5LjIzNTIxN10gTkVUOiBVbnJlZ2lzdGVyZWQgUEZfQVgyNSBwcm90b2Nv
bCBmYW1pbHkKWyAgIDY5LjMxNDg5Ml0gTkVUOiBSZWdpc3RlcmVkIFBGX0FYMjUgcHJvdG9j
b2wgZmFtaWx5ClsgICA2OS4zMjA2MTddIG1raXNzOiBBWC4yNSBNdWx0aWtpc3MsIEhhbnMg
QWxiYXMgUEUxQVlYClsgICA2OS4zMjEzNDBdIG1raXNzOiBheDA6IGNyYyBtb2RlIGlzIGF1
dG8uClsgICA2OS4zMjE0ODFdIElQdjY6IEFERFJDT05GKE5FVERFVl9DSEFOR0UpOiBheDA6
IGxpbmsgYmVjb21lcyByZWFkeQpbICAgNzEuMzYzMzA0XSBORVQ6IFJlZ2lzdGVyZWQgUEZf
TkVUUk9NIHByb3RvY29sIGZhbWlseQpbICAgNzMuNDc3MDAwXSBORVQ6IFJlZ2lzdGVyZWQg
UEZfUk9TRSBwcm90b2NvbCBmYW1pbHkKWyAgIDc5LjQ4NzkyNl0gbWtpc3M6IGF4MDogVHJ5
aW5nIGNyYy1zbWFjawpbICAgNzkuNDg4MDUzXSBta2lzczogYXgwOiBUcnlpbmcgY3JjLWZs
ZXhuZXQKWyAgMjA1Ljc5ODcyM10gcmVmZXJlbmNlIGFscmVhZHkgcmVsZWFzZWQuClsgIDIw
NS43OTg3MzJdIGFsbG9jYXRlZCBpbjoKWyAgMjA1Ljc5ODczNF0gIGF4MjVfYmluZCsweDFh
Mi8weDIzMCBbYXgyNV0KWyAgMjA1Ljc5ODc0N10gIF9fc3lzX2JpbmQrMHhlYS8weDExMApb
ICAyMDUuNzk4NzUzXSAgX194NjRfc3lzX2JpbmQrMHgxOC8weDIwClsgIDIwNS43OTg3NThd
ICBkb19zeXNjYWxsXzY0KzB4NWMvMHg4MApbICAyMDUuNzk4NzYzXSAgZW50cnlfU1lTQ0FM
TF82NF9hZnRlcl9od2ZyYW1lKzB4NDQvMHhhZQpbICAyMDUuNzk4NzY4XSBmcmVlZCBpbjoK
WyAgMjA1Ljc5ODc3MF0gIGF4MjVfcmVsZWFzZSsweDExNS8weDM3MCBbYXgyNV0KWyAgMjA1
Ljc5ODc3OF0gIF9fc29ja19yZWxlYXNlKzB4NDIvMHhiMApbICAyMDUuNzk4NzgyXSAgc29j
a19jbG9zZSsweDE1LzB4MjAKWyAgMjA1Ljc5ODc4NV0gIF9fZnB1dCsweDlmLzB4MjYwClsg
IDIwNS43OTg3ODldICBfX19fZnB1dCsweGUvMHgxMApbICAyMDUuNzk4NzkyXSAgdGFza193
b3JrX3J1bisweDY0LzB4YTAKWyAgMjA1Ljc5ODc5OF0gIGV4aXRfdG9fdXNlcl9tb2RlX3By
ZXBhcmUrMHgxOGIvMHgxOTAKWyAgMjA1Ljc5ODgwNF0gIHN5c2NhbGxfZXhpdF90b191c2Vy
X21vZGUrMHgyNi8weDQwClsgIDIwNS43OTg4MDhdICBkb19zeXNjYWxsXzY0KzB4NjkvMHg4
MApbICAyMDUuNzk4ODEyXSAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDQv
MHhhZQpbICAyMDUuNzk4ODI3XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0t
LS0KWyAgMjA1Ljc5ODgyOV0gV0FSTklORzogQ1BVOiAyIFBJRDogMjYwNSBhdCBsaWIvcmVm
X3RyYWNrZXIuYzoxMzYgcmVmX3RyYWNrZXJfZnJlZS5jb2xkKzB4NjAvMHg4MQpbICAyMDUu
Nzk4ODM3XSBNb2R1bGVzIGxpbmtlZCBpbjogcm9zZSBuZXRyb20gbWtpc3MgYXgyNSByZmNv
bW0gY21hYyBhbGdpZl9oYXNoIGFsZ2lmX3NrY2lwaGVyIGFmX2FsZyBibmVwIHNuZF9oZGFf
Y29kZWNfaGRtaSBubHNfaXNvODg1OV8xIGk5MTUgcnR3ODhfODgyMWNlIHJ0dzg4Xzg4MjFj
IHg4Nl9wa2dfdGVtcF90aGVybWFsIHJ0dzg4X3BjaSBpbnRlbF9wb3dlcmNsYW1wIHJ0dzg4
X2NvcmUgc25kX2hkYV9jb2RlY19yZWFsdGVrIHNuZF9oZGFfY29kZWNfZ2VuZXJpYyBsZWR0
cmlnX2F1ZGlvIGNvcmV0ZW1wIHNuZF9oZGFfaW50ZWwga3ZtX2ludGVsIHNuZF9pbnRlbF9k
c3BjZmcgbWFjODAyMTEgc25kX2hkYV9jb2RlYyBrdm0gaTJjX2FsZ29fYml0IGRybV9idWRk
eSBkcm1fZHBfaGVscGVyIGJ0dXNiIGRybV9rbXNfaGVscGVyIHNuZF9od2RlcCBidHJ0bCBz
bmRfaGRhX2NvcmUgYnRiY20gam95ZGV2IGNyY3QxMGRpZl9wY2xtdWwgYnRpbnRlbCBjcmMz
Ml9wY2xtdWwgZ2hhc2hfY2xtdWxuaV9pbnRlbCBtZWlfaGRjcCBidG10ayBpbnRlbF9yYXBs
X21zciBhZXNuaV9pbnRlbCBibHVldG9vdGggaW5wdXRfbGVkcyBzbmRfcGNtIGNyeXB0b19z
aW1kIHN5c2NvcHlhcmVhIHByb2Nlc3Nvcl90aGVybWFsX2RldmljZV9wY2lfbGVnYWN5IHN5
c2ZpbGxyZWN0IGNyeXB0ZCBpbnRlbF9zb2NfZHRzX2lvc2Ygc25kX3NlcSBzeXNpbWdibHQg
ZWNkaF9nZW5lcmljIGZiX3N5c19mb3BzIHJhcGwgbGliYXJjNCBwcm9jZXNzb3JfdGhlcm1h
bF9kZXZpY2UgaW50ZWxfY3N0YXRlIHByb2Nlc3Nvcl90aGVybWFsX3JmaW0gY2VjIHNuZF90
aW1lciBlY2Mgc25kX3NlcV9kZXZpY2UgY2ZnODAyMTEgcHJvY2Vzc29yX3RoZXJtYWxfbWJv
eCBtZWlfbWUgcHJvY2Vzc29yX3RoZXJtYWxfcmFwbCBtZWkgcmNfY29yZSBhdDI0IHNuZCBp
bnRlbF9wY2hfdGhlcm1hbCBpbnRlbF9yYXBsX2NvbW1vbiB0dG0gc291bmRjb3JlIGludDM0
MHhfdGhlcm1hbF96b25lIHZpZGVvClsgIDIwNS43OTg5NDhdICBtYWNfaGlkIGFjcGlfcGFk
IHNjaF9mcV9jb2RlbCBpcG1pX2RldmludGYgaXBtaV9tc2doYW5kbGVyIGRybSBtc3IgcGFy
cG9ydF9wYyBwcGRldiBscCBwYXJwb3J0IHJhbW9vcHMgcHN0b3JlX2JsayByZWVkX3NvbG9t
b24gcHN0b3JlX3pvbmUgZWZpX3BzdG9yZSBpcF90YWJsZXMgeF90YWJsZXMgYXV0b2ZzNCBo
aWRfZ2VuZXJpYyB1c2JoaWQgaGlkIGkyY19pODAxIGkyY19zbWJ1cyByODE2OSB4aGNpX3Bj
aSBhaGNpIGxpYmFoY2kgcmVhbHRlayBscGNfaWNoIHhoY2lfcGNpX3JlbmVzYXMgW2xhc3Qg
dW5sb2FkZWQ6IGF4MjVdClsgIDIwNS43OTg5OTJdIENQVTogMiBQSUQ6IDI2MDUgQ29tbTog
YXgyNWlwZCBOb3QgdGFpbnRlZCA1LjE4LjExLUY2QlZQICMzClsgIDIwNS43OTg5OTZdIEhh
cmR3YXJlIG5hbWU6IFRvIGJlIGZpbGxlZCBieSBPLkUuTS4gVG8gYmUgZmlsbGVkIGJ5IE8u
RS5NLi9DSzMsIEJJT1MgNS4wMTEgMDkvMTYvMjAyMApbICAyMDUuNzk4OTk5XSBSSVA6IDAw
MTA6cmVmX3RyYWNrZXJfZnJlZS5jb2xkKzB4NjAvMHg4MQpbICAyMDUuNzk5MDA1XSBDb2Rl
OiBlOCBkMiAwMSA5YiBmZiA4MyA3YiAxOCAwMCA3NCAxNCA0OCBjNyBjNyAyZiBkNyBmZiA5
OCBlOCAxMCA2ZSBmYyBmZiA4YiA3YiAxOCBlOCBiOCAwMSA5YiBmZiA0YyA4OSBlZSA0YyA4
OSBlNyBlOCA1ZCBmZCAwNyAwMCA8MGY+IDBiIGI4IGVhIGZmIGZmIGZmIGU5IDMwIDA1IDli
IGZmIDQxIDBmIGI2IGY3IDQ4IGM3IGM3IGEwIGZhIDRlClsgIDIwNS43OTkwMDhdIFJTUDog
MDAxODpmZmZmYWY1MjgxMDczOTU4IEVGTEFHUzogMDAwMTAyODYKWyAgMjA1Ljc5OTAxMV0g
UkFYOiAwMDAwMDAwMDgwMDAwMDAwIFJCWDogZmZmZjlhMGJkNjg3ZWJlMCBSQ1g6IDAwMDAw
MDAwMDAwMDAwMDAKWyAgMjA1Ljc5OTAxNF0gUkRYOiAwMDAwMDAwMDAwMDAwMDAxIFJTSTog
MDAwMDAwMDAwMDAwMDI4MiBSREk6IDAwMDAwMDAwZmZmZmZmZmYKWyAgMjA1Ljc5OTAxNl0g
UkJQOiBmZmZmYWY1MjgxMDczYTEwIFIwODogMDAwMDAwMDAwMDAwMDAwMyBSMDk6IGZmZmZm
ZmZmZmZmZDU2MTgKWyAgMjA1Ljc5OTAxOV0gUjEwOiAwMDAwMDAwMDAwZmZmZjEwIFIxMTog
MDAwMDAwMDAwMDAwMDAwZiBSMTI6IGZmZmY5YTBiYzUzMzg0ZDAKWyAgMjA1Ljc5OTAyMl0g
UjEzOiAwMDAwMDAwMDAwMDAwMjgyIFIxNDogMDAwMDAwMDBhZTAwMDAwMSBSMTU6IDAwMDAw
MDAwMDAwMDAwMDEKWyAgMjA1Ljc5OTAyNF0gRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDAp
IEdTOmZmZmY5YTBkMGYzMDAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMApbICAy
MDUuNzk5MDI4XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgw
MDUwMDMzClsgIDIwNS43OTkwMzFdIENSMjogMDAwMDdmZjZiODMxMTU1NCBDUjM6IDAwMDAw
MDAwMWFjMTAwMDQgQ1I0OiAwMDAwMDAwMDAwMTcwNmUwClsgIDIwNS43OTkwMzNdIENhbGwg
VHJhY2U6ClsgIDIwNS43OTkwMzVdICA8VEFTSz4KWyAgMjA1Ljc5OTAzOF0gID8gYXgyNV9k
ZXZfZGV2aWNlX2Rvd24rMHhkOS8weDFiMCBbYXgyNV0KWyAgMjA1Ljc5OTA0N10gID8gYXgy
NV9kZXZpY2VfZXZlbnQrMHg5Zi8weDI3MCBbYXgyNV0KWyAgMjA1Ljc5OTA1NV0gID8gcmF3
X25vdGlmaWVyX2NhbGxfY2hhaW4rMHg0OS8weDYwClsgIDIwNS43OTkwNjBdICA/IGNhbGxf
bmV0ZGV2aWNlX25vdGlmaWVyc19pbmZvKzB4NTIvMHhhMApbICAyMDUuNzk5MDY1XSAgPyBk
ZXZfY2xvc2VfbWFueSsweGM4LzB4MTIwClsgIDIwNS43OTkwNzBdICA/IHVucmVnaXN0ZXJf
bmV0ZGV2aWNlX21hbnkrMHgxM2QvMHg4OTAKWyAgMjA1Ljc5OTA3M10gID8gdW5yZWdpc3Rl
cl9uZXRkZXZpY2VfcXVldWUrMHg5MC8weGUwClsgIDIwNS43OTkwNzZdICA/IHVucmVnaXN0
ZXJfbmV0ZGV2KzB4MWQvMHgzMApbICAyMDUuNzk5MDgwXSAgPyBta2lzc19jbG9zZSsweDdj
LzB4YzAgW21raXNzXQpbICAyMDUuNzk5MDg0XSAgPyB0dHlfbGRpc2NfY2xvc2UrMHgyZS8w
eDQwClsgIDIwNS43OTkwODldICA/IHR0eV9sZGlzY19oYW5ndXArMHgxMzcvMHgyMTAKWyAg
MjA1Ljc5OTA5Ml0gID8gX190dHlfaGFuZ3VwLnBhcnQuMCsweDIwOC8weDM1MApbICAyMDUu
Nzk5MDk4XSAgPyB0dHlfdmhhbmd1cCsweDE1LzB4MjAKWyAgMjA1Ljc5OTEwM10gID8gcHR5
X2Nsb3NlKzB4MTI3LzB4MTYwClsgIDIwNS43OTkxMDhdICA/IHR0eV9yZWxlYXNlKzB4MTM5
LzB4NWUwClsgIDIwNS43OTkxMTJdICA/IF9fZnB1dCsweDlmLzB4MjYwClsgIDIwNS43OTkx
MThdICBheDI1X2Rldl9kZXZpY2VfZG93bisweGQ5LzB4MWIwIFtheDI1XQpbICAyMDUuNzk5
MTI2XSAgYXgyNV9kZXZpY2VfZXZlbnQrMHg5Zi8weDI3MCBbYXgyNV0KWyAgMjA1Ljc5OTEz
NV0gIHJhd19ub3RpZmllcl9jYWxsX2NoYWluKzB4NDkvMHg2MApbICAyMDUuNzk5MTQwXSAg
Y2FsbF9uZXRkZXZpY2Vfbm90aWZpZXJzX2luZm8rMHg1Mi8weGEwClsgIDIwNS43OTkxNDZd
ICBkZXZfY2xvc2VfbWFueSsweGM4LzB4MTIwClsgIDIwNS43OTkxNTJdICB1bnJlZ2lzdGVy
X25ldGRldmljZV9tYW55KzB4MTNkLzB4ODkwClsgIDIwNS43OTkxNTddICB1bnJlZ2lzdGVy
X25ldGRldmljZV9xdWV1ZSsweDkwLzB4ZTAKWyAgMjA1Ljc5OTE2MV0gIHVucmVnaXN0ZXJf
bmV0ZGV2KzB4MWQvMHgzMApbICAyMDUuNzk5MTY1XSAgbWtpc3NfY2xvc2UrMHg3Yy8weGMw
IFtta2lzc10KWyAgMjA1Ljc5OTE3MF0gIHR0eV9sZGlzY19jbG9zZSsweDJlLzB4NDAKWyAg
MjA1Ljc5OTE3M10gIHR0eV9sZGlzY19oYW5ndXArMHgxMzcvMHgyMTAKWyAgMjA1Ljc5OTE3
OF0gIF9fdHR5X2hhbmd1cC5wYXJ0LjArMHgyMDgvMHgzNTAKWyAgMjA1Ljc5OTE4NF0gIHR0
eV92aGFuZ3VwKzB4MTUvMHgyMApbICAyMDUuNzk5MTg4XSAgcHR5X2Nsb3NlKzB4MTI3LzB4
MTYwClsgIDIwNS43OTkxOTNdICB0dHlfcmVsZWFzZSsweDEzOS8weDVlMApbICAyMDUuNzk5
MTk5XSAgX19mcHV0KzB4OWYvMHgyNjAKWyAgMjA1Ljc5OTIwM10gIF9fX19mcHV0KzB4ZS8w
eDEwClsgIDIwNS43OTkyMDhdICB0YXNrX3dvcmtfcnVuKzB4NjQvMHhhMApbICAyMDUuNzk5
MjEzXSAgZG9fZXhpdCsweDMzYi8weGFiMApbICAyMDUuNzk5MjE3XSAgPyBfX2hhbmRsZV9t
bV9mYXVsdCsweGM0Zi8weDE1ZjAKWyAgMjA1Ljc5OTIyNF0gIGRvX2dyb3VwX2V4aXQrMHgz
NS8weGEwClsgIDIwNS43OTkyMjhdICBfX3g2NF9zeXNfZXhpdF9ncm91cCsweDE4LzB4MjAK
WyAgMjA1Ljc5OTIzMl0gIGRvX3N5c2NhbGxfNjQrMHg1Yy8weDgwClsgIDIwNS43OTkyMzhd
ICA/IGhhbmRsZV9tbV9mYXVsdCsweGJhLzB4MjkwClsgIDIwNS43OTkyNDJdICA/IGRlYnVn
X3NtcF9wcm9jZXNzb3JfaWQrMHgxNy8weDIwClsgIDIwNS43OTkyNDZdICA/IGZwcmVnc19h
c3NlcnRfc3RhdGVfY29uc2lzdGVudCsweDI2LzB4NTAKWyAgMjA1Ljc5OTI1MV0gID8gZXhp
dF90b191c2VyX21vZGVfcHJlcGFyZSsweDQ5LzB4MTkwClsgIDIwNS43OTkyNTZdICA/IGly
cWVudHJ5X2V4aXRfdG9fdXNlcl9tb2RlKzB4OS8weDIwClsgIDIwNS43OTkyNjBdICA/IGly
cWVudHJ5X2V4aXQrMHgzMy8weDQwClsgIDIwNS43OTkyNjNdICA/IGV4Y19wYWdlX2ZhdWx0
KzB4ODcvMHgxNzAKWyAgMjA1Ljc5OTI2OF0gID8gYXNtX2V4Y19wYWdlX2ZhdWx0KzB4OC8w
eDMwClsgIDIwNS43OTkyNzNdICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0
NC8weGFlClsgIDIwNS43OTkyNzddIFJJUDogMDAzMzoweDdmZjZiODBlYWNhMQpbICAyMDUu
Nzk5MjgxXSBDb2RlOiBVbmFibGUgdG8gYWNjZXNzIG9wY29kZSBieXRlcyBhdCBSSVAgMHg3
ZmY2YjgwZWFjNzcuClsgIDIwNS43OTkyODNdIFJTUDogMDAyYjowMDAwN2ZmZjZkZmQ0NzM4
IEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAwZTcKWyAgMjA1Ljc5
OTI4N10gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDdmZjZiODIxNWEwMCBSQ1g6
IDAwMDA3ZmY2YjgwZWFjYTEKWyAgMjA1Ljc5OTI5MF0gUkRYOiAwMDAwMDAwMDAwMDAwMDNj
IFJTSTogMDAwMDAwMDAwMDAwMDBlNyBSREk6IDAwMDAwMDAwMDAwMDAwMDEKWyAgMjA1Ljc5
OTI5M10gUkJQOiAwMDAwMDAwMDAwMDAwMDAxIFIwODogZmZmZmZmZmZmZmZmZmY4MCBSMDk6
IDAwMDAwMDAwMDAwMDAwMjgKWyAgMjA1Ljc5OTI5NV0gUjEwOiAwMDAwMDAwMDAwMDAwMDAw
IFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6IDAwMDA3ZmY2YjgyMTVhMDAKWyAgMjA1Ljc5
OTI5OF0gUjEzOiAwMDAwMDAwMDAwMDAwMDAwIFIxNDogMDAwMDdmZjZiODIxYWVlOCBSMTU6
IDAwMDA3ZmY2YjgyMWFmMDAKWyAgMjA1Ljc5OTMwNF0gIDwvVEFTSz4KWyAgMjA1Ljc5OTMw
Nl0gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tClsgIDIwNS44MjM0ODhd
IGxlYWtlZCByZWZlcmVuY2UuClsgIDIwNS44MjM1MDBdICBheDI1X2Rldl9kZXZpY2VfdXAr
MHg2Yi8weDE2MCBbYXgyNV0KWyAgMjA1LjgyMzUxNF0gIGF4MjVfZGV2aWNlX2V2ZW50KzB4
MWM2LzB4MjcwIFtheDI1XQpbICAyMDUuODIzNTIyXSAgcmF3X25vdGlmaWVyX2NhbGxfY2hh
aW4rMHg0OS8weDYwClsgIDIwNS44MjM1MjldICBjYWxsX25ldGRldmljZV9ub3RpZmllcnNf
aW5mbysweDUyLzB4YTAKWyAgMjA1LjgyMzUzNV0gIF9fZGV2X25vdGlmeV9mbGFncysweDU4
LzB4ZTAKWyAgMjA1LjgyMzUzOF0gIGRldl9jaGFuZ2VfZmxhZ3MrMHg1MS8weDYwClsgIDIw
NS44MjM1NDJdICBkZXZpbmV0X2lvY3RsKzB4NjE0LzB4ODEwClsgIDIwNS44MjM1NDZdICBp
bmV0X2lvY3RsKzB4MTY1LzB4MTkwClsgIDIwNS44MjM1NDhdICBzb2NrX2RvX2lvY3RsKzB4
NDUvMHgxMDAKWyAgMjA1LjgyMzU1Ml0gIHNvY2tfaW9jdGwrMHhlZi8weDMxMApbICAyMDUu
ODIzNTU1XSAgX194NjRfc3lzX2lvY3RsKzB4OTEvMHhjMApbICAyMDUuODIzNTU5XSAgZG9f
c3lzY2FsbF82NCsweDVjLzB4ODAKWyAgMjA1LjgyMzU2NV0gIGVudHJ5X1NZU0NBTExfNjRf
YWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YWUKWyAgMjA1LjgyMzU4Nl0gLS0tLS0tLS0tLS0tWyBj
dXQgaGVyZSBdLS0tLS0tLS0tLS0tClsgIDIwNS44MjM1ODldIFdBUk5JTkc6IENQVTogMiBQ
SUQ6IDI2MDUgYXQgbGliL3JlZl90cmFja2VyLmM6MzkgcmVmX3RyYWNrZXJfZGlyX2V4aXQu
Y29sZCsweDY2LzB4NzIKWyAgMjA1LjgyMzU5OV0gTW9kdWxlcyBsaW5rZWQgaW46IHJvc2Ug
bmV0cm9tIG1raXNzIGF4MjUgcmZjb21tIGNtYWMgYWxnaWZfaGFzaCBhbGdpZl9za2NpcGhl
ciBhZl9hbGcgYm5lcCBzbmRfaGRhX2NvZGVjX2hkbWkgbmxzX2lzbzg4NTlfMSBpOTE1IHJ0
dzg4Xzg4MjFjZSBydHc4OF84ODIxYyB4ODZfcGtnX3RlbXBfdGhlcm1hbCBydHc4OF9wY2kg
aW50ZWxfcG93ZXJjbGFtcCBydHc4OF9jb3JlIHNuZF9oZGFfY29kZWNfcmVhbHRlayBzbmRf
aGRhX2NvZGVjX2dlbmVyaWMgbGVkdHJpZ19hdWRpbyBjb3JldGVtcCBzbmRfaGRhX2ludGVs
IGt2bV9pbnRlbCBzbmRfaW50ZWxfZHNwY2ZnIG1hYzgwMjExIHNuZF9oZGFfY29kZWMga3Zt
IGkyY19hbGdvX2JpdCBkcm1fYnVkZHkgZHJtX2RwX2hlbHBlciBidHVzYiBkcm1fa21zX2hl
bHBlciBzbmRfaHdkZXAgYnRydGwgc25kX2hkYV9jb3JlIGJ0YmNtIGpveWRldiBjcmN0MTBk
aWZfcGNsbXVsIGJ0aW50ZWwgY3JjMzJfcGNsbXVsIGdoYXNoX2NsbXVsbmlfaW50ZWwgbWVp
X2hkY3AgYnRtdGsgaW50ZWxfcmFwbF9tc3IgYWVzbmlfaW50ZWwgYmx1ZXRvb3RoIGlucHV0
X2xlZHMgc25kX3BjbSBjcnlwdG9fc2ltZCBzeXNjb3B5YXJlYSBwcm9jZXNzb3JfdGhlcm1h
bF9kZXZpY2VfcGNpX2xlZ2FjeSBzeXNmaWxscmVjdCBjcnlwdGQgaW50ZWxfc29jX2R0c19p
b3NmIHNuZF9zZXEgc3lzaW1nYmx0IGVjZGhfZ2VuZXJpYyBmYl9zeXNfZm9wcyByYXBsIGxp
YmFyYzQgcHJvY2Vzc29yX3RoZXJtYWxfZGV2aWNlIGludGVsX2NzdGF0ZSBwcm9jZXNzb3Jf
dGhlcm1hbF9yZmltIGNlYyBzbmRfdGltZXIgZWNjIHNuZF9zZXFfZGV2aWNlIGNmZzgwMjEx
IHByb2Nlc3Nvcl90aGVybWFsX21ib3ggbWVpX21lIHByb2Nlc3Nvcl90aGVybWFsX3JhcGwg
bWVpIHJjX2NvcmUgYXQyNCBzbmQgaW50ZWxfcGNoX3RoZXJtYWwgaW50ZWxfcmFwbF9jb21t
b24gdHRtIHNvdW5kY29yZSBpbnQzNDB4X3RoZXJtYWxfem9uZSB2aWRlbwpbICAyMDUuODIz
Njk3XSAgbWFjX2hpZCBhY3BpX3BhZCBzY2hfZnFfY29kZWwgaXBtaV9kZXZpbnRmIGlwbWlf
bXNnaGFuZGxlciBkcm0gbXNyIHBhcnBvcnRfcGMgcHBkZXYgbHAgcGFycG9ydCByYW1vb3Bz
IHBzdG9yZV9ibGsgcmVlZF9zb2xvbW9uIHBzdG9yZV96b25lIGVmaV9wc3RvcmUgaXBfdGFi
bGVzIHhfdGFibGVzIGF1dG9mczQgaGlkX2dlbmVyaWMgdXNiaGlkIGhpZCBpMmNfaTgwMSBp
MmNfc21idXMgcjgxNjkgeGhjaV9wY2kgYWhjaSBsaWJhaGNpIHJlYWx0ZWsgbHBjX2ljaCB4
aGNpX3BjaV9yZW5lc2FzIFtsYXN0IHVubG9hZGVkOiBheDI1XQpbICAyMDUuODIzNzMyXSBD
UFU6IDIgUElEOiAyNjA1IENvbW06IGF4MjVpcGQgVGFpbnRlZDogRyAgICAgICAgVyAgICAg
ICAgIDUuMTguMTEtRjZCVlAgIzMKWyAgMjA1LjgyMzczNl0gSGFyZHdhcmUgbmFtZTogVG8g
YmUgZmlsbGVkIGJ5IE8uRS5NLiBUbyBiZSBmaWxsZWQgYnkgTy5FLk0uL0NLMywgQklPUyA1
LjAxMSAwOS8xNi8yMDIwClsgIDIwNS44MjM3MzhdIFJJUDogMDAxMDpyZWZfdHJhY2tlcl9k
aXJfZXhpdC5jb2xkKzB4NjYvMHg3MgpbICAyMDUuODIzNzQ0XSBDb2RlOiAwMCAwMCAwMCBh
ZCBkZSA0OSA4OSA0NCAyNCAwOCA0ZCA4OSAyYyAyNCA0OSA4OSBkYyBlOCA3ZCBkOCA2NyBm
ZiA0OCA4YiAwMyA0YyAzOSBmYiA3NSAxMyA0OCA4YiA3NSBkMCA0YyA4OSBmNyBlOCBjOSBm
ZCAwNyAwMCA8MGY+IDBiIGU5IDVmIDA0IDliIGZmIDQ4IDg5IGMzIGViIDk4IDQxIDBmIGI2
IGY1IDQ4IGM3IGM3IGMwIGZhIDRlClsgIDIwNS44MjM3NDddIFJTUDogMDAxODpmZmZmYWY1
MjgxMDczYmEwIEVGTEFHUzogMDAwMTAyODYKWyAgMjA1LjgyMzc1MF0gUkFYOiAwMDAwMDAw
MDgwMDAwMDAwIFJCWDogZmZmZjlhMGJjNTMzODRlOCBSQ1g6IDAwMDAwMDAwMDAwMDAwMDAK
WyAgMjA1LjgyMzc1M10gUkRYOiAwMDAwMDAwMDAwMDAwMDAxIFJTSTogMDAwMDAwMDAwMDAw
MDI4NiBSREk6IDAwMDAwMDAwZmZmZmZmZmYKWyAgMjA1LjgyMzc1NV0gUkJQOiBmZmZmYWY1
MjgxMDczYmQwIFIwODogZmZmZjlhMGJlNmM1NGEwMCBSMDk6IDAwMDAwMDAwMDA4MDAwNWYK
WyAgMjA1LjgyMzc1N10gUjEwOiAwMDAwMDAwMDAwZmZmZjEwIFIxMTogMDAwMDAwMDAwMDAw
MDAwMCBSMTI6IGZmZmY5YTBiYzUzMzg0ZTgKWyAgMjA1LjgyMzc1OV0gUjEzOiBkZWFkMDAw
MDAwMDAwMTAwIFIxNDogZmZmZjlhMGJjNTMzODRkMCBSMTU6IGZmZmY5YTBiYzUzMzg0ZTgK
WyAgMjA1LjgyMzc2Ml0gRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY5YTBk
MGYzMDAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMApbICAyMDUuODIzNzY0XSBD
UzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzClsgIDIw
NS44MjM3NjZdIENSMjogMDAwMDdmYzY0YzA5NDVmOCBDUjM6IDAwMDAwMDAwMWFjMTAwMDIg
Q1I0OiAwMDAwMDAwMDAwMTcwNmUwClsgIDIwNS44MjM3NjldIENhbGwgVHJhY2U6ClsgIDIw
NS44MjM3NzFdICA8VEFTSz4KWyAgMjA1LjgyMzc3NV0gIGZyZWVfbmV0ZGV2KzB4ZjAvMHgx
ZDAKWyAgMjA1LjgyMzc4M10gIG1raXNzX2Nsb3NlKzB4OWUvMHhjMCBbbWtpc3NdClsgIDIw
NS44MjM3ODhdICB0dHlfbGRpc2NfY2xvc2UrMHgyZS8weDQwClsgIDIwNS44MjM3OTJdICB0
dHlfbGRpc2NfaGFuZ3VwKzB4MTM3LzB4MjEwClsgIDIwNS44MjM3OTVdICBfX3R0eV9oYW5n
dXAucGFydC4wKzB4MjA4LzB4MzUwClsgIDIwNS44MjM4MDJdICB0dHlfdmhhbmd1cCsweDE1
LzB4MjAKWyAgMjA1LjgyMzgwN10gIHB0eV9jbG9zZSsweDEyNy8weDE2MApbICAyMDUuODIz
ODExXSAgdHR5X3JlbGVhc2UrMHgxMzkvMHg1ZTAKWyAgMjA1LjgyMzgxN10gIF9fZnB1dCsw
eDlmLzB4MjYwClsgIDIwNS44MjM4MjJdICBfX19fZnB1dCsweGUvMHgxMApbICAyMDUuODIz
ODI2XSAgdGFza193b3JrX3J1bisweDY0LzB4YTAKWyAgMjA1LjgyMzgzMl0gIGRvX2V4aXQr
MHgzM2IvMHhhYjAKWyAgMjA1LjgyMzgzNl0gID8gX19oYW5kbGVfbW1fZmF1bHQrMHhjNGYv
MHgxNWYwClsgIDIwNS44MjM4NDNdICBkb19ncm91cF9leGl0KzB4MzUvMHhhMApbICAyMDUu
ODIzODQ3XSAgX194NjRfc3lzX2V4aXRfZ3JvdXArMHgxOC8weDIwClsgIDIwNS44MjM4NTBd
ICBkb19zeXNjYWxsXzY0KzB4NWMvMHg4MApbICAyMDUuODIzODU1XSAgPyBoYW5kbGVfbW1f
ZmF1bHQrMHhiYS8weDI5MApbICAyMDUuODIzODU5XSAgPyBkZWJ1Z19zbXBfcHJvY2Vzc29y
X2lkKzB4MTcvMHgyMApbICAyMDUuODIzODYyXSAgPyBmcHJlZ3NfYXNzZXJ0X3N0YXRlX2Nv
bnNpc3RlbnQrMHgyNi8weDUwClsgIDIwNS44MjM4NjZdICA/IGV4aXRfdG9fdXNlcl9tb2Rl
X3ByZXBhcmUrMHg0OS8weDE5MApbICAyMDUuODIzODczXSAgPyBpcnFlbnRyeV9leGl0X3Rv
X3VzZXJfbW9kZSsweDkvMHgyMApbICAyMDUuODIzODc2XSAgPyBpcnFlbnRyeV9leGl0KzB4
MzMvMHg0MApbICAyMDUuODIzODc4XSAgPyBleGNfcGFnZV9mYXVsdCsweDg3LzB4MTcwClsg
IDIwNS44MjM4ODRdICA/IGFzbV9leGNfcGFnZV9mYXVsdCsweDgvMHgzMApbICAyMDUuODIz
ODg4XSAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDQvMHhhZQpbICAyMDUu
ODIzODkxXSBSSVA6IDAwMzM6MHg3ZmY2YjgwZWFjYTEKWyAgMjA1LjgyMzg5NF0gQ29kZTog
VW5hYmxlIHRvIGFjY2VzcyBvcGNvZGUgYnl0ZXMgYXQgUklQIDB4N2ZmNmI4MGVhYzc3Lgpb
ICAyMDUuODIzODk2XSBSU1A6IDAwMmI6MDAwMDdmZmY2ZGZkNDczOCBFRkxBR1M6IDAwMDAw
MjQ2IE9SSUdfUkFYOiAwMDAwMDAwMDAwMDAwMGU3ClsgIDIwNS44MjM4OTldIFJBWDogZmZm
ZmZmZmZmZmZmZmZkYSBSQlg6IDAwMDA3ZmY2YjgyMTVhMDAgUkNYOiAwMDAwN2ZmNmI4MGVh
Y2ExClsgIDIwNS44MjM5MDFdIFJEWDogMDAwMDAwMDAwMDAwMDAzYyBSU0k6IDAwMDAwMDAw
MDAwMDAwZTcgUkRJOiAwMDAwMDAwMDAwMDAwMDAxClsgIDIwNS44MjM5MDNdIFJCUDogMDAw
MDAwMDAwMDAwMDAwMSBSMDg6IGZmZmZmZmZmZmZmZmZmODAgUjA5OiAwMDAwMDAwMDAwMDAw
MDI4ClsgIDIwNS44MjM5MDVdIFIxMDogMDAwMDAwMDAwMDAwMDAwMCBSMTE6IDAwMDAwMDAw
MDAwMDAyNDYgUjEyOiAwMDAwN2ZmNmI4MjE1YTAwClsgIDIwNS44MjM5MDddIFIxMzogMDAw
MDAwMDAwMDAwMDAwMCBSMTQ6IDAwMDA3ZmY2YjgyMWFlZTggUjE1OiAwMDAwN2ZmNmI4MjFh
ZjAwClsgIDIwNS44MjM5MTJdICA8L1RBU0s+ClsgIDIwNS44MjM5MTNdIC0tLVsgZW5kIHRy
YWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQpbICAyMTMuOTExNTAzXSBORVQ6IFVucmVnaXN0
ZXJlZCBQRl9ORVRST00gcHJvdG9jb2wgZmFtaWx5ClsgIDIxNi4wNTE0OTNdIE5FVDogVW5y
ZWdpc3RlcmVkIFBGX1JPU0UgcHJvdG9jb2wgZmFtaWx5ClsgIDIxOC40MzU0NjRdIE5FVDog
VW5yZWdpc3RlcmVkIFBGX0FYMjUgcHJvdG9jb2wgZmFtaWx5ClsgIDI1NC41OTEyMDZdIE5F
VDogUmVnaXN0ZXJlZCBQRl9BWDI1IHByb3RvY29sIGZhbWlseQpbICAyNTQuNjE2NTIzXSBO
RVQ6IFJlZ2lzdGVyZWQgUEZfUk9TRSBwcm90b2NvbCBmYW1pbHkKWyAgMjYyLjkzOTM2NV0g
TkVUOiBVbnJlZ2lzdGVyZWQgUEZfUk9TRSBwcm90b2NvbCBmYW1pbHkKWyAgMjY1LjMyMzM1
NV0gTkVUOiBVbnJlZ2lzdGVyZWQgUEZfQVgyNSBwcm90b2NvbCBmYW1pbHkKWyAgMjc1LjM5
OTc5NF0gTkVUOiBSZWdpc3RlcmVkIFBGX0FYMjUgcHJvdG9jb2wgZmFtaWx5ClsgIDI3NS40
MDM4MzRdIG1raXNzOiBBWC4yNSBNdWx0aWtpc3MsIEhhbnMgQWxiYXMgUEUxQVlYClsgIDI3
NS40MDQ2MDBdIG1raXNzOiBheDA6IGNyYyBtb2RlIGlzIGF1dG8uClsgIDI3NS40MDQ3NTdd
IElQdjY6IEFERFJDT05GKE5FVERFVl9DSEFOR0UpOiBheDA6IGxpbmsgYmVjb21lcyByZWFk
eQpbICAyNzcuNDM5MzE0XSBORVQ6IFJlZ2lzdGVyZWQgUEZfTkVUUk9NIHByb3RvY29sIGZh
bWlseQpbICAyNzkuNTQ1NDQ4XSBORVQ6IFJlZ2lzdGVyZWQgUEZfUk9TRSBwcm90b2NvbCBm
YW1pbHkKWyAgMjg1LjU1NTM2NF0gbWtpc3M6IGF4MDogVHJ5aW5nIGNyYy1zbWFjawpbICAy
ODUuNTU1NDg1XSBta2lzczogYXgwOiBUcnlpbmcgY3JjLWZsZXhuZXQKWzE3NzUwLjUxNDQz
MF0ga2F1ZGl0ZF9wcmludGtfc2tiOiAxNiBjYWxsYmFja3Mgc3VwcHJlc3NlZAoK

--------------dl132MwUT8hB4I7T8hDR0oJH--
