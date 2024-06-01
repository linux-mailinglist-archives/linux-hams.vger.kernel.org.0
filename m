Return-Path: <linux-hams+bounces-354-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEBB8D6DD9
	for <lists+linux-hams@lfdr.de>; Sat,  1 Jun 2024 05:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5111D1C21783
	for <lists+linux-hams@lfdr.de>; Sat,  1 Jun 2024 03:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769A0A94B;
	Sat,  1 Jun 2024 03:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPcsRNQc"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1BA6FBE
	for <linux-hams@vger.kernel.org>; Sat,  1 Jun 2024 03:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717213558; cv=none; b=KuewBfZFmuVIhLqlSiAzXogdDKr4ua8/tWURtZ4ll8EDb0jFFt3bx55jEfiVcVKlDupzAzsSaGQDbcWc0y0VJuaTPNBDJpeDiQf+SKVVQu45oZMnQqtDTEsfPR4W2A72Y1UYxqkPKIWm+VyRCL/FWti724862GlxRmspdySnnhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717213558; c=relaxed/simple;
	bh=x8DvIoe/tIxRjLMunbnFeqmk97gILy9HThU8Ne+1qJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LjpvKCTH9JeC9qLTbF4dwJaHrzMrOWfN7occEuvU28AGsEfB7lsDZMMin7ulB3RkvN0JQj8iNkbjMoVmLU2ecZiSX7AqId9bwKhE1dR2FZXbBLkBjfbmI1Xl482Jh4mFQjgydgEMLrZGLD5z9n2vzdXNeqD8vjZH5dhcJPnEcA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPcsRNQc; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e974862b00so28860741fa.0
        for <linux-hams@vger.kernel.org>; Fri, 31 May 2024 20:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717213554; x=1717818354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhrBqj82UvsqTcUiZo7B8WX9t7q4Hkgp/GmqjHxpcTk=;
        b=EPcsRNQcRxMpQj4+eqd9co40BJh7jvda/QweQIL2sq7A5NcZ0czrS5XCY434doheuO
         uhMT/OwQL73HZ5PBU3rhoeVJCHsEP69dRzuNnJlCQBakLYe12r5D5z1gynRB427B2Txu
         JTJmdS8jCnZSih+FrV0JnH2qNKLz3kthnEdrnpse1aF7CEbzQqy4luwBcOjQzO9rWQDo
         t6XNn4WsNiLuI+JxVCX+8O3CWV/qpNGMHfwHAIj5E5X6D7GHrJICNWmvVea5FxPs6LIY
         pLgplQyU5wJz4pKkkE4sZcKhrU6+2Me5TXk3Sqzac9DSdqv4fHMWR/eizKkcxc4db3uB
         0NWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717213554; x=1717818354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhrBqj82UvsqTcUiZo7B8WX9t7q4Hkgp/GmqjHxpcTk=;
        b=q3R7d9E+ZJaPW3erWUteuCQ/QQcoObUafR+sT25gufLIOKc7BS7nmmGZVxi0GwbGVG
         A0J6nfeMmCYMr5iYjsdDHwLgsLTDg88Ya5xPc8f6Rn1HCrLWXYDjY72NJnyT7nCvFSRm
         HnYMxk4Bbqv6FmbAXrZyfiXpK5ntETe+YxZUbsw3qTJ9UZypnfkNpcGbtlqzwaaxGW+S
         8TYV1bY0peVPo6O80FzQhcPCli25Sym0JooitSxDWI7gdTVyKdZ+M5RWC4fwGJ6HEnri
         4KQaDllCYt9DbxEKo4q5EeZpTANIF/hem2hrt1dzLtvhzR0WQi82lq4/5P6R+T0oMJol
         fXeA==
X-Gm-Message-State: AOJu0YzO7bfkhTUkeVmggR4zcDF/AvZegng44sD3UHv1Yd5ORMOfeyd9
	Mebz9PnBvaAgUjn0x2Khvs0EZiESMp8Gc1V5nAXM/BREYtFWCz5bV++JPWJvlBQxnE3H6YKVO23
	wjtHu0A5Fhny8r9S6+kEP/pXU5yvSwXI+
X-Google-Smtp-Source: AGHT+IH5R1CbyLClBTc13vt0P+I5qwLg6sJicQspxe1VVGYUmT6IhQGisWupSBeFtqVygrcfnBM9IoOPi+ppe70i9B4=
X-Received: by 2002:a05:651c:d:b0:2ea:807e:1d9f with SMTP id
 38308e7fff4ca-2ea950bfe98mr26633201fa.10.1717213554202; Fri, 31 May 2024
 20:45:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5ev7x3gcf5sk53svnu7q2lfa2d3et4wy5luy43jz5wwaybmyzl@ztgjeqitelbv>
In-Reply-To: <5ev7x3gcf5sk53svnu7q2lfa2d3et4wy5luy43jz5wwaybmyzl@ztgjeqitelbv>
From: Dan Cross <crossd@gmail.com>
Date: Fri, 31 May 2024 23:45:17 -0400
Message-ID: <CAEoi9W6WkbdRKjtaXAqD7UiJhibgwdz2DuY24ryc+vx3EhcuQA@mail.gmail.com>
Subject: Re: What is the "heartbeat" timer for?
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: linux-hams <linux-hams@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 10:27=E2=80=AFPM Lars Kellogg-Stedman <lars@oddbit.=
com> wrote:
> After an ax25 connection closes, there is a period of approximately 5
> seconds during which no new connection can be established to the same
> listening callsign.

I wonder: is that to the same callsign from any other callsign, or
only from the same callsign that just disconnected?

> For example, if I have a listener and I make a connection to it
> once/second, like this:
>
>     t_start=3D$SECONDS
>
>     for _ in {1..10}; do
>             echo -n "$((SECONDS-t_start)): "
>             timeout 1 call -SRr udp1 host0 && sleep 1
>     done
>
> We see output like this:
>
> 0: HELLO AX.25 CALLER
> 1: Terminated
> 2: Terminated
> 3: Terminated
> 4: Terminated
> 5: Terminated
> 6: HELLO AX.25 CALLER
> 7: Terminated
> 8: Terminated
> 9: Terminated
>
> This happens because once closed, a socket hangs around until the
> heartbeat timer expires, and then in ax25_std_heartbeat_expiry() we
> finally call ax25_destroy_socket(), which permits new connections.
>
> Is there a reason for this behavior? Since the remote has already sent a
> DISC packet we don't expect any additional packets on this connection.
> I'm not clear on what this timer is for or why we don't simply destroy
> the socket immediately upon receiving a DISC packet.

So if a TNC receives the "DISC" command, it's supposed to respond with
a UA frame and "enter the disconnected state" (AX.25 2.2-Jul-98, sec
6.3.4: "Link Disconnection"). My guess is that the behavior you're
observing is to account for uncertainty about whether the UA was
received; 6.3.4 continues by saying that, "if a UA or DM response is
not correctly received before T1 times out, the DISC frame is sent
again and T1 is restarted." (this can happen up to "N2" times). That
is, the distant end _may_ send more than one DISC, if it never
receives the UA (or a DM).

6.3.5 seems to suggest that what you're seeing is ok: "In the
disconnected state, a TNC may .... refuse the SABM(E) and send a DM
instead."

        - Dan C.

