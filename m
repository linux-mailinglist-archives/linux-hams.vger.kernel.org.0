Return-Path: <linux-hams+bounces-232-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA068BDC05
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 09:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03F8E1F236BE
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 07:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED61C7A15D;
	Tue,  7 May 2024 07:04:10 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD2D78C9E;
	Tue,  7 May 2024 07:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715065450; cv=none; b=A6bJu7n6/1MfxJRqOvRj8Wz3+DLJkUf3q/CEjfCwlOL6CygcUSC1ZcLKppL5y55EayzDfLmdVDokT4rw+3FeBv7bVqr2AbmcSCYDNaiFFBR8OqdBMTdhczfRaVgqxyYAXghS9KH96RoEbSOPme0A+yhqw43r4gqJnro7l7/nXKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715065450; c=relaxed/simple;
	bh=WaQkYik9wlnYGYVpBkPnO+M6frV18a2jVnfWRl5E150=;
	h=From:To:Cc:Subject:Date:Message-Id; b=I3v9xBUZXYX8PMV+Au0J4w9Up6vj6IJcJrjOZLm00qpJ79ewIpay6QtBYSwh48mscvqWfbm1JHg3t2Ix8xMOqJDE73kNe3N4PrjPVEud5CZmzBoqFd6RWJKdjSUYjibMawXC8VLggQw7li6lAMwF5/MAr6J/zPJym2YGxCH6DFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from ubuntu.localdomain (unknown [221.192.179.90])
	by mail-app4 (Coremail) with SMTP id cS_KCgCXJrRP0jlmbxo0AA--.51257S2;
	Tue, 07 May 2024 15:03:52 +0800 (CST)
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
Subject: [PATCH net v5 0/4] ax25: Fix issues of ax25_dev and net_device
Date: Tue,  7 May 2024 15:03:38 +0800
Message-Id: <cover.1715065005.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:cS_KCgCXJrRP0jlmbxo0AA--.51257S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr17CF4xCrWxAFyUArW8WFg_yoWfXFg_uF
	ykAFWUZw18JFWDCF40kF4rXrZruF4jga1xXFyftFZ5Gry3Za4UJr4qgr4rXF18XFW7tr4k
	t3Z5Gr1fAr17JjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbh8YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJr0_GcWl84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxI
	r21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87
	Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0E
	jII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26rWY6Fy7MxkIecxEwVAFwVW8CwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjTiLL0nUUUUU
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwIOAWY4-AkN6wAOsN
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

 include/net/ax25.h  |  3 +--
 net/ax25/ax25_dev.c | 52 +++++++++++++++++----------------------------
 2 files changed, 20 insertions(+), 35 deletions(-)

-- 
2.17.1


