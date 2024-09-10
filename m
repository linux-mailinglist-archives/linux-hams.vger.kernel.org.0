Return-Path: <linux-hams+bounces-422-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C254E97463F
	for <lists+linux-hams@lfdr.de>; Wed, 11 Sep 2024 01:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80AB6288857
	for <lists+linux-hams@lfdr.de>; Tue, 10 Sep 2024 23:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5A51ABEA7;
	Tue, 10 Sep 2024 23:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaVSDx6a"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A576D19EEC8
	for <linux-hams@vger.kernel.org>; Tue, 10 Sep 2024 23:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726009610; cv=none; b=eeoe12Fxrthx9n9mxYdoXOP9YAV7EGwlnvBezoyMDmzqN9adoLuZz56MwpI2tOwCOOLDVMrFC9OqfU/gdkwNC4HSRXyFlQ22WXYilnTYffBheVegnTyovZn8B4eLKLFofFcTjC+vLpDz2DUWD8hFUvOcGFCQLQ45QsnHQzFdLGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726009610; c=relaxed/simple;
	bh=402LCwkdCnHHqhFbzihReVsGhYXGGz2lr5NwDG0wk9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bm2Ux1hI7GxRR++IhBvgHQwUxt6a1+zgyDHGpI7R2YOUgCgLt/67hwAdzusnpUUC0FC/gLB0X5uvgI31cB+aGvLdxP3rqFg3Iuhfa5zsXmyDEwdhvhpzBI1/Evodbov6DNk4WK2mWIU36tY9fJpBd8Rg0wN3heFECiCEE6cTZZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaVSDx6a; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6d47d860fc4so44758487b3.3
        for <linux-hams@vger.kernel.org>; Tue, 10 Sep 2024 16:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726009607; x=1726614407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6IF6v9timbfWi4Ke4pW8mHglY4xBoWQ74VevMJrKU0=;
        b=eaVSDx6aU60im0rTx++cFPUwMhJVklYNnebWtPVBVPDmqSrdzi28kod6IWGNsP/exd
         2DqJx3Pz0axz6ab/eK/UQGA/myXbR0lyJaNYOsU3gx4rpn1oVNGv+0xYpeTQF76kFVNT
         MAuh2IiQDhRgP27pLQSIN/xWRlYpm6vbCbT/JIMYaM7UtAAu65T4dj/reK2B1tqINdld
         eDoiyVcAeqGihYAcEcf6uVl4J0PgEPm0VnTvUXI0mAbTCMFoNYNzsbFYWHCn0bpkMkU1
         aqddqpsyAq6kRzEQUL6Ob/5Bqc1z9oH7GA3tssJuck6bbwaYRKG3tkjGL/XxFFe0fr5k
         sF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726009607; x=1726614407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6IF6v9timbfWi4Ke4pW8mHglY4xBoWQ74VevMJrKU0=;
        b=oOwrsUerwkYpwAO42clNyU4NYzbY7ViDdraFxTBPkaoSIU/jbOgbNkzAu59wZvbp2K
         UhoE4I1pvyuI198UlVg5u67vV706Xp5TpTTzfQ/JRIREjf0EFnuNRe2OGDed5m5dBwNw
         CJzAgSBd+pj2JUaTlw79bSzb1chVBcZeyz89RA1mhSKTgraioX2HN6AlAbC1RyWHnpDk
         jxYSlGBPQnDhpwVaqqRE2t7vptaUHw1R9m91DA4rs4QftOj5oLKeib8xCZRbw//3qv93
         GaJ3dhDLY3GAO9X3YMZeLKbhHqT3RayQbqjdIAT9fYjDNHjvdNUj7MfHbTcfdCadIRzr
         wIIQ==
X-Gm-Message-State: AOJu0Yw8Wca8sgF+1JMnmHibHALJsrnTeKA7ghcaXqGZ5UPaIcYxuzNd
	8klz0M68fLvrknEfocBj93o5Uob9STXSRsc0euMPF1yH1/q4fssryD8ycj/vxKaFD8RZ5vp0TM3
	WobEWLQiq90r9YVojdeaqpKyO7S6cqQ==
X-Google-Smtp-Source: AGHT+IHVE0Nb43/t3Ko0AxWkGgvQ3zmsE90u15rYHFMyla7fflGByLdNUGBKh7y+b9f5575Fy9msrfxda1wLbpNwA1o=
X-Received: by 2002:a05:690c:45c3:b0:6b1:8834:1588 with SMTP id
 00721157ae682-6db452c39f3mr182748217b3.35.1726009607448; Tue, 10 Sep 2024
 16:06:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+kHd+e1pjfbzAJnkjqx5pM4Sk+fnSLg-KJw0aZwiwc-fTFyBQ@mail.gmail.com>
In-Reply-To: <CA+kHd+e1pjfbzAJnkjqx5pM4Sk+fnSLg-KJw0aZwiwc-fTFyBQ@mail.gmail.com>
From: Chris Maness <christopher.maness@gmail.com>
Date: Tue, 10 Sep 2024 16:06:36 -0700
Message-ID: <CANnsUMHwRsUEhwwvTn1pi6Ct3U=Xw77ESz5xB+fhtyfDc_J8Ww@mail.gmail.com>
Subject: Re: Duplicate and reordered frames in kernel AX.25 stack
To: Thomas Habets <thomas@habets.se>
Cc: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think I have seen something similar watching traffic go by from
LinFBB.  Sometimes it just starts sending a massive flood of packets
that go beyond maxframe.  They all get rejected, and they stop coming
after a period of a couple of minutes.  I was wondering if this is a
userspace issue with FBB, but was not sure how that could be the case
since the kernel should control the maximum number of packets.  So
this post does not surprise me.  It is still mostly working, and
finally no crashes since the last round of patches that went in.

