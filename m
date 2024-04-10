Return-Path: <linux-hams+bounces-93-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFAF89E8D4
	for <lists+linux-hams@lfdr.de>; Wed, 10 Apr 2024 06:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63CFC287307
	for <lists+linux-hams@lfdr.de>; Wed, 10 Apr 2024 04:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985B6C133;
	Wed, 10 Apr 2024 04:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="hQgmdMPW"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp104.iad3a.emailsrvr.com (smtp104.iad3a.emailsrvr.com [173.203.187.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1017DBA50
	for <linux-hams@vger.kernel.org>; Wed, 10 Apr 2024 04:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.203.187.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712723213; cv=none; b=sL0NGo6m2BqJRurOclIZUIVdeafDcYyrdoTB6rIRmUgxrEl8L//grk3DKIUx16fHuqpi9oZUeWpBRuTbKSYI8Fa5l1tKPQanJeWDTe0eh/yWBB1YSrTMoS+K0sL4M7bbkDDyzjhDv1MPC1Zf9qEG+8Hav504JMcV1ELfrvbWynI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712723213; c=relaxed/simple;
	bh=y3XIxi0G3U9zErle0dnvBGj9GJKaqZwUwLibkq9ozdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBWVjcZGgmtXnK4uHvcUUlNxJg6YVFEm+i4sKoCKDywfweRCMXYlNJPJBDV3Wp5xN3Am0+lVlYk5fq0HejfIOaq8trniuutlISzqLUwH7SflgHeoJOLlG5m4s92WdbllbGzPDwL0RLJk51QcTj24dMz/KJCE66AGaeZ2IfYytfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=hQgmdMPW; arc=none smtp.client-ip=173.203.187.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1712712118;
	bh=y3XIxi0G3U9zErle0dnvBGj9GJKaqZwUwLibkq9ozdE=;
	h=From:Date:Subject:To:From;
	b=hQgmdMPWo4SwLKh+rooT2+kR9bh42xqM2JVYLNWGHLDMNxy4V0C9l8ZihC+30PtGK
	 Eun8+uqkMbZunGOQzA0oE8z9HJH2ZRGEYBBZGtAs3Aze8v9CISU8hhSJqzp74x7Bbz
	 7T4kePG8j/P4ybHrJ+e+dHE7GTuUaMZXK0BHLql8=
X-Auth-ID: lars@oddbit.com
Received: by smtp30.relay.iad3a.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 8AB546769
	for <linux-hams@vger.kernel.org>; Tue,  9 Apr 2024 21:21:58 -0400 (EDT)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-55b5a37acb6so1469102a12.0
        for <linux-hams@vger.kernel.org>; Tue, 09 Apr 2024 18:21:58 -0700 (PDT)
X-Gm-Message-State: AOJu0YwELeoz056zA3r3iuZMWCIa8JpAzioGkHhrn8mHwjJd/tVAcHeX
	0rEVN5XfyUsO3PLhvF2cBwoavsVh4xura5sbW/ItRhxZOLr+pYQtd0mGqzmro8XaBDZOt9YuP9a
	gGLmx5lm7h093wz+NL5iWU60kiUw=
X-Google-Smtp-Source: AGHT+IHnFML2EqrtUULIMMnoPCQ1QS6Z7PYn50zYGETmIIUaRtXuR+MsFrnS3hno/uLMd5zEFZ8Tpjxtr/FtNUQ7FOg=
X-Received: by 2002:a05:6a20:244f:b0:1a7:a645:a678 with SMTP id
 t15-20020a056a20244f00b001a7a645a678mr1594634pzc.5.1712712117994; Tue, 09 Apr
 2024 18:21:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+Q+rdzYUcfYF8CcX1WOWjVBYiZgidFAY1M0kR4J4KL73yN9yA@mail.gmail.com>
 <ec2c8d79-2efa-3607-7cb6-f57b46c7fdae@trinnet.net>
In-Reply-To: <ec2c8d79-2efa-3607-7cb6-f57b46c7fdae@trinnet.net>
From: Lars Kellogg-Stedman <lars@oddbit.com>
Date: Tue, 9 Apr 2024 21:21:45 -0400
X-Gmail-Original-Message-ID: <CA+Q+rdx7+CAOoCcC1tdDN78zV70ZJf2AcEV1qBGvXoMgHOGqcg@mail.gmail.com>
Message-ID: <CA+Q+rdx7+CAOoCcC1tdDN78zV70ZJf2AcEV1qBGvXoMgHOGqcg@mail.gmail.com>
Subject: Re: unregister_netdevice: waiting for ax0 to become free
To: linux-hams@trinnet.net
Cc: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Classification-ID: 8de8f11a-6e45-46d6-812e-e8be0813f28a-1-1

David,

Thanks for the reply; glad to know I'm in the right place.

> > I'm running a kernel built from 2c71fdf02a9, which includes the recent
> > use-after-free patch from Duoming Zhou in fd819ad3ec.
>
> Few questions:
>
>    - Which specific kernel version does that commit go into?

That's the head of `master` today; the Makefile builds 6.9.0-rc3.

>    - What distro and version of distro

This is Fedora 39.

>    - Which ax.25 lib/apps/tools are you using (distro provided,
> official, ve7fet, other) and which versions?

I'm using the distro-provided packages:

    [root@node1 ~]# rpm -qa '*ax25*'
    libax25-1.1.1-8.fc39.x86_64
    ax25-apps-2.0.0-10.fc39.x86_64
    ax25-tools-1.0.4-8.fc39.x86_64

Which appear to all come from https://github.com/ve7fet/linuxax25.git.

> The reality here is that unless you know exactly what commits have been
> applied to a specific vendor's kernel, the version number alone cannot tell
> you if the fix is present.

In case it wasn't clear from my last email, I'm running an upstream kernel for
exactly this reason.

> Here is a sample of my running list of issues:

Thanks; I'll take a look through those. I know I've come across a few of those
links before (in particular, I've seen
https://blog.habets.se/2021/11/AX25-user-space.html several times in
my search results).

> > website in the mailing list welcome message
> > (https://radio.linux.org.au/) appears to have gone away.
>
> Where did you see that?  That site has been gone for years and whatever
> is giving you that old link needs to be updated.

That's in the welcome message for this mailing list. I joined in Oct. 2023, so
not that long ago, and the welcome message (from majordomo@vger.kernel.org)
includes this information:

> Welcome to the linux-hams mailing list, hosted on vger.kernel.org.
> This is for discussions and development of Radio Amateur protocol
> and interface subsystems.
>
> Archives:
>   http://hes.iki.fi/archive/linux-hams/
>   http://www.spinics.net/lists/linux-hams/
>   http://marc.info/?l=linux-hams
> Broken archives:
>   http://groups.google.com/groups?group=mlist.linux.hams
>   http://www.geocrawler.com/lists/3/Linux/
> Ham software index for Linux:
>   http://radio.linux.org.au/

It looks like several of those links are broken.

> While I don't see why it isn't legal, I've never seen people use socat
> to link together kissttach'ed link.

socat is useful for this because it can automatically create symlinks to the
pty devices, so you have deterministic names you can use in your scripts (and
in any case it shouldn't break the kernel).

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks@{twitter, irc, github,
...} | N1LKS

