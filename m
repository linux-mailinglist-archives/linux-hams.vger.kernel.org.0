Return-Path: <linux-hams+bounces-36-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B80486FBA9
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 09:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C635BB2217D
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 08:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF65C17C64;
	Mon,  4 Mar 2024 08:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRKehy+k"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5573A17BAA;
	Mon,  4 Mar 2024 08:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540463; cv=none; b=nonVnliVJDH38NjhhqQHdqQCoXampaGPk9OejPgYYaditxrEd+VDqATpv7oXnxuPp6qffEEOm/XKj/A/uSqrBTNkGz3kHCXOovUtW+pvI3b2QkfeO7aKyo8voukIswhFLAmv0H/aijOSfIcD/VjfN7frftC7q7edpxJJ1DaGfl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540463; c=relaxed/simple;
	bh=y79GMOvWd5dG5z4S7JT6/RcTTwuryF+k3/tAnoHoEUg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lOjtDzGvW77FBlRjjqorh3pyOww00A0L2H9/GY1kr9zNcux+gHZKz1xxm2VMqFMyKYN6nBLgaO5K4OMUQw5KkW72g/s4Ux5MjJkqaD03FHtltUVUDoWUouWErrY7RgOsTz2/rW67Bik3JwJetfiyyxe5SjWgEkysDcYZHvZbxps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRKehy+k; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dc13fb0133so30443465ad.3;
        Mon, 04 Mar 2024 00:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709540462; x=1710145262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3bAu00DzxRZdy1Mz0sP7/AqGlwRNs6txE5fz4BNJO8=;
        b=eRKehy+kGTmYB0m6szOc/zme6ThEDq2KGYORntsOk5wzEwe1f/nMeRtNOaMr5iAWXB
         XIKYmh9HPINGjvFK1sm04eCgdeZAFQDFrkIkufSiuA0Ml1hc/XrjjMvcfonQ6hpn9txe
         5jMKnjlKQV2gCpYf4jnWHHgkICokYP2RXR9JJnQYvgYXnj8/l6cYjVQTPoD/YnSbOGCB
         AN/k1BtL0gKRz+tTvtYfsTj/FONc7RHYeH2qPXYiw+Hds3YoBQjdttFZ50tt/bBXsFah
         qL4M9KS6bS2Hmib9mjk++us8FLRfPW0PnzMqQ/B0d/SSeqUNfTRBpCSfNL9su47N1D49
         vgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540462; x=1710145262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3bAu00DzxRZdy1Mz0sP7/AqGlwRNs6txE5fz4BNJO8=;
        b=i+RD9DnqYswz4imFgXjDZ4qQ5wLmbvnZ7Uvy26jp/GwAtj2AQFRIim81/dnSQ9ZdTk
         muW2NlvXDsceR6cJBv5t2AMP5m8Ta5IFA7vjtjCnG4E6L8Yeo663r05kzIeWuB+3comr
         XWDTrGqY5aeb5Z0fJV634kfoLQlynmBwFiSaIt60e1g8Jkn3hlJQr3V1GkDKmqv4GEzL
         3JbH5mY0rk8kSSsVn17WWQ+JMgTp7baCVys4a+qWM6F2iVOBd+x7mBSGcDysCMO5Fiz9
         WQASg+PgJWp9ml08Pq7CkKtngVf5lyJXarV/7N3/cspLohcwmF3x7nnqp8FIczp6M0N8
         xeXg==
X-Forwarded-Encrypted: i=1; AJvYcCVrI+FHDtIV85P2gr8Ucx5zG/7F0LPi/tU2dj4QlQNQy0rlgFDP4x4hCVIvWoWpRkZtQDEP2IH6sKBvaCXrP27HmLarNLJF
X-Gm-Message-State: AOJu0YwtMVnacPiPOuzKwRVAAnHjHRJL80myuaTPffWrioJQBxwLPZtl
	7N0ERpuJEmBKjE70jB3wFOt1C/W11QgRkFcZzNA3ViQuxmXQnLoZ
