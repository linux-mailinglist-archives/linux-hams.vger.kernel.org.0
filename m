Return-Path: <linux-hams+bounces-216-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A23F8BCFBD
	for <lists+linux-hams@lfdr.de>; Mon,  6 May 2024 16:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B41CE287552
	for <lists+linux-hams@lfdr.de>; Mon,  6 May 2024 14:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB0D85298;
	Mon,  6 May 2024 14:09:21 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F8E83A0A;
	Mon,  6 May 2024 14:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715004561; cv=none; b=slM9ujUC2yyOsqxOu8dqkNb56egch/RzyfIRvy6dHNw9fU+ScVaW6MeDz4UX7DeWtpeHAwWDHRzT8LqGtoPafLYEOjCte8iT0GvOZTIeqmhEdz8fqhbKRpSZBabbhjRtBcKk18zaX0t9/No8OfJebptU/N6gHhUjbIQrIvUGSp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715004561; c=relaxed/simple;
	bh=Ybv9SpHx2OiiP79Oeh18r5QaGZGa6GjkoLYnEg8H4tU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 In-Reply-To:References; b=Suk8wtwDnJyBFXyMHuFXAf3ImrvWnljzF16GQm0N9e10bsa73X5ttYUerITRjYLbRd1hIG9S8HRQo775RAyT0SvqE4CpJafpmC9BVPS6/UfBCZu4Ao1UynUh768QLHGAx4oRMZT5VS0CNrL7wR/Xx+c4mSpOFAGFNIkiq4m6jag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from ubuntu.localdomain (unknown [221.192.180.207])
	by mail-app2 (Coremail) with SMTP id by_KCgCXtaRj5DhmI_s4AA--.15255S3;
	Mon, 06 May 2024 22:08:42 +0800 (CST)
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
Subject: [PATCH net v3 1/2] ax25: Fix reference count leak issues of ax25_dev and net_device
Date: Mon,  6 May 2024 22:08:34 +0800
Message-Id: <8338a74098bc1aafbca14d4612a10d6930fcef1b.1715002910.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1715002910.git.duoming@zju.edu.cn>
References: <cover.1715002910.git.duoming@zju.edu.cn>
In-Reply-To: <cover.1715002910.git.duoming@zju.edu.cn>
References: <cover.1715002910.git.duoming@zju.edu.cn>
X-CM-TRANSID:by_KCgCXtaRj5DhmI_s4AA--.15255S3
X-Coremail-Antispam: 1UD129KBjvJXoW3JrWDXr45trW5Cr48KF48WFg_yoW7Cr1UpF
	Wa9FyrArZ7Jr1UAr4DWF1xGr1jyryjkws5Ary5uF1Ikw15X3sxJr18tr1DJryUGrW3ZF18
	J347Wrs8Ar48uw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Xryl42xK82IYc2Ij64vIr41l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
	wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcI
	k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j
	6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU1MKZDUUUU
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwINAWY3qokcfgAbsG
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>

The ax25_addr_ax25dev() exists a reference count leak issue of the
object "ax25_dev" and the ax25_dev_device_down() exists reference
count leak issues of the objects "ax25_dev" and "net_device".

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

There is also a reference count leak issue of the object "net_device",
when the ax25 device is shutting down. The ax25_dev_device_down() drops
the reference count of net_device one or zero times depending on if we
goto unlock_put or not, which will cause memory leak.

