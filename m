Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6118C6C66D5
	for <lists+linux-hams@lfdr.de>; Thu, 23 Mar 2023 12:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjCWLj6 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 23 Mar 2023 07:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjCWLj5 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 23 Mar 2023 07:39:57 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A4DCF746
        for <linux-hams@vger.kernel.org>; Thu, 23 Mar 2023 04:39:56 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id e65so24354999ybh.10
        for <linux-hams@vger.kernel.org>; Thu, 23 Mar 2023 04:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679571596;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRtk8jgjS167R7sGRDykUz27ov0X6/qJouCZFeazrH4=;
        b=c0T+jDalCGqrlxRhmjp+zg0WRtLkLqqNTwK+a0wC870MukRxwAZFS4Eu+MvxCaHvCx
         nDgdPk/A1Z1zYWs2OtiUurK0zbXDaolOAqFFtM0zcGiQ0/qHImCuDkIYPO01XAJJ04Y/
         hGpiww5XizmvpGLwXuzR0IlKYAxOgW69HkE0VHObgJrLDlOPVpQb1P7ZN3Hp7odvomf/
         2Fho+5Oz2FpkYx0iGNTtZZ/Vmo/v75m86odiblzdTprP0gazUJLyWP03RE33moYKwObc
         RYnEtBBXiPgvQwxOIqPtNxA1QsbPhabZXmT9QlABYoVodpr+Vkyq3aG8y28Om/6HBWvi
         Odog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679571596;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRtk8jgjS167R7sGRDykUz27ov0X6/qJouCZFeazrH4=;
        b=A2+gJpuexvilDoSi9P1J8cnB18yBTK6xgYTDG7maKPSDtu9Ayb2Yt07UrNFcO6V+8L
         3SpQVBiPIbFq300IMbdO8O49qIL4Zinob/r7y7Wi2+0Hq5bBg40F0cBdpNeZHV7rPtnv
         fE62SbYJ0hJZde4GkmZi0ILKTMTrazT655Suo8ss0kkM15MHdR+173e3IpmT0GILGSgB
         9gytWQAdb+CFsqWF+dlCsl2T6U3tTDAyjT20j/JjC9ZS6rCgoDHSZia30t9p2rfVJ34p
         EGED0m6UR8QYr1R6+ET/f8vjIhyJ1NXpTGFvRr8/GGPLAbqLnx+dwSrF43NVOQ/p48nn
         bsWw==
X-Gm-Message-State: AAQBX9eB85LKuKsU0Pop3y8sSYpvHfsp5BcstHzQFyElGRuqFgcKFLpk
        CiB1t5fdyDYV//cozY1cpgKS5/RE6HYjeIGJF8c=
X-Google-Smtp-Source: AKy350aj5l6PQGtu7qEMd9bzVYJD4LLVmkCeuQn0mggRSDG9SCymmu9T/YOw8uc2Qhmv+gg9lr8V43QYF+UW29Ok1zk=
X-Received: by 2002:a05:6902:1005:b0:a6b:bc64:a0af with SMTP id
 w5-20020a056902100500b00a6bbc64a0afmr2109493ybt.4.1679571595497; Thu, 23 Mar
 2023 04:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <CANnsUME=txP2TUyD7rFCZ07ZVcZ318KRNngZVZwxRodBjFxaAg@mail.gmail.com>
 <CANnsUME07t7AxUD99TPqD8ZorxypX1VP02drsKxG7yw+1XdXgw@mail.gmail.com>
 <90059011.4047145.1679411079757@mail.ziggo.nl> <CANnsUMEhdDugO1QtKPFbiCx8CR5Fh3_9P7UO_CZr92-4ssUv-g@mail.gmail.com>
 <CANnsUMFWHDOccTdtX-ekcnp9oh58Sfk5Gz+jdTA-Jf9uOg+aEQ@mail.gmail.com>
 <CANnsUMFHKEfMQaXKJ7LUz_55oRhRf83aF9s3Yw30Quo6PG4hgQ@mail.gmail.com>
 <CANnsUMGPbd=Nw6ezu=BZ=mAG5=o2Vm9jX84H2AMrWvXr4b9iBQ@mail.gmail.com> <CANnsUMEbxyRKntPNMuq7L_KchVF9d3LPh9BXwtYisSqDxj=ETg@mail.gmail.com>
