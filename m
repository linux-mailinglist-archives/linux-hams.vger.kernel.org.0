Return-Path: <linux-hams+bounces-10-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FA780660B
	for <lists+linux-hams@lfdr.de>; Wed,  6 Dec 2023 05:13:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6D881C210E4
	for <lists+linux-hams@lfdr.de>; Wed,  6 Dec 2023 04:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D27FBFF;
	Wed,  6 Dec 2023 04:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=theori.io header.i=@theori.io header.b="etOhwjVv"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736C21B2
	for <linux-hams@vger.kernel.org>; Tue,  5 Dec 2023 20:13:38 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5bdb0be3591so4082154a12.2
        for <linux-hams@vger.kernel.org>; Tue, 05 Dec 2023 20:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theori.io; s=google; t=1701836018; x=1702440818; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oOHc6QyaDwHjnEVxm8dvDPgk1E/JDcpfXl0VFN6+nK8=;
        b=etOhwjVvddmTvwtiKzC+6zzQ9WQ4uc8axrw2rtlU98Uau71uJEOahp03wD4Dy2N0Pm
         2D6ZiNUs5sHepUS/faPONQS196pVPnayG94ci9gFIp4BdK+YCjEpVuOW8g+XBtHmZT7t
         jzpylP7KPBXZeng/IdcVHDaYp09pFCGQVcryU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701836018; x=1702440818;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oOHc6QyaDwHjnEVxm8dvDPgk1E/JDcpfXl0VFN6+nK8=;
        b=VKxxH8PhiggbnHYuaoHkVCm0V5hZQy9KdN715IX7S9AW3du0B1dJ2Yl369HmrOvsml
         eBLoWkKRlA9kVbQo9/lqWIkScfWpAMnFGMI9Zsn0IAPa2L74yZUW/df9emegOIgvhkyP
         6ZtL2pY3Qu/kR2KuhHdUm81gW4s8WzdPren2CL1VANx65GbcYtmGtJBZUoDfzOuXtiM6
         +oW9qqg/S1DSUIWpuCfvz7vlETb6UQLlUgMexzgYL15CgSnydY3dStWc5SCb4zWFFoQw
         jMbE70VRE4EqH1yg8wAoQsYX7Z/M6g2MMJw8MDi6DrLtf+bAIIpm7G0BqT4dRgB7V3lb
         utMg==
X-Gm-Message-State: AOJu0YxWA91Swt/5eG0103a7ak4r6UWKfpylgolvSLAFggKb8rA53BDR
	cDxIB44A+IhLV7Lq5p0zrtO9Kw==
X-Google-Smtp-Source: AGHT+IGdh9U3OCtROxIM8QKFTrsQK7v0aMRwqwLIYVUMTH/0WDMm0SyUllTuKsdWeqrsSRq1arGeKA==
X-Received: by 2002:a05:6a20:a498:b0:18f:97c:8a4d with SMTP id y24-20020a056a20a49800b0018f097c8a4dmr244297pzk.120.1701836017797;
        Tue, 05 Dec 2023 20:13:37 -0800 (PST)
Received: from ubuntu ([211.219.71.65])
        by smtp.gmail.com with ESMTPSA id ci5-20020a17090afc8500b0028596286f5fsm6706856pjb.6.2023.12.05.20.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 20:13:37 -0800 (PST)
Date: Tue, 5 Dec 2023 20:13:32 -0800
From: Hyunwoo Kim <v4bel@theori.io>
To: ralf@linux-mips.org, edumazet@google.com
Cc: v4bel@theori.io, imv4bel@gmail.com, davem@davemloft.net,
	kuba@kernel.org, pabeni@redhat.com, linux-hams@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2] net/rose: Fix Use-After-Free in rose_ioctl
Message-ID: <20231206041332.GA5721@ubuntu>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Because rose_ioctl() accesses sk->sk_receive_queue
without holding a sk->sk_receive_queue.lock, it can
cause a race with rose_accept().
A use-after-free for skb occurs with the following flow.
```
rose_ioctl() -> skb_peek()
rose_accept() -> skb_dequeue() -> kfree_skb()
```
Add sk->sk_receive_queue.lock to rose_ioctl() to fix this issue.

Signed-off-by: Hyunwoo Kim <v4bel@theori.io>
---
v1 -> v2: Use sk->sk_receive_queue.lock instead of lock_sock.
---
 net/rose/af_rose.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index 0cc5a4e19900..841c238de222 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -1316,8 +1316,10 @@ static int rose_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 		struct sk_buff *skb;
 		long amount = 0L;
 		/* These two are safe on a single CPU system as only user tasks fiddle here */
+		spin_lock(&sk->sk_receive_queue.lock);
 		if ((skb = skb_peek(&sk->sk_receive_queue)) != NULL)
 			amount = skb->len;
+		spin_unlock(&sk->sk_receive_queue.lock);
 		return put_user(amount, (unsigned int __user *) argp);
 	}
 
-- 
2.25.1


