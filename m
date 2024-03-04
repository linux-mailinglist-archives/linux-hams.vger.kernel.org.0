Return-Path: <linux-hams+bounces-41-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 960EC86FBB3
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 09:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C83EC1C21BC6
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 08:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7282A182C3;
	Mon,  4 Mar 2024 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+dqmAX1"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE518182BD;
	Mon,  4 Mar 2024 08:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540478; cv=none; b=cg0x1cj2NbVgVi9LzGiU75K+UUU+IoI2bqCSH6cWIbb+wQ+cBPi4SAPynvAofy+Cxf/ROyvWJbaxfhStUKEK0ikBLcm2evPDQ99P5dcRXn8Jz2OpkwPTE5BF4SQMOfINU+uU/9Gu6uDvWV8rehXU5FgSOGb3VV1hYPnaWJshdDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540478; c=relaxed/simple;
	bh=/JX3EDfAm/pm7HZ0lVA/PyrKcEZ2225H82pvdSib4Ns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uS6SWDMPHj2EYK/5aJBVVNAAzzdGRLjlzy/WdZQ0UMTWYfR1grp1csLNxEeuTjDjo74oxIAchAy2fd7hWbdN7C3rSowGgQCulFvk1lZNwQUg4vW2agD54r6JWBLnRyWoDos6grvEQ48r/PQBKyJybl//XhQQ9PBQVjJYrjj+3oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+dqmAX1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dd10ae77d8so3716115ad.0;
        Mon, 04 Mar 2024 00:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709540476; x=1710145276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWmy9bUEiF2UiMskihfOUITFhgDo9o0OZfPGv+6F5SQ=;
        b=f+dqmAX1FYfqk/N+daaXkIN96raALmBOJO0RDWEBGdzjoeQe/dylGyMFSbSBJEJ9gH
         ZXj+5z7V9+fCaipryg8ri8jAupP1PV1Qo5tEGzy1GzvkXRzqp/wWAoRL35rNhIDU8bQf
         WwG3gjvbtG0s3lrRXABksGRtqXiLwyUshaamGDElwGZvSFTYVW/3qylXVRmCK5BAE5WR
         rj54PyhnTJiY7eqwdsJYScg2uH1h1y9itnxotBswneYwfRrsz6hg6SjaJu//Twh/Yfu8
         gJp3gdmAWoZNWP4sRXbPN2ZCDgklFS54yj3rUpC6OWikX1f6yiDjv7morIj1GRCPw8kV
         1TOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540476; x=1710145276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OWmy9bUEiF2UiMskihfOUITFhgDo9o0OZfPGv+6F5SQ=;
        b=iCuV8TPMH66j9pMiN2eFZY63krvgYCzLB7DnG1sXYFWUzvppqIR2wO+eCtJZx9nnKh
         zSJv0GaKDnHAy7Hu0hCYKhKTTDhGSjPNL8KD3PdCKmIXkFGNUY29utR6mh+WqyQM0+gP
         P7BkKqqpu3bfI4A+XjCDoEM0+NZ5tCmJ5VAqRc9Il1HKw9WYoxVDrCnHhH9OOw9mgBAp
         6I7I+yJeABfXSOB6etdPVP7tByEM0CNE9gybqhb5SvKejA+lsd9Mncb2GGxTZ6QGnVlO
         Y5ZYlLz1zkOpT5FJ3VwZudaAd9qsr/L25iDPIPBmgu1QPXL5wY7XpjGshMD/qO/Wq2Lu
         FjHA==
X-Forwarded-Encrypted: i=1; AJvYcCXthmwCwESLm5BIKt3A+N94XYRqYf3mlO070odh3Tk4V3vAMlqWmsB6wuRDwa1GROieKvTmd6RRMpZRGKNkPz55M8m1g2Gy
X-Gm-Message-State: AOJu0Yw8xj55iA0jsqBf+TsEsyKMhYKGy1iQH5w6Rwgl4lxcXeFO2cm/
	QOr/MfesSDLqGs+ue4muIfYevCO5EDBukZkAHn9k0rz466g2A3FT
X-Google-Smtp-Source: AGHT+IFF97n0quNulYsQogZ6yLN68eicpEy8a0tFhtqDcWZtGG9zkTGcuRlB9Df8wDJVxjQiSbkjrw==
X-Received: by 2002:a17:903:483:b0:1dd:7e0:29c with SMTP id jj3-20020a170903048300b001dd07e0029cmr2836041plb.12.1709540476306;
        Mon, 04 Mar 2024 00:21:16 -0800 (PST)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902c3cc00b001dca9a6fdf1sm7897014plj.183.2024.03.04.00.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:21:15 -0800 (PST)
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
Subject: [PATCH net 08/12] netrom: Fix a data-race around sysctl_netrom_transport_requested_window_size
Date: Mon,  4 Mar 2024 16:20:42 +0800
Message-Id: <20240304082046.64977-9-kerneljasonxing@gmail.com>
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
index 10eee02ef99e..e65418fb9d88 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -462,7 +462,7 @@ static int nr_create(struct net *net, struct socket *sock, int protocol,
 		msecs_to_jiffies(READ_ONCE(sysctl_netrom_transport_busy_delay));
 	nr->idle   =
 		msecs_to_jiffies(sysctl_netrom_transport_no_activity_timeout);
-	nr->window = sysctl_netrom_transport_requested_window_size;
+	nr->window = READ_ONCE(sysctl_netrom_transport_requested_window_size);
 
 	nr->bpqext = 1;
 	nr->state  = NR_STATE_0;
-- 
2.37.3


