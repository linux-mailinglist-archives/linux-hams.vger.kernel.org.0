Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD246E25D2
	for <lists+linux-hams@lfdr.de>; Fri, 14 Apr 2023 16:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbjDNOeH (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 14 Apr 2023 10:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbjDNOeF (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 14 Apr 2023 10:34:05 -0400
Received: from aib29gb127.yyz1.oracleemaildelivery.com (aib29gb127.yyz1.oracleemaildelivery.com [192.29.72.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3499E12D
        for <linux-hams@vger.kernel.org>; Fri, 14 Apr 2023 07:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-2023;
 d=n8pjl.ca;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=eLMR8c+rUCn0e6s6vuSNWWr8ZkEgeN7CWTblMl8MyOA=;
 b=ooBfR03zCOKGJLuZfxkgeiYpv7RAvUijX1giAlvMOhR5ZM0Ra3zHS89fuXEe5cAinmFjYkSpuZuT
   56hNvk3hfIdcs3g6RjXh3Ch2DITpMdHyYB2CmlST3YsHCevV3GuF1A6HM3bUWxHKwJxN44KUKWti
   M7rkMh6927p5vD2E1wQXQZXpVLBP2tyxyYaUTBpOZtPELZSQTkFXEdkEZbHSquXNPAT7eOgzJsCi
   DOzelwm9fx2eK+svGMjuMtplffNd7aBDZtWXKSGwigYjR9x6Yxy99bnQYrE7S+cs0LlgwT8GBSx9
   BsPo8ODKXZ4zGSAwefmDwYDvFBTD+xnU0r7vNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-yyz-20200204;
 d=yyz1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=eLMR8c+rUCn0e6s6vuSNWWr8ZkEgeN7CWTblMl8MyOA=;
 b=BQLlT4fzvOBPeO0VpWXBl3FRX2kwoc9f2WwIK7ypY9NPgjP5SLNeIrWIzLe8fZ0EnZMUp5xva48l
   AjpcaoYJRMP36qaz4S6V0jPXVypKXJ69MXFbI6vVr+Ac19wHww+hOEEIjkf+jzXRy0jTzmGfbVt2
   t07xYxIcOpzYVqmGOmg+WIyJWnd7+LJZejYaYonVQNE7ZCOVfaSWFnsqyGHe/nNRKFGK+r+lksNJ
   jx85XqfLsm5FSIF3L9ln1p5mjloeWpY2t16adTrTd05/fkBKYzToRO8tiFjpmwmsfq7Wy7s1xzNk
   j5ZahltfB956FRjrJExnAPi7ltEqxIGs++Q/zw==
Received: by omta-ad1-fd3-102-ca-toronto-1.omtaad1.vcndpyyz.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230331 64bit (built Mar 31
 2023))
 with ESMTPS id <0RT400OAA0GOYA40@omta-ad1-fd3-102-ca-toronto-1.omtaad1.vcndpyyz.oraclevcn.com> for
 linux-hams@vger.kernel.org; Fri, 14 Apr 2023 14:34:00 +0000 (GMT)
From:   Peter Lafreniere <peter@n8pjl.ca>
To:     linux-hams@vger.kernel.org
Cc:     Peter Lafreniere <peter@n8pjl.ca>, netdev@vger.kernel.org,
        error27@gmail.com
Subject: [PATCH v2 net-next] ax25: exit linked-list searches earlier
Date:   Fri, 14 Apr 2023 10:33:57 -0400
Message-id: <20230414143357.5523-1-peter@n8pjl.ca>
X-Mailer: git-send-email 2.40.0
In-reply-to: <20230407142042.11901-1-peter@n8pjl.ca>
References: <20230407142042.11901-1-peter@n8pjl.ca>
MIME-version: 1.0
Content-transfer-encoding: 8bit
Reporting-Meta: AAFsDe+8ofwQ1Zn0uVsMZtkvVcwd4rpKucZbLzClchaK8gPCxQHrEcBRB8nN/85a
 Mta31AXmviIoCnY2WSJTnfc13cj/z1MKduzhIcGBemqlEz12iO6ijGBQSWdV/2V4
 RbMJ3Kge41ofFeWW8k7RkSyjKUCck3u0nzlwgDUo0r987w1h4G9zsna6mg2QyRv+
 KuW+GnBg/BcKWF9tQkTPFog8j/QklHcvrwBA6bkE5YrD52T9wL4hRcbF9ejqeW8j
 cSVWtF/urXaIDXFptmEVqLFr7ct1OhIP4E2Qeq4MAUcrbuLIt8YBL3umzcM1Jl3t
 pbM6LUWrEdyS5nP8WCDzFyoaXI/5HPIyjFDJYd/1rUIGqKlUkNhqCtId9RjPg2RN
 /YuZTXyhav0ulc0Z/IXPtySBZyKOXHzqLWpovHq2PZ5/wNwiYab9/L4sd21SazU=
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

There's no need to loop until the end of the list if we have a result.

Device callsigns are unique, so there can only be one dev returned from
ax25_addr_ax25dev(). If not, there would be inconsistencies based on
order of insertion, and refcount leaks.

We follow the same reasoning in ax25_get_route(), and additionally
reorder conditions to skip calling ax25cmp() whenever possible. 

Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
---
v1 -> v2
 - Make ax25_get_route() return directly
 - Reorder calls to ax25cmp() in ax25_get_route()
 - Skip searching for default route once found in ax25_get_route()

 net/ax25/ax25_dev.c   |  4 +++-
 net/ax25/ax25_route.c | 25 +++++++++++++------------
 2 files changed, 16 insertions(+), 13 deletions(-)

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
index b7c4d656a94b..ebef46c38e80 100644
--- a/net/ax25/ax25_route.c
+++ b/net/ax25/ax25_route.c
@@ -344,7 +344,6 @@ const struct seq_operations ax25_rt_seqops = {
  */
 ax25_route *ax25_get_route(ax25_address *addr, struct net_device *dev)
 {
-	ax25_route *ax25_spe_rt = NULL;
 	ax25_route *ax25_def_rt = NULL;
 	ax25_route *ax25_rt;
 
@@ -354,23 +353,25 @@ ax25_route *ax25_get_route(ax25_address *addr, struct net_device *dev)
 	 */
 	for (ax25_rt = ax25_route_list; ax25_rt != NULL; ax25_rt = ax25_rt->next) {
 		if (dev == NULL) {
-			if (ax25cmp(&ax25_rt->callsign, addr) == 0 && ax25_rt->dev != NULL)
-				ax25_spe_rt = ax25_rt;
-			if (ax25cmp(&ax25_rt->callsign, &null_ax25_address) == 0 && ax25_rt->dev != NULL)
+			if (ax25_rt->dev != NULL && ax25cmp(&ax25_rt->callsign, addr) == 0)
+				return ax25_rt;
+
+			if (ax25_def_rt != NULL &&
+			    ax25_rt->dev != NULL &&
+			    ax25cmp(&ax25_rt->callsign, &null_ax25_address) == 0)
 				ax25_def_rt = ax25_rt;
 		} else {
-			if (ax25cmp(&ax25_rt->callsign, addr) == 0 && ax25_rt->dev == dev)
-				ax25_spe_rt = ax25_rt;
-			if (ax25cmp(&ax25_rt->callsign, &null_ax25_address) == 0 && ax25_rt->dev == dev)
+			if (ax25_rt->dev == dev && ax25cmp(&ax25_rt->callsign, addr) == 0)
+				return ax25_rt;
+
+			if (ax25_def_rt != NULL &&
+			    ax25_rt->dev == dev &&
+			    ax25cmp(&ax25_rt->callsign, &null_ax25_address) == 0)
 				ax25_def_rt = ax25_rt;
 		}
 	}
 
-	ax25_rt = ax25_def_rt;
-	if (ax25_spe_rt != NULL)
-		ax25_rt = ax25_spe_rt;
-
-	return ax25_rt;
+	return ax25_def_rt;
 }
 
 /*
-- 
2.40.0

