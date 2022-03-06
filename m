Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAEC74CEBE2
	for <lists+linux-hams@lfdr.de>; Sun,  6 Mar 2022 15:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbiCFOYM (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 6 Mar 2022 09:24:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiCFOYL (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 6 Mar 2022 09:24:11 -0500
X-Greylist: delayed 302 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 06 Mar 2022 06:23:18 PST
Received: from mail.blackspace.at (ham.blackspace.at [78.46.20.155])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D18AF49C99
        for <linux-hams@vger.kernel.org>; Sun,  6 Mar 2022 06:23:18 -0800 (PST)
Received: from [192.168.43.232] (84-20-185-171.static.highway.a1.net [84.20.185.171])
        by mail.blackspace.at (Postfix) with ESMTPSA id 86E2D1F72050
        for <linux-hams@vger.kernel.org>; Sun,  6 Mar 2022 15:18:15 +0100 (CET)
Message-ID: <e037cff4-87fa-ce95-438d-66be0754c6b2@blackspace.at>
Date:   Sun, 6 Mar 2022 15:18:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From:   Roland Schwarz <roland.schwarz@blackspace.at>
To:     linux-hams@vger.kernel.org
Subject: Kernel freeze on killall kissattach
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------x3QazEQYJmm5xqj5GHTRpUCv"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------x3QazEQYJmm5xqj5GHTRpUCv
Content-Type: multipart/mixed; boundary="------------H0kwL4I6S8TAVjHbZ77qfYzz";
 protected-headers="v1"
From: Roland Schwarz <roland.schwarz@blackspace.at>
To: linux-hams@vger.kernel.org
Message-ID: <e037cff4-87fa-ce95-438d-66be0754c6b2@blackspace.at>
Subject: Kernel freeze on killall kissattach

--------------H0kwL4I6S8TAVjHbZ77qfYzz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

RGVhciBBbGwsDQoNCnBsZWFzZSBjb3JyZWN0IG1lIGlmIEkgYW0gd3JvbmcsIGJ1dCBhcyBJ
IHVuZGVyc3RhbmQgaXQgc2hvdWxkIG5vdCBiZSANCnBvc3NpYmxlIHRvIHRyaWdnZXIgYSBr
ZXJuZWwgZnJlZXplIGJ5IGp1c3Qga2lsbGluZyB1c2VyIHNwYWNlIHByb2Nlc3Nlcy4NCg0K
V2hpbGUgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgYSBjZXJ0YWluIGJlaGF2aW9yIG9mIHRoZSBh
eDI1IGRyaXZlciBJIGNhbWUgDQp1cCB3aXRoIGEgc21hbGwgdGVzdCBjYXNlIHdoaWNoIEkg
cmFuIGluIGEgdmlydHVhbCBtYWNoaW5lIChLVk0pOg0KDQpGaXJzdCBJIHRyaWVkIHdpdGgg
YSBrZXJuZWwgZnJvbSBMaW51cyB0cmVlOg0KDQp1bmFtZSAtcg0KNS4xNy4wLXJjNisNCg0K
Y2F0IC9ldGMvYXgyNS9heHBvcnRzDQpheDAgICAgIE9FMVJTQS0wICAgICAgICAxMTUyMDAg
IDI1NSAgICAgNyAgICAgICBUZXN0IEENCmF4MSAgICAgT0UxUlNBLTEgICAgICAgIDExNTIw
MCAgMjU1ICAgICA3ICAgICAgIFRlc3QgQg0KDQpzdWRvIGtpc3NhdHRhY2ggL2Rldi9wdG14
IGF4MA0KQVguMjUgcG9ydCBheDAgYm91bmQgdG8gZGV2aWNlIGF4MA0KQXdhaXRpbmcgY2xp
ZW50IGNvbm5lY3RzIG9uDQovZGV2L3B0cy8xDQoNCnN1ZG8ga2lzc2F0dGFjaCAvZGV2L3B0
cy8xIGF4MQ0KQVguMjUgcG9ydCBheDEgYm91bmQgdG8gZGV2aWNlIGF4MQ0KDQpheGNhbGwg
YXgxIE9FMVJTQS0wDQoNCk5vdyBpbiBhIHNlY29uZCB0ZXJtaW5hbDoNCnN1ZG8ga2lsbGFs
bCBraXNzYXR0YWNoDQoNCkZpcnN0IHRlcm1pbmFsOg0KR1c0UFRTIEFYLjI1IENvbm5lY3Qg
djEuMTENClRyeWluZy4uLg0KKioqIENvbm5lY3RlZCB0byBPRTFSU0EtMA0KKioqIENsZWFy
ZWQNCg0KPT0+IEJ1dDogS2VybmVsIGZyZWV6ZXMNCg0KSSBjYW4gc2VlIHRoaXMgYmVoYXZp
b3VyIGFsc28gaW4gdGhlIGRlYmlhbiBrZXJuZWw6DQoNCnVuYW1lIC1yDQo1LjEwLjAtMTEt
YW1kNjQNCg0KVGhpcyBrZXJuZWwgYWxzbyBmcmVlemVzLiBJIHN1c3BlY3QgdGhpcyB0byBi
ZSBhIGJ1ZyBiZWNhdXNlIGlmIEkgdHJ5IHRvIA0KcmVib290IHRoZSBtYWNoaW5lIGluc3Rl
YWQgb2YgdGhlIGtpbGxhbGwgY29tbWFuZCB0aGUgbWFjaGluZSBkb2VzIG5vdCANCnNodXQg
b2ZmIGFuZCByZWJvb3Qgd2hpY2ggaXMgYSBwcm9ibGVtIHdpdGggYSByZW1vdGVseSBpbnN0
YWxsZWQgc3lzdGVtLg0KDQpBbnkgaWRlYXM/DQoNCjczIGRlIFJvbGFuZCBvZTFyc2ENCg0K
LS0gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCiAgIF8g
IF8gIHwgUm9sYW5kIFNjaHdhcnoNCiAgfF8pKF8gIHwNCiAgfCBcX18pIHwgbWFpbHRvOnJv
bGFuZC5zY2h3YXJ6QGJsYWNrc3BhY2UuYXQNCl9fX19fX19ffCBodHRwOi8vd3d3LmJsYWNr
c3BhY2UuYXQNCg==

--------------H0kwL4I6S8TAVjHbZ77qfYzz--

--------------x3QazEQYJmm5xqj5GHTRpUCv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELmDUtkkUQD99pU+KklFj+hFsiUgFAmIkwqYFAwAAAAAACgkQklFj+hFsiUgi
xxAAqQK+EpoLCi7LN9B6g0cersCbluY8WZ6N7HqHav/hlrmw1SlRvcPwAxW0/Nu+WBe0XJ3yuGHC
518Zq8PRy1lDne+P8OxP7WmUFEptO/npEV6oleyH8clXbf2FE3WVeNTayecCElSS6q/LPThuZVFO
0iYzqZ2VefIoOSQ2icGOXdFi7JB+TKm4pRCQG3wOnj0G694QDVegfRmJk9GNjn8dHnlwfIVdeWGi
6mSsZenICtlR9VcGCOAdtrIf/hGl2Eg5O4D8sLyxiyN3woKlbBIOIW7T/eH3cpVAzBZ7oXErn/ha
IkvcBCNcs0S2gSdZP5NV0J5zcnobTs9BLH2l8b46DN+sFTDA5/FjkoK3MggxFzIKAZC9YR/wtoPL
fFMmgHQxxEzjM3vaIk2Yx8qaa8WWZAJs/Nzf6vuai+Taoi7B+V+rhjLp9SZKfu9pFVaWR4t+6pgN
Zt/R4gqtxH6SephkQ80ckZBCqxsgKO5GidJ1mh5BHJC9TQ4WJw8IzZO2T2Gosqp2V8vL70sT31fl
IReHrHMDxoo+qumM5ZK+01Wk0FfjCQUCUKis26aGQlVEXhwHMTcxzphleXUFHx8zlHulm6bnQulX
bPldAH+pxyAgfwSGiumk55/kQC8CtlFpbkcu4EFc96EVBCqnXcxr5+dzuidIsTJCE1UHcC7EG1Xz
W7s=
=+8Kb
-----END PGP SIGNATURE-----

--------------x3QazEQYJmm5xqj5GHTRpUCv--
