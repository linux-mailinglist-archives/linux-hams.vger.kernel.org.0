Return-Path: <linux-hams+bounces-45-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E3C86FBBC
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 09:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C0D4280EF4
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 08:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8431217565;
	Mon,  4 Mar 2024 08:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwEJQ/Kz"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F283218E10;
	Mon,  4 Mar 2024 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540490; cv=none; b=W1KsBxLOoOaMRxWekEs2L6z0T7R6eihR/wh6BpTs6c19THXBLtgFAXiLm8bd3RLr7gj7vwaU4A9vGjp+uBCoEaoYDLvBDlw0f/x30/6vqw5YaWi1FYw9tXeOBLY+2i1l8ShhXMtdypi+mRdgcCHIIkH97DrW9/LCFAlLftLJ7/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540490; c=relaxed/simple;
	bh=iUd1+h9Zu2i16qT9+q3U3uxvtz4TxEhADLcr/8i2Ues=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hdk2M0AijSKXX40KMNa6JbfB6lzrrKaD6ZAy8UqPRRsA4AWuba1pmZLhyTS1JGNfV333Jw88JlQeOUaBei73PI06v7JTEQfC48TboFniqEYOnO3mJH1PphqbqTZBs6Fgx7o1E9jyq8nbhWbPBoppxE9bSJatg/EV0mV7POwTGA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwEJQ/Kz; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1dc418fa351so37844715ad.1;
        Mon, 04 Mar 2024 00:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709540488; x=1710145288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZFq0Za5EFtHyYLLbHcoR4yWS/R5Nw5TqGrWr6tkvzI=;
        b=cwEJQ/KzjnL0ZJhT4N1ZEcqEHjg69ARj3DeoCwTd8zlNJCDVLnZzC2LmjnUJHMtmwV
         vmJabjZlJV0b5Ol4YNOtYtxnkkDHeT6y2kbl0knx3rgqJb0gicmUaqClafjRmTPor6Ad
         Ljco42Bfgn38ros+TDGbjGXRcicU+e9mtowc8qv8qNzLufVLITCLdel0AxXBwNxHK3vp
         +K/7OTNZAcCDqDMksSJRM8j1TIamKOIIGnwhVasDdf/8j7jfz3V5FfJLLCpRX4cBtqNL
         vKO/0gUs9CUFbYS9YCQMgwAZAhRG3W7DGnU6uG9xZGicHOZKkfwTFjJQmqcgm8kD1jqJ
         QB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540488; x=1710145288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZFq0Za5EFtHyYLLbHcoR4yWS/R5Nw5TqGrWr6tkvzI=;
        b=P9G4MWfRyJ9HwZYsPWoVVi6JCTxsjG35bVHsll+kXeFZ8P9yZWG5AWb9vaw8wEDz6Q
         nKK3YurCShrDzSrWWznXZNB8uZUr5dfOL1iHmRA5t9da8jYMdYc/93nG51NIoD9JUqbQ
         IebpFiTEJDZTQzJG0qL7yXAaAt8SeT9L6Uh9NG1/VsegB+FjLTNIwhQmuYtzTr1w6+gO
         Ja90Q/uJ5ewxsRqZ4CErBQS9tjU+U9lExBbQIz0zwGjj/G4SgFI1D/Z9w4LTFnyY1Yqh
         foVmhiEw3bu1MDJzagsdQdqSoViMjbYVARHDEDs9I5ul3FjcQHGGSvqwO8x95Jt3swxp
         ZMXg==
X-Forwarded-Encrypted: i=1; AJvYcCX4NjUtmxlbrtW6TLF2KU9KaPoXmcHrNQsBkhIiUrtGj4Dkfbt21vlGz7whgy7oee9cHdBm3IqblGZH6PwZl8jQ4WuZfBUD
X-Gm-Message-State: AOJu0YwUiI2ICQpTm5FefEcH0D7jzjTgjBp7erM6UtA/jGkyqIoxmBve
	Gv7PGDKHg/ynUWnyUHTCYufmengJ0d4rFqBzQPfNkWOXLr7j6J52
X-Google-Smtp-Source: AGHT+IGS37CSlS05KVWi+6sDThEBhGRc6petPQNRDWBCTCRqWuOk6N+fdjWBmO5nIgoAeNSu6PDjsA==
X-Received: by 2002:a17:902:f944:b0:1db:fc18:2da5 with SMTP id kx4-20020a170902f94400b001dbfc182da5mr11851000plb.30.1709540488419;
        Mon, 04 Mar 2024 00:21:28 -0800 (PST)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902c3cc00b001dca9a6fdf1sm7897014plj.183.2024.03.04.00.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:21:27 -0800 (PST)
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
Subject: [PATCH net 12/12] netrom: Fix data-races around sysctl_net_busy_read
Date: Mon,  4 Mar 2024 16:20:46 +0800
Message-Id: <20240304082046.64977-13-kerneljasonxing@gmail.com>
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
 net/netrom/nr_in.c     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
index 1671be042ffe..104a80b75477 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -954,7 +954,7 @@ int nr_rx_frame(struct sk_buff *skb, struct net_device *dev)
 		 * G8PZT's Xrouter which is sending packets with command type 7
 		 * as an extension of the protocol.
 		 */
-		if (sysctl_netrom_reset_circuit &&
+		if (READ_ONCE(sysctl_netrom_reset_circuit) &&
 		    (frametype != NR_RESET || flags != 0))
 			nr_transmit_reset(skb, 1);
 
diff --git a/net/netrom/nr_in.c b/net/netrom/nr_in.c
index 2f084b6f69d7..97944db6b5ac 100644
--- a/net/netrom/nr_in.c
+++ b/net/netrom/nr_in.c
@@ -97,7 +97,7 @@ static int nr_state1_machine(struct sock *sk, struct sk_buff *skb,
 		break;
 
 	case NR_RESET:
-		if (sysctl_netrom_reset_circuit)
+		if (READ_ONCE(sysctl_netrom_reset_circuit))
 			nr_disconnect(sk, ECONNRESET);
 		break;
 
@@ -128,7 +128,7 @@ static int nr_state2_machine(struct sock *sk, struct sk_buff *skb,
 		break;
 
 	case NR_RESET:
-		if (sysctl_netrom_reset_circuit)
+		if (READ_ONCE(sysctl_netrom_reset_circuit))
 			nr_disconnect(sk, ECONNRESET);
 		break;
 
@@ -262,7 +262,7 @@ static int nr_state3_machine(struct sock *sk, struct sk_buff *skb, int frametype
 		break;
 
 	case NR_RESET:
-		if (sysctl_netrom_reset_circuit)
+		if (READ_ONCE(sysctl_netrom_reset_circuit))
 			nr_disconnect(sk, ECONNRESET);
 		break;
 
-- 
2.37.3


