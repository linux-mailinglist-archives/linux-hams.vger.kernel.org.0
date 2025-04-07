Return-Path: <linux-hams+bounces-512-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B909A7D7C3
	for <lists+linux-hams@lfdr.de>; Mon,  7 Apr 2025 10:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F968188B859
	for <lists+linux-hams@lfdr.de>; Mon,  7 Apr 2025 08:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180C5190678;
	Mon,  7 Apr 2025 08:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rhY0RuyA"
X-Original-To: linux-hams@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20CC189BB5
	for <linux-hams@vger.kernel.org>; Mon,  7 Apr 2025 08:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744014400; cv=none; b=u8XjVq5dbLAbGiJS94oldigCF+HJ7qyHEUunlqpYKb7+cRJ/wVVRk73AhPjuNthxyIDh+9Pu1q65DwZXi85pE3v6dG7FHUWDlJiS+Z0Jfb/dtI03V8Hrscod0isQvylaETS21KgGWe+6R9Rfrz6wIxEhvJR1Bu9kjIE2jYgZiLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744014400; c=relaxed/simple;
	bh=GjRACRzoPs2ECBqi/Pxsk9ZC9XNfvclhRF5E5PgPgMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GVA5v6ZPgfjQFsRhS0IvfaC8Zsjw6r+vLwy6CUTZv1j/mqc/bdpjTBc41MV4kA5NdorHtNkc2bWEeqrSYk5u5gZ8v/ea14TmY+0+vHiYw4qEfH5Oyh0SSS3SNv5LLk6653ittnzF8VGnJaQoF8iCyzVl5ux5A4Lv6bRQCBn27Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rhY0RuyA; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744014396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MACaU6zyr/5e+Nu+H0DPsJB7R5X63fr/DGu9+T8ZsdU=;
	b=rhY0RuyAEfsY6Ggyru+cSPojXHDw+CzU+p+npS3WA8s6OPoFCrqgc4j45q9MkOoPNc8Mbh
	luovehhKGMHN/maW2WbyE22VVQmggkCO7bC3oMHXGKkZFLAW+nA4C8bAQoDd0HQ6BQ3ojl
	qa3o5vPv4x7GMQvhrDe+LQ2hfJ+9X4U=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thomas Sailer <t.sailer@alumni.ethz.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-hams@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] hamradio: Remove unnecessary strscpy_pad() size arguments
Date: Mon,  7 Apr 2025 10:26:07 +0200
Message-ID: <20250407082607.741919-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

If the destination buffer has a fixed length, strscpy_pad()
automatically determines its size using sizeof() when the argument is
omitted. This makes the explicit sizeof() calls unnecessary - remove
them.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/net/hamradio/baycom_epp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/baycom_epp.c
index 9e366f275406..5fda7a0fcce0 100644
--- a/drivers/net/hamradio/baycom_epp.c
+++ b/drivers/net/hamradio/baycom_epp.c
@@ -1074,7 +1074,7 @@ static int baycom_siocdevprivate(struct net_device *dev, struct ifreq *ifr,
 		return 0;
 
 	case HDLCDRVCTL_DRIVERNAME:
-		strscpy_pad(hi.data.drivername, "baycom_epp", sizeof(hi.data.drivername));
+		strscpy_pad(hi.data.drivername, "baycom_epp");
 		break;
 		
 	case HDLCDRVCTL_GETMODE:
@@ -1091,8 +1091,7 @@ static int baycom_siocdevprivate(struct net_device *dev, struct ifreq *ifr,
 		return baycom_setmode(bc, hi.data.modename);
 
 	case HDLCDRVCTL_MODELIST:
-		strscpy_pad(hi.data.modename, "intclk,extclk,intmodem,extmodem,divider=x",
-			sizeof(hi.data.modename));
+		strscpy_pad(hi.data.modename, "intclk,extclk,intmodem,extmodem,divider=x");
 		break;
 
 	case HDLCDRVCTL_MODEMPARMASK:

