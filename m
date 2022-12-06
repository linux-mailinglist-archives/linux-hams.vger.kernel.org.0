Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7BB64448C
	for <lists+linux-hams@lfdr.de>; Tue,  6 Dec 2022 14:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234167AbiLFNb4 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 6 Dec 2022 08:31:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233790AbiLFNbz (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 6 Dec 2022 08:31:55 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E269322507
        for <linux-hams@vger.kernel.org>; Tue,  6 Dec 2022 05:31:53 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-3e78d07ab4fso81347907b3.9
        for <linux-hams@vger.kernel.org>; Tue, 06 Dec 2022 05:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=OeyCMsHYScRvVh8RXebzMnb6pRDfFrPhGFM5Oo/oZrwyoa5Qe6A4MFoFU3Mp0QEA1i
         SYxbR4sBY6B2f4vL1OEJybUifemEqA8IjQX2J09dxjCQRODPxlkwi9ZEZSAu9TEhort/
         rwllpgNt60odz5Nl0j8spOK2S4UH94zHMFD6KX6br/bHNI2fZHIzqWvZlcUTMKyD9vqw
         pbBkxrH6eRDakHg6i3SDW/XG3pxdEfflEK99JxjqsHbJ7YAIkEj/5S6ueT5UYlPSmqQ/
         Hub6z0zknduscVyttBCDKyxn8xzrz/kgtfd7lHkiDU9nHicul2vZth5Aja6oh/8jcMGO
         G90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=ArLSz75NJ1bNKf01ksQLELTatRcZc4D5FrtMbNvku74GCIc8ZhrkhLJF+xyLQMKcxs
         MwSp90BovvuLb6GoBazycF06AY8mFa++LhvvPETeEP50JiDTYrk7okgj+QKCMymvxOr9
         xWXlvx9jZ5ALdGREQ3TQ9r9zQ9qyCfFci98zXoJC1oSTDoyxlAvmdTHiQ/GYYaRKoaIS
         NPKyBTlTxx8tVbl8EhS7Ewm4j0q2mFtS+sq/56Eg+pnFOIE2QQ9M1d8R3PCBnghiKk6v
         Hyu2kCKMCCSJau5nQDJxOuZ7u0iwIp7Zguw0iSAlrNoIMIoDqiayh7a4h8VfhdaBl6lb
         0nHw==
X-Gm-Message-State: ANoB5plSkpy0gv3nQzGfT4tJcFKDqi8PI1BHP8Wha6vITIJQmI+/OIWa
        XF4hTVT/A79ewRyTnj7KLxZrh9i/DUffSEioN6U=
X-Google-Smtp-Source: AA0mqf7Z2Y5k3chtNt8kbVNLNOAPCXtgRbw0oMU6LK5Q/RiR2Ia6QNch2ZuKx5+xFv9D2teTY/76/SaSp4zD3zNfpik=
X-Received: by 2002:a81:5243:0:b0:3d2:2098:c5fb with SMTP id
 g64-20020a815243000000b003d22098c5fbmr31214777ywb.121.1670333513086; Tue, 06
 Dec 2022 05:31:53 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7010:a205:b0:314:d2a3:70a with HTTP; Tue, 6 Dec 2022
 05:31:52 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <mrkojofofone01@gmail.com>
Date:   Tue, 6 Dec 2022 13:31:52 +0000
Message-ID: <CACJtp8vgE8Nrmo+zWDrnXRqoM_o=MmruUY09Qi=4vFfLMPDrtA@mail.gmail.com>
Subject: Hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
