Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 041AB4CECFF
	for <lists+linux-hams@lfdr.de>; Sun,  6 Mar 2022 19:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbiCFSCk (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 6 Mar 2022 13:02:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbiCFSCj (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 6 Mar 2022 13:02:39 -0500
Received: from mail.blackspace.at (ham.blackspace.at [78.46.20.155])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1A1FB3EF37
        for <linux-hams@vger.kernel.org>; Sun,  6 Mar 2022 10:01:46 -0800 (PST)
Received: from [192.168.43.232] (84-20-185-171.static.highway.a1.net [84.20.185.171])
        by mail.blackspace.at (Postfix) with ESMTPSA id 206101F72050;
        Sun,  6 Mar 2022 19:01:45 +0100 (CET)
Message-ID: <5d2ac637-5fff-b91d-9d34-6e0ce4d7fdba@blackspace.at>
Date:   Sun, 6 Mar 2022 19:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Kernel freeze on killall kissattach
Content-Language: en-US
To:     David Ranch <linux-hams@trinnet.net>, linux-hams@vger.kernel.org
References: <e037cff4-87fa-ce95-438d-66be0754c6b2@blackspace.at>
 <ca12cec2-3301-2926-f04a-cf8103af72e8@trinnet.net>
From:   Roland Schwarz <roland.schwarz@blackspace.at>
In-Reply-To: <ca12cec2-3301-2926-f04a-cf8103af72e8@trinnet.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AL1mJSTfL1V0z64lJmCZKkTu"
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_05,KHOP_HELO_FCRDNS,
        NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AL1mJSTfL1V0z64lJmCZKkTu
Content-Type: multipart/mixed; boundary="------------40oN0rhJCnT5dHPKJDliBy5t";
 protected-headers="v1"
From: Roland Schwarz <roland.schwarz@blackspace.at>
To: David Ranch <linux-hams@trinnet.net>, linux-hams@vger.kernel.org
Message-ID: <5d2ac637-5fff-b91d-9d34-6e0ce4d7fdba@blackspace.at>
Subject: Re: Kernel freeze on killall kissattach
References: <e037cff4-87fa-ce95-438d-66be0754c6b2@blackspace.at>
 <ca12cec2-3301-2926-f04a-cf8103af72e8@trinnet.net>
In-Reply-To: <ca12cec2-3301-2926-f04a-cf8103af72e8@trinnet.net>

--------------40oN0rhJCnT5dHPKJDliBy5t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgRGF2aWQsDQoNCkFtIDA2LjAzLjIyIHVtIDE4OjE0IHNjaHJpZWIgRGF2aWQgUmFuY2g6
DQo+IFlvdSdyZSBjb3JyZWN0LCBhIExpbnV4IG1hY2hpbmUgc2hvdWxkIG5ldmVyIGNyYXNo
LsKgIFdvdWxkIGl0IGJlIA0KPiBwb3NzaWJsZSBmb3IgeW91IHRvIHRha2UgYSBzY3JlZW4g
Y2FwdHVyZSBvZiB0aGUgQ09OU09MRSBzY3JlZW4gb2YgdGhlIA0KPiBtYWNoaW5lIHlvdSBr
aWxsIGtpc3NhdHRhY2ggb24/ICANCg0KVW5mb3J0dW5hdGVseSBub3QuIEFzIEkgc2FpZCBJ
IGFtIHJ1bm5pbmcgdGhlIHRlc3QgaW4gYSB2aXJ0dWFsIG1hY2hpbmUuIA0KSSBoYXZlIG9w
ZW4gdHdvIHNzaCBzZXNzaW9uIHRvIHRoZSBtYWNoaW5lIGFuZCB0aGUgY29uc29sZSB2aWV3
Lg0KDQpXaGVuIEkga2lsbCBraXNzYXRhY2ggZnJvbSB3aXRoaW4gb25lIG9mIHRoZSBzc2gg
c2Vzc2lvbnMgdGhlIGNvbXBsZXRlIA0KVk0gZnJlZXplcyB3aXRob3V0IGV2ZW4gcHJpbnRp
bmcgYW55dGhpbmcgb24gdGhlIGNvbnNvbGUgdmlldy4gSSBndWVzcyANCnRoaXMgbWlnaHQg
YmUgZGlmZmVyZW50IG9uIHJlYWwgaGFyZHdhcmUgd2hpY2ggSSB3b3VsZCBuZWVkIHRvIHBy
ZXBhcmUuDQoNCkkgaG9wZSBJIGRpZCBub3QgbWlzdW5kZXJzdGFuZCB5b3UsIGlmIHNvIHBs
ZWFzZSB0cnkgdG8gcmVwaHJhc2UuDQoNCnZ5IDczIGRlIFJvbGFuZCBvZTFyc2ENCg0KLS0g
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCiAgIF8gIF8g
IHwgUm9sYW5kIFNjaHdhcnoNCiAgfF8pKF8gIHwNCiAgfCBcX18pIHwgbWFpbHRvOnJvbGFu
ZC5zY2h3YXJ6QGJsYWNrc3BhY2UuYXQNCl9fX19fX19ffCBodHRwOi8vd3d3LmJsYWNrc3Bh
Y2UuYXQNCg==

--------------40oN0rhJCnT5dHPKJDliBy5t--

--------------AL1mJSTfL1V0z64lJmCZKkTu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELmDUtkkUQD99pU+KklFj+hFsiUgFAmIk9wcFAwAAAAAACgkQklFj+hFsiUii
zhAAhYVHCGwk/LAhrOUeHJI20TMvBHYDvemSNYjPM0asxHUaZ3OQZPu06/q6Hz8k3x8MMIgAj5NA
epqz5JzPq51Ac0yUwsqbPRrl1S+g5ffG2fMi7OSOUSsDBPDadi8Ya0XQJyVZp253Dxj1eND+08j9
yZEd5qgj8tm2Z+/ntA9cOZQ1/qrgN8zL2ZzvxAtZEQ8UIWI0P45oXyNll4ODupW86jdQTCURdG6b
5nIgDeSqCHJmXS3XfhNPIpHWI8rJ1kYuW93thZy0GotXUCwHJ3m0LSK599C105rcHYzSps9QTYLt
N5uZXBWmuIgUHSqpYqOXeihPEFiFTjqI11ou5/PX3S1aidoksZkPZF+p5mgVAKMUPY6rmr1dYYLi
4Ke3JEfOhYOp/BktOjBProFQtIvmzCKqIje/oHM478xucl2kj5KCOUpHDrxKm45NFomwKAsdLpsA
mxuj96+pZNwK73YjuZ/0LF7LfsVMJMSR/502dbilepok7T2GnXEkn/IvHleqiJwhyoedRuE5n5CP
20Cm2hdI/FXCcqcT3Kg5Qyp3wus96oa5MxcX3y5nIO+FrDeKHGVKvtWvOm259rx21owdIMSUYk1v
eo0F66sWNyPmD5dfrf6tYeRBsoJM6+nx5m0kzCHgNNTH6CApyhJr3dV8wz+2MT/nRxTxeGVrh64b
mxQ=
=bR1y
-----END PGP SIGNATURE-----

--------------AL1mJSTfL1V0z64lJmCZKkTu--
