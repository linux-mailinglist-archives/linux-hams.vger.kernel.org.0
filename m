Return-Path: <linux-hams+bounces-265-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7940C8C0D8E
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 11:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D50E4B21C7B
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 09:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCC714A618;
	Thu,  9 May 2024 09:36:49 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net (zg8tmja5ljk3lje4ms43mwaa.icoremail.net [209.97.181.73])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CC114A0BC;
	Thu,  9 May 2024 09:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.181.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715247408; cv=none; b=vEUEGzdgMv5T4o4nIT8OkTh3f+FdSlWtrm6bVddtKe2maTx0zokd+ZWH7lgrDEqQLqy5LEYgN/yjKJEJtvPjed8Nwbg2VQQGBFl9FlzQFFry+CG4drhqJHEBtRzDjCU8p76gNPpgi7dUUIIy58aK2drx2ggVNfUqTfOdYZbiWfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715247408; c=relaxed/simple;
	bh=r0c0ahyUWvezkT2rASO2cH1RBbFGC1x3V4yiqp/3QCY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=n3pfdRZtxKZlQHDrHA2IEYcAOBF8zanW760jjXFQvpwGF5b2hVzZPmGrkNIUFfdC7RN+Sx+t+zIq+ZWNCPYwm8PaqkLodIWCWHbOHgoh0tTbbqJ0qTunpFASOPuDji3Nq6OM9deslp6q4prAHbWVneq2IhYNuer8tPAJCqzwnoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=209.97.181.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from ubuntu.localdomain (unknown [221.192.180.131])
	by mail-app4 (Coremail) with SMTP id cS_KCgA3xLEBmTxmxsBPAA--.52084S2;
	Thu, 09 May 2024 17:36:23 +0800 (CST)
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
Subject: [PATCH net v7 0/3] ax25: Fix issues of ax25_dev and net_device
Date: Thu,  9 May 2024 17:35:59 +0800
Message-Id: <cover.1715247018.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:cS_KCgA3xLEBmTxmxsBPAA--.52084S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYA7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVWxJr0_GcWl84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2js
	IEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
	FIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxAqzx
	v26xkF7I0En4kS14v26r1q6r43MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbnNVDUU
	UUU==
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwIQAWY7nwoPXwAcsU
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>

The first patch uses kernel universal linked list to implement
ax25_dev_list, which makes the operation of the list easier.
The second and third patch fix reference count leak issues of
the object "ax25_dev" and "net_device".

Duoming Zhou (3):
  ax25: Use kernel universal linked list to implement ax25_dev_list
  ax25: Fix reference count leak issues of ax25_dev
  ax25: Fix reference count leak issue of net_device

 include/net/ax25.h  |  3 +--
 net/ax25/ax25_dev.c | 48 +++++++++++++++------------------------------
 2 files changed, 17 insertions(+), 34 deletions(-)

-- 
2.17.1


