Return-Path: <linux-hams+bounces-724-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A70CDCA2ECB
	for <lists+linux-hams@lfdr.de>; Thu, 04 Dec 2025 10:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE0A530A0318
	for <lists+linux-hams@lfdr.de>; Thu,  4 Dec 2025 09:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB3433439D;
	Thu,  4 Dec 2025 09:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eVAYf5ER"
X-Original-To: linux-hams@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08DF30749E;
	Thu,  4 Dec 2025 09:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839359; cv=none; b=TV+3gIduRw475WdXsI92ZynCC30ZfTRhKif2Ooo/PnzmsoB63wNith40k2MHVnhvIFJTOjKdWcjSobWepbwDpEmYwQSMjGy6QFcGAExqK6eYTwcf+0AcdRk2Ao/2u91HhaAJG37RnDmQ5W6gGSCnlALP04D6Xqj5utScRqnl+r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839359; c=relaxed/simple;
	bh=ceVTwUwv7SOgVYfzDyF4kbX79Mjy/d2SAjUpMvlvoGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f4/5nqxjyOal70mtbcr4KkOB/fsl+oUVkG/ZzGiAz0njMEIFvwOt5wWIiJi7CA36TNZkNiTfTk3T+19lFhWxgz3xb94wLJrEEa+fQiuacofH+HkhbDkoTCbmmRXsvLXmXVSLnZG0GZTAzah4BnPem5scUbqRghGLTkXRS1K/nAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eVAYf5ER; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764839358; x=1796375358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ceVTwUwv7SOgVYfzDyF4kbX79Mjy/d2SAjUpMvlvoGQ=;
  b=eVAYf5ERtVbBS/gzX4E9jTGkOkCJuJlLh3Lgzs+t/nWN46q1tR9ENPUc
   C3g0yfjv0TIJjuqk8NjyqkZRF24oAQPcEX64odeEg5Hbyv3Irno3aCuXB
   5hHhqOCR19I4ZEkYvL1lR4jpHaQGoOaVUP2StSZxldu/4D+MoDnmFhf/E
   Gz+5ER4OAZUGFrDKT3rHPOpYVFAhA9nisPzxImnEfQ2KOuRV476qBtotx
   VF25sDH32n0Tnt/FKym0vHUtq92upqKzk8bXEnEbL1D+iUK8+AEUZIssP
   X1qi9MfoO7dg0nJOWO1uZMNyD+2zalypHRupQNa5GDusxnx9cI8z2tHbO
   Q==;
X-CSE-ConnectionGUID: 9g5vzhVkTgOcTQ4Ri8sIRw==
X-CSE-MsgGUID: doLSfQ39RTmtImOCshTmqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="67014044"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="67014044"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 01:09:17 -0800
X-CSE-ConnectionGUID: fje5WMxUTjyfWHTtGSl6pA==
X-CSE-MsgGUID: jQ0odubiR6y0Af37o7jWFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="195724389"
Received: from junjie-nuc14rvs.bj.intel.com ([10.238.152.23])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 01:09:13 -0800
From: Junjie Cao <junjie.cao@intel.com>
To: pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com
Cc: horms@kernel.org,
	linux-hams@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	stable@vger.kernel.org,
	junjie.cao@intel.com
Subject: [PATCH 2/2] netrom: fix reference count leak in nr_rt_device_down
Date: Thu,  4 Dec 2025 17:09:05 +0800
Message-ID: <20251204090905.28663-3-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204090905.28663-1-junjie.cao@intel.com>
References: <20251204090905.28663-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a device goes down, nr_rt_device_down() clears the routes that
use this device. However, it fails to drop the per-route reference to
the neighbour (nr_neigh): neither nr_neigh->count nor its refcount
is decremented when the route is removed.

Mirror the behaviour of nr_dec_obs() / nr_del_node() by decrementing
nr_neigh->count and calling nr_neigh_put(), so that the neighbour
reference is properly released when a device goes down.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Junjie Cao <junjie.cao@intel.com>
---
 net/netrom/nr_route.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index 20aacfdfccd4..35d10985fd7a 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -517,6 +517,9 @@ void nr_rt_device_down(struct net_device *dev)
 		for (i = 0; i < t->count; i++) {
 			s = t->routes[i].neighbour;
 			if (s->dev == dev) {
+				s->count--;
+				nr_neigh_put(s);
+
 				t->count--;
 
 				switch (i) {
-- 
2.43.0


