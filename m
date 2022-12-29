Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DEFE65907B
	for <lists+linux-hams@lfdr.de>; Thu, 29 Dec 2022 19:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbiL2Sht (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 29 Dec 2022 13:37:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbiL2Shj (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 29 Dec 2022 13:37:39 -0500
X-Greylist: delayed 1341 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 29 Dec 2022 10:37:37 PST
Received: from www11.qth.com (www11.qth.com [72.52.250.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF124207
        for <linux-hams@vger.kernel.org>; Thu, 29 Dec 2022 10:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
        s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=4X94lelONQ5G3ZpLBIKDVbfc6ej/uijug8GrWP9aylI=; b=Sovwmk9NbPnGlzjSamkCpJ/mu4
        KNHZX2CkbiHfyQCt6nT+EpAnPLS5yh8fDFl+k6tlFXzz+OICxfC3+VH1OGfepVkXg7LuthDzuXQKh
        vA/z9NFxl64X2omOjLuQ82kOyFKxIMnbaGhDWTXhVkziq/bUvsDEMa1dX/5rWv+d4C5k=;
Received: from [68.234.117.129] (port=59778 helo=merlin.lan)
        by www11.qth.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <n0nb@n0nb.us>)
        id 1pAxQw-006Qg2-Uu;
        Thu, 29 Dec 2022 12:15:15 -0600
Received: from [::1] (helo=merlin.lan)
        by merlin.lan with esmtp (Exim 4.94.2)
        (envelope-from <n0nb@n0nb.us>)
        id 1pAxQu-004Buk-Ta; Thu, 29 Dec 2022 12:15:13 -0600
From:   Nate Bargmann <n0nb@n0nb.us>
To:     Thomas Osterried <thomas@osterried.de>
Cc:     linux-hams@vger.kernel.org, Nate Bargmann <n0nb@n0nb.us>
Subject: [PATCH] ttyutils.c: Correct suspected typo in speed_struct
Date:   Thu, 29 Dec 2022 12:14:20 -0600
Message-Id: <20221229181420.998996-1-n0nb@n0nb.us>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - www11.qth.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - n0nb.us
X-Get-Message-Sender-Via: www11.qth.com: authenticated_id: n0nb@n0nb.us
X-Authenticated-Sender: www11.qth.com: n0nb@n0nb.us
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Looking over recent commits I noticed what looks to be a typo where
user_speed did not match termios_speed for the B3500000 declaration.

Signed-off-by: Nate Bargmann <n0nb@n0nb.us>
---
 ttyutils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ttyutils.c b/ttyutils.c
index 6ffd2fb..6bd6b56 100644
--- a/ttyutils.c
+++ b/ttyutils.c
@@ -61,7 +61,7 @@ static struct speed_struct {
 	{3000000,	B3000000},
 #endif
 #ifdef  B3500000
-	{1000000,	B3500000},
+	{3500000,	B3500000},
 #endif
 #ifdef  B4000000
 	{4000000,	B4000000},
-- 
2.34.1

