Return-Path: <linux-hams+bounces-749-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4051FD38D02
	for <lists+linux-hams@lfdr.de>; Sat, 17 Jan 2026 07:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D97130319FE
	for <lists+linux-hams@lfdr.de>; Sat, 17 Jan 2026 06:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DD5314D0F;
	Sat, 17 Jan 2026 06:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hk83zeIu"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04842303C88
	for <linux-hams@vger.kernel.org>; Sat, 17 Jan 2026 06:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768632809; cv=none; b=AdBnVXjlvtiBxHXVEG+I24Gq5/AUBsYJGB7td8Cv71oOr+7vGYR6JwjloW/e5XVz4cnTeKKcZGBsIDLABhXt5RLFlc+uHVQHVREdPkGJV6DOq1GAwULzYR/r43a+lL0y2II7+Nk8AAVs91l3LgF/ljIfbDjpN/8Alh3NKFKBYWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768632809; c=relaxed/simple;
	bh=wa6vuB9JRnirEiTJdbuYjUdjPSbw4Z5u3/ha86tPljk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CQ9CEXtL+V6AEbLEEsXAtASLxMXZZcoNRJau/K5/bYgTjVsuka6isywsbA7s78Irn9Dk3PJww/g0jJj0jbtF0E9/42tN2SIs8t5EXiyGeyjRQ0wtniKh6k4Imod9gdMhN9nLQYyJ/YSuoioyoas0h+2tMHqOZieyAkzoQ7DwB4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hk83zeIu; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c0c24d0f4ceso1046530a12.1
        for <linux-hams@vger.kernel.org>; Fri, 16 Jan 2026 22:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768632807; x=1769237607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jl+ikO1mWiP4R9MtrTZgFyugi2SRJMPKhkoPAYsVxK0=;
        b=hk83zeIu05NT3c5oEVgCvqdb057LaSEV+iUbDtsSMbXTjA7CGPrlDccB/lafZ5ROo/
         /scNh5F4DIc8yuAyVzV0o7DzEpEPhTfRyjQ21BuVjiYytAZHhfzbuYwOC9JhfJ7ijg+j
         RUGWPTJiL+UG3n6JmV5ZG7xa6FWWLOdi2uC4LtL9/u6wK8e99mSuy6I5BWNokd6XEln+
         X1aZKZM413nPy9NNWeRIM77mcuLdQqFchmKk/ZcwMtS+ZxV2qvxk61ofpVytSpCCEQjO
         OjohvTBonhIc7oSVdHQX0O6BOADj1tT3bZzODvA170rE0wRQmbHn3La3qI2+El3dW0uF
         mYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768632807; x=1769237607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jl+ikO1mWiP4R9MtrTZgFyugi2SRJMPKhkoPAYsVxK0=;
        b=U0RSSubqUn/VjnAhLe2xnfUj9XBG4XT9Ricp6gp65GV+0cOe4UQkmvDCIs8Ey6QZRV
         2IUqx71/L2RIbKoaeevUkOGrSbbQZWAVkBWqeIZ1v3HZT3tXjq7zZMZ/ySmoBEVBJdC+
         gzAgGyRtaPXnGmTbylwdEVSpMGJc6g45HEcrqbllsDZJC49Qr/Le7LHQltLTTBCU5R03
         SchuHMbzU9Njrlxc0UpUBHgXTHflu0LZtJInpAvGUSmK9mE6f75xv/SjFyYUi91L4vZm
         +CmJibnfmZym3lt6wh0K6m2lRLu3Pzs/uqlFapV7Rk58zsBi/mdZOrMu6wR4Klbr10yD
         e/PA==
X-Gm-Message-State: AOJu0Yxv+Fy/Fk3u5uIaBc3nsQJNtcSA+dpOtE3twEsjmqHhh18zc6nD
	S9IpGe5K2d7Ki+hzyBpnlv8IPl6dtW0KBbYU8EetJi3/65tiO4JoldqWpHw0Fg==
X-Gm-Gg: AY/fxX55gD04TW0gdP7XRIlo2hVraiyVe7h9qNjm2gFPm2n07fe7vD5p7lL8k2tnA6k
	90YCvK49YM5WXFjoeISlfUfFaWptOSJ3kWZ7SUEsQfImx+c/SgZAJqgirve/VS/0MDMUVPy66db
	RTGgwN4RY4NDYrHqwxkNO+p9WQ70mRi2YPbESvkxG5Nk5DFXN+wyIrmUySbfussvcUyxtygUPl/
	ZXh2KERei0OV0dWtHLoTfhzJ9YySS9ExUu4u4j5kI/B0l4YtnbWxoMatSZHOjwKmo9v2ugQdI2I
	01DK0ssy9iEwIsXnM0tx4YXmU3wmLKXWbU10SC4nVGu4AujPS3xNyyDhho1Md2G/LoJCGVerdRg
	zwPO7xvoJt/RrshEelkNKbvog8ZdRFFVtT1rtetldAnU+uHbcLpsLhIwNbx40b6DtUDrBRtfKVg
	0giyjbkR8Jj/l5STjk9sp0S7+2WXSt
X-Received: by 2002:a17:90b:2e08:b0:340:54a1:d703 with SMTP id 98e67ed59e1d1-3527329cef9mr4740206a91.35.1768632807329;
        Fri, 16 Jan 2026 22:53:27 -0800 (PST)
Received: from localhost.localdomain ([111.125.235.106])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf355ca7sm3711091a12.27.2026.01.16.22.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 22:53:27 -0800 (PST)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: syzbot+df52f4216bf7b4d768e7@syzkaller.appspotmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	horms@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-hams@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: Testing for netrom: fix KASAN slab-use-after-free in nr_dec_obs()
Date: Sat, 17 Jan 2026 12:23:13 +0530
Message-Id: <20260117065313.32506-1-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <69694da9.050a0220.58bed.002a.GAE@google.com>
References: <69694da9.050a0220.58bed.002a.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test upstream be548645527a131a097fdc884b7fca40c8b86231

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 net/netrom/nr_route.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index b94cb2ffbaf8..788e375537fe 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -466,7 +466,6 @@ static int nr_dec_obs(void)
 				nr_neigh = s->routes[i].neighbour;
 
 				nr_neigh->count--;
-				nr_neigh_put(nr_neigh);
 
 				if (nr_neigh->count == 0 && !nr_neigh->locked)
 					nr_remove_neigh(nr_neigh);

base-commit: be548645527a131a097fdc884b7fca40c8b86231
-- 
2.34.1


