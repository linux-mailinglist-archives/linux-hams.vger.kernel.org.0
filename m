Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA94578A577
	for <lists+linux-hams@lfdr.de>; Mon, 28 Aug 2023 08:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbjH1GAk (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 28 Aug 2023 02:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjH1GAZ (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 28 Aug 2023 02:00:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED60F115
        for <linux-hams@vger.kernel.org>; Sun, 27 Aug 2023 23:00:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8617661D61
        for <linux-hams@vger.kernel.org>; Mon, 28 Aug 2023 06:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9135C433CA;
        Mon, 28 Aug 2023 06:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693202422;
        bh=5KbFWcWekHL941V4FhYf9bpTanNDHKceogKpRkcxYEw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ADpbnU1aeyJE5JeFkYxpPBYlxFKJCobc+BcSX5uYzvVPZFuLakz029J1PhwyBJ52r
         Lw9ySXNBIvbpEqh8KeWgb395vpEJ6ep21ZxOdWj1O9OO4HSipy/aNKgg2RtZ5+zEA0
         n+a5L3DMlbGf3MBbQjirFj+0TmcgbI10LFqj282Ybd9Cee9Ed7vZmWBO5iwC26s3ds
         k2mfIY68QmIEIXizwCme6xDrt+WWDlvppJvHs+VgzfiEHo6zKpWG8QwehKNWXs236R
         Yn20PcakwXaFjOtNTcB5PUyLiSfikEulYHD4xQOcK3axUVyoMhCUyOKscmXygyz211
         KgelQYU/FpRWg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BBC93E33081;
        Mon, 28 Aug 2023 06:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 net] netrom: Deny concurrent connect().
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169320242276.13305.1320954627222633912.git-patchwork-notify@kernel.org>
Date:   Mon, 28 Aug 2023 06:00:22 +0000
References: <20230824165059.90977-1-kuniyu@amazon.com>
In-Reply-To: <20230824165059.90977-1-kuniyu@amazon.com>
To:     Kuniyuki Iwashima <kuniyu@amazon.com>
Cc:     ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, kuni1840@gmail.com,
        netdev@vger.kernel.org, linux-hams@vger.kernel.org,
        syzbot+666c97e4686410e79649@syzkaller.appspotmail.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 24 Aug 2023 09:50:59 -0700 you wrote:
> syzkaller reported null-ptr-deref [0] related to AF_NETROM.
> This is another self-accept issue from the strace log. [1]
> 
> syz-executor creates an AF_NETROM socket and calls connect(), which
> is blocked at that time.  Then, sk->sk_state is TCP_SYN_SENT and
> sock->state is SS_CONNECTING.
> 
> [...]

Here is the summary with links:
  - [v1,net] netrom: Deny concurrent connect().
    https://git.kernel.org/netdev/net/c/c2f8fd794960

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


