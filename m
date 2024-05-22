Return-Path: <linux-hams+bounces-299-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A499F8CC49F
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 18:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA76A1F227D7
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 16:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1454E20DF4;
	Wed, 22 May 2024 16:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQ7oSk4h"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756AF139B
	for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 16:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716394057; cv=none; b=eIAlMnwWkbrMvjA2+B4eDL573cWie1FapspPVkrRAJvuBjV18JH9zM0iRCbl8aZV+9EpYQsCRwGWnbsTBNrsoXsN2bx/Uhb2dEPz5NW/SCvihDdlwI0radbgRRnNF80GJV2musPUeuHslD5HPF5VhhyAPTgMrkVTBdt4KzlbZag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716394057; c=relaxed/simple;
	bh=gnrPJSH97pDX0KNV/v1+zrLHjq5ySr4H0guFem1DFHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HcOCPNY26gLXy/7SYh+vvemcdFLeG2f/FXuE2CYU3W/uRVnC3XZv1+6UrDssnv2in837+8VFSBtQlCGR5+30Ljd+K/ppWRN6tOcH3yr4viR868o6clKatwn9SxXj/atgLls4jtFc55RNUDbB4Z5T4p4Yg+kb+fD5vXDZE4bu+Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQ7oSk4h; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-df4eb08fd9eso638791276.2
        for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 09:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716394055; x=1716998855; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5VW71En0Exkx8CKKIBxQgpxcNt7efPPyaYd/Pz186Z4=;
        b=dQ7oSk4hHCHFThglsaMWbd2Zk4gL0/+33Ek+uWHwU4QGkm0j0Kok72YVoalHwHak08
         sV3U0wUbptWECmYzmHPFLt+CXphye+nYeSsASHLNb9JD5JzDomEWXf738P6xjUAFSqov
         PnZKQtkQGxQh09au1eR+liCDa9km/bPk4VPhQCqMKa6FwIO9uAmrkpvNerpq4Tdgqk4q
         9h2LGD3RHqtB2wuHDCOLNdUM6fK5SujVDibwwLv2U9Ai1fCjTN6MTd8BL5Px7w+eG4ah
         //XuPuLrGoTCbbJe034UC9EbfuMpVPt7SGTSH2QHazwy+LzR1adBbBvZX+eEWhW0YuCN
         L6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716394055; x=1716998855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VW71En0Exkx8CKKIBxQgpxcNt7efPPyaYd/Pz186Z4=;
        b=VX/8VX4xkQQyMvcvOO/Yt20TFS8js05JYD0X6YOBevK4qXtx9LIL+eKhpkUhXAEYtI
         241+g7IB0CtqCHn3nRoH3jqmh2hG1WQZFquPo75CZ+CrBQntlvNWwzoraEyRVAI5jqY+
         BBbACtAruXng5gjigTDP4QG87i+XwRBQAobKoNVDl+m7k0HO3neJophfF7h1FDc5fy6J
         q9tWzRNRBtHXlnxC5dN0HRlHhpKizECvNXBrj4aMI9kO57eU5MwV1IDG26HVEiIVucqK
         LDmf4CWJBhj+tWc1SkqN7gmjzcMpV+DcJ9rjwAds73JzTBPilZHROmDIaFoeA10d3eKd
         DhWA==
X-Forwarded-Encrypted: i=1; AJvYcCXKMAw6K9wvSjnboeKF7qMXWd1kuaH9sRDM1pfs1z5Z+vCkkzUr7hYFYpdaTJgcj+9f6YY4hsl87rGSfPVn/vfeKUtjwc5o5MctLA==
X-Gm-Message-State: AOJu0YxQj34VZ72zndCZxC9EB6i85mHNlObBRVQ2Qv0g3W5o5NlhJh77
	4C2X4bOls73Sx9HAObd8+SIERBD9A50o1MFGQyTIpuSOGkWTfDZ9guJFRwlNwAGb0GCJYY5S7vi
	0kMbEX0Qjd/U2dkbcsBARsIrP7anEHQ==
X-Google-Smtp-Source: AGHT+IF61EgHkjc45uIKzdGCCJYpsurPVADOoL43ObWIvnSCDcQDjyrFFkcG7vEG/v/OgrXgneA4GZOcyFWo3MHK9WQ=
X-Received: by 2002:a25:ce48:0:b0:de5:965d:7965 with SMTP id
 3f1490d57ef6-df4e0e4eabamr2257078276.64.1716394055188; Wed, 22 May 2024
 09:07:35 -0700 (PDT)
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
In-Reply-To: <CAEoi9W5cmv-mQAsKPYTfjAytfp9Mvf3WgRQ9Ni=sznrU0v+NDQ@mail.gmail.com>
From: Chris Maness <christopher.maness@gmail.com>
Date: Wed, 22 May 2024 09:07:23 -0700
Message-ID: <CANnsUMG42uECBVKFAPrwprakAGd=+KPE-WOAgS47nzKjWKawuw@mail.gmail.com>
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Dan Cross <crossd@gmail.com>
Cc: Lars Kellogg-Stedman <lars@oddbit.com>, David Ranch <linux-hams@trinnet.net>, 
	Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"

> My personal belief is that the best way forward is to rip AX.25,
> NETROM, and Rose out of the kernel and go with a pure user-space
> implementation. I can't really think of any use cases that benefit
> from being in-kernel; use cases like IP-over-AX.25 could be handled
> using TUN/TAP, for example (and I think that's probably the most
> obvious one where kernel integration is useful). At the speeds we're
> talking about here, crossing the user<->kernel boundary isn't a
> significant performance hit.
>

I think in doing this you will orphan a lot of important software that
relies on the kernel space ax.25 stack.  A prime example would be
LinFBB.  LinFBB requires either an ax0 or a hostmode TNC.  Hostmode
TNC's are getting to be really long in the tooth by this point.  There
would be no way to implement direwolf as a radio port in that case as
FBB does not do KISS.  You would also lose netrom capabilities of this
BBS.  I feel that FBB has the best BBS user experience, BPQ32 copied
it, but FBB is still better in my opinion.  It also has features that
BPQ32 does not have.  A possible workaround is to revive NORD><LINK's
THENETNODE project that went to mothballs in 2006.  I am not sure on
the licensing, but the source code is still available.  TFKISS can
then emulate a hostmode TNC while TNN provides NETROM, KISS, AX.25,
INP, and Flexnet.  I think if that code was brought up to date, it
would be a good candidate to replace the kernel space code.  I have
not been able to get anyone to take me up on this project.  I am not a
programmer, or I would work on it myself.

There are other softwares out there that there is no full replacement
for.  linpac would be another example.  I think the bottom line is a
massive drop in the interest in packet radio as a whole since yr.
2000.  There is not the userbase of packet radio in its heyday, and we
have far passed the high water mark.  There is some pretty amazing
code out there that was just left to languish.  If you have ever had a
chance to play with WinFBB, you would know.  That is such a refined
BBS with its own built in email editor.  Pretty neat setup, but
development stopped in 2001.  Many of the important German
contributors don't even seem to be hams anymore.

I vote leave it in (even if it is limping along) because this last
patch seems to put my system back into a usable state as far as LinFBB
and NETROM, if you rip it out, I am back to using ancient distros.
Slackware 14.1 (Kernel version 3) for a rock stable AX.25 setup.

Those are my $.02

-Chris KQ6UP

