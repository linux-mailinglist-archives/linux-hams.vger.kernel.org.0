Return-Path: <linux-hams+bounces-35-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E31886FBA7
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 09:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EBC51F213B5
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 08:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0671754E;
	Mon,  4 Mar 2024 08:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9a2pRG1"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C4C17BAA;
	Mon,  4 Mar 2024 08:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540461; cv=none; b=fS6CLiFe6yOAGWcfLB3WyYA6+YiEL3nRAWoSJ2jcJuKdllFDG1IbQRdxmFxovke2HQCc2XVe4kCWAWapPauZWA8PpXmasiDGsKz3q1l/fczL6QlIODG1871P6/JOz8zJ5JvP7VBGeQDNMUORd/21qQSQxF2jYEWyi0g/1ziPtd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540461; c=relaxed/simple;
	bh=Yilq/5StzUQjxtSsE3Qq/Xcxvpi4u8nblR2Z8I4D3FI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uzSBNpNgc9LWFP6JO/ace3yiMdCAzZTOmWhxUESI/yi9qrU0lYT09YlcB9Navn/YEgEf1DDvV9JEHzGI4H6SKAX2/2jrXCqCarkomxntbilbnYpHiTUyeiwpS89xPaY/CUov8zv4iEwqoXJ36dBdginMZ+jQcuGldvfY9FY3Wxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9a2pRG1; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dd10a37d68so5692145ad.2;
        Mon, 04 Mar 2024 00:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709540459; x=1710145259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StGUTai5dIRRT+0qVxAdaBRPjNSg44RktIyFonGdUKg=;
        b=k9a2pRG1uXIdVKwNSzk5RP69JhPGpwBIBN49NzSInJqH5B6PMhDtni39/ol4cbq1Cy
         hCBcPebxgQKweD+XiwUbHgyWdFIwCJy+IXeiF2wWmkpkYRsXBLTCPkDzp5RX/qz2Uwbu
         DY+H4mR0ynfQmlxdiw4F2FZMZEkBmyu/wMY9oaRFD/YguQ/BfN0Eh2ZG5oJMnM6kUKNd
         xHy2bj803oeClMQEtpeAqVTrOyTj9WoofpeG58jCiowyzZuJ6lBLt1tBcQqINtx4+4gq
         BNAOFxUnHK9zOlWT27BF4iGL4FhbiJXqb/r9cuIm7bw8aIjTUUlKVB2tC6tHIIhjKBXP
         +XGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540459; x=1710145259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StGUTai5dIRRT+0qVxAdaBRPjNSg44RktIyFonGdUKg=;
        b=CQ5hvl6vT++YELidPuQip9OHFDfxcrMLokU8moZm5cqJbNS2aDHt7Ja8KXjrLXWZxs
         Jc8FqjO+77XFTrIztDtlgNaF8g6dGx7sRuHeVpk4DBGaZNjKeEbf0MLGGu3aQcmGt+oa
         rfVtL9asQg6jeYIj3BpqF3jUa9n1endp99mKIUXQ1YdaCjURHnxR110j3Qi6uvcj6G04
         UsiDN0ZjEpH1RQ2xvmjT2UJIv2pf2LJJGVdwBzUOsyFCy0B8T34CnsveGcRE33K+RSPk
         pOxSk/91kIZYnb0dAkSqutslvIPzuO40jeo24g5YddLcnIrjauJ4K2lATpUCxqYnN9DK
         zJpg==
X-Forwarded-Encrypted: i=1; AJvYcCXE4O110DJY4jKPDUyAUMga4QXyXF4WIdonXEUueqx36BewetKflNK6T+vQXzo77uHVvTxESsty+H0zCw5mkId5BM2dexuE
X-Gm-Message-State: AOJu0YxkQp60ZC8t1d1jVdB9DAwLql3/RIwGJfLoOU//RX8o8DLIyKHS
	XBGjf2KP6pmizIjRa+/At/DoQJJ6AYD450IE0z2LR38a0cHt90Rj
X-Google-Smtp-Source: AGHT+IF/MlFW4zyS5ikC9w+UgVIiV8l1OES15WhBPt6ffjlAe52+ReAYcE08X5e4Ib7jf7aWsTINbw==
X-Received: by 2002:a17:902:ee84:b0:1dc:499b:8e80 with SMTP id a4-20020a170902ee8400b001dc499b8e80mr7168199pld.54.1709540458833;
        Mon, 04 Mar 2024 00:20:58 -0800 (PST)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902c3cc00b001dca9a6fdf1sm7897014plj.183.2024.03.04.00.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:20:58 -0800 (PST)
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
Subject: [PATCH net 02/12] netrom: Fix a data-race around sysctl_netrom_obsolescence_count_initialiser
Date: Mon,  4 Mar 2024 16:20:36 +0800
Message-Id: <20240304082046.64977-3-kerneljasonxing@gmail.com>
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

We need to protect the reader reading the sysctl value
because the value can be changed concurrently.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
 net/netrom/nr_route.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index 6f709fdffc11..b8ddd8048f35 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -766,7 +766,7 @@ int nr_route_frame(struct sk_buff *skb, ax25_cb *ax25)
 	if (ax25 != NULL) {
 		ret = nr_add_node(nr_src, "", &ax25->dest_addr, ax25->digipeat,
 				  ax25->ax25_dev->dev, 0,
-				  sysctl_netrom_obsolescence_count_initialiser);
+				  READ_ONCE(sysctl_netrom_obsolescence_count_initialiser));
 		if (ret)
 			return ret;
 	}
-- 
2.37.3


