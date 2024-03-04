Return-Path: <linux-hams+bounces-39-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA29F86FBAE
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 09:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85933282259
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 08:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35C817C9E;
	Mon,  4 Mar 2024 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFxkm+3t"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2711B17C7C;
	Mon,  4 Mar 2024 08:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540472; cv=none; b=ViqjtLfWeZqM63vVrHVnFmm0SVlv9VHq4bYj+yn9COgAkkgmzuzGRfZ9m+ZWcWBozhA7ntbgFebPuTYr06/TSZAuvWNaPyARyIVWkK+ROxnE9DXBhS1bS0nVbtuMatmcc+REV4P9EXMPJA595lbinNZ0xj9NxMA/LowueWfeNeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540472; c=relaxed/simple;
	bh=IGxxE3ypF0VtVF/3Th0Ymtg/DaiKUhhyu2ipKBii5dY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WkvMVCjeFUTop/t6HKkjh4nRRjbV+dtljNgTpCLWhG8WNHfCxx6qUCP/Scn0UmXBuLZ6zraiLzsbUWwThCFLUZ5yLpOOJzzKRPhYfbT90XuyPYKRLWcBJ81+nwWXZ6DJ9wndEkF6YsK7vXLBG9agdQjjLz/GS2MS/TqMC0fVkCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFxkm+3t; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5cedfc32250so3718387a12.0;
        Mon, 04 Mar 2024 00:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709540470; x=1710145270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIzGPlimlb6nzP0aI2rUDv184DfL3j9hRA7WBnTQH+I=;
        b=kFxkm+3tbOIXVGa/53S8oszHHlilibrzViNquMVIg+MLx2E/js7KQ/UHdXL2G/SRR5
         SMgp+/MQ3vAeEl6LjeY6pplRaP/3xFOhkJtZEZbwSSU/rRtpmiECnkuRCNP9rxoQvc/O
         PQs+YI4p5nvpWLkMCueLcz62I4eWJBNs2LellmJFSoygfEVfiiDlqBWSElEcIo2sxVhI
         azb2EfuNNryPq/ppBfYIYnj9x7JBtQh00zAeQIWiJPrY/UGeHuXQmHkLjVkZBuj3Obaf
         YZ0QYAIn25WL1AD+yN1SX9CcKFMBawlHF2FGfIV5ACaDPUEFTDM1WHR/U4sjN0YW/sSZ
         TEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540470; x=1710145270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIzGPlimlb6nzP0aI2rUDv184DfL3j9hRA7WBnTQH+I=;
        b=h8yzNgM5mOttVyW719UMSIXCAIbsNVy3Ma3RN7Zth+BOJ2+5EFq6A/9RkLQwnhKHFC
         +7yU9RkuYuji8Yr061ELsy36NJWMm0Ri7CsQ6RXyAeYhSjz9iIhNbP00rzTwjf6JoWK/
         54UEfnNnsSBZvjKl7fUqbGr0EDPvGEFxK2OZ2/i72mS/lN11v6c9SOKuPuWOxeR1M7ZX
         2D6j1pOALq+9jVIhh+xuMekF+rFD5KeteQz6fVH+RuaU58x42IzI8QOJ4nSpxciQY1lZ
         eG4D2IHI26hmhaF+vknlPYOzpmTcZDF/Xf3ywIFLDaZDotIG4KnGoR16Fy2Vsx6aoXiZ
         L8PA==
X-Forwarded-Encrypted: i=1; AJvYcCXHjFwwJfB0ufa0t7Ki3c9Cv/qggfPynLM4kwIjTV9gV07rIcongm/GnFlAIu/kB6AvupX4tt0Iu181Ye3K+Zwwwzmlgcqb
X-Gm-Message-State: AOJu0YyFEONH4u83nmdeMYFUnUka65SqGbcjY2+zhaa+xqXtONkveu2K
	BqI+Ph+bvLj8+dsb0qYJRSOOjlniNlgK5ASOC46JkdnIbEH4N1fE
X-Google-Smtp-Source: AGHT+IFiNR2y/AZf/PoirTngRArTzEi+dhMG4Sm88O2Tyz+filisFuDcK8FRsHPGocJIdX/tq5vH7Q==
X-Received: by 2002:a05:6a20:6aa1:b0:1a1:2cba:baf2 with SMTP id bi33-20020a056a206aa100b001a12cbabaf2mr5104970pzb.52.1709540470398;
        Mon, 04 Mar 2024 00:21:10 -0800 (PST)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902c3cc00b001dca9a6fdf1sm7897014plj.183.2024.03.04.00.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:21:09 -0800 (PST)
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
Subject: [PATCH net 06/12] netrom: Fix a data-race around sysctl_netrom_transport_acknowledge_delay
Date: Mon,  4 Mar 2024 16:20:40 +0800
Message-Id: <20240304082046.64977-7-kerneljasonxing@gmail.com>
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
index 312fc745db7f..8ada0da3c0e0 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -455,7 +455,7 @@ static int nr_create(struct net *net, struct socket *sock, int protocol,
 	nr->t1     =
 		msecs_to_jiffies(READ_ONCE(sysctl_netrom_transport_timeout));
 	nr->t2     =
-		msecs_to_jiffies(sysctl_netrom_transport_acknowledge_delay);
+		msecs_to_jiffies(READ_ONCE(sysctl_netrom_transport_acknowledge_delay));
 	nr->n2     =
 		msecs_to_jiffies(READ_ONCE(sysctl_netrom_transport_maximum_tries));
 	nr->t4     =
-- 
2.37.3


