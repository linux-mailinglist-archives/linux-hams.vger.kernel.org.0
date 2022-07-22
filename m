Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6D357E501
	for <lists+linux-hams@lfdr.de>; Fri, 22 Jul 2022 19:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235584AbiGVRF5 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 22 Jul 2022 13:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235570AbiGVRFy (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 22 Jul 2022 13:05:54 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B163D5B3
        for <linux-hams@vger.kernel.org>; Fri, 22 Jul 2022 10:05:47 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id c131so9033042ybf.9
        for <linux-hams@vger.kernel.org>; Fri, 22 Jul 2022 10:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aw2PaK01gLFUmg2cehol2FzcRVoOSHEH5YEZkfy6lqI=;
        b=jHvD23AgyIr8lOrwD83G+oMuXTrXNyLfcfoAdokDMgTU9L3AeRBxQ8SDFKu85ydP3y
         nn3qDbmovqF4KxCoZ32sZu8CSe85F2Bkrr/bqosnmjFgDNQbRv6IO2pMQxojFcZWVT7p
         XuKRoAVmjQKTc/YqY0jKU2NXgUlzrcSFIPR+HRaCa4+gWNuT4dm03sn2NdR72xKjFeJH
         Df+Xd+l5y05qJ2Q9bhJKHj3NwbcOzJPRfMm4Xd8WL4qmpHbWf0yvlkX4mjDFdFnDVS3t
         U12KIGDOj9+1hoAuQNB6kuU7FDKyQOZxYrK15Tng9gmlJEm7sSPJhXiYzPIoq7Pe3ynM
         D4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aw2PaK01gLFUmg2cehol2FzcRVoOSHEH5YEZkfy6lqI=;
        b=beGe1iClPoBb/+eh7yKv/6vnE2zsnDOAYTfNHKN4T9Flxwjqkl8hd6don9FiVcEnUf
         O9CcgtiXiP8xMNRorLXGrCPZL4KNBBWlluIfi7kHqwfPJdKX1/7gsy172nRSO4AFPD4t
         qzWw062NVVgSbjCba8zgsPFFXcIR5c6YrIwzB0jGgjqGlMJwhihU8w+ZyizRgTkGffCo
         NiRKhb183yftzyn5fvRl029HCP9EwZ48cLXX3f4IkceRtReU3MEQ4mw5f8mP81VUrcMC
         th8hNUy23FlkegahQ9cG0PaT36+TPzHam39X5dY5oJu6euCc1QsMvTSkZpsGoYZObzeR
         7C+w==
X-Gm-Message-State: AJIora/1pCw25WyRj/RNac1/rJEHciRIR4YZindmmQdTFkVxomqrtfY7
        g8FaLH09yyEkQ6MFT7j4H2EunQB6DQGFqtx0uogf9A==
X-Google-Smtp-Source: AGRyM1s+IzU1RE9tZU6+mgt8o78KCnZh7JSUj2eV3h9j4aBLZxrPLgvyPH3cIgD++7399WVLzKga+rkXkqPbCiX0ilw=
X-Received: by 2002:a25:2603:0:b0:66f:774d:e222 with SMTP id
 m3-20020a252603000000b0066f774de222mr779851ybm.407.1658509546561; Fri, 22 Jul
 2022 10:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220715154314.510ca2fb@kernel.org> <9c033c36-c291-1927-079b-b4aee5f7ac08@free.fr>
In-Reply-To: <9c033c36-c291-1927-079b-b4aee5f7ac08@free.fr>
From:   Eric Dumazet <edumazet@google.com>
Date:   Fri, 22 Jul 2022 19:05:34 +0200
Message-ID: <CANn89i+-THx+jTzsLDxaX9diV4hz7z4mYqwn2CjtydFp+U4gow@mail.gmail.com>
Subject: Re: [PATCH] net: rose: fix unregistered netdevice: waiting for rose0
 to become free
To:     Bernard f6bvp <f6bvp@free.fr>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        David Miller <davem@davemloft.net>,
        Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Ralf Baechle <ralf@linux-mips.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Fri, Jul 22, 2022 at 6:41 PM Bernard f6bvp <f6bvp@free.fr> wrote:
>
> Here is the context.
>
> This patch adds dev_put(dev) in order to allow removal of rose module
> after use of AX25 and ROSE via rose0 device.
>
> Otherwise when trying to remove rose module via rmmod rose an infinite
> loop message was displayed on all consoles with xx being a random number.
>
> unregistered_netdevice: waiting for rose0 to become free. Usage count = xx
>
> unregistered_netdevice: waiting for rose0 to become free. Usage count = xx
>
> ...
>
> With the patch it is ok to rmmod rose.
>
> This bug appeared with kernel 4.10 and has been only partially repaired
> by adding two dev_put(dev).
>
> Signed-off-by: Bernard Pidoux <f6bvp@free.fr>
>
> ---
>   net/rose/af_rose.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
> index bf2d986a6bc3..4163171ce3a6 100644
> --- a/net/rose/af_rose.c
> +++ b/net/rose/af_rose.c
> @@ -711,6 +711,8 @@ static int rose_bind(struct socket *sock, struct
> sockaddr *uaddr, int addr_len)
>       rose_insert_socket(sk);
>
>       sock_reset_flag(sk, SOCK_ZAPPED);
> +
> +    dev_put(dev);

But, we have at line 698 :

rose->device        = dev;

So we can not keep a pointer to a device without holding a reference on it.

As a bonus we could convert these dev_put() to new infra added with
CONFIG_NET_DEV_REFCNT_TRACKER=y



>
>       return 0;
>   }
> --
> 2.34.1
>
> [master da21d19e920d] [PATCH] net: rose: fix unregistered netdevice:
> waiting for rose0 to become free
>   Date: Mon Jul 18 16:23:54 2022 +0200
>   1 file changed, 2 insertions(+)
>
>
