Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A187D4CAAAD
	for <lists+linux-hams@lfdr.de>; Wed,  2 Mar 2022 17:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243443AbiCBQn0 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 2 Mar 2022 11:43:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243660AbiCBQnV (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 2 Mar 2022 11:43:21 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A1D0192B0
        for <linux-hams@vger.kernel.org>; Wed,  2 Mar 2022 08:42:37 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id z12-20020a17090ad78c00b001bf022b69d6so1175615pju.2
        for <linux-hams@vger.kernel.org>; Wed, 02 Mar 2022 08:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bogomips.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/8RU+ZZBDEZckuCth+iZ3gL66NXj2/BrHvHNS9CO5Fg=;
        b=JFjpcLgPSzQSgSKfphnNdCBW2Z9qxo5XyXKWFpdoyUcVaSAGQET/f6je1z2Wg1R5rN
         aTVkjyZNtyWXnIZ1dnTRfvv98XJ+s7pxDr+GpzpRl1fMGgRxahhVbBjEFI95ScLJ7AGe
         A8yb8lrCJWOLLYe2J3htH6M8dAUruCrM2lYsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/8RU+ZZBDEZckuCth+iZ3gL66NXj2/BrHvHNS9CO5Fg=;
        b=2i6N2V3B2+F5JNKUVNqwWRVlcGiL2M44s/R31ZbxVJUFcViSR00EgUIKUk1u/WcxN1
         m6lQdqfTUwZkQ8slicWJFXpBtl+aMzk7Qz8KVpYVDQUi3bvriy7ElUafIlBrFegGHPDF
         8qPYx15I+wfM436UnAK/RH6KIVY4keyvqvsftl9B2RFS1ogsSPMDIfAHM1S2xQRyICx7
         PLGQmyJeDKMvrGagiWcuU8UQA+PMbrV4FCdHodNKwYL4se2cmRzpJTclPGr2fcTmcEHj
         AhqBypKPox0vmoAKDg4Vu1wXU9pP1NwVT6ZhU3r4ZMcGPj5n5JY8MG/f/do32j+HDw+s
         Ti1g==
X-Gm-Message-State: AOAM5323hSJEsV45c7+0fxlugTF/uhBB5y4z4whf1Jds9NdVafUw00i+
        PZzx0N55sA6/Il7UvAHt/InPhG6k8g9XHTNJyaPEGSxVFY5bCw==
X-Google-Smtp-Source: ABdhPJzuXgrIJhsyhS++7JgosIGTz8X+7uCUpYPb3Vnf/MToMNAJGIGQRiAaUol4EZmTDYVV1fNb3XavTsBlAvQfSCE=
X-Received: by 2002:a17:90a:5995:b0:1bc:be7f:f5a1 with SMTP id
 l21-20020a17090a599500b001bcbe7ff5a1mr703825pji.84.1646239356662; Wed, 02 Mar
 2022 08:42:36 -0800 (PST)
MIME-Version: 1.0
References: <CAO-kYtEhzohMYgk=K_jt0hQ+bdrmReUVBkAzMYTKJeAK9vcenQ@mail.gmail.com>
 <440dc67d-55a2-64c0-bbdf-68b17b404fc5@trinnet.net> <71048B17-B84D-4801-AD45-593EED882778@osterried.de>
In-Reply-To: <71048B17-B84D-4801-AD45-593EED882778@osterried.de>
From:   John Paul Morrison <jmorrison@bogomips.com>
Date:   Wed, 2 Mar 2022 08:42:26 -0800
Message-ID: <CAO-kYtHdNA+EVCV-aFJn48602LXH_C9dWn46tXur56KBps7R6Q@mail.gmail.com>
Subject: Re: [PATCH] libax25 hamradio: higher baud rate support
To:     Thomas Osterried <thomas@osterried.de>
Cc:     David Ranch <linux-hams@trinnet.net>, linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Thanks Thomas

B4000000 is currently the highest in termbits.h and __MAX_BAUD defined
in termios-baud.h so should be enough for now.

Linux can handle non standard bit rates so it would be better to warn
instead of fail - I could work on a patch if you think it's a good
idea.

Right now I'm testing some USB RS485 adapters - I have four computers
"networked" over a single twisted pair RS485 bus.
I have some MAX485 boards for Arduino that I'll try connecting to an
MCU at some point.

The USB adapters are CH341 based and quite inexpensive to play with.
RS485 just needs a single pair and some ICs can combine it with low
voltage DC power.

ping/ssh is alright but iperf3 bogs down even at 1.5 Mbps. Even when
ping is 100% success rate, you can see the ax0 interface errors
increase - I think mainly because RS485 is half duplex and I don't
think KISS handles buffering and CSMA/CD.  Errors went down when I
terminated each end of the bus with a few resistors.
If I have time I'll see if I can get a soft "TNC" for RS485 working.


John Paul
VE7JPM


On Wed, Mar 2, 2022 at 1:26 AM Thomas Osterried <thomas@osterried.de> wrote:
>
> Hello,
>
> I see no problems with this feature request.
>
> What is the use case? - attach two computers with AX-25 over usb-serial?
>
> The last change of the speed rates here is long time ago (I hardly remember), where >350kBit PR equipment was developed.
> Nowadays, most people connect two computers via ethernet - so they have the best of two worlds, IP, and do AX.25 with bpether.
>
> I'll add the patch. But please be a bit pations. Like to look for the speed rate definition (if 4000000 is enough ;)))
>
> vy 73,
>   - Thomas  dl9sau
>
> > Am 01.03.2022 um 16:54 schrieb David Ranch <linux-hams@trinnet.net>:
> >
> >
> > Maybe there is no harm in allowing such speeds to be configured but what kiss-capable AX.25 serial devices can support such serial speeds?  Maybe just back to back serial port connected Linux computers?
> >
> > --David
> > KI6ZHD
> >
> >
> > On 02/28/2022 10:46 AM, John Paul Morrison wrote:
> >> The kissattach program rejects valid baud rates in /etc/ax25/axports
> >> so I updated libax25
> >>
> >> I tested on x86_64 and armv7l (Raspberry Pi)  up to 1.5 Mbps
> >>
> >> VE7JPM
> >>
> >>
> >> Signed-off-by: John Paul Morrison<jmorrison@bogomips.com>
> >> ---
> >>
> >> diff --git a/ttyutils.c b/ttyutils.c
> >> index a374103..981d630 100644
> >> --- a/ttyutils.c
> >> +++ b/ttyutils.c
> >> @@ -32,6 +32,36 @@ static struct speed_struct {
> >>  #endif
> >>  #ifdef  B460800
> >>   {460800, B460800},
> >> +#endif
> >> +#ifdef  B500000
> >> + {500000, B500000},
> >> +#endif
> >> +#ifdef  B921600
> >> + {921600, B921600},
> >> +#endif
> >> +#ifdef  B1000000
> >> + {1000000, B1000000},
> >> +#endif
> >> +#ifdef  B1152000
> >> + {1152000, B1152000},
> >> +#endif
> >> +#ifdef  B1500000
> >> + {1500000, B1500000},
> >> +#endif
> >> +#ifdef  B2000000
> >> + {2000000, B2000000},
> >> +#endif
> >> +#ifdef  B2500000
> >> + {2500000, B2500000},
> >> +#endif
> >> +#ifdef  B3000000
> >> + {3000000, B3000000},
> >> +#endif
> >> +#ifdef  B3500000
> >> + {1000000, B3500000},
> >> +#endif
> >> +#ifdef  B4000000
> >> + {4000000, B4000000},
> >>  #endif
> >>   {-1, B0}
> >>  };
> >
> >
>
