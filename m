Return-Path: <linux-hams+bounces-375-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BE2916D16
	for <lists+linux-hams@lfdr.de>; Tue, 25 Jun 2024 17:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5991FB27E17
	for <lists+linux-hams@lfdr.de>; Tue, 25 Jun 2024 15:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787C116FF3D;
	Tue, 25 Jun 2024 15:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdnWCFj3"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890E516FF36
	for <linux-hams@vger.kernel.org>; Tue, 25 Jun 2024 15:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719329374; cv=none; b=iNhoes8K8paEzgjmgJ4jGMkn/lHBXviCRaUQQ1DnqTcD7QYKO7qHw/GDe+PYFofQhqgWiQBGgkX6fvsAPU1PBsXM7lGUwmZeHpe9RCQnt9nZB3ogdILF2n5xZwCtStlitrPKxvRNum53F+pHZMJpoUtiD4F3lY30Vyf7ufDTYVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719329374; c=relaxed/simple;
	bh=RkwVWlj8Lh8b00GUIa49O4hABAs/caMkh0Q9L7j6lPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EyENoa1Yg7ELeMUQv8M3gxzkgNR3D/j37jd/7NmRY5L579E796Byd+8MpSEH/hRjKrvSw44b/QKQfq28VTZuR8CU46vWuDwJdEhT9jvLJTpUpWpXTtQPOf3IaqTNpSMN7w4fw7SnY9h0CmJFatPzyUaYykh+fDi62uGq3C6NywY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdnWCFj3; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ebeefb9a6eso64872311fa.1
        for <linux-hams@vger.kernel.org>; Tue, 25 Jun 2024 08:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719329370; x=1719934170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMLO+RptLcQB8PHqNg9dYTh84W1kQBGDitIdoSf1TII=;
        b=AdnWCFj3tSZhM8A8hTrn8/Jstwq4xYdbs9wfpJPIkKnmxMjNQvpjLd2/XQzu8+vJyf
         o6iSfwPHL7p3H/S/Ybz1djQjklnG7KR5Zr8ulc7gaOy798172Dxi++JxNH/AZtQxBIAv
         j/na1qR1f612CkRVt+4uR0fJ/r6YFLrHhMtGZeKda/i88QzVWDvsWvJp+ezQX/Ft44KD
         hso+h+ryjdiuTC7ZyXbM+3N5MRMrsBmofsOSQGgnVfxCp2Wyvw9pxWwsMEaLlqatogoZ
         GwngC6aT1i/z/3z/pW19gZvnRgFW5O4lFZSdFzQ4fvOOaytO9Rbk6RXOrV0PFq1h81fe
         R1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719329370; x=1719934170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMLO+RptLcQB8PHqNg9dYTh84W1kQBGDitIdoSf1TII=;
        b=U/ng0Gk8HWVOgX6adVK4ACZE18uy2MPVTnh9rdAvQt8BgDWfB1OxgJbo9jVcqDo2DK
         kvb4cIgjg0Fm5s/gwLSUCReSCGgM3onZVLNWE6yTMvq2meja679k1mZ2Q9ewGYNSFr7B
         WiEHKxotoAgjyctVRcBG4xGlBg1EoQ3dzxEHdBo0wsWQwiE906R4t5hWHSw4U6uHqfhD
         Ug1CzOps2JYCcTz+sBIqqqBcOU/Ae5Q8w1+E7elx2ZQbDaZh7fR0a04wXhpl9OlRnnzK
         ebg8z6xSG3wHGWvmL60PaHnQIkJYpScGyC7NirWMBGoU7nNkv/CqlyHGubnm9OpkyYC2
         s/bw==
X-Forwarded-Encrypted: i=1; AJvYcCV4/J9cN99qg/+Oi/Km5TELmz1/bdWlwLLsIOQSqv8+GlACvME7BAJYshT+01T85pFa83WIAnMVPUEItMsr2QFxYVyPXdFUskqyow==
X-Gm-Message-State: AOJu0Ywm6ZLnsbnu0/R2Q3wM+4OQ41UkW8copGLjozaRgN7cVQcfiZDk
	hmusD101OpRSJ/e0JKP9Y4PKosQL4wZDvvBFc060ZxbQHfeTgTmIIfWBiItsDERwwK9B4AVwrdJ
	fV69FHGoN5MxnVBNGvjnJUv8vd4tUgw==
