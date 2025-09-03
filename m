Return-Path: <linux-hams+bounces-621-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B84B41CBA
	for <lists+linux-hams@lfdr.de>; Wed,  3 Sep 2025 13:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DE6E681F5E
	for <lists+linux-hams@lfdr.de>; Wed,  3 Sep 2025 11:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C2F2F60C4;
	Wed,  3 Sep 2025 11:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b="NBL+XYBG"
X-Original-To: linux-hams@vger.kernel.org
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A842F6166;
	Wed,  3 Sep 2025 11:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756897679; cv=none; b=TEzC/dqm5V+dVb0MwH/0KYSJl8d5cmvcV2rGEWz5v6AAkQq5H6HNLeg/OumKyJhd4FygMwviUP2jrr2AJO2Pdom1rvmqhUprEZOVTIOjm+NGjatWKe2aB/ugfLcGHQIKqT3mYE3fD43GvUAlDTLG7ZSHY0S8bGNv2ZtOcDxKF7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756897679; c=relaxed/simple;
	bh=HPaFg8ZY5Rj5RPMys+5vqtSyj9Ovoxw+gN+hlJfB4jM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h+iOI9M9oi8AbVIq+sDpe819NGKLZcZlXm50ncksFEM+ds5+hfuUNF9GHB8D5TScfRLiF6Kvr76yXv0novdcenjwj2C5U7wxiLZvrsPqjsKCOSeo1NEIONcsxGVMWXikgkH/4IMtx3LmQGpfdjfrezVY1WQpj0+buMA83+YInno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b=NBL+XYBG; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.jp; i=@amazon.co.jp; q=dns/txt;
  s=amazoncorp2; t=1756897677; x=1788433677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HPaFg8ZY5Rj5RPMys+5vqtSyj9Ovoxw+gN+hlJfB4jM=;
  b=NBL+XYBGdinOaPW72ICZxpi7bJNttViMBgXQ8lk5IrAmvr/FCs1DvzqY
   WYobIM+J0QFd44yv6I/16i5xzVN9uLSCVT5JaHT+WqWysbVbYmlq4nB0g
   wW2N3Q61Zgem68ipos/lTNnnh57Fj87fS0oMjfihhy6qG2T32HykngZNm
   ISQL02+tlcAK+S8npHxIpWWjQf7kNAn/3SsBE4YMeSfdq7FFJzIZyWPXp
   GZgKJ8TMtmQinVrysKpRu+mTQ4Cw/pSotzlA9ilCfizcCsvv1phbstKf8
   v78MUi+tvI2Wm4kCUEQ5bQMw39wp9pwYhXeHOjV5r/6zoxJ9x6DYi0hZO
   A==;
X-CSE-ConnectionGUID: R+VbnSX1Q/yb/APm5W4/ZQ==
X-CSE-MsgGUID: cXHo7KbLQKyZKfW0XydoSw==
X-IronPort-AV: E=Sophos;i="6.16,202,1744070400"; 
   d="scan'208";a="2293281"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 11:07:56 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.38.20:61367]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.63.19:2525] with esmtp (Farcaster)
 id 4b3c28d0-7ee5-4af9-8cc0-2a497b8fc856; Wed, 3 Sep 2025 11:07:56 +0000 (UTC)
X-Farcaster-Flow-ID: 4b3c28d0-7ee5-4af9-8cc0-2a497b8fc856
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Wed, 3 Sep 2025 11:07:56 +0000
Received: from 80a9974c3af6.amazon.com (10.37.244.13) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Wed, 3 Sep 2025 11:07:54 +0000
From: Takamitsu Iwai <takamitz@amazon.co.jp>
To: <f6bvp@free.fr>
CC: <bernard.pidoux@free.fr>, <edumazet@google.com>,
	<linux-hams@vger.kernel.org>, <netdev@vger.kernel.org>,
	<takamitz@amazon.co.jp>
Subject: Re: Re: [BUG] [ROSE] slab-use-after-free in lock_timer_base
Date: Wed, 3 Sep 2025 20:07:38 +0900
Message-ID: <20250903110738.72440-1-takamitz@amazon.co.jp>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <5adc15fe-8a65-4954-8719-76ed6a132b45@free.fr>
References: <5adc15fe-8a65-4954-8719-76ed6a132b45@free.fr>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D039UWB002.ant.amazon.com (10.13.138.79) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)


Thank you for your reach out, and I'm sorry for the inconvenience
caused by my patch.

I have confirmed that the syzbot report outputs following error.

> ODEBUG: free active (active state 0) object: ffff88804fb25890 object
> type: timer_list hint: rose_t0timer_expiry+0x0/0x150

It seems neigh->t0timer is removed at rose_timer_expiry() when refcount
of rose_neigh becomes 0 even if neigh->t0timer is still alive.

> rose_neigh_put include/net/rose.h:166 [inline]
> rose_timer_expiry+0x53f/0x630 net/rose/rose_timer.c:183

I guess the error you show in this thread is also related to this issue
because the UAF occurs at deleting the timer in rose_remove_neigh().

> [50355.077644] timer_delete_sync (kernel/time/timer.c:1676)
> [50355.077653] rose_remove_neigh (net/rose/rose_route.c:237) rose

I'm not confident, but the aid I can think of now is to increment the
refcount of rose_neigh before setting t0timer or stop t0timer before
freeing at rose_timer_expiry().

Currently, rose_t0timer_expiry() is set to neigh->t0timer at
rose_start_t0timer(), and it is called in rose_transmit_link() firstly.
It seems that refcount is not incremented this paths.

I'm investigating the code paths where we need to increment refcount
exactly, but I'm sorry I'm struggling for tracing the reference count
around timer precisely.

If you have a reproducing steps which can be done in a virtual
environment, I'll try it out too.



Sincerely,
Takamitsu

