Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1703E561EF5
	for <lists+linux-hams@lfdr.de>; Thu, 30 Jun 2022 17:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235681AbiF3PRh (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 30 Jun 2022 11:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235348AbiF3PRY (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 30 Jun 2022 11:17:24 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B1533360
        for <linux-hams@vger.kernel.org>; Thu, 30 Jun 2022 08:17:22 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id h85so19454581iof.4
        for <linux-hams@vger.kernel.org>; Thu, 30 Jun 2022 08:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UjN5WCjSlW6XRDQEx4W7qChY8LG6Krf9efhMPYxn9eQ=;
        b=eMdf6L5d1qhr4EE1eKwxr+AUepysYtXrnVQSqPA2ePr2jp+PQbvPDwBkSfkngH+Avn
         dyHEvEY45qIrBSbgOGvFlMsg1L4wAwXEYj5gqdYod50dkcKWRLXEY5z0YYrcq/JrRzEk
         E9+3sPWB6c2BoYQy54Lur6hM+P2daS0eZrGkucK1wi0v0u0Vc3PnJJ7ucY/KWticVw9N
         paUYCaRr4ZYyx8XwPDPqM5xXPAA0blgvL+6j14xRdx12969O2RCXoJvE0yPywp0GbW9F
         0zTpSkwYozh+IrzRf0+bIKYiFzUb6ryrJkL4twuCNl04PBw5AnU3c3nt+nVk92M2XLyq
         5uvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UjN5WCjSlW6XRDQEx4W7qChY8LG6Krf9efhMPYxn9eQ=;
        b=v3ckb63+In2XH2Tdgy58wsedOzGy510rTMroQTjtUTgsQ6008m/QYck/g8MyU+JE9I
         vY5i503pM2oGtGy9nkUH39qEbWTkLKj9g9Vz9nhcWEXtza6sHZmkEKHfTmJCnS/ztL35
         7Nd9Sp6gZf4KoncyuAzUpW+xzdEQVuUcWnsx+xpfKtyi+BRORTJ2z6BNY7qBPhT/SBOy
         IRYRew4c79f7Hrr0pEkmryH9Ssy3LdA3ljTtxKIXyVuOgoS0MeDvIE1L1z9iWeS0mTUc
         JY2xPP3yJVkC5KjOmPulviAqDrXlm3e7dAKfXg9pM/0OAR5dPPgM32QhQJJxCk9/hlOa
         7JMg==
X-Gm-Message-State: AJIora89kQq3ZpHR0Pr3fp4BxSLYjbursDoQn6UbOlcLm7Fc2AEqQTN+
        Zrplgs9LG6NwNtjT6ur3+9EvwO4j97xMbXoxz/kTOw==
X-Google-Smtp-Source: AGRyM1vBsHcJbR792fbcQ3MyyuZqf98Ww3QYisAjl7/NLnET0H9WzRM7dmoSeFfyXdH7BvgEDdpJy73v9t/EFjRepms=
X-Received: by 2002:a05:6638:388e:b0:33c:b603:516 with SMTP id
 b14-20020a056638388e00b0033cb6030516mr5654843jav.133.1656602242135; Thu, 30
 Jun 2022 08:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220630143842.24906-1-duoming@zju.edu.cn> <CANn89iLda2oxoPQaGd9r8frAaOu1LqxmWYm2O8W4HXaGRN8tcQ@mail.gmail.com>
 <bed69ee.1e8d9.181b528391c.Coremail.duoming@zju.edu.cn>
In-Reply-To: <bed69ee.1e8d9.181b528391c.Coremail.duoming@zju.edu.cn>
From:   Eric Dumazet <edumazet@google.com>
Date:   Thu, 30 Jun 2022 17:17:10 +0200
Message-ID: <CANn89iKo-uuF-iQWrfL=pgMu7bEakWHPDAVuLvT-TZ4AujiD=w@mail.gmail.com>
Subject: Re: [PATCH net] net: rose: fix UAF bug caused by rose_t0timer_expiry
To:     Duoming Zhou <duoming@zju.edu.cn>
Cc:     linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        David Miller <davem@davemloft.net>,
        Ralf Baechle <ralf@linux-mips.org>
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

On Thu, Jun 30, 2022 at 5:08 PM <duoming@zju.edu.cn> wrote:
>
> Hello,
>
> On Thu, 30 Jun 2022 16:44:29 +0200 Eric Dumazet wrote:
>
> > > There are UAF bugs caused by rose_t0timer_expiry(). The
> > > root cause is that del_timer() could not stop the timer
> > > handler that is running and there is no synchronization.
> > > One of the race conditions is shown below:
> > >
> > >     (thread 1)             |        (thread 2)
> > >                            | rose_device_event
> > >                            |   rose_rt_device_down
> > >                            |     rose_remove_neigh
> > > rose_t0timer_expiry        |       rose_stop_t0timer(rose_neigh)
> > >   ...                      |         del_timer(&neigh->t0timer)
> > >                            |         kfree(rose_neigh) //[1]FREE
> > >   neigh->dce_mode //[2]USE |
> > >
> > > The rose_neigh is deallocated in position [1] and use in
> > > position [2].
> > >
> > > The crash trace triggered by POC is like below:
> > >
> > > BUG: KASAN: use-after-free in expire_timers+0x144/0x320
> > > Write of size 8 at addr ffff888009b19658 by task swapper/0/0
> > > ...
> > > Call Trace:
> > >  <IRQ>
> > >  dump_stack_lvl+0xbf/0xee
> > >  print_address_description+0x7b/0x440
> > >  print_report+0x101/0x230
> > >  ? expire_timers+0x144/0x320
> > >  kasan_report+0xed/0x120
> > >  ? expire_timers+0x144/0x320
> > >  expire_timers+0x144/0x320
> > >  __run_timers+0x3ff/0x4d0
> > >  run_timer_softirq+0x41/0x80
> > >  __do_softirq+0x233/0x544
> > >  ...
> > >
> > > This patch changes del_timer() in rose_stop_t0timer() and
> > > rose_stop_ftimer() to del_timer_sync() in order that the
> > > timer handler could be finished before the resources such as
> > > rose_neigh and so on are deallocated. As a result, the UAF
> > > bugs could be mitigated.
> > >
> > > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > > Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> > > ---
> > >  net/rose/rose_link.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> > > index 8b96a56d3a4..9734d1264de 100644
> > > --- a/net/rose/rose_link.c
> > > +++ b/net/rose/rose_link.c
> > > @@ -54,12 +54,12 @@ static void rose_start_t0timer(struct rose_neigh *neigh)
> > >
> > >  void rose_stop_ftimer(struct rose_neigh *neigh)
> > >  {
> > > -       del_timer(&neigh->ftimer);
> > > +       del_timer_sync(&neigh->ftimer);
> > >  }
> >
> > Are you sure this is safe ?
> >
> > del_timer_sync() could hang if the caller holds a lock that the timer
> > function would need to acquire.
>
> I think this is safe. The rose_ftimer_expiry() is an empty function that is
> shown below:
>
> static void rose_ftimer_expiry(struct timer_list *t)
> {
> }
>
> > >
> > >  void rose_stop_t0timer(struct rose_neigh *neigh)
> > >  {
> > > -       del_timer(&neigh->t0timer);
> > > +       del_timer_sync(&neigh->t0timer);
> > >  }
> >
> > Same here, please explain why it is safe.
>
> The rose_stop_t0timer() may hold "rose_node_list_lock" and "rose_neigh_list_lock",
> but the timer handler rose_t0timer_expiry() that is shown below does not need
> these two locks.
>
> static void rose_t0timer_expiry(struct timer_list *t)
> {
>         struct rose_neigh *neigh = from_timer(neigh, t, t0timer);
>
>         rose_transmit_restart_request(neigh);
>
>         neigh->dce_mode = 0;
>
>         rose_start_t0timer(neigh);

This will rearm the timer.  del_timer_sync() will not help.

Please read the comment in front of del_timer_sync(), in kernel/time/timer.c

> }
>
> Best regards,
> Duoming Zhou
