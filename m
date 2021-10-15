Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1762742EDA6
	for <lists+linux-hams@lfdr.de>; Fri, 15 Oct 2021 11:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236645AbhJOJat (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 15 Oct 2021 05:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236564AbhJOJaq (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 15 Oct 2021 05:30:46 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B971BC061570
        for <linux-hams@vger.kernel.org>; Fri, 15 Oct 2021 02:28:40 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id v2so5328591qve.11
        for <linux-hams@vger.kernel.org>; Fri, 15 Oct 2021 02:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=JP769O/gbMQam8I3XCZG+zCrdQnOPDAQulp4MaowRlc=;
        b=KLy2QYm6bvZrflpofZJj0/l0kuJ9tnKwK8qTJ6ro4ojlKWu6748Bk/WREz1rBGmKMr
         ZJA0qT+pkIgO5rc6KwfsKGuYrqUp5d5kTdUVZsD3RruXtPJnxFnSl9JJOaeAxR6sCD5v
         oAdU5bdq1ZoOc9EvhyizFMrmkOGnO0+VMYujYFEALnyyTjxI2oG57N4RZDlkSfxRWTAF
         Lq2ZoWigrPtTaUKxeETM1J8T9XYFWGQTxiXWK2bHeYeIVtd20bcB9SXEon26WAcvyPSX
         DqcCFl6OO7hSmiOj3mn2FZ7P2mYY5v+Cyi1ALEQomPtCmR7cIJzDGh3cpfiBcMMgYlXI
         CyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=JP769O/gbMQam8I3XCZG+zCrdQnOPDAQulp4MaowRlc=;
        b=qWJz9ECEVYet9JlGDm7s4Od3uFuWm6SN18AeNx0pjx99Ku4ni6mAJJSDCqYwpyBmAO
         b11zS6fpD2uChcvRJ+5694JtZHrYW6/KUwMQx0Fwqwfgs2Tlv6bvbeoJBMEDCEbC6KzH
         gPWp3FKqOzZpgiCwy6rYTGITx4gMkpxKVGS/jR337TS/l2yl8BoQS9SjxGIilY+GHP49
         Fp7lseiAK9cMhSUqShmn/uw2lF8sT+9loMD+FmiT877Q8bLiOYAfxVzqBkOG5T4gEPYz
         OPn98veq0EquclY6kczq8t+ktCEDbOHwkGrqRs26pQK+uj01yjBDvU52NbZ800RsVPPr
         3XHg==
X-Gm-Message-State: AOAM532eO07chzpSU3V+frUmSgVesqIofK5ZBgvHwAM3GQ8eoQRqyAKY
        XUJb8yndN2dEztEFpky7cvFdcsVh7XQ/Rv9syLRgrQK5
X-Google-Smtp-Source: ABdhPJwIWgVDCT4J4oKfrSkgB5IgQi+vVq2IN9fwmiy5ynZBm5rRVtAaFeidDnqqUCq83fcjxWfCrA0ro0huzr4e8DI=
X-Received: by 2002:a05:6214:194b:: with SMTP id q11mr9830574qvk.38.1634290119963;
 Fri, 15 Oct 2021 02:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAH4uzPNH6GVX_H0eCrBUxPdgynRc9a7xLGde1_37dTCz3fgJOA@mail.gmail.com>
 <YPlpLpL3Yrz/YE6R@linux-mips.org> <CAH4uzPPuXA19KvikagjcQZmFYvTjw1nNCVQhY_07LPz_F0mmSw@mail.gmail.com>
 <YPmo1cAlGdIkapxL@linux-mips.org> <CAH4uzPMXHnR+Z60iCA41FYsbDViQ5K2kMC_YWC1r4EaWMKiT8w@mail.gmail.com>
In-Reply-To: <CAH4uzPMXHnR+Z60iCA41FYsbDViQ5K2kMC_YWC1r4EaWMKiT8w@mail.gmail.com>
From:   Dave van der Locht <d.vanderlocht@gmail.com>
Date:   Fri, 15 Oct 2021 11:28:29 +0200
Message-ID: <CAH4uzPOrW4CEvmMhqqxTV650P9JpEftgd92Z3JCZut8JXvng4w@mail.gmail.com>
Subject: Re: SECURITY: Some type of NETROM frames contain random fragments of
 data from memory
To:     Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hi,

Any update on the security issue? It's a shame to be forced using an
old kernel (4.19 or lower) to not being affected by this.
Is anybody else able and willing to investigate and resolve this
serious breach?

73! Dave

Op do 22 jul. 2021 om 19:38 schreef Dave van der Locht
<d.vanderlocht@gmail.com>:
>
> Ralf;
>
> This dump is from a 32-bit ARM system indeed. Same behaviour was seen
> on 64-bit x64.
>
> I hope it can be found and fixed soon as it's 'leaking' sensitive information.
>
> Kind regards,
> Dave van der Locht
>
>
> Op do 22 jul. 2021 om 19:20 schreef Ralf Baechle <ralf@linux-mips.org>:
> >
> > On Thu, Jul 22, 2021 at 03:28:30PM +0200, Dave van der Locht wrote:
> >
> > > Some ELF binary data fragment in a NETROM frame (I think):
> >
> > [...]
> > > 0090   80 00 ff ff ff ff 7f 45 4c 46 01 01 01 00 00 00   .......ELF......
> > > 00a0   00 00 00 00 00 00 02 00 28 00 01 00 00 00 ac 17   ........(.......
> >
> > I took a closer look and decoded the ELF header manually.  This would be
> > a 32-bit ARM system, is that right?
> >
> > Will do yet some more decoding on the packets.  My first working theory
> > is that memory for ththe packets is allocated too large, not zeroed and
> > so eventually gets sent out.
> >
> >   Ralf
