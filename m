Return-Path: <linux-hams+bounces-633-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4B6B5584C
	for <lists+linux-hams@lfdr.de>; Fri, 12 Sep 2025 23:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4B3D1D61FE4
	for <lists+linux-hams@lfdr.de>; Fri, 12 Sep 2025 21:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F16A25228D;
	Fri, 12 Sep 2025 21:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msb/XFUi"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671B222FE18
	for <linux-hams@vger.kernel.org>; Fri, 12 Sep 2025 21:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757712148; cv=none; b=I0TfG+7mpAy3p5tl2Z+L35i6yP/pDF1s8n0emM9jfZW1J5LXAuBOCw4o3Pyz5c5wV/j5R4Bv9RoQSYAxdaXZ70/e9txKlUP8Ry7rtRHIcppPx6ptZWMVg2wHXkR0n70MGBBbqpanibOB171oiwI5wTi7b6Ee6LgLQavr6KUP9I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757712148; c=relaxed/simple;
	bh=0QDEMIkD0ujZYhffTIC0PtzHOyjYuE9Qn2yWiOmBpBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GCoClvGM9vh8GME0kUEQ4bs60fa69DDCnDFRO357AQ5vuZV6fPezuUVbH4eWRMVK83ptYpXxZ1aix01SP5bbMTIVrffMVQyj9V4EDFxFKbv+7rpM/3Eaqlbkli1ffZGrQsPCmmBHQQsRVpdoaZIXO4Eq9Gswz76uni6SxOI0uX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msb/XFUi; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b54a74f9150so1399767a12.0
        for <linux-hams@vger.kernel.org>; Fri, 12 Sep 2025 14:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757712147; x=1758316947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P6OytC4WzM7xin5NB/68oPu8ar5BWRJQQBFVeXDGUks=;
        b=msb/XFUiz8n8cf/Kqwf9QRrfIy0DXaaO1w/BMJBHwG2tGNQh/xnJhD0DfULo5GZAt6
         0r0PZAZVAgSZc+0BEPjzJGzQH7RAmHd7A+ZoAhZw/KQQPRv/aNimLFGyWZerp3bTAokl
         GhAmSM9VJQZ1X99TqypAxFARS3M4f9TV1m+M3olW18K8T9BqEzejhimPVZLJwZdhvhLe
         e7Ts1gsHvcmybIr+k1Bn5I7uAe0nBRz3qepsCFP3j2Non9sTY7v8SSzVVlLLeHP8SaqZ
         3McjGMGhgIUl1qq2BkXvLZM8StrUb58jF4XDKOAmP0E+rYNCxZjlVNaAQzFqA3VCo6So
         P+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757712147; x=1758316947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6OytC4WzM7xin5NB/68oPu8ar5BWRJQQBFVeXDGUks=;
        b=woEVp9fWFHRhJlyDyULGPmWcSKmfaJwGlS4BNad3vVlvlkmTwcFbw3Lsk9Am9thzQF
         iZBSrtTKv9vwK6hNvs3rqesrSAA9dPCi3jsHidGh2VjBxXDuqaZEX8CPVLtDyxrW9lg1
         6bCksC/KxxpLexFb/D6czUzVZgkNvP4AAanXyns+sjW+saegs7TxlYfB/UMcLJ6BVaOj
         B5v2KrNYJpZMJUGdnTg2rjZZjurp1AmxYtaDda+k7C7soo2QG7ThKTntux6wbVtVlT9+
         zix2zAcdF8dnYTeWHzUqPyfl0K4KkO+uMi0MQ/LAz+7hnaU0FZHdWqQLYJMqLrzi1H34
         UR7g==
