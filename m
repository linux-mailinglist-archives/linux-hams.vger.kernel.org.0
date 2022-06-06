Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 530C853ED15
	for <lists+linux-hams@lfdr.de>; Mon,  6 Jun 2022 19:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbiFFRkn (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 6 Jun 2022 13:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiFFRkl (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 6 Jun 2022 13:40:41 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6DB429E4EB
        for <linux-hams@vger.kernel.org>; Mon,  6 Jun 2022 10:40:38 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-e656032735so20064325fac.0
        for <linux-hams@vger.kernel.org>; Mon, 06 Jun 2022 10:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mtu.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DtyyUcod6yH34VWx/gOEMfrYC3WTarSagW2RLB8d30k=;
        b=ib70jNGgk10w5WIrphmuEnyzmUa7hIwQAM5XAXTZVCho1WRGnDJ11O1LyhiurdX+h7
         uCY8liPjgJaoaH4ysb20pPxj1xJwYswpJjnGmufGsLTR+K2U5p1B6ztjcgt8R48OO0j3
         rNyk+pJy12WY+D6GVS7hghy6OAhO3i1ufPuLNsu4pIe3/2zOJvRs7aHBL1zakgNmY5Ki
         I/kGciTVE+d6UmXJjafUpt+hDcruUbgMQ+mJ9VmLWXx5y9GiX0FF62oz3qUwxX/wYd/G
         g5DcZzyOgDjtoq3YN+u64pyWxgfXrAVx7AutWhCIeS1HWoSHd/0aWUB4d70WHIrFpHFJ
         rrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DtyyUcod6yH34VWx/gOEMfrYC3WTarSagW2RLB8d30k=;
        b=YB3PeBnPSoPm+XtKn1a42d+5SQ+Upf/hu0Zpifac0bKoqCS8GVsu+VRyPMv6UkPUvc
         LYCpzol2SzMK36cZoGzKcKzrG3jgG+A+ULt0IPYUIsJiDRludZvSzx2c4hCsgrLCP9zo
         TKfs81a3zH+ID7gWNoBDtBpre+z77n5gBvHBDpd/OD5nD6n1FTLEvAF4cMUiFuV54ENc
         ChOiimknGEAYz0GS2pNU/lMLwaLdQqn3VUw0RkOUU6ge0GhmZhyEtDocYfQInIJWo+Zj
         J9saVjF/QHc/+ZIX4KRXxWYzDlxwRI7ofA1n4iLmzu330WU8Wbl3mSo8Wq2Juy/puO2V
         UTeg==
X-Gm-Message-State: AOAM530MORhEy09dE1BigRqdZan/GfYDXcYpT3FD3F6mGTllikE9NNR0
        Gv3Ms2ObBZaD9uXkau+gPpmBLDzphJGLS0Dn
X-Google-Smtp-Source: ABdhPJzqBwG7fXQJmZ4D/NDo4ngw2oj0m1XoCUHBrzqfrbG1JebDWY8bqt+RyGZ2xq0lr7NzJJ6uZg==
X-Received: by 2002:a05:6870:ea9d:b0:f2:aaf3:410c with SMTP id s29-20020a056870ea9d00b000f2aaf3410cmr14232194oap.205.1654537238050;
        Mon, 06 Jun 2022 10:40:38 -0700 (PDT)
Received: from localhost.localdomain ([2600:380:a667:2f5:c8d:cd64:49e4:d05d])
        by smtp.gmail.com with ESMTPSA id g4-20020a056870d20400b000f1bc45ba21sm7252401oac.14.2022.06.06.10.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 10:40:37 -0700 (PDT)
From:   Peter Lafreniere <pjlafren@mtu.edu>
To:     linux-hams@vger.kernel.org
Cc:     Peter Lafreniere <pjlafren@mtu.edu>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2] ax25: use GFP_KERNEL in ax25_dev_device_up()
Date:   Mon,  6 Jun 2022 13:40:12 -0400
Message-Id: <20220606174012.10262-1-pjlafren@mtu.edu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

ax25_dev_device_up() is only called during device setup, which is
done in user context. In addition, ax25_dev_device_up()
unconditionally calls ax25_register_dev_sysctl(), which already
allocates with GFP_KERNEL.

Since it is allowed to sleep in this function, here we change
ax25_dev_device_up() to use GFP_KERNEL to reduce unnecessary
out-of-memory errors.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peter Lafreniere <pjlafren@mtu.edu>
---
v1 -> v2:
 - Renamed patch from "ax25: use GFP_KERNEL over GFP_ATOMIC where possible"
   (Is that okay?)
 - Removed invalid changes to ax25_rt_add()

This isn't related to the patch itself, but thanks are owed to everyone
who had to handle my mistakes in submitting this patch the first time.
First the posting during the merge window, which I know better to do,
then me making the stupidest error of missing a lock directly next to the
relevant code.

I'm sorry for taking up your time, especially with these small and
insignificant patches. That said, I hope to be able to work with everyone
in this community in the future.

Thank you all for your time,
Peter L.

 net/ax25/ax25_dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index 95a76d571c44..af5892ee0066 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -52,7 +52,7 @@ void ax25_dev_device_up(struct net_device *dev)
 {
 	ax25_dev *ax25_dev;
 
-	if ((ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_ATOMIC)) == NULL) {
+	if ((ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_KERNEL)) == NULL) {
 		printk(KERN_ERR "AX.25: ax25_dev_device_up - out of memory\n");
 		return;
 	}
@@ -60,7 +60,7 @@ void ax25_dev_device_up(struct net_device *dev)
 	refcount_set(&ax25_dev->refcount, 1);
 	dev->ax25_ptr     = ax25_dev;
 	ax25_dev->dev     = dev;
-	dev_hold_track(dev, &ax25_dev->dev_tracker, GFP_ATOMIC);
+	dev_hold_track(dev, &ax25_dev->dev_tracker, GFP_KERNEL);
 	ax25_dev->forward = NULL;
 	ax25_dev->device_up = true;
 
-- 
2.36.1

