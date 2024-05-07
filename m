Return-Path: <linux-hams+bounces-230-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C758BDB58
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 08:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54641B239A6
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 06:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D17878C8B;
	Tue,  7 May 2024 06:22:10 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29EF73165;
	Tue,  7 May 2024 06:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715062929; cv=none; b=mkma6Pkpn2QhCUYrWdmTGvcu09IF1ounjmUCxZWzeD9QWDuzYaPtkPYQJEa5BnQkTV/wmttC1J51CUzHyAdpWc5P1qMcN7JT/upTIBgwAgTTFV/nqRc3PeDLXb12g+UZRKSDF9t4uSdsmilHOmbrieA9W4hEekzrt40E6onsP3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715062929; c=relaxed/simple;
	bh=5eM5W6ze1j1mLPSQUbYA7MyvceG+JiOuYyGAGTYb/88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=FOuKN6SxtENBONW2xUgfBMoW2LsSgpsgiGtkvShAiR1Gdvf+20HexZFHIk0rkL1u7/3cRJWqqTM+yEayHOo3lamCp+xl3w8eKAWzo3XzXSq/9wKPClJUmkwTA3BOxrQ0uk2XoKyaXiZOs8OmVGNhSJ1bh7mAMa4EpXsOIZSvBe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from ubuntu.localdomain (unknown [221.192.179.90])
	by mail-app4 (Coremail) with SMTP id cS_KCgBX5bKCyDlmv4YzAA--.26135S2;
	Tue, 07 May 2024 14:21:56 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-hams@vger.kernel.org,
	pabeni@redhat.com,
	kuba@kernel.org,
	edumazet@google.com,
	davem@davemloft.net,
	jreuter@yaina.de,
	horms@kernel.org,
	Markus.Elfring@web.de,
	dan.carpenter@linaro.org,
	lars@oddbit.com,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH RESEND net v4 3/4] ax25: Fix reference count leak issues of net_device
Date: Tue,  7 May 2024 14:21:54 +0800
Message-Id: <02697d01b0d95859a9caf45f6b37af2d2b9959d8.1715062582.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1715062582.git.duoming@zju.edu.cn>
References: <cover.1715062582.git.duoming@zju.edu.cn>
X-CM-TRANSID:cS_KCgBX5bKCyDlmv4YzAA--.26135S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFyxZry8AFy8Gry3XF18Xwb_yoW8GrWUpF
	W2gFW3ArZ7Jr1DGr4DWr97Wr10vryq93yrur15u3WIk3s5X3sxJryrKrWDXry7KrW3ZF18
	u347Wrs5uF1kZaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUGm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl
	6s0DM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vj628EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl6s0q628EF7xvwVC0I7IYx2IY67AK
	xVWDJVCq3VCjxxvEa2IrM2vj628EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl6s0q628EF7
	xvwVC2z280aVAFwI0_GcCE3s0E7I0Y6sxI4wAa7VA2z4x0Y4vE2Ix0cI8IcVCY1x0267AK
	xVW0oVCq3VCjxxvEa2IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4
	IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwVW8AwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY
	6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUUxwIDUUUUU==
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwMOAWY4-AkEPQBWsL
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
Changes in v4:
  - Make the fix procedure of net_device as a separate update steps.

 net/ax25/ax25_dev.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index 6a572fe1046..05e556cdc2b 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -120,15 +120,9 @@ void ax25_dev_device_down(struct net_device *dev)
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


