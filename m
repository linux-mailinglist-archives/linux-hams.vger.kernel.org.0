Return-Path: <linux-hams+bounces-235-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D868C8BDC0E
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 09:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 156A31C21C89
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 07:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D3C7F465;
	Tue,  7 May 2024 07:04:24 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net (zg8tmja5ljk3lje4ms43mwaa.icoremail.net [209.97.181.73])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1618F7D405;
	Tue,  7 May 2024 07:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.181.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715065464; cv=none; b=KoV+lwBv6HRL5YHvdp4N3eImWMFk8kbu7vTGUwRoMPOnJsXIvtjCsDSrDo/3F8LIJLvRYk4Wq0v4t4mWLttqE0hAwFh0Ed7RGQnNyDWJvl50WGBDN56CKsmMa1UMC/iF7A/UJA3maIMY10zFBLsZl1+EC9H8cD6prM61Fe8Pw+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715065464; c=relaxed/simple;
	bh=F5fEue2KW1xLe2h7uLs85+w3jp+150mjQm3BQOiRwnQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 In-Reply-To:References; b=TYlxSGf6YcMc9YrGmCOKJeRZW9j0DPZL0X7NPA77AwyfBQ5IpqEBU7QApkNc6QvHXx/GVtZFPOppFgUs4jmcizFTrfP3kVySgOLxoN7a1Vl/2PUuWVCe8CmgVIaebSzWOYKMDdKjopLM+qJVtopQHR+sgLl8QTL2FWTcPMlBIew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=209.97.181.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from ubuntu.localdomain (unknown [221.192.179.90])
	by mail-app4 (Coremail) with SMTP id cS_KCgCXJrRP0jlmbxo0AA--.51257S6;
	Tue, 07 May 2024 15:04:05 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-hams@vger.kernel.org,
	pabeni@redhat.com,
	kuba@kernel.org,
	edumazet@google.com,
	jreuter@yaina.de,
	dan.carpenter@linaro.org,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH net v5 4/4] ax25: Change kfree() in ax25_dev_free() to ax25_dev_put()
Date: Tue,  7 May 2024 15:03:42 +0800
Message-Id: <5c61fea1b20f3c1596e4fb46282c3dedc54513a3.1715065005.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1715065005.git.duoming@zju.edu.cn>
References: <cover.1715065005.git.duoming@zju.edu.cn>
In-Reply-To: <cover.1715065005.git.duoming@zju.edu.cn>
References: <cover.1715065005.git.duoming@zju.edu.cn>
X-CM-TRANSID:cS_KCgCXJrRP0jlmbxo0AA--.51257S6
X-Coremail-Antispam: 1UD129KBjvdXoWrZFy3Gr4DGFWrJw4kGFW3KFg_yoWfXFX_uF
	ykuF47Ww4UXryUCw4rCF4rJrW7Ww1Yg3Z3GryfAFZ7t34YqayUXrWkWr18XF15XrW2krWS
	qr1rZr1fCr43tjkaLaAFLSUrUUUUcb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbHxYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
	IE14v26r126s0DM28IrcIa0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0
	c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2
	IY6xkF7I0E14v26F4UJVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280
	aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_GFv_Wryle2I262IYc4CY6c8Ij28IcVAaY2xG8w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II
	8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_GFyj6rW5JwCY02Avz4vE14v_GF4l42xK82IY
	c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
	026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF
	0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280
	aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0zR-zV7UUUUU=
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwIOAWY4-AkN6wAWsV
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>

The object "ax25_dev" is managed by reference counting. Thus it should
not be directly released by a kfree() call in ax25_dev_free(). Replace
it with a ax25_dev_put() call instead.

Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 net/ax25/ax25_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index c6ab9b0f0be..2a40c78f6a0 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -195,7 +195,7 @@ void __exit ax25_dev_free(void)
 	list_for_each_entry_safe(s, n, &ax25_dev_list, list) {
 		netdev_put(s->dev, &s->dev_tracker);
 		list_del(&s->list);
-		kfree(s);
+		ax25_dev_put(s);
 	}
 	spin_unlock_bh(&ax25_dev_lock);
 }
-- 
2.17.1


