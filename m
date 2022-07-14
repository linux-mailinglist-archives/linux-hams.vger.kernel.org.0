Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9D05575748
	for <lists+linux-hams@lfdr.de>; Thu, 14 Jul 2022 23:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239378AbiGNV7s (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 14 Jul 2022 17:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232682AbiGNV7r (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 14 Jul 2022 17:59:47 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFE26717D
        for <linux-hams@vger.kernel.org>; Thu, 14 Jul 2022 14:59:45 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a10so3734600ljj.5
        for <linux-hams@vger.kernel.org>; Thu, 14 Jul 2022 14:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=4K4mMKpXpf4R41YLhVfBwKVJzk8ioNewf9siCI5kyc8=;
        b=HwTFwEdjTPprjtK17J8/WeYWJqqlfUs8tbjad5rOKSK704OhdKcu94400iED6c3lZy
         3E1GJ17k82q0lpVwxt4/9LQUlu/tbEvzF9o+dcsaVj2WgaBk6oTB1kLsEQ1d/3ssmuKT
         FQ5YFYYb5eKtpEVJtdhevZlR+5dUZ5tp+e4S7F/RfdLS8mouXUb+vxndusJxEU/tnGmY
         VIHVW+i60slDs2YIfb3w9ZrEJR3e42Pj1SGI1HlM7nkZZkpYGCba0Gkp8u1hisIRxtE3
         cvLa/FbuO6/WfIgZl4oU34tlmjA0zB4IU/eOVNJQbnPL7wmh3pDBpZWVXx1JQoP9wtND
         9xwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=4K4mMKpXpf4R41YLhVfBwKVJzk8ioNewf9siCI5kyc8=;
        b=QH9RWIuX1fWR3doXLeX/JeLW9UU9n/26TpGcjz/1eB4YNZpc9J7Srav1mWJNZnh1u+
         x0ej7oGq+Gi7Dzy71R1mKipx4vVSh+6eXfq/GDYQq+VLsgBGsd5ypXjigktcuQjvlsWq
         H5uOWO3g2k8oT3O+Difw2FU+SnFGN89E/Zlxz+PBccx2HGYsKkSfwedYheDZGTYvYl4c
         yLJ/L+/43VAxoFAYoiB/0oMUDdY9HIpBx/ubWGa3EGGMsZI+sgCMrm289EhCBpEUpi04
         FFK6C0j1Qh+30O65ArlnDEfjuBh1MEtVGL/7pZCO/US1/DbpzgGj2U5vxe6yY8P1B9Ki
         JBQg==
X-Gm-Message-State: AJIora/5bJLKovOAvGgxEZAUFcqtE5oFyzTt9Np11GdQypY5SsdWpqdc
        FXHSGKxLEX5dX0Rt78Da+/ozk1LZJ6HG5QN6dfI=
X-Google-Smtp-Source: AGRyM1t7U33+0VjrLzEnkBLnbYKFigGagtfaFQW0YLzwKsEyrsBy4c2yfTl2JViazsvSQKaeAXe233ORAMEUmV+q5tM=
X-Received: by 2002:a2e:aa1c:0:b0:25d:67de:717 with SMTP id
 bf28-20020a2eaa1c000000b0025d67de0717mr5277763ljb.93.1657835983658; Thu, 14
 Jul 2022 14:59:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac2:4828:0:0:0:0:0 with HTTP; Thu, 14 Jul 2022 14:59:42
 -0700 (PDT)
Reply-To: pstefanopessina80@gmail.com
From:   STEFANO PESSINA <khadroali2571@gmail.com>
Date:   Fri, 15 Jul 2022 00:59:42 +0300
Message-ID: <CACfD2Ly3DnXWc2wTEc2Qiix6Zx2xm81vaMZoPSy8u_tZOahBjg@mail.gmail.com>
Subject: =?UTF-8?Q?Herzliche_Gl=C3=BCckw=C3=BCnsche=21?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:244 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [khadroali2571[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [pstefanopessina80[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [khadroali2571[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

--=20
Herzliche Gl=C3=BCckw=C3=BCnsche!
Die Summe von 1.500.000,00 =E2=82=AC wurde Ihnen von STEFANO PESSINA gespen=
det.
Bitte kontaktieren Sie uns f=C3=BCr weitere Informationen =C3=BCber
pstefanopessina80@gmail.com
