Return-Path: <linux-hams+bounces-40-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A907186FBB1
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 09:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F7CA282259
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 08:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD86175AE;
	Mon,  4 Mar 2024 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qp24Fhpz"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E617617C7C;
	Mon,  4 Mar 2024 08:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540475; cv=none; b=bgSxJ9WdKTBDTRvJLHdz/xYA+uhB1XkWu/p8VeKiTI6ASRy+nQnxL6zHQhU/OLFN8Dn2c+qh2zKu67uIgMT/jqwhY+XoTLb2dTcua9Z9tBe5B17Faue5YBIZimH6X6JKv9AeLJdYyASCVLLrTCdgzVGkt+5JJ+b/ohjs6bpV62s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540475; c=relaxed/simple;
	bh=smmLe5LH9LS1H6g/432kEPTnn2g/DCIn+/Eu/TKPPNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lqu8rXGztwp10lrv2lJusz4rRFIhxhgEU3WghsSE/We9KCjFCipHB9r5mFrRCBCk1pd+P/KOr8CbJHFtjX1fEARSsZI/FVOtUvT1ublEk2Tg1sN4fnsPSIz0NOcUVQ/XoAra06LStZqqm7IUpaDeHVSifK85VGngQOmJdOLNenM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qp24Fhpz; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1dc96f64c10so37831905ad.1;
        Mon, 04 Mar 2024 00:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709540473; x=1710145273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbhXUtIuWfzi5aPwa7I/ama+A79VZZWFfgaAfjPoNbU=;
        b=Qp24FhpzP6VAPf3MLepeWgmqtbvXvfHLf4cT7B5365+L+dF4R/labiJPXoOuglSEtD
         8AggAqpkQzVckySw+KdrB9wMhFoiVG6zDMXT8/0VL8kWebNk15HaQj6dPRRsy7zQMgfj
         C4VJKS54leubbjoNWYPEv8mOgfhkqbqnPE3QDEOsi5CbNQo7YQr8x8VlZ8kM9GIQQ/oo
         tH3whE8+eI/rrY1PYr3+UquDHLi/uv2rYrGhYYIIPASQNEBOWr1rJckFldKNBjXLnE1y
         2AU+EmGbYGwdDcGQsHDHpks3D7nG64lwfh5WTt3o6L2fvCn54iJSw1xJ8Fg88swev7j2
         5x5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540473; x=1710145273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbhXUtIuWfzi5aPwa7I/ama+A79VZZWFfgaAfjPoNbU=;
        b=rxH9YVHQy9v6pRmTmr8lqRezyAUB2MysFeidD7xALrJcNVepm+tELRnqYXztOMk161
         yDhevyjoEENlqYU+ta9D+eBAaU2rPCVCPMNHsTHbC2CIe5/Y8yn9GfxAxUf8X+vbHzFH
         ykUVnHPg/4TTyGBVkcBsaa3zd0zHHr9EwmNDC2iRx2sNRkkyBGQnityA/WicqtiR5EpS
         nhPrAfDH8Ido5U3UWBjroJnHlo3435YfWeL1t21cYTeMNKB1b5AJdROwzqeLZbvbXHre
         2DgB433QpaOOuhc3uODwO25kGGOUJDOZ4IZsIYHD/SS22QbyKFw3q88RykeX4e7R+EB6
         rMJg==
X-Forwarded-Encrypted: i=1; AJvYcCXoqQmZixqYJtrki9dc56qW9SLkgHoxvNY3/lAA40QWyYY4vot/7gGBfLhBBpZWZboha4cQOhSpyYT9CHH21D69UIzVUH9q
X-Gm-Message-State: AOJu0YwEfD3Hbdz5HVPM+dqMrcT2ZEfcyoDvXO5dUe154//4lTh655fy
	QkMqarzl8mVaptF+oK/XGZGumPtZiHk9Tr/QLhRvQ6EXZgq9rjF8
X-Google-Smtp-Source: AGHT+IHUeUIF23uv6GPuXT/EYtS+w7zvgLtFRHg/ADJPpmaV6wdArsro2RbGlaPBItlJVtTgVmx0Sw==
X-Received: by 2002:a17:902:cf03:b0:1dc:fc6c:60c2 with SMTP id i3-20020a170902cf0300b001dcfc6c60c2mr5816133plg.10.1709540473259;
        Mon, 04 Mar 2024 00:21:13 -0800 (PST)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902c3cc00b001dca9a6fdf1sm7897014plj.183.2024.03.04.00.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:21:12 -0800 (PST)
From: Jason Xing <kerneljasonxing@gmail.com>
To: ralf@linux-mips.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-hams@vger.kernel.org,
	netdev@vger.kernel.org,
	kerneljasonxing@gmail.com,
	Jason Xing <kernelxing@tencent.com>
Subject: [PATCH net 07/12] netrom: Fix a data-race around sysctl_netrom_transport_busy_delay
Date: Mon,  4 Mar 2024 16:20:41 +0800
Message-Id: <20240304082046.64977-8-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20240304082046.64977-1-kerneljasonxing@gmail.com>
References: <20240304082046.64977-1-kerneljasonxing@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Xing <kernelxing@tencent.com>

We need to protect the reader reading the sysctl value because the
value can be changed concurrently.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
 net/netrom/af_netrom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
index 8ada0da3c0e0..10eee02ef99e 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -459,7 +459,7 @@ static int nr_create(struct net *net, struct socket *sock, int protocol,
 	nr->n2     =
 		msecs_to_jiffies(READ_ONCE(sysctl_netrom_transport_maximum_tries));
 	nr->t4     =
-		msecs_to_jiffies(sysctl_netrom_transport_busy_delay);
+		msecs_to_jiffies(READ_ONCE(sysctl_netrom_transport_busy_delay));
 	nr->idle   =
 		msecs_to_jiffies(sysctl_netrom_transport_no_activity_timeout);
 	nr->window = sysctl_netrom_transport_requested_window_size;
-- 
2.37.3