-Chris KQ6UP

On Tue, Sep 10, 2024 at 3:23=E2=80=AFPM Thomas Habets <thomas@habets.se> wr=
ote:
>
> Hi.
>
> I'm writing my own AX.25 stack, and am testing it against the Linux
> kernel stack for compatibility.
>
> I encountered strange duplicated and reordered frame numbers (NS), and
> after initially assuming the issue was with my implementation, I'm now
> pretty sure it's a kernel bug.
>
> Kernel tested is 6.10.0, built locally, with config
> https://blog.habets.se/tmp/stammer2.config.bz2.
>
> ## tl;dr:
>
> The kernel stack seems to sometimes skip incrementing the NS / VS, and
> reorder frames, when sending out frames very fast. They're duplicated,
> but don't then "skip ahead" to go back in sync.
>
> I believe this is a race condition that may in practice never happen
> at the usual 1200/9600bps speeds, yet is still there. I believe anyone
> who runs KISS over TCP could be hit by this, not just my special
> setup.
>
> This bug corrupts user data in transit.
>
> ## Hypothesis
>
> My guess would be that ax25_kick() needs some sort of locking, either
> around it, or within it. It has:
>
> (a)   next =3D (ax25->vs + 1) % ax25->modulus;
>       [...]
> (b)   ax25_send_iframe( with old VS )
> (c)   ax25->vs =3D next;
>
> I believe that a well timed context switch or race or something causes:
>   Thread 1: (a) Set next to be the next VS
>   <switch>
>   Thread 2: (a) Set next to be the next VS (same number)
>   Thread 2: (b) Send iframe with NS=3Dold VS
>   Thread 2: (c) set VS to next
>   Thread 1: (b) Send iframe with NS *also* equal to old VS
>   Thread 1: (c) Set VS to next (same number)
>
> This would explain the duplicated NS, the reordering, and that NS
> numbers continue to be off. But something else could be happening too.
>
> I'm not familiar enough with kernel locks and skb to know how this
> should be fixed. I was urged to write up my findings, in the hope that
> someone else would be.
>
> ## Supporting data
>
> I have https://blog.habets.se/tmp/stammer2.pcap capturing ax0, so this
> should be the kernel's view of things. Looking at it, I'd say that the
> kernel (M0THC-2) is in the wrong.
>
> I have added support to wireshark for extended sequence numbers, but
> it's not in a wireshark released version yet. But you can either
> compile it yourself and run:
>
>     tshark -Vo ax25.extended:true -r stammer2.pcap
>
> or use the output I've prepared here:
> https://blog.habets.se/tmp/stammer2.txt.bz2
>
> ### Interpreting the data
>
> It's not super easy to read, sorry about that. Here's a start:
> * M0THC-1 is the client, my implementation
> * M0THC-2 is the server, the kernel
> * Relevant frames 110-113 are all sent by the server (kernel).
> * Frame 111 and 112 both have the NS 98
> * The correct order (confirmed by stitching the data manually) should be:
>     frame 110 (with NS 97) -- correct
>     frame 112 (with NS 98) -- correct
>     frame 111 (with NS 99) -- bad order, NS 1 too low at 98
>     frame 113 and on (with NS 100 and on) -- NS 1 still too low
>
> ### Reproducing the data
>
> There's a lot of custom code to reproduce the data. So this bug report
> is not ideal.
>
> In my implementation repo (https://github.com/ThomasHabets/rax25)
> there's ./extra/testenv.sh, that sets up a tty loopback between my
> implementation and kissattach to the kernel implementation.
>
> On the kernel side I run axsh[1], but you can modify the script to use
> anything, or start the server manually.
>
> The only requirement of the server, AFAIK, is that it produces a lot
> of data fast. It may also need to use EXTSEQ.
>
> As you can see in the pcap, I trigger this by having the client ask
> the server to run `find`. With build artefacts and .git dir, that's
> 16496 lines and 1.6MB.
>
> On the client side (rax25 implementation), I run:
>
> ```
> cargo build --example async_client
> ./target/debug/examples/async_client -e -p ~/tmp/rax25.serial \
>     -s M0THC-1 M0THC-2 -v 5 2>&1 | tee log
> ```
>
> It'll only take a second or so, after which you can kill it. Or you
> can grep the log file from the tee command for "not in order" to
> ensure it happened.
>
> [1] https://github.com/ThomasHabets/radiostuff/tree/master/ax25/axsh
>
> --
> typedef struct me_s {
>  char name[]      =3D { "Thomas Habets" };
>  char email[]     =3D { "thomas@habets.se" };
>  char kernel[]    =3D { "Linux" };
>  char *pgpKey[]   =3D { "http://www.habets.pp.se/pubkey.txt" };
>  char pgp[] =3D { "9907 8698 8A24 F52F 1C2E  87F6 39A4 9EEA 460A 0169" };
>  char coolcmd[]   =3D { "echo '. ./_&. ./_'>_;. ./_" };
> } me_t;
>


--=20
Thanks,
Chris Maness

