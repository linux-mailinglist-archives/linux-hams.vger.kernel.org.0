Return-Path: <linux-hams+bounces-268-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D935B8C0D9D
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 11:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65606B22EF5
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 09:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E2914B067;
	Thu,  9 May 2024 09:37:20 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E87814AD32;
	Thu,  9 May 2024 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715247440; cv=none; b=hn3RvibM/86OUcQ6QBtFkNKrZfBrhZCeSXGO9Z/5O1lqo9oV9QyX98zxRPd2ER+3UJMZWfsB+hLfO4Gq8keWa9ho5UyGaGFQmHDfCpnk4ou1ekpmcUi0E8lZnX8MMiBr7jc1Q+7pw/nWKDdeXlqxXSLRlupTp6GNas8OBp6B0kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715247440; c=relaxed/simple;
	bh=ySeQnilNVeiocf2Y9Gj1+QOw9K8QIdvsO5VKfq/TB2o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=XSjGaguG6BuPZLOuu2cw6KWfXYrwot8yrwTYNFrLheofMta98VawZPAqUY31YP0HPQEMAaptffye24EW8Z5CWnVgyzp0C1i0Yk1PLXJuuhFo8CfiyOGpT4wLGsmAmQUt2q48I7k8DCx1mZO5W/81rX2WYB747qXahwaHPR8OR1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from ubuntu.localdomain (unknown [221.192.180.131])
	by mail-app4 (Coremail) with SMTP id cS_KCgBH97U_mTxm18NPAA--.29040S2;
	Thu, 09 May 2024 17:37:06 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-hams@vger.kernel.org,
	pabeni@redhat.com,
	kuba@kernel.org,
	edumazet@google.com,
	jreuter@yaina.de,
	dan.carpenter@linaro.org,
	rkannoth@marvell.com,
	davem@davemloft.net,
	lars@oddbit.com,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH net v7 3/3] ax25: Fix reference count leak issue of net_device
Date: Thu,  9 May 2024 17:37:02 +0800
Message-Id: <7ce3b23a40d9084657ba1125432f0ecc380cbc80.1715247018.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1715247018.git.duoming@zju.edu.cn>
References: <cover.1715247018.git.duoming@zju.edu.cn>
X-CM-TRANSID:cS_KCgBH97U_mTxm18NPAA--.29040S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJryktF15Gr15ur4UAF43Wrg_yoW8JFy5pF
	W2gFyfArZ7Jr1DJr4DWr97Wr10vryDu3yrCw45u3WSk3s5XasxJryrKrWUXry7KrWfXF18
	u347Wrn8uF1kZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
	JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU073vUUUUU
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwIQAWY7nwoPXwAkss
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>

There is a reference count leak issue of the object "net_device" in
ax25_dev_device_down(). When the ax25 device is shutting down, the
ax25_dev_device_down() drops the reference count of net_device one
or zero times depending on if we goto unlock_put or not, which will
cause memory leak.

In order to solve the above issue, decrease the reference count of
net_device after dev->ax25_ptr is set to null.

Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 net/ax25/ax25_dev.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index 52ccc37d568..c9d55b99a7a 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -118,15 +118,10 @@ void ax25_dev_device_down(struct net_device *dev)
 	list_for_each_entry(s, &ax25_dev_list, list) {
 		if (s == ax25_dev) {
 			list_del(&s->list);
-			goto unlock_put;
+			break;
 		}
 	}
-	dev->ax25_ptr = NULL;
-	spin_unlock_bh(&ax25_dev_lock);
-	ax25_dev_put(ax25_dev);
-	return;
 
-unlock_put:
 	dev->ax25_ptr = NULL;
 	spin_unlock_bh(&ax25_dev_lock);
 	netdev_put(dev, &ax25_dev->dev_tracker);
-- 
2.17.1


