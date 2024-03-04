Return-Path: <linux-hams+bounces-38-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3C586FBAD
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 09:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4C6D1F20EF8
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 08:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A151217575;
	Mon,  4 Mar 2024 08:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5VHlbHT"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F24517C7C;
	Mon,  4 Mar 2024 08:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540469; cv=none; b=M+93MNt7C25iT7cUOKmUilh5zZ+EfMRn96HZvtzAyhg7FqyJzObPcu/B7MjR7W4hh4HRjvyOqxA0BdUlzvEHNillyxta6ZR5LLh5KaKK/ZVrVUxXOpgyCvPkXVbf306YwPqlMYmEF0bzWrTJc/Yg4bCBEIObV27djpW/NT03BN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540469; c=relaxed/simple;
	bh=5qOtxUQrFv/GEEKCyZFf6zEUcZ3cSCkMc0uuRo/5p/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X79TTBEczwaAAwOGTh+JSj7f3DsPG9sSNsrObt3FT8D6+P5UKq4d4g++sw8rCibeFY5muCGdw04Gpz4+WZDOIG4BBCIb6f631K6xR8+eqtI7xXiclMBNQpRmtf5gqpjTX1UZ88OwL1nfHo4hVnAVlHis3TiPgdvCW4C2Y/T/auY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5VHlbHT; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e5eaf5bb3eso908630b3a.3;
        Mon, 04 Mar 2024 00:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709540467; x=1710145267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdD+CaPse9U48RqBz2MFPEQAOQKv6p038r9WdaR0/O8=;
        b=l5VHlbHTRVlb7/BkCJoaYN9RI0xtVxC1vX0LjxlreltmLjZn71fXRGrlUsHBPOORpg
         ZVpOCv5tp0bgcAGkJH6ZYczE8QRHXjvd9EsBdAALucMtaLrW5H5+WXPHroftKbu65cu2
         RpBRuFSjFyEql7zoOM/Saee9pL3r3SnU2uegIBPH2l4oNSFGEweCmJUJNIIdrJDTzkjJ
         wmzOPtp7ol2UfcQwLEkTILXpOQRChwomHUxXG/LZqDfWRRJ31hxvHlqufvSUQnhAW+kU
         iWLP+qRcoFEgSmICuTuGwy6JCz0wwJxMJSyoz1uKU4wbDg4SFf5+u+LxRHJIXbVhCWhf
         Zs5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540467; x=1710145267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FdD+CaPse9U48RqBz2MFPEQAOQKv6p038r9WdaR0/O8=;
        b=FUOD/2mH5R7Vqqgiz5cNw6GkkGPGJc3kvNBo8FxUtWKXtBL7132qSB9P6AhR3HX4zR
         PWYUXhyQGk94o2PSAvsFolcWauJvrTItBaUgSXzZIC/p6sx8WIML3gmWbvW6TTo2XDMo
         U8z10rWzVEoR6sdBHbqneCSBuMPQX4BVwLUIlj4ogL3F8Us3FXZObQdIsHBQDz4hlAS4
         BfXqv0zKHwjZb350OuSDlGajClsv4yP0VgGPncq6IY6AABnOVuzJBm/UHpcSRK82vzUm
         LTifUOR6GiU3BUvkGfYLAQ0qVhS8JFTrU93BRN26xg4k0kLN1gJvT7gZnMaKn7cN3tlB
         qzcg==
X-Forwarded-Encrypted: i=1; AJvYcCWwYZbzaBN5K78kw9HpiEH88z3AySHrqlbXOklC6/9VleAqAuApf7oUK2LwtZ0KsJxFYXP84+OBwvjCX/UvCJhkXUDUlaBC
X-Gm-Message-State: AOJu0YyDMd2/cTRhjLn26cig/ohTvmkjMXYM7N7EP1CkjnqAR4HCxhCu
	R7/D4T4804xBaqhck02z4dcF+Vub1gPYQg2mhS3MDuXxEiEjHWNu
X-Google-Smtp-Source: AGHT+IGLfqZqybedZwI/qfQg0Qh9bAlx4e7Z4uBwO+JkYdCQm49PrRJfPWZDz28/pM8oW5RJgKgflg==
X-Received: by 2002:a05:6a21:3a94:b0:1a1:4ec4:a23c with SMTP id zv20-20020a056a213a9400b001a14ec4a23cmr248799pzb.44.1709540467485;
        Mon, 04 Mar 2024 00:21:07 -0800 (PST)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902c3cc00b001dca9a6fdf1sm7897014plj.183.2024.03.04.00.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:21:07 -0800 (PST)
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
Subject: [PATCH net 05/12] netrom: Fix a data-race around sysctl_netrom_transport_maximum_tries
Date: Mon,  4 Mar 2024 16:20:39 +0800
Message-Id: <20240304082046.64977-6-kerneljasonxing@gmail.com>
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
index 4d0e0834d527..312fc745db7f 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -457,7 +457,7 @@ static int nr_create(struct net *net, struct socket *sock, int protocol,
 	nr->t2     =
 		msecs_to_jiffies(sysctl_netrom_transport_acknowledge_delay);
 	nr->n2     =
-		msecs_to_jiffies(sysctl_netrom_transport_maximum_tries);
+		msecs_to_jiffies(READ_ONCE(sysctl_netrom_transport_maximum_tries));
 	nr->t4     =
 		msecs_to_jiffies(sysctl_netrom_transport_busy_delay);
 	nr->idle   =
-- 
2.37.3


