Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2E33D2B50
	for <lists+linux-hams@lfdr.de>; Thu, 22 Jul 2021 19:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhGVRCA (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 22 Jul 2021 13:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhGVRCA (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 22 Jul 2021 13:02:00 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1A5C061575
        for <linux-hams@vger.kernel.org>; Thu, 22 Jul 2021 10:42:34 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id w6so99871qvh.3
        for <linux-hams@vger.kernel.org>; Thu, 22 Jul 2021 10:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=+N8YmYPoar6hFe1uddqdMQMOyeqRXx62rpuEiXy4Ro8=;
        b=BubD+N1kySHORyVskeaVRkF6CJHoCSwj3G94Jn7d4yWr9KOThySStAnM8nIJ516zJf
         ZxVqFzZw/dhnBUdOE5+SMoq/YSUFtK3FW8v/M2Hzal5ctb/vnc9goj1d6XHXdIkYC36K
         3AyxrYzyY6qr5d6e+SEFx/UDP/auMDITbQV6tQ9nCwte3mCKFHJexn6u88SC35Txcrtt
         MJkmVvGvEfrFyCgxNVqY4LN7vbAOWCvYl2SKsDjuDkjW5x/kmU5XzLauSmBbntv+4ZyC
         MQdMvF3UEuMsiZ0eqQUmsXU5YROn6NVmwDLKI7W9Ay5mQuMLET6k85Z/vyKvIoZs3WgP
         hM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=+N8YmYPoar6hFe1uddqdMQMOyeqRXx62rpuEiXy4Ro8=;
        b=I/r1PjT9Pdo7BraQFYST3wJZJqnrAcRaOfQ+fg0QTN/UU0XGEM0cwdarV6WZRN0+Ot
         WERdHF9iihRSmWhVOLWZ4HpFYO9X2m78o+P4WnJlWzazxz07hMq2mD2vS7HaupYrnsoM
         pfPR/xKhyTv5deE54yXkMI+FJuIkhMS6gdLBD2wljXahDpWviW4RBLvh9XamPWF7SvwW
         nQVPPZUJ85OUrQGJ7mps3kRw7DTagNymGAgyrhZNdaCReo9vbnmtjKx89j9YxvZmHooq
         cwe1s12V2r0B8vaiZo7Z5QrHhuIsKv0wcv0E7OqKY/Kx7TspI+o9rKKn9TAgK5+NqEtE
         5l8Q==
X-Gm-Message-State: AOAM533JyZexKX3oTGd7tdoE6tPyHefdhAnOjY/eThODxAFW/4paMOTl
        kUXQ+Oh5MpEGAPc9U7rotLbYRfhv0f3TNSMp3Wrzm0sC
X-Google-Smtp-Source: ABdhPJz/9tnb0uhWiVSq2Sq4nV2bKrNG7SwVxzZv6FCS1SDlx3ApphSD1mVGVfbIqnwplQ+Dp7lmADhyyhsF1L9ea94=
X-Received: by 2002:ad4:5bcf:: with SMTP id t15mr976727qvt.33.1626975749444;
 Thu, 22 Jul 2021 10:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
In-Reply-To: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
From:   Dave van der Locht <d.vanderlocht@gmail.com>
Date:   Thu, 22 Jul 2021 19:42:18 +0200
Message-ID: <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
Subject: Re: Status of the stuck sockets bugs.
To:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Is anybody able to tell me more / give answers to questions about this issue?

Kind regards,
Dave van der Locht

Op di 29 jun. 2021 om 19:32 schreef Dave van der Locht
<d.vanderlocht@gmail.com>:
>
> Hello,
>
> Is there any news about the well known bug regarding sockets getting
> stuck in LISTENING state?
>
> Some years ago (already) Marius Petrescu YO2LOJ wrote a patch for the
> ax25_subr.c file which seems to work very well and solves the issue.
> But it's really annoying having to patch the kernel with each update
> again.
>
> What about that patch, I've heard it was rejected several times for
> some reason? But can't find info regarding that.
> What can be done - or who is able - to get rid of this bug and get it
> fixed in the kernel?
>
> Kind regards,
> Dave van der Locht
