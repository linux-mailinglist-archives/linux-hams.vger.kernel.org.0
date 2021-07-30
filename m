Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE073DB81A
	for <lists+linux-hams@lfdr.de>; Fri, 30 Jul 2021 13:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbhG3Ly7 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 30 Jul 2021 07:54:59 -0400
Received: from ham.blackspace.at ([78.46.20.155]:43148 "EHLO
        mail.blackspace.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbhG3Ly7 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 30 Jul 2021 07:54:59 -0400
X-Greylist: delayed 408 seconds by postgrey-1.27 at vger.kernel.org; Fri, 30 Jul 2021 07:54:58 EDT
Received: from [192.168.43.232] (84-20-185-171.static.highway.a1.net [84.20.185.171])
        by mail.blackspace.at (Postfix) with ESMTPSA id AB93F1F72050;
        Fri, 30 Jul 2021 13:48:04 +0200 (CEST)
To:     linux-hams@vger.kernel.org
Cc:     Ralf Baechle <ralf@linux-mips.org>
References: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
 <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
 <YPp7qeWGSW/s4TI6@linux-mips.org>
From:   Roland Schwarz <roland.schwarz@blackspace.at>
Subject: Re: Status of the stuck sockets bugs.
Message-ID: <b94e876a-b629-48bb-1497-bbed6c43ee9d@blackspace.at>
Date:   Fri, 30 Jul 2021 13:47:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPp7qeWGSW/s4TI6@linux-mips.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QmZEF2NIibBH0pAN14X22snkTGoC8mAp9"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QmZEF2NIibBH0pAN14X22snkTGoC8mAp9
Content-Type: multipart/mixed; boundary="WZrVOMxp4i51GT11A8BKlHkmw7COo9XG6";
 protected-headers="v1"
From: Roland Schwarz <roland.schwarz@blackspace.at>
To: linux-hams@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Message-ID: <b94e876a-b629-48bb-1497-bbed6c43ee9d@blackspace.at>
Subject: Re: Status of the stuck sockets bugs.
References: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
 <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
 <YPp7qeWGSW/s4TI6@linux-mips.org>
In-Reply-To: <YPp7qeWGSW/s4TI6@linux-mips.org>

--WZrVOMxp4i51GT11A8BKlHkmw7COo9XG6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

FWIW:

I am playing with direwolf to use it as a replacement for soundmodem,=20
since soundmodem is currently lacking alsa support.

I have set up two machines, one is a raspberry 4 running stock debian=20
11.0 with kernel 5.10 and the other is a x86 ubuntu 21.04 based machine.

I am using two usb soundcards with a cross over sound connection to get=20
started.

After having set up /etc/ax25/axports, on both machines I start direwolf =

and use kissattach -l /dev/pts/<nr> dw0 to attach the the ports. Then I
adjust kissparms -c 1 -p dw0 because direwolf suggests so.

Without having set up any services (no ax25d entries yet and=20
consequently no processes using the port) from one machine I try to=20
axcall dw0 my-callsign-ssid to the other one. Of course this will not=20
succeed since I have not set up an application on the remote peer.=20
However when I forcibly close the connection (~. within axcall) on the=20
other machine netstat --ax25 lists the socket in listening state, which=20
should not be the case as I understand it. The socket being in that=20
state will not allow me to do anything with it from the remote machine=20
since I always get the error that the address is in use.

I guess what I am observing is an incarnation of the "stuck sockets=20
bug", yes?

73 de Roland OE1RSA

--=20
__________________________________________
   _  _  | Roland Schwarz
  |_)(_  |
  | \__) | mailto:roland.schwarz@blackspace.at
________| http://www.blackspace.at


--WZrVOMxp4i51GT11A8BKlHkmw7COo9XG6--

--QmZEF2NIibBH0pAN14X22snkTGoC8mAp9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELmDUtkkUQD99pU+KklFj+hFsiUgFAmED5u8FAwAAAAAACgkQklFj+hFsiUin
TBAAkJ58UzOlDpuPQsAeCAyk2kY45splNrsw52Xh/4NGZQvbMp9dPzOvFFEIaoxa0JsejFhb+ReP
s9bln5Pw/5dBuj4BVUQXzIylslA+hlMVdB02KCGWk2VoUrix9uzJ63ObKCAGAzsezS7z5BvIts8c
9SVuAJZ/xmHdCAyVuphQqZKm8O1qgABamyowr02z5vlm6FWN+V6yiVcIDOBfaOcKfp1ajfi6jYnh
S32EO5GOx5I7rWmNrRy7GaCTmZF3L7j5u+1gzO794S+RRgI+6vcnQTXFFc1jFLIb2rZClmGCNyCi
6bM44Ceg93p87EOy4Mnv3+aVC3cr7+tSpVUJwqSSgF5Zk3KChFywRCjrTzbWpT69GEFuJmdm1Z60
Ns6a4kme9Q0snGUbMr/G274a77VnnK8hqwFKpUMFC3SkJOlv1DSK8Q9mPXUkpmNaCX5WBApEQFbG
jrDmLR7LSftcinRZsRAZ3YQRE7J0bieCqm+iWrwLqvgPJlMFBPbhNJUkgIz+mKQnK821+wHZUjI0
J10pXwxJ88qgJg4JMCTFACq9SO7Cf/CMnZDiWpiuX1c9wzRMkTJW+EMsd+4EMpl5WEobv0vpY128
rnqRD4nUdev41BvPgVktw0URfcwcNW8AvyQrI4Nbg8k1TptIqkFQHNjgkCa3C1ryEsdLBNuStPLJ
XBw=
=blBi
-----END PGP SIGNATURE-----

--QmZEF2NIibBH0pAN14X22snkTGoC8mAp9--
