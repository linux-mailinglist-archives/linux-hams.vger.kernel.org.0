Return-Path: <linux-hams+bounces-297-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0137E8CB64D
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 01:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73941B211C5
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 23:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD12149E1A;
	Tue, 21 May 2024 23:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yji9RmZE"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278C6149C7C
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 23:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716333438; cv=none; b=bpEIEnsuKJ4az83lde2RCF1BWKrpFky0Lk74O5iEXeEMofk00RJI+SRS+cGW9tJ+YQxX+pwzb+YOjsZga7wEjZOS+nzXkkHZqqWbToSBrqmx/PUJQIlK3ujB2r93Xq1kvRqBHT6jiA23rIFYNPRVBM8obk8E7qQdVKD8GqBEikU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716333438; c=relaxed/simple;
	bh=LQGqtnpX/Gxd12qbajlwfZ5avwmNgiRD/NEF/lNG1Ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dG9rz7LiPoAi26vGbyrLTBu9J+oRXvHZQ0ONQnYFIYsJZjD5aODQ7meNrdp/ZNW30vno/XMG+4iyfo0Ce8RXporsYabhlzpC35umREzItxw0y+lO9/VLgVQZPEuXdLbJ53ZUdQG2B/SF2UDtI9VhddwSBzRiFm4qnumumkbCgCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yji9RmZE; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-df4d60c59f7so241025276.3
        for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 16:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716333436; x=1716938236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9lyaST0cPn+DlhquHT/ybyLyFlt6kxFlV2BQc5lPvg=;
        b=Yji9RmZEjXQuUGL02a3zR0jSBmmDA0Vtgdsxew+/i5tBcogCDPtF20XxvXGq8q4PCV
         0eI0Z6YW1R2CxVWt0zBhIGhW9hM1cIJ6oWC+dQERtKJlTeEJ2LRTG+WnERCcLjBG11HJ
         0WGFof8LMzAEoW2ngz+FeRsClAyRJd+TNWwmHPW1yP6i+EKJkVoPpxQaybAnOxH49yGg
         g4JQitfRWZKAYB+9kf+IP/edyJS8TEs14KPYe9+Ne0vuSwAo4EE4J8R5N+u1hXa3xXkf
         2TzP0I/oqtvb9ESG+s4ijCbHSldbMKsopAYEb0yF474/fMhlMi049mffKtS7ebCcIlj4
         yo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716333436; x=1716938236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9lyaST0cPn+DlhquHT/ybyLyFlt6kxFlV2BQc5lPvg=;
        b=JuVfT290Gz9ib17D3AY5zpUwLdmLx1m01kiGRAk7rBTpAtKPhwV2pkZdN7jMxvmBbq
         Fr3/s5+/m1GvY6OCFKaOkEmoQ4B+Y6FqjQs4WbbC3PD6l61ELsy+Vw5OIj867Uq6jEp6
         /56U8BKlRiZLCw2Gxvyq9X4cqKDStKJ1EbxvhmzFOANlyI7IaeFnj2wMcjmpmZWpXNii
         as2yQha70gorxkkahizHnWLTXEBgJ0lFg3AK4ThhXXNc3o4Ar8yGkFbYGxRlH6w0iJzm
         CqpIdiUJlLBXgsna5oa7smXxS9ZxynVD1tn1QPV7Bc3UqBhNg/IGE55whw5bYbh1TkIm
         iuyw==
X-Gm-Message-State: AOJu0YwEWdknzPPeZLzsdcD40YoQP6Izc2Ot/mNWQzP/07kp1Zec9F6K
	dyuLLOFzl3gZpCZPoUhsotwyHQ0LrCDTafmX8ld6422k3RwBwOsMQDif8e4qN19F2hpaiqiZpux
	iIBBBvib6pzM9D2oAOWfqaSsUV5k=
X-Google-Smtp-Source: AGHT+IEYLbL4DY1a4GkCq6ruCnG0166I4daS0KfNdEBvPW2SimzfRqb11GIoE8dHRDq3JKfojE/MXhJ/SCpXYgl0nJM=
X-Received: by 2002:a25:6b07:0:b0:df4:d861:f55 with SMTP id
 3f1490d57ef6-df4e0df9fecmr523305276.56.1716333435643; Tue, 21 May 2024
 16:17:15 -0700 (PDT)
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
 <0CF70E80-C650-469D-B52D-436EC16BCBE3@elite.uk.com> <CANnsUMEUnWLnRgJv-xQeP184TTKmMS0-mnKXp+uEgoj4cf_E8w@mail.gmail.com>
 <D0567111-9B53-44C2-B6F9-195C33BE7ED9@elite.uk.com>
In-Reply-To: <D0567111-9B53-44C2-B6F9-195C33BE7ED9@elite.uk.com>
From: Chris Maness <christopher.maness@gmail.com>
Date: Tue, 21 May 2024 16:17:04 -0700
Message-ID: <CANnsUMGyXR4630Q5wW9q7TtYQO7HWKoDNK9aHT7mdNYW6hUYcQ@mail.gmail.com>
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Mike Quin <mike@elite.uk.com>
Cc: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah, I was not aware that it did NETROM connects too.  I have only used
it for vanilla AX.25.  And yes it works, so the issue must be in
UROnode.

-Chris KQ6UP

On Tue, May 21, 2024 at 4:07=E2=80=AFPM Mike Quin <mike@elite.uk.com> wrote=
:
>
>
>
> > On 22 May 2024, at 00:02, Chris Maness <christopher.maness@gmail.com> w=
rote:
> >
> > My test bed is Slackware-current because it has the latest kernel
> > source built right in.  So I have to use either VE7FET's userspace, or
> > the stock Linux-hams stuff as Slackware does not have a repository per
> > se.  It is just all lumped together with no package dependency
> > checking.  This is good and bad for somethings, but turns out to make
> > it really easy to test sock code -- because it is all just the way it
> > was written with very little system specific patches.  The kernel code
> > has absolutely no distro specific modifications.
> >
> > So whatever aps come ax25-tools and ax25-apps is all I have.
>
> Looks like it=E2=80=99s just called =E2=80=98call=E2=80=99 int the origin=
al ax25-apps.
>


--=20
Thanks,
Chris Maness

