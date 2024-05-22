Return-Path: <linux-hams+bounces-304-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB0C8CC602
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 20:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECEAFB21C79
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 18:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C83145B36;
	Wed, 22 May 2024 18:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wgv5vznE"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A41145FF6
	for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 18:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716401116; cv=none; b=IY8nG9QoItazyWGuAnMsHQZm48ODGGu+/TOz9PzML1bTm9Rt4IYqKGCbMaRxkAS7oBSg58j8yPTMqI5djKkxewJ9UcoFJozjaS0hQlZyuYYmvE56ejVi/55oR8JEBD3oFdtHYWofGKTSU6yrO/qn9MeAWznHe5+DtHXjm3H8ynE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716401116; c=relaxed/simple;
	bh=BD+HHCj0IeR9mxMcod1mm+SNq9ZKpnc+K+fwZEqUtBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcoSmytKRAvg4UAyzz0v0mFA4MziJaBouk66zJRFWMqZSd8oaNZ7iMa9n+iLGjc8HpETGR+hBU54trO/kz7QhJh5xdnlek16jyx2KZPV/mZ9nIEgOMBKfDLhVQ8o7F7+SIOrVGqP4BWA2ZjJT7AtKAM59E3tho4sRsCXGrEW+SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wgv5vznE; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e3fa13f018so67824881fa.3
        for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 11:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716401113; x=1717005913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zar/IF6d64YuAb+CrBYX/TegFBx3C+zNvo08qrevafw=;
        b=Wgv5vznEfqe8F6DG0RZMqXbdYhWWT5tqlzAvt8HYlr51y8PHPYe4J38Pk+VtGmVIKR
         lCorXWqcWqu7JdnNci/wapYZiKPK+9QhyYQnjwBR9JSlYyoIIZj+/FORUhzDOnwXktzX
         ukohOBp6XvDYAsdl/pby7yCHriRAlOkySaRbBjFwv6SWjuJujjuJEfB6ghIGlnoIWSkg
         /fFkqvkmzNqFUyDuWJnbvxeSI/qAa/7lbjbGyZ0vOr/uWbmw6TmozZWVBtrHKtbLy1e6
         XJx//b3MjhrEpmoRLe820fUV6cITtHk0BZcpCaGT8neudzTuovmSKrnSkdAzsFFvVYKu
         0edQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716401113; x=1717005913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zar/IF6d64YuAb+CrBYX/TegFBx3C+zNvo08qrevafw=;
        b=uONFSHpAjPAYLiW1qfagKrCpfvavB+KzkjKwKR1VeOLOTRqjx+Cxm0lkj43hNXR+X/
         qnbPzMiL10kN2RKbeHJaRMKFFDYicThIlDJs8GqcDz04UQ9gycpVsq1dHEjbl20V8omY
         zK98e6lz+mbXddlRqVkcuf9dFMNujcttK5Y7KSGP1L2yXbfnR6u3Q6ZHdyV3GZgkj7N0
         7ZA+du87+tcLK1k1xrFQur7POBbSUbd93JaWd4Tt3L8irrhIdhVzoJq8Lqm/2eHs2rEK
         jJ3c9VbXgAEP4HPTSKOiGi6N4+yntmptkuKbXZ9Ma8KT91MR6BGSRF4hrQq5SclZnzlE
         QdBg==
X-Forwarded-Encrypted: i=1; AJvYcCXI5ZHgmMd2klkOpfqJI53IXmwKXUVhJnIod68WHnQFkfH604RpV20zxDeXkcHGJ9FdD52d/6d+UosfMTJEgpT/6oUkkr1nBhPjUA==
X-Gm-Message-State: AOJu0YwznKaNgK10zlx4MgNe0Bzyoz7cpJbI0OVU6k1TC9XpDE0fVuc9
	qKHj7zUXC9SolwvOf1RnQ1DfVPo3mLk1LxURqFmCF8f+NTpyYbDvP2qqoT0P76cEpH/zakzKY6y
	zgzWA/ovIpKBccLDoo13JErYcg7g=
X-Google-Smtp-Source: AGHT+IHGii6VTc8GeK+1FGG7+nUL2nvzyVvldUdNm/uGSIfMoypp7yNCRGyKvw+LqEzKBqZLwAj6K4wlbM994uXY18M=
X-Received: by 2002:a2e:3e0e:0:b0:2e6:b36e:434 with SMTP id
 38308e7fff4ca-2e9494f7861mr18190951fa.31.1716401112851; Wed, 22 May 2024
 11:05:12 -0700 (PDT)
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
 <f27710b7-253c-79ce-e214-2b8251aceead@trinnet.net> <c3infeyajl4hr2tuyfmmccdv4gjbhsulaxuetozigqwqtj4jga@42eucxtsfk2y>
 <CAEoi9W5cmv-mQAsKPYTfjAytfp9Mvf3WgRQ9Ni=sznrU0v+NDQ@mail.gmail.com>
 <CANnsUMG42uECBVKFAPrwprakAGd=+KPE-WOAgS47nzKjWKawuw@mail.gmail.com> <aaf87a7e-af08-4544-8c33-0e71396909cf@trinnet.net>
In-Reply-To: <aaf87a7e-af08-4544-8c33-0e71396909cf@trinnet.net>
From: Dan Cross <crossd@gmail.com>
Date: Wed, 22 May 2024 14:04:36 -0400
Message-ID: <CAEoi9W5QOg-qq_rM=nO3e9xONR6zrvKaCKPSikgbauxBvCCH_Q@mail.gmail.com>
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: David Ranch <linux-hams@trinnet.net>
Cc: Chris Maness <christopher.maness@gmail.com>, Lars Kellogg-Stedman <lars@oddbit.com>, 
	Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 1:06=E2=80=AFPM David Ranch <linux-hams@trinnet.net=
> wrote:
> > I think in doing this you will orphan a lot of important software that
> > relies on the kernel space ax.25 stack.
>
> I agree with Dan's idea that moving the Linux AX.25 stack out from
> kernel space could help on the maintenance side but it would absolutely
> neuter things when it comes to all the rich packet routing options that
> the kernel offers today.

I wonder why, and in what way? It's not clear to me that the kernel
has any particular advantage for routing AX.25/netrom/rose packets
over a userspace program. What does it currently do that could not be
duplicated, or would be exceptionally difficult to duplicate,
elsewhere?

Indeed, I would think that a packet router of some kind would be an
essential feature.

> One thing that could be considered is an alternative libax25 library
> that could redirect ax25/netrom/rose packet I/O from going to the kernel
> and instead, send that traffic to a userland program.  Maybe that could
> be Direwolf or QtSoundmodem, etc.  I think this could work for most of
> standard (more simplistic) packet radio use cases.  I've mentioned this
> idea some time ago to both Thomas Osterried DL9SAU who is the maintainer
> of the "Official" AX.25 userland tools as well as Lee Woldanski VE7FET
> who maintains a fork of the AX.25 userland tools but there never has
> been much interest.
>
> Maybe someone here on this list might be interested in taking a stab at
> it?  I don't have the programming chops to write the code but I could
> absolutely help on many other aspects (integration, testing, etc) if need=
ed.
>
> --David
> KI6ZHD

