Return-Path: <linux-hams+bounces-377-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B5A916F4E
	for <lists+linux-hams@lfdr.de>; Tue, 25 Jun 2024 19:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51BB61C23013
	for <lists+linux-hams@lfdr.de>; Tue, 25 Jun 2024 17:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F22A17BB1A;
	Tue, 25 Jun 2024 17:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrynzdoA"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528D4179972
	for <linux-hams@vger.kernel.org>; Tue, 25 Jun 2024 17:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719336734; cv=none; b=Y5gdVZD++jEwfmCjOFgv3CGzSvJwEbTrWXnS3/iRTwkGO6fcfDe7SxGJ8QevaRyUt4SSXnYrKPL9aaiINVrnIutpwmUYLJKRP9yvnSLHfMwX59hPWgaP1TrCG1fl1ZOU5o1MZ2eC4dour2tk2MEmSnevFQGG7nmsEtp1iEkGTMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719336734; c=relaxed/simple;
	bh=w4L1QqmJ+vXq1To1N0cU0ACevgYvqR4UXWnAoINZcD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pm30wLf+IXQ9ldWJlvnGSnSP3HET5G/EN74HmoIwPKXfHcrGh96lDvb9BO43maaxtdFTFwGTZIoPFUSr1RhE2jzYhqvYdJK5rmi+XZwEGbmbZBCRR3doVQ9ZYdC9gzcnxtnhtVdm307UgpvpVRK5iRwhw7dYjo12KM+2zZRC04Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrynzdoA; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso87240261fa.1
        for <linux-hams@vger.kernel.org>; Tue, 25 Jun 2024 10:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719336730; x=1719941530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXL5Pb8X/wXegEhI46mu8v5XdFJbQz2QC6iZj2j2Oaw=;
        b=RrynzdoAuNtVuToH2U7Qv6aTUv3STLGiX46+1a0ECJcN2WUXhPZXJGoyu4cHvBO/rI
         uEdO8+h/3USUBBlqfoL+sJPBwfHlMvN9p4BWFF/AChZQWbTbHbwyMPSxcfFVEIO/g1zo
         sLh/jN+fMDzfIHNrWtUtZ4Os+G2Z7eV77VW9yAtK0vMM0IVQkVJE7QaYQHyiktVb+Z3z
         Rb717Z/E9XfUrBpjWmofPGMJm8DbBCiIQJ4BjkRwWbduT9W0/zEoQuXHaKp438yDHGf8
         TBdi0RsvbTHPWA6nbH1kWvZph+YHOy7cQLEtXFaogNQq9VZvqreELLpFa0ml8ZbquXo4
         E2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719336730; x=1719941530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXL5Pb8X/wXegEhI46mu8v5XdFJbQz2QC6iZj2j2Oaw=;
        b=VEszR37i2DKaUcQtCAOl2aODozZXkVFQlLZ1gy7t9Cc+qUN/Lz7cR69AqV/KTrIJAa
         b0Ieeom61ryjJT1G7Sp5wCHhzvQrwdq07ZBOvUwI7WKCZMCQvvV8y6i57aWRwyNwv8UD
         KL5v36ifnLGiHXKKyvr/0QVpHjK52wTG8o0QhoVGpNStnhoSnSYEvySmeaQZ0VRfmSZ0
         YhDdOgFo5k1ZmJA8Uf9DlKSwtF5qHsfLvnVhP+1dbeZEfNsq0w79HyMFbqu/F6R0gq4Q
         ZUfIpXYta+zjhWvavN7Z1VJgngf+YFEBzV3FpRmsncaiodwLjMUkfSKwTf0MqdyBDgQA
         xpSA==
X-Forwarded-Encrypted: i=1; AJvYcCUDWmDSumx1BphurEtUc/Gzw/WNxI8MFXPE4NxcjRqpIIHLkgC0OSK2krupd1VF9S+IfbKD5wXfe/Hz66z3TMq0LZ1HEr+atDHnRg==
X-Gm-Message-State: AOJu0YyaRXvgquzcUoFJE6+EnW7d3WYchhndLJNj7LVFjeXUjEF3Ox/y
	/kKFPFkYWSLoaUiSG+zSjQz7TA+ijR6DvSLUWcOG1+E9gq5jsnMvmdR19tGa45dTtPXftM4CMiO
	Zp5O5LO/GNpF6OJ5VSaPgSlfJ4kw=
