Return-Path: <linux-hams+bounces-267-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C43DD8C0D9A
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 11:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81973283805
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 09:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A38A14A638;
	Thu,  9 May 2024 09:37:10 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5B11494D9;
	Thu,  9 May 2024 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715247429; cv=none; b=Z82qopGmDmQzqCMtsSQCDZfUfaDvRvlgaeGPaPHNmCXgaXQ/Xz0ldN7iQ/rJf0JanVqlJAhAFpf0SMBK07hv94erouvujtZj3m83HFOoLQnwIWvQce4Zl0ga88sRVVNWVaWeIPQ+smRTjhQwOQAUWSGDn9JsXUridLvg7aTZEKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715247429; c=relaxed/simple;
	bh=grLcYR17N2xjLQuCWulXebCmy7jfQjFsYFVfgDjRb/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=mZCD3mL8tWxW0ymJeB0PKy9Nn5w8CxeP01CW7nUtNi42CiNLWIFBdMwG5r0ABYQkYhma/XN2VFv1zO92tRhNZv/RlkA7ZBJwRzjOkB43mpyQ3RQdidW24ywIhJ5UhyAvnNwd0VnD6c3wCvWzijW7KaHzP5C7ukDzAHycvAEBvOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from ubuntu.localdomain (unknown [221.192.180.131])
	by mail-app4 (Coremail) with SMTP id cS_KCgBn9rMwmTxmWMNPAA--.10149S2;
	Thu, 09 May 2024 17:36:52 +0800 (CST)
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
Subject: [PATCH net v7 2/3] ax25: Fix reference count leak issues of ax25_dev
Date: Thu,  9 May 2024 17:36:47 +0800
Message-Id: <361bbf2a4b091e120006279ec3b382d73c4a0c17.1715247018.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1715247018.git.duoming@zju.edu.cn>
References: <cover.1715247018.git.duoming@zju.edu.cn>
X-CM-TRANSID:cS_KCgBn9rMwmTxmWMNPAA--.10149S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF4rXr4Utr1rur1UtFykGrg_yoW8tFWkpF
	Wa9FW5ArZrtr4Utr4DWr1xWr1jyryqy393CryUuF1Ikw1rX3sxJr1rtrWDXFy5GryfZF48
	Xw17Wrs8ZFWkCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwIQAWY7nwoPXwAgso
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>

The ax25_addr_ax25dev() and ax25_dev_device_down() exist a reference
count leak issue of the object "ax25_dev".

Memory leak issue in ax25_addr_ax25dev():

The reference count of the object "ax25_dev" can be increased multiple
times in ax25_addr_ax25dev(). This will cause a memory leak.

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
index f16ee5c09d0..52ccc37d568 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -39,6 +39,7 @@ ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
 		if (ax25cmp(addr, (const ax25_address *)ax25_dev->dev->dev_addr) == 0) {
 			res = ax25_dev;
 			ax25_dev_hold(ax25_dev);
+			break;
 		}
 	spin_unlock_bh(&ax25_dev_lock);
 
@@ -88,7 +89,6 @@ void ax25_dev_device_up(struct net_device *dev)
 	list_add(&ax25_dev->list, &ax25_dev_list);
 	dev->ax25_ptr     = ax25_dev;
 	spin_unlock_bh(&ax25_dev_lock);
-	ax25_dev_hold(ax25_dev);
 
 	ax25_register_dev_sysctl(ax25_dev);
 }
@@ -129,7 +129,6 @@ void ax25_dev_device_down(struct net_device *dev)
 unlock_put:
 	dev->ax25_ptr = NULL;
 	spin_unlock_bh(&ax25_dev_lock);
-	ax25_dev_put(ax25_dev);
 	netdev_put(dev, &ax25_dev->dev_tracker);
 	ax25_dev_put(ax25_dev);
 }
-- 
2.17.1