In-Reply-To: <CANnsUMEbxyRKntPNMuq7L_KchVF9d3LPh9BXwtYisSqDxj=ETg@mail.gmail.com>
From:   Chris Maness <christopher.maness@gmail.com>
Date:   Thu, 23 Mar 2023 12:40:18 -0700
Message-ID: <CANnsUMF5kC=uXUxCe-+unwy5vgLmcdmsLmPFZH=6mFfAjVArXw@mail.gmail.com>
Subject: Re: 4.19 Kernel Config File?
To:     Dave van der Locht <dave.is@home.nl>, linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Ok, kernel panic.  Something is definitely going on with the patches
and kissnetd.  I can pretty reliably make the whole thing crash.  This
is on a different (single core) system.  I will try to write it up to
see if you kind folks can reproduce it yourselves.

Chris KQ6UP

On Wed, Mar 22, 2023 at 10:17=E2=80=AFPM Chris Maness
<christopher.maness@gmail.com> wrote:
>
> Ok, those patches squashed the bug!  My loopback works again, and
> better than ever.  Hopefully no crashes with 4.19!
>
> -73 and GN All KQ6UP
>
> On Wed, Mar 22, 2023 at 10:02=E2=80=AFPM Chris Maness
> <christopher.maness@gmail.com> wrote:
> >
> > Ok, finally.  It boots!  I needed to add an IDE chipset.  The generic
> > support was not working so I tried SiS, since it is a SiS chipset and
> > bingo!   A lot has changed since I have dug this deeply into linux.
> > But I have learned a lot in the process ;o).
> >
> > This is the recent patches that I applied to my 5.15 kernel series in
> > my modern computer:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?=
id=3D7d8a3a477b3e
> >
> > It works very well.  I have not had any issues, save the loopback via
> > kissnetd that is slow to start at first.  Yours connects instantly,
> > but only once.  It works fine for a regular ax25 port, but not in my
> > loopback setup.  The patch at the bottom of that link looks like it
> > does something similar to yours.  I have included my startup at the
> > bottom for reference.
> >
> > I was able to apply this patch set to the 4.19 kernel, and I am kind
> > of excited to see what comes out.  I also tried compiling without the
> > patch, and I was having the same problem.
> >
> > This is getting interesting, so I cc'd the kernel group.
> >
> > 73 de Chris KQ6UP
> >
> > #!/bin/bash
> >
> > #
> >
> > modprobe mkiss
> >
> > #
> >
> > modprobe netrom
> >
> > #
> >
> > kissattach /dev/ttyS1 vhf
> >
> > #
> >
> > kissparms -c 1 -p vhf
> >
> > #
> >
> > kissnetd -p 4 &
> >
> > #
> >
> > sleep 5
> >
> > #
> >
> > kissattach /dev/pts/1 lb0
> >
> > #
> >
> > kissattach /dev/pts/2 lb1
> >
> > #
> >
> > kissparms -c 1 -p lb0
> >
> > #
> >
> > kissparms -c 1 -p lb1
> >
> > #
> >
> > sleep 3
> >
> > #
> >
> > nrattach netrom
> >
> > #
> >
> > netromd -i -t 10
> >
> > #
> >
> > sleep 3
> >
> > #
> >
> > ax25d
> >
> > #
> >
> > mheardd
> >
> > #
> >
> >
> > On Wed, Mar 22, 2023 at 7:08=E2=80=AFAM Chris Maness
> > <christopher.maness@gmail.com> wrote:
> > >
> > > I guess doing make oldconfig is a bad idea across the span of many
> > > years even though it is the same 4* branch.  SATA conflicts with IDE,
> > > and I had them both turned on.  I am not sure if it is related to my
> > > loop problem, but I am recompiling now.  I started from scratch, but =
I
> > > needed to change some defaults since this was on an old box.
> > >
> > > -73 Chris
> > >
> > > On Tue, Mar 21, 2023 at 8:21=E2=80=AFAM Chris Maness
> > > <christopher.maness@gmail.com> wrote:
> > > >
> > > > ps.  The patch took, as the patch command replied hunk 1 applied
> > > > successfully.  I also tried to apply again, and complained and aske=
d
> > > > if I wanted to reverse the patch.
> > > >
> > > > Thank you,
> > > > Chris KQ6UP
> > > >
> > > > On Tue, Mar 21, 2023 at 8:20=E2=80=AFAM Chris Maness
> > > > <christopher.maness@gmail.com> wrote:
> > > > >
> > > > > Yes, there was an issue with the domain.  It is up here:
> > > > >
> > > > > https://linux-ax25.in-berlin.de/wiki/Main_Page
> > > > >
> > > > > Also, my loopback is not connecting to netrom, it is just plain
> > > > > vanilla AX.25.  I will recompile with the defaults per your
> > > > > suggestion.
> > > > >
> > > > > Regards,
> > > > > Chris KQ6UP
> > > > >
> > > > > On Tue, Mar 21, 2023 at 8:04=E2=80=AFAM Dave van der Locht <dave.=
is@home.nl> wrote:
> > > > > >
> > > > > > Hi Chris,
> > > > > >
> > > > > > Unfortunately I don't have a copy of my current running kernel =
source. The only thing I'm doing is get the source, patching, recompiling w=
ith the exact same (default distro) kernel config, and put in place for run=
ning.
> > > > > >
> > > > > > When NETROM only can connect once you should check the socket s=
tate. If the previously connected socket is going into a listening state it=
 seems like you haven't applied the patch correctly. The patch is to preven=
