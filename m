Return-Path: <linux-hams+bounces-303-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 242F58CC5EA
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 19:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2A8A281F4F
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 17:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0F81419BA;
	Wed, 22 May 2024 17:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hu5AC4Ah"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD8F57C8E
	for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 17:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716400537; cv=none; b=gc9P9rX9dKbe34z38KvDYbXotw6KnouVQbtRuS97saZXyYmbDaPQoIPkS3Og/N7+GcGh9a0DNHCMnAZXSXWtPTh98+ysG3vuzuGaadTIdGi1WGR2gKddREtLb2ngTv3fd125IOyCby4f0+G2Pykm0Aw2sryBUvf97y4TVeMfnUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716400537; c=relaxed/simple;
	bh=dDW0tW1kFO/++Tv3K1ECx3MxrBc+OaSdgSwk5OtdjQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GoEcedRou25ci/VLJSKADbKB00+IhuNj1WMqHI50hE9gWBMx7OAQ5RGjolWr6OmazN2/NZPC/CIjkhiHkdQaktkRo/66Kv7+BVGudhxjyys3enbXBh4vvf8fqjB12vEyc7LK5LZt+dY6Mklr/kmGNvu63vBczaPjj8aCOhyyZ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hu5AC4Ah; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e576057c06so64497141fa.0
        for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 10:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716400533; x=1717005333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUbh9N0CgOzVQjoQWBGWyLsz54gKjYY/MoX2eZT8GrA=;
        b=hu5AC4Ah/vAae0XGQ5cT8PVjQkba/7lhrTvPZPQDhjTD3nQhNly235K5fxg+p5NPgR
         J39/4TG6+3XY4JPRUNdsdLuO++HUoknmEYD5AA7DWc9JgMgKw6sJlBAs0wjkrDMl2LIM
         y4W8kmLFO6M8oiYoK5MUYd2jotPoPIQp4mLmaAMvaIJ+NjaNB3jaqvUBvTzzgVEG40qp
         CA+EZGw/HgBy7tPyVkdfIlrN5JQz4M8dc/NiiMucDEp4c4F+H0Q8Mbz04G6UzhBFdap8
         aMpnfTEXj5t4JXs3im96EteZqAocvjjfNHEqn9/+kk/1idG5Iy7kSWgZxHmKUZpVAIrW
         lfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716400533; x=1717005333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUbh9N0CgOzVQjoQWBGWyLsz54gKjYY/MoX2eZT8GrA=;
        b=urjNZjZop2f5AD4pNQ1mLuOM/Axc1YhbjNVtjuSb54hR+6DNEKeNb9KHRoNt6C4wzn
         4eWbb+A8Kr+qa9nMuIIplhZPzo/ZynpFoinbPL/EzzPY1hYmFxGjZgP6SFPMlpFh0UXR
         +Y2CzQuAfkpCnWHnQD0TFr2f2hsfbKDT+Gb82n03RHEZJMdxDCpVoIdkA16lP/iANfRV
         nV/jEbwZKL6fZ7btUT8LewYQ1EXvtx9fWnY+thWJl5AR5AJA8abJshQc6HKX5+9n/34e
         iN2mPc09ZMqiuJ7qMiRNJ2wDe2T+5/VjsgcfLlbx3CCft+lLbGNgi45FoHm2eDPfEUj1
         7yAg==
X-Forwarded-Encrypted: i=1; AJvYcCWX06+qeaIamPteYzmdfkCLkm8/nja+WdGLXzVpggNwu6EvbUbJgygfoPaYSPhcXmCIc7ZW445Mig1m2As2+Uh2DK25WWZeSOKD/w==
X-Gm-Message-State: AOJu0YxBlpdFgkyGZERYKJRjqVz0DW0U1qJHRpsdjQOSE+FTqAMi/hGy
	do13rALX0DAo0vmL6IYLiCGgujUQ1Ii+4STv5xc2/eoriQpzOQY8P8seS4uuFvbxWsbWsDc0zE0
	zUMjmXSk0alAuuHJVPqz+tXHET0Y=
