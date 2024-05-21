Return-Path: <linux-hams+bounces-282-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F05C8CA6A4
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 05:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23916B215EE
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 03:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBF71BF24;
	Tue, 21 May 2024 03:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bC3gnKss"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873B6182DF
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 03:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716260854; cv=none; b=F3CA3jCcLp2ZAK0XTM4FGLMJmQr8rjlIalZgypqHDfIVXYPxp0yPLEA/NADycovAUAdyg519/isgq78V2asJtJhfbxsXWOJm9c+529R6SMhyQ6ZQvPN5J0p79L2WHjY/c+CVB7ZdX/RVmd+6/uP9XRXWeoetEPlkQnn58XT5dP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716260854; c=relaxed/simple;
	bh=p9VnOtBtoRXE+kpfYyzSidvaVSLuHzHBTeJdykm7odM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IaTvv+QsvPNu86Y4PXCdfuf9vscxxzsstZzWFe0hHOZFEANyfPVa+jyEXwMF5RES3gSRjxOqpDJMSD2Q2Rx0OaKqQllq/WDB7FJQeJbpUcY9wVuR3oPl4PeGN9dnwEH++MofaILn+AfPEY9zRHGNjHbxUBw2vaTO4tzlfO+DuKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bC3gnKss; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-debaa161ae3so3160033276.1
        for <linux-hams@vger.kernel.org>; Mon, 20 May 2024 20:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716260851; x=1716865651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W63ku0Ys6SV7GX/zctqZRDmB0GLbhwmkyhJY/OQkDgM=;
        b=bC3gnKssdOvhgUEW6KoAdnnZsQ8hcaIZY9JwGxFK0+KBOQVk9w7mKhK8CJzpsHk7vV
         DPHa57o3NBiaZVsyGWcMQKG3pHfGLabcV+JdD4+i+Heh3QpS72UyhOIY9Z7PlV3hltNW
         9+rr0cM6rFr0sh0O023ANnsvjQieMnWNMksyVfyjahDrNiMfpIw0m5eGZCEHMH/hmS4/
         MoXisKAOpYT4mXYDq+he1Ikd+7v+mdE2NxwRzSR/VrRrzOgrk+jp0POaUq2zzWAaBXLt
         hxIVBbteRXsVyFJnk0O65J4/pnWr3L2nkpXbLgG7EiAi1cjeWQZqG6TJIubVsNrUhe0X
         CEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716260851; x=1716865651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W63ku0Ys6SV7GX/zctqZRDmB0GLbhwmkyhJY/OQkDgM=;
        b=AcfAvv6JuHMtUcAnAodzqZWnSkiRwhYpuAWdrolf9X2fZXLnpIaCWN0vReXaiZvHDO
         d1lsGDYXuXIfrpDB2EryFkDTW7cSQqTJzB/ROXkS7h8vzqwGkIZqX/v9KOIW55PeuQlo
         r0O6D7CQRzFx+HvjeDn+6BHWDBHXvZjrSBfvT/FJ4iAjmVI63oIYp8lguEHsCEgJDn83
         xeuSFTcXBkI4DzJ/TsXT4LdQvC8xDtMYUTCqeGFLkPx+MDoC+HE5W13PNEFchFWLyWFJ
         C7o4gOkk7XXIi/1SNY1Zkvnl7NAXUqXpRY3cS4ckTB0Xz1IeSetC+P8L/b6VxCiE2n+J
         QdEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYjzuF9bxbz8Kjp0i+ET5vWzKQypRW0XrzXcG2n5CFx5WJTHc3Ybfv0Mrd/KnbaoqieJ4UPF2o1lj+bbY+X45ksFrc8lU6J/f2fw==
X-Gm-Message-State: AOJu0Yx2C4FGm8RQmnPc92kmR0dHoyoUc2FfNAzDYUwILqIfnX6MgIqZ
	V0Um3/jP+uz0Nql/ANBDYU2dmeeN5JOlTcmyYtPcZftRiWDIfJWUTeEUVYuAE/pMIYWyP3LbdHj
	E+LWTmpET89ududqVhJtiFnzifOlUC7PF+6M=
X-Google-Smtp-Source: AGHT+IHiuVa4cNkzjl7qv8U/Dp5Fop4Y6AaVLx34TrfTLnKplLDXoOuCic6qur2fggwtuU9YnqgwIyY4iLpo9ysDka0=
X-Received: by 2002:a25:a4e7:0:b0:dcd:a9ad:7d67 with SMTP id
 3f1490d57ef6-dee4f31a630mr38665542276.8.1716260851459; Mon, 20 May 2024
 20:07:31 -0700 (PDT)
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
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f> <CAEoi9W7LN5MQPGKXZJOdtcaXvyK4PPU9yW7HWOBdq1AP3Fs7nA@mail.gmail.com>
In-Reply-To: <CAEoi9W7LN5MQPGKXZJOdtcaXvyK4PPU9yW7HWOBdq1AP3Fs7nA@mail.gmail.com>
From: Chris Maness <christopher.maness@gmail.com>
Date: Mon, 20 May 2024 20:07:20 -0700
Message-ID: <CANnsUMF=ywvcmfLjXdz_hWLSo5jC2Z0K7Qe4Pcv7j3dr6K99Jg@mail.gmail.com>
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Dan Cross <crossd@gmail.com>
Cc: Lars Kellogg-Stedman <lars@oddbit.com>, Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, the only thing not working so far is UROnode in this system.  I am
thinking it needs to be updated to the newer kernel.  I am getting:

ERROR; connect_to: bind: Cannot assign requested address

When I try to connect to a NETROM node from UROnode (AX.25 only works tho).

I can connect from LinFBB with NETROM directly to other nodes using my
NETROM port in LinFBB.

-Chris KQ6UP


On Mon, May 20, 2024 at 7:12=E2=80=AFPM Dan Cross <crossd@gmail.com> wrote:
>
> On Mon, May 20, 2024 at 9:06=E2=80=AFPM Lars Kellogg-Stedman <lars@oddbit=
.com> wrote:
> > On Mon, May 20, 2024 at 05:11:39PM GMT, Chris Maness wrote:
> > > Your patch seems to have fixed the issue so far.
> >
> > That's great! I'm glad it helped.
> >
> > > How come this patch is not included in the mainline source?
> >
> > Well, partly because you're the first person to confirm that it works
> > for someone besides me :). Dan (Cross) has offered to test it out as
> > well; if I can get a couple of confirmations that it's working, I'll
> > probably go ahead and submit it to netdev.
>
> I am running this as of today, and so far so good.
>
> > The bigger issue has been that there are very few people interested in
> > the ax.25 support in the kernel; there's not a real maintainer, so it's
> > difficult to get code approved. There were some concerns expressed that
> > maybe this isn't the *correct* fix, but I would argue that even if it's
> > not the most correct fix we should try to get it in anyway, since
> > otherwise ax.25 is completely broken.
>
> Agreed: what's there now is objectively broken. Please, let's not let
> the perfect be the enemy of the good here.
>
>         - Dan C.



--=20
Thanks,
Chris Maness

