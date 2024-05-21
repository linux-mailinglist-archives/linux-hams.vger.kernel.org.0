Return-Path: <linux-hams+bounces-283-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E93E88CAD87
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 13:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 121B11C21C33
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 11:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D69857CB2;
	Tue, 21 May 2024 11:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="CIr3f940"
X-Original-To: linux-hams@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CC147A74
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716292090; cv=none; b=m5KA+bIV1wTWZP4VIwLfNQNG5KELgzmJ7MlAs5QsF4VvU8mbomgYoA8RWUe7BJaswXj0AcAVDn/nPZ4rMgZV5H991vceMh9caYo96Dg1TTEeEfxIrzukXbD7Oyjy3WtlLQjvRuHvdJdnLw7sjuEHpBv+BSXmXHeLtP2FXTsobCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716292090; c=relaxed/simple;
	bh=sRvHQdaoL4HzqnyTUGKlHAmifCh6RB/oD814KwauDz0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=ins6NzBuAMiioGzS4ayDlWpgyW6G+I+by+xLshFdK0YCscHFHd4KvvzYDoSXjsZEWrWHOfJcFVj3lek/MY11l+dUlB6qicOr6w35lRc7xDO/6ls6tXfPey+u6sgUzG0QNtjV++sA4B2wEy6RFP6zVjEMsoiB2WPC7JGnZ+FpJpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=CIr3f940; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:Subject:Cc:To:From:Date:References:In-Reply-To:Message-Id:MIME-Version:
	Reply-To:Content-ID:Content-Description;
	bh=DXHxI8vLFnLaqEXIYfNqZ0jYy6m1J0CanBK8ZWH3AH0=; b=CIr3f940Rb4F1YqxYaw9Whlq3c
	6/k/grFhKPQmMDvjPW3T1c6lTYRWuEOg3xvMvrVzzJ8MgKOXunjykyGABDNWRt+bQHW9tpEPN/FB7
	Ge16YDBvYgUvQHKbkuenewSkTclJwzhsPJBY4w9x/4OA0ex8iobUVM8otC1GAABsLS0u5bQLjjrTi
	wWndMQ286SgSfTMtH+qjsV7LjYp588CXj/PC070GBJcPmOoDuixK0Ylfv4hH+wt7egcMpMNYTC0ha
	/LpJKJ+HhymwPsYWmhEzNXffFqMoQ6QQAckcMGL7zczjS4QgRNP3ShkLh3mnZz7wYv7SXAUMNqVLM
	XGCbwkfQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <hibby@debian.org>)
	id 1s9NyH-00CxNe-SY; Tue, 21 May 2024 11:47:58 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfauth.nyi.internal (Postfix) with ESMTP id DB1DD1200066;
	Tue, 21 May 2024 07:47:53 -0400 (EDT)
Received: from imap53 ([10.202.2.103])
  by compute1.internal (MEProxy); Tue, 21 May 2024 07:47:53 -0400
X-ME-Sender: <xms:6YlMZnLUXwec91dz5l1BaEht0DO6z-yaEOZrlnKBYVfWpBK_pN6_Eg>
    <xme:6YlMZrL8uTk4GlU9nuoRPQxgont_kD4y_dqVv3rM7GchAWvq0I8ccQbiFP8r2jDcN
    hpykFw41B-YfSxE9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeivddggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdff
    rghvvgcujfhisggsvghrugdfuceohhhisggshiesuggvsghirghnrdhorhhgqeenucggtf
    frrghtthgvrhhnpeffhfehiedtveeiveekffdvueejgfevgeeijedufeekheevteefueek
    ieeutedvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpeguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqddugeehtdduhedvjedv
    qdduieeffeelfeekhedqhhhisggshieppeguvggsihgrnhdrohhrghesvhgvhhhisggsvg
    hrugdrtghomh
