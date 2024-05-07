Return-Path: <linux-hams+bounces-236-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 769778BDC11
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 09:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F20441F23B43
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 07:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C4C85C65;
	Tue,  7 May 2024 07:04:42 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from zg8tmtu5ljy1ljeznc42.icoremail.net (zg8tmtu5ljy1ljeznc42.icoremail.net [159.65.134.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0D2811E0;
	Tue,  7 May 2024 07:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.65.134.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715065482; cv=none; b=b4KIf2wm3UgabAlKup9134JQh6GoOgFUFeowTIf0DWqOtEWdaer8RTJBfWNTOSdxp9EQ7JOkjzVw71ztEfSsKpDNrI4BZBIWajMmgL5O+Kt9wEEvp/5gKrkkGCB1c4mDNJ4DaTG9dVdEayNcqPbkMV4S8ZhNwStyXVot0xh+g/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715065482; c=relaxed/simple;
	bh=0SY4zuwSGAtDqSwmXCaSAQKV0qzloPYDMRus1a18QAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 In-Reply-To:References; b=X/IUw36dT6+mjgRACr39lv09KP/BIOFTtPY43/DLdvkIgr9xMKd418h/+sD/f0UKcEYCM2R3izi9TCdBBwg/VgFpbHlRJ/fRnCVyqLwTTN5k27FiPCwbvegf4SRlFWYA+Yhu5UHyrI9SunXpZmTbrhGUTVueXyyIDFQzD8Fw15I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=159.65.134.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from ubuntu.localdomain (unknown [221.192.179.90])
	by mail-app4 (Coremail) with SMTP id cS_KCgCXJrRP0jlmbxo0AA--.51257S4;
	Tue, 07 May 2024 15:04:02 +0800 (CST)
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
Subject: [PATCH net v5 2/4] ax25: Fix reference count leak issues of ax25_dev
Date: Tue,  7 May 2024 15:03:40 +0800
Message-Id: <86ae9712b610b3d41ce0ce3bbe268c68de6c5914.1715065005.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1715065005.git.duoming@zju.edu.cn>
References: <cover.1715065005.git.duoming@zju.edu.cn>
In-Reply-To: <cover.1715065005.git.duoming@zju.edu.cn>
References: <cover.1715065005.git.duoming@zju.edu.cn>
X-CM-TRANSID:cS_KCgCXJrRP0jlmbxo0AA--.51257S4
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF4rXr4Utr1rur1UtFykGrg_yoW8tw17pF
	Wa9FW5ArWktr4Utr4DWr1xWr1jyryqk395CryUuF1Ikw1rX3sxJr1rtrWDXFy5GryrZF48
	X347Wrs8ZFWkuaDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQSb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJr0_GcWl84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zV
	CS5cI20VAGYxC7MxkF7I0En4kS14v26rWY6Fy7MxkIecxEwVAFwVW8CwCF04k20xvY0x0E
	wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvj4RP73BDUUUU
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwIOAWY4-AkN6wASsR
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>

The ax25_addr_ax25dev() and ax25_dev_device_down() exist a reference
count leak issue of the object "ax25_dev".

Memory leak issue in ax25_addr_ax25dev():

The reference count of the object "ax25_dev" can be increased multiple
times in ax25_addr_ax25dev(). This will cause a memory leak so far.

Memory leak issues in ax25_dev_device_down():

The reference count of ax25_dev is set to 1 in ax25_dev_device_up() and
then increase the reference count when ax25_dev is added to ax25_dev_list.
As a result, the reference count of ax25_dev is 2. But when the device is
shutting down. The ax25_dev_device_down() drops the reference count once
or twice depending on if we goto unlock_put or not, which will cause
memory leak.

As for the issue of ax25_addr_ax25dev(), it is impossible for one pointer
to be on a list twice. So add a break in ax25_addr_ax25dev(). As for the
issue of ax25_dev_device_down(), increase the reference count of ax25_dev
once in ax25_dev_device_up() and decrease the reference count of ax25_dev
after it is removed from the ax25_dev_list.

Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 net/ax25/ax25_dev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index 1557f879377..66aa381af0e 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -39,6 +39,7 @@ ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
 		if (ax25cmp(addr, (const ax25_address *)ax25_dev->dev->dev_addr) == 0) {
 			res = ax25_dev;
 			ax25_dev_hold(ax25_dev);
+			break;
 		}
 	spin_unlock_bh(&ax25_dev_lock);
 
@@ -91,7 +92,6 @@ void ax25_dev_device_up(struct net_device *dev)
 	list_add(&ax25_dev->list, &ax25_dev_list);
 	dev->ax25_ptr     = ax25_dev;
 	spin_unlock_bh(&ax25_dev_lock);
-	ax25_dev_hold(ax25_dev);
 
 	ax25_register_dev_sysctl(ax25_dev);
 }
@@ -132,7 +132,6 @@ void ax25_dev_device_down(struct net_device *dev)
 unlock_put:
 	dev->ax25_ptr = NULL;
 	spin_unlock_bh(&ax25_dev_lock);
-	ax25_dev_put(ax25_dev);
 	netdev_put(dev, &ax25_dev->dev_tracker);
 	ax25_dev_put(ax25_dev);
 }
-- 
2.17.1


