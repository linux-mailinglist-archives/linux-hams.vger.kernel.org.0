Return-Path: <linux-hams+bounces-42-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D83F786FBB6
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 09:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22BECB213E7
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 08:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441A2179BF;
	Mon,  4 Mar 2024 08:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPt8tMY8"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7A51862B;
	Mon,  4 Mar 2024 08:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540481; cv=none; b=fKMoTVeN5aK9Krp8Zt0VnP/FI4EX/+r6UMpRZEfBTgz17xeH7Dx+lHMn2rO1wfcrc2GiuhtGZ2mHAgenJBSdYHLwEpz2DogLL/DLZwalP3ZtRk3MH2FLDlJ6lb9Ogl+duDd8Yh4JEQ4l3+MjAyYkJZcoW6LnP/EfB3Ep4GafPj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540481; c=relaxed/simple;
	bh=sAYs2sB1EyIgScjGXf0vmm08sij1qYK1gP1AUyjeFXU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VZq5h+LF2/E6yNMQoUevQgq+i7AOhff3hCt+mr8zCKqjcqpeq1/ZUdQOHO8D8Wff/QQ991w/2IdJx8jXO/lxLu+ppodzZDaHAXvdkE+JE7YXas2xV6RWGZGfCgkPbPHh32/ud4OpLrLSvcQTltQ1bUMigd8/rI3p+lvj/1NQL5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPt8tMY8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dc1ff58fe4so36576945ad.1;
        Mon, 04 Mar 2024 00:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709540479; x=1710145279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZi39+Tv+XQEU0CyhWX4+9P6AIX5XUlJhwY1mEwuqDU=;
        b=aPt8tMY89XeiybGcWYzacU8Ii2BJAXcpDHSI31XCoyMDZC0QFn7g7dsYirGfp1aVXW
         QC2cJfNaKAUdBL/s67qkiVSLT2Mh/cdEOy9exQs5yiAGtUgljxrQ6ft71vTFGmi4ggtK
         zjGhn4eSV0m/lDh4I6E7A/CGutonfyQQCSMxrOLmClhuojpkp8lIpFmXyAHo1Spwl+U1
         Qr7p10zcyZDVUH3dgZqpWzSdY3AcIMgLCyduh3yuV2uxW5afo8XLH8v5HYHFu6+BFpUx
         cYr39OfWqe0e+tglzwCzSrdgnl6tHWfBnWEqKOL8bdCO++yQ0nRJNymMnkEfA/kojp1x
         0QOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540479; x=1710145279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZi39+Tv+XQEU0CyhWX4+9P6AIX5XUlJhwY1mEwuqDU=;
        b=FSD87sC1hC4sBp9BYoY6dAH6EyT3sHxasVNocCYYeWYgt5OUT9WejbsWKP32dgHAdE
         a3v7JjglB5duT8kTccbO/toTeu/Pk/LYEIkY9DmUiwT5rg6BO+M3ccALKcSPqaQTRn+R
         +UP4gfAO4jUZWt76R2KyLt61DcePmCEk2PW02ms1nKjPNCczLSdanVPkwoe4RcA0DL28
         lA1HA+6+d9PSyklQoeAkDk05+0CliFVTD1DGBmXuzBQfxCoj/8R4z5JqrDESnfKX1Uy9
         xoaQxsoJoe+Htiv3BtUuNjDEmETTv2yTvLP1vMTzUJUgyQ3zHljNFtAh+65iwgIgPUeo
         Ga/g==
X-Forwarded-Encrypted: i=1; AJvYcCWEYGXGiz/IHSgI7gHeSDyl/DrzFpoC4HdUCECfOMDN9DSnFGvgihhi7xlWK14eMxIuDT5iRVg3kM51BrEFExrbxg9tyCjZ
X-Gm-Message-State: AOJu0Yy6GOLbz6+RrUDc/X9IMRJa/MMD0YGXbbXqF3uif2wypu1YjQmJ
	qP783UIk4wuGpadSoAB1IpWWLGgnKArjYZL1QS4CyjGm8mtMBeIZ
X-Google-Smtp-Source: AGHT+IFpB7WTYhnMvD2J9T43fCWzIliWGuO/CzQBChOFkGYdNRCuS/NVxuE34OS75+AInD7nSvyQBw==
X-Received: by 2002:a17:903:2347:b0:1dc:cf17:8a6b with SMTP id c7-20020a170903234700b001dccf178a6bmr11040968plh.43.1709540479292;
        Mon, 04 Mar 2024 00:21:19 -0800 (PST)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902c3cc00b001dca9a6fdf1sm7897014plj.183.2024.03.04.00.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:21:18 -0800 (PST)
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
Subject: [PATCH net 09/12] netrom: Fix a data-race around sysctl_netrom_transport_no_activity_timeout
Date: Mon,  4 Mar 2024 16:20:43 +0800
Message-Id: <20240304082046.64977-10-kerneljasonxing@gmail.com>
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
index e65418fb9d88..1671be042ffe 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -461,7 +461,7 @@ static int nr_create(struct net *net, struct socket *sock, int protocol,
 	nr->t4     =
 		msecs_to_jiffies(READ_ONCE(sysctl_netrom_transport_busy_delay));
 	nr->idle   =
-		msecs_to_jiffies(sysctl_netrom_transport_no_activity_timeout);
+		msecs_to_jiffies(READ_ONCE(sysctl_netrom_transport_no_activity_timeout));
 	nr->window = READ_ONCE(sysctl_netrom_transport_requested_window_size);
 
 	nr->bpqext = 1;
-- 
2.37.3