X-Google-Smtp-Source: AGHT+IF6e1awzNWXTqWZ4QCQfMy5l1/fOZUh/I+o/lbIr+FIr95XcFM0HMIRJdFcR6UQgtX/MK9bCQ==
X-Received: by 2002:a17:902:cf0a:b0:1dc:a84c:987c with SMTP id i10-20020a170902cf0a00b001dca84c987cmr8676423plg.10.1709540461706;
        Mon, 04 Mar 2024 00:21:01 -0800 (PST)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902c3cc00b001dca9a6fdf1sm7897014plj.183.2024.03.04.00.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:21:01 -0800 (PST)
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
Subject: [PATCH net 03/12] netrom: Fix data-races around sysctl_netrom_network_ttl_initialiser
Date: Mon,  4 Mar 2024 16:20:37 +0800
Message-Id: <20240304082046.64977-4-kerneljasonxing@gmail.com>
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
 net/netrom/nr_dev.c  | 2 +-
 net/netrom/nr_out.c  | 2 +-
 net/netrom/nr_subr.c | 5 +++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/net/netrom/nr_dev.c b/net/netrom/nr_dev.c
index 3aaac4a22b38..2c34389c3ce6 100644
--- a/net/netrom/nr_dev.c
+++ b/net/netrom/nr_dev.c
@@ -81,7 +81,7 @@ static int nr_header(struct sk_buff *skb, struct net_device *dev,
 	buff[6] |= AX25_SSSID_SPARE;
 	buff    += AX25_ADDR_LEN;
 
-	*buff++ = sysctl_netrom_network_ttl_initialiser;
+	*buff++ = READ_ONCE(sysctl_netrom_network_ttl_initialiser);
 
 	*buff++ = NR_PROTO_IP;
 	*buff++ = NR_PROTO_IP;
diff --git a/net/netrom/nr_out.c b/net/netrom/nr_out.c
index 44929657f5b7..5e531394a724 100644
--- a/net/netrom/nr_out.c
+++ b/net/netrom/nr_out.c
@@ -204,7 +204,7 @@ void nr_transmit_buffer(struct sock *sk, struct sk_buff *skb)
 	dptr[6] |= AX25_SSSID_SPARE;
 	dptr += AX25_ADDR_LEN;
 
-	*dptr++ = sysctl_netrom_network_ttl_initialiser;
+	*dptr++ = READ_ONCE(sysctl_netrom_network_ttl_initialiser);
 
 	if (!nr_route_frame(skb, NULL)) {
 		kfree_skb(skb);
diff --git a/net/netrom/nr_subr.c b/net/netrom/nr_subr.c
index e2d2af924cff..c3bbd5880850 100644
--- a/net/netrom/nr_subr.c
+++ b/net/netrom/nr_subr.c
@@ -182,7 +182,8 @@ void nr_write_internal(struct sock *sk, int frametype)
 		*dptr++ = nr->my_id;
 		*dptr++ = frametype;
 		*dptr++ = nr->window;
-		if (nr->bpqext) *dptr++ = sysctl_netrom_network_ttl_initialiser;
+		if (nr->bpqext)
+			*dptr++ = READ_ONCE(sysctl_netrom_network_ttl_initialiser);
 		break;
 
 	case NR_DISCREQ:
@@ -236,7 +237,7 @@ void __nr_transmit_reply(struct sk_buff *skb, int mine, unsigned char cmdflags)
 	dptr[6] |= AX25_SSSID_SPARE;
 	dptr += AX25_ADDR_LEN;
 
-	*dptr++ = sysctl_netrom_network_ttl_initialiser;
+	*dptr++ = READ_ONCE(sysctl_netrom_network_ttl_initialiser);
 
 	if (mine) {
 		*dptr++ = 0;
-- 
2.37.3


