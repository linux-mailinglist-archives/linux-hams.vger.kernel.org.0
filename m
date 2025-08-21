Return-Path: <linux-hams+bounces-577-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BDAB2EBFC
	for <lists+linux-hams@lfdr.de>; Thu, 21 Aug 2025 05:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69096A209B4
	for <lists+linux-hams@lfdr.de>; Thu, 21 Aug 2025 03:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6FB25A655;
	Thu, 21 Aug 2025 03:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b="ioDcxWm0"
X-Original-To: linux-hams@vger.kernel.org
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF6623B627;
	Thu, 21 Aug 2025 03:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755747210; cv=none; b=qi0HNdX6OQMBRfmMavRzzfsZ8lI5G0UqdB+BNAomvYrLgIkAs3X2dz4IXZbe5v8hmjNQe3hDyI+at3PFbyKqPlgo+tLqfz8FrxrRBblFqJAsdfhQoknd0AE4qLiuEKyaq1pM26dsanMPmw6BE4u967qDIXnmQZnHy3hhgNZ1X3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755747210; c=relaxed/simple;
	bh=WaD4SyykvecHRFYhHEWU1tycvPdcpJMpNhWcg88J00g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ef31yqk5VdQmouggZdTbfnp9cEUIVS6W3pDB0TNHnh/QX2TYGtDHyZZ7Fm1zwhFzVz5QpOkS/ozop3CrRBvj3jFmCqd8CqnrKRQGzF83mnoGmc2SM6d2vHmHCoh4LGmxLWi04o0cqjxNYR0PbOC4CmWWu1HWto8meeM0J6qrZuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b=ioDcxWm0; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.jp; i=@amazon.co.jp; q=dns/txt;
  s=amazoncorp2; t=1755747208; x=1787283208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WAr9KE4qh//VrC5EMHXIx5UXaXb+9qQ0MAe6NtPqRSg=;
  b=ioDcxWm0YoPuEq8uoiX8p7dQv7o9H4yJrgzVcf4pJNsv0uOYMFQjotw8
   THut5zidaFda8JHrR9fLvwA0JWNi90spiXjicgciKSnCkfuJZT+RkTAnt
   2QQlIal7beaf+DVxY3h/vvFK2t5nNqasJmXlEBqcff9Jd9TTAapeQorog
   /43roOv7/8pOdIhPDoPZ/XQsmP4PdD8ytbJRDbTTG7VA4vrfhrvN01hWG
   GZyeqeNnVXYCpe8OqOvIaCnfemtLW1zDCKCQvFRowx2VzPRm7cpMYZ3XU
   DfwHOfEx2QUyTWC1TOYG1m5G/Jn9kzOKVVEA9WW6tMUDjQmaOLc1SUhCC
   g==;
X-CSE-ConnectionGUID: NzXspl3sR6qZnM9QyAmwmg==
X-CSE-MsgGUID: rjRNutl8SIGbpwPnzlym1Q==
X-IronPort-AV: E=Sophos;i="6.17,306,1747699200"; 
   d="scan'208";a="1395644"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 03:33:28 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.7.35:8110]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.45.64:2525] with esmtp (Farcaster)
 id aa9240ab-990b-4ff6-8ae6-bafa39a186b9; Thu, 21 Aug 2025 03:33:28 +0000 (UTC)
X-Farcaster-Flow-ID: aa9240ab-990b-4ff6-8ae6-bafa39a186b9
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Thu, 21 Aug 2025 03:33:27 +0000
Received: from 80a9974c3af6.amazon.com (10.37.245.11) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Thu, 21 Aug 2025 03:33:25 +0000
From: Takamitsu Iwai <takamitz@amazon.co.jp>
To: <kuniyu@google.com>
CC: <davem@davemloft.net>, <edumazet@google.com>, <enjuk@amazon.com>,
	<horms@kernel.org>, <kuba@kernel.org>, <linux-hams@vger.kernel.org>,
	<mingo@kernel.org>, <netdev@vger.kernel.org>, <pabeni@redhat.com>,
	<takamitz@amazon.co.jp>, <tglx@linutronix.de>
Subject: Re: Re: [PATCH v1 net 2/3] net: rose: convert 'use' field to refcount_t
Date: Thu, 21 Aug 2025 12:33:17 +0900
Message-ID: <20250821033317.68056-1-takamitz@amazon.co.jp>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250821023822.2820797-1-kuniyu@google.com>
References: <20250821023822.2820797-1-kuniyu@google.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D040UWB001.ant.amazon.com (10.13.138.82) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

> On 2025/08/21, 11:38, "Kuniyuki Iwashima" <kuniyu@google.com <mailto:kuniyu@google.com>> wrote:
> From: Takamitsu Iwai <takamitz@amazon.co.jp <mailto:takamitz@amazon.co.jp>>
> Date: Thu, 21 Aug 2025 02:47:06 +0900
> > @@ -874,8 +874,6 @@ static int rose_connect(struct socket *sock, struct sockaddr *uaddr, int addr_le
> >
> > rose->state = ROSE_STATE_1;
> >
> > - rose->neighbour->use++;
> > -
> 
> 
> This is replaced by rose_neigh_hold() in rose_get_neigh(),
> then rose_neigh_put() needs to be placed in error paths in
> rose_connect() (and rose_route_frame()).

Thank you for reviewing my patch.

You are right and I have also confirmed that we need to place
rose_neigh_put in error paths to prevent reference count leaks.
I will check error paths and resubmit the updated patch.

> > rose_write_internal(sk, ROSE_CALL_REQUEST);
> > rose_start_heartbeat(sk);
> > rose_start_t1timer(sk);
> [...]
> > @@ -680,6 +679,7 @@ struct rose_neigh *rose_get_neigh(rose_address *addr, unsigned char *cause,
> > for (i = 0; i < node->count; i++) {
> > if (node->neighbour[i]->restarted) {
> > res = node->neighbour[i];
> > + rose_neigh_hold(node->neighbour[i]);
> > goto out;
> > }
> > }
> >

Sincerely
Takamitsu.

