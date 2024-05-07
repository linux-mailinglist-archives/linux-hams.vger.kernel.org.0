Return-Path: <linux-hams+bounces-233-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D138BDC08
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 09:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35F361C21BEA
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 07:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DFA67A141;
	Tue,  7 May 2024 07:04:21 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051BA79B99;
	Tue,  7 May 2024 07:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715065461; cv=none; b=PkFGmJFam8uLMaxkxcr8FKnDvEC0tn5jbT8YhP7y+s1Gylre0vBnPeYxmDYqff80fyiR+LGCcpFCa5t2iggYq/mZTTDbxCAP9UB06K1OfiSeUyNL8UA0HrulW/eEAIy0Ad2Fj2iwYG/wE0yJCTAzZwH5U/9oFGwa015SLoG7KWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715065461; c=relaxed/simple;
	bh=xlZ3unTTJkF+fFZFFfJaSDyBcV+aNJ+f8cbVuWwpTws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 In-Reply-To:References; b=IpK+FHaCcTbG1VrmoRv1kAS6JmqhMuXpuPC/0pRLXyIIJHCFC9Ni3oyFbBr5qH4VJuoKIKbF85cNJI347fzM99OEAFRTk8KDPjd8w9i1HMdnEJ4M0Ax5T+UOrH+UMqN/yCl4YASFGnpYBt8k9qtMq/wBioo/3xfjdMQTgCQk7sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from ubuntu.localdomain (unknown [221.192.179.90])
	by mail-app4 (Coremail) with SMTP id cS_KCgCXJrRP0jlmbxo0AA--.51257S5;
	Tue, 07 May 2024 15:04:03 +0800 (CST)
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
Subject: [PATCH net v5 3/4] ax25: Fix reference count leak issues of net_device
Date: Tue,  7 May 2024 15:03:41 +0800
Message-Id: <c1d18fcf1bf6ef65264ba992172ea1636dbf5431.1715065005.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1715065005.git.duoming@zju.edu.cn>
References: <cover.1715065005.git.duoming@zju.edu.cn>
In-Reply-To: <cover.1715065005.git.duoming@zju.edu.cn>
References: <cover.1715065005.git.duoming@zju.edu.cn>
X-CM-TRANSID:cS_KCgCXJrRP0jlmbxo0AA--.51257S5
X-Coremail-Antispam: 1UD129KBjvJXoW7WFyxZry8AFy8Gry3XF18Xwb_yoW8JFyrpF
	W2gFyfArZ7Jr1DJr4DWr97Wr1Fvryq93yrCr15u3WIk3s5X3sxJr1rKrWDXry7KrW3ZF18
	u347Wrs8uF4kZaDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQSb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
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
	xVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjTikR6nUUUUU
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwIOAWY4-AkN6wAUsX
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
index 66aa381af0e..c6ab9b0f0be 100644
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


