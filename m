Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6886210B2
	for <lists+linux-hams@lfdr.de>; Tue,  8 Nov 2022 13:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233767AbiKHMaP (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 8 Nov 2022 07:30:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234075AbiKHMaI (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 8 Nov 2022 07:30:08 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0FA545A2B
        for <linux-hams@vger.kernel.org>; Tue,  8 Nov 2022 04:30:06 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id f8so8952572qkg.3
        for <linux-hams@vger.kernel.org>; Tue, 08 Nov 2022 04:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=cigNPlEtEE1k5xiZ9PvVBazoo9lUtOBUwB6YZSwBfhiXaLfnGYlViGJ/CkI7QbpyRc
         DUkc/pXyGXkzwxwNKmQ/AVr17gtcnro/HIxn3z8V8Vc+39bff1bepY3CjxGya/RlhJQD
         pm03SLH1zh1vk5Et08W05yayJWnxdxRnbNjb7jCohrMzy/0/FJWKkATniYBbpKgsaBKE
         Z+OGb8Lsc3JgCU/vlNmJzwFukVrY1yODwKOWdcEffdpTGbLPgR5Erg+jlwzjZKljWkGx
         l6m9q0cv+BGPJ+GX+X1NDb4hrmrYY0d2qQvBndPhFSr7mcH+QfGu5TnM80huZaOEkW4m
         IdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=Wtts5fZNp14i7kMZ6kLvxuChHzBmO3PRFilsjUELJ6+lTzz3wWGMNPyRq0Mf0vi4id
         AcVnzGsAHF8w8NDxQu54Zk5U7ZEHyI+I0Nx9tLx4faBQs+5sZb2PXjSagNefqu69m6Ny
         GKVJstae0pk7/lonY6qggJ/pPDiVVwqOmfPxxZ2hNiVvZ6BPtVsrZCQEieiBd/bbHgR6
         EahvzyLGWBVGSLokAH5LtmR9nV4LE4Rhj59wcFnNUUhueixQb/US4p64J8OLYuRSatL6
         H8N37NnRf5fZsCHO3/WzE2r7RFWtUfg6kSUQSTE7yqIlAjIRGl3IIF+7kC7pRJ6BX2NO
         maqQ==
X-Gm-Message-State: ACrzQf0HQZqoBP8wEfZcDMllMq48hj4WChEMly/2+C0ZvufIEYsTww9z
        FrcbujdfNeNoaRUhJS+ih2iPCDJv6k1jc2ImYvA=
X-Google-Smtp-Source: AMsMyM58hZ1EPsKu7coHtKEAadQRfLUwq2/6MbLEjdgMZ+NpfmCkJjte0dLlRzUMReSpEc0nbvrKDwByTED+/niEF+4=
X-Received: by 2002:ae9:eb48:0:b0:6fa:d61:4510 with SMTP id
 b69-20020ae9eb48000000b006fa0d614510mr37684535qkg.768.1667910605712; Tue, 08
 Nov 2022 04:30:05 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6214:2f8a:b0:4bb:6e86:8303 with HTTP; Tue, 8 Nov 2022
 04:30:05 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   Mr Abraham <mr.abraham2021@gmail.com>
Date:   Tue, 8 Nov 2022 12:30:05 +0000
Message-ID: <CAJ2UK+YqK-OgWa-GbqjTU89edKqVZ5nqmL-j=gKpwP5uFtkvUA@mail.gmail.com>
Subject: Greeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:72d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4958]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.abraham022[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mr.abraham2021[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mr.abraham2021[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
