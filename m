Return-Path: <linux-hams+bounces-1-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBAC7E7E95
	for <lists+linux-hams@lfdr.de>; Fri, 10 Nov 2023 18:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D5E51C2097C
	for <lists+linux-hams@lfdr.de>; Fri, 10 Nov 2023 17:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955CC2230C;
	Fri, 10 Nov 2023 17:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gip2x7G+"
X-Original-To: linux-hams@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0567020B37
	for <linux-hams@vger.kernel.org>; Fri, 10 Nov 2023 17:46:25 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A7F444BEC;
	Fri, 10 Nov 2023 09:36:41 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1cc329ce84cso20251395ad.2;
        Fri, 10 Nov 2023 09:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699637800; x=1700242600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VMefGDLKvWgnCazLOoD6MwII7fE2JXpo8Fb4zAd+e64=;
        b=gip2x7G+FJgtbex+quQLXKOnT/BFTp/O/4k8V28XGkF8Kr6ydAMZAgWl8tdKK4quTN
         PHnh507/04FBFWEWYsbnRMpubrf+Jwqzjn5u1/87LkZVA9Ls1C0Rx+MlGlrut8T4aStv
         XtC3qph8WLOb03FOd2tk2ZF1HzgSmXdt9/Y4vDyVZo47B2cfJNOfMSB2WM+XW15/En8n
         1zKWUua2fzg+Jo33tBL2cFwIsGrOSp4EbTMO1u5kl0/3t7eaWZRcejPr2+ChHayF+kRF
         JBAJuCkC0LmeYxLtn778LHbbGZFng38XUiHnjOGMpYZZcC5eUbttCtWlfNu0cJijKNww
         UBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699637800; x=1700242600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMefGDLKvWgnCazLOoD6MwII7fE2JXpo8Fb4zAd+e64=;
        b=jcsH4D6Az5bu/vGhCmSX7y6G4Uk4Pkv9jSNudgSHZURWV7UBHn9yYXZxX7WON4NWGB
         d+BZ+8X4AlXO2Us+c+LiS1Y6o9Hi0o/J4YxTzTampw062WRftGMgoX6SHflHY9ZmC2Gh
         9oGQ426J+bOlJALZ21cdkl3R6DTmhmnKYYtQFwEAaXcwZ/vueDzY4SfvwsMRpxuaVU1a
         e0WOhiSp6lHNfdLuBKIb6cKubTa8BjoXtB4IbX5gyGh6bGPCKOrf7RkzQXioBmwgr0mR
         wNjeH4b9jU8npzeH5zIQ9JgRS4qddCmXyhpjRTx+9xTTX7zzdS4enkZGnLHcqu5xVoCO
         I+Sw==
X-Gm-Message-State: AOJu0YxgCkj4THsMY9/AS5eiLMmIt1385wtOEVwcIj6RIcR8fRbCT5oC
	IIqyhwdbWbi2LP0c+ASzvSE=
X-Google-Smtp-Source: AGHT+IFds+6JbdYb6/94zoTHlH98hiW+vPVcXNq5TOQwXY4OtmQDVFP55/urNParEbHgDCIxnBSF3w==
X-Received: by 2002:a17:903:4281:b0:1cc:68c1:cab5 with SMTP id ju1-20020a170903428100b001cc68c1cab5mr8281383plb.14.1699637800483;
        Fri, 10 Nov 2023 09:36:40 -0800 (PST)
Received: from brag-vm.. ([2409:40f4:10f7:a461:5bd6:2f0d:5f21:24c6])
        by smtp.gmail.com with ESMTPSA id ij27-20020a170902ab5b00b001c3a8b135ebsm5703329plb.282.2023.11.10.09.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 09:36:40 -0800 (PST)
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
To: ralf@linux-mips.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
	linux-hams@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+0145ea560de205bc09f0@syzkaller.appspotmail.com
Subject: [PATCH] net: memory leak in nr_rx_frame
Date: Fri, 10 Nov 2023 23:06:32 +0530
Message-Id: <20231110173632.2511-1-bragathemanick0908@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The condition (make = nr_make_new(sk)) == NULL suggests
that nr_make_new allocates memory and returns a pointer.
If this allocation fails (returns NULL), it indicates a
potential memory leak.

Added sock_put() for make which can potentially solve
this issue

Reported-by: syzbot+0145ea560de205bc09f0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0145ea560de205bc09f0
Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
---
 net/netrom/af_netrom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
index 0eed00184adf..7d7cda4ae300 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -970,6 +970,8 @@ int nr_rx_frame(struct sk_buff *skb, struct net_device *dev)
 		nr_transmit_refusal(skb, 0);
 		if (sk)
 			sock_put(sk);
+		if (make)
+			sock_put(make);
 		return 0;
 	}
 
-- 
2.34.1


