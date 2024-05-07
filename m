Return-Path: <linux-hams+bounces-227-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5018BDB49
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 08:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1FA7B223A5
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 06:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAB76F505;
	Tue,  7 May 2024 06:21:32 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from zg8tmtu5ljy1ljeznc42.icoremail.net (zg8tmtu5ljy1ljeznc42.icoremail.net [159.65.134.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044226F514;
	Tue,  7 May 2024 06:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.65.134.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715062891; cv=none; b=kDoDNtmNKYkMQw43wdjkEW3x/kKcIFROmVtCsA9Sq86DggFOrfkE2tQdMmPOqfn0tKqa5WzDUq1xzTOvZII2g+lGxPbEFwuMbzcGJcLjJVyHkGtqqXQCIZ2vkC8hL9NGJsBRLlGVVjfDbyJW6EzQMl/1AUDJSCDIycYGTevMKfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715062891; c=relaxed/simple;
	bh=HF+Ofv68p/rKPCMK4bG+yOgon7sXYv8NhYt95aJ9Zug=;
	h=From:To:Cc:Subject:Date:Message-Id; b=MZ9MVGITxUlKXnUmL/rElOlmvm6gw/N5twgvsy3IgOWaxK2Mba5tKT7mSCn6kKSoB0vuHkl8EcUqDBjS99sGQ145+RZ56w1UdUhW96+qqieOfCJhfPf9YvQNDfPn0eKnDwyBClNdZDyDsxtR7Jga2hwNbYoKWOOy8WB/d4mNyUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=159.65.134.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from ubuntu.localdomain (unknown [221.192.179.90])
	by mail-app4 (Coremail) with SMTP id cS_KCgC3Q7FVyDlmqYMzAA--.6564S2;
	Tue, 07 May 2024 14:21:13 +0800 (CST)
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
Subject: [PATCH RESEND net v4 0/4] ax25: Fix issues of ax25_dev and net_device
Date: Tue,  7 May 2024 14:21:08 +0800
Message-Id: <cover.1715062582.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:cS_KCgC3Q7FVyDlmqYMzAA--.6564S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr17CF4xCrWxAFyUArW8WFg_yoWfXFX_uF
	ykAFWUZw18JFWDCa10ka1rXrZruF4jga1xXFyftFZ5Jry3Za4UJr4qgr4rXF18XFW7tr4k
	t3Z5Gr1fAr17JjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUU1n8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_GcCE
	3s1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1lnx0E84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_GcCE3s0E84ACjcxK6xIIjxv20xvE14v2
	6w1j6s0q6x02cVCv0xWlnx0E84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_GcCE3s0E84ACjc
	xK6I8E87Iv67AKxVW0oVCq3VCjxxvEa2IrM2vj628EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6rxl6s0q6x02cVCv0xWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFI
	xGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67AK6r47MxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUZYwUUUUUU==
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwMOAWY4-AkEPQBQsN
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>

The first patch uses kernel universal linked list to implement
ax25_dev_list, which makes the operation of the list easier.
The second and third patch fix reference count leak issues of
the object "ax25_dev" and "net_device". The last patch uses
ax25_dev_put() to replace kfree() in ax25_dev_free().

You can see the former discussion in the following link:
https://lore.kernel.org/netdev/20240501060218.32898-1-duoming@zju.edu.cn/

Duoming Zhou (4):
  ax25: Use kernel universal linked list to implement ax25_dev_list
  ax25: Fix reference count leak issues of ax25_dev
  ax25: Fix reference count leak issues of net_device
  ax25: Change kfree() in ax25_dev_free() to ax25_dev_put()

 include/net/ax25.h  |  4 ++--
 net/ax25/ax25_dev.c | 51 ++++++++++++++++-----------------------------
 2 files changed, 20 insertions(+), 35 deletions(-)

-- 
2.17.1


