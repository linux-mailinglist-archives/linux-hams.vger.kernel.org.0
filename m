Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F84E386CD7
	for <lists+linux-hams@lfdr.de>; Tue, 18 May 2021 00:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238146AbhEQWTo (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 17 May 2021 18:19:44 -0400
Received: from www11.qth.com ([72.52.250.187]:46018 "EHLO www11.qth.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235143AbhEQWTn (ORCPT <rfc822;linux-hams@vger.kernel.org>);
        Mon, 17 May 2021 18:19:43 -0400
X-Greylist: delayed 13009 seconds by postgrey-1.27 at vger.kernel.org; Mon, 17 May 2021 18:19:43 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
        s=default; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender
        :Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=O6O19Ne+tko4dtUypqHy1OVBBESytiUY3UYaX/ikdR0=; b=ExF1orZAO0Lq3YN6mYAt2C7WqR
        KAFPpWLg6IvQ9eVtVad8x0bd1Q62SjuaVPDDXBqSMwWZW0gvwJ1USUH3523gWcClpC5GDie1g+dTs
        Rk782Hd6mK0jOWKXBYm0bnCA16kqRkcd5K6jidp233xHdDNjPxl731ioof8Jzunpi7h8=;
Received: from [68.234.117.129] (port=58206 helo=merlin.lan)
        by www11.qth.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <n0nb@n0nb.us>)
        id 1liiBN-001Uhm-9B
        for linux-hams@vger.kernel.org; Mon, 17 May 2021 13:41:37 -0500
Received: from nate by merlin.lan with local (Exim 4.94.2)
        (envelope-from <n0nb@n0nb.us>)
        id 1liiBM-005s8X-Ky
        for linux-hams@vger.kernel.org; Mon, 17 May 2021 13:41:36 -0500
Date:   Mon, 17 May 2021 13:41:36 -0500
From:   Nate Bargmann <n0nb@n0nb.us>
To:     Linux Hams <linux-hams@vger.kernel.org>
Subject: [Fwd: Hamlib 4.2 release]
Message-ID: <20210517184136.wau2pbcnqm6gizet@n0nb.us>
Mail-Followup-To: Linux Hams <linux-hams@vger.kernel.org>
X-Operating-System: Linux 5.10.0-6-amd64 x86_64
Organization: Amateur Radio!
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jmkjnrr3gdhy2aoa"
Content-Disposition: inline
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - www11.qth.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - n0nb.us
X-Get-Message-Sender-Via: www11.qth.com: authenticated_id: n0nb@n0nb.us
X-Authenticated-Sender: www11.qth.com: n0nb@n0nb.us
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


--jmkjnrr3gdhy2aoa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

----- Forwarded message from Nate Bargmann <n0nb@n0nb.us> -----

Date: Mon, 17 May 2021 13:40:58 -0500
=46rom: Nate Bargmann <n0nb@n0nb.us>
To: Hamlib Developers <hamlib-developer@lists.sourceforge.net>
Subject: Hamlib 4.2 release
Organization: Amateur Radio!

After much work from Mike, W9MDB, and many others, Hamlib 4.2 has been
released!  The files can be downloaded from:

https://sourceforge.net/projects/hamlib/files/hamlib/4.2/

or:

https://github.com/Hamlib/Hamlib/releases/tag/4.2

The source tarball and MS Windows 32 and 64 binaries are available via
either link as are MD5SUM and SHA1SUM files and signatures for all
files.

Changes for the 4.2 release include:

    * New rig_get_mode_bandwidths -- returns token set for bandwidths for g=
iven mode
        Rig command: \get_mode_bandwidths CW
        Mode=3DCW
        Normal=3D500Hz
        Narrow=3D50Hz
        Wide=3D2400Hz
    * New rig_get_info  -- returns token set for all vfos where order does =
not matter
      This is a string return to allow for easy future expansion without ch=
anging the API
      New tokens may be introduced and can be skipped if not used by clients
        Rig command: \get_rig_info
        VFO=3DMain Freq=3D145000000 Mode=3DNone Width=3D0 RX=3D1 TX=3D1
        VFO=3DVFOB Freq=3D145000000 Mode=3DFM Width=3D15000 RX=3D0 TX=3D0
        Split=3D0 SatMode=3D0
        Rig=3DDummy
        App=3DHamlib
        Version=3D20210429
        CRC=3D0xf49f4708
    * New rig_get_vfo_info
        Rig command: \get_vfo_info VFOA
        Freq: 145000000
        Mode: None
        Width: 0
        Split: 0
        SatMode: 0

    * FILPATHLEN has changed to HAMLIB_FILPATHLEN

    * USRP lib and gnuradio are deprecated and will be removed in 5.0
    * Added Radan rotator
    * Added Malachite SDR
    * Major rework for PRM80
    * Add twiddle_timeout and twiddle_rit --set-conf options
        rigctld --set-conf=3Dtwiddle_timeout=3D5,twiddle_rit=3D1
        This will set the twiddle timeout to 5 seconds and turn on twiddle_=
rit
        For twiddle timeout VFOB will not be polled for 5 seconds after VFO=
 twiddling
	is detected
    * rigctld --twiddle is deprecated and will be removed in 5.0 along with
      get_twiddle and set_twiddle
    * Rework Doxygen manual including default layout for Doxygen 1.9.1.  So=
 far
      the amplifier, rotator, and utilities API sections have been updated.=
  The
      rig (radio) section remains to be updated.


As noted, portions of the Doxygen manual have been updated and can be
found at:

http://hamlib.sourceforge.net/manuals/4.2/index.html

As well the Wiki has been updated:

https://github.com/Hamlib/Hamlib/wiki

Have fun!

73, Nate

--=20

"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."

Web: https://www.n0nb.us
Projects: https://github.com/N0NB
GPG fingerprint: 82D6 4F6B 0E67 CD41 F689 BBA6 FB2C 5130 D55A 8819




----- End forwarded message -----

--=20

"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."

Web: https://www.n0nb.us
Projects: https://github.com/N0NB
GPG fingerprint: 82D6 4F6B 0E67 CD41 F689 BBA6 FB2C 5130 D55A 8819


--jmkjnrr3gdhy2aoa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEG5vcSeqIHtMzWHg79yYl4u2+1ZgFAmCiuOAACgkQ9yYl4u2+
1ZiLHAwAueX2Fe7h38d54bWaJfntvj1L99sYYYXbRDRc7lYyOb5o4O7GG7nxpfsS
7qgDizAWVnFgJIQVMbddp8bKHtqXdq8o5HS1vFnpZdXEaICtiU29BIZw4azRQhvK
xvQnvaqug4UfIEajxeCbIoaXa8MgP3aE11/KBMIbDjJ4BG3Y7wngInu1uMI7uZeT
N6n7h4hYrGzWlKbim0KbL+8+ZSaTZ1cNoExlP0MpBCWlH5c2x2JJN7v1yLlnA6bD
jPctkZB0rQ1RRG6YdVbiclxH8BfDVSPdXH1384S7Do3Ej+ULo8u62e2/7dwSnslF
cvJq84M4xEqU8znq5Fz6YSzcBsFtKKITuJ7Bpz7ymYPT7yYWFB4Eno0KOXOOl/kU
L1IwAp45r558lzRQUZ/pfOgesMq4Qwl4ceWXa5HouoBLNiEYXdSn/i6JanzVnFLA
WLAGxwDEjr+iEkt+M8hVULudnH8KzDX7DSSopKNbRVYjH8LE9RRFpPG+VnVxp2iT
prxl78O4
=zge5
-----END PGP SIGNATURE-----

--jmkjnrr3gdhy2aoa--
