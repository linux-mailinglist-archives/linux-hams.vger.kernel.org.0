Return-Path: <linux-hams+bounces-397-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A094C950271
	for <lists+linux-hams@lfdr.de>; Tue, 13 Aug 2024 12:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C026F1C20BA4
	for <lists+linux-hams@lfdr.de>; Tue, 13 Aug 2024 10:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763ED189918;
	Tue, 13 Aug 2024 10:27:29 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mailsec113.isp.belgacom.be (mailsec113.isp.belgacom.be [195.238.20.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A1C17BB19
	for <linux-hams@vger.kernel.org>; Tue, 13 Aug 2024 10:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.238.20.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723544849; cv=none; b=Cpk998WIjnaQuaK6BNji2hc6CKGptM6zwmxRmZBn8fG1MPrjoI2LtK1NEgsva60iFwAFCKUSR/ghSrME2vR6T59B9ntVxE+dRmHmKbN0K5K3EpSq5uhfrA27iATjOnO0yq9OFMDCAVbMKZvlCSGBBGoYOpSDlc3Ix1+MxNAzgZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723544849; c=relaxed/simple;
	bh=bIzlctcS0Nyq0Sw8ovfHKCqow457zg4Kn7WyVRrIWw4=;
	h=Message-ID:Date:MIME-Version:From:To:References:Subject:
	 In-Reply-To:Content-Type; b=emsv+oinjqQ7Roc3TZoWjiLhOZYqnjSJb7mBYbJ9QTmg0KXtXDGiX2vFZGjZqHEgTbTR809ll2orF26dkdtqm/zCh/VBfidE588BlmVLVJLNFM6u60POW5/JQcdvQMpB3tct9jc3jDag8wMr3C+u3r/B1PyTZdUhNbNxYiSfr38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skypro.be; spf=pass smtp.mailfrom=skypro.be; arc=none smtp.client-ip=195.238.20.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skypro.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skypro.be
X-CSE-ConnectionGUID: rv9mAAVMQaWyuqb1F/1Tgw==
X-CSE-MsgGUID: b5ofiYWEQcC8ZzzQG9U/Gg==
X-ExtLoop: 1
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2GpAQDRM7tm/yDpjG0NTR4BPAwOCxKBRol7kUIthD6Nb?=
 =?us-ascii?q?IUVhlaBfggHAQEBAQEBAQEBBAVEBAEBhQYCFolPJzQJDgECBAEBAQEDAgMBA?=
 =?us-ascii?q?QEBAQEBAQYBAQEFAQEBAQEBBgQBAQECgR2FL4MvhAYCAQMjZg8JNQICAlQbA?=
 =?us-ascii?q?QEVgmcBsF16gTIaZ4R72TaBXBCBSIFYEoZWCwEqgTACAoh9NQ2BSEWBFSeLX?=
 =?us-ascii?q?4JpBIZYiDuDAYIRCQgWgRiHKHwjAk2JGYkJgWkDWSECEQFVExcLCQVmiFuFP?=
 =?us-ascii?q?4QXNoESg1+BZwlhiVyBPoEpNYM+S4VbgQOCWXROPwINAjeBOB1AAgELbT01C?=
 =?us-ascii?q?QsbBqMMLYEQgUYEDoVVFIELFk0BlAidZZRQPIQegW+CEIJbgy+XNQYPBC+HI?=
 =?us-ascii?q?5BDA5JYk22FAqkYgWeCFk0gGDuCaFGOUgMWz3mBMQIHCwEBAwmLHYFLAQE?=
IronPort-PHdr: A9a23:LM/PihNyDqUps3prkZ4l6nbKDRdPi9zP1u491JMrhvp0f7i5+Ny6Z
 QqDvq0r1QeTFt+Go9t/yMPo8InYEVQa5piAtH1QOLdtbDQizegwoUkLLfXBN3fGKuX3ZTcxB
 sVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBxrwKxd+KPjrFY7OlcS30P2594HObwlSizewb69+I
 A+roQnNqMUajpVuJ6YswRbVv3VEfPhbymxvKV+PhRj3+92+/IRk8yReuvIh89BPXKDndKkmT
 rJWESorPXkt6MPkrRfMQhKD62UTXGsLihZHDBTL4x/8Xpfqryv1rfF91zWAPc33Vr87RzKv5
 Lp2RRDyiScHMzk58HzLisF1kalWrg6tqwB5zoXJZoyeKfhwcb7Hfd4CRmRPUMleWCJBDI2iY
 YsBEugOMvpDoonyu1cDtwGzCRWyCO7tzDJDm3/43bc90+QkCQzI2RYgH9MVsHTIq9X1OqkSW
 v2ywanL1zXDbuhW2Sv66IjGfBAsuuqMXbFwcMrJ00kvEBnJgU6OpoH8OT6ey+sCvXSB4eV6S
 eKvl3Aoqxt3ojW3yMkhjo3Ei4wVx17L+ih3z4Q4KcGkREJnbtCqHpldujyVOoZ3Xs4uX2Blt
 Do7x7AJpZK1czUHxYk5yhLDdvCKcI6F6Q/gWuaJOTp0mW5pdbalixqv/kWs1vfwWte63VtEt
 CZInMfAu3YQ3BLJ8MeHUOFy/kK51DaK0ADc9/9LLFgvlareN54h2rkwlocPsUjbHi/5hkH2j
 KiOe0og5+Sl7/rrbq/7qpKdNIJ4kALzPro0lsCiHeg1MA4BU3Ca+eS6yrLj4VX0TKhWgvAyi
 KXVrZ/XKdgBqqKnDQJY3Jwv5hihAzu+1dQXh3gHLFZLeBKdiIjpPknDIPPiDfe+mFSsjDBrx
 /7IPrD6GZXNLXjCkK/7fbZ68UJT0xQ8wchZ551PEr4BOu78WlfttNzECR80KxG4z/79CNphz
 oMeRX6PAqiBPaPWsF+I4P8vIuaVaI8Vojn9LuMl6uXwjX82h1AdZ7Ol3ZgJZ3CiGPRpPUGZb
 WDrgtcbHmcGphcxTO/riF2HSTNdf3m8UKwi6D8nFI+oC5/PRpu1gLyPxCq1BoRYaHhJBFyUC
 nfob4uEVO8MaC2MJs9hlSQJW6C4RYE52h/9/DP9nr5mKPfEvy0RsInLytd4/avQmAs0+DgyC
 N6SgE+XSGQhvXkJXCMx0q439U9ny0yf1qZ2q+dbBMRJ4LVDX1FpZtbn0+VmBoWqCUr6ddCTR
 QP+Kug=
IronPort-Data: A9a23:OngUMKBRd+iZUxVW/23jw5YqxClBgxIJ4kV8jC+esDeIYAhSqHVSk
 AJoOQaGco77axf2fN5zaIiwg0sHv5LLn5UweLZf3SszFC9G8peYWYuXI02uY3rLdpSeQh095
 c9FZ9CedMk9Q3KC+U7yb7OxoSgh3PjRFuGmA7DNZCp6SFZvEXks0EwLd4LV+mJNqYHR71Sl4
 oqp/6UzQWOY5gKYW490gk7pgDR3sfLKlwsvpV0xY/lXoUXT0XAOB/rzTom4cSGnGdUPE7e3H
 7/Kx73h8z7U8UlxUIj6yL/2IxUGTOKNZQXQ03MGCvH/0kUZr3xjg/xiaPBGMhcJgmrXldwqo
 DkhWeRcbC9wVkGbsLRBC3G0ah1DAJCq2IMrAFCxvcDLwReYL3W8yvxgAEs/M9dEorksDDsX/
 6FBIzxWYkza17O9zZuFEeQ93c5LwOsHnG88VtCM6RmDUJ7KlLiaHv2iCedwhWp23oYXW66FP
 6L1UBI3BDzYeRpDJ1wLP5w3measlxHXfiZRwL6vjfNfD1P7kkopgdABDPKPIobWHZUMxR7Bz
 o771z2R7i8yZYT3JQWtryrEat/nxUvTRI8UHbukwf9m6HX7Krs7UUB+ufOT+JFVu2bmMz5tA
 xV8FhkG9MDewHeWouzVBHVUllbd4EFDBIAJTYXW3ynWokbcy17x6mHp1VetYvR+3CM9bWRCO
 lNkA7oFrNGg2VGYYSv1y1uakd+9ETILfGorTBEhdAI68sT6qtgdyUvzQck2RcZZjvWtcd3x6
 wPT/XJ43utDy55RkfzjomWvbzCE/8CYCFdpvkONBTnjtVkRiI2NPuRE7XDY9/dbMIGXQHGav
 2kcgc/Y5u1m4ZSlzXDTEL5WQe/5jxqDGDeBhlBuLqYMzj+Gq0yxb7l/sQw5C0g8Z67ofhesO
 ic/ozh54J5VIWvvbaZyeKqvBMkwi6vtD9LoUrbTdNUmX3RqXFbfrWc3ORbWhTu21hN2+U0iB
 aqmnQ+XJS5yIcxaIPCeHo/xDZdDKusCKa8/iHw1I9lLEVZTWZJNdYo4DQ==
IronPort-HdrOrdr: A9a23:OcL0qK0aWrqfwNdjkyutdwqjBGskLtp133Aq2lEZdPU1SL3kqy
 nKpp8mPHDP6Qr5J0tQ/+xoVJPtfZqez+8N3WBpB8bYYOC+ghrTEGgA1/qf/9SDIU3DH4dmvM
 8LT0EZMrLN5DNB4PoSjjPXLz5cqOP3iJxAUd2urUuEMWlRGsZdBn9Ce2Wm+7pNNW177DMCZf
 +h2vY=
X-Talos-CUID: =?us-ascii?q?9a23=3AhrdQKmh6uvGRdbeV0Z8vleLYgjJuaGOMyV75HWq?=
 =?us-ascii?q?BAFl4VaSfEHHXoZ9rjJ87?=
X-Talos-MUID: 9a23:OEDcPgZ5ar9RJuBTvWLrijBTC+pR6I/+OlIfqLpXho6rOnkl
X-IronPort-Anti-Spam-Filtered: true
X-ProximusIPWarmup: true
Received: from unknown (HELO [192.168.82.107]) ([109.140.233.32])
  by relay.proximus.be with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 12:26:13 +0200
Message-ID: <5a8b4906-192f-4ea3-b483-f3bd25887f7d@skypro.be>
Date: Tue, 13 Aug 2024 12:26:12 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kristoff <kristoff@skypro.be>
To: linux-hams@vger.kernel.org
References: <0ea34aa4-d9cd-4c0e-9115-c8e68f02eae5@skypro.be>
Content-Language: en-US
Autocrypt: addr=kristoff@skypro.be; keydata=
 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
Subject: what does an APRS packet actually look like
In-Reply-To: <0ea34aa4-d9cd-4c0e-9115-c8e68f02eae5@skypro.be>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------L0N0fZPBQ0ZHu0rbMpwpemcO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------L0N0fZPBQ0ZHu0rbMpwpemcO
Content-Type: multipart/mixed; boundary="------------pmtg39hGKvGNILSPW64a0s2A";
 protected-headers="v1"
From: Kristoff <kristoff@skypro.be>
To: linux-hams@vger.kernel.org
Message-ID: <5a8b4906-192f-4ea3-b483-f3bd25887f7d@skypro.be>
Subject: what does an APRS packet actually look like
References: <0ea34aa4-d9cd-4c0e-9115-c8e68f02eae5@skypro.be>
In-Reply-To: <0ea34aa4-d9cd-4c0e-9115-c8e68f02eae5@skypro.be>

--------------pmtg39hGKvGNILSPW64a0s2A
Content-Type: multipart/mixed; boundary="------------UCObHYldEib0RVvyKO1ogUja"

--------------UCObHYldEib0RVvyKO1ogUja
Content-Type: multipart/alternative;
 boundary="------------ZOXxFFdiOyCcDNb5Cl0LADPf"

--------------ZOXxFFdiOyCcDNb5Cl0LADPf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQoNCihGaXJzdCBvZiBhbGwsIHRoYW5rIHlvdSB0byB0aGUgcGVyc29uIHdo
byByZXBsaWVkIG9mZi1saXN0IHRvIG15IA0KcHJldmlvdXMgcXVlc3Rpb24pLg0KDQoNCg0K
DQpBcyBhIGZvbGxvdy11cCBxdWVzdGlvbi4NCg0KSSBhbSB3b3JraW5nIHRvIGluY29ycG9y
YXRlIEFQUlMgaW50byBPcGVuUlRYIChhbiBvcGVuLXNvdXJjZSBmaXJtd2FyZSANCmZvciBo
YW5kaGVsZCByYWRpb3MgcHJvamVjdCkuDQoNCg0KDQpEb2VzIGFueWJvZHkgaGF2ZSBhbiBp
ZGVhIGhvdyB0byBjcmVhdGUgYSBBUFJTLXBhY2tldCAiaW4gdGhlIHJlYWwgd29ybGQiLg0K
DQpJIGhhdmUgZm91bmQgYWxsIHRoZSBuZWVkZWQgaW5mb3JtYXRpb24gb24gaG93IHRvIGNy
ZWF0ZSBhIA0KSERMQy9BWC4yNS9BUFJTIHBhY2tldCBhY2NvcmRpbmcgdGhlIHNwZWNzLCAu
LiBidXQgSSBndWVzcyB0aGF0ICdyZWFsIA0KbGlmZScgYXBwbGljYXRpb24gc3RpbGwgZG8g
aXQgZGlmZmVyZW50bHkuDQoNCkkgZGlkIHNvbWUgZGVjb2Rpbmcgb2YgQVBSUyBwYWNrZXRz
IEkgcmVjZWl2ZWQgb24tYWlyLiBJIGhhdmUgdGhyZWUgDQpxdWVzdGlvbnM6DQoNCi0gdGhl
IHBhY2tldCAob2J2aW91c2x5KSBuZWVkcyBhIHN5bmMtcGF0dGVybiBpbiBmcm9udCBvZiB0
aGUgSERMQyANCnBhY2tldCwgcHJvYmFibHkgYSAnMDEwMTAxJyBwYXR0ZXJuLg0KDQpIb3cg
bWFueSBzeW5jLWJpdHMgc2hvdWxkIG9uZSBhZGQgdG8gYSBBUFJTIHBhY2tldD8NCg0KSG93
IG1hbnkgc2hvdWxkIG9uZSBhZGQgdG8gYSBNaWMtRSBwYWNrZXQ/DQoNCg0KDQotIE9uIHNv
bWUgd2Vic2l0ZSwgSSBmb3VuZCByZWZlcmVuY2VzIHRvIHBhY2tldHMgY29udGFpbmluZyBu
b3Qgb25lLCBidXQgDQptdWx0aXBsZSAnSERMQyBmbGFnJyBieXRlcyBhbmQgdGhlIGJlZ2lu
bmluZyBhbmQgdGhlIGVuZCBvZiB0aGUgcGFja2V0Lg0KDQpJcyB0aGF0IGEgZ29vZCBpZGVh
PyBIb3cgbWFueSBzaG91bGQgb25lIGRvPw0KDQoNCi0gVGhlIHBhY2tldHMgSSBoYXZlIHJl
Y2VpdmVkIGFuZCBkZW1vZHVsYXRlZCBoYWQgLWZvciBzb21lIHJlYXNvbi0gYSANCjQwMCBi
YXVkIEZTSyAoRlNLIG5vdCBBRlNLISkgYnVyc3QgYWZ0ZXIgdGhlIEFQUlMgcGFja2V0Lg0K
Tm8gaWRlYSB3aHkuIEl0IGNvbnRhaW5lZCBubyBkYXRhLCBqdXN0IHRoZSBidXJzdCB3aXRo
IGFsbCAnMDEnDQoNCkFueWJvZHkgYW55IGlkZWEgd2h5IHRoaXMgaXM/DQooT3IgcGVyaGFw
cyBpdCdzIGEgYnVnPyApDQoNCg0KDQpUaGFua3MgaW4gYWR2YW5jZS4NCg0KDQpLcmlzdG9m
ZiAoT04xQVJGKQ0KDQoNCg0KDQoNCg0KT3AgMDguMDguMjQgb20gMDk6MDYgc2NocmVlZiBL
cmlzdG9mZjoNCj4NCj4gSGkgYWxsLA0KPg0KPg0KPiBJIGFtIGxvb2tpbmcgZm9yIHNvdXJj
ZS1jb2RlIChDIG9yIEMrKykgdG8gaW1wbGVtZW50IEFQUlMgKEFQUlMsIEFYMjUgDQo+IGFu
ZCBtaWNFKSBmb3IgYW4gZW1iZWRkZWQgZGV2aWNlLg0KPg0KPiBXaGF0IHdvdWxkIGJlIHRo
ZSBiZXN0IHNvdXJjZSBmb3IgdGhhdD8NCj4NCj4gSXMgdGhlcmUgInJlZmVyZW5jZS1jb2Rl
IiBmb3IgdGhpcz8NCj4NCj4NCj4NCj4gQ2hlZXJpbyEgS3IuIEJvbm5lIChPTjFBUkYpDQo+
DQo=
--------------ZOXxFFdiOyCcDNb5Cl0LADPf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi all,<br>
      <br>
      <br>
      (First of all, thank you to the person who replied off-list to my
      previous question).<br>
      <br>
      <br>
      <br>
      <br>
      As a follow-up question.<br>
      <br>
      I am working to incorporate APRS into OpenRTX (an open-source
      firmware for handheld radios project).<br>
      <br>
      <br>
      <br>
      Does anybody have an idea how to create a APRS-packet "in the real
      world".<br>
      <br>
      I have found all the needed information on how to create a
      HDLC/AX.25/APRS packet according the specs, .. but I guess that
      'real life' application still do it differently.<br>
      <br>
      I did some decoding of APRS packets I received on-air. I have
      three questions:<br>
      <br>
      - the packet (obviously) needs a sync-pattern in front of the HDLC
      packet, probably a '010101' pattern.<br>
      <br>
      How many sync-bits should one add to a APRS packet?<br>
      <br>
      How many should one add to a Mic-E packet?<br>
      <br>
      <br>
      <br>
      - On some website, I found references to packets containing not
      one, but multiple 'HDLC flag' bytes and the beginning and the end
      of the packet.<br>
      <br>
      Is that a good idea? How many should one do?<br>
      <br>
      <br>
      - The packets I have received and demodulated had -for some
      reason- a 400 baud FSK (FSK not AFSK!) burst after the APRS
      packet.<br>
      No idea why. It contained no data, just the burst with all '01'<br>=

      <br>
      Anybody any idea why this is?<br>
      (Or perhaps it's a bug? )<br>
      <br>
      <br>
      <br>
      Thanks in advance.<br>
      <br>
      <br>
      Kristoff (ON1ARF)<br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
    </p>
    <div class=3D"moz-cite-prefix">Op 08.08.24 om 09:06 schreef Kristoff:=
<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:0ea34aa4-d9cd-4c0e-9115-c8e68f02eae5@skypro.be">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
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
    </blockquote>
  </body>
</html>

--------------ZOXxFFdiOyCcDNb5Cl0LADPf--

--------------UCObHYldEib0RVvyKO1ogUja
Content-Type: application/pgp-keys; name="OpenPGP_0xAA9E3775056F1164.asc"
Content-Disposition: attachment; filename="OpenPGP_0xAA9E3775056F1164.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D=3D
=3DjlEl
-----END PGP PUBLIC KEY BLOCK-----

--------------UCObHYldEib0RVvyKO1ogUja--

--------------pmtg39hGKvGNILSPW64a0s2A--

--------------L0N0fZPBQ0ZHu0rbMpwpemcO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE3+PL19VExLoYeq3Iqp43dQVvEWQFAma7NMUFAwAAAAAACgkQqp43dQVvEWRJ
hhAAp3IxjBwkwNfXGEKv6DQVEhudH1BUjrawBRdZjqoreye+l7S3tx+iKVLBWS3bp+WDjq5zt1KY
Sdvq2emEuEo07rS0HsvGStRtsxdEJra7M+S7vsCsMSPQY23kakgCOD3l/Pxn4geKZdBusxUv7Cyb
ukKmYFR7BTEOOeuknjciPgg+cah5vBi8PtEjYq+TUAJKuhu6e83Qi2e2i2eruRnXYAkzOnWlDdkY
+B4io8rPEQyRP4euzFcyAI71YZ4F2lYLKc2vKvx1Lzc7nD1WCHCF2UB+szc5g7gJQ8BUtKeJUIy4
EkJtgLPZtf7vHTcd6twNdN3w5yP2nwrK7Yf/Qevj743PHJYaTJ8ABFRTH11gQooftb5vWT4qRmE4
e82MUnbo6s8qhRDcGWPsxn/85Fqm2ajZdJaCEv8/ezXbBwP1PaGzYH4HkWrD0oJNmWGwML6xnuW2
3fBvBrWemNFifgrdt54T+M8AQPF9l1XsJA1Hp4v+asftNZ0m+zuMp5uP/wXNp3mCxNZBIYtVhxXK
eTW+tGQWx4o3/WdfWXH5f3UM5Noup+QLD3GCnhCHtaO5N7FdgVxyz+Y1tbwOpEpbcsO2OegyUzHR
c56sLA0pYjTy9osi9hsH+rd4q8kLUDL0MffhSXU4LbFs86M1Vlp85ZEGWApCNBB6TSZCJCik2DP1
Gwc=
=51Mw
-----END PGP SIGNATURE-----

--------------L0N0fZPBQ0ZHu0rbMpwpemcO--

