Return-Path: <linux-hams+bounces-586-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E65B327EF
	for <lists+linux-hams@lfdr.de>; Sat, 23 Aug 2025 11:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 865041C80C8C
	for <lists+linux-hams@lfdr.de>; Sat, 23 Aug 2025 09:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB29519EED3;
	Sat, 23 Aug 2025 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b="qjXsz2Pf"
X-Original-To: linux-hams@vger.kernel.org
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20CEB663
	for <linux-hams@vger.kernel.org>; Sat, 23 Aug 2025 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.42.203.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755941485; cv=none; b=m2wmYNo5wqd79UNeOPKSY4/3y+9EQqLYLNc5kzGkNXXdyaxcT8uaus4DhqQ8XMCDoYkL0GlITPM5XRWMXdrQnqFOFXUDBNQ8lkG+XK3qqx2Ivf1Dn980mlBg9YpGkW/YRKi/XjVYkjWhOWVleIPzr+1v/ynhzW78990dJ5+x8I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755941485; c=relaxed/simple;
	bh=MhcGFABpkhV6dPptQmiFsyXCThprV3xZCxZYt5ZAFWM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cC9+ecUIcBJns2eiPKVkgR70Q6ZRIZd4ZtKmxtp4jnOLnW59S7x/vlqMuaXL3SCa+LThKbDp/PSidu4GOxkaErbM7pfaUkt+0+s7hHzco4oTwe1x5m/XQ3SOexyPpbdaOQLDzZPlYpigoyLvNazpQAOGuSolIgYRZV1vkaYdJfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b=qjXsz2Pf; arc=none smtp.client-ip=52.42.203.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.jp; i=@amazon.co.jp; q=dns/txt;
  s=amazoncorp2; t=1755941483; x=1787477483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MhcGFABpkhV6dPptQmiFsyXCThprV3xZCxZYt5ZAFWM=;
  b=qjXsz2PfZsN6Yd5xLOr6U3Ury+ih3oq7YPgzipzIcZqfNTFfaxSmp433
   iEFGp8LNf4XeMJ/vgh6TmkOmc+yw63rB/WZkNJyqZ0FWsKi483SWBIFiD
   fvQsaEi3YQXZVw0+ffMzeJcxqXudS+p8piaQMEPM18NjksIVeABGIbr8f
   +cyM7VzevpY/1XwXK2VNicTx64iVsnkIG3REIo5G1z7Yr/a0h39jdMMy2
   wqCa4yfk01dfxeG2UH2HSGMEsPFXT/iqoW4vgGHqjIMusxG8xhJGXek0J
   +WrUmIEscWuNdXn/eIsKe++gcveZauE+XYSrTTA3zwrYI7w4eMKp3WrdT
   A==;
X-CSE-ConnectionGUID: 3cgknQbXTbOAB3G2gumyBg==
X-CSE-MsgGUID: zo/47sG7TvCyRFiLEK5kPQ==
X-IronPort-AV: E=Sophos;i="6.17,312,1747699200"; 
   d="scan'208";a="1660303"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 09:31:23 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.21.151:61266]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.45.64:2525] with esmtp (Farcaster)
 id 3fb20c7e-d604-4d07-985b-dcd64f8d30cf; Sat, 23 Aug 2025 09:31:23 +0000 (UTC)
X-Farcaster-Flow-ID: 3fb20c7e-d604-4d07-985b-dcd64f8d30cf
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Sat, 23 Aug 2025 09:31:23 +0000
Received: from 80a9974c3af6.amazon.com (10.37.244.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Sat, 23 Aug 2025 09:31:22 +0000
From: Takamitsu Iwai <takamitz@amazon.co.jp>
To: <f6bvp@free.fr>
CC: <linux-hams@vger.kernel.org>
Subject: Re: [PATCH v1 net 0/3] net: rose: introduce refcount_t for reference counting of rose_neigh
Date: Sat, 23 Aug 2025 18:31:15 +0900
Message-ID: <20250823093115.53339-1-takamitz@amazon.co.jp>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <7974d84e-8ecb-48fd-8b1c-67850ae874bc@free.fr>
References: <7974d84e-8ecb-48fd-8b1c-67850ae874bc@free.fr>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D042UWA002.ant.amazon.com (10.13.139.17) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

I submitted these patches, but I can't see that errors through
the following step:

1. clone net-next repo using "git clone" command.
2. apply patches to net-next tree "git am" command.
3. run "make menuconfig" command, and set CONFIG_ROSE to "y".
4. run "make" command and build kernel.

If you tell me reproducing steps, I will check them in my environment.


Sincerely,
Takamitsu

