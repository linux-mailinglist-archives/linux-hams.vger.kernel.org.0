Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 926703C5D95
	for <lists+linux-hams@lfdr.de>; Mon, 12 Jul 2021 15:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbhGLNsX (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 12 Jul 2021 09:48:23 -0400
Received: from relay.sw.ru ([185.231.240.75]:51754 "EHLO relay.sw.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233162AbhGLNsX (ORCPT <rfc822;linux-hams@vger.kernel.org>);
        Mon, 12 Jul 2021 09:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=virtuozzo.com; s=relay; h=Content-Type:MIME-Version:Date:Message-ID:Subject
        :From; bh=GlJZHo/qI9/fo4ysvGa0uUuc8YFxgMW0dn4u7fxaW1o=; b=Xo3cOUSUEXaRia8WZ2c
        bYUfUALuzICdTSlV3sU8xENPbwqUr5arV2ivLZ+f6Ox2FdNkw9tlwQuFkGo/qmyjt9io4VrOLkwmv
        CCcNP0kFf4ZDuaGbfRklvcVWS5WxFGwjytg5/OAylGFsgesGsVGs44qFxD9SaRfPh+3DcAMT/Dc=;
Received: from [10.93.0.56]
        by relay.sw.ru with esmtp (Exim 4.94.2)
        (envelope-from <vvs@virtuozzo.com>)
        id 1m2vxv-003iDv-1f; Mon, 12 Jul 2021 16:27:19 +0300
From:   Vasily Averin <vvs@virtuozzo.com>
Subject: [PATCH NET 6/7] ax25: use pskb_realloc_headroom
To:     "David S. Miller" <davem@davemloft.net>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <eric.dumazet@gmail.com>
Cc:     netdev@vger.kernel.org, Joerg Reuter <jreuter@yaina.de>,
        Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <74e90fba-df9f-5078-13de-41df54d2b257@virtuozzo.com>
 <cover.1626093470.git.vvs@virtuozzo.com>
Message-ID: <42f0c1f1-a40a-6137-aabd-5c01a5da9f41@virtuozzo.com>
Date:   Mon, 12 Jul 2021 16:27:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1626093470.git.vvs@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Use pskb_realloc_headroom() in ax25_transmit_buffer and ax25_rt_build_path.
Unlike skb_realloc_headroom, new helper pskb_realloc_headroom
does not allocate a new skb if possible.

Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
---
 net/ax25/ax25_out.c   | 13 ++++---------
 net/ax25/ax25_route.c | 13 ++++---------
 2 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/net/ax25/ax25_out.c b/net/ax25/ax25_out.c
index f53751b..1f1e581 100644
--- a/net/ax25/ax25_out.c
+++ b/net/ax25/ax25_out.c
@@ -336,18 +336,13 @@ void ax25_transmit_buffer(ax25_cb *ax25, struct sk_buff *skb, int type)
 
 	headroom = ax25_addr_size(ax25->digipeat);
 
-	if (skb_headroom(skb) < headroom) {
-		if ((skbn = skb_realloc_headroom(skb, headroom)) == NULL) {
+	if (unlikely(skb_headroom(skb) < headroom)) {
+		skb = pskb_realloc_head(roomskb, headroom);
+
+		if (!skb) {
 			printk(KERN_CRIT "AX.25: ax25_transmit_buffer - out of memory\n");
-			kfree_skb(skb);
 			return;
 		}
-
-		if (skb->sk != NULL)
-			skb_set_owner_w(skbn, skb->sk);
-
-		consume_skb(skb);
-		skb = skbn;
 	}
 
 	ptr = skb_push(skb, headroom);
diff --git a/net/ax25/ax25_route.c b/net/ax25/ax25_route.c
index b40e0bc..8f54547 100644
--- a/net/ax25/ax25_route.c
+++ b/net/ax25/ax25_route.c
@@ -447,18 +447,13 @@ struct sk_buff *ax25_rt_build_path(struct sk_buff *skb, ax25_address *src,
 
 	len = digi->ndigi * AX25_ADDR_LEN;
 
-	if (skb_headroom(skb) < len) {
-		if ((skbn = skb_realloc_headroom(skb, len)) == NULL) {
+	if (unlikely(skb_headroom(skb) < len)) {
+		skb = pskb_realloc_headroom(skb, len);
+
+		if (!skb) {
 			printk(KERN_CRIT "AX.25: ax25_dg_build_path - out of memory\n");
 			return NULL;
 		}
-
-		if (skb->sk != NULL)
-			skb_set_owner_w(skbn, skb->sk);
-
-		consume_skb(skb);
-
-		skb = skbn;
 	}
 
 	bp = skb_push(skb, len);
-- 
1.8.3.1

