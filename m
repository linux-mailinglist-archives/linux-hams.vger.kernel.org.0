Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75E453DC6CF
	for <lists+linux-hams@lfdr.de>; Sat, 31 Jul 2021 18:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbhGaQFK (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sat, 31 Jul 2021 12:05:10 -0400
Received: from ham.blackspace.at ([78.46.20.155]:51702 "EHLO
        mail.blackspace.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233622AbhGaQFK (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sat, 31 Jul 2021 12:05:10 -0400
Received: from [192.168.43.232] (84-20-185-171.static.highway.a1.net [84.20.185.171])
        by mail.blackspace.at (Postfix) with ESMTPSA id B0B1E1F72050;
        Sat, 31 Jul 2021 18:05:01 +0200 (CEST)
From:   Roland Schwarz <roland.schwarz@blackspace.at>
To:     linux-hams@vger.kernel.org
Cc:     Ralf Baechle <ralf@linux-mips.org>, d.vanderlocht@gmail.com
References: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
 <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
 <YPp7qeWGSW/s4TI6@linux-mips.org>
 <b94e876a-b629-48bb-1497-bbed6c43ee9d@blackspace.at>
Subject: Re: Status of the stuck sockets bugs.
Message-ID: <700e0381-4e63-54b0-7068-46e5fa4f1d40@blackspace.at>
Date:   Sat, 31 Jul 2021 18:05:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b94e876a-b629-48bb-1497-bbed6c43ee9d@blackspace.at>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cq8Yp29J7Ycxiwy2IqxVGR9Vma2tbUMcD"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cq8Yp29J7Ycxiwy2IqxVGR9Vma2tbUMcD
Content-Type: multipart/mixed; boundary="ICsrtM2LOSClKH1ooZITommubpj8tPNLc";
 protected-headers="v1"
From: Roland Schwarz <roland.schwarz@blackspace.at>
To: linux-hams@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>, d.vanderlocht@gmail.com
Message-ID: <700e0381-4e63-54b0-7068-46e5fa4f1d40@blackspace.at>
Subject: Re: Status of the stuck sockets bugs.
References: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
 <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
 <YPp7qeWGSW/s4TI6@linux-mips.org>
 <b94e876a-b629-48bb-1497-bbed6c43ee9d@blackspace.at>
In-Reply-To: <b94e876a-b629-48bb-1497-bbed6c43ee9d@blackspace.at>

--ICsrtM2LOSClKH1ooZITommubpj8tPNLc
Content-Type: multipart/mixed;
 boundary="------------EBC368BF6C6FE2525B2F8A44"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------EBC368BF6C6FE2525B2F8A44
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Partly answering my question by myself:

Am 30.07.21 um 13:47 schrieb Roland Schwarz:
 > I guess what I am observing is an incarnation of the "stuck sockets
 > bug", yes?

I applied YO2LOJ's changes to the current sources and verified that now=20
the connection is not left stuck in listening mode.

What I still do not understand why the socket still signals connected=20
when doing an axcall from a remote machine although there is no peer=20
process connected. Is this normal behavior of the socket layer?

Attached to this mail also is a (hopefully) properly formatted=20
patchfile. At least I was able to apply it to a current kernel source=20
tree. I also have verified that these are the only changes that have=20
been introduced by YO2LOJ with respect to stock kernel.

vy 73 de Roland oe1rsa

--=20
__________________________________________
   _  _  | Roland Schwarz
  |_)(_  |
  | \__) | mailto:roland.schwarz@blackspace.at
________| http://www.blackspace.at

--------------EBC368BF6C6FE2525B2F8A44
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-apply-YO2LOJ-s-changes-for-proper-connection-cleanup.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename*0="0001-apply-YO2LOJ-s-changes-for-proper-connection-cleanup.pa";
 filename*1="tch"

=46rom aebb2b16522e50af1acf50d5d198e027aabc3513 Mon Sep 17 00:00:00 2001
From: Roland Schwarz <roland.schwarz@blackspace.at>
Date: Sat, 31 Jul 2021 17:51:34 +0200
Subject: [PATCH] apply YO2LOJ's changes for proper connection cleanup

---
 net/ax25/ax25_subr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/ax25/ax25_subr.c b/net/ax25/ax25_subr.c
index 15ab812c4fe4..7ee0b56513e7 100644
--- a/net/ax25/ax25_subr.c
+++ b/net/ax25/ax25_subr.c
@@ -285,4 +285,9 @@ void ax25_disconnect(ax25_cb *ax25, int reason)
 		bh_unlock_sock(ax25->sk);
 		local_bh_enable();
 	}
+	else
+	{
+		// YO2LOJ: this is needed for proper NETROM connection cleanup on time=
out
+		ax25_destroy_socket(ax25);
+	}
 }
--=20
2.30.2


--------------EBC368BF6C6FE2525B2F8A44--

--ICsrtM2LOSClKH1ooZITommubpj8tPNLc--

--cq8Yp29J7Ycxiwy2IqxVGR9Vma2tbUMcD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELmDUtkkUQD99pU+KklFj+hFsiUgFAmEFdKwFAwAAAAAACgkQklFj+hFsiUis
gA//Uh9kvx/WyAqRrMR66pj+oaYP4HUp1f+xdwAUgWU2qWcLWGtG1WQosNHu+Gmqkfu6L+NGhNG3
UlFJ2VFE46eJG5VbS3B1VGpxwrctS8ydqpWXSUJ88iQlAP3OoltLk3bYXvymlydtLGzkEuORhP8q
2kdz3yrsOTYFYKhkz0dfU3EAxUPgXNUZGNXErvqLymN8bAY1J/HCv2fVQOhQjk47019VURriveJr
MRQdHpsGXhvRUV9xbtbBjX+7fSFUR39Aplbl2geIsra64UMQkLai32BZYaT4nCEgsQ7ts+R1ehvN
Lbq603zO7jE+mTtmgx7jjSTlcFYCHnZ+UmNOI40I9qEZtrR6vqInJHO7Pz0cASOAfa11OgqXFCiQ
ulCkcL4UgbmoHCD1zTXyCvyLNj1CEnlvww7zqDXPAHaCWJcNku8gIKny/yKz2VxRdgZAhmc8SDW6
yBO7zSZ7hGYKdzfzoTCcSg+1F/EEDeQ9SZ7BKVd+ANo986xUL0jsOLw+r1NXdVLT5mzDKtgjJQhH
VaMBtK1zJC2tdsL/Z+CLu6riP54vfxtRpEjevF8IW0fyAoUfV2IRT7h+xdDV+OrX7B06U3vxZlb3
oGhe8OuEsUze4DvD3kOtE72+kLp9WIx8807lP6eqloX38uv8VDLJy2wann8L3P7buXzkbWS75n4W
+PQ=
=VFKX
-----END PGP SIGNATURE-----

--cq8Yp29J7Ycxiwy2IqxVGR9Vma2tbUMcD--
