Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B52F57612D
	for <lists+linux-hams@lfdr.de>; Fri, 15 Jul 2022 14:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiGOMTJ (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 15 Jul 2022 08:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiGOMTH (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 15 Jul 2022 08:19:07 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A0AF24956
        for <linux-hams@vger.kernel.org>; Fri, 15 Jul 2022 05:19:07 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id g19-20020a9d1293000000b0061c7bfda5dfso3014116otg.1
        for <linux-hams@vger.kernel.org>; Fri, 15 Jul 2022 05:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jSvYAeAIJFf07uogcZKXr9ZzPPjkyHH1o/p7a6UG+M0=;
        b=T6l27ZZONIelTb3PKz5nGr/eOws1rQ3BPYy1xDDrfNWui7MS7+Dbhh2900AbiiLq0q
         cAFhCVtuTuMUQMirm+1oZmpoI6UUz46ckDjL17q77BWEQJ03nSC3F5EPmu/oM1mIFMw2
         OBDROJ71SgOMldwwiUOlIWmfv57+ElQmVuz/CeMggUqkloR2UCZ3PDzPTYNj6m0dF8h0
         OLsrz0zVYnMLY9S9j5lVZtMneYURNTI+qPUGpj5L3Bf1oOyUvZm29fe2sf/LKPmmfNxX
         Bz0DIrhr6CO7ihfy+UkjC2oYY8Hp+4+7rYoYW3Qlhrz9AHZ6FLLUP4Lkn0ABkr13kHId
         uN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jSvYAeAIJFf07uogcZKXr9ZzPPjkyHH1o/p7a6UG+M0=;
        b=Ie3WEGICcnkpH8fjf0UQ7R67n35CWlG8f1vjPkFjZ8gwZalYlaOr/d+IqroXcnFfKk
         GNvspT8dBJk1JZLEeq/rUWMJfv+Qs87ZsZ5iag4IsGw/CvZihl94yyr4yDpqy1Q+kJ4Y
         DOxqe5BJU33rTI/2evfNgx3QJckAgrK5/pGlHLmfL4AHX1f5XpWmOYo21+DFl9+iCOwZ
         g6XenAb6y5KYHtHwiaH3mxTPFOL80sN/xiWx87tlGaJGKMovrsW/kH370Y27ANHNtG+x
         4Wgoi1n8qOKhzlt20iOMuXlgaH6xuBRyKzp7Cwby4IqfsWSlUQ80qxW6bJmm2hcKtGbV
         BZgg==
X-Gm-Message-State: AJIora9he1d722gn/hYuwJ0wNJkJj/UiwOSomKtDLKSa+ImhVTu5gr2o
        iolYbxmfgE4hTRq4X8mOXTZb1FqSG3ONJbQihgjWpz3yUPA=
X-Google-Smtp-Source: AGRyM1sSNZlbu2XLz8+EJYAdC55bOmkzcwhT7OYqXDr43tzffpi4aJtIjJPfNPQ/44XzRX8DB+vW0ImXtbgfW4KoRlI=
X-Received: by 2002:a9d:6209:0:b0:61c:30be:713b with SMTP id
 g9-20020a9d6209000000b0061c30be713bmr5561896otj.225.1657887546581; Fri, 15
 Jul 2022 05:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAH4uzPNH6GVX_H0eCrBUxPdgynRc9a7xLGde1_37dTCz3fgJOA@mail.gmail.com>
 <YPlpLpL3Yrz/YE6R@linux-mips.org> <CAH4uzPPuXA19KvikagjcQZmFYvTjw1nNCVQhY_07LPz_F0mmSw@mail.gmail.com>
 <YPmo1cAlGdIkapxL@linux-mips.org> <CAH4uzPMXHnR+Z60iCA41FYsbDViQ5K2kMC_YWC1r4EaWMKiT8w@mail.gmail.com>
 <CAH4uzPOrW4CEvmMhqqxTV650P9JpEftgd92Z3JCZut8JXvng4w@mail.gmail.com> <CAH4uzPN+dUmuLVTdO6qHTiHbKUisxRpi94ydEh8Dtt7S2O9ujQ@mail.gmail.com>
In-Reply-To: <CAH4uzPN+dUmuLVTdO6qHTiHbKUisxRpi94ydEh8Dtt7S2O9ujQ@mail.gmail.com>
From:   Dan Cross <crossd@gmail.com>
Date:   Fri, 15 Jul 2022 08:18:30 -0400
Message-ID: <CAEoi9W6wSAG3FHvqVB6p6GdFp44=d=NjFAL6c2JfWHyCjenqWA@mail.gmail.com>
Subject: Re: SECURITY: Some type of NETROM frames contain random fragments of
 data from memory
To:     Dave van der Locht <d.vanderlocht@gmail.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Wed, Jul 13, 2022 at 1:38 PM Dave van der Locht
<d.vanderlocht@gmail.com> wrote:
> Any updates on this one? I think we're still not able to use a 5.x
> kernel with NETROM due too it's leaking all kinds of sensitive
> information/data?

I'll note that NETROM seems to have other problems, particularly
when used in conjunction with AXIP/AXUDP. I have observed it
getting into "loops" when communicating with distant systems, in
which the distant end continues sending my machine traffic that
is acked, but the acks never never move the session along.

I'm afraid this is a bit handwavey, but I can provide packet traces
for anyone who's interested in looking into what may be going on,
as I have found the errant behavior trivial to induce.

        - Dan C.
