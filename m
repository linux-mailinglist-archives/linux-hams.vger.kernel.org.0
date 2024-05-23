Return-Path: <linux-hams+bounces-322-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D02D8CD877
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 18:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 151261F22A5F
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 16:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593DD11720;
	Thu, 23 May 2024 16:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYA1yyA4"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2F017C8B
	for <linux-hams@vger.kernel.org>; Thu, 23 May 2024 16:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716482000; cv=none; b=QiC1K/s0soBEqESruNR7rWGjta473kd8KZsiNgJFzUsRIUFKbQC6OS1pvuPSzfpfdSF5T03xKVHUARmamt03eQMmJj1R1u/btZNozxsBlJU0l3Fgsj46fcSy/rV7jgMQryFgbBZlYKIS/YKrfjatJkzb8Ke2vUr5AJGL6MN84Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716482000; c=relaxed/simple;
	bh=a1LPliaSed7RBcAEL9F9o8QsTopLihz7ycPKUyQk0xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZm8Gy+vXXtbva6QxL9axH2EjbamAiEARBj8XpV+i9rgZWqzXzBu5ou2dQRBvUK+qr1jghnuh+u1IRt/Su9Wyu/ujvkDbOlvz/uqbc7wo3GBaf3XscloDkmely/Q/1HyRRRP9tXlyf1QFx6bEBFM2bd2j8ZnqFC5iGt72TCq/MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYA1yyA4; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e576057c2bso117011381fa.1
        for <linux-hams@vger.kernel.org>; Thu, 23 May 2024 09:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716481996; x=1717086796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hzpkr08HlsfAveSdWYspSNmxi49NjrFXM2XwMN4/Pd4=;
        b=fYA1yyA4dFLU/iRPU1YByKThAOzD0J3HtZx+o/ZfAPiND3Rqu5R03mCWrY7yVDKtqr
         ChilaOiTud4M1f+q3S4i2t8XvnsXpw+fh7L1gs+1ANXYu6rx2VTfgIwp5ONEstf7y764
         sO6EVN2c10vWPAGuHmdq9SVivoX19n3bx99pX3hncv55yI32E1xLuplfK07uRyV7SJsk
         eXu0m+kgxuw99pJFnxWoihLed4/IAtVmpMNh3c3ssSdfaVBkHhxSUSvINhHTI1l73pvL
         wVN37Z1l4zs1hWc/FC/xn4JNsFykINKKtV4XVTMKB0/RGVdEKdX+j2bctPP4Qk1gnQCP
         nIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716481996; x=1717086796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hzpkr08HlsfAveSdWYspSNmxi49NjrFXM2XwMN4/Pd4=;
        b=gSUpGdh7tULc2GAR9AfiA4VDR+RV0illmjtz3ZmNe7R8Vil1C5qrS7YM6MvvxTdtKP
         yJChzkbK60rz2UxokzbOCiUqVGWrgGQulKOc/mtiWJkNrKzdu3WvMEcbb8WjmHh05Nhs
         9l18+MGN5WHzYV3nrueUBO9sNAE4CNHb0TfKrcj47bkxKGRCjePmBx9qzspzfvYmXh1m
         S3AxILi9d/Hu9lPDENgpaXPoDUNCh5i1/NNqPQ3hSgDMZ7UnYW9QWwFSyzntXcHt5b1x
         4EbFlujTZ5moC25AHnzuZfJPr7JQhxsqW2IHrq4u6iWbYIrQKhr+tRSsphziNUHzcuUR
         xALQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4ri3Uwjh2yLMnC3wuNPJ1a4jvQ67KGmkik9trRLIKd8qhB7YqkUcoiJ5j2wsczcqAPqp/yK+TX4P6m2Fq/7nZeLVnzfy56LcKCg==
X-Gm-Message-State: AOJu0Ywgrv3N+wnDxymCSeKDg0WKL21B/+M3iINSTCnNTA+VabrwoG6l
	Fw7zLxRKLPlFzjgWdxjr9ALDixeD7ID/MqG+OC35DmFZFj2iMZAQgPCKtCQAPZEwgsTJY43zr2l
	cX1qAhWcYNqaPOMLxoJz2Y8gJThzyK8CLiuA=