X-Forwarded-Encrypted: i=1; AJvYcCV3lx6RQTuYKelZSEWR5a9teqkYCpUdww7M/zkyEB7ajwnWEaFKyYUL8xLSOhfE2ItqkxYND4a3CH+r@vger.kernel.org
X-Gm-Message-State: AOJu0YwQcC7P2UeXS1fBrlPjfQaboAFMWKRU9cSZXHRdeq8hTKTXaTdx
	/2HK13wRV/odZG6CiyIW5BfLUjTwiMVgqU1pgOBxsyBqss/agGAg5Qjk
X-Gm-Gg: ASbGncu8oO6jgHQRxeEoIi4uVj9bgSxuXcFaYGk342lYCWy5n2iDNXY7gyg/0dvTlZT
	EktgPge8Q6YKEefDGfUsn7hSw6uQQLcXpei5PFSnRNPKQajimBCo3U6Z8d8EHMYVvUwq3wNJfKK
	az0/k6GR4se+PfmKjB5K7v4NvcKtZp1g/LkMulfGJHXWeCNOiNajKqtuqWTQ5AzzX3KuvK0mOWT
	cQ+AirafZJTbNj/DItDebj1k5iM96rxGSDxDPiGj37ps8Nbu8QtF+48hMTWkD1Jktu+4GI5Eq7K
	yLVNQNsPmIvD9lZwu1TA5grUhmGiR78CETaoA24uuZHCCIWYg5xID2UOa2vUO4Y5BcJJigQW9Gw
	ezPlojIZs/3ifJy1xYAaQqaNyC3Xt3EN75mYQ01alch8Bci8rVz2CN1ON/CIV5QLvbrREMw==
X-Google-Smtp-Source: AGHT+IEQq4b8hyO+zBL1CbmGsvcwCC1z7ykCNzk57MZB1tNy3T0mA7mB7VPfoTd5YWUBYMazeI7JTg==
X-Received: by 2002:a17:902:ce92:b0:24c:8d45:8049 with SMTP id d9443c01a7336-25d27a27d59mr45376955ad.61.1757712146567;
        Fri, 12 Sep 2025 14:22:26 -0700 (PDT)
Received: from lolcat.iiitdmj.ac.in ([14.139.241.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25db018df7esm25710095ad.152.2025.09.12.14.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 14:22:26 -0700 (PDT)
From: rodgepritesh@gmail.com
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-hams@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+7d660d9b8bd5efc7ee6e@syzkaller.appspotmail.com,
	Pritesh Rodge <rodgepritesh@gmail.com>
Subject: [PATCH] net/rose: Fix uninitialized values in rose_add_node
Date: Sat, 13 Sep 2025 02:52:16 +0530
Message-ID: <20250912212216.66338-1-rodgepritesh@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pritesh Rodge <rodgepritesh@gmail.com>

The rose_add_node() function uses kmalloc to allocate a new rose_node
but only initializes the first element of the 'neighbour' array. If
the node's count is later incremented, other parts of the kernel may
access the uninitialized pointers in the array.

This was discovered by KMSAN, which reported a crash in
__run_timer_base. When a timer tried to clean up a resource using
one of these garbage pointers.

Fix this by switching from kmalloc() to kzalloc() to ensure the
entire rose_node struct is initialized to zero upon allocation. This
sets all unused neighbour pointers to NULL.

[1] https://syzkaller.appspot.com/bug?extid=7d660d9b8bd5efc7ee6e

Reported-by: syzbot+7d660d9b8bd5efc7ee6e@syzkaller.appspotmail.com
Signed-off-by: Pritesh Rodge <rodgepritesh@gmail.com>
---
 net/rose/rose_route.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index a1e9b05ef6f5..6ca41cbe867a 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -148,7 +148,7 @@ static int __must_check rose_add_node(struct rose_route_struct *rose_route,
 		}
 
 		/* create new node */
-		rose_node = kmalloc(sizeof(*rose_node), GFP_ATOMIC);
+		rose_node = kzalloc(sizeof(*rose_node), GFP_ATOMIC);
 		if (rose_node == NULL) {
 			res = -ENOMEM;
 			goto out;
-- 
2.43.0


