Return-Path: <linux-hams+bounces-388-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C5394B722
	for <lists+linux-hams@lfdr.de>; Thu,  8 Aug 2024 09:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10FB22822DA
	for <lists+linux-hams@lfdr.de>; Thu,  8 Aug 2024 07:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424B0187FE2;
	Thu,  8 Aug 2024 07:08:15 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mailbnc214.isp.belgacom.be (mailbnc214.isp.belgacom.be [195.238.22.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043127464
	for <linux-hams@vger.kernel.org>; Thu,  8 Aug 2024 07:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.238.22.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723100895; cv=none; b=stVfQtGLZZm0DuxvcTXQQQZ+x2kMqe5SGJcRFghIdRjQFd+rL/GCsTv2DjQu0HubYB+5moRzBs7tzLZ6NEcgoDJyWAX1gJhmW4U3QmsUjxu84Z7L2U+YLzOfww4DgfU4KqWPoS8UQw+hXKVtrpRJAQfvkMnTlCCD9YwLSnFNgrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723100895; c=relaxed/simple;
	bh=lumhnArBc3EFAx/IsrjCIY1E6+YhsinF4QhRz2+MR0A=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=VqO+XxCdEwSKtxAsgbrSvdtXi8NwpG87ZJowJYFJcKZoRSbYt2DVXDMgHdA97jp7nSTqhxMopwrNLvkhj1ZtxbIHRaq5k5kgt3MdFwI8I/9nEY6dXbO+mGM/o0yv5/t/bUoGn1JYpng1YB0NF9/6EcFSA4EWcutW1y2T1s4CtTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skypro.be; spf=pass smtp.mailfrom=skypro.be; arc=none smtp.client-ip=195.238.22.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skypro.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skypro.be
X-CSE-ConnectionGUID: 8oSP3QiYTai/pvIWCqoGYw==
X-CSE-MsgGUID: FVQeJGxUQlGaWkI474PKlQ==
X-ExtLoop: 1
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2H3AwAubrRm/6DAsi4NTRwBAQE8AQEEBAEBAgEJAQEBA?=
 =?us-ascii?q?QcBARKBRgKJeZYskwGGVoF+CAcBAQEBAQEBAQEEBRQTHQQBAYUeiT4nNAkOA?=
 =?us-ascii?q?QIEAQEBAQMCAwEBAQEBAQEBBgEBAQUBAQEBAQEGBAEBAQKBHYUvgzODfDN0A?=
 =?us-ascii?q?QI8AgRvAQGCfAGvUnqBMoEBhHvZNoFcEIFIAYFWhmgLASiBMAICfod/NQ2BS?=
 =?us-ascii?q?EWBFScLiEaDDoJpBJIci3gmkTuBaQNZIQIRAVUTFwsJBSYKNohjhUeEF4FKg?=
 =?us-ascii?q?2SBZwxhiWKBPoEpNYNBS4VdgQGCWXRWKR1AAgELbT01CQsbBqIOLoEQgT4ED?=
 =?us-ascii?q?s4OPIQfgW+CEIJbgy+XNQYPBC+HI6Mdi2iNB6kWgWeCFk0gGIMjUSiNdgHPc?=
 =?us-ascii?q?IExAgcLAQEDCYwkgUsBAQ?=
IronPort-PHdr: A9a23:5NNASBVW8P1lBSd+xRnX/0AQNU7V8Kw1VTF92vMcY1JmTK2v8tzYM
 VDF4r011RmVBt2duqsP0rOK+4nbGkU+or+5+EgYd5JNUxJXwe43pCcHROOjNwjQAcWuURYHG
 t9fXkRu5XCxPBsdMs//Y1rPvi/6tmZKSV3wOgVvO+v6BJPZgdip2OCu4Z3TZBhDiCagbb9oI
 xi7oxndutMSjId/Jao91wbFr3RVcOlK2G1kIk6ekBn76sqs5pBo7j5eu+gm985OUKX6e7o3Q
 LlFBzk4MG47+dPmuwDbQQWA/nUTXXwanwRHDQbY9B31UYv/vSX8tupmxSmVJtb2QqwuWTSj9
 KhkVhnlgzoaOjEj8WHXjstwjL9HoB+kuhdyzZLYbJ2TOfFjeK7WYNEUSndbXstJVCJPDIyzY
 IURAeQBIOhXs5Lwp1QSoRakHwSgGP3jxz1Oi3Tr3aM6yeMhEQTe0QIlBdIOsW/UrMnyNKccX
 +C+0a7FzTbZb/NXwjf99I/Ich4vofyXRrJwcsrQyVE1FwPClFmfspLqMiqT2+8QvGeV8/BuW
 vizi247tQ5xuD6vy98ihITGmo4bxFDJ+DtnzYs7JtC1Rk12bcK5HJZeuSyXNZd7T8ImTm9mu
 Cs0xKMKt5GmcSQXx5kpyALSZuGbfoWV5B/oSeWfIS9giX9qeb+znQu+/Eqjx+HmS8W51EhGo
 jBYntTNqnwA0QHY5NKdRftn5Eih3C6C1wXU6u5ZP085jbHbK5s9wr4okZoTrFjDEjf2mEroi
 K+WcV0p9ey15+njfLnqvIKQOo53hw3kPakjldazDfo3PwcIR2Sb+OK826P//UDhT7hHj+c6n
 rTbvZ3ZP8gXu6q0DxFP3oo+6huzEy+q0NECknkGKFJFdgiHj4/sO1zWI/D4F/a/g0+wkDdsy
 fDGMKbsAo7OLnnDiLfhZ7F951RHxwUt1dxf4YlbBakbIP3vQk/xqMDYDhghPgCp2+rnEsly1
 psCWWKTBa+UKKfSsV6O5uIyLOiAfY8Vtyz4K/g+/PPuk3A5lkEHfaWz3psYdmq4HvJ4LEWde
 3bshc0BEWgSsgUjT+zqiViCXCZLaXi9Ua0y+C01BZ6gA4vbXYCtmLKB0T+jEJNPfm5IBUiAE
 Wzwd4WKQ/gMaDydIstmkjEcTbavUpcv2x79/DP9nr5mKPfEvy0RsInLytd4/avQmAs0+DgyC
 N6SgE+XSGQhvXkJXCMx0q439U9ny0yf1qZ2q+dbBMRJ4LVDX1FpZtbn0+VmBoWqCUr6ddCTR
 QP+Kug=
IronPort-Data: A9a23:fONaY6+9HymzAP6vfQzJDrUD3n6TJUtcMsCJ2f8bNWPdYAuX4ASz/
 BJgGTzYWojqDWK9Cqh/HY6x8k8GvJCjz9dlTBw97noFoxli85SeWNjCcxqsYC2fJJOfFRs/t
 pgQNYPKJps5RyGErx6gP+a+9CYh3vGEF+f1UbeUYXp6GwY6Qiws0Bk6xeNg3OaE7TTB7yal4
 Lse9OWEYQT5s9INDl8p107qRXMGUJ7anysVuGQRXcdQvVDYnmUIFp9ZLLq6R5eTathZELWzG
 +iSlbqyoTiE9k59Vt77yrrwIxBWHObcYwTUhCMPAvCu00AZ+yc4jfgwOaZCY0lahjiDzt19m
 dlB5cPYpWvFRkHpsL11v05wQ30mVUE/xIL6HJSfjSCy50OYLSLmmvk3VU9rZ9JFo70sCjhA+
 fdAcjlTN02I2Oy8nOvrG+Jhr/p4IZiwNuvzmJ3AIRI1rBoCacqeK0kfzYYFhF/cvugXQLCGI
 ZNfMWE3BPj5S0UnEk8ND54jl/ufiHD6cjlJwHqYvqNfD1L7lWSd65CzdoKEEjC2bZ8NxBrA9
 jqWpz2R7iwybbRz9xLUqhpAuceSxUsXaKpKfJWk+/hjhkGkx2B7IHX6gnPi/JFVImbnMz5uA
 xR8FhgG9MDex2TyJjXJZCBUlVbf1vIqc4MOTLJlsljTokbjy13x6mAsFlatYTG93SM8bWRCO
 lShx7sFCdHz2VE8pL30Grq89FuP1SYpwWAqNSg/dVA84ujfqYB0lgzucf16F4GEkYigcd3w6
 2jiQCkWtOxC14hSifX9oQyB2W6ZznTLZlJroFyIDiT8v1k/PdD9D2CrwQGzAfJoL5yYVUWGs
 nYsgMuP9PoJS5uA/MCIaLhRQO7yt6raWNHaqXBRJpQD2CSQwnqMdL9TwW0heH9KNv9RLFcFZ
 2eW42u9/qR7OHqscL8yY4u0EOw0wqX6U9foTPbZapxJeJcZSeOc1HgwPQvJjjqoyRd81P1hf
 5Kce8eoAHccFal9yjeqAf8H1q8qwz0lg2neLXzm8ymaPXOlTCb9Yd843JGmMrxRAH+syOkez
 zqT2wZmBfmSvC0SrxQ7KbIuEG0=
IronPort-HdrOrdr: A9a23:dZipF6lRQEhbD6CZM338cthF58DpDfNrimdD5ihNYBxZY6Wkfp
 iV7ZEmPH/P+UkssQIb6LS90ci7MAvhHPFOkOos1NuZMDUO21HYV72Kj7GSoQEIcheWnoU2uJ
 uIGJIRNDSENzhHZLHBgTVQfexO/PC3tIqPos3/9ldECTtyY6VP0y9DJ0K3FEl/RA4uP+tFKL
 OsouBggBCBQFQ+Kv6jDn0qY8D5ipnsiI/pZx4ACVoM7QGVl1qTmcDHOind9DE4eRN34Z9ny3
 HMlyLEzp6P99em1xHb12jcq7hImNbszdFObfb8+/Q9G3HHrCGDRL1Ac/m5pTgwjt2G03tvrM
 PBuBApO8gb0QKsQol9yyGdqDUImwxejEMKgWXo50cL9vaJPg7T+qB69PJkmnyw0TtTgDhT6t
 Mz416k
X-Talos-CUID: 9a23:GOhzbGP2HP5OP+5DCC5czBUtG/EZe3ya1GnxHGShDklYV+jA
X-Talos-MUID: 9a23:HDngcwje/U7uV3L46RBG08MpGvlR7oaBGH00lboPhMqlaXMsAxSZtWHi
X-IronPort-Anti-Spam-Filtered: true
Received: from 160-192-178-46.mobileinternet.proximus.be (HELO [192.168.44.24]) ([46.178.192.160])
  by relay.proximus.be with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 09:06:44 +0200
Message-ID: <0ea34aa4-d9cd-4c0e-9115-c8e68f02eae5@skypro.be>
Date: Thu, 8 Aug 2024 09:06:40 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-hams@vger.kernel.org
Content-Language: nl
From: Kristoff <kristoff@skypro.be>
Subject: source-code aprs
Autocrypt: addr=kristoff@skypro.be; keydata=
 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
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xuWU09E5f01AV3xeO0poEmsx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xuWU09E5f01AV3xeO0poEmsx
Content-Type: multipart/mixed; boundary="------------GK0mZyLh0T0l3TkxF8YlbHew";
 protected-headers="v1"
From: Kristoff <kristoff@skypro.be>
To: linux-hams@vger.kernel.org
Message-ID: <0ea34aa4-d9cd-4c0e-9115-c8e68f02eae5@skypro.be>
Subject: source-code aprs

--------------GK0mZyLh0T0l3TkxF8YlbHew
Content-Type: multipart/mixed; boundary="------------UMQkDsh23HJkKnvj4Hw2Ibce"

--------------UMQkDsh23HJkKnvj4Hw2Ibce
Content-Type: multipart/alternative;
 boundary="------------j0HtFE4imj4DF0e5AznA19h4"

--------------j0HtFE4imj4DF0e5AznA19h4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQoNCkkgYW0gbG9va2luZyBmb3Igc291cmNlLWNvZGUgKEMgb3IgQysrKSB0
byBpbXBsZW1lbnQgQVBSUyAoQVBSUywgQVgyNSANCmFuZCBtaWNFKSBmb3IgYW4gZW1iZWRk
ZWQgZGV2aWNlLg0KDQpXaGF0IHdvdWxkIGJlIHRoZSBiZXN0IHNvdXJjZSBmb3IgdGhhdD8N
Cg0KSXMgdGhlcmUgInJlZmVyZW5jZS1jb2RlIiBmb3IgdGhpcz8NCg0KDQoNCkNoZWVyaW8h
IEtyLiBCb25uZSAoT04xQVJGKQ0KDQo=
--------------j0HtFE4imj4DF0e5AznA19h4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi all,<br>
      <br>
      <br>
      I am looking for source-code (C or C++) to implement APRS (APRS,
      AX25 and micE) for an embedded device.<br>
      <br>
      What would be the best source for that?<br>
      <br>
      Is there "reference-code" for this?<br>
      <br>
      <br>
      <br>
      Cheerio! Kr. Bonne (ON1ARF)<br>
    </p>
  </body>
</html>

--------------j0HtFE4imj4DF0e5AznA19h4--

--------------UMQkDsh23HJkKnvj4Hw2Ibce
Content-Type: application/pgp-keys; name="OpenPGP_0xAA9E3775056F1164.asc"
Content-Disposition: attachment; filename="OpenPGP_0xAA9E3775056F1164.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D=3D
=3DjlEl
-----END PGP PUBLIC KEY BLOCK-----

--------------UMQkDsh23HJkKnvj4Hw2Ibce--

--------------GK0mZyLh0T0l3TkxF8YlbHew--

--------------xuWU09E5f01AV3xeO0poEmsx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE3+PL19VExLoYeq3Iqp43dQVvEWQFAma0boAFAwAAAAAACgkQqp43dQVvEWSJ
qA//SVAQFm16r1zcDSAOi7AgAXfiBlQYOsNPJBWDEg1O2HbCR0SwxbsvYkb5JqW1Z9nHonM284Fq
Kep80SCpdC/vHNB3vhwhKnMeCOfUWYpX+z4zfPmcNsC7Xsek1psTTmdaMwVWBcE0x+Ni8hTy17Im
Hxuzrf76ysrw4uHAsm+ROMScrU5jrooOZLzZo8bLqSSEIKPmRAcsdP2SLfS74tUDisOTDZFLkEXU
677v92fu1+mcTz6+jEGVa95KC7hWMHot/teGBB0d5L19KKSunkiOrJ7zkzlpmkoarnyIJBELNHmN
H2ZYgNI3OPUF1RrGrY3VEpc/KyZHEylR0T8lWbZXNqUN6xSQ9nQO1ybn0AfNmKbdk6PdvNp5q7SQ
b2DjHzFqhuTgtU+S84rX5kSB6rgvnfbJ5aeDeyPRwEzlsvQRP2HVEn8GbHi4XC58tnK/W8Wyu+eb
kwglfOhhkwLGxdlExpKFRccKBnQ4vNgxUT0GW1nbxnhV4M+PJbsM+hdhliDjPUetOVuJD2QpBCEg
TWEKMQlgBUnLMHsqIWc9d5VgO1TyiFNV8HbbA88d4nUFtAybkaAufQM0qgYO7WoPl8hRL4l82X2k
iWPG/mnGGQBBz4x+Hjyw2jjQ3U2OziaCcXnABuH+CM47vxGEPsSXbvpFBSohRA3TRBJfDMCiBNJr
p/s=
=84Jt
-----END PGP SIGNATURE-----

--------------xuWU09E5f01AV3xeO0poEmsx--