X-Google-Smtp-Source: AGHT+IHtZBNF1rYYXOgX67Eil4Eiszaa5eBl+jsHv3dXqzSAG+CJjijDP38n2j1Qyg+BuEAYJWhO7Xp1zPlf6rDGmF4=
X-Received: by 2002:a2e:9808:0:b0:2e1:ed63:d153 with SMTP id
 38308e7fff4ca-2e949430791mr44489801fa.7.1716481995897; Thu, 23 May 2024
 09:33:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
 <f27710b7-253c-79ce-e214-2b8251aceead@trinnet.net> <c3infeyajl4hr2tuyfmmccdv4gjbhsulaxuetozigqwqtj4jga@42eucxtsfk2y>
 <CAEoi9W5cmv-mQAsKPYTfjAytfp9Mvf3WgRQ9Ni=sznrU0v+NDQ@mail.gmail.com>
 <v6ybd4paw7eossjr2qiqvi5zqmvub7avy4cxpd6oyhfattia6j@ygablb7u2rpr>
 <CAEoi9W7VJhnSMD=YJX-92Lmxo+y6if_rFCAPrJiwJ8iuxz_7Bw@mail.gmail.com>
 <g2tpfzyhdwq2ink7phx3hpt4djjqpihf2efmcz4lwypwkgnhon@ihnhjwbj6lp7>
 <e0643fcd-fc41-0d56-0497-684fc7c157ae@trinnet.net> <9f43ddd7-4e61-4a37-a8d5-aadb1e26f38b@vk4msl.com>
In-Reply-To: <9f43ddd7-4e61-4a37-a8d5-aadb1e26f38b@vk4msl.com>
From: Dan Cross <crossd@gmail.com>
Date: Thu, 23 May 2024 12:32:39 -0400
Message-ID: <CAEoi9W50BuNCJrTzvrdNH+z+gm1BdYyd6sRmHwP+P_tUpNcbhw@mail.gmail.com>
Subject: Re: Userspace AX.25 stack library [was Re: Kernel 6.9.1 AX.25 Crash]
To: Stuart Longland VK4MSL <me@vk4msl.com>
Cc: David Ranch <linux-hams@trinnet.net>, Lars Kellogg-Stedman <lars@oddbit.com>, 
	Chris Maness <christopher.maness@gmail.com>, linux-hams@vger.kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 8:55=E2=80=AFPM Stuart Longland VK4MSL <me@vk4msl.c=
om> wrote:
> On 23/5/24 08:22, David Ranch wrote:
> > There are a lot of fine protocol details in the Linux stack that are NO=
T
> > exposed via the "defacto" AGW API standard that stands today.  Maybe if
> > the AGW API was heavily enhanced, maybe it would be possible but there
> > is a whole other level of potential legal issues with that.
> > The following was posted years after tools like ldsped, soundmodem,
> > direwolf, etc. were already creating AGW "Server" API services:
> >
> > https://www.sv2agw.com/Home/Developers
> > --
> > License Agreement
> >
> > You must not reverse engineering the TCP/IP protocol that Packet Engine
> > uses to communicate with client applications. This protocol copyright
> > belongs to me and you cannot emulate it. You can only use it for writin=
g
> > client applications.
>
> Ehh, fun stuff.

Yikes. That's scary looking.

> I suppose the question then is, what would a home-grown
> packet API look like?

To spitball around this for a moment, it strikes me that there are
several different aspects one must account for. AX.25 is a link-layer
protocol, so it has to communicate with a physical layer below it, and
a network layer above it. Kinda sorta; it gets a little funky because
it's based on X.25 which predated a clean model for layered
separation, and further came out of the telco world where things were
circuit switched for actual communication, with out-of-band channels
for control signalling. But to a first order approximation, this is
accurate. So we've got two use cases:

1. AX.25<->physical layer

