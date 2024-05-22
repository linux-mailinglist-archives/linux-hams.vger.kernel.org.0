Return-Path: <linux-hams+bounces-306-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F27C8CC666
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 20:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E03DB2104A
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 18:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228CE145FF1;
	Wed, 22 May 2024 18:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBXfWWYC"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BDF145FE4
	for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 18:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716403066; cv=none; b=dmu2Q55wci0PO4s+VBsOmi+pg5dLw3I8cVFB7MLYjJLXWKJh8K38FP7cjpHnqa+EEsX7FHDF1WOL5ZUHVn8EibsjUSA5GHJz9sja71KzVYT37f3+6nZxXsAVyqy9HIIA5dsEvxFFRfg0D+OyJ0MGfkyO+SVc6aJyyV+QhlKfYLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716403066; c=relaxed/simple;
	bh=+SS6AHCXsYdzhVmg8dV2j4Fw+ybEGvjoP7zTguYW6s0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUfE2DkzAeT2HgV8UBAbv+Bijfh/bLT/YfacCeOPCpAEwdzXxHThT5uiK2q0NuhcYwC67qtiLyOXRHIGWGA4edGiBNnwJsuY3FFYOgIoZh6EUNe6RXS6m+4/DRl+qO4//MbPQuK8gs61jPAejU5q6u24y3CcpA6svmNeS4PxJSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBXfWWYC; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e576057c2bso101074491fa.1
        for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 11:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716403063; x=1717007863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhbRgLx9IrgwEg+PqjRPdiloKx7aLrflDqDVYIl0oDo=;
        b=jBXfWWYCCvVEtc2dLR7CQ795zzg1dSsBrQk6/8twSHqWUHfkSdVCX2hN+DcZuW660+
         nyJSEyR4Dc36GjUOpQK3fmVuquX8Ig6VsKv7/8SyMNg6qmzEMkYdL9PYLZ1Dhb609tdx
         RvkUUzcNYYPK16JA6/nZK1rf7LNgb5TUbn23A0sujthiYoCP59Q3sdKiF9in7NtsrMa2
         N8MWTxHmERQOTQyYyL/HpSLovU8rLFpK8E6iq7ynYEjSelkzq5hXHLnf46hp+2LnilZT
         bLxU7lv1Qpp57ybD5ib8qUcJmTNtrfUF8IxpRQavDuzO77CbFkWYCLik0t+tyQdheKhK
         8KBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716403063; x=1717007863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhbRgLx9IrgwEg+PqjRPdiloKx7aLrflDqDVYIl0oDo=;
        b=JKSS695Y7pl0td342+PPI0iQTVdUexo5PJ0XUYZmR2DSaqXZlCfZberKtPdTaYZV1+
         os+TDMV31v+DmtXDCMjT1FCRL00+5uUPojbWWRvdCtdbCwsbQekV4N1l5y8/hX9UfHuy
         XQOzbPZYpQNexE+elhdo8Zy1/LL/3rX3MpT4Rh1fGKGbnFkwmVTbxQPMUOEBsoeoilEn
         U3TfcWCNvY+sAoKEYQoy+ehazKoKD60UUF7k2aqcGB9JpG3S5QSbMuxe38jRWkJlRhZN
         UZB3rSzYaNnJqWYGihyF6emG3Cx+m4zk6V7VMFTuciBxOYtB2rJVON82rUtGAb73XbqJ
         +w8g==
X-Forwarded-Encrypted: i=1; AJvYcCVPMJ+ownhzHZuMxv8cVPE3wrU2nXgFta8xkpX/QMkYjNHQuqRKrm4T9yMI8D/06xbn+AuAAKT/9UZvZVA4SQJRXRin7pDp0e2v7g==
X-Gm-Message-State: AOJu0YytAyMOaRtmFpb2robz12PoNPzSwxTd+KDrmnBcr4OtiKEDyA3x
	F+hg2Y9UKaLtrNPmMJSTtDriVM1lzIwR5Y9tAz6A/GLN1NT6gnG9a9lH4O33JbuCoyOh3jaSblG
	/xEZEwgZNbEsGp677ThNRz9BCrIS6pg==
X-Google-Smtp-Source: AGHT+IFxbkr+hsBo7aSw/gmr3ohVxx2nn0kb9uLDPOke2gAE67U7uSSBmDJ6hLjXaaOMaX8330j0q+rOE0jX0nKRs7w=
X-Received: by 2002:a2e:8803:0:b0:2e3:6e32:7a26 with SMTP id
 38308e7fff4ca-2e949563aa9mr21972691fa.45.1716403063175; Wed, 22 May 2024
 11:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn> <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
 <f27710b7-253c-79ce-e214-2b8251aceead@trinnet.net> <c3infeyajl4hr2tuyfmmccdv4gjbhsulaxuetozigqwqtj4jga@42eucxtsfk2y>
 <CAEoi9W5cmv-mQAsKPYTfjAytfp9Mvf3WgRQ9Ni=sznrU0v+NDQ@mail.gmail.com> <v6ybd4paw7eossjr2qiqvi5zqmvub7avy4cxpd6oyhfattia6j@ygablb7u2rpr>
In-Reply-To: <v6ybd4paw7eossjr2qiqvi5zqmvub7avy4cxpd6oyhfattia6j@ygablb7u2rpr>
From: Dan Cross <crossd@gmail.com>
Date: Wed, 22 May 2024 14:37:06 -0400
Message-ID: <CAEoi9W7VJhnSMD=YJX-92Lmxo+y6if_rFCAPrJiwJ8iuxz_7Bw@mail.gmail.com>
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: David Ranch <linux-hams@trinnet.net>, Chris Maness <christopher.maness@gmail.com>, 
	Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 2:17=E2=80=AFPM Lars Kellogg-Stedman <lars@oddbit.c=
om> wrote:
> On Wed, May 22, 2024 at 11:32:21AM GMT, Dan Cross wrote:
> > My personal belief is that the best way forward is to rip AX.25,
> > NETROM, and Rose out of the kernel and go with a pure user-space
> > implementation.
>
> I'm generally in favor of this idea, as long as we sequence things so
> that we have a stable, functioning userspace before ax.25 support is
> dropped from the kernel (and that we're able to maintain compatability
> -- as much as possible -- with the existing tools).

Absolutely. It may be the case that the stack is never actually
removed from the kernel, or is removed at some point far in the
future. In any event, I'd hoped it would go without saying that
nothing would be proposed for removal until there was an alternative
that worked at least as well readily available.

Again, I want to stress: nothing would be taken away, either in terms
of functionality or compatibility with existing programs. But there's
nothing magical about AX.25 being in the kernel; if anything, it's far
more constrained as a result.

> Dan, are you volunteering to spearhead this effort? I'm happy to help
> out, but I don't think I should be driving; I don't have enough
> familiarity with the protocols involved.

I'm happy to take a swing at starting to see what's involved from
(metaphorically) pulling the engine from the car and getting it
sitting on a stand with a bunch of tubes and wires hanging out. I'll
be blunt: my time is limited, but this _is_ something I'd like to see
happen. Maybe the best way to proceed is an informal PoC that amounts
to, "look, here's a git repo and a Makefile that'll generate a bunch
of unlinkable object files, but compiled entirely out of tree and in
userspace."

        - Dan C.

