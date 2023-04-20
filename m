Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB9676E9CE6
	for <lists+linux-hams@lfdr.de>; Thu, 20 Apr 2023 22:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbjDTUOZ (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 20 Apr 2023 16:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjDTUOY (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 20 Apr 2023 16:14:24 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8FE1BF2
        for <linux-hams@vger.kernel.org>; Thu, 20 Apr 2023 13:14:23 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-b9525e18bfbso899692276.1
        for <linux-hams@vger.kernel.org>; Thu, 20 Apr 2023 13:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682021663; x=1684613663;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dCd1mdYXEqgK93odkn99S1OR1zuJDxkEC1hS/WVPxHE=;
        b=UQlZxXZoILSFCQKQX4D+PK45UcnRs/RfSJIzxlak1vaJb70xzdncp3FGcwbH1rHYqs
         zlFyJYYNB5Z5Z/o1F5YFWNFAhGFUxVCO1YLnMmf2M+09b1NR2pdNk9BxiYR0SCMsWWQa
         Ghkqpmu7Hakf6IQSDBHsT+1958Q1nhttZhtBrS7/IyziTiiltrq9BMjHsL3WPZZ2Z+FV
         clq7ONiTv2AGbMu5sRdB1wDt43+SE4GDtBhp9OHbfmt9VHBZg1dPdJ663kk/49bOWLTN
         PC+aYlVPYASGBhrJPfqb5C7ExaWkO4cHGXKpYzSVYFI8BdFt37E4J2MldD0QlCrpVIsm
         YJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682021663; x=1684613663;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCd1mdYXEqgK93odkn99S1OR1zuJDxkEC1hS/WVPxHE=;
        b=IkLCdjHgFKRgKwUBHMZ+hCoRDJW8FfPWfLCGC1lVwzvzw5N+naX3+Qe383yazc6Qe0
         HwPnx3sa+m4vpfLp2CQSDsV6IWD78QE6N3cs5LSKY4RfM0M31giBwuXYyP8Y/RiijwIh
         Jzgs8VfxEJ+dvAx9icz1CyPbhAa7e4mF/lYHiIvl8sEV4zTOT1GUlxK/MNkyzeJs+FYd
         XpljZ090eS/+xAOligTFq7fIJHlPQ/R+a6IVnY5kH1oJHqa+dToGcca1yaKlcH9rzyER
         lmmLm0Lpg9YdQurZdaNnBiQb02yySP4zR4n4Uo7jJyFrputcqVZ99KAyauutIR7pIu8l
         lyQg==
X-Gm-Message-State: AAQBX9flZNC9fyWz7hMw1D+FvsqRX8kZ2fCqcMEgdxb8yjVsbbArIPac
        jbNrYPePaK1aYui7HKXjVUH5Yfv75JpuWdV2Go9j573I4Pa8RA==
X-Google-Smtp-Source: AKy350bcHBiVDYP2ygXALbn8C6XO0v/XJckJZuGMUImABe3wifty7nA4Egpg9H0LjOGezAoeXhDr148iWyVMMygVRB8=
X-Received: by 2002:a25:2f56:0:b0:b94:bbf2:277a with SMTP id
 v83-20020a252f56000000b00b94bbf2277amr190241ybv.33.1682021662737; Thu, 20 Apr
 2023 13:14:22 -0700 (PDT)
MIME-Version: 1.0
From:   Chris Maness <christopher.maness@gmail.com>
Date:   Thu, 20 Apr 2023 13:14:11 -0700
Message-ID: <CANnsUME6LaYohriVo6zMq7SuEB1pbu2EsVVci2jow+gcp1aCog@mail.gmail.com>
Subject: 6PACK Crash
To:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

I am playing with a 6pack EPROM in a TAPR TNC2 Clone, and I can easily
crash the latest stable kernel in Arch Linux:

This same HW configuration works fine under WindowsXP and The flexnet
kermel + 6PACK driver.

Linux positron 6.2.11-arch1-1 #1 SMP PREEMPT_DYNAMIC Thu, 13 Apr 2023
16:59:24 +0000 x86_64 GNU/Linux

spattach /dev/ttyS0 vhf
where vhf is defined as:
vhf [tab] KQ6UP-2 [tab] 9600 [tab] 2 [tab] Info

I used:

call vhf KQ6UP-5 and after a little bit of playing around the machine
locked hard. I have no issues with this box other than messing with
AX.25 stuff.

73 de Chris KQ6UP


-- 
Thanks,
Chris Maness