There's the interface between the host and the physical layer (RF path
or AXUDP or AXIP or whatever). Lots of folks are using KISS TNCs for
this, either real hardware devices or something like Direwolf. But
that's the easy part; you've just got to have an interface that lets
you send and receive frames, with error detection. KISS would be fine.
AGW would probably be ok, here; for instance `paracon` does this
(https://pyham.org/en/latest/#paracon).

2. AX.25<->network layer (aka, application software)

This is where it gets a little bit more complicated. For the sake of
argument, assume there exists an "protocol, interface and routing"
daemon that implemented AX.25; the daemon's job is to present a set of
virtual interfaces, analogous to the existing ax* interfaces in the
Linux kernel stack. It is also in charge of managing AX.25
connections, keeping track of them, associating them with interfaces,
and routing between them. Basically, it does what the kernel stack
does today.

Now the question becomes, how do application programs interact with
that daemon? Well, there are a couple of different bits of
functionality that need to be exposed: there are administrative
interfaces for setting global and per-interface configuration
parameters, for querying those parameters, and for querying the state
of connections, routes, and so forth. Then there's got to be a means
of actually moving data around.

If we look at how all of these things are implemented today, it's via
system calls; the administrative stuff is mostly via `ioctl`s on a
socket descriptor. Data itself is moved around using the sockets
interface; e.g., creating a socket using `socket(AF_AX25, ..., ...)`
(or `AF_NETROM` or whatever). Then you can establish connections via
connect/bind/listen/accept (or not, if using datagram sockets and the
*msg functions). One then transfers data over that socket using the
normal sockets system calls:
read/write/send/recv/sendto/recvfrom/sendmsg/recvmsg and their
variants, etc. The socket options and name interfaces (e.g.,
`getpeername`) are available.

Of course, we don't invoke those syscalls directly, but rather, we do
so by calling stub functions in the C library that invoke them on our
behalf (e.g., on x86, poking the system call number into %rax, and
executing the `SYSCALL` instruction).

Anyway, my suggestion would be to replace those syscalls with RPCs.
Using something like gRPC, we could create a service definition
comprised RPCs corresponding to each call, where the request data
mirrored the system call's arguments. The response data would, in
turn, mirror the system call's return values and so forth. The various
data currently exposed by the sockets API could be represented as
individual protobuf message types. Of course, it need not be as
completely general as the actual sockets API (no need to support the
sockaddr_in* types, for example; just sockaddr_{ax25,netrom,rose}).

So to an unnumbered AX.25 information frame, for example, one might
expose a "sendmsg" RPC that takes a request structure with a interface
identifier, source and destination call signs, any relevant flags, and
a data vector; a call to that would cause a handler in the daemon to
extract the message data, construct an AX.25 frame, and queue that to
the physical layer associated with the device.

A client compatibility library that implements the sockets interface,
but translates to gRPC calls behind the scenes, could be implemented
and used by existing clients so that they bypass the kernel stack.

> I recall looking at the AGW API and observing some of its limitations
> (the full list illudes me just now, but I recall things like the
> reserved bits were inaccessible).
>
> One thing I observed recently, is that other userspace stacks like BPQ32
> will switch protocols after connecting, so the initial I-frame might be
> sent without routing protocol data (PID 0xf0), but then it'll switch to
> NETROM (PID 0xcf) with its own "frame" format within.
>
> https://gist.github.com/sjlongland/0199d5a7cc7bbc71e83d0cc5577a2509
>
> For someone like myself who's been used to dealing with TCP/IP, AX.25
> seems quite weird=E2=80=A6 yes, there's UI frames that behave like UDP an=
d
> connected-mode that's sort-of like TCP; but then that connected-mode
> stream is actually functions as a multiplex separated by PID code.

I don't find this too terribly surprising, given the history of the
protocol and its origins in X.25. I guess I tend to think of UI frames
as being more like Ethernet frames, and connected-mode AX.25 more like
frame-relay PVCs.

> I haven't tried picking apart NETROM yet, nor have I looked at how ROSE
> was structured.  Finding relevant documentation for these protocols is
> getting tricky now.  So the Linux kernel stack, for all its faults and
> failings, is still valuable as it at least implements these once
> documented protocols.

+1!

> Do we start with maybe defining a wire-representation of the Linux
> kernel AX.25 stack data types and an RPC mechanism?  Or should we toss
> that and start afresh?

I think this makes the most sense; personally, I'd start with protobuf
and gRPC, but that's me.

        - Dan C.

