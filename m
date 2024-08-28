Return-Path: <linux-hams+bounces-412-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 256459626EB
	for <lists+linux-hams@lfdr.de>; Wed, 28 Aug 2024 14:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0E081F23DD8
	for <lists+linux-hams@lfdr.de>; Wed, 28 Aug 2024 12:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060AA175D2F;
	Wed, 28 Aug 2024 12:24:33 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA4316A95E;
	Wed, 28 Aug 2024 12:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724847872; cv=none; b=ppgjURcGRwTTf1LGJi2aJ8kR4fS9Td57epNYlKU1rxy31jcOU7EJWVbfs1SLBPtHo3QkZsWPm0WD4ZrgUoesKRo73A2kcGMsks9WSM/mCHCyOahxhAyj/v8uK524teHKwvEgz81fig7fAVXaFElj57zRo/PYEozzjitp2UmLCPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724847872; c=relaxed/simple;
	bh=4/5dD4pWLHgOIe9GUqGD+bM+B6Z2dK3bEF3yT3AM518=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m4nfRZmRlMuXuPnoh7YywOzTECWsRbTryWDMTKFb5DmoeaDTobRDQnfrAkxy0Y0IjegAi/UCtTlulYbCRmXoUM5LO2nOCwTfKwoqL9b0iZ7l3Sz3zit+2ZCKUgYuZZQzu1nfUxlLexzCGLZjCTk6EdSFDSG93BrMckax4q/zxqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Wv3Pk1q2LzQqtW;
	Wed, 28 Aug 2024 20:19:38 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 227F414037D;
	Wed, 28 Aug 2024 20:24:28 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 Aug
 2024 20:24:27 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <dsahern@kernel.org>, <ralf@linux-mips.org>,
	<jmaloy@redhat.com>, <ying.xue@windriver.com>, <dan.carpenter@linaro.org>
CC: <netdev@vger.kernel.org>, <linux-hams@vger.kernel.org>,
	<netfilter-devel@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH net-next v2 0/6] replace deprecated strcpy with strscpy
Date: Wed, 28 Aug 2024 20:32:18 +0800
Message-ID: <20240828123224.3697672-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500022.china.huawei.com (7.185.36.66)

The deprecated helper strcpy() performs no bounds checking on the
destination buffer. This could result in linear overflows beyond
the end of the buffer, leading to all kinds of misbehaviors.
The safe replacement is strscpy() [1].

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]

Hongbo Li (6):
  net: prefer strscpy over strcpy
  net/ipv6: replace deprecated strcpy with strscpy
  net/netrom: prefer strscpy over strcpy
  net/netfilter: replace deprecated strcpy with strscpy
  net/tipc: replace deprecated strcpy with strscpy
  net/ipv4: net: prefer strscpy over strcpy

 net/core/dev.c                  | 2 +-
 net/ipv4/ip_tunnel.c            | 2 +-
 net/ipv4/netfilter/arp_tables.c | 2 +-
 net/ipv4/netfilter/ip_tables.c  | 2 +-
 net/ipv6/ndisc.c                | 2 +-
 net/netfilter/xt_recent.c       | 2 +-
 net/netrom/nr_route.c           | 4 ++--
 net/tipc/bearer.c               | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.34.1


