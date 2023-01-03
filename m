Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEF2465C133
	for <lists+linux-hams@lfdr.de>; Tue,  3 Jan 2023 14:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbjACNxT (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 3 Jan 2023 08:53:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232179AbjACNxS (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 3 Jan 2023 08:53:18 -0500
Received: from www11.qth.com (www11.qth.com [72.52.250.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD400FF2
        for <linux-hams@vger.kernel.org>; Tue,  3 Jan 2023 05:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
        s=default; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=vLCQ6CQEm+gpl78tSFS9ucveEjpQTykuEjx+CJXiOuA=; b=pmw8xUG2nQE+xu8ipJrqwp0Z1L
        jKM61amEyxmcKeo+7QHf95UCkfA2PS8zfXxnvkFo7b+kbAHX9esgSsXODIk6dRXTvtmEWZRsahMpq
        B/Ev+f4Kek3YhQtLDvhCookUd4Dv8pCvprauTYwFPB1JehZKJbzWsGkBNVf7MFeZL2E4=;
Received: from [68.234.117.129] (port=46838 helo=merlin.lan)
        by www11.qth.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <n0nb@n0nb.us>)
        id 1pCd2m-000HNa-RS;
        Tue, 03 Jan 2023 07:53:13 -0600
Received: from nate by merlin.lan with local (Exim 4.94.2)
        (envelope-from <n0nb@n0nb.us>)
        id 1pChHT-007vIx-Qj; Tue, 03 Jan 2023 07:24:39 -0600
Date:   Tue, 3 Jan 2023 07:24:39 -0600
From:   Nate Bargmann <n0nb@n0nb.us>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org
Subject: Re: [PATCH] ttyutils.c: Correct suspected typo in speed_struct
Message-ID: <20230103132439.p3mqom5viabx372d@n0nb.us>
Mail-Followup-To: Dan Carpenter <error27@gmail.com>,
        Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org
X-Operating-System: Linux 6.0.0-0.deb11.2-amd64 x86_64
Organization: Amateur Radio!
References: <20221229181420.998996-1-n0nb@n0nb.us>
 <Y7PpGuwaVXbhqfxf@kadam>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nsasw4wyrx7sfe7o"
Content-Disposition: inline
In-Reply-To: <Y7PpGuwaVXbhqfxf@kadam>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - www11.qth.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - n0nb.us
X-Get-Message-Sender-Via: www11.qth.com: authenticated_id: n0nb@n0nb.us
X-Authenticated-Sender: www11.qth.com: n0nb@n0nb.us
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


--nsasw4wyrx7sfe7o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* On 2023 03 Jan 02:36 -0600, Dan Carpenter wrote:
> On Thu, Dec 29, 2022 at 12:14:20PM -0600, Nate Bargmann wrote:
> > Looking over recent commits I noticed what looks to be a typo where
> > user_speed did not match termios_speed for the B3500000 declaration.
> >=20
> > Signed-off-by: Nate Bargmann <n0nb@n0nb.us>
>=20
> It seems like Thomas is going to take care of this and apply it to the
> correct repo?
>=20
> In the future don't put "suspected" in the subject...  :P  You want to
> sound more confident than that in the permanent git log.  Put those
> kinds of waffle words under
>=20
> > ---
>   ^^^
> this cut off line.  "I'm not an expert blah blah bah but it definitely
> looks like a typo.  Review carefully etc."
>=20
> Anyway, it looks like you are correct and have eagle eyes!  Thanks for
> the patch!

Thanks for the feedback, Dan.

I actually had the message worded more tersely and then after some
reflection I figured it sounded better to offer an olive branch in my
first submission to this project.  :-)

I will be more forthright in the future.  ;-)

- Nate

--=20
"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."
Web: https://www.n0nb.us
Projects: https://github.com/N0NB
GPG fingerprint: 82D6 4F6B 0E67 CD41 F689 BBA6 FB2C 5130 D55A 8819


--nsasw4wyrx7sfe7o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSC1k9rDmfNQfaJu6b7LFEw1VqIGQUCY7QslwAKCRD7LFEw1VqI
GdN6AJ0YUxWaJe//4ism+pLnS0kRKY/DygCeNXKENgr7233PpqmTvXRsqQOc04E=
=5+vX
-----END PGP SIGNATURE-----

--nsasw4wyrx7sfe7o--