X-Google-Smtp-Source: AGHT+IHjUICwvSdPqZ7PtGVm3m50RPyoiuiE8W5g2t23i0RXkQ5kgLGIvp68Z+/LCgRVr2JCxTiTOD+VpWR6FLdrZuE=
X-Received: by 2002:a2e:9dd8:0:b0:2ec:4fc3:a8c8 with SMTP id
 38308e7fff4ca-2ec59312e0fmr54139861fa.0.1719329369265; Tue, 25 Jun 2024
 08:29:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ai6stmqygczrav7dtojrxliexav24wi5qn324opvtgzengwb4a@jdbhx3lnaevu>
In-Reply-To: <ai6stmqygczrav7dtojrxliexav24wi5qn324opvtgzengwb4a@jdbhx3lnaevu>
From: Dan Cross <crossd@gmail.com>
Date: Tue, 25 Jun 2024 11:28:52 -0400
Message-ID: <CAEoi9W7YEkhYnNTmrG=NSuZLQhEXxqYid_J_BB5Wgn6gqoF=1A@mail.gmail.com>
Subject: Re: remote login(1) (telnetd; innetgr(3))
To: Alejandro Colomar <alx@kernel.org>
Cc: Joerg Reuter DL1BKE <jreuter@poboxes.com>, linux-hams@vger.kernel.org, 
	Chris Hofstaedtler <zeha@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 4:09=E2=80=AFAM Alejandro Colomar <alx@kernel.org> =
wrote:
> We were discussing the possibility of removing support for remote login
> in shadow utils' login(1) via telnetd or similar; that is, remove the
> '-h' flag.
>
> <https://github.com/shadow-maint/shadow/pull/1022>
>
> And then Chris reported that ax25-tools uses that flag.
>
> <https://sources.debian.org/src/ax25-tools/0.0.10-rc5+git20230513+d3e6d4f=
-2/ax25/axspawn.c/?hl=3D64#L1837>
>
> Do you know if that code is actively used or if it's something from the
> past?  Would it be possible to switch to something secure like SSH, or
> is that not viable in the systems you use?

Variations of it are actively used. See, for example,
https://kz2x.radio/posts/complex/

However, looking at the linked code you pointed to, it appears that
the `-h` flag is only used to insert the _protocol_ a user uses to
connect with into the `ut_host` field of the utmp file; one of the
empty string, "AX.25", "NET/ROM" or "Rose". Presumably this is so that
if one runs `w` or `who` or `finger` or `last` something on a host
that a user has logged into using `axspawn`, one would know what
protocol they used. It's subjective, but I don't know how valuable
that information is; I suspect not very, given what's already a pretty
niche case.

More to the point, one could remove the lines from `axspawn` that add
the `-h` option and its argument to `login` and `axspawn` would
continue to work for its intended purpose; just a small bit of
information would no longer be present about the connection itself.
For that matter, nothing prevents `axspawn` from logging that
information via other means (syslog, for instance).

Something like `ssh` won't work in this case, I'm afraid, but not only
for the reason already listed about regulatory restrictions on
encryption in the amateur radio service. Rather, `axspawn` is designed
for use with one of the connected-mode amateur-specific protocols, not
TCP/IP: though AX.25 is technically a link-layer protocol, it is based
on X.25, which predates the OSI model and its categorization as layer
2 is a bit of an approximation. In particular, it contains a
semi-reliable "connected" mode that can be used for "keyboard to
keyboard" communication, and that's the sort of thing that `axspawn`
uses. NET/ROM and Rose are both protocols layered on top of AX.25 that
provide something closer to what we'd recognize as a combination of
network- and transport-layer protocols. Anyway, to my knowledge, no
one has produced a version of `ssh` that can use AX.25 addresses, or
any protocol other than TCP/IP.

        - Dan C.

