Return-Path: <linux-hams+bounces-214-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 962758BCFB5
	for <lists+linux-hams@lfdr.de>; Mon,  6 May 2024 16:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E303FB22DA7
	for <lists+linux-hams@lfdr.de>; Mon,  6 May 2024 14:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AABB8286F;
	Mon,  6 May 2024 14:09:09 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B09882497;
	Mon,  6 May 2024 14:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715004549; cv=none; b=BlXxs2ME6Z23oOcp6vPFWzR1pcYqiB54EwK+9dOgPt2J3b6Ik1h/bJAiw3D9UgIg+BGaoMsXnp/22hBraDSO8KyJQ0zHekYhkEOKd0+PvzOolQ6Byv5QuiAjTZxdDCmSkE3z5bnW1lfQeyKaq1lAW1CEpU+wvoCpAtSKFkHbw04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715004549; c=relaxed/simple;
	bh=xfREskp0aFFmWPukql0qe6jAozQgtsD58tDf97zGEGg=;
	h=From:To:Cc:Subject:Date:Message-Id; b=eFiN95ZCdY/lDUA91LUlfkDrE75Kt/p5lxgv/mLn6Cpe2Dob8O1949Ag4gUJQxVL/7T0XhXHd8MqhOsvySJxTd85XcZqIgs/8UVFpmp6v08139k5r3JTebN7KImqfVIrulvMCqTvPKGJVcZUZVhmrhSb3+1OI0OxR1+80WxM5Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from ubuntu.localdomain (unknown [221.192.180.207])
	by mail-app2 (Coremail) with SMTP id by_KCgCXtaRj5DhmI_s4AA--.15255S2;
	Mon, 06 May 2024 22:08:38 +0800 (CST)
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
Subject: [PATCH net v3 0/2] ax25: Fix issues of ax25_dev and net_device
Date: Mon,  6 May 2024 22:08:33 +0800
Message-Id: <cover.1715002910.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:by_KCgCXtaRj5DhmI_s4AA--.15255S2
X-Coremail-Antispam: 1UD129KBjvdXoWrCr4xZw13ZryUCw4xtrW5Wrg_yoWxXwc_uF
	y8AFW5Zw18JFWDGFW0yF48Jr9rCF4jgw1rXFnIqFZ5try3Zr1UJr4DWr48Xr18WFWjyr4k
	t3WrAr4fAr13JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Xryl42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOzuWDUUUU
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwINAWY3qokcfgAZsE
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>

The first patch fixes reference count leak issues the object of
"ax25_dev" and "net_device". The second patch uses ax25_dev_put()
to replace kfree() in ax25_dev_free().

You can see the former discussion in the following link:
https://lore.kernel.org/netdev/20240501060218.32898-1-duoming@zju.edu.cn/

Duoming Zhou (2):
  ax25: Fix reference count leak issues of ax25_dev and net_device
  ax25: Change kfree() in ax25_dev_free() to ax25_dev_put()

 include/net/ax25.h  |  4 ++--
 net/ax25/ax25_dev.c | 49 ++++++++++++++++-----------------------------
 2 files changed, 19 insertions(+), 34 deletions(-)

-- 
2.17.1


