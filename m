Return-Path: <linux-hams+bounces-284-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E8F8CADD7
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 14:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADC762839B5
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 12:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A77F757E4;
	Tue, 21 May 2024 12:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gADypNQF"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DD6524B4
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 12:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716293051; cv=none; b=gPD1yN1uZU0P9F9lK3wEJ20ao2zQFDHAw1yF30fcqzwB5/kwsNP8q3yPNwcYwZscKKaP20ucTyhxapN1/6A4cY+5F+MNKx5GtJTeisCYLQgLxuC9NvaBwNFNgIzhUBl+A+u0maqHhb6pidoDNXytgKc3uKYw0jD89MdYoDbx9wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716293051; c=relaxed/simple;
	bh=Tj2rGuwo8jn8ALhZPSfU1+vVdGnBU3HdX4dnRpoeUPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kz353e39G+OqRZJkusv6qSSXmw1BMqpVBauY5HlWzWP1HsXzVjc4t0KJ6hUedDCXX+MW3+cqNkV8c6QF6XEfFQHDQSQZNkpgqQlkbxKG2ceSx2Krudkcav30d+QYgkKNs/njcPCa9shOyPzoS427FoIVTy17Pcbg1+bfYp+j3ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gADypNQF; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-de6074a464aso3368362276.0
        for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 05:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716293049; x=1716897849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hF9aiI+fmzs+r8IcUPhmj5yUbC9yvr+oUqqh7lr0OrM=;
        b=gADypNQFAfyaouFnu04+XsEXjynLly/v1qLsNcnb+pQF1qAC2hoE+dMp43upLL6yk7
         Ii01m/k0a8zclb02PbWAWvO65e8EBZ+yv6AB3v3k+ncgw/dNBUTiCVOYSyGlYCPEju6P
         8iQb+HrP8mrly5rZACwpqRov+Y4AtcTaEoDfEdqcbi5LSlyGQt3cSW0WBKWovSWgdaFH
         w/DT4IvSwOwra9JrW3vhtz/Q+x0jp9cIkQVqZfOf6HPyKBMWktgNHCus5orXsazyEukc
         JFPZ3aPJkDj1OBiyRQJVg3YSB+x6ODZZXBzoDN8ht33YJZc21RZ3+WkJaV7zjTF4rf0b
         Y0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716293049; x=1716897849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hF9aiI+fmzs+r8IcUPhmj5yUbC9yvr+oUqqh7lr0OrM=;
        b=ZJaJcCTo3d9BdjZ7y/Y33U0EjBzLPFvooEZNf60xdfLJQIhFV0+m6yLhaFzyNKFObO
         atyemLJZ/3IUQAzeCETZqtYRjtj1JTNHCFqBrrYkgE/2u72AJHOlmfia3Hm+SDsvjX7N
         KmBB6gZShof7tSvacPbFV8cClHu5PRa+7F/7iLxHbskXdXNDPylU4WFQy8kVzsx/1wjo
         jhEvXeDARpGtlNSogbL4K6YFpHLnmxjSf42mo5v8D+igveU1oWzmAuHoFUau8bR+7scJ
         vhjFsqphEn1zHiV2uw4924rDPe0QkBZv4mcfzwD17YSxCbj6EUi7OZPSUinT3cik/VZ1
         bxFw==
X-Forwarded-Encrypted: i=1; AJvYcCVsJF7ihMThfXdjOC7fyiGEiHETUjZIGj+0RfrTmE+ZTYp0NA1wepM3SLboJrFPHNlLOHfvCJRrOzeEI7xTvLGxK+epiJqzCYnt8Q==
X-Gm-Message-State: AOJu0YzsysjiriaIhJETGJ30ZfGJdCrJPNsGFKMGH7B0CuBkKcEauYE3
	Hja8uNYHHisob5JZlHh10vzHYxSWtr2byj5H2D4y7k+t0xZ01lcFJUFkZL+EFZygbB/dHalD63F
	hsYcSCOJZ8Y99t0mZY0h1mCa6/br6aA==
