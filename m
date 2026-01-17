Return-Path: <linux-hams+bounces-751-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3A3D38F07
	for <lists+linux-hams@lfdr.de>; Sat, 17 Jan 2026 15:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE7C9300532B
	for <lists+linux-hams@lfdr.de>; Sat, 17 Jan 2026 14:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E07D2192F9;
	Sat, 17 Jan 2026 14:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1dWJuKX"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04B81D6187
	for <linux-hams@vger.kernel.org>; Sat, 17 Jan 2026 14:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768660040; cv=none; b=kcRI/zoXrJDa52h6935UrLAMi4gimkSRHPd9NQEHYNclxq8Xx/QGkglBi2bqWmunULOQod7jBpVZQg7u8SgjyJaDuBowvs1wmc01sJDuIkLyJeB8yGgc1iSHtvYHW9G70N/AbAgCz8ATyTmjLOEsar7P4v6dU3rW77c4luHRQyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768660040; c=relaxed/simple;
	bh=S+XdwIvO+mBI/ZK3TBakpPxUyK9/MOzdesFbrmV8xws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HdY4e3PmIbjy12EUJIpxsFqs9h3rzBVsVSHyRGiVxqfTGHILDlyd6n1wojGxrfyfSLsKmvf3fYCigvZAqKL5oJNVZjLphLEWaIbfrH7jJ45FUP+ytU3eLC23sW4fqStT/rDRpEjZEQNj+Q6BGMrnTsXUGywYOk2leAa8SmdJ2S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1dWJuKX; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-81db1530173so1399706b3a.1
        for <linux-hams@vger.kernel.org>; Sat, 17 Jan 2026 06:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768660038; x=1769264838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jesh1w+4PKrEjj1xZybWnRn57XwMf8k4mRrBd4/MsR8=;
        b=b1dWJuKXCaSRF+cIy1AAi/53WEsK76OZvf4/nimAb3dMLDmR6nCWxL6GQfSjyeNU5T
         zPrVOCJHNYjJ9jJ91TOz2yQcgQoIdELujy9oumKEZnyiIA7uptIifYabC+JyqbNJ2ylD
         nWP7G2RThdqBi9e3dfK9hbe8XWN3gxVOmAjblWjY/cFR5zjI53tNgGOm8WzJiqpSpbLl
         7VVbPpvSP6GW/sGwGbGYdyZDqpDia/qXOxGU/F99D32YM6JRHQKm93SQwRBkuxurqG9H
         0oyblwyYGAnNSkAv7ol/QwpZGPeR12T27bL4WP+ANI6HlP4xr6I1n3dA6lMUDrIZ/A+A
         lgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768660038; x=1769264838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jesh1w+4PKrEjj1xZybWnRn57XwMf8k4mRrBd4/MsR8=;
        b=aE89+0k0KLJ4UMDYIIYIAvcHWCospboYTvxmqjHV3huRq0AUA2neM8jpnHToJv9/I6
         67OkYgyyQBWwS3DYt6ke9q++H+v+hQybhApTwZGLjZfZoXfzTNKbuIafIvI0rFzhpjCq
         IdNMM+Lh/u7xabyHcaOoO7jfRbmtHsT41OE/QYX9TtASMyDXCWpMeQnY15ssS0KTmU+2
         RQkp/+b90NqK9NQpL61dzqnHpjWqy93JQ/3P0GlDUiwvP3yrmosrQnVFVPm3CkA+Jj3R
         QpFZWufztaWreOj/w7QIVoKdgouzarLUjU1TzfKaTilLXmqJdVS78LpNAmQFf09wZPbN
         xkAA==
X-Gm-Message-State: AOJu0YxD0lISsiZy7PXSVCBwFNZhWGiPXxek7qWMOZwnxXG5/LC0tIum
	ddQZ1CMWixHgFyK4ebeNpLyF2TKmrPE82oLs8nrWwlzXFLIdiZooSkab/coEPQ==
X-Gm-Gg: AY/fxX6AmI6MglONIF3FlT40LmxhpXgLKO9jD234BDtLdyjZO9iFd+Y27KuSHiL/5eO
	/wFd/ZGib8GO71ZiCrH9Zk2rsr0RzjQ20tCaM8ToAig+EkYKKhkmjHzhnBQZhuIAnlO/6qf6JLP
	dpnQoh3RxU5aEU3jQ2pyMU/ibCR2+XITmUoiCIVd+vzBICyrIM88keqcUPXMpBrg++b19pZWQmd
	9M0k7SD/D/d3GT45eM70NTgVt3FZJyXid8HBJg71Ld+kdk8MI1oKswRQSpeyykhB/XmqNcx0Cxw
	vL65YFD7SZpf/2uXobsq2VVaNVq4bdX5H4xLuLRjb3QG6AOTzPk/SIeF8/yA9nc9DOvQcnbB005
	LOjW7QruxNcMAItakxAUjqxjak9UG6Xc7lgUt67qFDeSBFNm4COWyHpBC25NHvoD2DxTVb3lnqr
	g5LhkcNTntr+wwKJitVt3MO4+dVlf6
X-Received: by 2002:a05:6a00:4009:b0:81f:477d:58da with SMTP id d2e1a72fcca58-81fa03382dfmr5799840b3a.60.1768660038227;
        Sat, 17 Jan 2026 06:27:18 -0800 (PST)
Received: from localhost.localdomain ([111.125.235.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10bdebcsm4690399b3a.17.2026.01.17.06.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 06:27:17 -0800 (PST)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: syzbot+3f2d46b6e62b8dd546d3@syzkaller.appspotmail.com,
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
Subject: Testing for netrom: fix memory leak in nr_add_node
Date: Sat, 17 Jan 2026 19:56:32 +0530
Message-Id: <20260117142632.180941-1-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <69694849.050a0220.58bed.0025.GAE@google.com>
References: <69694849.050a0220.58bed.0025.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test upstream ea1013c1539270e372fc99854bc6e4d94eaeff66

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 net/netrom/nr_route.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index b94cb2ffbaf8..20da41888151 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -176,6 +176,7 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
 		hlist_add_head(&nr_neigh->neigh_node, &nr_neigh_list);
 		nr_neigh_hold(nr_neigh);
 		spin_unlock_bh(&nr_neigh_list_lock);
+		nr_neigh_put(nr_neigh);
 	}
 
 	if (quality != 0 && ax25cmp(nr, ax25) == 0 && !nr_neigh->locked)

base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
-- 
2.34.1


