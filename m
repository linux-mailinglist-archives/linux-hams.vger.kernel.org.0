Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 919DC53132F
	for <lists+linux-hams@lfdr.de>; Mon, 23 May 2022 18:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238430AbiEWQQB (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 23 May 2022 12:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238644AbiEWQP5 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 23 May 2022 12:15:57 -0400
X-Greylist: delayed 605 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 23 May 2022 09:15:56 PDT
Received: from mail.blackspace.at (ham.blackspace.at [78.46.20.155])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6141765417
        for <linux-hams@vger.kernel.org>; Mon, 23 May 2022 09:15:56 -0700 (PDT)
Received: from [192.168.43.232] (84-20-185-171.static.highway.a1.net [84.20.185.171])
        by mail.blackspace.at (Postfix) with ESMTPSA id 9E5BA1F72050;
        Mon, 23 May 2022 18:05:49 +0200 (CEST)
Message-ID: <4e38f3dc-88f5-1df9-bdd4-f1d169d67439@blackspace.at>
Date:   Mon, 23 May 2022 18:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Regression in "ax25: Fix UAF bugs in ax25 timers", patch
 82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
Content-Language: en-US
To:     duoming@zju.edu.cn, Thomas Osterried <thomas@osterried.de>
Cc:     linux-hams@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Paolo Abeni <pabeni@redhat.com>
References: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
 <57922f90.2c358.180f13e25f0.Coremail.duoming@zju.edu.cn>
From:   Roland Schwarz <roland.schwarz@blackspace.at>
In-Reply-To: <57922f90.2c358.180f13e25f0.Coremail.duoming@zju.edu.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Uf91oRgz5St8N12q19b9RxvO"
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Uf91oRgz5St8N12q19b9RxvO
Content-Type: multipart/mixed; boundary="------------71kWKXCpi13D8CGaTO7baSl9";
 protected-headers="v1"
From: Roland Schwarz <roland.schwarz@blackspace.at>
To: duoming@zju.edu.cn, Thomas Osterried <thomas@osterried.de>
Cc: linux-hams@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Paolo Abeni <pabeni@redhat.com>
Message-ID: <4e38f3dc-88f5-1df9-bdd4-f1d169d67439@blackspace.at>
Subject: Re: Regression in "ax25: Fix UAF bugs in ax25 timers", patch
 82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
References: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
 <57922f90.2c358.180f13e25f0.Coremail.duoming@zju.edu.cn>
In-Reply-To: <57922f90.2c358.180f13e25f0.Coremail.duoming@zju.edu.cn>

--------------71kWKXCpi13D8CGaTO7baSl9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCk9uIDIzLjA1LjIyIGF0IDE2OjA3IHdyb3RlIGR1b21pbmdAemp1LmVkdS5jbjoNCi4u
Lj4NCj4gSXMgdGhlcmUgYW55IHdheXMgdG8gcmVwcm9kdWNlIHRoaXMgcHJvYmxlbT8NCj4g
DQoNCkFzIEkgdW5kZXJzdGFuZCBpdCwgdGhlIHN0dWNrIExJU1RFTiBzdGF0ZSBpcyB0aGUg
aW5mYW1vdXMgbG9uZy1zdGFuZGluZyANCiJzdHVjayBzb2NrZXRzIiBidWcgd2hpY2ggRGF2
ZSB3YXMgcG9pbnRpbmcgYXQgaW4gaGlzIG1haWwgIlN0YXR1cyBvZiANCnRoZSBzdHVjayBz
b2NrZXRzIGJ1Z3MiIGZyb20gMjAyMS0wNi0yOS4NCg0KNzMgZGUgUm9sYW5kDQotLSANCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KICAgXyAgXyAgfCBS
b2xhbmQgU2Nod2Fyeg0KICB8XykoXyAgfA0KICB8IFxfXykgfCBtYWlsdG86cm9sYW5kLnNj
aHdhcnpAYmxhY2tzcGFjZS5hdA0KX19fX19fX198IGh0dHA6Ly93d3cuYmxhY2tzcGFjZS5h
dA0K

--------------71kWKXCpi13D8CGaTO7baSl9--

--------------Uf91oRgz5St8N12q19b9RxvO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELmDUtkkUQD99pU+KklFj+hFsiUgFAmKLsNsFAwAAAAAACgkQklFj+hFsiUgx
Mw//YaEy3jD4ZXqYhkQY2uPoJ0i2ddhC+d+A2t4fzvgcnB5s/6ZdfX5wlzaw6J5CK0g7Pp6luGTc
e8/HqXYNPgdpKmjaSP7pYsTzhRuVHOFn/WlLgUDO2e4rVTv52ml6EBz39/IEuK1Jkdw34wrh4JCP
KmQL40poQBD0cBf8xwwQ0tsEyltqU3wW9LOClSN6wyWMBuBzDuLse2Wrc/gELBLdKV+D04PVNx1a
H933ix3sU1JYkpkQmUFY5sR/ypnYQsiHEnYGo3ZywT/nk7O4MSVJaKNaywmPKva9NqI1i4uV/4gc
uJXNFINEsoCMjYDxyyNVtWZMuqLD62niUflPzT4MZqO6CVtKCAw9+F+FdTeLQK5DuYnJkd+OmWTj
mEnkKtXza6Wh8iiu43eLnZY0XHK01eoFjxvneQUxM7N+qWjlFBGPwP8Uu0u+MmKsAz7pHs9/aOml
3jsmLZ5Ute+jQITd2a1YXYv5cUj+gd+1O8x3L/Fg62nEXr/TLIIJuWVv7CJs5PkLHoNmt/vwMLtf
QBSrItx3XpzDvwxzePwC75vepNzjuChvOKJWjJT0xscyAP0kyOcSMOF8iVN2Oi5cqLVspcSvsJiI
9DUBGjwOD1665QIYyU8XT3TXxXbDGhkSr3PmIZAmgimy4kny/JWYYgP6huqhVWY+veKVIj3HTN10
wvU=
=Lep0
-----END PGP SIGNATURE-----

--------------Uf91oRgz5St8N12q19b9RxvO--
