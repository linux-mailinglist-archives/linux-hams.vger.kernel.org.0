Return-Path: <linux-hams+bounces-716-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B071C93751
	for <lists+linux-hams@lfdr.de>; Sat, 29 Nov 2025 04:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1017E3A848A
	for <lists+linux-hams@lfdr.de>; Sat, 29 Nov 2025 03:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB15F1FBEB0;
	Sat, 29 Nov 2025 03:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfxNUmzL"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297DD16EB42
	for <linux-hams@vger.kernel.org>; Sat, 29 Nov 2025 03:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764387763; cv=none; b=jxsAMVZ6fVSG5DNbzZ1zNEneHs8w4xv5sonkuqCrjc8nPA4JamZ6CvGakK4lVza1DS9iw5wU+Wpp6BwSLCi7PXZI/ongGDlR7zENVZu/0vWBwVFcxRbT3+Z7wjthGzpbb1owtX1dZh1B5tmRvQJNlTITMFIB0gUV9Zwyu6QslaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764387763; c=relaxed/simple;
	bh=coXSfP5iPGP0DKvWU7gjkly+OWEx2e0tPwXLluGYykA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dXMPgY52h0Kl37l8S/AMsoeqQAGHfspCw/II2Xf3c6smC1vonqFNjpL7wRjJ8dyavN2pbu9ojgIyECDG0ZXlIFgNejFXHn95O4ImUGQL7pqzULhofZvOrFuRWgY6ekx1r0snuu0VnWcIeSB0k3beQE+BC9VQMHIcieDvbQl6Cp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfxNUmzL; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso2969536b3a.0
        for <linux-hams@vger.kernel.org>; Fri, 28 Nov 2025 19:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764387761; x=1764992561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zwwuqAjXyQwlWsKtZ5Jk1RCQQpe+aHMmcqGyV/n+5zo=;
        b=CfxNUmzL0tmVsNPtt6aRisBb10procnF/W7iN5DmEka66Dm4ncd0/bHeMLXIAbJ/Vn
         /7NUNKS1RcWs8N6Gs3+eJvpEqPWv7SqlEtY72tGSskFHoONAUEko6cOFJcLhp4UP6CR9
         RQQtK92+g+J6HWXHVjIAqZg5d6ztyn5piUjhJoHgbyqzrEXCUMci5FdRTzClCEJnrxCz
         MBt/m0p0XDQntxMisVPA8ZXVhaMJrvEWB9A+9OUG+YLQlEsy77Yhxuspq6PCf6aWDE3D
         XbJkoumU2cfbE5LKfmkTITkVEXsh/xswX4Zistqhy+1fy+xz8aU2bIXGO1cBaI+HVi+3
         OW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764387761; x=1764992561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwwuqAjXyQwlWsKtZ5Jk1RCQQpe+aHMmcqGyV/n+5zo=;
        b=oKCnIY9uSJCYcgKj90zpc/dl3nBcGnTelxz/mhPZnkFKKTLgG20KOizZnU1CVsFQw2
         vCR0dDJqH8atfePFLo8XN1c8IOutkUvreBnhyxc0pph9Dfc0CRI9wAoWMDocPRD/osxl
         i3dVXaXSm8qopZE5XN/QNXn3pjcowErraw1PY3tLDnuSDUIpiUSM+v7NZf9HqpKFsB8O
         GCqEpmt1sqcNLUGMMApkxpkzTFEHhrfqhxYdihmldHMXbSJWBYzruAyAT+nvLmC5p+Eo
         AWIvgLmZHmJpD045mVE4HxpFTx3rWChhuzJHCNUVzVuit0Sh9JiUITheAW8hj57aidOA
         LJEw==
X-Gm-Message-State: AOJu0YwcUDQhmrB5HcFVQCueBtaOEeCiTLb3b2TCRLVKLKZ57hsL9PU3
	lnMOWBSFmk+ldzAQ9CJNfrI7olU+yDaGIMSRDBQWVlJ8ct6QJkpdCRTQ
X-Gm-Gg: ASbGncvZeZP6sPIMx3k0CmCMvrHO5J6EkxmoVhD2tP/crIU5XFcwPWCWAUfmxnQyXcR
	9qfHaeuP6i085J8ckCn5DLJYLyow3w1iLBWKuQs5jOUNKiiPdOmYFMizANpSA6LiktDJ/kTaSPv
	8f02rKqkVEtGAr9HlaHkA2WYxFSVtHANr0AjPtHdqmJZo/HNvJN4lJaphI18I+J/9DQs6l1AHlx
	/v5pZz0q4v0tlNtKbOFTUkH6JwdDBohpL1LrdHXLEpp6x7vLHE2ZEejEHCdE9CmRmVsSE94Vohm
	66I56zVRTdoF2fQIUjbawF6G8OWXP5WZUuJTzfIIAwaR2heD3SQuAygxJo2nhrMdo/rHCBezQra
	KyHFPd+1bJE0Wf+JGBF6rjRHOpvObQ14KpnYPMbuAztinYcEFs63J/sa6Tf3y8ygDKZ14bd3SIG
	14ry4jjlYFVOMyWrVkLP3Kn/Y/WBY3OSc5FmQ=
X-Google-Smtp-Source: AGHT+IEiQ6DpI97phaBc+ZBVNX65hiovuUDQNBEt3GfuthdkTrdaGVhbOIUr5+950kDrLtgYPzqSvw==
X-Received: by 2002:a05:6a00:1803:b0:7b8:8185:c23b with SMTP id d2e1a72fcca58-7c58c7a631cmr30441891b3a.10.1764387761388;
        Fri, 28 Nov 2025 19:42:41 -0800 (PST)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:389d:9cfe:b2cf:9d3f:f1f1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15fcfd0cfsm6413100b3a.65.2025.11.28.19.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 19:42:40 -0800 (PST)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: linux-hams@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+d7abc36bbbb6d7d40b58@syzkaller.appspotmail.com
Subject: [PATCH] net: netrom: fix memory leak in nr_output()
Date: Sat, 29 Nov 2025 09:12:32 +0530
Message-ID: <20251129034232.405203-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When nr_output() fragments a large packet, it calls sock_alloc_send_skb()
in a loop to allocate skbs for each fragment. If this allocation fails,
the function returns without freeing the original skb that was passed in,
causing a memory leak.

Add the missing kfree_skb() call before returning on allocation failure.

Reported-by: syzbot+d7abc36bbbb6d7d40b58@syzkaller.appspotmail.com
Tested-by: syzbot+d7abc36bbbb6d7d40b58@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d7abc36bbbb6d7d40b58
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 net/netrom/nr_out.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/netrom/nr_out.c b/net/netrom/nr_out.c
index 5e531394a724..2b3cbceb0b52 100644
--- a/net/netrom/nr_out.c
+++ b/net/netrom/nr_out.c
@@ -43,8 +42,11 @@ void nr_output(struct sock *sk, struct sk_buff *skb)
 		frontlen = skb_headroom(skb);
 
 		while (skb->len > 0) {
-			if ((skbn = sock_alloc_send_skb(sk, frontlen + NR_MAX_PACKET_SIZE, 0, &err)) == NULL)
			skbn = sock_alloc_send_skb(sk, frontlen + NR_MAX_PACKET_SIZE, 0, &err);
			if (skbn == NULL) {
+				kfree_skb(skb);
 				return;
+			}
 
 			skb_reserve(skbn, frontlen);
 
-- 
2.43.0