X-Google-Smtp-Source: AGHT+IG//FN1GnrxtjkG2f+SQzY353bCYFfiPWaURGjmfZFvqWRKWMaqWMNSxkue6bz4pjGS4lRhJ/+HDYwhKeivYeY=
X-Received: by 2002:a2e:bb81:0:b0:2ec:5d83:32d8 with SMTP id
 38308e7fff4ca-2ec5d833305mr51895701fa.23.1719336730202; Tue, 25 Jun 2024
 10:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ai6stmqygczrav7dtojrxliexav24wi5qn324opvtgzengwb4a@jdbhx3lnaevu>
 <CAEoi9W7YEkhYnNTmrG=NSuZLQhEXxqYid_J_BB5Wgn6gqoF=1A@mail.gmail.com> <xyilquq3zxmrnbjgxgtxtbxdngxswhpxyd6t3aas4psm4zuy6j@xzvr3h3bsvue>
In-Reply-To: <xyilquq3zxmrnbjgxgtxtbxdngxswhpxyd6t3aas4psm4zuy6j@xzvr3h3bsvue>
From: Dan Cross <crossd@gmail.com>
Date: Tue, 25 Jun 2024 13:31:33 -0400
Message-ID: <CAEoi9W6C4h-9StNJXQqv615xc9smM1rNGd6wALE=1ck4630tLA@mail.gmail.com>
Subject: Re: remote login(1) (telnetd; innetgr(3))
To: Alejandro Colomar <alx@kernel.org>
Cc: Joerg Reuter DL1BKE <jreuter@poboxes.com>, linux-hams@vger.kernel.org, 
	Chris Hofstaedtler <zeha@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 11:39=E2=80=AFAM Alejandro Colomar <alx@kernel.org>=
 wrote:
> On Tue, Jun 25, 2024 at 11:28:52AM GMT, Dan Cross wrote:
> > On Tue, Jun 25, 2024 at 4:09=E2=80=AFAM Alejandro Colomar <alx@kernel.o=
rg> wrote:
> > > We were discussing the possibility of removing support for remote log=
in
> > > in shadow utils' login(1) via telnetd or similar; that is, remove the
> > > '-h' flag.
> > >
> > > <https://github.com/shadow-maint/shadow/pull/1022>
> > >
> > > And then Chris reported that ax25-tools uses that flag.
> > >
> > > <https://sources.debian.org/src/ax25-tools/0.0.10-rc5+git20230513+d3e=
6d4f-2/ax25/axspawn.c/?hl=3D64#L1837>
> > >
> > > Do you know if that code is actively used or if it's something from t=
he
> > > past?  Would it be possible to switch to something secure like SSH, o=
r
> > > is that not viable in the systems you use?
> >
> > Variations of it are actively used. See, for example,
> > https://kz2x.radio/posts/complex/
> >
> > However, looking at the linked code you pointed to, it appears that
> > the `-h` flag is only used to insert the _protocol_ a user uses to
> > connect with into the `ut_host` field of the utmp file; one of the
> > empty string, "AX.25", "NET/ROM" or "Rose". Presumably this is so that
> > if one runs `w` or `who` or `finger` or `last` something on a host
> > that a user has logged into using `axspawn`, one would know what
> > protocol they used. It's subjective, but I don't know how valuable
> > that information is; I suspect not very, given what's already a pretty
> > niche case.
> >
> > More to the point, one could remove the lines from `axspawn` that add
> > the `-h` option and its argument to `login` and `axspawn` would
> > continue to work for its intended purpose; just a small bit of
> > information would no longer be present about the connection itself.
> > For that matter, nothing prevents `axspawn` from logging that
> > information via other means (syslog, for instance).
>
> Hmmm.  Thanks!  Would you mind reviewing the patches here:
> <https://github.com/shadow-maint/shadow/pull/1022> to make sure I can do
> it without breaking anything for you.

Sure! I put some comments on that review. It won't affect me at all.

> If there's any chance we can break stuff, just let me know and I'll drop
> my patches.

Well, I can't speak to other folks, who are using the unmodified
`axspawn` (assuming such people exist), but as far as I'm concerned,
you're fine.

`axspawn.c` should probably be updated to remove reference to the `-h`
flag when it invokes `login`, but that's outside of the scope of your
change.

        - Dan C.

