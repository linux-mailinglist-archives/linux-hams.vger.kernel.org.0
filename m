Return-Path: <linux-hams+bounces-37-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA2F86FBAB
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 09:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03878B221B2
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 08:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CAA17BAA;
	Mon,  4 Mar 2024 08:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q12Fsfcg"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B27A17C70;
	Mon,  4 Mar 2024 08:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540466; cv=none; b=OQlKScvWo4TG8400jl9XmesFzXLy/5/lJIeG1d93NdUla4B6snjVVLQyviCKrEuuhD1I4wAObNZmAclzocQ2Ij+cuF6/rdeQf1g+xkuAeE6qkdshxEWxnegpfILd6Gkd1OQeCA1uqt5CXhXXA5CdQGUKidahidaNbXAQFToy4sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540466; c=relaxed/simple;
	bh=yhH2UYOqevAYlqYBGeKOJeeW9sSDT2htpvDl5fgO+7I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y4ljK7TjBb3LIXsN/im2V3zn6a5iw28sOcVVtDiS9J6/6GgcQMzy95m1QoaxCyL6WLaTatEchyBes6VZSUOQyOk/zwoE91HiZW0cAUoD9gQsz3/cFPKfB0zl5OL0px8ssQbvcIAGbJM4/SAG7fZMv+DyvYejtyCTUPYcPcLI+9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q12Fsfcg; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5d8b70b39efso3832760a12.0;
        Mon, 04 Mar 2024 00:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709540464; x=1710145264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQRxft7r3433IK//L+TED8XHsmqad6EmXJXus0LGyRk=;
        b=Q12FsfcgwHaBg3KetqNE28YWPz/xKohBnmxeUS29fJiFGoHqNOZiLBSSO/O3UBvT4j
         HduQGEFdckjvK2AXproLxZ08CkcsWwj2bt69pGXu948K8NO41800oiFWJVtzUb8kIMCb
         bHN3/J4KLal/dGWbYwKDHwMWq5NH/cDhT9QmLvla+1akj6O0ycgptxRz1NsJobUArSPT
         YbtKDCTS/XiKh5g3P9efrs2IF7wB7GKGlqjo/ne6POURoAefYDo6vp0eybXPuLTMYJp6
         SnLa9BOVcGzbHjG76cncS9HIVQrV3f22ntrE+BzQIKJ3LBPjwAwM+UtSIBuicTz4ChLZ
         9X/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540464; x=1710145264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQRxft7r3433IK//L+TED8XHsmqad6EmXJXus0LGyRk=;
        b=Ij/uvYIYA9vTJM/vZftanzs1A5JBOUdWVpeBYYgW0tkHPRBaFIqgxH1wwFILoIS8tf
         naoJZOYWcmkUiRqVj2XGG04oGmEAbx0/J6viWNNmDFcq9Viwfn0jXZgUa9SwxKkM1sAo
         WY7k3I5RhWGzRCf2qRJnrS20YnLvU1JK2znnDsq8mO8hUAINF2utW5mV9ou8r7Rlx71L
         7DEdtt1Q0JlLFBS9dLDAb+/CTEsGq7BE1tQrRA08jYXweM0qgaXeC+j63uP76q6vPXWv
         LkXbLwN8OOXotMNVu9n6Dwl0If2k5I1Z7AqoQGjS8m9A6GF05UCPPm11TP+5ZZBodeLI
         F0+A==
X-Forwarded-Encrypted: i=1; AJvYcCWEJtMGpGIpC90vIAYK+Ag0eanCZfySK1M0BQc5zqg4090QViDzs44v+P33GBw03aq8Z8rLgOLyhDUH8abPoqa5GApMJ89d
X-Gm-Message-State: AOJu0YxIzKzXrRvJdsvRfAtVUf8iJ5er3wB6WBmiaEtRgVWaaaeKKli/
	zVug5i5EWgD4QEuumIF4on2HJwhoooyKTqmkXwaopHF+Vfe93nlw
X-Google-Smtp-Source: AGHT+IEgWrkgtx7U78l40RJHwt9p387FijzCVTjb3SV5lPa1veeNljZzgAUpWsxze0KuY6X3XMDfVg==
X-Received: by 2002:a05:6a20:1592:b0:19e:ac58:7b0d with SMTP id h18-20020a056a20159200b0019eac587b0dmr6108135pzj.5.1709540464595;
        Mon, 04 Mar 2024 00:21:04 -0800 (PST)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902c3cc00b001dca9a6fdf1sm7897014plj.183.2024.03.04.00.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:21:04 -0800 (PST)
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
Subject: [PATCH net 04/12] netrom: Fix a data-race around sysctl_netrom_transport_timeout
Date: Mon,  4 Mar 2024 16:20:38 +0800
Message-Id: <20240304082046.64977-5-kerneljasonxing@gmail.com>
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
index 0eed00184adf..4d0e0834d527 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -453,7 +453,7 @@ static int nr_create(struct net *net, struct socket *sock, int protocol,
 	nr_init_timers(sk);
 
 	nr->t1     =
-		msecs_to_jiffies(sysctl_netrom_transport_timeout);
+		msecs_to_jiffies(READ_ONCE(sysctl_netrom_transport_timeout));
 	nr->t2     =
 		msecs_to_jiffies(sysctl_netrom_transport_acknowledge_delay);
 	nr->n2     =
-- 
2.37.3


