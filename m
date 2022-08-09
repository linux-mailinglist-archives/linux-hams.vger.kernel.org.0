Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C96F58D7CE
	for <lists+linux-hams@lfdr.de>; Tue,  9 Aug 2022 13:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233367AbiHILFY (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 9 Aug 2022 07:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240642AbiHILFW (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 9 Aug 2022 07:05:22 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B95D11C18
        for <linux-hams@vger.kernel.org>; Tue,  9 Aug 2022 04:05:21 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id a89so14636937edf.5
        for <linux-hams@vger.kernel.org>; Tue, 09 Aug 2022 04:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=7Y/JdsEkSREwJKr86OHWX5QErz49ZeuAmhJMoJpoQbc=;
        b=TB1VLC9Xk+s56nGeUIPDOPMNk7tiYe1A+DSXkOZw7uXaiG0oO1vv9MGhfj8bs6iHHX
         gXhZ+6GtI3O7APVt6nU5y+cW1bg+XZO4m8mwjaRb42uJgpbZkE6uB9gsJS5yYFDC9ZSu
         0VyAW/YCozt5RrdQsFjAbR8TUogiOGycGiyzfBoeVGz9iblzrMbN1lVvG0uBJeLPkEvq
         9Z9mqCDrXfD2FjAQLKDFxIBTf8L+OIv1od5scBt4vS/bjfh9fmQUCTh2HrtOLqo+Sf0k
         0wO8OydyKG+eYhOyFcfksXGejhf48o+SIhwUkZkzTscksGpAmRRCeCEUWbT/foQGb6vJ
         GLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=7Y/JdsEkSREwJKr86OHWX5QErz49ZeuAmhJMoJpoQbc=;
        b=tNUk7cjIZK6joaKHV4j9D5I0fSC6tSuG+qOq1tkiz4g3Axwy0PIkaKfl5Q0QZAhcya
         5Ie48TiO2AEMuZpB/d8z1/q6DOumHck2C2S4qAmgoyDzL4OpxnXMt15/D5qmpEwDsLaV
         PBS/fx2i6R+YJW5dmA8bnmfBsABk07j0ndy88lCYDGN1zYQm5qsUMlL3S6zshXRceKIf
         khnYGmG+zda2ACPoVRU+aKrrYAlEjC/o6Z24pe+jBVtOvAIYfu+OIU7eyfKgirBRTYnE
         W5ruIU2C1Mf9fpn/l22525//VXrzVPlL6w1ei8N5usbiI/L/5Rt5CcO9aPuXI46M94bO
         b1+A==
X-Gm-Message-State: ACgBeo3HwfmBMC2eav9PTL/OuYoLlbNFJ9IE8WSPo9Io+czo7OWEOTtA
        bjupPpHvZOIMx5gwVqeVm9lZjhWg0uEKJSTiEVY=
X-Google-Smtp-Source: AA6agR5uVAL71snQjlfLDpnjOJyo5WIwQxsziEhBPG9Ks9jV7Lq0ZzRdcW4cS7SUwA+ZolgLvQSS6WLEc98AL7bcs+g=
X-Received: by 2002:a05:6402:5024:b0:440:e4ad:f7b6 with SMTP id
 p36-20020a056402502400b00440e4adf7b6mr5232760eda.358.1660043120010; Tue, 09
 Aug 2022 04:05:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6402:2b8c:b0:43c:570d:7d55 with HTTP; Tue, 9 Aug 2022
 04:05:19 -0700 (PDT)
Reply-To: evelynchez7@gmail.com
From:   EVELYN SANCHEZ <richfirm40@gmail.com>
Date:   Tue, 9 Aug 2022 12:05:19 +0100
Message-ID: <CAP5NkWbVVtOqKUUF=z+YYdhHM6Hvs+327nfuxW8G9YMMO+C0sA@mail.gmail.com>
Subject: =?UTF-8?Q?Buon_giorno_come_stai=3F_Per_favore_quando_ricever=C3=B2_l?=
        =?UTF-8?Q?a_tua_risposta_al_Email_che_ti_ho_inviato=3F?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:542 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [richfirm40[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [evelynchez7[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [richfirm40[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Good Day how are you? Please when will i get your response to the
email i sent to you?


Buon giorno come stai? Per favore quando ricever=C3=B2 la tua risposta al
Email che ti ho inviato?
