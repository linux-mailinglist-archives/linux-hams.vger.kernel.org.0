Return-Path: <linux-hams+bounces-49-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEF0873486
	for <lists+linux-hams@lfdr.de>; Wed,  6 Mar 2024 11:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C42C28543B
	for <lists+linux-hams@lfdr.de>; Wed,  6 Mar 2024 10:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F04605A8;
	Wed,  6 Mar 2024 10:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lihvn/1/"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C301E520
	for <linux-hams@vger.kernel.org>; Wed,  6 Mar 2024 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709721714; cv=none; b=GjaRITfX0yCn4T2507e16ZG/xqvlHolQdiT3MXb+WSb1g8q1ZfQshm2ROcByCFxvBCDWRAaDYJEAky1o/bmxNPyaSdSd+PWHgBoSsilDWE3N/DdmNu7nViHB/mWG4Ff3dcd7tG+2T/rg4wvMzdh+JwnPRtqTZmo0wmYSVOVTTuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709721714; c=relaxed/simple;
	bh=kCwidvlR/A9CZ3q+xHAYLCMO3jQlBiTdIei1p1YIerU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ps0WWJx9xOHXCWUl32gsi6rQgF8xw4lC4Z2zmIZojgYCkEy8uLcHH4f/A9/vTEExnyfZMzrs2wUDW4Zccx232x9Lfakcv02Ua2UqsQ403F2+/rfKHK8RZe7i8ublXDMWg0yqv31/CUwTFrQt3Gjj5++nMjVDj1s8hJFSjqy5P0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lihvn/1/; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-566b160f6eeso7788a12.1
        for <linux-hams@vger.kernel.org>; Wed, 06 Mar 2024 02:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709721711; x=1710326511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ac6YIjBtpRzsjYOfKs4hkAM2nX9AEZlTxzGX/yk4mrs=;
        b=Lihvn/1/JEvvXKojUB0fIfZDbzvjdKfl837FTVMgGH5vFRFC31/LlEM04hBfxrH/7C
         qlMNi6EnTx/JNJAnmW58f8RoGGHHALz9aVd8hn3w0FShlSj5UpkW6prA8qJXX8YizH+Z
         NGS9vOBsCNVOUSYU3R0lsfeWf65lR9RiCugzT6xK6swXlct6ws/6ZQVKOypMrZA02hbO
         B63hIEJIaeHpx9YaqH6eidnQg/SX7w94Qr4MwGJUb2XyVm3Hbcyjq26PS57jDnHxge9m
         UEE/Hqw8mlo5WuX6ZnakaF0guGWCZqAayoJvhSQfivH0rqhFsOI9FvGLI8yywr7imh+x
         KkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709721711; x=1710326511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ac6YIjBtpRzsjYOfKs4hkAM2nX9AEZlTxzGX/yk4mrs=;
        b=mUNvXPfsgAUzBVizoPls5Ug93L82RL5TXu/pJACtfjhR48IicfzNdfFS22vuwm1a0e
         fBOB1yr9zpShjOV26/z39hLYCwTVWYIMj1En/NPTf7Y/htdiaJ0oozb4Y9izzMEBFSjk
         ++Fzqx6e/AyVCrrhNTLQkftB01Qr/VKfZKDZiAKA6nr0WC/CIpbfxSwF3YpTyb71nqRP
         bfxlhHEt7EWe2s23z61r+45FuyAruHrOrknTtSgCAdv52kEqjMMtc6GxBOFys6wZ6Ydg
         H9JV+sMw7Pt9ubLZjlPELmiob8frjuqLv3PNQG7H3rfnOhqHO0Rf5GzdQIhTUjRZybCN
         CM5A==
X-Forwarded-Encrypted: i=1; AJvYcCVOCKXxILzRGjpEdc1RKUiCNyITLLLI7BXnuq326mQFDD1txr9UxvBACZruVfNtQ97BLGDLZJd9ezXvOEaGFJPnmFT8PDaktAWWCQ==
X-Gm-Message-State: AOJu0YzISghhFfnbgfrxKYhm7u6Dm08a7YLlFmYgi2OxsYeCkXSnsCqI
	wJEImcxsbm8/E1u1bVj9om7e6spaIDOTe81hef9VsS/v3HGTcoK66rZjmqbb+9+njNOKNAIHN+g
	QnhbkCGMqMDL0exO7e38GN21/7qtze3n8Sf+v
X-Google-Smtp-Source: AGHT+IHxXfepDQZyEoAvpk37Sh1LodNo2JflhaLnhu/OhexAMll7TyOInFoT7Ebs7fzQA8WjKmzaZ/Kf4cdkQ/H2Vh0=
X-Received: by 2002:a50:ef03:0:b0:566:b5f5:48cc with SMTP id
 m3-20020a50ef03000000b00566b5f548ccmr351403eds.5.1709721710584; Wed, 06 Mar
 2024 02:41:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABOYnLwtfAxS7WoMw-1_uxVe3EYajXRuzZfwaQEk0+7m6-B+ug@mail.gmail.com>
 <CANn89i+qLwyPLztPt6Mavjimyv0H_UihVVNfJXWLjcwrqOudTw@mail.gmail.com> <20240306103632.GC4420@breakpoint.cc>
In-Reply-To: <20240306103632.GC4420@breakpoint.cc>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 6 Mar 2024 11:41:39 +0100
Message-ID: <CANn89iLe0KGjbSim5Qxxr6o0AjJVs7-h79UvMMXKOgGKQUosiA@mail.gmail.com>
Subject: Re: KASAN: slab-use-after-free Read in ip_finish_output
To: Florian Westphal <fw@strlen.de>
Cc: xingwei lee <xrivendell7@gmail.com>, pabeni@redhat.com, davem@davemloft.net, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com, 
	samsun1006219@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 11:36=E2=80=AFAM Florian Westphal <fw@strlen.de> wro=
te:
>
> Eric Dumazet <edumazet@google.com> wrote:
> > On Wed, Mar 6, 2024 at 11:00=E2=80=AFAM xingwei lee <xrivendell7@gmail.=
com> wrote:
> > >
> > > Hello, I found a new bug titled "KASAN: slab-use-after-free Read in
> > > ip_finish_output=E2=80=9D or =E2=80=9CKASAN: slab-use-after-free in s=
k_to_full_sk" and
> > > confirmed it in the latest net and net-next branch. After my simple
> > > analysis, it may be related to the net/rose or AF_PACKET/PF_PACKET
> > > socket.
> >
> > I already had a syzbot report for this issue, thanks.
> >
> > Adding Florian to the discussion.
> > The issue is cause by ip defrag layer, which calls skb_orphan()
> > These were my notes, I had little time to work on it so far.
>
> > Calling ip_defrag() in output path is also implying skb_orphan(),
> > which is buggy because output path relies on sk not disappearing.
>
> Ugh.  Thanks for your annotations and notes, this is very helpful.
>
> ipvlan (and two spots in ip_output.c do):
>
>    err =3D ip_local_out(net, skb->sk, skb);
>
> so skb->sk gets propagated down to __ip_finish_output(), long
> after connrack defrag has called skb_orphan().
>
> No idea yet how to fix it,

My plan was to refine "inet: frag: Always orphan skbs inside
ip_defrag()" and only do the skb_orphan()
for skb added to a frag_list.

The head skb would keep a reference to the socket.