In order to solve the above issues, use kernel circular doubly linked
list to implementate ax25_dev_list. As for ax25_addr_ax25dev() issue,
it is impossible for one pointer to be on a list twice. So add a break
in ax25_addr_ax25dev(). As for ax25_dev_device_down() issues, increase
the reference count of ax25_dev once in ax25_dev_device_up() and decrease
the reference count of ax25_dev and net_device after ax25_dev is removed
from the ax25_dev_list.

Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
Changes in v3:
  - Use kernel list to implementate ax25_dev_list.
  - Solve reference count leak issues in ax25_dev_device_down().

 include/net/ax25.h  |  4 ++--
 net/ax25/ax25_dev.c | 36 ++++++++++++------------------------
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/include/net/ax25.h b/include/net/ax25.h
index 0d939e5aee4..92c6aa4f9a6 100644
--- a/include/net/ax25.h
+++ b/include/net/ax25.h
@@ -216,7 +216,7 @@ typedef struct {
 struct ctl_table;
 
 typedef struct ax25_dev {
-	struct ax25_dev		*next;
+	struct list_head	list;
 
 	struct net_device	*dev;
 	netdevice_tracker	dev_tracker;
@@ -330,7 +330,7 @@ int ax25_addr_size(const ax25_digi *);
 void ax25_digi_invert(const ax25_digi *, ax25_digi *);
 
 /* ax25_dev.c */
-extern ax25_dev *ax25_dev_list;
+static struct list_head ax25_dev_list;
 extern spinlock_t ax25_dev_lock;
 
 #if IS_ENABLED(CONFIG_AX25)
diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index 282ec581c07..fbaaba0351e 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -22,11 +22,11 @@
 #include <net/sock.h>
 #include <linux/uaccess.h>
 #include <linux/fcntl.h>
+#include <linux/list.h>
 #include <linux/mm.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
 
-ax25_dev *ax25_dev_list;
 DEFINE_SPINLOCK(ax25_dev_lock);
 
 ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
@@ -34,11 +34,13 @@ ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
 	ax25_dev *ax25_dev, *res = NULL;
 
 	spin_lock_bh(&ax25_dev_lock);
-	for (ax25_dev = ax25_dev_list; ax25_dev != NULL; ax25_dev = ax25_dev->next)
+	list_for_each_entry(ax25_dev, &ax25_dev_list, list) {
 		if (ax25cmp(addr, (const ax25_address *)ax25_dev->dev->dev_addr) == 0) {
 			res = ax25_dev;
 			ax25_dev_hold(ax25_dev);
+			break;
 		}
+	}
 	spin_unlock_bh(&ax25_dev_lock);
 
 	return res;
@@ -52,6 +54,7 @@ void ax25_dev_device_up(struct net_device *dev)
 {
 	ax25_dev *ax25_dev;
 
+	INIT_LIST_HEAD(&ax25_dev_list);
 	ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_KERNEL);
 	if (!ax25_dev) {
 		printk(KERN_ERR "AX.25: ax25_dev_device_up - out of memory\n");
@@ -59,7 +62,6 @@ void ax25_dev_device_up(struct net_device *dev)
 	}
 
 	refcount_set(&ax25_dev->refcount, 1);
-	dev->ax25_ptr     = ax25_dev;
 	ax25_dev->dev     = dev;
 	netdev_hold(dev, &ax25_dev->dev_tracker, GFP_KERNEL);
 	ax25_dev->forward = NULL;
@@ -85,10 +87,9 @@ void ax25_dev_device_up(struct net_device *dev)
 #endif
 
 	spin_lock_bh(&ax25_dev_lock);
-	ax25_dev->next = ax25_dev_list;
-	ax25_dev_list  = ax25_dev;
+	list_add(&ax25_dev->list, &ax25_dev_list);
 	spin_unlock_bh(&ax25_dev_lock);
-	ax25_dev_hold(ax25_dev);
+	dev->ax25_ptr     = ax25_dev;
 
 	ax25_register_dev_sysctl(ax25_dev);
 }
@@ -111,32 +112,19 @@ void ax25_dev_device_down(struct net_device *dev)
 	/*
 	 *	Remove any packet forwarding that points to this device.
 	 */
-	for (s = ax25_dev_list; s != NULL; s = s->next)
+	list_for_each_entry(s, &ax25_dev_list, list) {
 		if (s->forward == dev)
 			s->forward = NULL;
-
-	if ((s = ax25_dev_list) == ax25_dev) {
-		ax25_dev_list = s->next;
-		goto unlock_put;
 	}
 
-	while (s != NULL && s->next != NULL) {
-		if (s->next == ax25_dev) {
-			s->next = ax25_dev->next;
-			goto unlock_put;
+	list_for_each_entry(s, &ax25_dev_list, list) {
+		if (s == ax25_dev) {
+			list_del(&s->list);
+			break;
 		}
-
-		s = s->next;
 	}
-	spin_unlock_bh(&ax25_dev_lock);
 	dev->ax25_ptr = NULL;
-	ax25_dev_put(ax25_dev);
-	return;
-
-unlock_put:
 	spin_unlock_bh(&ax25_dev_lock);
-	ax25_dev_put(ax25_dev);
-	dev->ax25_ptr = NULL;
 	netdev_put(dev, &ax25_dev->dev_tracker);
 	ax25_dev_put(ax25_dev);
 }
-- 
2.17.1


