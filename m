Return-Path: <linux-hams+bounces-221-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 877208BDACC
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 07:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41E37282232
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 05:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612786BFB8;
	Tue,  7 May 2024 05:52:27 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325EF6BB5C;
	Tue,  7 May 2024 05:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715061147; cv=none; b=WYL2qIJj6AAvOOy911WobFVolYzQ8kIjTDCBlSJUytCFUKEpfn1Zlx+4FcbDCZnzn65BtAS50zV3IPrkRmQtTtq1tRFoXHqTGJPA4o35PZTpC+5FBxl4ASfWbjN0U2kdCqeyYxtheCR4IyPMXYfuPWc5PJOjVubejd03rejh95U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715061147; c=relaxed/simple;
	bh=gC0kKWlfBsustWrnJXdLxPwQMLG6KOvg1mzJaAOLwhM=;
	h=From:To:Cc:Subject:Date:Message-Id; b=dJqm5D5b6KE0rPDg6JM1ggUuAmYMP/H3y+YABXQ5Nd9RrjGFeJPTBYemb5a0y2lj0IP7+AOTRaUp/TTu+ku7hOylca4gf3SK04gMYBgtYorVURg7wGYwpb+4727D/8DvgOYwXI98hwcUoKRrJqELC22QoNd4/S5tyJdncLNDZTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from ubuntu.localdomain (unknown [221.192.179.90])
	by mail-app2 (Coremail) with SMTP id by_KCgAnIJ56wTlmGDBDAA--.3058S2;
	Tue, 07 May 2024 13:51:57 +0800 (CST)
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
Subject: [PATCH net v4 0/4] ax25: Fix issues of ax25_dev and net_device
Date: Tue,  7 May 2024 13:51:53 +0800
Message-Id: <cover.1715059894.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:by_KCgAnIJ56wTlmGDBDAA--.3058S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr17CF4xCrWxAFyUArW8WFg_yoWfXFg_uF
	ykAFWDZw18JFWDCa10ka1rXrZruF4jga1xXFyftFZ5Jry3Za4UJr4qgr4rXF18XFW7tr4k
	t3Z5Gr1fAr17JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j
	6rxdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8WwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUBuWLUUUUU=
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwMOAWY4-AkEPQA6sn
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>

The first patch use kernel universal linked list to implement
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


