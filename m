Return-Path: <linux-hams+bounces-43-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E8186FBB8
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 09:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 296BC1F21728
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 08:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E9217BBA;
	Mon,  4 Mar 2024 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVeas/vc"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C481818657;
	Mon,  4 Mar 2024 08:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540484; cv=none; b=QgvS1WBC8z/oKDZFhNVo4ulBqly4Ki0ylp1G5STRkarTl71y+HAQh5nOMIgfx2xnTNNH61LKMhsZvFF8d+yC7T+jvbYOXaGebMEfIoNY9CSPR/I+4O9EE106c0H6Gsnzrm2uQV9qbhc2MSmx/Q4kRIFa8+Lna27ufIujgAu1X7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540484; c=relaxed/simple;
	bh=yZmoO37vd/6JnMiTJ9i1h0agcHOeJ1McoImROpDLm8c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s7AsMsyjtsI4O5S6tObS9ZAYZdhhj/p0h77PlWG8lME6KyaHwLVZAfm8DMqgKf8wwBfnfsoRGKu704h5CU56XDrAZImlE1R9JnLOwbzvJdh0aQyL8hjwdQ9LydYNQlsK4PeOhaIcWKfVFYt+MVMJ19MmarwfgYmQ9jqvtIDgt/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVeas/vc; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dcc7f4717fso42077995ad.0;
        Mon, 04 Mar 2024 00:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709540482; x=1710145282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DW2JvBjyQ/dl4LWY/5yqaKfIRNuoL8KMS2IldX3Conk=;
        b=bVeas/vccibIfygyhQz53gKBkh5V/xoVJi5TMdDjd6Pl5VEhxATDsr71eIzM5JzBuv
         2b8DB7/4sTjufMJlxiXgVBNxsXULJEc53yo9UtrhmQ22q5t/togo8PGYesNKaamxEMAK
         odU1TFNmT+4/x2esIZ3rsuOU7uX1bwgsrN4KU8U7lQifp8pNK+kdrxWCn+U638r4lmuI
         eTCq8ZvjLT37s4tTWeSq0gBgWmoulYnfDT6zjl7UoIJHK5rAVoADR8/RTI/bUJUpDGms
         RNj0ukwgeMKjD0pV/ePm1fAUe5o/r/2CJNd22cAFgTPysakN0iM2KTZMfy/KMMquNKQd
         03EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540482; x=1710145282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DW2JvBjyQ/dl4LWY/5yqaKfIRNuoL8KMS2IldX3Conk=;
        b=gOzYjFbUbUYxwUWt8RI4KxuW+ZnJag6/5thZU8mpZRgNHooIhSv6JB0IEnuvvZ2jbh
         t0ODii+YYPzHTEGOcc4lgL07A6RVkRsp/r9m1NrpxwivduiYOcf1xE0rnFrLJ6Q48XJ3
         VB8Wj7gheDU02HV0n5vpLTH58vMn9H1vmuTtSEG/fUvxZezvd1smQMw1Yub9gNQOKUSP
         RF2i77RKwmJSnrC0b21/KH/HlHK3/THgaaCFu8VLqT2qlKDMBVLwzItIy/vdY6oL1nm0
         +lBjo1LU8B4iEemlp5fNuYwqx5ZFTT6Dw+DJlg5SjWdmhf/knznJev5HlXE9cWi78RxI
         6EMA==
X-Forwarded-Encrypted: i=1; AJvYcCUnA6CxrTJ5ligfSSJnxKZFw/tNFWnA36AUtqOICGfePciskrUO802PEQa3wD9wDNnYijiaL12jBIHdeZuUdCnIrL68xTPj
X-Gm-Message-State: AOJu0YzDj3+W93FYRwk6IONtpRxQNZwlhjO7EYJzgvNx4BnBR0eAv78q
	bdosheiN1eH0Em8ciVkclp70du0mn3KdP3CytpfH7/Ndvn9e7lDt
X-Google-Smtp-Source: AGHT+IFcUFrmrE1kJG+3SpqOhmm0Vt2bY1r8EVLzEx0COn71YwTc1B2d915cUuC68El+OboUwuRmmA==
X-Received: by 2002:a17:902:ea11:b0:1dc:d515:79c8 with SMTP id s17-20020a170902ea1100b001dcd51579c8mr11237347plg.23.1709540482127;
        Mon, 04 Mar 2024 00:21:22 -0800 (PST)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902c3cc00b001dca9a6fdf1sm7897014plj.183.2024.03.04.00.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:21:21 -0800 (PST)
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
Subject: [PATCH net 10/12] netrom: Fix a data-race around sysctl_netrom_routing_control
Date: Mon,  4 Mar 2024 16:20:44 +0800
Message-Id: <20240304082046.64977-11-kerneljasonxing@gmail.com>
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
 net/netrom/nr_route.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index b8ddd8048f35..89e12e6eea2e 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -780,7 +780,7 @@ int nr_route_frame(struct sk_buff *skb, ax25_cb *ax25)
 		return ret;
 	}
 
-	if (!sysctl_netrom_routing_control && ax25 != NULL)
+	if (!READ_ONCE(sysctl_netrom_routing_control) && ax25 != NULL)
 		return 0;
 
 	/* Its Time-To-Live has expired */
-- 
2.37.3


