Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B142415720
	for <lists+linux-hams@lfdr.de>; Thu, 23 Sep 2021 05:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239742AbhIWDqY (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 22 Sep 2021 23:46:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:42840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239121AbhIWDoX (ORCPT <rfc822;linux-hams@vger.kernel.org>);
        Wed, 22 Sep 2021 23:44:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D51D61351;
        Thu, 23 Sep 2021 03:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632368473;
        bh=ONy0p7K1fq/PCXqFWvlgOQhN7H6SddN8Gi+y6Bv8hu8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hIJoq11dmzPpHRZwQSMOgx244SlygmeTcpwty+xnCbvko568O7MGt0rFBwbDcnkeA
         2PDSMpQ29AuUaKQNAElftIb3ICdrNn6btcYS6L6mJmjj8kGFZ5fdl/lUy5oZ42PW42
         r4eO00zneqmn9uDz7zzcoI72V6sZpRdYRxNmCbou8cid8iBjyl9FaVY5vwWL3ASzSk
         4TCZH9l0NQ5OQqFK/ZOMeoniEp/LZrAjy2B1FAMVqxgtbQwr7FmMwoiPgXWfSClq03
         5iwPyHJUkr0EMG9edQ+L6/7PSd7AVTVFRmCiYDhYy8fgH2O7QVhGh5+v35ea/Ld5u4
         3sHSaeq0+sj4Q==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Sasha Levin <sashal@kernel.org>, ajk@comnets.uni-bremen.de,
        davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 09/10] net: 6pack: Fix tx timeout and slot time
Date:   Wed, 22 Sep 2021 23:40:52 -0400
Message-Id: <20210923034055.1422059-9-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210923034055.1422059-1-sashal@kernel.org>
References: <20210923034055.1422059-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

From: Guenter Roeck <linux@roeck-us.net>

[ Upstream commit 3c0d2a46c0141913dc6fd126c57d0615677d946e ]

tx timeout and slot time are currently specified in units of HZ.  On
Alpha, HZ is defined as 1024.  When building alpha:allmodconfig, this
results in the following error message.

  drivers/net/hamradio/6pack.c: In function 'sixpack_open':
  drivers/net/hamradio/6pack.c:71:41: error:
  	unsigned conversion from 'int' to 'unsigned char'
  	changes value from '256' to '0'

In the 6PACK protocol, tx timeout is specified in units of 10 ms and
transmitted over the wire:

    https://www.linux-ax25.org/wiki/6PACK

Defining a value dependent on HZ doesn't really make sense, and
presumably comes from the (very historical) situation where HZ was
originally 100.

Note that the SIXP_SLOTTIME use explicitly is about 10ms granularity:

        mod_timer(&sp->tx_t, jiffies + ((when + 1) * HZ) / 100);

and the SIXP_TXDELAY walue is sent as a byte over the wire.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/hamradio/6pack.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index cce901add654..908de9e45394 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -68,9 +68,9 @@
 #define SIXP_DAMA_OFF		0
 
 /* default level 2 parameters */
-#define SIXP_TXDELAY			(HZ/4)	/* in 1 s */
+#define SIXP_TXDELAY			25	/* 250 ms */
 #define SIXP_PERSIST			50	/* in 256ths */
-#define SIXP_SLOTTIME			(HZ/10)	/* in 1 s */
+#define SIXP_SLOTTIME			10	/* 100 ms */
 #define SIXP_INIT_RESYNC_TIMEOUT	(3*HZ/2) /* in 1 s */
 #define SIXP_RESYNC_TIMEOUT		5*HZ	/* in 1 s */
 
-- 
2.30.2

