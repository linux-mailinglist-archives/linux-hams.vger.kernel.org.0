Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92232411428
	for <lists+linux-hams@lfdr.de>; Mon, 20 Sep 2021 14:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234110AbhITMTf (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 20 Sep 2021 08:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233446AbhITMTf (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 20 Sep 2021 08:19:35 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE0DC061574
        for <linux-hams@vger.kernel.org>; Mon, 20 Sep 2021 05:18:08 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id m9so15237182qtk.4
        for <linux-hams@vger.kernel.org>; Mon, 20 Sep 2021 05:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iDmSRXxV/4NC5Np3GCK1I6Wb2BD3eKB1qP7dPjMtRaQ=;
        b=U2Rfn4bdrm+/vlusqwXJxKZoJaIoN1jQgbAlLydtzMO87Mz5bqpJF4RmvoTv46wScS
         fgY63JiX93az0YH9mbRbuUdVxGW6dZh4w6bptfR11eCQYelJBTOs8VQKKrVEIMZWtzvH
         fXL1/cxcGGj5IM0c0mcAui8y7UjbbOkO82/9wxRcMUEvqWcm6jvc3eh1/NpvgXKMC8qL
         wFFpnLFjuWQqYjbyTNfFZi4wvWH/NYF78SfsqG5oKOVJYhMiiqs4RRJIWjZnFb4wjrLE
         VdK37ZGQw+ZFET8ZZNMztfIjMCCBV6VcN/HDl9AB11dhVdmDRQcvH5jQIcOPFvlRVFC1
         +w5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iDmSRXxV/4NC5Np3GCK1I6Wb2BD3eKB1qP7dPjMtRaQ=;
        b=y2hhB3scz8UO01Yz0Tca5j3z8Y96BkccV8fDpwIA88NW0pl3Loanmpa4jb43NGS8+z
         x629TC27+lDA/Z+A0kcihU3V6xzqdUERNJdAx0i+yPpMTgnJDU5wHOvtwk+ou8/nlgU+
         +Yll94p9OJ6RQNHwFGfgfW72xDJWxdIS8WkjJZQOefU0EFaxrIUGcjEP6aMmk5l946hQ
         lMJYLoh28mJ2lSHTWRbBAYdE6x41YzeUdXHaxz7Fjh7i7ACpd+KmsSI3hkE0415UQ4zL
         CunKdp1fKU0r1sfQeTk88AcKVQ91a1LiQXSVHry09bzmYv7lmNh9RWBwX7JjkRaCrFIz
         lcCA==
X-Gm-Message-State: AOAM533NipUxSE7EuYgTOQDNgf26Gnqti7Tx9LvJbhA6byYoOrHV9HBh
        LX84lUZQJVefku9oTuKA7+5/rM7TBtlhPdU+TIc=
X-Google-Smtp-Source: ABdhPJznC2nSgJZl87P8t4EqUfoZRB3qxpdB+r/fAOsNb4Iy4tBCsntbiTMAYCLL4LqkOrlE+cl/yfG2tjxVO2Lnoaw=
X-Received: by 2002:a05:622a:591:: with SMTP id c17mr22780441qtb.319.1632140287469;
 Mon, 20 Sep 2021 05:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <8b7a1545-3631-b62d-6430-4a51652023ba@free.fr> <CAH4uzPPVfYnRzGH5OTL6JX7JC64sY5XSsurHBLt=EOV+EPbJ2A@mail.gmail.com>
 <45792400-294f-b496-9c7e-679d19614884@free.fr> <CAH4uzPPtsgz8tnQXwukDVL7=_pgfnK8OS+J8tdHBnsnJE1m5kw@mail.gmail.com>
 <ca4f0c90-53e6-24e8-9a51-f079d6da574c@trinnet.net> <a5d51093-fb07-0683-e094-9da57d9f25fa@blackspace.at>
 <CAH4uzPOO2zDHnP9V0_iYPMb85qM6FcaSEYz3iqiPuMr7rx90+Q@mail.gmail.com> <3345fdf3-26e7-5f2c-cbf0-53026a76399a@blackspace.at>
In-Reply-To: <3345fdf3-26e7-5f2c-cbf0-53026a76399a@blackspace.at>
From:   Dave van der Locht <d.vanderlocht@gmail.com>
Date:   Mon, 20 Sep 2021 14:17:57 +0200
Message-ID: <CAH4uzPOF9Gj4he+ZpQ93rtPuTei43LoJAmrKpHBPt8OokFzgAg@mail.gmail.com>
Subject: Re: AX25 disconnect patch and ROSE socket failure
To:     Roland Schwarz <roland.schwarz@blackspace.at>
Cc:     linux-hams@vger.kernel.org, David Ranch <linux-hams@trinnet.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hi Roland,

Op ma 20 sep. 2021 om 12:53 schreef Roland Schwarz
<roland.schwarz@blackspace.at>:
>
> Hallo Dave,
>
> On 19.09.21 at 20:07 wrote Dave van der Locht:
>
> > Well... That problem is there for quite some years now and there still
> > isn't a solution.
>
> Have you seen Ralfs comment?
> > I wasn't even aware of these patches and an internet search didn't turn
> > up anything.
>
> So it looks to me as if no one had tried to contact the maintainer via
> this list before. I don't believe it is the duty of a maintainer to
> track all possible places on the net for issues, do you?

I've seen Ralf's comment, which suprised me. I was told by several HAM
application developers that particular patch has been rejected several
times in the past and there are more threads here regarding the issue.
I don't know by who and the technical reason/explanation about it and
its complete history. Of coarse I understand it isn't a task of a
maintainer to keep track of all possible places on the net regarding
this issue.

Hopefully it will be investigated and solved now Ralf is aware of the issue.

>
> > Although that proposed solution might not be the root cause I'm
> > wondering what the real root cause is and why it's still not
> > researched and fixed after years with everyone complaining about it.
>
> Again it's two months at best and this is not much time.

See my comment above.

>
> > In the mean time it still seems better to have a good work-around than
> > a pretty useless AX.25 stack.
>
> The work around already is there. One just need to compile with the
> patch in place.

For me and a lot of other users who know how to do it I agree. For
most HAM radio enthousiasts it's been proven to be a big challenge to
do and keep up with kernel updates too.
Currently there's a security issue with kernel 5.4 and up too
regarding NETROM, so for now we're stuck to 4.19 with patch to keep
things stable and safe regarding AX.25 + NETROM.

>
> 73 de Roland oe1rsa

73! Dave