X-Google-Smtp-Source: AGHT+IF00HX2aCBnKIvCktPUwbCQ+rkBdDpdt6QDsQxvZALxMvyTCp9pNo8nyE2LF3RzUWmEeOw8L3PJaJHGFSWdBsg=
X-Received: by 2002:a2e:9245:0:b0:2dc:bd75:41ba with SMTP id
 38308e7fff4ca-2e9494f48b6mr19834991fa.27.1716400533176; Wed, 22 May 2024
 10:55:33 -0700 (PDT)
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
 <CAEoi9W5cmv-mQAsKPYTfjAytfp9Mvf3WgRQ9Ni=sznrU0v+NDQ@mail.gmail.com> <CANnsUMG42uECBVKFAPrwprakAGd=+KPE-WOAgS47nzKjWKawuw@mail.gmail.com>
In-Reply-To: <CANnsUMG42uECBVKFAPrwprakAGd=+KPE-WOAgS47nzKjWKawuw@mail.gmail.com>
From: Dan Cross <crossd@gmail.com>
Date: Wed, 22 May 2024 13:54:56 -0400
Message-ID: <CAEoi9W5ZPy2n0WasmZN47w6r2Bs-C1+GCbQRUV8PF5MbA_zTqw@mail.gmail.com>
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Chris Maness <christopher.maness@gmail.com>
Cc: Lars Kellogg-Stedman <lars@oddbit.com>, David Ranch <linux-hams@trinnet.net>, 
	Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 12:07=E2=80=AFPM Chris Maness
<christopher.maness@gmail.com> wrote:
> > My personal belief is that the best way forward is to rip AX.25,
> > NETROM, and Rose out of the kernel and go with a pure user-space
> > implementation. I can't really think of any use cases that benefit
> > from being in-kernel; use cases like IP-over-AX.25 could be handled
> > using TUN/TAP, for example (and I think that's probably the most
> > obvious one where kernel integration is useful). At the speeds we're
> > talking about here, crossing the user<->kernel boundary isn't a
> > significant performance hit.
>
> I think in doing this you will orphan a lot of important software that
> relies on the kernel space ax.25 stack.  A prime example would be
> LinFBB.  LinFBB requires either an ax0 or a hostmode TNC.

I'm not entirely sure why.  All of those programs that currently
expect the kernel stack are userspace programs, and all of them
interact with the stack via a set of interface functions that are
provided in the C library; of course, those functions are implemented
in terms of the kernel system call interface, but to a first order
approximation, practically nothing talks to the kernel _directly_;
they all use a(n albeit thin) shim interface. Thus, if a compatibility
library were created that implemented those interfaces, and those
programs arranged to link that library dynamically when they started
up, they could continue to operate unchanged. Of course they would no
longer be using the kernel stack, but they'd neither know (nor, I
argue, care). This is the essence of "the `LD_PRELOAD` trick" I
mentioned earlier.

> Hostmode
> TNC's are getting to be really long in the tooth by this point.  There
> would be no way to implement direwolf as a radio port in that case as
> FBB does not do KISS.  You would also lose netrom capabilities of this
> BBS.  I feel that FBB has the best BBS user experience, BPQ32 copied
> it, but FBB is still better in my opinion.  It also has features that
> BPQ32 does not have.  A possible workaround is to revive NORD><LINK's
> THENETNODE project that went to mothballs in 2006.  I am not sure on
> the licensing, but the source code is still available.  TFKISS can
> then emulate a hostmode TNC while TNN provides NETROM, KISS, AX.25,
> INP, and Flexnet.  I think if that code was brought up to date, it
> would be a good candidate to replace the kernel space code.  I have
> not been able to get anyone to take me up on this project.  I am not a
> programmer, or I would work on it myself.
>
> There are other softwares out there that there is no full replacement
> for.  linpac would be another example.  I think the bottom line is a
> massive drop in the interest in packet radio as a whole since yr.
> 2000.  There is not the userbase of packet radio in its heyday, and we
> have far passed the high water mark.  There is some pretty amazing
> code out there that was just left to languish.  If you have ever had a
> chance to play with WinFBB, you would know.  That is such a refined
> BBS with its own built in email editor.  Pretty neat setup, but
> development stopped in 2001.  Many of the important German
> contributors don't even seem to be hams anymore.
>
> I vote leave it in (even if it is limping along) because this last
> patch seems to put my system back into a usable state as far as LinFBB
> and NETROM, if you rip it out, I am back to using ancient distros.
> Slackware 14.1 (Kernel version 3) for a rock stable AX.25 setup.
>
> Those are my $.02

I think it's important to explain that existing software wouldn't a
priori stop working; indeed, a central goal of the effort would be to
maintain compatibility! This is easily doable these days.

        - Dan C.

