Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4B145638C
	for <lists+linux-hams@lfdr.de>; Thu, 18 Nov 2021 20:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbhKRThB (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 18 Nov 2021 14:37:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhKRThB (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 18 Nov 2021 14:37:01 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67FF0C061574
        for <linux-hams@vger.kernel.org>; Thu, 18 Nov 2021 11:34:00 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id l8so7206207qtk.6
        for <linux-hams@vger.kernel.org>; Thu, 18 Nov 2021 11:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Osdmt6KQJEoo8LvyMiysgFPoOg+0TDeSsNxZUakAU7w=;
        b=NPAzVyetR6ZqWFgE5bOIjoEct2D6hVBVSBot8yAVGIIauolfMQvJhC7nZUqTefKcW5
         XPQJDwkgdZyLldwIoB1bArQqmy/Ly9jKZ+xLFijS8czQdDP+ZJIm1COsjKR4McMHuxt8
         ML9qu+xkCott8jzQeZ4s82Cdsnx4F7xAjwtT5V/JNozAr4GMOypqZ6EJ7yTor1o47Gf8
         GDBxAfk59Y2f2xy0n5XAmwTHgQlaTSJ8XhzOOv4sq4bg3imHARfGl4ZjIHazGoNdHtlH
         9vySFsj3A0wZ2/YUFakWM7E1yq4d5Q1ecBXtfraec4ctEUMhUr0lOKsNoa4gimQjLGMO
         HpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Osdmt6KQJEoo8LvyMiysgFPoOg+0TDeSsNxZUakAU7w=;
        b=a7Dbn6V+MRFEtpTpdAfL2uGud/qtT56kcxIOYnOe9l8Q5JBBSycAa1k86ONhXwcaV6
         Nw1cI5UqbDKo8DkFDL7B7b1Rg62ifMklEpGdCRxyVIKj+Er4SYCxo+tLvt2+SfAiBbKC
         PkDEdlXagWh5rLdd0DyWFCGJJimfunOVbU9eFC2Oa68JxijXpA1UV0AsMjE5hZ28vGoS
         bPTc9b01TLO1P4xaVYQmkFOO95hPZz3405uUD/kK+ksEVDkciotwS5TJHqWVAsy1Z7tC
         t58XjDjNWtILAhdJpZfymoxP9kaYL1CO0D5lwBh1mAbArU5DP1fZw17ZsIlDJWkyU7YT
         eg9Q==
X-Gm-Message-State: AOAM530xpOVlePVTzr3D2AqaPkaqeeh2mtEKbpCaBWaCvY/yzgYgYLsp
        GQpMR4U/VF2yCcquvwlRV/0o0IAg/ypbZHAP4oU=
X-Google-Smtp-Source: ABdhPJwm50atGSZ4CXhRPxYBwTy5zUvkh4/pRUZ7G4PIYcutXN+KLwmVaDXbOHZIiXMV+RuVJ17w+7ttiIfkkFsnSRA=
X-Received: by 2002:a05:622a:20d:: with SMTP id b13mr28857120qtx.368.1637264039587;
 Thu, 18 Nov 2021 11:33:59 -0800 (PST)
MIME-Version: 1.0
References: <27764.1637253551@yamaloka.gajendra.net> <CAH4uzPM9YzJPzLRCLSRWf17vim9ADmAiLM_G+yTDWDuXgzLhAA@mail.gmail.com>
In-Reply-To: <CAH4uzPM9YzJPzLRCLSRWf17vim9ADmAiLM_G+yTDWDuXgzLhAA@mail.gmail.com>
From:   Dave van der Locht <d.vanderlocht@gmail.com>
Date:   Thu, 18 Nov 2021 20:33:49 +0100
Message-ID: <CAH4uzPOoEXhv_K_NbU15-VTGiCe6c8p8Rtmrcdx496Abw6_mvw@mail.gmail.com>
Subject: Re: NET/ROM bug fix from YO2LOJ?
To:     Dan Cross <crossd@gmail.com>
Cc:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Dan; Here's a link to the latest one in the archive I was referring to:

https://marc.info/?l=linux-hams&m=162774747419380&q=p7

73! Dave

Op do 18 nov. 2021 om 20:30 schreef Dave van der Locht
<d.vanderlocht@gmail.com>:
>
> The patch itself made it to this list several times as far as I know.
> I also had some conversation here with the maintainer (Ralf) where
> it's mentioned including what YO2LOJ did in his patch.
> Roland Schwarz posted the patch too on 31th July 2021 with subject:
> [PATCH] apply YO2LOJ's changes for proper connection cleanup.
>
> I'm curious too if someone is tracking the issue, any status requests
> remain unanswered. It won't be because there's no additional context
> provided. There's lots of provided... Which can be found in the
> archive.
>
> Maybe it isn't the _right_ fix, but it seems to work pretty well for
> everyone using it. And if it isn't the _right_ fix, what is...
>
> The same seems to happen with a serious security issue I reported
> where random fragments of data from memory is leaking into NETROM
> frames with kernel 5.4 and up.
> Unfortunately I'm not very capable of debugging the kernel stuff
> myself. After some conversations with the maintainer, and providing
> more info and a dump regarding that, there's silence too without any
> response to status requests from anyone.
>
> 73! Dave
>
> Op do 18 nov. 2021 om 19:37 schreef Dan Cross <crossd@gmail.com>:
> >
> > On October 26 2021, N1URO sent a message to this list asking
> > about getting "the NetRom status bug" fixed.  There was no
> > additional context, so perhaps it's unsurprising that no one
> > responded.
> >
> > However, his message appears to refer to a legitimate bug in
> > which NET/ROM sockets can be left in an invalid state after
> > closing.  Marius Petrescu, YO2LOJ, has a small patch for this
> > on his web site, but from my searching, I can't find any record
> > that it ever made it to either this list or the LKML.
> >
> > Marius's fix is short (slightly reformatted for kernels style):
> >
> > --- ../reference/linux/net/ax25/ax25_subr.c     Thu Nov 18 15:33:53 2021
> > +++ ax25_subr.c Thu Nov 18 16:05:36 2021
> > @@ -284,5 +284,8 @@
> >                 }
> >                 bh_unlock_sock(ax25->sk);
> >                 local_bh_enable();
> > +       } else {
> > +               // YO2LOJ: this is needed for proper NETROM connection cleanup on timeout
> > +               ax25_destroy_socket(ax25);
> >         }
> >  }
> >
> > I do not know whether this is the _right_ fix for this issue,
> > but it seems that additional context towards getting it fixed
> > would be helpful, hence this message.
> >
> > Is anyone tracking this issue?
> >
> > Thanks and 73,
> >
> >         - Dan C.
> >           (KZ2X)
> >
