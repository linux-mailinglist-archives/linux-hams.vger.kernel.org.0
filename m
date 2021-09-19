Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3393410C34
	for <lists+linux-hams@lfdr.de>; Sun, 19 Sep 2021 17:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233306AbhISPkf (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 19 Sep 2021 11:40:35 -0400
Received: from ham.blackspace.at ([78.46.20.155]:48968 "EHLO
        mail.blackspace.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233431AbhISPkf (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 19 Sep 2021 11:40:35 -0400
Received: from [192.168.43.232] (84-20-185-171.static.highway.a1.net [84.20.185.171])
        by mail.blackspace.at (Postfix) with ESMTPSA id 4EA301F72052;
        Sun, 19 Sep 2021 17:39:08 +0200 (CEST)
To:     linux-hams@vger.kernel.org
Cc:     David Ranch <linux-hams@trinnet.net>
References: <8b7a1545-3631-b62d-6430-4a51652023ba@free.fr>
 <CAH4uzPPVfYnRzGH5OTL6JX7JC64sY5XSsurHBLt=EOV+EPbJ2A@mail.gmail.com>
 <45792400-294f-b496-9c7e-679d19614884@free.fr>
 <CAH4uzPPtsgz8tnQXwukDVL7=_pgfnK8OS+J8tdHBnsnJE1m5kw@mail.gmail.com>
 <ca4f0c90-53e6-24e8-9a51-f079d6da574c@trinnet.net>
From:   Roland Schwarz <roland.schwarz@blackspace.at>
Subject: Re: AX25 disconnect patch and ROSE socket failure
Message-ID: <a5d51093-fb07-0683-e094-9da57d9f25fa@blackspace.at>
Date:   Sun, 19 Sep 2021 17:39:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ca4f0c90-53e6-24e8-9a51-f079d6da574c@trinnet.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yviAKlXXIrg3PIbCcFN5g7IsQO4psVOOt"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yviAKlXXIrg3PIbCcFN5g7IsQO4psVOOt
Content-Type: multipart/mixed; boundary="HVY5aiK7b2RCNWB3rdR4zsFQr5CSlMyLU";
 protected-headers="v1"
From: Roland Schwarz <roland.schwarz@blackspace.at>
To: linux-hams@vger.kernel.org
Cc: David Ranch <linux-hams@trinnet.net>
Message-ID: <a5d51093-fb07-0683-e094-9da57d9f25fa@blackspace.at>
Subject: Re: AX25 disconnect patch and ROSE socket failure
References: <8b7a1545-3631-b62d-6430-4a51652023ba@free.fr>
 <CAH4uzPPVfYnRzGH5OTL6JX7JC64sY5XSsurHBLt=EOV+EPbJ2A@mail.gmail.com>
 <45792400-294f-b496-9c7e-679d19614884@free.fr>
 <CAH4uzPPtsgz8tnQXwukDVL7=_pgfnK8OS+J8tdHBnsnJE1m5kw@mail.gmail.com>
 <ca4f0c90-53e6-24e8-9a51-f079d6da574c@trinnet.net>
In-Reply-To: <ca4f0c90-53e6-24e8-9a51-f079d6da574c@trinnet.net>

--HVY5aiK7b2RCNWB3rdR4zsFQr5CSlMyLU
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hallo David,

On 19.09.21 at 17:22 wrote David Ranch:
>=20
> Actually, if you look at the linux-hams@vger.kernel.org archives, you'l=
l=20
> see some recent kernel patches submitted by Ralf for some issues:

Yes indeed, this is what Ralf told me by phone. He is waiting for=20
approvement. He also told me that he still is distracted by the cleanup=20
efforts after the severe flooding.

> ... I'm talking about bugs like the=20
> hung-after-disconnect AX.25 connections issue, minor AX.25 packet loss =

> issues, etc.=C2=A0 I think all of us want to see those get fixed first.=


It seems like the proposed solution will not fix the root cause of the=20
problem. I didn't quite understand, but under certain circumstances it=20
seems to be possible to get up to a quadruple call of the function.=20
Anyway, Ralf told me that he will take another look at the proposed fix.

Roland
oe1rsa

--=20
__________________________________________
   _  _  | Roland Schwarz
  |_)(_  |
  | \__) | mailto:roland.schwarz@blackspace.at
________| http://www.blackspace.at


--HVY5aiK7b2RCNWB3rdR4zsFQr5CSlMyLU--

--yviAKlXXIrg3PIbCcFN5g7IsQO4psVOOt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELmDUtkkUQD99pU+KklFj+hFsiUgFAmFHWZsFAwAAAAAACgkQklFj+hFsiUho
nA//Yp5db2s9EOVGs8kRqRvH6nQE3GhJ517mLIm+mXCgoFk0VMwUrmrJu4QFdsSMAFNlHYZ8qABZ
Nml1D076ninn2H/k8KpB7LrUSov0PdLWpe9WLBQph8qbJiW0B8Ptk8oQdAgmwm1QUi40QfgsF1A7
Xv2FOF7yswg+hn5kuV+ZNc6fuzN3y/McgLJ0rgI2fyB4bLZQqR9DN7okqFC0WxIQRVl2Mw6oVT9t
zXJnXhqWkwGTavnPf1YPaeqbn8XgHSqXXuYsSQLGyqOOtAasY5ulBbnvVmUl9FfiWopOB/Q4BQcU
Q2davabZQnNbIKPJ3ToZo5KQ0mpIIuZn/aTGcqIJOlwt2jwMXGRO8MUhQ9UYAk9GvZud609Qf0NY
jAV0gNNV9XX+p1l3b744ez4ZkLRxRzy7Py3Z3Fb6chO3IBU9qZgPuZ2ZMUCqcE4doak89zcIXeXz
1ekuWvZ0814FGkMo9p8o+Sa4RBn9U07sxIAJmKg5cH3UZRSbN8RxzL90GDQ1krKpyQo6b9NGez4w
Uv44O8tqtdC6iCb/R34b+zfNurK21O8ozhm7pS+423ib3RkLpALVRJPxKdTYgwJ/R4D1N2IT+wcw
9MtO95OjtBwINrxntGKblmMI567A4x6LqlWQMeeMJZY2Ci7zK7jaTScqhWJwhdbs4dJOVUA3I10E
Igg=
=mAiX
-----END PGP SIGNATURE-----

--yviAKlXXIrg3PIbCcFN5g7IsQO4psVOOt--
