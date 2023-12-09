Return-Path: <linux-hams+bounces-16-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D97AC80B38B
	for <lists+linux-hams@lfdr.de>; Sat,  9 Dec 2023 11:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D659B20AE4
	for <lists+linux-hams@lfdr.de>; Sat,  9 Dec 2023 10:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BCB125B6;
	Sat,  9 Dec 2023 10:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=theori.io header.i=@theori.io header.b="Oe9dcVWc"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B146C10DA
	for <linux-hams@vger.kernel.org>; Sat,  9 Dec 2023 02:05:43 -0800 (PST)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1fb0022e6a5so2026587fac.0
        for <linux-hams@vger.kernel.org>; Sat, 09 Dec 2023 02:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theori.io; s=google; t=1702116343; x=1702721143; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s5PCTRTJRZnHK1MRbANCAmJkU16b0mVctmay1KaTY14=;
        b=Oe9dcVWcGt38FFugG/p/rM+T2epgZb+dJRdQT9xt2VuSDCDLvIU9VqMWtIk1beFZUo
         WDWbJt+KSid8TNEpnSYt1cRLr3H+0gSQMweiKN0yzCzzeR6I/WIZZYer9sQYDQU0ROq0
         r9N+hyL9aIXJFc4QbNI7k32C0HEByOb4ZWV3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702116343; x=1702721143;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5PCTRTJRZnHK1MRbANCAmJkU16b0mVctmay1KaTY14=;
        b=QQssm5aMlpUMyq0rORxTD4fk49MxYpzamI0fC4v/uzOxUnFFEuNIxmRxV4SqPmUMyk
         DeObVZospXTEe3ngYNBQiOMXU02QQ+qM4IkM3t8vlJcL5P01nUwyCfAio4pfI1kqWpZa
         IO4TxsZRKu6vvS03V3XzKgEsDJrUVE/ZvFH2LLHv9HmHTdMlVI5hH6dN6Jyopu4A5dWO
         zIkvyjiE+dQE3et3UG9gdgLfpzrlp9vdVoVJY/fJTjpAFj8+yNUxu07O9LPd6At+IoyH
         xiu3hnZNQtm0siAPWjQC5hSkTB5uK7XNfwVEhBIxvSGejDsGmUCPD1FlTz3HvdIa68Tl
         5GRA==
X-Gm-Message-State: AOJu0YwCYytV/Wi+CcqBXU3wYq8aZy4fhaqDewnzMkwIgApGLrSdGH0j
	0/2/hXcO4tYxpAZ6DutdmRWyuWqumjrBD/X43Oo=
X-Google-Smtp-Source: AGHT+IFqUTfK53OGgVUo3hyrpGjNPYDkuoBGZ7aTIyivGMBPwZwtRUuRlEC6XuuIsvCmvt2qXtNnvA==
X-Received: by 2002:a05:6870:d18c:b0:1fb:2bec:9fb5 with SMTP id a12-20020a056870d18c00b001fb2bec9fb5mr2088274oac.0.1702116343074;
        Sat, 09 Dec 2023 02:05:43 -0800 (PST)
Received: from v4bel-B760M-AORUS-ELITE-AX ([211.219.71.65])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79111000000b006ce6c661701sm2642953pfh.139.2023.12.09.02.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 02:05:42 -0800 (PST)
Date: Sat, 9 Dec 2023 05:05:38 -0500
From: Hyunwoo Kim <v4bel@theori.io>
To: ralf@linux-mips.org, edumazet@google.com
Cc: v4bel@theori.io, imv4bel@gmail.com, davem@davemloft.net,
	kuba@kernel.org, pabeni@redhat.com, linux-hams@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v4] net/rose: Fix Use-After-Free in rose_ioctl
Message-ID: <20231209100538.GA407321@v4bel-B760M-AORUS-ELITE-AX>
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

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Hyunwoo Kim <v4bel@theori.io>
---
v1 -> v2: Use sk->sk_receive_queue.lock instead of lock_sock.
v2 -> v3: Change spin_lock to spin_lock_irq
v3 -> v4: Delete old comments
---
 net/rose/af_rose.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index 0cc5a4e19900..ecb91ad4ce63 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -1315,9 +1315,11 @@ static int rose_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 	case TIOCINQ: {
 		struct sk_buff *skb;
 		long amount = 0L;
-		/* These two are safe on a single CPU system as only user tasks fiddle here */
+
+		spin_lock_irq(&sk->sk_receive_queue.lock);
 		if ((skb = skb_peek(&sk->sk_receive_queue)) != NULL)
 			amount = skb->len;
+		spin_unlock_irq(&sk->sk_receive_queue.lock);
 		return put_user(amount, (unsigned int __user *) argp);
 	}
 
-- 
2.25.1


