Return-Path: <linux-hams+bounces-295-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0361D8CB641
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 01:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63A7D1F21C51
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 23:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07607149C70;
	Tue, 21 May 2024 23:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqGwbHBw"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5030F5579F
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 23:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716332579; cv=none; b=nrp5A6WnctWShI1tP2ncCz5mdBLlyPVQ16gNKD9/4zYj0e7TLSM0b7Yi9YaHq6MME6LqVHZCMaFfiU4qHnACsDktjyy5tVC9l+3rBu91kO0h0oVH2MXqTtV29lhhEvRJ+kUBQOLeV5Uz0pQafu/iscUP4kPlPjPPjOasLxrXYng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716332579; c=relaxed/simple;
	bh=melSSW0PJJ1/TgQQSPI5o9n2cAVClt/x/n4qM3xtuII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/dKBkZKJ4yy6g4FZPj0CleJH9s6i+KM0nPvodL8bnRamucB+w/GokyPw8JgHNhioW5yQZKx//d8Vh6tvF+xzP5ALNLwIQ5uhtxJJLF9b1qi8cm0FGFmEvd7fwjGK1zawvmUXKosQ9khrRYKq/X2CaLMWIbwlIk5CYZWxfr7RL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqGwbHBw; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-620314aa1d7so44688897b3.2
        for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 16:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716332577; x=1716937377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcF7DqT45AYP0KUmeioOz+7OvhVzYV8dW28eR1xjVsY=;
        b=lqGwbHBwORnMVsZZpCEa6cfgh7OOx/R6/BFdQZZt3eMbKZmhrj0YHJocm7lGUTygt8
         hW9lmBQACvNoiH2PXdJ2lqb34mREW+HY4rHRpVfk2s8vBgjI1gJjawkkg55F0UM+ggug
         1BWog29G94gT9NeCx/xhfrkkYKFF4ZyvfNGULVjR1qFnnCskFLgSTmDaC2FCljL5nMVt
         iBxQgXBrE0HYMmk3dEWXhVDHw0GTJSxkTVHglNYMaEUHRIzEv+KPqES7/4itAD5/hvJi
         FVwJ2sndYqgKhR1Mwv2CG+6SK5dnOAKKdzHZgv3Rn1PnDlQ19f6JMNt9DWFUxhA93IGf
         zbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716332577; x=1716937377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcF7DqT45AYP0KUmeioOz+7OvhVzYV8dW28eR1xjVsY=;
        b=kXY+i3mmxvaLwP+Slhe2EDLJXUnkx3t8vKviPdoRzz9B6S+gmZIFehLd9fAxDA22OC
         Cr+CeocCSrHOgyanFSIDW1c3KMDUmt9R4iHRyS8IG32RhR40TxmgxzN27ZdyH1L+lcfK
         DFwSKS4ywAiBgVnt2FFWqcnIYKe+we6RQt8O/E8kkHXU//UqXwDhjuQO8F6YGA7TlN/I
         dYrwwUMB4/bnfG9d8BiFpSfcuapg9uiClT5NwTKIAiOWFcLXRDSA6me7N8SzwYKvy9lI
         va14mIKfEYoNKm3Atx32En9hUAA93PxJkfsi7ikEipjpX0PZM2YrB6KS7izc3f+tLfid
         T2+A==
X-Gm-Message-State: AOJu0YwVF5Y0BLK2wuh3QGwVT3g1EGfsGrgNDHz/OxwL1gYDETzjuFXg
	okEJd13QPorbs8sakOgTZhYMh1oYWu4bDrdKdjxhUUFkOgxPoPFlUIu8nxRMkcxmybfdN/l5o1G
	DyDiglW2zhOnzHDqDp+ujqC+gqTmNZA==
X-Google-Smtp-Source: AGHT+IGn2LgBs2yex9tIGVC3iLMPXfyPJaVlVRd3l8fM1ttdeZBaD4evEdmr/giLKzkEKU6PoPpt9qwhxWpBy3fDDco=
X-Received: by 2002:a25:2e09:0:b0:de4:604c:41b0 with SMTP id
 3f1490d57ef6-df4e0bd4d14mr513108276.32.1716332577131; Tue, 21 May 2024
 16:02:57 -0700 (PDT)
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
 <CANnsUMF=ywvcmfLjXdz_hWLSo5jC2Z0K7Qe4Pcv7j3dr6K99Jg@mail.gmail.com>
 <a0890c99-0f42-44bb-b1f3-cdc66efdad50@app.fastmail.com> <CANnsUMGf744psJZCqKoKw4ysRuH4KjhTpjR1CZZNbPr2DPQ99g@mail.gmail.com>
 <0CF70E80-C650-469D-B52D-436EC16BCBE3@elite.uk.com>
In-Reply-To: <0CF70E80-C650-469D-B52D-436EC16BCBE3@elite.uk.com>
From: Chris Maness <christopher.maness@gmail.com>
Date: Tue, 21 May 2024 16:02:45 -0700
Message-ID: <CANnsUMEUnWLnRgJv-xQeP184TTKmMS0-mnKXp+uEgoj4cf_E8w@mail.gmail.com>
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Mike Quin <mike@elite.uk.com>
Cc: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My test bed is Slackware-current because it has the latest kernel
source built right in.  So I have to use either VE7FET's userspace, or
the stock Linux-hams stuff as Slackware does not have a repository per
se.  It is just all lumped together with no package dependency
checking.  This is good and bad for somethings, but turns out to make
it really easy to test sock code -- because it is all just the way it
was written with very little system specific patches.  The kernel code
has absolutely no distro specific modifications.

So whatever aps come ax25-tools and ax25-apps is all I have.

-Chris KQ6UP

On Tue, May 21, 2024 at 12:31=E2=80=AFPM Mike Quin <mike@elite.uk.com> wrot=
e:
>
>
>
> > On 21 May 2024, at 13:03, Chris Maness <christopher.maness@gmail.com> w=
rote:
> >
> > netrom_call has not worked for ages.  I am using VE7FET's forked
> > userspace, not the official.  I could build another
> > system with the official userspace I suppose.  My understanding is
> > that VE7FET fixed some bugs, and I have had
> > better luck with it for the most part.
>
> I=E2=80=99ve found axcall (as opposed to ax25_call, netrom_call etc) as s=
hipped by Debian works fine for making netrom connections.
>
> To echo other comments in the thread, thanks to the folks working on this=
. I=E2=80=99m one of a number of amateurs who=E2=80=99ve taken a recent int=
erest in packet and I=E2=80=99ve love to make more use of Linux for it.
>
>


--=20
Thanks,
Chris Maness

