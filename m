Return-Path: <linux-hams+bounces-260-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B78378C096D
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 03:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 534C9B215A3
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 01:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A9A13C8FF;
	Thu,  9 May 2024 01:56:18 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net (zg8tmja5ljk3lje4ms43mwaa.icoremail.net [209.97.181.73])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D3B13C8E9;
	Thu,  9 May 2024 01:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.181.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715219778; cv=none; b=hCrWZTyn2ZSR7jLlCqeUy3pCoqghV7JOgQiRQ+GBClAQIYwzikXn2fvsitpopSQPXIIHZVCnaBtdOkBzk14qEuptjegMufTKAX1DvcdkfD4q5KWpw/0a4FSEsQh0ZPZsD3hr6YvkkswwdjyOcHeuE0FY1lFhbbKOAUHYHryk7Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715219778; c=relaxed/simple;
	bh=D0lEga4NzrSPnmmB5RQnDioLVs1XusUapUufvpV91n4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=He+tFHV2rhYNt0SO6PE0mskhcKxBx5SIBYnJLgvYeYUQYpeaRdT5EC5bD9aaVNxh+vnj2uo8kJ/F/6hEWdTOjMQftISOKkYRdDLFQ+5ogaHrmK56/5hMirhOztJaF0IkCpduaLEMixeRzY8S8WekhfXwV4UJbuFd3suPqyIisqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=209.97.181.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from ubuntu.localdomain (unknown [221.192.180.131])
	by mail-app4 (Coremail) with SMTP id cS_KCgC3Q7EuLTxmaElMAA--.47540S2;
	Thu, 09 May 2024 09:56:01 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-hams@vger.kernel.org,
	pabeni@redhat.com,
	kuba@kernel.org,
	edumazet@google.com,
	davem@davemloft.net,
	jreuter@yaina.de,
	dan.carpenter@linaro.org,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH net v6 0/3] ax25: Fix issues of ax25_dev and net_device
Date: Thu,  9 May 2024 09:55:56 +0800
Message-Id: <cover.1715219007.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:cS_KCgC3Q7EuLTxmaElMAA--.47540S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYW7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVWxJr0_GcWl84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2js
	IEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
	FIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4c8EcI
	0Ec7CjxVAaw2AFwI0_Jw0_GFyl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUFVyIUUUU
	U
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwIQAWY7nwoGrwAGs3
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
  ax25: Fix reference count leak issues of net_device

 include/net/ax25.h  |  3 +--
 net/ax25/ax25_dev.c | 50 ++++++++++++++++-----------------------------
 2 files changed, 19 insertions(+), 34 deletions(-)

-- 
2.17.1


