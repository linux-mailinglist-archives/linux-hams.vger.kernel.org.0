Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2B85EB15A
	for <lists+linux-hams@lfdr.de>; Mon, 26 Sep 2022 21:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiIZTbY (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 26 Sep 2022 15:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbiIZTbT (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 26 Sep 2022 15:31:19 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A989F0F4
        for <linux-hams@vger.kernel.org>; Mon, 26 Sep 2022 12:31:16 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id n83so9473848oif.11
        for <linux-hams@vger.kernel.org>; Mon, 26 Sep 2022 12:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=rA5xeXD0TyjUhjvsrx6ejmOzOVqFLC9Uf1Of+5mK/os=;
        b=XYLGtCvyTnJImyC4fHMGRBRWfyyGInN0ek05ZAmxmZqzFNBT5Kr1LPwn4NSLbAHbck
         dJ4mTOJiA9Ng0qmJdG8lgA8J+4GW04jkMT0EZCXUP1k2nm1DDZWG/UWhgNwT2d311gxN
         cbzXEZcV9PEWeb4auJ8YfKX51kuM63TVorvqcTP621X6VMY42pEknEr00Qj/eaCkiv3u
         iIHSoKyAGlOaSeLoe9UzG98QVrElZO+9Ue7rCD3hFoNoOxcHO1OyBq8qgCmfHrjEa47H
         xRUze1ZrVNTpSAXVnKTKl41z7UCbFNPTrsF1+4880Xce3SH7oZ//g65K5OoBHG+dvcGs
         yzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=rA5xeXD0TyjUhjvsrx6ejmOzOVqFLC9Uf1Of+5mK/os=;
        b=rQLFt1XYm69FjO4vQXiqho2pYkJ6jo8zhHpKRb/lgMB2ApMU4ITZvt4G9653MRHATd
         tu9gyKaxXJYwnd+58hROirgCrCS4Gg0C9+G1+sZp4W7y9jhclCWVHFb9b/LBpnOauL+y
         9V2Y2l9wPFzc2laZvkWtOHkm/aJ/K2BcUiFVHtRrSImCs+EMgp8Ny+2+LXU6cAoumj54
         eejVm1XQnKiBPa0nlzl6ekSmqLhxogK5uxzyMbn0VkUM/QaW+zsCeFrCULCBjnLYT+VQ
         sF7qoCSlI5i8p8S1/iHzu8zB7S/xfF66LI82jMb1VxNB+wrFiYFBiWzObo6WIocAN/jQ
         XSVA==
X-Gm-Message-State: ACrzQf1NunCnL36vfjcabcszmVwA62m9e8Hk5xyjHO2AQd7rTqrUoojB
        RsrmMU3+g6+s2IsL9yGRZ1cjYGK/jUs1TsY0u/g=
X-Google-Smtp-Source: AMsMyM4VRTXS41jsPPJScI9q/EFUHpNf32UA5q3Da+DZbTVyGQsvA+z+WpVJmroZvC8Z6n2RBouuoygEzzes90zagS4=
X-Received: by 2002:a05:6808:30a0:b0:34f:656c:1909 with SMTP id
 bl32-20020a05680830a000b0034f656c1909mr140742oib.115.1664220675896; Mon, 26
 Sep 2022 12:31:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:7253:b0:c7:f373:780 with HTTP; Mon, 26 Sep 2022
 12:31:15 -0700 (PDT)
Reply-To: pointerscott009@gmail.com
From:   Aminuind Aabawa <aminuindabawa00@gmail.com>
Date:   Mon, 26 Sep 2022 20:31:15 +0100
Message-ID: <CAP_JfypsEfR_sHu+px7aKWhO=YFVcTcfQP7xigQtUQG=Q-mYWg@mail.gmail.com>
Subject: =?UTF-8?Q?Bussines_offer_Gesch=C3=A4ftsangebot=2E?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:244 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [pointerscott009[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [aminuindabawa00[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [aminuindabawa00[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

--=20
Hello, Do you have a projects that need urgent loan??
Granting out loans today in 10,000 / 500 Million to Interested
Investors, Companies & Private Individuals.
Revert back if you interested.


Hallo, haben Sie Projekte, die dringend einen Kredit ben=C3=B6tigen?
Vergeben Sie heute Kredite in H=C3=B6he von 10.000 / 500 Millionen an
interessierte Investoren, Unternehmen und Privatpersonen. Kommen Sie
zur=C3=BCck, wenn Sie interessiert sind.
