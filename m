Return-Path: <linux-hams+bounces-748-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6ECD38CFB
	for <lists+linux-hams@lfdr.de>; Sat, 17 Jan 2026 07:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB62F3027D89
	for <lists+linux-hams@lfdr.de>; Sat, 17 Jan 2026 06:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5244232D0FC;
	Sat, 17 Jan 2026 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BV9QiUDO"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCAA318ED0
	for <linux-hams@vger.kernel.org>; Sat, 17 Jan 2026 06:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768631981; cv=none; b=MCKoXEy85vTQoA0CP9PxehdjEu6I1XcvtHZSq8h47n84ppsNNZL0jGl1K9DwkoyMpFzXAS1hs8Pjj5ZItgsQyl2KzGNMN0jFPis7ozeiYloZJaIm4jAGzSz30UnkFzYOQCzT6kjfrODf8AbIUzOklbOlkOydWPSKHut+57ACrCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768631981; c=relaxed/simple;
	bh=Op9TUg/VxMA16PKUtAu/Gj0/Vt+zMazAsyJERnDzqzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bAFYqzjzZjw8dR9wAyfGHHB4gfidf3x8p1UpGKb+EnstH1T+M9ecrPLtfHJb22AhNbH2MwbIbmVK3l8io6R5suKv0PFRPTgO8a7Jw+XViu1hpOQ5rvUFnYYUK99q8zJQzMvmm1Dp8VwIZnm+OB6ar6puP8kIQF8thpFaOF6FN3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BV9QiUDO; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso1593366a12.3
        for <linux-hams@vger.kernel.org>; Fri, 16 Jan 2026 22:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768631979; x=1769236779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8M1w05leQx+7ot5JX8ZEDxjSGqt4GVLt9y7yaclp6cc=;
        b=BV9QiUDOlMaEd4G4YhFLNNTZkXn12Z8bkVDJW+4QYyFYvuqHuZSqrCegxX6PT4XU6d
         rRIz2+9PTC01dnmBDVDjuJdKsCPSrh4KptqGR7kd4JpxlhPpGzJ2pp2uvD/kgkG8fdxU
         Y88oesAy6+HWUx8sV7bZdm2A88kU6VuQPRlKfumIHWtnWLVxfPZu69ZJSfDWx+wXN2jg
         5RXlUuNcwJR5lEwWAINMRtuIwMn6mVF5EVY1l6J1+IVZ9jh1LzhuVhRjPBe/2wvP4/Ox
         gCQL6f9IpIQD321IogQhypjEpMVGJkbPNEVh44d3YE36n4DGS58LX0ytFLUc55rI+fsq
         nQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768631979; x=1769236779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8M1w05leQx+7ot5JX8ZEDxjSGqt4GVLt9y7yaclp6cc=;
        b=pgsgfCZ1Jcs7X8y6muRkT3RUX9RNlrmph/xcRGPAtI0lR9pkDxVfLy/ryaPECeIKkd
         SWSXIyD0j86T4XuJMR0KfpLWLExaAI9YeJwVaKzzscnu/DMJ+KwV+iXQSgqaMfLyWxzT
         ZecQ1gj8hIqxV6UAf4luu33mlq1Y7NciTFaQh/M8YN/mbYSmrLCTFI3Yw6mC/3ytURdm
         nliGzWkaUj64sC9vptPFdsUQYlHpMTxDZquqL6PfEps2OyFXF7PPUqFn9x9oV1XVDXGl
         dR0eeC8uyq78cLejp9HevfDqpkwfmVGfcCOV/iVrAZEp2Fm0Clj3QSLQjtQEfn22PcrJ
         2S7w==
X-Forwarded-Encrypted: i=1; AJvYcCXTRlroCARF2VW40bON8xdsnPogUYosRWlwwqc3fRfXPMuYfxGshneyXd6OOlPZnUkp+BVwbmIzO9ls@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ZhJt0MAtC8UfQdvyKMehMMkD8vzpGRj3Ml6+8cZzTtEAK452
	/AJjGmJi12ZFqzghcwCnmLLi7VHFTFklMAZDiYs7mEnuTlDDhHaDc5py
