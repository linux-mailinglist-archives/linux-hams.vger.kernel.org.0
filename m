Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA4386C5E55
	for <lists+linux-hams@lfdr.de>; Thu, 23 Mar 2023 06:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjCWFCj (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 23 Mar 2023 01:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjCWFCi (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 23 Mar 2023 01:02:38 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2C7977E
        for <linux-hams@vger.kernel.org>; Wed, 22 Mar 2023 22:02:37 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-544787916d9so375965047b3.13
        for <linux-hams@vger.kernel.org>; Wed, 22 Mar 2023 22:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679547756;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJnIi4kYoQJRuy190a+uRJKe25yDwNzQttfiZ2hlQPQ=;
        b=IpavbI3EdcXlySsVocjgq8vzFglVJouLmEnUZ8GqBl1vJdGjH9FjLxovtAyCS0Hw5l
         W6PQ+2Lp8jWs1Y5KFocwa64iKbQ4SRNy3HqVr76cGSPPTtxQAWQEwoj2jk7LJU6oLfJ3
         XvteDTiAQtge4KZLwYyGoQKoHgpQsB/5LFLusqItGf2LPVnsCf4YdT7frs4ll0yvU0W6
         xLqCRxvBYn6pKDLa9bNmDUGj4mtaV9ATQAUNYaCsbAcHSUF3VVbBQXXokZrYgM2XmOQU
         yebnWJdmTbYujQAZRmaGgwZ8qhlK9saO1H1/a4Mx5rk/f0F0G2vTcvaC46sEcPvDICdZ
         tunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679547756;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJnIi4kYoQJRuy190a+uRJKe25yDwNzQttfiZ2hlQPQ=;
        b=YQxKReC2cvEz1AZov4eySuf/hONlcOcueGlgiyIZAtiDPrE4i8Qyx4y/udZQ4IHDbh
         2tOgZ36HKXziQtLJ9TGdhZOb+8zNzNMzGvu29iCb6MPb3oNLfRzTyPHdIBNNBplgO1Sj
         JboyYSajz0kPITfKofCie/4AJzCWuPV0G1eYguSIvvGdL9DBqi9F0ddVmR6NPRaAoj4I
         PNkRUBq//OzZSvVFeDOKkj+QMDNNnBUl1lBnfgDLSvoNdos05KqHOQnnF8M2CwG5Lnuz
         LrMNPGRv8l/lBHf+Qqo3RvjV4rl6P0/dH4H6IzmhaBpOhi/n0ireW4y8Ddx2vlWXYjXb
         TkTQ==
X-Gm-Message-State: AAQBX9dQWeGmZDTtXMCycM9eLEeOxWMN/aLZwwVB9K+vIrqlv+ZSMitp
        37UT+m15NwkzFMiol0dHMoxn2kjcVTDSfSu77VONuEVvuRWb6w==
X-Google-Smtp-Source: AKy350a3nB8q3E0/6f+Q0Hsh1qrH44XshyumskH/Ng5FDVqorHFIwAs4gxEcDXZccpGV+Fbl0YDlahuw9I72oNOhcjc=
X-Received: by 2002:a05:690c:78b:b0:544:bbd2:74be with SMTP id
 bw11-20020a05690c078b00b00544bbd274bemr1310871ywb.4.1679547756146; Wed, 22
 Mar 2023 22:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <CANnsUME=txP2TUyD7rFCZ07ZVcZ318KRNngZVZwxRodBjFxaAg@mail.gmail.com>
 <CANnsUME07t7AxUD99TPqD8ZorxypX1VP02drsKxG7yw+1XdXgw@mail.gmail.com>
 <90059011.4047145.1679411079757@mail.ziggo.nl> <CANnsUMEhdDugO1QtKPFbiCx8CR5Fh3_9P7UO_CZr92-4ssUv-g@mail.gmail.com>
 <CANnsUMFWHDOccTdtX-ekcnp9oh58Sfk5Gz+jdTA-Jf9uOg+aEQ@mail.gmail.com> <CANnsUMFHKEfMQaXKJ7LUz_55oRhRf83aF9s3Yw30Quo6PG4hgQ@mail.gmail.com>
In-Reply-To: <CANnsUMFHKEfMQaXKJ7LUz_55oRhRf83aF9s3Yw30Quo6PG4hgQ@mail.gmail.com>
From:   Chris Maness <christopher.maness@gmail.com>
Date:   Wed, 22 Mar 2023 22:02:25 -0700
Message-ID: <CANnsUMGPbd=Nw6ezu=BZ=mAG5=o2Vm9jX84H2AMrWvXr4b9iBQ@mail.gmail.com>
Subject: Re: 4.19 Kernel Config File?
To:     Dave van der Locht <dave.is@home.nl>, linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Ok, finally.  It boots!  I needed to add an IDE chipset.  The generic
support was not working so I tried SiS, since it is a SiS chipset and
bingo!   A lot has changed since I have dug this deeply into linux.
But I have learned a lot in the process ;o).

This is the recent patches that I applied to my 5.15 kernel series in
my modern computer:

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=
=3D7d8a3a477b3e

It works very well.  I have not had any issues, save the loopback via
kissnetd that is slow to start at first.  Yours connects instantly,
but only once.  It works fine for a regular ax25 port, but not in my
loopback setup.  The patch at the bottom of that link looks like it
does something similar to yours.  I have included my startup at the
bottom for reference.

I was able to apply this patch set to the 4.19 kernel, and I am kind
of excited to see what comes out.  I also tried compiling without the
patch, and I was having the same problem.

This is getting interesting, so I cc'd the kernel group.

73 de Chris KQ6UP

#!/bin/bash

#

modprobe mkiss

#

modprobe netrom

#

kissattach /dev/ttyS1 vhf

#

kissparms -c 1 -p vhf

#

kissnetd -p 4 &

#

sleep 5

#

kissattach /dev/pts/1 lb0

#

kissattach /dev/pts/2 lb1

#

kissparms -c 1 -p lb0

#

kissparms -c 1 -p lb1

#

sleep 3

#

nrattach netrom

#

netromd -i -t 10

#

sleep 3

#

ax25d

#

mheardd

#


On Wed, Mar 22, 2023 at 7:08=E2=80=AFAM Chris Maness
<christopher.maness@gmail.com> wrote:
>
> I guess doing make oldconfig is a bad idea across the span of many
> years even though it is the same 4* branch.  SATA conflicts with IDE,
> and I had them both turned on.  I am not sure if it is related to my
> loop problem, but I am recompiling now.  I started from scratch, but I
> needed to change some defaults since this was on an old box.
>
> -73 Chris
>
> On Tue, Mar 21, 2023 at 8:21=E2=80=AFAM Chris Maness
> <christopher.maness@gmail.com> wrote:
> >
> > ps.  The patch took, as the patch command replied hunk 1 applied
> > successfully.  I also tried to apply again, and complained and asked
> > if I wanted to reverse the patch.
> >
> > Thank you,
> > Chris KQ6UP
> >
> > On Tue, Mar 21, 2023 at 8:20=E2=80=AFAM Chris Maness
> > <christopher.maness@gmail.com> wrote:
> > >
> > > Yes, there was an issue with the domain.  It is up here:
> > >
> > > https://linux-ax25.in-berlin.de/wiki/Main_Page
> > >
> > > Also, my loopback is not connecting to netrom, it is just plain
> > > vanilla AX.25.  I will recompile with the defaults per your
> > > suggestion.
> > >
> > > Regards,
> > > Chris KQ6UP
> > >
> > > On Tue, Mar 21, 2023 at 8:04=E2=80=AFAM Dave van der Locht <dave.is@h=
ome.nl> wrote:
> > > >
> > > > Hi Chris,
> > > >
> > > > Unfortunately I don't have a copy of my current running kernel sour=
ce. The only thing I'm doing is get the source, patching, recompiling with =
the exact same (default distro) kernel config, and put in place for running=
.
> > > >
> > > > When NETROM only can connect once you should check the socket state=
. If the previously connected socket is going into a listening state it see=
ms like you haven't applied the patch correctly. The patch is to prevent ex=
actly that situation.
> > > >
> > > > Good look with merging VE7FET's version to the official linuxax25 t=
ree. I thought the official tree is pretty dead for a while and isn't havin=
g an active maintainer at all currently. If I'm correct even the official w=
eb page (linux-ax25.org) went down last year and never came back online.
> > > >
> > > > 73! Dave
> > > >
> > > >
> > > > > Op 20-03-2023 19:27 schreef Chris Maness <christopher.maness@gmai=
l.com>:
> > > > >
> > > > >
> > > > > VE7FET's stuff did not fix the bug.  I am thinking there may be
> > > > > something that I have configured that is conflicting in the kerne=
l.
> > > > > Would you mind sending me yours when you get the chance?  I will
> > > > > recompile and give it another shot.  In the default 4.4 kernel th=
at
> > > > > comes with slack 14.2, NETROM poops out after a while.  With the =
14.19
> > > > > that I built, net rom is strong and everything connects really fa=
st
> > > > > the first go for my loopback.  It is usually slow on other instal=
ls,
> > > > > but it flies on 4.19.  BUT I can only connect once.  The VHF port
> > > > > works just fine over and over again.
> > > > >
> > > > > I do like VE7FET's default files.  They are very well annotated. =
 We
> > > > > need to merge his stuff back to the official maintainers tree.  I=
t
> > > > > would be an improvement.
> > > > >
> > > > > Thank you,
> > > > > -Chris KQ6UP
> > > > >
> > > > > On Sun, Mar 19, 2023 at 7:21=E2=80=AFPM Chris Maness
> > > > > <christopher.maness@gmail.com> wrote:
> > > > > >
> > > > > > Dave, you had mentioned that 4.19 was the high water mark of th=
e linux
> > > > > > AX.25 stack.  Unfortunately, no longer true with the current re=
lease
> > > > > > of that branch.  I applied your patch (it took no problem) and
> > > > > > compiled.  I am getting the same problems that I was getting on=
 the
> > > > > > unpatched 5.15 kernel (BUT) I have not rebuilt the userspace wi=
th the
> > > > > > new headers.  I will try doing that just rule out the possibili=
ty of
> > > > > > header changes from 4.9 (the distribution's last kernel update)=
 and
> > > > > > 4.19.278.
> > > > > >
> > > > > > If that doesn't fix it, would you mind sharing your kernel sour=
ce so
> > > > > > that I can compile and install on this machine.  I would like t=
o try
> > > > > > it out.
> > > > > >
> > > > > > 5.15 with the patches that I had posted to the Raspberry Pi's f=
ork of
> > > > > > the 5.15 kernel were solid.  I might try that source with this =
system.
> > > > > > I don't think Arch Linux will be good for native AX.25 until al=
l the
> > > > > > bugs are squashed in the current 6.2 release.  If you are not f=
amiliar
> > > > > > with that distro, they do a rolling release that is always on t=
he
> > > > > > bleeding edge of everything.  It is nice for common stuff that =
you run
> > > > > > on a desktop, but not so much for things that don't get a lot o=
f
> > > > > > attention like the AX.25 stack.  I actually really like it.  Th=
e
> > > > > > documentation is comparable to none.
> > > > > >
> > > > > > 73 de Chris KQ6UP
> > > > > >
> > > > > > --
> > > > > > Thanks,
> > > > > > Chris Maness
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Thanks,
> > > > > Chris Maness
> > >
> > >
> > >
> > > --
> > > Thanks,
> > > Chris Maness
> >
> >
> >
> > --
> > Thanks,
> > Chris Maness
>
>
>
> --
> Thanks,
> Chris Maness



--
Thanks,
Chris Maness
