Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64E97621B2D
	for <lists+linux-hams@lfdr.de>; Tue,  8 Nov 2022 18:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233945AbiKHRwe (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 8 Nov 2022 12:52:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234661AbiKHRwe (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 8 Nov 2022 12:52:34 -0500
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 739AEE6C
        for <linux-hams@vger.kernel.org>; Tue,  8 Nov 2022 09:52:33 -0800 (PST)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-13c569e5ff5so17073260fac.6
        for <linux-hams@vger.kernel.org>; Tue, 08 Nov 2022 09:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGXBOuq58WurCylRRsbGEB9nYBgO4mKHxsGKups/IY4=;
        b=Ks1htzIw3zEZrZCi6sEGCpoh9hDN82rfXBbZi+bbOBKvyXr50OQR3NrswtfR9kYCgL
         hSDPO1wIAPn6BpNPbCXDF194zYN6Xs7cpbzGMZxAwGyQ+kaMnNRXBDH1k/h4L7B0BC72
         9mjmtBEML/W1b1qreUfrnJwzNAEb9xMIP/z8LbuAd7lsIFCCxAZx8qPvhhBpGpg3VY4i
         W7AZKRJV5XJ8atzUwlPFNO3QdVJ6lKdknfmtpQ8WK2Csz145jSb4XiBsceD8bTzun85q
         5fXt/PLdP6osDa7bSippS5jwp1Tcq279ReqqDeCeGztOG8tOpVKRvzFVH4+QWWLI31cz
         s1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGXBOuq58WurCylRRsbGEB9nYBgO4mKHxsGKups/IY4=;
        b=tpqFWTcNT/PXr25Q6bId7vn0jthxDaBN3wLYZK69bx4Ypc6jOUW7twQf82NqqZPCpT
         kFvuUvTINz8jxe0h/Dpq6d5WI0Wg5VWMZQrEvQ9fEOhm/edU2JX+jT09R2xYplRJEPc7
         2l3uoD4zJwpw6q87LjIvVk02inpXMTzU5ZXzXINFlEE11mL67ppVcnc3kM+OLz7z5HN6
         NmEjU8Al3XzkLgHBzYteCYwljA+xw1n/gVtm3HKtZXRkheC4tUUGz+uEv3cobr+3l8ef
         lHZC6h19AGbb9GwmHq6CpXRX1xQrU4qdZn9QSCMUKSpGYRVhHEyadUUflM94dRskPx1L
         Zjog==
X-Gm-Message-State: ACrzQf3NalXpIlOvD5T8weZGYxDDpNLQBwHKujeNv+ozKbCPL5FtKtvQ
        G/lMxoN/m4RXPiZ/xC5J3o4IUnyWRKJ7ZA==
X-Google-Smtp-Source: AMsMyM7kGmV1TYZsUyuhNc7uEg61GYIubBjiHvPvCTT7YC7HL7Y6MUuKu1SApwV4r5jtf81JuZV+vA==
X-Received: by 2002:a05:6870:315:b0:13c:7aa9:490b with SMTP id m21-20020a056870031500b0013c7aa9490bmr34068067oaf.100.1667929952789;
        Tue, 08 Nov 2022 09:52:32 -0800 (PST)
Received: from smtpclient.apple (rrcs-98-6-209-20.sw.biz.rr.com. [98.6.209.20])
        by smtp.gmail.com with ESMTPSA id s1-20020a05683004c100b006619533d1ddsm4303420otd.76.2022.11.08.09.52.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Nov 2022 09:52:32 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: Replacement for linux-ax25.org git?
From:   "Steven R. Loomis" <srl295@gmail.com>
In-Reply-To: <Y2pybykD07N1nBG+@x-berg.in-berlin.de>
Date:   Tue, 8 Nov 2022 11:52:21 -0600
Cc:     "Mike McCarthy, W1NR" <lists@w1nr.net>, linux-hams@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <61461727-F28B-4842-9EC3-F7F600B9AE5A@gmail.com>
References: <550e4271-a857-4540-953f-4c395e4bb2f5@app.fastmail.com>
 <ed2bfaa6-4c68-5743-90aa-0149322e5f94@w1nr.net>
 <Y2pybykD07N1nBG+@x-berg.in-berlin.de>
To:     Thomas Osterried <thomas@osterried.de>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


Thanks for bringing this back.

=E2=80=9CLatest Versions=E2=80=9D on the main page right hand sidebar =
<http://linux-ax25.in-berlin.de/wiki/Main_Page> still links to the =
linux-ax25.org URL and are thus broken.

73, K6SPI


> On Nov 8, 2022, at 9:14 AM, Thomas Osterried <thomas@osterried.de> =
wrote:
>=20
> On Tue, Nov 08, 2022 at 08:41:22AM -0500, Mike McCarthy, W1NR wrote:
>> Does anyone know if the repos at linux-ax25.org
>> were archived anywhere before it went offline?
>=20
> linux-ax25.org domain is dead due to dns fail.
>=20
> The host running the repos is still in service and
> is available under linux-ax25.in-berlin.de.
>=20
> That dns name is not my favourite choice (see my post on this list =
about this topic),
> but it is future proven, does not depend on a single person, and is =
under full control.
>=20
> I hoped linux-ax25.org will come back. Now we have to live with that =
solution.
>=20
> vy 73,
>  - Thomas  dl9sau
>=20
>=20
>>=20
>> Mike, W1NR
>>=20
>> On 11/8/2022 7:41 AM, Dave Hibberd wrote:
>>> Hi all,
>>>=20
>>> I'm one of the folks in the Debian Hamradio team with an active =
interest in keeping our packet tooling going.
>>>=20
>>> With the demise of linux-ax25.org and discussions here about change =
of maintenance, is there a new canonical repo for ax25-tools and similar =
where these components are held?
>>>=20
>>> Our last upstram mirror was about 3 years ago, we've got it tagged =
as 0.0.10-rc5+git20190411+3595f87 [1] - this is what will have flowed =
down into Ubuntu, Raspberry Pi OS etc.
>>>=20
>>> If there's currently active work going on with these userland =
components, where is it happening so we can rebase our packages?
>>> If not, I guess this is something we need to make a decision on how =
to proceed as a community!
>>>=20
>>>=20
>>> [1]: =
https://salsa.debian.org/debian-hamradio-team/ax25-tools/-/tree/upstream
>>>=20

