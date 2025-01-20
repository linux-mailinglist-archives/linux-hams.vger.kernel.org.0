Return-Path: <linux-hams+bounces-469-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C565A164A0
	for <lists+linux-hams@lfdr.de>; Mon, 20 Jan 2025 01:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B24D93A555D
	for <lists+linux-hams@lfdr.de>; Mon, 20 Jan 2025 00:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7042728F3;
	Mon, 20 Jan 2025 00:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="T3608k7A"
X-Original-To: linux-hams@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B70184E;
	Mon, 20 Jan 2025 00:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737333301; cv=none; b=nyAC4uzR49Hxvt9xn2ozoJaOT6kq4zeKlTYECnmE7Gz9Jl690j6m3XvTFb0IJThcmgoMTW/+2YSrJ7HC+rAey9PyABEc22mzTuXiv5xSv+NaNC84LFtztwTe5Ir1Ao2IKJR3iOr+8rYXN+q3dnYcf+vHI4H5th2pcb/f8lkVIUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737333301; c=relaxed/simple;
	bh=uTVb5PI3sUxl/Q412ghoFBi0GmRU1GH6oxah4iNUwPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GXV7ZfYJIBRss/5CusX4f8r6ClrstAn30l84cxkmQcu/TcCSR1061R5FkJC1Dupruul/F0kp1OF8H+yfVVpBY8cVOCDhMw3j/10eSLVGR8wy/DDFi765bNzEj29LgBDOo2iZc98yYyJxcl5ER5sOK39jDmFSmacVH5rjYNdujgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=T3608k7A; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Ybrvf4gJdz9sS2;
	Mon, 20 Jan 2025 01:34:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1737333294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=EwJtTnflXHUSbGJotGFu68+FD/DKXKQNynalWFcALLI=;
	b=T3608k7AZD/hnEsphHsmbFYCfmxkqgEK3w2nlvcBhMGu+9Uft26M4QTumWAo+/KCIHsS1Q
	Gmd4KbIe2rKnDI8uyUxib+K2vnCR9FDgNlN68rt4DCGQsGvns7qz4RM5UdAl2uNCBSwqN6
	OoqRe3IPNG7PIIZZ43gbM2Z4VUrA3BteOfbNUj2iCxsWOMJ3cA8GA/ijBOlATFwbL8aD/G
	S+WuAsg5qVDzO9Y8i/vXlnhLTHWobPtIyTDr4sjhP0/mw9CgCWGoUjZPFSflbNxKN/ldvv
	foUAAiWtLzd/XjZXyL+QNIKdTvPbQbfoJgdfjV2vUZucrL3bTiUeOa1yYzso4w==
Date: Sun, 19 Jan 2025 19:34:51 -0500
From: Ethan Carter Edwards <ethan@ethancedwards.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "t.sailer@alumni.ethz.ch" <t.sailer@alumni.ethz.ch>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2] hamradio: baycom: replace strcpy() with strscpy()
Message-ID: <62yrwnnvqtwv4etjeaatms5xwiixirkbm6f7urmijwp7kk7bio@r2ric7eqhsvf>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 4Ybrvf4gJdz9sS2

The strcpy() function has been deprecated and replaced with strscpy().
There is an effort to make this change treewide:
https://github.com/KSPP/linux/issues/88.

Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
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