X-Gm-Gg: AY/fxX6hq/ZOp/hx90sKtOsaahrnR0davRb1URO2DCS1P/EyMMddkfQXrOW0K/fzCq5
	P04c4qBPUz5xf+m1fZuJ+Eeep6QMjsLY6c4MPS0/UH2FGc4kKeIpvGDvtr+dho4FVpcFjfkk1kL
	JbjHSWz6Mw3I86VP5mImQpXJtJWZVb8LzkJFD6ndwS8jh46TXR6HggJca+4UUGi1LTictEmt5+q
	eOPOd1sEAQiiLGCIbcUPLLnDg0iozw+y8VTyqG/x0REwOSYzfXQmESMpQZcO9iW+KAxaUw5Bfid
	MqTjuDBKubrnT5qeqWXakIPjryGm5RPXVtACnXUGpA5GzRu29QHl5KZP0mgKWsqde294z3tX96b
	oKOlRjxdEANRBtAElgF0wUGM/y2/higeC4ZXBrV0bluDfWox2RFSoPq0kJEp6X8pPM6PlvxPxm+
	jTxvZ7D5BpuUdwcxvE1FSflVGMopwFlOUnOhOl3mRwKbUr6hFlHjp+Z0UVn1p5nbJ3n7o=
X-Received: by 2002:a17:902:c94c:b0:2a0:e956:8ae8 with SMTP id d9443c01a7336-2a71887892dmr47471135ad.14.1768631979210;
        Fri, 16 Jan 2026 22:39:39 -0800 (PST)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:389d:84da:333b:cc85:1610])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce2ebsm38239785ad.32.2026.01.16.22.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 22:39:38 -0800 (PST)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	mingo@kernel.org
Cc: takamitz@amazon.co.jp,
	tglx@kernel.org,
	linux-hams@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+62360d745376b40120b5@syzkaller.appspotmail.com
Subject: [PATCH] rose: Fix use-after-free in rose_timer_expiry
Date: Sat, 17 Jan 2026 12:09:30 +0530
Message-ID: <20260117063930.1256413-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A use-after-free bug can occur when rose_timer_expiry() in state
ROSE_STATE_2 releases the rose_neigh structure via rose_neigh_put(),
while the neighbour's timers (ftimer and t0timer) are still active
or being processed.

The race occurs between:
1. rose_timer_expiry() freeing rose_neigh via rose_neigh_put()
2. rose_t0timer_expiry() attempting to rearm itself via
   rose_start_t0timer(), which calls add_timer() on the freed
   structure

This leads to a KASAN use-after-free report when the timer code
attempts to access the freed memory:

BUG: KASAN: slab-use-after-free in timer_is_static_object+0x80/0x90
Read of size 8 at addr ffff88807e5e8498 by task syz.4.6813/32052

The buggy address is located 152 bytes inside of freed 512-byte
region allocated by rose_add_node().

Fix this by calling timer_shutdown() on both ftimer and t0timer
before releasing the rose_neigh structure. timer_shutdown() ensures
the timers are stopped and prevents them from being rearmed, even
if their callbacks are currently executing.

This fix is based on code analysis as no C reproducer is available
for this issue.

Reported-by: syzbot+62360d745376b40120b5@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 net/rose/rose_timer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/rose/rose_timer.c b/net/rose/rose_timer.c
index bb60a1654d61..6e6483c024fa 100644
--- a/net/rose/rose_timer.c
+++ b/net/rose/rose_timer.c
@@ -180,6 +180,8 @@ static void rose_timer_expiry(struct timer_list *t)
 		break;
 
 	case ROSE_STATE_2:	/* T3 */
+		timer_shutdown(&rose->neighbour->ftimer);
+		timer_shutdown(&rose->neighbour->t0timer);
 		rose_neigh_put(rose->neighbour);
 		rose_disconnect(sk, ETIMEDOUT, -1, -1);
 		break;
-- 
2.43.0


