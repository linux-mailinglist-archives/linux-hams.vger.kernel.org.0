Return-Path: <linux-hams+bounces-298-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 567488CC425
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 17:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8DB61F216CB
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 15:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA9E52F9E;
	Wed, 22 May 2024 15:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtyrjnjA"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF061171C
	for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716391981; cv=none; b=JY75xKJaWYJoHBjPaiZ1dnBA5IUiLtB3nCRQLYiQcRzIVdxXFTZ+Dg70Ruva7fqPMRsTOqdc/rm01MVUG8fryjlYxTQFjDikCXo7zTItLeCH+rGW44OgMfkyzlqPXtr0yh3iEQAs3VR7wTp8KTY1sQRWIRLSkg1BsbqcPUjJI5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716391981; c=relaxed/simple;
	bh=VjNTknScHiZsvwPmrftDlsFXxuY764JBmeJ2gwEpHGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JG0lYGVIvy+cN0p0zbE8AvaMK14Pu1jV1iK+okhnaoaciO6Zuhhic4T5aMors6Un+BjkP9een0lGGn3uEWmOoI1/YJYH9W9s+we4cvKUyq0MyiriEvJ0u5wohkmlUxutlsSF6FnaJJXmUdaOm/gB+Osl1+siXFcSr2Y95BcSRFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtyrjnjA; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e3fa13f018so65624281fa.3
        for <linux-hams@vger.kernel.org>; Wed, 22 May 2024 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716391978; x=1716996778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zg3bOMxbgm0S/3G91mDMeRCyeAObOA2K8Ze9sSp844E=;
        b=PtyrjnjAo1tKgn1/MPwyNa0UtLxbiG6r/P7FZQl+S84kP5cynRHyiX6VvPG6SF2Pod
         9DYg5vx9Us7QPeLbVL2jMFqTuaIgaO+ZBb5jaH8CbhYQnLjj7koEK/XV5y0kJK4BR3Yw
         o10/jJSjA7k/MexqxdAksnywxCwJ3jaKQ3JLHkA2I727Pg93V/VeWR/c4+p94zoqz9nU
         /zmaL/ZYPpDSoEfRV3z9T+Wak/6Ly2hPpUvTfYVgl8RNWkM4s2oFdzOuDWrYspXkcfpo
         IslDEhFHzZVlyHE9v59GQu74UyzB4V0x7zCMWPO8Mvz5PyWZfHwv2tnxiAs/Sb6lSCrO
         ZsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716391978; x=1716996778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zg3bOMxbgm0S/3G91mDMeRCyeAObOA2K8Ze9sSp844E=;
        b=CsrWCkO5S3nH5Xh8SqqHp9lvZeqA87IV9GRm9NlwFe3Lw5oRyYzNoNA5w3qmQ/QQq8
         7vDLeUBuTx1/eYUrBnvDWksjRjHJ74BFOsZhaj1WctuY5o4kXfK40N1m3pn5hJyLFB1O
         //2UYXl/66/ca/gt7hGpXo8PRjHQURJfaPIWheJpBioqNYLnye9fJcs4wYUvDziAK4nY
         7TJMq1AQAeSXK5u6WLJeVsZkPxxJMtqPECYGt45GLD8/msNtedZNQA02S9q/aoZXwSCl
         Obe//J4yxdxaPlU2sBoOA1ipq83TkhWzso+l4Cro9+6evygYUFJ8SzO6AmouO1+UPrWn
         EpvA==
X-Forwarded-Encrypted: i=1; AJvYcCVoLMNU48Heyp9eykqpMuZp/lTb5+hjCyqJO4V1/+8yIL3wxu2DNSN4ISydi+3LBWrwsdCBDQ0n5xGRELcw47HTBRnoZaHhvO5UcQ==
X-Gm-Message-State: AOJu0YyRElBVgBY1C2towO1fpgwOr3c5J/GPWWb5ioa32XY9zaTSm3xw
	0l0MzlgQaqGGRlM7oe8M9A/mfsBWSpFfKbd9fimmOCjImokpPfYOypu9AviY8DLRRS9MOk9Je1Y
	mbYOFUNyQjhmchgt6Hk8X98q/eTgG9A3w
