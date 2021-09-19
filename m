Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6786B410AC4
	for <lists+linux-hams@lfdr.de>; Sun, 19 Sep 2021 10:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbhISIoM (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 19 Sep 2021 04:44:12 -0400
Received: from ham.blackspace.at ([78.46.20.155]:37916 "EHLO
        mail.blackspace.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhISIoL (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 19 Sep 2021 04:44:11 -0400
Received: from [192.168.43.232] (84-20-185-171.static.highway.a1.net [84.20.185.171])
        by mail.blackspace.at (Postfix) with ESMTPSA id 296B81F72052
        for <linux-hams@vger.kernel.org>; Sun, 19 Sep 2021 10:42:45 +0200 (CEST)
To:     linux-hams@vger.kernel.org
References: <654f3a4d-6420-4fba-e6d9-5693a67f6459@blackspace.at>
 <47ff7a73-dbe7-fcf3-f99f-36e63d709520@trinnet.net>
 <0ef34530-6a91-c3e2-4f52-18eb3546eeff@blackspace.at>
 <3be878a4-d1ef-1179-cf53-bed047c23a99@trinnet.net>
From:   Roland Schwarz <roland.schwarz@blackspace.at>
Subject: Re: unknown kiss packet: 0x80 0x9e
Message-ID: <6fef72ef-7730-6894-2b72-637031a97c4d@blackspace.at>
Date:   Sun, 19 Sep 2021 10:42:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3be878a4-d1ef-1179-cf53-bed047c23a99@trinnet.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qMEU5fPN8JMSsFSNun41HY7pNO5YktVxk"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qMEU5fPN8JMSsFSNun41HY7pNO5YktVxk
Content-Type: multipart/mixed; boundary="TI987uhgZA0akjTJ6zq5vM4b8oyf7WZRj";
 protected-headers="v1"
From: Roland Schwarz <roland.schwarz@blackspace.at>
To: linux-hams@vger.kernel.org
Message-ID: <6fef72ef-7730-6894-2b72-637031a97c4d@blackspace.at>
Subject: Re: unknown kiss packet: 0x80 0x9e
References: <654f3a4d-6420-4fba-e6d9-5693a67f6459@blackspace.at>
 <47ff7a73-dbe7-fcf3-f99f-36e63d709520@trinnet.net>
 <0ef34530-6a91-c3e2-4f52-18eb3546eeff@blackspace.at>
 <3be878a4-d1ef-1179-cf53-bed047c23a99@trinnet.net>
In-Reply-To: <3be878a4-d1ef-1179-cf53-bed047c23a99@trinnet.net>

--TI987uhgZA0akjTJ6zq5vM4b8oyf7WZRj
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello David,

On 18.09.21 at 18:58 wrote David Ranch:

> I started with Thomas Sailer's soundmodem softTNC and Linux and now use=
=20
> WB2OSZ's Direwolf.=C2=A0 Setting up both soft-tncs is a bit different b=
ut I=20
> wouldn't say that one is more difficult than the other. =20

I totally agree.

> If you'd like=20
> to see some examples, I have an Rpi-centric document here:
>=20
>  =C2=A0=C2=A0 https://www.trinityos.com/HAM/CentosDigitalModes/RPi/rpi4=
-setup.html

Oh, thank you! You have done quite a nice writeup. I will definitely put =

this on my read list.

 From a first glance over: Where do you adress 9600Bd issues? I am=20
asking because this is what I am specifically interested in.

> Please search for "UZ7HO soundmodem" and it will come right up.  It's a=
 Windows only program written in Delphi but it's written and tested to wo=
rk with WINE.=20

Umm, oh, yes, well. This is definitely not the route I am about to go.=20
This would end up in a setup that reminds me of the echolink where a=20
node needs to run as a GUI although it should be a system daemon. The=20
modem might be very good, but I think it at the same time should exhibit =

good system integration.

Roland,
oe1rsa

--=20
__________________________________________
   _  _  | Roland Schwarz
  |_)(_  |
  | \__) | mailto:roland.schwarz@blackspace.at
________| http://www.blackspace.at


--TI987uhgZA0akjTJ6zq5vM4b8oyf7WZRj--

--qMEU5fPN8JMSsFSNun41HY7pNO5YktVxk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELmDUtkkUQD99pU+KklFj+hFsiUgFAmFG+AQFAwAAAAAACgkQklFj+hFsiUjM
LA//TEylCnKgUTPS7GTZTZR3JovLaOs4jYN2AJ8t/3aQXT9vlzt4n9ei1LTsbRUIcf4WuvYbs2Mr
3S/KUou6YtfR0fYLaKJqyb0V7LvvEwc9m+KQTa4kBGG4psyC1M2BXrzBzFy2aMc9sXNSxGc7TN+I
XSzypP7nfuo1rYEOS2OCHl7cyZHABkdFR82H6PI6vui9q+xbp7XDU5omTiENJvjSSmYa2em8srZb
J08CsvRrAE2y8DAQj9+PWj3L4Tafy2BdyE9DgSDAxjSpBtk1tkMYRg6plcKJ/iZSg78zXlHURvWR
YeV039oP4OL2W9CQvFZU5Kmw/5JBcOzOejQ6YhvHvzErk0V7R4uN/O+8krxPkqilp3ZqWhoSgQat
APHZytlo0afzPILy5y1T4gLAsx6qynbrXxhrbcaN0drL8Q8kfPGqj3pXmY/yowJUTFg285RMkcCK
fPsfxxM8k7TxqKmgO0AlN+ewxsWA+CuIb8ztsbrbbJah1EL2uYuso0N1Bk4ZtEjPWGEBZtFoKCJd
zUSwQaJqrQCLBIo09/iF9uZgSSl8o8RTz390wAP+E9nzWlAgaJOfcaqDNU2P7zKX62B2OomOlTzA
Cg/CEEhEt9rG9ZasTRBP6yd3xtjMQHYoPZVE1XiTcFqh8J5YlmfpohWhTMu6GrKi2zTPvzW93XvS
wpA=
=x9wG
-----END PGP SIGNATURE-----

--qMEU5fPN8JMSsFSNun41HY7pNO5YktVxk--
