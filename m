Return-Path: <linux-hams+bounces-453-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 546AD9FB096
	for <lists+linux-hams@lfdr.de>; Mon, 23 Dec 2024 16:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98A5618823FC
	for <lists+linux-hams@lfdr.de>; Mon, 23 Dec 2024 15:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B871B0F30;
	Mon, 23 Dec 2024 15:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="qDdoe5DD"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688621B219B;
	Mon, 23 Dec 2024 15:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734966831; cv=none; b=kQVeSeFBGJAbzoQl+dHm77ymonl4QqaD6p8RppnsiOGCxilSMgM2GSE3KHGzq7nAVTY5myXnJ7Ewniqm5qlQfRvZ34oX/q+RNuqxiiERD4+FJNKhrTOtCIcx437BqhQVDB/p/NbtXKv7D639t6//Wo7/IPN9FVlAGTMuy9F3kvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734966831; c=relaxed/simple;
	bh=mMlSDAeSoPgdqaejBFmCcWDftovFIOcmKFg0+wEQisU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bhq9OoBrrpA89/RA7yPngFggOxM3ZKgI7wS5B41yi8JFI54qH/thur3X96A/dpvETaxcJUfMC0uvPCt61BDwleAvUooeZ8b+KFjYKW0/kK+rabIA38JD5QxKCVvn6FX9pGMhtpmPjUcUyGT88YL03z7yNB267xDfyvk4nYRPYzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=qDdoe5DD; arc=none smtp.client-ip=185.70.40.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=protonmail3; t=1734966826; x=1735226026;
	bh=FnT8TeK83UXhjCnNXlL6bcROpP4xT/yyfLwm5pxmwfM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=qDdoe5DD7hnF4zNAlc+Lq5gWzVOQ9BfLmyKeZEEHpHILunuhpMHpoGma1DRA8tg6N
	 BOtauDIKofHWvEPsVDA9CK9AtDAnXLxKe3SASIaCOEQVbH9vB194MEuQe1OjEbS56W
	 zMVFturoXStOfhc3xf5SiwV0toyAkvVNdJu/X550ZRcsYJABFBBn9h9ck1lvUk/qg1
	 E/jdesm7yCOH3DlFMx/LinQrfKNJh5MfhFCgAoA7eJiPZh2xKmiMS/CbCZSr8DSFmZ
	 DurUTwzz6723AaEVHN5zoCD/IeOdZ+5mC5AN2gUbX5EZruOaEgCEBekEdOPhKGZw8V
	 ivkl0y6Q748iw==
Date: Mon, 23 Dec 2024 15:13:42 +0000
To: "t.sailer@alumni.ethz.ch" <t.sailer@alumni.ethz.ch>
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>
Subject: [PATCH] hamradio: baycom: replace strcpy() with strscpy()
Message-ID: <bqKL4XKDGLWNih2jsEzZYpBSHG6Ux5mLZfDBIgHckEUxDq4l4pPgQPEXEqKRE7pUwMrXZBVeko9aYr1w_E5h5r_R_YFA46G8dGhV1id7zy4=@ethancedwards.com>
Feedback-ID: 28410670:user:proton
X-Pm-Message-ID: dd23b6971ab968f6fc2545da0a3df91760798541
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The strcpy() function has been deprecated and replaced with strscpy().
There is an effort to make this change treewide:
https://github.com/KSPP/linux/issues/88.

Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
 drivers/net/hamradio/baycom_par.c     | 4 ++--
 drivers/net/hamradio/baycom_ser_fdx.c | 2 +-
 drivers/net/hamradio/baycom_ser_hdx.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/hamradio/baycom_par.c b/drivers/net/hamradio/bayco=
m_par.c
index 00ebc25d0b22..47bc74d3ad8c 100644
--- a/drivers/net/hamradio/baycom_par.c
+++ b/drivers/net/hamradio/baycom_par.c
@@ -427,7 +427,7 @@ static int baycom_ioctl(struct net_device *dev, void __=
user *data,
                break;

        case HDLCDRVCTL_GETMODE:
-               strcpy(hi->data.modename, bc->options ? "par96" : "picpar")=
;
+               strscpy(hi->data.modename, bc->options ? "par96" : "picpar"=
, sizeof(hi->data.modename));
                if (copy_to_user(data, hi, sizeof(struct hdlcdrv_ioctl)))
                        return -EFAULT;
                return 0;
@@ -439,7 +439,7 @@ static int baycom_ioctl(struct net_device *dev, void __=
user *data,
                return baycom_setmode(bc, hi->data.modename);

        case HDLCDRVCTL_MODELIST:
-               strcpy(hi->data.modename, "par96,picpar");
+               strscpy(hi->data.modename, "par96,picpar", sizeof(hi->data.=
modename));
                if (copy_to_user(data, hi, sizeof(struct hdlcdrv_ioctl)))
                        return -EFAULT;
                return 0;
diff --git a/drivers/net/hamradio/baycom_ser_fdx.c b/drivers/net/hamradio/b=
aycom_ser_fdx.c
index 799f8ece7824..3dda6b215fe3 100644
--- a/drivers/net/hamradio/baycom_ser_fdx.c
+++ b/drivers/net/hamradio/baycom_ser_fdx.c
@@ -531,7 +531,7 @@ static int baycom_ioctl(struct net_device *dev, void __=
user *data,
                return baycom_setmode(bc, hi->data.modename);

        case HDLCDRVCTL_MODELIST:
-               strcpy(hi->data.modename, "ser12,ser3,ser24");
+               strscpy(hi->data.modename, "ser12,ser3,ser24", sizeof(hi->d=
ata.modename));
                if (copy_to_user(data, hi, sizeof(struct hdlcdrv_ioctl)))
                        return -EFAULT;
                return 0;
diff --git a/drivers/net/hamradio/baycom_ser_hdx.c b/drivers/net/hamradio/b=
aycom_ser_hdx.c
index 5d1ab4840753..4f058f61659e 100644
--- a/drivers/net/hamradio/baycom_ser_hdx.c
+++ b/drivers/net/hamradio/baycom_ser_hdx.c
@@ -570,7 +570,7 @@ static int baycom_ioctl(struct net_device *dev, void __=
user *data,
                break;

        case HDLCDRVCTL_GETMODE:
-               strcpy(hi->data.modename, "ser12");
+               strscpy(hi->data.modename, "ser12", sizeof(hi->data.modenam=
e));
                if (bc->opt_dcd <=3D 0)
                        strcat(hi->data.modename, (!bc->opt_dcd) ? "*" : (b=
c->opt_dcd =3D=3D -2) ? "@" : "+");
                if (copy_to_user(data, hi, sizeof(struct hdlcdrv_ioctl)))
@@ -584,7 +584,7 @@ static int baycom_ioctl(struct net_device *dev, void __=
user *data,
                return baycom_setmode(bc, hi->data.modename);

        case HDLCDRVCTL_MODELIST:
-               strcpy(hi->data.modename, "ser12");
+               strscpy(hi->data.modename, "ser12", sizeof(hi->data.modenam=
e));
                if (copy_to_user(data, hi, sizeof(struct hdlcdrv_ioctl)))
                        return -EFAULT;
                return 0;
--
2.47.1


