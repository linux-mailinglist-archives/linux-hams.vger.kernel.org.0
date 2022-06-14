Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2B3754B3D4
	for <lists+linux-hams@lfdr.de>; Tue, 14 Jun 2022 16:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233966AbiFNOrw (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 14 Jun 2022 10:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245165AbiFNOrs (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 14 Jun 2022 10:47:48 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA183DEFC
        for <linux-hams@vger.kernel.org>; Tue, 14 Jun 2022 07:47:46 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id u99so15519464ybi.11
        for <linux-hams@vger.kernel.org>; Tue, 14 Jun 2022 07:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YLoEie2c/c/Ol9tysPQeNCKttCEvsMGw+mU2Obntq+I=;
        b=eBGQsLMh3CZ6FqJwnBFrzfGDavEOm688kp752Oibj0m1wZbvntM/y7LvwxQ+XvgBT1
         6AQ47zMh8QVRxtV5GKUVdWYaeNrxMtBlbNrHYUwezxM3DAyGeGVVbTJ7hl0oDVOTE+x3
         +vhoFWBwhiydkB9pNsedV4Nk7zQrnixB8oi/nJmYZw7Qx/YXiA9tJt0TgnLuHZYQ052D
         4lzal9ExBk/lDfPmbU1UdB6f9KmwQ8U5KORqGRhizv7djmQAu7SZZCQC3FzPqiWp8vhC
         w5bcf+d0gJfcjx8BLhdM51tta8rIgyO1wACXvJZQ+z69Hrug+C7DY8AO2l4lfCkW5k2M
         1AbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YLoEie2c/c/Ol9tysPQeNCKttCEvsMGw+mU2Obntq+I=;
        b=gWjzwyil1GaUrejifZCo/RWYd2oSrV+vlu05aIZtU+C3rg9ybyeRO+zCNAKL446qQY
         SMZ2i2fUQZhavtV/RQe4MGGsSKy7Jo0noZRwqdjGyPS53LxeAGqTX8Hjv1E3l8o0Hglk
         MvmY6oZXyn8Y5HgaUvqUyzJTbAlwyTOIeczZQzDxx6pt6BRm67a5Gxoc1iw/OcNc0Fdg
         o+A0wkM3ibUgZvq8jLen2+n+KmFgi1cNk11h8y+pokU84FGd0Pm1S56ZFnltkm14CpvI
         0pBD2KEBSNy90mUY+EgCBYYNfZ/CWtjqW3Y2DkljOnZeqTKEaF+UWc0NSwLRI9OLyoy6
         CzwA==
X-Gm-Message-State: AJIora+UazJQ/aFORR4u9YE47RZTmGKB6kvkz2S3lwP8MO11y/3YF8ez
        7Kj3aVT8hjT7ADO8nI5zwWXphcRHX0XUZrICOy5Uug==
X-Google-Smtp-Source: AGRyM1sSzc8PAtG9d6TjbL0w1QSij+xNRacDCewMIiQvCjFO7j4r30F8OPL701ZSIMbtaW+NEn3EW+N6JAdO2YbwWB4=
X-Received: by 2002:a25:d649:0:b0:65c:9e37:8bb3 with SMTP id
 n70-20020a25d649000000b0065c9e378bb3mr5499677ybg.387.1655218065801; Tue, 14
 Jun 2022 07:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220614092557.6713-1-duoming@zju.edu.cn>
In-Reply-To: <20220614092557.6713-1-duoming@zju.edu.cn>
From:   Eric Dumazet <edumazet@google.com>
Date:   Tue, 14 Jun 2022 07:47:34 -0700
Message-ID: <CANn89iJEc4h2MrQewuK_2fjW5ibu3Y56LbnwbM7hKOEUUrNuHg@mail.gmail.com>
Subject: Re: [PATCH net v5] net: ax25: Fix deadlock caused by
 skb_recv_datagram in ax25_recvmsg
To:     Duoming Zhou <duoming@zju.edu.cn>
Cc:     linux-hams@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        jreuter@yaina.de, Ralf Baechle <ralf@linux-mips.org>,
        David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, thomas@osterried.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Tue, Jun 14, 2022 at 2:26 AM Duoming Zhou <duoming@zju.edu.cn> wrote:
>
> The skb_recv_datagram() in ax25_recvmsg() will hold lock_sock
> and block until it receives a packet from the remote. If the client
> doesn`t connect to server and calls read() directly, it will not
> receive any packets forever. As a result, the deadlock will happen.
>
> The fail log caused by deadlock is shown below:
>
> This patch replaces skb_recv_datagram() with an open-coded variant of it
> releasing the socket lock before the __skb_wait_for_more_packets() call
> and re-acquiring it after such call in order that other functions that
> need socket lock could be executed.
>
> what's more, the socket lock will be released only when recvmsg() will
> block and that should produce nicer overall behavior.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Suggested-by: Thomas Osterried <thomas@osterried.de>
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> Reported-by: Thomas Habets <thomas@@habets.se>
> Acked-by: Paolo Abeni <pabeni@redhat.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>
