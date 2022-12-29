Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C92A659091
	for <lists+linux-hams@lfdr.de>; Thu, 29 Dec 2022 19:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbiL2StA (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 29 Dec 2022 13:49:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiL2Ss7 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 29 Dec 2022 13:48:59 -0500
Received: from www11.qth.com (www11.qth.com [72.52.250.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED2AB1F1
        for <linux-hams@vger.kernel.org>; Thu, 29 Dec 2022 10:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
        s=default; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=ftQM0a7hjhjh1/vbTbQy0p8EMfLeTXnRio2GWmH5D7c=; b=LlOT9c5M8yYfDtglLmXpEP253L
        G/KE/i0+FP7ITfLmoiwCJhddMBzderMfrsu4XIAc401vfvN5NYLnxNgOUjpiVw7v9bXtswwBcuZRS
        a9YTSxdrPhw1hlsEA+wXbkLK1LAnxLJlzZd5n3kxndsDOMUoICCyuMCFeAWAx9jXKukI=;
Received: from [68.234.117.129] (port=47436 helo=merlin.lan)
        by www11.qth.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <n0nb@n0nb.us>)
        id 1pAxxX-006apA-VQ;
        Thu, 29 Dec 2022 12:48:56 -0600
Received: from nate by merlin.lan with local (Exim 4.94.2)
        (envelope-from <n0nb@n0nb.us>)
        id 1pAxxW-004D2i-Jo; Thu, 29 Dec 2022 12:48:54 -0600
Date:   Thu, 29 Dec 2022 12:48:54 -0600
From:   Nate Bargmann <n0nb@n0nb.us>
To:     linux-hams@vger.kernel.org
Cc:     Thomas Osterried <thomas@osterried.de>
Subject: Re: [PATCH] libax25: ttyutils.c: Correct suspected typo in
 speed_struct
Message-ID: <20221229184854.vbscngn5qu2hhcqi@n0nb.us>
Mail-Followup-To: linux-hams@vger.kernel.org,
        Thomas Osterried <thomas@osterried.de>
X-Operating-System: Linux 6.0.0-0.deb11.2-amd64 x86_64
Organization: Amateur Radio!
References: <20221229181420.998996-1-n0nb@n0nb.us>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yut2l5qrriejf5ys"
Content-Disposition: inline
In-Reply-To: <20221229181420.998996-1-n0nb@n0nb.us>
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


--yut2l5qrriejf5ys
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* On 2022 29 Dec 12:38 -0600, Nate Bargmann wrote:
> Looking over recent commits I noticed what looks to be a typo where
> user_speed did not match termios_speed for the B3500000 declaration.

My apologies.  This applies to the libax25 repository:
linux-ax25.in-berlin.de/pub/scm/libax25

- Nate

--=20
"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."
Web: https://www.n0nb.us
Projects: https://github.com/N0NB
GPG fingerprint: 82D6 4F6B 0E67 CD41 F689 BBA6 FB2C 5130 D55A 8819


--yut2l5qrriejf5ys
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSC1k9rDmfNQfaJu6b7LFEw1VqIGQUCY63hFgAKCRD7LFEw1VqI
GSYSAKCU1mhimCE122JhKGgvbRiyfvr+VwCfaCwgFZ4UfrR1uyQjePN7TyJMg20=
=T1cu
-----END PGP SIGNATURE-----

--yut2l5qrriejf5ys--
