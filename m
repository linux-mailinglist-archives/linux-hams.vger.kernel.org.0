Return-Path: <linux-hams+bounces-530-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF185AE83C6
	for <lists+linux-hams@lfdr.de>; Wed, 25 Jun 2025 15:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6DF54A4DD9
	for <lists+linux-hams@lfdr.de>; Wed, 25 Jun 2025 13:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B44E2627E7;
	Wed, 25 Jun 2025 13:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="RdIbYLee"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BBF25FA07;
	Wed, 25 Jun 2025 13:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.95.49.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856914; cv=none; b=ikropYOQUCQr4+ZUU6rONst5okSURJZwqKtWqPSqoEL5HynCwz6nCVTkBF/b9UiKdK2UmW2r2vrVcWwkBLFJGay/dqz+0VJtumcUmGZw6reONAJUpdDnl5EXgVHBxcikqg00j/60p6WQJiFC7n1x9wZ0c79hXzIiRIu29ZHh9q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856914; c=relaxed/simple;
	bh=ckR8IBywSJAzVg0G+yvJBnuVyZ7iOpxcMnVwhxpwAQQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PzbS9/MoascnuO0kofzUdPvGQiuGYys8F64So8tS2vMMvJ+Gv8zUBqBhd6w4vcxNwvZmuo+GgLw02xGtwe7ioGLQdcL8l9qcDfT4C249LneC/jEiYICWyl7I5QbBTxw8uCw43Bthi9vHz6io+mv0pzTcGQl1HoWzVqeWWIzMd+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=RdIbYLee; arc=none smtp.client-ip=52.95.49.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1750856913; x=1782392913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S87KBg+qfzIgx7TDyEU1dt7wrtq1iR8hsvXkWqIdvVo=;
  b=RdIbYLeeuUOqeqwU5DuUA9KiEUkLFkMWHooNMMvDsHmYQ3L4dK2Bmp4O
   u13P/aKCZjdeXRN0d2/XDExTbYNYHcztRyToDWBz2qa4kzPRecmbn4iLv
   PTaG7YwZJTE/9J93DGXk3FclJNxHw0+Xlp+GpT3st8edOYrSvZFe8TbXb
   UfZnLq1AwShz5dUd2Qndc/MgylT5EtNRhMCCt8h39u/Vb5OIfFgGykBHR
   FoDLgP75jnrk2o2E2SHaHWth3+9fljy+YVoOJt/iKLohKCkdKwUEB+l55
   Dx03ZsPJDpYao9whIVqq4UIXE0Sfj2a7gDerslfC09Ey6889Tnt/c01E+
   w==;
X-IronPort-AV: E=Sophos;i="6.16,264,1744070400"; 
   d="scan'208";a="513329811"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 13:08:28 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:50610]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.18:2525] with esmtp (Farcaster)
 id 3627d9cc-9784-47b2-9bff-7c85d80713a1; Wed, 25 Jun 2025 13:08:27 +0000 (UTC)
X-Farcaster-Flow-ID: 3627d9cc-9784-47b2-9bff-7c85d80713a1
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 25 Jun 2025 13:08:26 +0000
Received: from b0be8375a521.amazon.com (10.37.244.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 25 Jun 2025 13:08:24 +0000
From: Kohei Enju <enjuk@amazon.com>
To: <enjuk@amazon.com>
CC: <davem@davemloft.net>, <edumazet@google.com>, <horms@kernel.org>,
	<kohei.enju@gmail.com>, <kuba@kernel.org>, <kuniyu@google.com>,
	<linux-hams@vger.kernel.org>, <mingo@kernel.org>, <netdev@vger.kernel.org>,
	<pabeni@redhat.com>, <syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com>,
	<tglx@linutronix.de>
Subject: Re: [PATCH net v1] rose: fix dangling neighbour pointers in rose_rt_device_down()
Date: Wed, 25 Jun 2025 22:06:05 +0900
Message-ID: <20250625130815.19631-1-enjuk@amazon.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250625095005.66148-2-enjuk@amazon.com>
References: <20250625095005.66148-2-enjuk@amazon.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D037UWC004.ant.amazon.com (10.13.139.254) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

The example ([Senario2] below) in the commit message was incorrect. 
Correctly, UAF will happen in the [Senario1] below.

Let me clarify those senarios.

When the entries to be removed (A) are consecutive, the second A is not 
checked, leading to UAF.
[Senario1]
    (A, A, B) with count=3
    i=0: 
         (A, A, B) -> (A, B) with count=2
          ^ checked
    i=1: 
         (A, B) -> (A, B) with count=2
             ^ checked (B, not A!)
    i=2: (doesn't occur because i < count is false)
    ===> A remains with count=2 although A was freed, so UAF will happen.


When the entries to be removed (A) are not consecutive, all A entries are 
removed luckily.
[Senario2]
    (A, B, A) with count=3
    i=0: 
         (A, B, A) -> (B, A) with count=2
          ^ checked
    i=1: 
         (B, A) -> (B) with count=1
             ^ checked (A, not B)
    i=2: (doesn't occur because i < count is false)
    ===> No A remains. No UAF in this case.

Although, even in the senario2, the fundamental issue remains 
because B is never checked.
The fix addresses issues by preventing unintended skips.

Please let me know if I'm overlooking something or my understanding is 
incorrect. 
Thanks!