t exactly that situation.
> > > > > >
> > > > > > Good look with merging VE7FET's version to the official linuxax=
25 tree. I thought the official tree is pretty dead for a while and isn't h=
aving an active maintainer at all currently. If I'm correct even the offici=
al web page (linux-ax25.org) went down last year and never came back online=
.
> > > > > >
> > > > > > 73! Dave
> > > > > >
> > > > > >
> > > > > > > Op 20-03-2023 19:27 schreef Chris Maness <christopher.maness@=
gmail.com>:
> > > > > > >
> > > > > > >
> > > > > > > VE7FET's stuff did not fix the bug.  I am thinking there may =
be
> > > > > > > something that I have configured that is conflicting in the k=
ernel.
> > > > > > > Would you mind sending me yours when you get the chance?  I w=
ill
> > > > > > > recompile and give it another shot.  In the default 4.4 kerne=
l that
> > > > > > > comes with slack 14.2, NETROM poops out after a while.  With =
the 14.19
> > > > > > > that I built, net rom is strong and everything connects reall=
y fast
> > > > > > > the first go for my loopback.  It is usually slow on other in=
stalls,
> > > > > > > but it flies on 4.19.  BUT I can only connect once.  The VHF =
port
> > > > > > > works just fine over and over again.
> > > > > > >
> > > > > > > I do like VE7FET's default files.  They are very well annotat=
ed.  We
> > > > > > > need to merge his stuff back to the official maintainers tree=
.  It
> > > > > > > would be an improvement.
> > > > > > >
> > > > > > > Thank you,
> > > > > > > -Chris KQ6UP
> > > > > > >
> > > > > > > On Sun, Mar 19, 2023 at 7:21=E2=80=AFPM Chris Maness
> > > > > > > <christopher.maness@gmail.com> wrote:
> > > > > > > >
> > > > > > > > Dave, you had mentioned that 4.19 was the high water mark o=
f the linux
> > > > > > > > AX.25 stack.  Unfortunately, no longer true with the curren=
t release
> > > > > > > > of that branch.  I applied your patch (it took no problem) =
and
> > > > > > > > compiled.  I am getting the same problems that I was gettin=
g on the
> > > > > > > > unpatched 5.15 kernel (BUT) I have not rebuilt the userspac=
e with the
> > > > > > > > new headers.  I will try doing that just rule out the possi=
bility of
> > > > > > > > header changes from 4.9 (the distribution's last kernel upd=
ate) and
> > > > > > > > 4.19.278.
> > > > > > > >
> > > > > > > > If that doesn't fix it, would you mind sharing your kernel =
source so
> > > > > > > > that I can compile and install on this machine.  I would li=
ke to try
> > > > > > > > it out.
> > > > > > > >
> > > > > > > > 5.15 with the patches that I had posted to the Raspberry Pi=
's fork of
> > > > > > > > the 5.15 kernel were solid.  I might try that source with t=
his system.
> > > > > > > > I don't think Arch Linux will be good for native AX.25 unti=
l all the
> > > > > > > > bugs are squashed in the current 6.2 release.  If you are n=
ot familiar
> > > > > > > > with that distro, they do a rolling release that is always =
on the
> > > > > > > > bleeding edge of everything.  It is nice for common stuff t=
hat you run
> > > > > > > > on a desktop, but not so much for things that don't get a l=
ot of
> > > > > > > > attention like the AX.25 stack.  I actually really like it.=
  The
> > > > > > > > documentation is comparable to none.
> > > > > > > >
> > > > > > > > 73 de Chris KQ6UP
> > > > > > > >
> > > > > > > > --
> > > > > > > > Thanks,
> > > > > > > > Chris Maness
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Thanks,
> > > > > > > Chris Maness
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Thanks,
> > > > > Chris Maness
> > > >
> > > >
> > > >
> > > > --
> > > > Thanks,
> > > > Chris Maness
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



--=20
Thanks,
Chris Maness