X-Google-Smtp-Source: AGHT+IGx2BRvevkvcuvPgSby4uJMoqjSYx1Mtl1iaG9L8P69rQptSACmlZYpS2Ei4YsoaXZiUkPrlobNo9USHVX+F20=
X-Received: by 2002:a25:8382:0:b0:deb:3b7c:5268 with SMTP id
 3f1490d57ef6-dee4f2e8616mr32322722276.29.1716293049185; Tue, 21 May 2024
 05:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501060218.32898-1-duoming@zju.edu.cn> <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn> <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
 <CAEoi9W7LN5MQPGKXZJOdtcaXvyK4PPU9yW7HWOBdq1AP3Fs7nA@mail.gmail.com>
 <CANnsUMF=ywvcmfLjXdz_hWLSo5jC2Z0K7Qe4Pcv7j3dr6K99Jg@mail.gmail.com> <a0890c99-0f42-44bb-b1f3-cdc66efdad50@app.fastmail.com>
In-Reply-To: <a0890c99-0f42-44bb-b1f3-cdc66efdad50@app.fastmail.com>
From: Chris Maness <christopher.maness@gmail.com>
Date: Tue, 21 May 2024 05:03:57 -0700
Message-ID: <CANnsUMGf744psJZCqKoKw4ysRuH4KjhTpjR1CZZNbPr2DPQ99g@mail.gmail.com>
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Dave Hibberd <hibby@debian.org>
Cc: Dan Cross <crossd@gmail.com>, Lars Kellogg-Stedman <lars@oddbit.com>, Duoming Zhou <duoming@zju.edu.cn>, 
	linux-hams@vger.kernel.org, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

netrom_call has not worked for ages.  I am using VE7FET's forked
userspace, not the official.  I could build another
system with the official userspace I suppose.  My understanding is
that VE7FET fixed some bugs, and I have had
better luck with it for the most part.

-Chris KQ6UP

On Tue, May 21, 2024 at 4:48=E2=80=AFAM Dave Hibberd <hibby@debian.org> wro=
te:
>
> Can you use other libax25 dependent packages or is it only Uronode?
>
> axcall for netrom would be a reasonable starter to see if it's a libax25 =
problem or not.
>
> LinFBB, from what I remember, uses its own internal state machine/etc onc=
e it's bound to the socket.
>
> Cheers,
>
> --
>   Hibby
>   Debian Developer
>   Packet Radioist
>   MM0RFN
>
> On Tue, 21 May 2024, at 4:07 AM, Chris Maness wrote:
> > Ok, the only thing not working so far is UROnode in this system.  I am
> > thinking it needs to be updated to the newer kernel.  I am getting:
> >
> > ERROR; connect_to: bind: Cannot assign requested address
> >
> > When I try to connect to a NETROM node from UROnode (AX.25 only works t=
ho).
> >
> > I can connect from LinFBB with NETROM directly to other nodes using my
> > NETROM port in LinFBB.
> >
> > -Chris KQ6UP
> >
> >
> > On Mon, May 20, 2024 at 7:12=E2=80=AFPM Dan Cross <crossd@gmail.com> wr=
ote:
> >>
> >> On Mon, May 20, 2024 at 9:06=E2=80=AFPM Lars Kellogg-Stedman <lars@odd=
bit.com> wrote:
> >> > On Mon, May 20, 2024 at 05:11:39PM GMT, Chris Maness wrote:
> >> > > Your patch seems to have fixed the issue so far.
> >> >
> >> > That's great! I'm glad it helped.
> >> >
> >> > > How come this patch is not included in the mainline source?
> >> >
> >> > Well, partly because you're the first person to confirm that it work=
s
> >> > for someone besides me :). Dan (Cross) has offered to test it out as
> >> > well; if I can get a couple of confirmations that it's working, I'll
> >> > probably go ahead and submit it to netdev.
> >>
> >> I am running this as of today, and so far so good.
> >>
> >> > The bigger issue has been that there are very few people interested =
in
> >> > the ax.25 support in the kernel; there's not a real maintainer, so i=
t's
> >> > difficult to get code approved. There were some concerns expressed t=
hat
> >> > maybe this isn't the *correct* fix, but I would argue that even if i=
t's
> >> > not the most correct fix we should try to get it in anyway, since
> >> > otherwise ax.25 is completely broken.
> >>
> >> Agreed: what's there now is objectively broken. Please, let's not let
> >> the perfect be the enemy of the good here.
> >>
> >>         - Dan C.
> >
> >
> >
> > --
> > Thanks,
> > Chris Maness



--=20
Thanks,
Chris Maness

