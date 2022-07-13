Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E915D573BFB
	for <lists+linux-hams@lfdr.de>; Wed, 13 Jul 2022 19:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbiGMR2R (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 13 Jul 2022 13:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbiGMR2Q (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 13 Jul 2022 13:28:16 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A88B240B0
        for <linux-hams@vger.kernel.org>; Wed, 13 Jul 2022 10:28:16 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id v16so16425853wrd.13
        for <linux-hams@vger.kernel.org>; Wed, 13 Jul 2022 10:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=LqGYwLswQZBHJ6NDnaQidlEq158iOQOfcZlhJHuvTaw=;
        b=W8R7s8NX/x1dsv574sdRmDax7BqLuEsiHGpdnWQctj/P6Ko4+C2NS77K67RjMbelzS
         xJxxQC3QHEC3T9r9R4ozb1nIzJ3xWJOF3C5ortiovE0SI7GfmEhBszmqFRGl0/6rNtBT
         UHAp7AB5tVduA6daQjs8Nvvi180L2kCVCZCbYbg6CseIjL4xh6vcA6R8u8fuRRkbyty6
         fbXmgrwJFK608JE1HyZBYC5ILHVRuTzjpNy+CE/pLsjsMx/tnq6jvpE83zOPubIFfbRL
         EJnu7RLU8foze5ZIm+/V0evP8nUHrfUjW5VRNGDhk50tbb7mM71gxOJzCbJhyCVdfKyg
         jy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=LqGYwLswQZBHJ6NDnaQidlEq158iOQOfcZlhJHuvTaw=;
        b=jOYlW7AtjZi1PnYdz70dVvx99paBY9/puwY4dyE5t/rzVGzNZKE8nRwJ3bkwMihJbt
         0Hh0+J1SiO5s0khwPQVXq+mRO7jdFCpj1HIpOQRxo3h+cv9MoAU6ia1Sh3pDfBnBMfaS
         mETwfvIz+51XWjp2XGKy+VWrlN9Vq0lwrw2o//nDaliNw/r+YCyGujtkIZVyzCVl0RXp
         NMv1l12QkwKKGflwepM01VrAVLA4WWr/drxeqMyFpKFEJ3MWaWT78I6We7mXirqTvNp1
         IAMqUvwMCcjcONUQXhXC3tqSyNp+Qit8sQQtCe+EvW0L2YS97T5EWByn4nrzNRndOiyW
         10Fw==
X-Gm-Message-State: AJIora/1QAl4J3cyRu2kFcH1sQA+GCy8JMty0vbQPAWHS7CYuQHORfjf
        zNmlnFUTLteUWh96t1hfgDrIIJTRvwkuZHY1dqo=
X-Google-Smtp-Source: AGRyM1tqo60zbIFgiFlsW45c/jfNfs/LiWNut4YA7xouMIZc0mDNeRGUzJpOzpHIQeiYu6+/ZiPKEv9yqIWAIRbczAE=
X-Received: by 2002:a5d:4807:0:b0:21d:925b:d867 with SMTP id
 l7-20020a5d4807000000b0021d925bd867mr4569752wrq.354.1657733294501; Wed, 13
 Jul 2022 10:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAH4uzPNH6GVX_H0eCrBUxPdgynRc9a7xLGde1_37dTCz3fgJOA@mail.gmail.com>
 <YPlpLpL3Yrz/YE6R@linux-mips.org> <CAH4uzPPuXA19KvikagjcQZmFYvTjw1nNCVQhY_07LPz_F0mmSw@mail.gmail.com>
 <YPmo1cAlGdIkapxL@linux-mips.org> <CAH4uzPMXHnR+Z60iCA41FYsbDViQ5K2kMC_YWC1r4EaWMKiT8w@mail.gmail.com>
 <CAH4uzPOrW4CEvmMhqqxTV650P9JpEftgd92Z3JCZut8JXvng4w@mail.gmail.com>
In-Reply-To: <CAH4uzPOrW4CEvmMhqqxTV650P9JpEftgd92Z3JCZut8JXvng4w@mail.gmail.com>
From:   Dave van der Locht <d.vanderlocht@gmail.com>
Date:   Wed, 13 Jul 2022 19:28:03 +0200
Message-ID: <CAH4uzPN+dUmuLVTdO6qHTiHbKUisxRpi94ydEh8Dtt7S2O9ujQ@mail.gmail.com>
Subject: Re: SECURITY: Some type of NETROM frames contain random fragments of
 data from memory
To:     Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org
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

Hi,

Any updates on this one? I think we're still not able to use a 5.x
kernel with NETROM due too it's leaking all kinds of sensitive
information/data?

73! Dave

Op vr 15 okt. 2021 om 11:28 schreef Dave van der Locht
<d.vanderlocht@gmail.com>:
>
> Hi,
>
> Any update on the security issue? It's a shame to be forced using an
> old kernel (4.19 or lower) to not being affected by this.
> Is anybody else able and willing to investigate and resolve this
> serious breach?
>
> 73! Dave
>
> Op do 22 jul. 2021 om 19:38 schreef Dave van der Locht
> <d.vanderlocht@gmail.com>:
> >
> > Ralf;
> >
> > This dump is from a 32-bit ARM system indeed. Same behaviour was seen
> > on 64-bit x64.
> >
> > I hope it can be found and fixed soon as it's 'leaking' sensitive information.
> >
> > Kind regards,
> > Dave van der Locht
> >
> >
> > Op do 22 jul. 2021 om 19:20 schreef Ralf Baechle <ralf@linux-mips.org>:
> > >
> > > On Thu, Jul 22, 2021 at 03:28:30PM +0200, Dave van der Locht wrote:
> > >
> > > > Some ELF binary data fragment in a NETROM frame (I think):
> > >
> > > [...]
> > > > 0090   80 00 ff ff ff ff 7f 45 4c 46 01 01 01 00 00 00   .......ELF......
> > > > 00a0   00 00 00 00 00 00 02 00 28 00 01 00 00 00 ac 17   ........(.......
> > >
> > > I took a closer look and decoded the ELF header manually.  This would be
> > > a 32-bit ARM system, is that right?
> > >
> > > Will do yet some more decoding on the packets.  My first working theory
> > > is that memory for ththe packets is allocated too large, not zeroed and
> > > so eventually gets sent out.
> > >
> > >   Ralf
