Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A646C56C280
	for <lists+linux-hams@lfdr.de>; Sat,  9 Jul 2022 01:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240448AbiGHVUA (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 8 Jul 2022 17:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240081AbiGHVT7 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 8 Jul 2022 17:19:59 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011482BB09
        for <linux-hams@vger.kernel.org>; Fri,  8 Jul 2022 14:19:58 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id p129so10049992yba.7
        for <linux-hams@vger.kernel.org>; Fri, 08 Jul 2022 14:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=4K4mMKpXpf4R41YLhVfBwKVJzk8ioNewf9siCI5kyc8=;
        b=I4FzbgMvm4Y8V4egJjBo2dI0dOpJM5FHSzWoJVA5s/qswPvIRM/khh2Z7k9AP/R7l3
         zV2b/+ESAYqxpoBKWbQrm3bY0kRwfHuVgY7vsif1a709mTY+b56qB0jPAoTDFMxJ/+je
         lISp+G6NuBLklKk9c4+8saU+2vu8ox9Zw3JxAl9itKGmbSN3sHufpptVpFsjp//7o5Q+
         w04kJz4fIANwWkwDiRe+Ii11vhU6cIsdFT3mBDSeIcWVL1Ah55eK82JAeHKKy35Dv0jr
         b7gro165LxHPpmkVct/oENU2KdJQf7Y4/tt1cCaW+eMTPtjYEk0IM7d0HjCgaHiKKiU+
         z82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=4K4mMKpXpf4R41YLhVfBwKVJzk8ioNewf9siCI5kyc8=;
        b=qmszGJLnNwjDtYbDBTCm6bWyXGahS3N6pKZBjXLrp84rKozSDWYbQb92nLcbB2/L3C
         yvhHSVnMlDi2HaWTvIQCNMQyBTBx65hnCyRzhTfArtLTrZhGmdBzFEQbN6Dv17rh37L2
         gtz6sfUYKf4ZDsUnwi7zjFk3xbv0ZPs76NMjrDI/X4f5LSeq3yXPzhtcavdyTi2Cpz5h
         abiiMfBDTjtjc/7wfzjtsxBkdlTk9q2IWajRMFp0dsoKbOi/yvVUxOKdNXVuIAQFPj6p
         EKePDbfZV3qfnhscJfqi/y9jtMsvBC3pW5o6wseip/R2SWt72PFp7e+asr9P26ZoJSV8
         Xc0A==
X-Gm-Message-State: AJIora+EKPn0sZffowj30/rIgsvZcLrkxYz201ddRl/q0mzQWP4u+pR1
        Cf7PD+mva6rnnoe3yP0pw5Wss+UhYE1mwvIb9yY=
X-Google-Smtp-Source: AGRyM1vLdHBMqrfIy4Vbjy3KYixLPHen1EJa2Ps0Pfaz5Rt7AGW/ff8j2H4S4jb9v5U5Vh3qVA7S+hMLhqN35vrVcJ0=
X-Received: by 2002:a25:d253:0:b0:66e:4d5b:8a67 with SMTP id
 j80-20020a25d253000000b0066e4d5b8a67mr5542216ybg.627.1657315197890; Fri, 08
 Jul 2022 14:19:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:26a9:b0:2d9:cadb:e46c with HTTP; Fri, 8 Jul 2022
 14:19:57 -0700 (PDT)
Reply-To: pstefanopessina80@gmail.com
From:   STEFANO PESSINA <zaitunagoi@gmail.com>
Date:   Sat, 9 Jul 2022 00:19:57 +0300
Message-ID: <CAEXtvcK3BXKW39G-vgVGFiHzT3vmYrWYgyqEDtnD5dNRWdJVuA@mail.gmail.com>
Subject: =?UTF-8?Q?Herzliche_Gl=C3=BCckw=C3=BCnsche=21?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
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
