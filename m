Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D96A3660B2E
	for <lists+linux-hams@lfdr.de>; Sat,  7 Jan 2023 02:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236276AbjAGBDe (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 6 Jan 2023 20:03:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbjAGBDd (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 6 Jan 2023 20:03:33 -0500
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE8A81C05
        for <linux-hams@vger.kernel.org>; Fri,  6 Jan 2023 17:03:30 -0800 (PST)
Received: by mail-oo1-xc43.google.com with SMTP id m23-20020a4abc97000000b004bfe105c580so913143oop.4
        for <linux-hams@vger.kernel.org>; Fri, 06 Jan 2023 17:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C56Q+YV0i1VwzqpPgsaApjf/2tDIDNvnJyLhwVpmM08=;
        b=VGUmEMTQw2QsK16ws/gGUjfmqMr5beHGL02XjUOYSma4PTDn21KJ8eyG94/KyBlls3
         jCa+WHbDNv4VI0X1t4AqunlpGGFoEjq9sffORpq7V4ik8D+P6/LItDmRPT/PEgxgSNKV
         D6uJPIgAWt3tmPWS9IezKQyUzbimrMVWK+C4TqX7x6ihiXHdwthOeJhEwPNjdjkyvlTI
         WjOYGbZ79lxIjKNOrLWrVqSgKNtI+ipmWmZRYbJozcxUbTKaierRdKhdFc1gFtBlKnjD
         n+YPYyVWRSHpJ/nMKIAX4TiSoKXQ30ccaUjef4i2BQHWXs2sMz1x5pQLGzFEvGhbcLGk
         Pfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C56Q+YV0i1VwzqpPgsaApjf/2tDIDNvnJyLhwVpmM08=;
        b=VMwTBLv212k9jUAlGOkpHZLPSdpmtajmdjocezIr2FUjYd2wZNLM98XZEPvKim+oaC
         3bHoLZ3Hf8gCJ7NDlgEPKwy6w1BYydYau0ewvCfTwTL2IzT7fvZbd2doVi62hYqCF+3+
         p4q5h9xesYTf20DAYZWEZleHqPDP6MbnNg4hDuHac0hDkYpgpX7OQhexVKph3FCstg7N
         +nlZbVh/uKkefTAUd1yAq8H7HNmbm6K0cion6rctrhYZTysT9NtT70IDt//CYQWcUXzs
         6lZUiUsRcOQhctMOU7YkGt5Zoin6MRCRHa6ZccOkcUumOCDMZw3JozjuBKHLbxrDxXmk
         XFuQ==
X-Gm-Message-State: AFqh2kqfU3vG0WVFTDLheVxz+HexsURZVorW1c5YgT80g8dNJCEKBFda
        Zfw+kp+h5asPgFB86XFq4ZU4r6kLTPjFyNkEUcU=
X-Google-Smtp-Source: AMrXdXtS2yx0seUEnEoCe0TQXbOkI63ubAWlUIISRG6so3ONPrDu1tgccTdfYqa/MHduEL5IhTtuuK25lmFZLnf7JzA=
X-Received: by 2002:a4a:9791:0:b0:49f:95ed:bdcd with SMTP id
 w17-20020a4a9791000000b0049f95edbdcdmr2549395ooi.68.1673053410219; Fri, 06
 Jan 2023 17:03:30 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6808:2387:0:0:0:0 with HTTP; Fri, 6 Jan 2023 17:03:29
 -0800 (PST)
Reply-To: jamesaissy13@gmail.com
From:   James AISSY <samueltia200@gmail.com>
Date:   Fri, 6 Jan 2023 17:03:29 -0800
Message-ID: <CAOD2y7kiQ9uFLXnHUu6+1wBi_05ROuFbRYGRAjufmJCtqp36GA@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello My Dear,

I hope this message finds you in good Health.

My name is Mr. James AISSY. I am looking for a partner who is willing to
team up with me for potential investment opportunities. I shall provide the
FUND for the investment, and upon your acknowledgment of receiving this
Message I will therefore enlighten you with the Full Details of my
investment proposal.

I'm awaiting your Response.

My regards,
Mr. James AISSY.
