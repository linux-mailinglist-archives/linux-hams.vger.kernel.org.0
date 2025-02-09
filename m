Return-Path: <linux-hams+bounces-476-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9F4A2DABC
	for <lists+linux-hams@lfdr.de>; Sun,  9 Feb 2025 05:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 633F4165742
	for <lists+linux-hams@lfdr.de>; Sun,  9 Feb 2025 04:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E67F1BF24;
	Sun,  9 Feb 2025 04:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="PSuJR+CM"
X-Original-To: linux-hams@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666941392;
	Sun,  9 Feb 2025 04:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739073991; cv=none; b=b6ciT4O4KPSafN15vgZJCsQlZa2A2eSc2pVJpELv6uEbjqxr5OpC0l1wPCeZKWDVgUMP6YLBYRQITew3D2WaZEo3P4yVUUmGLsuUtE8Pr7/nV5sIO3g7Z1CrlOw2ZDdmmz1GsyG6isQeh8ciwC3RqUVwUQLJSWdNTfvN9Hd0sQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739073991; c=relaxed/simple;
	bh=7zheC5r9UEDKuncLWSf9PYOyDSnuiBxjk4GVoEOc1hI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LO2Gqtl/8+Sduu6NYN7h6DVg6ITGcgNmzoqM8fX8WDwhHbzfV5ZMqXYC/IZtrqFjcLZAPagkSs83XaBPxJsrL3g4701cxMSU89LEM0ZG3396twkUQibLNTlaTIIhvyRZxPCYbJQvmGZDH3TEhAn8JKPIK61J0Jsj7apejIMsh30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=PSuJR+CM; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4YrDfS3YsSz9skQ;
	Sun,  9 Feb 2025 05:06:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1739073984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=ltjFoxTAxyndszAucu/FRvuWcGA6M5KNw2ipIWnLj0A=;
	b=PSuJR+CM26cpujHSJeXkJIfkU3Tvq67PL2aXfCj2drNPGQB7FampRgON82ZCdLyzwu2t1Q
	EtCdY2toTlu6+4U3UyP+/IPc/cy0nYUW5WtFOzuy72LkpEBCshokE4t9fjPXLHJY010TSo
	9B8ynHCqfFY6VQgB0cCfS2+06PsIgzuCaYl/vo0Lm6c1UfimIGMgu5oZH9i+myBURe4MEY
	yUZ7Dn6yNVyFSd0Kani0c1psdHj9ZCq4lL1DoPFPNMEYYPcPGIj5R1E06mMQQeI0KwYR1r
	+n4fVRiWRhNNAzljKs5E4XoeEUkKqqiAgECB0RM+lF2cNkW3F5fHvxIfH0z3JA==
Date: Sat, 8 Feb 2025 23:06:21 -0500
From: Ethan Carter Edwards <ethan@ethancedwards.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-hams@vger.kernel.org, pabeni@redhat.com, linux-hardening@vger.kernel.org, 
	kernel-hardening@lists.openwall.com
Subject: [PATCH v3] hamradio: baycom: replace strcpy() with strscpy()
Message-ID: <3qo3fbrak7undfgocsi2s74v4uyjbylpdqhie4dohfoh4welfn@joq7up65ug6v>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 4YrDfS3YsSz9skQ

The strcpy() function has been deprecated and replaced with strscpy().
There is an effort to make this change treewide:
https://github.com/KSPP/linux/issues/88.

Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 v3: resend after merge window ends
 Link to v2: https://lore.kernel.org/lkml/62yrwnnvqtwv4etjeaatms5xwiixirkbm6f7urmijwp7kk7bio@r2ric7eqhsvf/T/#u
 v2: reduce verbosity
 Link to v1: https://lore.kernel.org/lkml/bqKL4XKDGLWNih2jsEzZYpBSHG6Ux5mLZfDBIgHckEUxDq4l4pPgQPEXEqKRE7pUwMrXZBVeko9aYr1w_E5h5r_R_YFA46G8dGhV1id7zy4=@ethancedwards.com/
 drivers/net/hamradio/baycom_par.c     | 4 ++--
 drivers/net/hamradio/baycom_ser_fdx.c | 2 +-
 drivers/net/hamradio/baycom_ser_hdx.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/hamradio/baycom_par.c b/drivers/net/hamradio/baycom_par.c
index 00ebc25d0b22..47bc74d3ad8c 100644
--- a/drivers/net/hamradio/baycom_par.c
+++ b/drivers/net/hamradio/baycom_par.c
@@ -427,7 +427,7 @@ static int baycom_ioctl(struct net_device *dev, void __user *data,
 		break;
 
 	case HDLCDRVCTL_GETMODE:
-		strcpy(hi->data.modename, bc->options ? "par96" : "picpar");
+		strscpy(hi->data.modename, bc->options ? "par96" : "picpar");
 		if (copy_to_user(data, hi, sizeof(struct hdlcdrv_ioctl)))
 			return -EFAULT;
 		return 0;
@@ -439,7 +439,7 @@ static int baycom_ioctl(struct net_device *dev, void __user *data,
 		return baycom_setmode(bc, hi->data.modename);
 
 	case HDLCDRVCTL_MODELIST:
-		strcpy(hi->data.modename, "par96,picpar");
+		strscpy(hi->data.modename, "par96,picpar");
 		if (copy_to_user(data, hi, sizeof(struct hdlcdrv_ioctl)))
 			return -EFAULT;
 		return 0;
diff --git a/drivers/net/hamradio/baycom_ser_fdx.c b/drivers/net/hamradio/baycom_ser_fdx.c
index 799f8ece7824..3dda6b215fe3 100644
--- a/drivers/net/hamradio/baycom_ser_fdx.c
+++ b/drivers/net/hamradio/baycom_ser_fdx.c
@@ -531,7 +531,7 @@ static int baycom_ioctl(struct net_device *dev, void __user *data,
 		return baycom_setmode(bc, hi->data.modename);
 
 	case HDLCDRVCTL_MODELIST:
-		strcpy(hi->data.modename, "ser12,ser3,ser24");
+		strscpy(hi->data.modename, "ser12,ser3,ser24");
 		if (copy_to_user(data, hi, sizeof(struct hdlcdrv_ioctl)))
 			return -EFAULT;
 		return 0;
diff --git a/drivers/net/hamradio/baycom_ser_hdx.c b/drivers/net/hamradio/baycom_ser_hdx.c
index 5d1ab4840753..4f058f61659e 100644
--- a/drivers/net/hamradio/baycom_ser_hdx.c
+++ b/drivers/net/hamradio/baycom_ser_hdx.c
@@ -570,7 +570,7 @@ static int baycom_ioctl(struct net_device *dev, void __user *data,
 		break;
 
 	case HDLCDRVCTL_GETMODE:
-		strcpy(hi->data.modename, "ser12");
+		strscpy(hi->data.modename, "ser12");
 		if (bc->opt_dcd <= 0)
 			strcat(hi->data.modename, (!bc->opt_dcd) ? "*" : (bc->opt_dcd == -2) ? "@" : "+");
 		if (copy_to_user(data, hi, sizeof(struct hdlcdrv_ioctl)))
@@ -584,7 +584,7 @@ static int baycom_ioctl(struct net_device *dev, void __user *data,
 		return baycom_setmode(bc, hi->data.modename);
 
 	case HDLCDRVCTL_MODELIST:
-		strcpy(hi->data.modename, "ser12");
+		strscpy(hi->data.modename, "ser12");
 		if (copy_to_user(data, hi, sizeof(struct hdlcdrv_ioctl)))
 			return -EFAULT;
 		return 0;
-- 
2.47.1


