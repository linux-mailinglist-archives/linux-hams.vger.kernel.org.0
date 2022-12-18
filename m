Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4005C6502E6
	for <lists+linux-hams@lfdr.de>; Sun, 18 Dec 2022 17:55:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbiLRQy7 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 18 Dec 2022 11:54:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232779AbiLRQx7 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 18 Dec 2022 11:53:59 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B73511809;
        Sun, 18 Dec 2022 08:19:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 047BBB80BA8;
        Sun, 18 Dec 2022 16:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCA7C433EF;
        Sun, 18 Dec 2022 16:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671380344;
        bh=j33FzNOjty8cwb7uB4R6TuLexzKBjCt16wxLrBMyoo8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WaLwhNTqSUeiORZeEN4mF6AIHlHRvNHx2WVnjShFVEeBUf/DpeOYC7NCUXoGbDzlb
         YMisU01bsUbQ6qVpFTtIrx9c+OHnM9b1IyRlgFF47LnKqa/fAKIN0NynfhaHrGbQyG
         amcD53k8dE3PSMopkjU1GKQzS+MhlPY67YhXKPlOlxHWe9ottegcfKD6ya+nl/fjo5
         zPlePqYe7qNiBALYXttUw+uc6Bt5vnlajJwyEExOwgfCpEZPw44dppPZLovP5Z9ji9
         KU7LNjg312f4bp3khoYFRJSYRzUnY83F04eppLjMyUJVLUs8WLvci3Nspz1rfWncQx
         cEYdzRqHha5Jw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Sasha Levin <sashal@kernel.org>, t.sailer@alumni.ethz.ch,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        ndesaulniers@google.com, linux-hams@vger.kernel.org,
        netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 5.4 09/30] hamradio: baycom_epp: Fix return type of baycom_send_packet()
Date:   Sun, 18 Dec 2022 11:18:14 -0500
Message-Id: <20221218161836.933697-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218161836.933697-1-sashal@kernel.org>
References: <20221218161836.933697-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit c5733e5b15d91ab679646ec3149e192996a27d5d ]

With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
indirect call targets are validated against the expected function
pointer prototype to make sure the call target is valid to help mitigate
ROP attacks. If they are not identical, there is a failure at run time,
which manifests as either a kernel panic or thread getting killed. A
proposed warning in clang aims to catch these at compile time, which
reveals:

  drivers/net/hamradio/baycom_epp.c:1119:25: error: incompatible function pointer types initializing 'netdev_tx_t (*)(struct sk_buff *, struct net_device *)' (aka 'enum netdev_tx (*)(struct sk_buff *, struct net_device *)') with an expression of type 'int (struct sk_buff *, struct net_device *)' [-Werror,-Wincompatible-function-pointer-types-strict]
          .ndo_start_xmit      = baycom_send_packet,
                                ^~~~~~~~~~~~~~~~~~
  1 error generated.

->ndo_start_xmit() in 'struct net_device_ops' expects a return type of
'netdev_tx_t', not 'int'. Adjust the return type of baycom_send_packet()
to match the prototype's to resolve the warning and CFI failure.

Link: https://github.com/ClangBuiltLinux/linux/issues/1750
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20221102160610.1186145-1-nathan@kernel.org
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/hamradio/baycom_epp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/baycom_epp.c
index 4476491b58f9..c5495ca5e8e6 100644
--- a/drivers/net/hamradio/baycom_epp.c
+++ b/drivers/net/hamradio/baycom_epp.c
@@ -758,7 +758,7 @@ static void epp_bh(struct work_struct *work)
  * ===================== network driver interface =========================
  */
 
-static int baycom_send_packet(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t baycom_send_packet(struct sk_buff *skb, struct net_device *dev)
 {
 	struct baycom_state *bc = netdev_priv(dev);
 
-- 
2.35.1

