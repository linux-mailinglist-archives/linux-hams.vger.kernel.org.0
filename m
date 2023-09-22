Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE5A47AA9F7
	for <lists+linux-hams@lfdr.de>; Fri, 22 Sep 2023 09:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbjIVHUa (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 22 Sep 2023 03:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjIVHU3 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 22 Sep 2023 03:20:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF7ECA
        for <linux-hams@vger.kernel.org>; Fri, 22 Sep 2023 00:20:23 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B046C433D9;
        Fri, 22 Sep 2023 07:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695367223;
        bh=BHybtxwY47uYYHFXoDtvlNNeebGa5opZ5WlHJz0v3Rs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=mbSkkHZ8pd3qzc8pjpZc3Dku6xjLGdQvXmjxPtw65nHH1CkUnGvVs6oot1KwI/nUW
         y2XX7Kl8QJCDvQAxrwW+27XENXRokAkjFfUAEHTzwZfW2xOifE8wnFpz1lG70aiMdl
         d7NT/IRvfw9i7P8/qxZHTKQGHu+rr1vswU8LkBjxDRIL2NntQSv+JSHSnQPDkIYVwv
         aq+JORGici5TpbU/WQM/36C4tAWvsOq8L1a6SSSpxvmNfyK9mOFCfOYb83b5mTA2oO
         T0UItb3g4J4LGIaEqHVLl/eNsuOQ2BKE4mnxXK/o+y2OgRIfRA2Lnb+r0tlBAOBWj+
         mdxIERzIFYRSA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 194A0C04DD9;
        Fri, 22 Sep 2023 07:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] hamradio: baycom: remove useless link in Kconfig
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169536722310.5471.3731844839478615297.git-patchwork-notify@kernel.org>
Date:   Fri, 22 Sep 2023 07:20:23 +0000
References: <20230919141417.39702-1-peter@n8pjl.ca>
In-Reply-To: <20230919141417.39702-1-peter@n8pjl.ca>
To:     Peter Lafreniere <peter@n8pjl.ca>
Cc:     linux-hams@vger.kernel.org, netdev@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue, 19 Sep 2023 14:14:23 +0000 you wrote:
> The Kconfig help text for baycom drivers suggests that more information
> on the hardware can be found at <https://www.baycom.de>. The website now
> includes no information on their ham radio products other than a mention
> that they were once produced by the company, saying:
> "The amateur radio equipment is now no longer part and business of BayCom GmbH"
> 
> As there is no information relavent to the baycom driver on the site,
> remove the link.
> 
> [...]

Here is the summary with links:
  - hamradio: baycom: remove useless link in Kconfig
    https://git.kernel.org/netdev/net-next/c/84c19e655b29

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


