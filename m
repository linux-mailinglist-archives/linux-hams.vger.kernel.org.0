Return-Path: <linux-hams+bounces-8-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D39802BC6
	for <lists+linux-hams@lfdr.de>; Mon,  4 Dec 2023 07:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF907280CF3
	for <lists+linux-hams@lfdr.de>; Mon,  4 Dec 2023 06:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6896F8F6A;
	Mon,  4 Dec 2023 06:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=theori.io header.i=@theori.io header.b="N/THPLzd"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0732D3
	for <linux-hams@vger.kernel.org>; Sun,  3 Dec 2023 22:57:06 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d03fb57b69so14137295ad.1
        for <linux-hams@vger.kernel.org>; Sun, 03 Dec 2023 22:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theori.io; s=google; t=1701673026; x=1702277826; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQerDqLT/YuVKy8PnJF+K7oN0s4BlSSuzOpk3jy8sxI=;
        b=N/THPLzddHjFTXscP7K0dZrgxzepvVC8wnhnHn0UUG0ltE6Pxu7XxNcXrpocyVMuEU
         s9i8VPkO7iFQDdbuXQ7itX3QzqjW0KWZjG3uTvuiTASHjMS9OyV/BuTilsVsxrK9Ngyo
         3y3CwHeeZPsUnaINeX4PnabSyC28Blol/jhTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701673026; x=1702277826;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQerDqLT/YuVKy8PnJF+K7oN0s4BlSSuzOpk3jy8sxI=;
        b=JaXZorQ/WJfF3q9pc9TGCtrhqCxJe7QicKFZQQF4+90qUKxZJosUsZep+om0lQsVMB
         eYxI0rv3dUFufZuOqYqQdJjdb0gZdH7VdN+Sb8aAYEX+Gykuh7cnfx18N3kwpwzqfQa7
         dywB3t7LPh5vE5euA6+PFp8TM1p0BsOc1Cy9TWWhbPRAyslPqpJ68C4pcKNo2pSk+Ba8
         ukNrejASvCT6TOOvijuBbFNyQwebf0RrnneqUh087G619G+x5ruiGwkb1lkppibCH2dj
         Z9oiCBYaY2CopfxsfBTIJfH2td3xkK+keTp3+rCWT53pnUcKegryNe1+XMWrGPd/dOI6
         QjZg==
X-Gm-Message-State: AOJu0YzOioz4Aa41YuGiF1aWOzbfn1IHCVLrDTnExUjsNNsuKI1IgOOW
	Dxg86iBeDDKKWCS29inJX0MgBQ==
X-Google-Smtp-Source: AGHT+IFNNVKaL+XBoun/3jgvrDxt2YOZK0MpsdVAjuRuoVTESBuUf6Y2VzcR5p72aXnQye4i+YOtrQ==
X-Received: by 2002:a17:902:d48a:b0:1d0:9c9d:dcde with SMTP id c10-20020a170902d48a00b001d09c9ddcdemr574828plg.122.1701673026294;
        Sun, 03 Dec 2023 22:57:06 -0800 (PST)
Received: from ubuntu ([211.219.71.65])
        by smtp.gmail.com with ESMTPSA id ja5-20020a170902efc500b001d0b080c7e6sm655829plb.208.2023.12.03.22.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 22:57:05 -0800 (PST)
Date: Sun, 3 Dec 2023 22:56:57 -0800
From: Hyunwoo Kim <v4bel@theori.io>
To: ralf@linux-mips.org
Cc: v4bel@theori.io, imv4bel@gmail.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux-hams@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH] net/rose: Fix Use-After-Free in rose_ioctl
Message-ID: <20231204065657.GA16054@ubuntu>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Because rose_ioctl() accesses sk->sk_receive_queue
without holding a lock_sock, it can cause a race with
rose_accept().
A use-after-free for skb occurs with the following flow.
```
rose_ioctl() -> skb_peek()
rose_accept() -> skb_dequeue() -> kfree_skb()
```
Add lock_sock to rose_ioctl() to fix this issue.

Signed-off-by: Hyunwoo Kim <v4bel@theori.io>
---
 net/rose/af_rose.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index 0cc5a4e19900..5fe9db64b6df 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -1316,8 +1316,10 @@ static int rose_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 		struct sk_buff *skb;
 		long amount = 0L;
 		/* These two are safe on a single CPU system as only user tasks fiddle here */
+		lock_sock(sk);
 		if ((skb = skb_peek(&sk->sk_receive_queue)) != NULL)
 			amount = skb->len;
+		release_sock(sk);
 		return put_user(amount, (unsigned int __user *) argp);
 	}
 
-- 
2.25.1


