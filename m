Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 554F654D443
	for <lists+linux-hams@lfdr.de>; Thu, 16 Jun 2022 00:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350527AbiFOWKe (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 15 Jun 2022 18:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345675AbiFOWKa (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 15 Jun 2022 18:10:30 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B38483BE
        for <linux-hams@vger.kernel.org>; Wed, 15 Jun 2022 15:10:28 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id d123so14120196iof.10
        for <linux-hams@vger.kernel.org>; Wed, 15 Jun 2022 15:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mtu.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jwBTpwlbhfCVNJ9PEhTg+PXi8hEimJhId2EarbK+x8M=;
        b=RC7EgbpsQneQqVwvJi/QqTjQr4qObak0dsB2To0WPpzlLCMQaGlmQ53dEQIOsFbhHO
         vHDHv+7zr0ygcDljkEYQ2Mlq8XbMvc9w9IXXXMj0nucQbsUQkt8WtN9VLugWGT9lVv4s
         ETYvwUodDLnvOxg0DFx1ZQ8UcqK4GuPf21pFOK7w8fJ4cXRmmQ8Y519k7oiUShi2QYcN
         iJNKSQDyyDrV5xZNc+0az+p0qtk1GjOy8CjDTBTOqRV11yqfw/PHnJ5tBI5t7GuEbIdd
         lMYd+iYTR5mdyRivwq7TTl/YO96TDwwtrJTCmBBAkiE7p9NkYn7nDD/yYmXUjGXE/UJ3
         ERNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jwBTpwlbhfCVNJ9PEhTg+PXi8hEimJhId2EarbK+x8M=;
        b=rcwn+qR+VCDQ9xor7kvOwk7/l2NHOfWXKP5RTuAUkeQo3+N0DEfVyZg3mUVgMuMNJ2
         hLUkGzhJK90Zx7/3aa3K/HjyMCQ7NoorPq+3keos+Q102Ux6zxdZHeC2T7czwZqPUIqj
         eBEixYF6IdM8pdpfKlbIY+OTMDk8Od1dGBZrDQbRjyKdgdWL8Rg71Rky7pKycUMTQHlY
         nuBRuIHVbZQQ2XeY+SdSvwWAQpBqdRliXwdst8AwY4VmPUUNxwSTnSgpLEjr13VxHOw8
         AlZqbJeuy1spLZbs4bRVx7ylwM5/RRVPRMllNEaifYF0pH+HmzfWfruKAZczyEdM61N+
         5ZqQ==
X-Gm-Message-State: AJIora8OmGvq0qYMd89o5Uk0ISer7kKFE+0pI6SEcbMfASyBeykCaCrA
        EnEBlopmpFlI2YyzWTQk6vAcRU+rm57eGA==
X-Google-Smtp-Source: AGRyM1tV67nxO1/0rem85vddrMgJeKbI8Dt6MdRbkVldcv2qjHoGX48X8Tzg5H+GHe3HnyLZ9cdVwg==
X-Received: by 2002:a05:6638:381c:b0:331:b4c2:1f93 with SMTP id i28-20020a056638381c00b00331b4c21f93mr1015679jav.185.1655331027478;
        Wed, 15 Jun 2022 15:10:27 -0700 (PDT)
Received: from Peter-Reagan-Desktop-VI.. (z205.pasty.net. [71.13.100.205])
        by smtp.googlemail.com with ESMTPSA id r6-20020a5edb46000000b00669cb1125d0sm167398iop.55.2022.06.15.15.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 15:10:27 -0700 (PDT)
From:   Peter Lafreniere <pjlafren@mtu.edu>
To:     linux-hams@vger.kernel.org
Cc:     netdev@vger.kernel.org, Peter Lafreniere <pjlafren@mtu.edu>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v3] ax25: use GFP_KERNEL in ax25_dev_device_up()
Date:   Wed, 15 Jun 2022 18:09:47 -0400
Message-Id: <20220615220947.3767-1-pjlafren@mtu.edu>
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
v2 -> v3:
 - Rebased for clean application to net-next

v1 -> v2:
 - Renamed patch from "ax25: use GFP_KERNEL over GFP_ATOMIC where possible"
   (Is that okay?)
 - Removed invalid changes to ax25_rt_add()

 net/ax25/ax25_dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index ab88b6ac5401..2093f94f6852 100644
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
-	netdev_hold(dev, &ax25_dev->dev_tracker, GFP_ATOMIC);
+	netdev_hold(dev, &ax25_dev->dev_tracker, GFP_KERNEL);
 	ax25_dev->forward = NULL;
 	ax25_dev->device_up = true;
 

base-commit: fbb89d02e33a8c8f522d75882f5f19c65b722b46
-- 
2.36.1

