Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 918173D3709
	for <lists+linux-hams@lfdr.de>; Fri, 23 Jul 2021 10:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234413AbhGWIJS (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 23 Jul 2021 04:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234311AbhGWIJS (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 23 Jul 2021 04:09:18 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E93C061575
        for <linux-hams@vger.kernel.org>; Fri, 23 Jul 2021 01:49:50 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id x9so1123470qtw.13
        for <linux-hams@vger.kernel.org>; Fri, 23 Jul 2021 01:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=TFKFjxkFxm+H16sgy6+/ue42pk3KtIBcvx5kidb13VU=;
        b=e3FKxbi6sH/o8QnEd1GBfJSQ/0/vxnkzgMJCZ3txDSfLr2x+kPfQf1wkvqu2G1fupQ
         uooARO9mbein4hAaGJGW6N8G4SNlud7SAh0QUCQglJbFRBUHFvm+Ekcq4QDkGojGxqXh
         eXd3f1KItWtEWMdBv/eF6UgX8C8tixP1UUy4G9l8bnIRgd/DqrhApAP31LQsM6xpNDZZ
         8aDfg1n36KFS0YcDo1YzE2vuQYI+c4bmMlxIhpdTdNgDUptC019C9S0EOU+2c6LfQwPD
         AMS6lCNuQn8wiok/uqTZ0LjEva4d/DLqrZmuJ9ylmo1YoB3msW/lWpxtbTbFjFM755gN
         97Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=TFKFjxkFxm+H16sgy6+/ue42pk3KtIBcvx5kidb13VU=;
        b=g9Dx+XrjfTix3lO8Zgaj+YhNgUYDBsIzld+nNU+b3ROfsOkyQ5WDHXiWePabYHrzwo
         rdYyY3RHA2UrRrbZziX3jfdc+Vw2Lf54+6kskCVNPryd91qox8HiQKk9h6ou53RCWrML
         PRfvUyR4w46HUzzup6PI4sTJa7kgz3VigR4x6BqoLUpR9aN5h9NHzw8hkz+Pb396Ek67
         zna+BkdbeNQFBnqJhBa8siIyhNnJjrWRVBQQWxhz7vn4HYcZ5U+KJfu20pMC1KfhEEw0
         wE9ftzMuXD1aDLmTFPXbjpDzfLIXKuNO890DpGyYy60X3i24lZ1s3Pdw0qV+I+389wDc
         BROw==
X-Gm-Message-State: AOAM532SA2GtHOctVCywc4RJsD1EEG4fBsokpGigCkcjhCq4vZqV3RIM
        2LGhe7c9Nq7fE+fW9lJqbA5wjrPuVMZk8Gmu/F3ypEn+
X-Google-Smtp-Source: ABdhPJyIkOi0RSE0CakZbK9oThVsApq7/JmkCEbJDv7tWrhHAxttUMbrA4MGuzxVb1y+wPO5PII7BKdwwbqaFr5kuAQ=
X-Received: by 2002:a05:622a:514:: with SMTP id l20mr3093163qtx.215.1627030189173;
 Fri, 23 Jul 2021 01:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
 <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
 <YPp7qeWGSW/s4TI6@linux-mips.org> <CAH4uzPMp_4bwPf0+tjviM=5aDVGLRKfz+fC_gVybujwKriF48A@mail.gmail.com>
In-Reply-To: <CAH4uzPMp_4bwPf0+tjviM=5aDVGLRKfz+fC_gVybujwKriF48A@mail.gmail.com>
From:   Dave van der Locht <d.vanderlocht@gmail.com>
Date:   Fri, 23 Jul 2021 10:49:38 +0200
Message-ID: <CAH4uzPM16T_YKQ+0zTgMLQ+9mW3yeq23Xu0z_RmZ6DaiK=CLNA@mail.gmail.com>
Subject: Re: Status of the stuck sockets bugs.
To:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Ralf;

Below is the thing / patch Marius did, spread, and which seems to
resolve the issue 100% without any side effects.
Replicating the issue can be done fairly easy, without the patch I've
never seen AX.25 sockets getting closed after NETROM disconnects from
kernel 4.4 or 4.9 and up.

Maybe you're willing to give it a review and nail this one. I've heard
this particular patch was provided and rejected for several times and
I know many HAMs are waiting for a solution (or already given up on
it).
But when you're telling not to be aware about this particular patch
I'm wondering if the rumours are true.

Thanks for the clarification / info on this one Ralf!

@@ -287,5 +287,7 @@
                }
                bh_unlock_sock(ax25->sk);
                local_bh_enable();
+       } else {
+               ax25_destroy_socket(ax25);
        }
 }

Kind regards,
Dave van der Locht

Op vr 23 jul. 2021 om 10:19 schreef Ralf Baechle <ralf@linux-mips.org>:
>
> On Thu, Jul 22, 2021 at 07:42:18PM +0200, Dave van der Locht wrote:
>
> > Is anybody able to tell me more / give answers to questions about this issue?
> >
> > Kind regards,
> > Dave van der Locht
> >
> > Op di 29 jun. 2021 om 19:32 schreef Dave van der Locht
> > <d.vanderlocht@gmail.com>:
> > >
> > > Hello,
> > >
> > > Is there any news about the well known bug regarding sockets getting
> > > stuck in LISTENING state?
> > >
> > > Some years ago (already) Marius Petrescu YO2LOJ wrote a patch for the
> > > ax25_subr.c file which seems to work very well and solves the issue.
> > > But it's really annoying having to patch the kernel with each update
> > > again.
> > >
> > > What about that patch, I've heard it was rejected several times for
> > > some reason? But can't find info regarding that.
> > > What can be done - or who is able - to get rid of this bug and get it
> > > fixed in the kernel?
>
> I wasn't even aware of these patches and an internet search didn't turn
> up anything.  Fortunately it turned out I have friends who happen to
> know Marius so who pointed me at his "patches" really quickly.
>
> And they were not even patches but a broken out net/ax25 directory from
> a Debian kernel with random changes.  That said, while the way these
> changes were hidden away and present leaves space for improvments,
> technically they appear to have benefit, so I'm now working through
> them.
>
>   Ralf