X-Google-Smtp-Source: AGHT+IEwu4GW4rDZYisDHw0CByONd7qANr0zqCTXf4XkXmv0WzB0mMxEflaJr+jxN7z56HibaHY9HNORpv+t8Qru2SI=
X-Received: by 2002:a2e:9e93:0:b0:2e2:42d2:c609 with SMTP id
 38308e7fff4ca-2e9494cb6ebmr15108411fa.15.1716391977735; Wed, 22 May 2024
 08:32:57 -0700 (PDT)
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
In-Reply-To: <c3infeyajl4hr2tuyfmmccdv4gjbhsulaxuetozigqwqtj4jga@42eucxtsfk2y>
From: Dan Cross <crossd@gmail.com>
Date: Wed, 22 May 2024 11:32:21 -0400
Message-ID: <CAEoi9W5cmv-mQAsKPYTfjAytfp9Mvf3WgRQ9Ni=sznrU0v+NDQ@mail.gmail.com>
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: David Ranch <linux-hams@trinnet.net>, Chris Maness <christopher.maness@gmail.com>, 
	Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 2:51=E2=80=AFPM Lars Kellogg-Stedman <lars@oddbit.c=
om> wrote:
> On Tue, May 21, 2024 at 08:53:06AM GMT, David Ranch wrote:
> > That said, I wanted to chime in here about your commend
> > about "very few people interested in the a.25 support in the kernel".
> > That's definitely not true.
>
> That's good to know! I based that on the amount of traffic I see here on
> the linux-hams list, and the difficulty in getting anybody to offer an
> opinion (or an alternative to) these changes. If there is a more active
> forum where people are talking about Linux and amateur radio I'm happy
> to join there as well.
>
> > The other significant issue is that the kernel branch maintainers /
> > powers at be seem to just accept these changes without any real
> > scrutiny and don't require any real testing results to confirm things
> > still work.
>
> I think this would typically be the job of a subsystem maintainer; this
> is another way in which the lack of a maintainer hurts the
> ax.25 stack.
> [snip]

I mentioned this to Lars privately a few days ago, but wanted to share
more broadly, hopefully to foster some discussion about the future of
packet and AX.25 on Linux (and similar!) platforms generally.
Hopefully Lars's patch gets integrated into mainline soon, but I can't
help feeling we've got a lot more work ahead to bring the stack up to
a sufficiently high quality standard.

My personal belief is that the best way forward is to rip AX.25,
NETROM, and Rose out of the kernel and go with a pure user-space
implementation. I can't really think of any use cases that benefit
from being in-kernel; use cases like IP-over-AX.25 could be handled
using TUN/TAP, for example (and I think that's probably the most
obvious one where kernel integration is useful). At the speeds we're
talking about here, crossing the user<->kernel boundary isn't a
significant performance hit.

But I can think of many drawbacks, some of which have been mentioned
in this thread. The lack of a dedicated maintainer is a serious issue,
and it's clear that AX.25 has atrophied significantly over the years.
Moreover, the userspace tools have bitrotted to some extent, and lack
clear maintainers. And tools like `ss` have not implemented support
for AX.25 or netrom: we are already behind the curve. The relatively
slow pace required to get things into the kernel, let alone filter
down to individual distributions, is another.

On the other hand, with a pure userspace implementation, AX.25 support
becomes a normal program like any other, and can improve at its own
pace, not tied to the kernel release schedules of any particular
distribution. As I mentioned, IP-over-AX.25 can be supported using
TUN/TAP; existing programs that expect to use the sockets interface
could be supported via a compatibility library and the `DL_PRELOAD`
trick. Presumably the actual implementation would expose a
well-defined interface over a local IPC channel (e.g., RPCs over a
Unix domain socket, or something like that) so that new clients could
be written in a variety of languages (I wouldn't mind Rust, or Go; I'm
sure others would love Python), without necessarily having to write
bindings for the sockets-specific bits.

A way to start here might be a multistage process of extraction from the ke=
rnel:
1. Copy the existing code into some directory.
2. Work on getting it to compile, but not link.
3. Bundle the resulting objects up into a library.
4. Start writing shim functions for the missing bits required to link;
plug this into a different library.
    Once there's a minimally linking binary (even if it doesn't do
anything), you've got a pretty good idea of the requirements the stack
needs just to be buildable; this also naturally exposes a portability
interface.
5. Flesh those stubs into a real implementation, implementing missing
components and a daemon (or two or three or whatever) to run it in.
6. Bask, flush in the face of success.

Of course, there are existing userspace AX.25 implementations: BPQ et
al come to mind. Thomas Habets started work on a userspace
implementation (https://blog.habets.se/2021/11/AX25-user-space.html,
but that seems to have stalled). But having a AX.25 available as a
generalized library and set of components, usable in the same manner
that the existing kernel stack is, would be a win for building new,
novel applications.

Thoughts?

        - Dan C. (KZ2X)

