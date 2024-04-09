Return-Path: <linux-hams+bounces-91-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E4889E59A
	for <lists+linux-hams@lfdr.de>; Wed, 10 Apr 2024 00:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E41E8284059
	for <lists+linux-hams@lfdr.de>; Tue,  9 Apr 2024 22:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD718158D77;
	Tue,  9 Apr 2024 22:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="qZyGCs/p"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp90.ord1d.emailsrvr.com (smtp90.ord1d.emailsrvr.com [184.106.54.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B80315884B
	for <linux-hams@vger.kernel.org>; Tue,  9 Apr 2024 22:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712701309; cv=none; b=WYvastoE6FJxA+SyTZvR/yWZ4K0YGV6NKaCi/AHTyhta3j6G5gAd6PkAIxd0ogs5M23rJos2ugICkNpXYYsq8LG3Y8EqtyEXrnam+VGA7CO4Af5YiX6VwXlJYLwiBqn6ga61nz4/5R56ANOOH+f+DpvGtsdLZg4jm4W0s65rBak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712701309; c=relaxed/simple;
	bh=wEoaYxIIJ9CkVNb6/V3Mu82EVCYmfjk1mHjLhaV324Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=O84cJX7krhJ0WScoQfmqpkeUFKisAj7/8OH01tvSTO6DN4+oWaVIxuWM4sXeBAoe58tiVWroMfNUHsX95B3pZAnKDqULzGD/u54fo3WYYCmIC9Z/1P047CVsRP28OxQVq0zt0WYVuvzF6ZUdCRAwlCqUQ50kekp3wkJeQ45VXls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=qZyGCs/p; arc=none smtp.client-ip=184.106.54.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1712696753;
	bh=wEoaYxIIJ9CkVNb6/V3Mu82EVCYmfjk1mHjLhaV324Q=;
	h=From:Date:Subject:To:From;
	b=qZyGCs/pt50ESTP5629vIccM7VVE+1CYNui1i29aTTMTj9LD1bv7A2cq2k06ZiFK2
	 fMlTORF+8xn12Yz0PidOCNYwTrCkFFg4CS2+3CV31G3ZleUkId+I/dZKIHmhBeL7RE
	 fSAFL1YtwWMcRIYSE/tJccXolkqlSdAHtfKaEZHw=
X-Auth-ID: lars@oddbit.com
Received: by smtp20.relay.ord1d.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 0B061C03E8
	for <linux-hams@vger.kernel.org>; Tue,  9 Apr 2024 17:05:53 -0400 (EDT)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-58962bf3f89so1227813a12.0
        for <linux-hams@vger.kernel.org>; Tue, 09 Apr 2024 14:05:52 -0700 (PDT)
X-Gm-Message-State: AOJu0Yztbxv5lr8XkWOV9bhbAqNpVyfQJbhw19ydCZA9Uysc9qb8iPlC
	GG7S5BEj90VoM/VysMe+bnXj0b8hKhZonMPPA71u6XQQFi7g3rukQUdcufknhVphtjjr9J3ZBxg
	LZGr7wfcan44IMu/Czk48Fm7gsQc=
X-Google-Smtp-Source: AGHT+IE1d5750FbfG4is0aKG9uhWjTcqwsF/72EqoWeW8ozaRLvaZu5hhap21fklHF/RB54Jbjg2FqOYFMeWRunLc9s=
X-Received: by 2002:a17:90a:e604:b0:2a3:cf8:44ad with SMTP id
 j4-20020a17090ae60400b002a30cf844admr838700pjy.1.1712696752319; Tue, 09 Apr
 2024 14:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Lars Kellogg-Stedman <lars@oddbit.com>
Date: Tue, 9 Apr 2024 17:05:40 -0400
X-Gmail-Original-Message-ID: <CA+Q+rdzYUcfYF8CcX1WOWjVBYiZgidFAY1M0kR4J4KL73yN9yA@mail.gmail.com>
Message-ID: <CA+Q+rdzYUcfYF8CcX1WOWjVBYiZgidFAY1M0kR4J4KL73yN9yA@mail.gmail.com>
Subject: unregister_netdevice: waiting for ax0 to become free
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Classification-ID: da285f28-a6ba-4d69-882d-8d1e585d4ab5-1-1

First, apologies if this isn't the right place for this. I know this
is primarily a development list, but I'm trying to track down patches
for a kernel issue.

I'm running a kernel built from 2c71fdf02a9, which includes the recent
use-after-free patch from Duoming Zhou in fd819ad3ec. After bringing
up ax.25 (see below), If I make a single ax.25 connection to the host
(to an ax25d hosted service), it will subsequently fail to reboot; the
kernel gets stuck waiting for an ax.25 interface:

     3   [  217.717327] unregister_netdevice: waiting for ax0 to
become free. Usage count = 0
     2   [  227.957427] unregister_netdevice: waiting for ax0 to
become free. Usage count = 0

The kernel will get stuck here indefinitely (or until the watchdog
triggers). I know this isn't a new problem, but is it one for which
patches exist? There's a lot of older information out there, and the
website in the mailing list welcome message
(https://radio.linux.org.au/) appears to have gone away.

It looks there is a panic earlier in the shutdown process; the kernel
trace starts like this:

=== cut ===
[   32.072855] ------------[ cut here ]------------
[   32.074595] refcount_t: underflow; use-after-free.
[   32.075777] WARNING: CPU: 0 PID: 1354 at lib/refcount.c:28
refcount_warn_saturate+0xbe/0x110
[   32.077104] Modules linked in: mkiss ax25 ...
[   32.088624] CPU: 0 PID: 1354 Comm: socat Not tainted 6.9.0-rc3+ #3
=== cut ===

I'm running a test environment with a pair of AXUDP interfaces; I'm
configuring things like this:

=== cut ===
#!/bin/sh

mkdir -p /run/radio
socat \
        pty,link=/run/radio/ptyudp0 \
        pty,link=/run/radio/kissudp0 &
socat \
        pty,link=/run/radio/ptyudp1 \
        pty,link=/run/radio/kissudp1 &

while ! [ -c /run/radio/ptyudp0 ]; do sleep 1; done
while ! [ -c /run/radio/ptyudp1 ]; do sleep 1; done

ax25ipd -c /etc/ax25/ax25ipd-udp0.conf -d /run/radio/ptyudp0
ax25ipd -c /etc/ax25/ax25ipd-udp1.conf -d /run/radio/ptyudp1

kissattach -l $(readlink /run/radio/kissudp0) udp0
kissattach -l $(readlink /run/radio/kissudp1) udp1

kissparms -p udp0 -c 1
kissparms -p udp1 -c 1

ax25d -l
=== cut ===

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks@{twitter, irc, github,
...} | N1LKS

