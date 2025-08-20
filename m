Return-Path: <linux-hams+bounces-570-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5B5B2E45A
	for <lists+linux-hams@lfdr.de>; Wed, 20 Aug 2025 19:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D1C45E2560
	for <lists+linux-hams@lfdr.de>; Wed, 20 Aug 2025 17:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22509272E54;
	Wed, 20 Aug 2025 17:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b="mz5wXaVb"
X-Original-To: linux-hams@vger.kernel.org
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C4026F47D;
	Wed, 20 Aug 2025 17:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.218.115.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755712135; cv=none; b=p6QW7kXhGpj3kmdv1xdOevwqs2joszAWZoJcmj5TFTdYduliPjVpaFcDqV1t2AKu7g2HIRFZ0dQCApLK+yUpmd0fe6GuQKJgcTeUo7DQyutYVOPAPt1Dv2XT+wLkdVJoLotiuCVJYxKwTnHay5kE+0eSbp+x7aMJz7YSm9NGd/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755712135; c=relaxed/simple;
	bh=kkScRaud26SHGi3/OFVpr58HnYHVIXt/jbYPvD/g10M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LuiipakCzY+tWCOjOHca8FWz1jga8crv7ef/WNMGepy0mEbILv7741zkhvZgoXB/qiV+Fc5I3xDOs8Z69RXs5YPlU+WuyFqw9oAiZKZZDCy22nmqD5NGGyPqwQLXdHuvkfsiznzoVXi6I4dzxKvoVCkX4hQT6WfP4oddR+stWgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b=mz5wXaVb; arc=none smtp.client-ip=34.218.115.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.jp; i=@amazon.co.jp; q=dns/txt;
  s=amazoncorp2; t=1755712134; x=1787248134;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UoUcTpQ4utUqgNXhSEmNmAjzHigQIf4Z8uwFGdcBoi8=;
  b=mz5wXaVbKmMUSCxLyavn4UX/4EInnPGUJMJzlSdyMEte/2VfLTe0RCSe
   /KlxPNVvR9bR93L+obKxuqIrCUgbqio4nGKJGtMB8Yko/HP/IpAVqSXta
   WTpbpjrvYnYAXuf4sbRvTc426DFw0GWCYPbDPz6lDYtM9hVtWnuDrVt8l
   WuZAuU0HVBZtxWLbFVo17u8bDI/xeFUwjExF0xZR2Ze6X+/asjOzwid70
   HS1rl7/f1H9q2OPU2l0COf1nWeVm1f1PSc+5GivYT3WmQfIj/284cz1aH
   Amk0gsyo4bgm9qyIHhnWhpHkFzk+iNoqcqiem5Qg3z+hQS9kXpUMtypvM
   Q==;
X-CSE-ConnectionGUID: TY+haj4hTi+dSMKzbLFhHA==
X-CSE-MsgGUID: INB0usCMRgaQ1pbLDjuCRQ==
X-IronPort-AV: E=Sophos;i="6.17,306,1747699200"; 
   d="scan'208";a="1334716"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:48:53 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.21.151:33123]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.52.244:2525] with esmtp (Farcaster)
 id bbd12ca2-9311-426f-846f-7168f90230ca; Wed, 20 Aug 2025 17:48:53 +0000 (UTC)
X-Farcaster-Flow-ID: bbd12ca2-9311-426f-846f-7168f90230ca
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Wed, 20 Aug 2025 17:48:51 +0000
Received: from 80a9974c3af6.amazon.com (10.37.244.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Wed, 20 Aug 2025 17:48:49 +0000
From: Takamitsu Iwai <takamitz@amazon.co.jp>
To: <linux-hams@vger.kernel.org>, <netdev@vger.kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Takamitsu Iwai
	<takamitz@amazon.co.jp>, Kohei Enju <enjuk@amazon.com>, Ingo Molnar
	<mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v1 net 0/3] net: rose: introduce refcount_t for reference counting of rose_neigh
Date: Thu, 21 Aug 2025 02:47:04 +0900
Message-ID: <20250820174707.83372-1-takamitz@amazon.co.jp>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

The current implementation of rose_neigh uses 'use' and 'count' field of
type unsigned short as a reference count. This approach lacks atomicity,
leading to potential race conditions. As a result, syzbot has reported
slab-use-after-free errors due to unintended removals.

This series introduces refcount_t for reference counting to ensure
atomicity and prevent race conditions. The patches are structured as
follows:

1. Refactor rose_remove_neigh() to separate removal and freeing operations
2. Convert 'use' field to refcount_t for appropriate reference counting
3. Include references from rose_node to 'use' field

These changes should resolve the reported slab-use-after-free issues and
improve the overall stability of the ROSE network layer.

Takamitsu Iwai (3):
  net: rose: split remove and free operations in rose_remove_neigh()
  net: rose: convert 'use' field to refcount_t
  net: rose: include node references in rose_neigh refcount

 include/net/rose.h    | 18 +++++++++++++-
 net/rose/af_rose.c    | 10 ++++----
 net/rose/rose_in.c    | 12 +++++-----
 net/rose/rose_route.c | 55 ++++++++++++++++++++++++++-----------------
 net/rose/rose_timer.c |  2 +-
 5 files changed, 61 insertions(+), 36 deletions(-)

-- 
2.39.5 (Apple Git-154)


