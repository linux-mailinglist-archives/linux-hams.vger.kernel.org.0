Return-Path: <linux-hams+bounces-582-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15476B327D2
	for <lists+linux-hams@lfdr.de>; Sat, 23 Aug 2025 11:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 412DC588C3B
	for <lists+linux-hams@lfdr.de>; Sat, 23 Aug 2025 09:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5E724113C;
	Sat, 23 Aug 2025 09:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b="dMdJZJMA"
X-Original-To: linux-hams@vger.kernel.org
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978F923F41F;
	Sat, 23 Aug 2025 09:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755939626; cv=none; b=Uo92r9uRMGEr0Ppgue8g5bdK1HgS8XVxS2L4uQbgWOR5M6nHTJBya7nhFFtbXW0n0Q9zHmsXqBUCt98uwT8wr1tClptmZrdxM4eWkY7OqD6VABYlV7xnYm2GRVpgiGhgNqvLQrkIf78lHMUvEW+FjTx3vY7An6g7WNOCyY4YyDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755939626; c=relaxed/simple;
	bh=+JgLOk8/+MuHf4uL4nfhRfQ9Jpyb9aAZaDNs+SG5BOE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fXxl1DRCkyD9d6a8mxhVBfgHPtuz6/OT+5FO+V+DB2kwe20Yj/lvjKW975/cTmbeRlf3i24G0y7fTU4GgL/RgyRq0USMXWZ3ptacIEvDh8W8+KuquEBb4qq2FKpXDAhg9qZqt3z8Uw0NJP2WW1+mYwMMKZ8q7uafRwh0U+FGXNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b=dMdJZJMA; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.jp; i=@amazon.co.jp; q=dns/txt;
  s=amazoncorp2; t=1755939624; x=1787475624;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SxqQSM2gbb1WZoRn7Ppxjmyk+XMelBVrSvSiL1PRpwk=;
  b=dMdJZJMAXNOrvOBLKM8eaigPru+oaH1Ws/yI10pCVEeaJrRL16Ve+jr6
   6WU0R3jEkayb6HDpU0hZGem+8tZj9jlgIjmcTVuZp2EgcZqHNVFRac+Rd
   ij9MO35Ke+VHEVN94zQHAdIyucecyZ9fGtigXzmFYm3LvTGnjG9t+x4th
   3eq+dGVO40yfDPMWCnekgaHAzuF+XSleoQNHh0KbjFZ/L+t8CqaoZM0NX
   v+Quk8A4uOOWdtFJ6jxDo1j5Cymyi8Q8kPPOUxjtGOnp7U/eVYO29j0cy
   mgp/Oc7MvLpGqGMw8DrAKUMzdOkA03G3Y0R+2KwxWs8JTO2TNKkuTZSqP
   w==;
X-CSE-ConnectionGUID: h1Qm+bWOTpKk3a21IJmQnQ==
X-CSE-MsgGUID: 3wWwBZOnTFyeGBUFigUv6w==
X-IronPort-AV: E=Sophos;i="6.17,312,1747699200"; 
   d="scan'208";a="1546914"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 09:00:24 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:16633]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.153:2525] with esmtp (Farcaster)
 id 3f0a882d-72d6-4f2d-8c62-145d317c28a1; Sat, 23 Aug 2025 09:00:23 +0000 (UTC)
X-Farcaster-Flow-ID: 3f0a882d-72d6-4f2d-8c62-145d317c28a1
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Sat, 23 Aug 2025 09:00:23 +0000
Received: from 80a9974c3af6.amazon.com (10.37.244.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Sat, 23 Aug 2025 09:00:21 +0000
From: Takamitsu Iwai <takamitz@amazon.co.jp>
To: <linux-hams@vger.kernel.org>, <netdev@vger.kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Takamitsu Iwai
	<takamitz@amazon.co.jp>, Kohei Enju <enjuk@amazon.com>, Ingo Molnar
	<mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Jesper Dangaard
 Brouer" <hawk@kernel.org>, Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH v2 net 0/3] Introduce refcount_t for reference counting of rose_neigh
Date: Sat, 23 Aug 2025 17:58:54 +0900
Message-ID: <20250823085857.47674-1-takamitz@amazon.co.jp>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D037UWB002.ant.amazon.com (10.13.138.121) To
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

Changes:
 v2:
  - Added rose_neigh_put() in error paths of rose_connect() to prevent
    reference count leaks that could occur after moving the reference
    count increment to rose_get_neigh().
  - Added rose_neigh_put() at the end of rose_route_frame() to properly
    release the temporary reference held by new_neigh variable when
    the function completes.
  - Added rose_neigh_hold() in the second for loop of rose_get_neigh()
    to maintain consistent reference counting behavior between both loops.

  v1:
    https://lore.kernel.org/all/20250820174707.83372-1-takamitz@amazon.co.jp/


Takamitsu Iwai (3):
  net: rose: split remove and free operations in rose_remove_neigh()
  net: rose: convert 'use' field to refcount_t
  net: rose: include node references in rose_neigh refcount

 include/net/rose.h    | 18 ++++++++++++-
 net/rose/af_rose.c    | 13 ++++-----
 net/rose/rose_in.c    | 12 ++++-----
 net/rose/rose_route.c | 62 ++++++++++++++++++++++++++-----------------
 net/rose/rose_timer.c |  2 +-
 5 files changed, 69 insertions(+), 38 deletions(-)

-- 
2.39.5 (Apple Git-154)