X-ME-Proxy: <xmx:6YlMZvvbsPQJG_L48dTd5LVWZ6nCuuL15qB3gWfLk7o47K33bM0nWg>
    <xmx:6YlMZgaYOM-5WNx54Js9Z_THsCejSAy5TATqtL46lHsIe58bMqc7Rg>
    <xmx:6YlMZubieamehy7j9ARnFq-UMiTkw3djxVliBF2IJZjtKiyFNFOXSQ>
    <xmx:6YlMZkDcrstTUPL3R8DXHUfOcnbSLjqupYTEzBEfmOLwB-SxXl-s9g>
    <xmx:6YlMZsbY8tDLcQtCvyCToeUee0CqUc94PHpBlrV37cwVQvMtmGdIXz9X>
Feedback-ID: if431490a:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 85413364006F; Tue, 21 May 2024 07:47:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-480-g515a2f54a-fm-20240515.001-g515a2f54
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <a0890c99-0f42-44bb-b1f3-cdc66efdad50@app.fastmail.com>
In-Reply-To: 
 <CANnsUMF=ywvcmfLjXdz_hWLSo5jC2Z0K7Qe4Pcv7j3dr6K99Jg@mail.gmail.com>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn>
 <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
 <CAEoi9W7LN5MQPGKXZJOdtcaXvyK4PPU9yW7HWOBdq1AP3Fs7nA@mail.gmail.com>
 <CANnsUMF=ywvcmfLjXdz_hWLSo5jC2Z0K7Qe4Pcv7j3dr6K99Jg@mail.gmail.com>
Date: Tue, 21 May 2024 12:47:30 +0100
From: "Dave Hibberd" <hibby@debian.org>
To: "Chris Maness" <christopher.maness@gmail.com>,
 "Dan Cross" <crossd@gmail.com>
Cc: "Lars Kellogg-Stedman" <lars@oddbit.com>,
 "Duoming Zhou" <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
 dan.carpenter@linaro.org
Subject: Re: Kernel 6.9.1 AX.25 Crash
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Debian-User: hibby

Can you use other libax25 dependent packages or is it only Uronode?

axcall for netrom would be a reasonable starter to see if it's a libax25=
 problem or not.=20

LinFBB, from what I remember, uses its own internal state machine/etc on=
ce it's bound to the socket.

Cheers,

--=20
  Hibby
  Debian Developer
  Packet Radioist
  MM0RFN

On Tue, 21 May 2024, at 4:07 AM, Chris Maness wrote:
> Ok, the only thing not working so far is UROnode in this system.  I am
> thinking it needs to be updated to the newer kernel.  I am getting:
>
> ERROR; connect_to: bind: Cannot assign requested address
>
> When I try to connect to a NETROM node from UROnode (AX.25 only works =
tho).
>
> I can connect from LinFBB with NETROM directly to other nodes using my
> NETROM port in LinFBB.
>
> -Chris KQ6UP
>
>
> On Mon, May 20, 2024 at 7:12=E2=80=AFPM Dan Cross <crossd@gmail.com> w=
rote:
>>
>> On Mon, May 20, 2024 at 9:06=E2=80=AFPM Lars Kellogg-Stedman <lars@od=
dbit.com> wrote:
>> > On Mon, May 20, 2024 at 05:11:39PM GMT, Chris Maness wrote:
>> > > Your patch seems to have fixed the issue so far.
>> >
>> > That's great! I'm glad it helped.
>> >
>> > > How come this patch is not included in the mainline source?
>> >
>> > Well, partly because you're the first person to confirm that it wor=
ks
>> > for someone besides me :). Dan (Cross) has offered to test it out as
>> > well; if I can get a couple of confirmations that it's working, I'll
>> > probably go ahead and submit it to netdev.
>>
>> I am running this as of today, and so far so good.
>>
>> > The bigger issue has been that there are very few people interested=
 in
>> > the ax.25 support in the kernel; there's not a real maintainer, so =
it's
>> > difficult to get code approved. There were some concerns expressed =
that
>> > maybe this isn't the *correct* fix, but I would argue that even if =
it's
>> > not the most correct fix we should try to get it in anyway, since
>> > otherwise ax.25 is completely broken.
>>
>> Agreed: what's there now is objectively broken. Please, let's not let
>> the perfect be the enemy of the good here.
>>
>>         - Dan C.
>
>
>
> --=20
> Thanks,
> Chris Maness

