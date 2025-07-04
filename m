Return-Path: <linux-hams+bounces-538-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C40B8AF8C13
	for <lists+linux-hams@lfdr.de>; Fri,  4 Jul 2025 10:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE26818905E8
	for <lists+linux-hams@lfdr.de>; Fri,  4 Jul 2025 08:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD552EAB8E;
	Fri,  4 Jul 2025 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZlpccHYm"
X-Original-To: linux-hams@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527072E7195
	for <linux-hams@vger.kernel.org>; Fri,  4 Jul 2025 08:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618052; cv=none; b=qGJYhfMPz46woSbtTS7YjxbxEeT34snJUgYYRgJOh5o9Xj7v7x2ijazv751FUmGuu59DDdIp27DqNSgUYBXNMP2s5/aQQGGvjLybuQSxYAfgiADaua6dQQYWjML+Fm+ysQ0sJJgxAQjz9kA5JQK0cZGE7gl/tjvg5yiNHuF7f5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618052; c=relaxed/simple;
	bh=CetlkbssAx3CT+W+S7LvLpVrN+KyqTcTz/MEUfInLaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uO8jY/uD8NFymirvzoPWzUzERkFG0G9ueBRw6bLdZzCmlfahMfOfL1bLoSeUDTFxkEraYPLlTj6T6tAM+edLOWAAtXO8TlX5qkhm1FJwYqVh2HQ0EWrhmvByWgeKr+jRVWRVgRVkSMMBG+LEuSSTXMFrRHoLdfxALOSczmeKarI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZlpccHYm; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751618046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q8I8XJQwg3ZkzydAriAYVLE7CgKwqIMxaFpznC0VtYw=;
	b=ZlpccHYmEVeKhAI9BEp1US+2IDzA6SHoU4SbXzq5si5iV1eg0NCaNnU6F6386mQfa+bzqV
	8OEFC0espYoDBBO+ciGHfcq+7X3nd0tZY3e+YgLj4ZFJ+O3RNvM36q9ZUQecqn2FSRIPTX
	SekLzeMwMJj1WKAH2OwXQRwqLFUW02Y=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ingo Molnar <mingo@kernel.org>,
	Kohei Enju <enjuk@amazon.com>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-hams@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net/rose: Remove unnecessary if check in rose_dev_first()
Date: Fri,  4 Jul 2025 10:33:08 +0200
Message-ID: <20250704083309.321186-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

dev_hold() already checks if its argument is NULL.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 net/rose/rose_route.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index b72bf8a08d48..35e21a2bec9c 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -608,8 +608,7 @@ struct net_device *rose_dev_first(void)
 			if (first == NULL || strncmp(dev->name, first->name, 3) < 0)
 				first = dev;
 	}
-	if (first)
-		dev_hold(first);
+	dev_hold(first);
 	rcu_read_unlock();
 
 	return first;
-- 
2.50.0


