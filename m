Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9B861F079
	for <lists+linux-hams@lfdr.de>; Mon,  7 Nov 2022 11:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbiKGKYc (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 7 Nov 2022 05:24:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231950AbiKGKYS (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 7 Nov 2022 05:24:18 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987BF18E34
        for <linux-hams@vger.kernel.org>; Mon,  7 Nov 2022 02:24:03 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id v17so10667760plo.1
        for <linux-hams@vger.kernel.org>; Mon, 07 Nov 2022 02:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AOmtRIzmF5dcnWrT0j3skK83MYTC+QvduwZ6ndeN2Ks=;
        b=Zv++OJ/ncK2pWuUWAQT+z52+cIoHK/WVJU4bVze52hunD5wDL4D5XJdl5mW2VbRjhi
         PKA0tQ/z42/ONfUnPJoBfdYRGEG2gwiyoDRW7hecaxcg+/0t0u3g44ISFlpe+B9l1fvu
         TmkNgtKOyak6WThRMAIvY+g5IgPZxvnz63e21BpajeaX9653GP4qpHUHyfV7BL4cSNb4
         pCU1fNGxZBn7NlKzWZCMHMxM9LSs8sKofgpQ0FSoeb/qTDQ+CPP+tvlBe/vGQ8T8hOyn
         vdUZr48/zTuwVxtBDF6IrOR7pT19nf73qD9i1Q8QUWEzM8dVJjwmGS+xVbVCXqFaE09J
         SKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOmtRIzmF5dcnWrT0j3skK83MYTC+QvduwZ6ndeN2Ks=;
        b=YU2vxBhEFDe84vgXFMITJ1mkpfis/JiRkWGMCepccjvlBH9RX47r8G42O5+rm+hNC2
         o3c2yOfeRpSN8RY7/GY5YIOIFjNQvgp9KSGTUH35kMqF0x77AR2Cw4OLe4wSCbBi6Nn2
         HedBserG4a55If0TgkHpskfzzAoizEkRU/gyXp6s6gT4uj+43HQQhfdH/9qjXrR789gm
         9kYphdgYR7YIFbmrD21yq0LBegHWTmjh8EZxbNw6dlUmFkIufqVVi61Fct1D3oFaTvja
         rZBa6u+DuodaCwHR1R+W7FoywXPx4bgf66z2c3fUNPvmB0woWHo9TjhAVj7eZFt1jyEH
         ST/Q==
X-Gm-Message-State: ACrzQf1Ouigu+GvQEw3c139WUvoMGzfHVFSNbZmcUE6PMIIwG7QxBJV5
        dtJd4sIq4PR9sMy7TDnS9vEqn6sc3qqlYi3tcFJnvxUAoVI=
X-Google-Smtp-Source: AMsMyM7DPjaK7bSeUBIcMTkNZUaqK+NSwCEUfp88ZZDLY5TXShnQ2+B86xH3ryBKqTyGQWW3ozA/96x60VupsK8qo34=
X-Received: by 2002:a17:902:8a90:b0:186:b145:f5ec with SMTP id
 p16-20020a1709028a9000b00186b145f5ecmr50774476plo.103.1667816632274; Mon, 07
 Nov 2022 02:23:52 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a06:925:b0:587:19e0:c567 with HTTP; Mon, 7 Nov 2022
 02:23:51 -0800 (PST)
Reply-To: contact@ammico.it
From:   =?UTF-8?Q?Mrs=2E_Monika_Everenov=C3=A1?= <977638ib@gmail.com>
Date:   Mon, 7 Nov 2022 11:23:51 +0100
Message-ID: <CAHAXD+bPNCns8Ez=7iXmPLADMtJgZj3-mFTk3NMhWC-Ca1b9rw@mail.gmail.com>
Subject: Re:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.8 required=5.0 tests=ADVANCE_FEE_2_NEW_MONEY,
        BAYES_20,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,FROM_STARTS_WITH_NUMS,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:643 listed in]
        [list.dnswl.org]
        * -0.0 BAYES_20 BODY: Bayes spam probability is 5 to 20%
        *      [score: 0.1662]
        *  0.7 FROM_STARTS_WITH_NUMS From: starts with several numbers
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [977638ib[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  2.0 ADVANCE_FEE_2_NEW_MONEY Advance Fee fraud and lots of money
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hei ja miten voit?
Nimeni on rouva Evereen, l=C3=A4het=C3=A4n t=C3=A4m=C3=A4n viestin suurella=
 toivolla
v=C3=A4lit=C3=B6n vastaus, koska minun on teht=C3=A4v=C3=A4 uusi syd=C3=A4n=
leikkaus
t=C3=A4ll=C3=A4 hetkell=C3=A4 huonokuntoinen ja v=C3=A4h=C3=A4iset mahdolli=
suudet selviyty=C3=A4.
Mutta ennen kuin min=C3=A4
Tee toinen vaarallinen operaatio, annan sen sinulle
Minulla on 6 550 000 dollaria yhdysvaltalaisella pankkitilill=C3=A4
sijoittamista, hallinnointia ja k=C3=A4ytt=C3=B6=C3=A4 varten
voittoa hyv=C3=A4ntekev=C3=A4isyysprojektin toteuttamiseen. Tarkoitan saira=
iden auttamista
ja k=C3=B6yh=C3=A4t ovat viimeinen haluni maan p=C3=A4=C3=A4ll=C3=A4, sill=
=C3=A4 minulla ei ole niit=C3=A4
kenelt=C3=A4 perii rahaa.
Vastaa minulle nopeasti
terveisi=C3=A4
Rouva Monika Evereen
Florida, Amerikan Yhdysvallat
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Hi and how are you?
My name is Mrs. Evereen, I am sending this message with great hope for
an immediate response, as I have to undergo heart reoperation in my
current poor health with little chance of survival. But before I
undertake the second dangerous operation, I will give you the
$6,550,000 I have in my US bank account to invest well, manage and use
the profits to run a charity project for me. I count helping the sick
and the poor as my last wish on earth, because I have no one to
inherit money from.
Please give me a quick reply
regards
Mrs. Monika Evereen
Florida, United States of America
