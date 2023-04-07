Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2A576DAEDB
	for <lists+linux-hams@lfdr.de>; Fri,  7 Apr 2023 16:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbjDGOZx (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 7 Apr 2023 10:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbjDGOZw (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 7 Apr 2023 10:25:52 -0400
X-Greylist: delayed 300 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 07 Apr 2023 07:25:50 PDT
Received: from aib29gb125.yyz1.oracleemaildelivery.com (aib29gb125.yyz1.oracleemaildelivery.com [192.29.72.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58256EA1
        for <linux-hams@vger.kernel.org>; Fri,  7 Apr 2023 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-2023;
 d=n8pjl.ca;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=OwRei2BNhmX8BvkJp0ZRG4WxXMLSD0qgfQ+sHxu4kJY=;
 b=femRHw778OSDlNxmFnGld1JbuhztYY0Zas5/EW5a+oMMRbO+NljHtKhUm4RgJeRFUsWYLq+2qWbK
   sDD4ZEDoZwzfDCHwJAOVRKg1FUa4ui+keHPGFQikex48T6R1yBgv1b9ptn7xZCPgdr4AeJ8gvzZv
   Y7HNQqyHDLfsqeICqOUBAEiZGgMkPSuWzfh4tKdzgFfMRUHMvm07obyNuQ+Z3G4+9TfocdJyPC4u
   MxUyF2IUg9ry761GQAoyCKaM6PjBmlePJQiOa0VHlRlta377agnIc2nfeXH+1LLww5jGmd2sMgNL
   J7dxmQ8dzqhwK4VOkRQBjsxf1qqbyh1/dUJEGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-yyz-20200204;
 d=yyz1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=OwRei2BNhmX8BvkJp0ZRG4WxXMLSD0qgfQ+sHxu4kJY=;
 b=pb38zMMdLPNdfGip2jYCBjov8UtYlXZQ4QSuC0u5xU2Fw455RqrwNn0ZxGh0cvXWdoQ0J1cpd+cH
   0GP4/LWNpMGfxVXI3fEMtKjJ4IZ8PfHu4cG6T5uM3+6Efcp2WnhQmmI5ak70gUoFpAgDFHDKfpIJ
   8XW9x97fkNtEEkJOKXGfwJfCzgicGIIW4dpYAt85O+gpmPspBfMzuSiElUVI37nPQ2de5O810rpK
   BZoYBuyx+yZJcoJKQ1/V9dF07IWvEMRJkTsegskImfRCShpStYIZwMD842iRkWFVAPnxCstXP6r8
   cvCPQVPTc1un5RSM+EEp+tK3JHqQj+AfAm+oAw==
Received: by omta-ad1-fd2-102-ca-toronto-1.omtaad1.vcndpyyz.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230214 64bit (built Feb 14
 2023))
 with ESMTPS id <0RSR0025116PKRE0@omta-ad1-fd2-102-ca-toronto-1.omtaad1.vcndpyyz.oraclevcn.com> for
 linux-hams@vger.kernel.org; Fri, 07 Apr 2023 14:20:49 +0000 (GMT)
From:   Peter Lafreniere <peter@n8pjl.ca>
To:     linux-hams@vger.kernel.org
Cc:     Peter Lafreniere <peter@n8pjl.ca>, netdev@vger.kernel.org
Subject: [PATCH net-next] ax25: exit linked-list searches earlier
Date:   Fri,  7 Apr 2023 10:20:42 -0400
Message-id: <20230407142042.11901-1-peter@n8pjl.ca>
X-Mailer: git-send-email 2.40.0
MIME-version: 1.0
Content-transfer-encoding: 8bit
Reporting-Meta: AAHJTkcuOwBLX2QSOTC6qVKi7uFhL45PTtpGFyGAesMEHaBMBfI2+IUYuHWctzq7
 L9JywvyGfZl0adaHBmEEQAUCc+tRrWrw6h3vqDVI81/DkHxkO9RjLg715M+/hiUc
 /6KyptVVvhhwT9EaBzT49FSoBCVbDaQ6fFrWYuYrdwHdrZONO1B5YvbRy4Ma4TlR
 3iFasS6ttQTs7KQ7D9qy7ii6iMHegTMPlBHNo1CQFICJ/knbzGkmR5fjXf5ervUn
 YZzOTsAWAtj5pMWxgf7m2lLqkBiTk1pyHQu/WhJYB+DFMXXTAb5i19dk/jv3OMn5
 Fno/L1MpsVeDSM4gpGQXrD+oEW+SXCH7me6GDaHPGOtHfh79kYYY/eKR970gubDO
 U+EBiv8h+sp/bqiK1TZt7gZYnWvztLw8DA8ON4m7HwFcj+tTP/KxpMA6S+fE6/Y=
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

There's no need to loop until the end of the list if we have a result.

Device callsigns are unique, so there can only be one dev returned from
ax25_addr_ax25dev(). If not, there would be inconsistencies based on
order of insertion, and refcount leaks.

Same reasoning for ax25_get_route() as above.

Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
---
 net/ax25/ax25_dev.c   | 4 +++-
 net/ax25/ax25_route.c | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index c5462486dbca..8186faea6b0d 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -34,11 +34,13 @@ ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
 	ax25_dev *ax25_dev, *res = NULL;
 
 	spin_lock_bh(&ax25_dev_lock);
-	for (ax25_dev = ax25_dev_list; ax25_dev != NULL; ax25_dev = ax25_dev->next)
+	for (ax25_dev = ax25_dev_list; ax25_dev != NULL; ax25_dev = ax25_dev->next) {
 		if (ax25cmp(addr, (const ax25_address *)ax25_dev->dev->dev_addr) == 0) {
 			res = ax25_dev;
 			ax25_dev_hold(ax25_dev);
+			break;
 		}
+	}
 	spin_unlock_bh(&ax25_dev_lock);
 
 	return res;
diff --git a/net/ax25/ax25_route.c b/net/ax25/ax25_route.c
index b7c4d656a94b..ed2cab200589 100644
--- a/net/ax25/ax25_route.c
+++ b/net/ax25/ax25_route.c
@@ -364,6 +364,9 @@ ax25_route *ax25_get_route(ax25_address *addr, struct net_device *dev)
 			if (ax25cmp(&ax25_rt->callsign, &null_ax25_address) == 0 && ax25_rt->dev == dev)
 				ax25_def_rt = ax25_rt;
 		}
+
+		if (ax25_spe_rt != NULL)
+			break;
 	}
 
 	ax25_rt = ax25_def_rt;
-- 
2.40.0

