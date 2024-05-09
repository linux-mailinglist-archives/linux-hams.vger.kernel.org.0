Return-Path: <linux-hams+bounces-263-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E57608C0976
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 03:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20F771C212CC
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 01:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274BB13C9AB;
	Thu,  9 May 2024 01:56:57 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B023E13CF83;
	Thu,  9 May 2024 01:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715219817; cv=none; b=gNZhCAa7F9EfEWYD3VSZ8iec/+agD5igCu8SgOR21z33Te5qaFFaNhpCJ2EfM7UOpGrCdO56uXzomyoLfMw4zrguo38T5SirAmOZ5QWOiLL1qODq9i6a2VVq/LKLa9MWZ6U6Yt6DDt51GBFVE33P0ElTprcNNkDhcRZXjCXe98g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715219817; c=relaxed/simple;
	bh=Lli1kLaNsVAUfmSU8DR3wNA4Occs19lWcrVhE1EaVvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=dghimGXJvMT/yMLQZoiI4LOpERdQONS93D57MpK/ulEJWUevVV5X4pkW3MZPVsW/p0LV2VRpi3NMc1JOgP6FYzJeIOFrZALfPIuGeGEBw7A+iD6B1mUns/d60ynotGB8O7d4weQd/vZuIgbJ/+YIq+XVvpzxe9l2mwftHkjNsnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from ubuntu.localdomain (unknown [221.192.180.131])
	by mail-app4 (Coremail) with SMTP id cS_KCgDnc7FWLTxmNkpMAA--.45924S2;
	Thu, 09 May 2024 09:56:40 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-hams@vger.kernel.org,
	pabeni@redhat.com,
	kuba@kernel.org,
	edumazet@google.com,
	davem@davemloft.net,
	jreuter@yaina.de,
	dan.carpenter@linaro.org,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH net v6 3/3] ax25: Fix reference count leak issues of net_device
Date: Thu,  9 May 2024 09:56:36 +0800
Message-Id: <4890e260622ae06922a838f063d5dfd385931cda.1715219007.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1715219007.git.duoming@zju.edu.cn>
References: <cover.1715219007.git.duoming@zju.edu.cn>
X-CM-TRANSID:cS_KCgDnc7FWLTxmNkpMAA--.45924S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFyxZry8AFy8Gry3XF18Xwb_yoW8JFyrpF
	W2gFW3ArZ7Jr1DJr4DWr97Wr15Zryq93yrCr15u3WSk3s5X3sxJryrKrWUXry7KrWfZF18
	u347Wrs8uF4kZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
	JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUlYL9UUUUU=
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwIQAWY7nwoGrwANs8
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>

The ax25_dev_device_down() exists reference count leak issues of
the object "net_device". When the ax25 device is shutting down.
The ax25_dev_device_down() drops the reference count of net_device
one or zero times depending on if we goto unlock_put or not, which
will cause memory leak.

In order to solve the above issue, decrease the reference count of
net_device after dev->ax25_ptr is set to null.

Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 net/ax25/ax25_dev.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index 37150f766a0..f37b143d69b 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -121,15 +121,9 @@ void ax25_dev_device_down(struct net_device *dev)
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
-
-unlock_put:
 	dev->ax25_ptr = NULL;
 	spin_unlock_bh(&ax25_dev_lock);
 	netdev_put(dev, &ax25_dev->dev_tracker);
-- 
2.17.1


