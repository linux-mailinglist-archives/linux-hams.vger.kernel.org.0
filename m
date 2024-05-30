Return-Path: <linux-hams+bounces-346-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAFD8D44BD
	for <lists+linux-hams@lfdr.de>; Thu, 30 May 2024 07:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07F791C21A13
	for <lists+linux-hams@lfdr.de>; Thu, 30 May 2024 05:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703D0143C40;
	Thu, 30 May 2024 05:21:19 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net (zg8tmja5ljk3lje4ms43mwaa.icoremail.net [209.97.181.73])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC22322083;
	Thu, 30 May 2024 05:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.181.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717046479; cv=none; b=KsE4jMO37YMsb+LARAEgdvL4sU4CKH4QmSJTtcpGgHXs/XMSf3+/P9sF/fF0mhOjQZUgkJ8IFweszKLCYfqI6J2TsccqcbOkatxa/Ej+X1AUOny5GoWBGuutyj48U/1tAqacK9gthycaZB0nQ0egqRs3QsCIYQ3XhUaXSJYqeNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717046479; c=relaxed/simple;
	bh=voXBnrcbnkL+4T/r4d8V6UCbguNk1JucGqtbll/LvAY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Yjq9vSHQf3z2zDAf99rPHBabsAQGxrNjBUv9T5h1Bbq/K21jOxR3+Npi+w4MJhe9c2oRemUkRdjq9IiwDj41Byy3mLaZFY2Bcz4YOcafjVPPh96N+ZLFhl5AMkzY7Cut3POvyQk98nL64059scauxtRIMkTHRNcVKCYkxk81l/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=209.97.181.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from ubuntu.localdomain (unknown [183.95.249.235])
	by mail-app2 (Coremail) with SMTP id by_KCgA3VKPuC1hmh8uRAQ--.14318S2;
	Thu, 30 May 2024 13:17:36 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-hams@vger.kernel.org,
	pabeni@redhat.com,
	kuba@kernel.org,
	edumazet@google.com,
	jreuter@yaina.de,
	davem@davemloft.net,
	dan.carpenter@linaro.org,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH net] ax25: Replace kfree() in ax25_dev_free() with ax25_dev_put()
Date: Thu, 30 May 2024 13:17:33 +0800
Message-Id: <20240530051733.11416-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:by_KCgA3VKPuC1hmh8uRAQ--.14318S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFy3Gry8Gr1kCrWxXF15XFb_yoW3Krc_uF
	97CF4xWw4UJr1UCw4rCF4rJrW7uw1Ygw1fGryfAFZ7t34jy3WUJrWkWr18ZF1UWrW7CrWS
	qrn5Zr4fAF4fKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j
	6rxdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8WwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUb66wtUUUUU==
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwMRAWZXToxxdgA2sS
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>

The object "ax25_dev" is managed by reference counting. Thus it should
not be directly released by kfree(), replace with ax25_dev_put().

Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 net/ax25/ax25_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index 742d7c68e7e..9efd6690b34 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -196,7 +196,7 @@ void __exit ax25_dev_free(void)
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


