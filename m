Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83FE654AF10
	for <lists+linux-hams@lfdr.de>; Tue, 14 Jun 2022 13:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356304AbiFNLIK (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 14 Jun 2022 07:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356248AbiFNLIF (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 14 Jun 2022 07:08:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 26858CE22
        for <linux-hams@vger.kernel.org>; Tue, 14 Jun 2022 04:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655204870;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S+jzz+wDeocZkdWT7tXReyRdid3XzqDtpe0QKslAzBY=;
        b=KGK1afYYnCC1w7uhGmyn1G9A/7UZX7MYwHlO7q0MlLwnWsInMoZl01v5vYPJyHK1TYygGz
        AI8xQkcCRXA+qnUH3jGKqQk7LJSU+Pon0tp6d9sTXCxxjpiS5StEBunyvS7FuJi/oT17Ow
        nPqFUVPns1UBlYBoTEH0ka1vKuEDCOU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-_IomcQ4aM4qhYzVawL1r9w-1; Tue, 14 Jun 2022 07:07:49 -0400
X-MC-Unique: _IomcQ4aM4qhYzVawL1r9w-1
Received: by mail-qv1-f71.google.com with SMTP id da12-20020a05621408cc00b0046448be0e98so5693151qvb.9
        for <linux-hams@vger.kernel.org>; Tue, 14 Jun 2022 04:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=S+jzz+wDeocZkdWT7tXReyRdid3XzqDtpe0QKslAzBY=;
        b=73HcNvAd7CZxorMX5DsR7qsX3Jr2ZWIm37Rwyek0M2rfkGckhb1G34yvz56u+zkeOi
         qqjvARBuBR5fsPDjL2MIWpr03VQFu3NYWqeMqUQYK6/DhPX+OemkEv4oEeFKgxdTguXw
         /yFUCtiVCfAdTMFcF4YpbRZvaYin1zttG1xx369go8rVF3WZUpx/djkeeIHpmsKkA9hQ
         2x1W0ajKCAbZEBQ/Zicv8k/xpAfPYTyyRAkg8DPIE32HByqYJgTwOMhqWrxZYZfn0OnV
         k3aCHcVb7UoPEBnTC8NYsNZi3QHyhjV+8/TkyeJJmaIyyKuB+42mpjX+w2XQP7d5M5nI
         U1LA==
X-Gm-Message-State: AOAM530tDOqVSuBEfiZ2ASvp727aNkmUcr4P6Sh+1UV3XDHY4yuQYLzd
        2i5lz8b+x1YOGBeof3uaOJyj7NtuefUrpBFxk1XCCNOSxaUqniOdXVYcHpqpii7pdoB/fJDpc0L
        o2SbY0cE1+wOsYBFqyrWBLw==
X-Received: by 2002:a37:a9c4:0:b0:6a6:8992:e400 with SMTP id s187-20020a37a9c4000000b006a68992e400mr3353384qke.494.1655204868309;
        Tue, 14 Jun 2022 04:07:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybo4MZubVl4gIOyMPX9EdVJzxfjaFoJX+cr5NP+5WGtVTivuArBD9Imz+ZJP+u54u31vpiqQ==
X-Received: by 2002:a37:a9c4:0:b0:6a6:8992:e400 with SMTP id s187-20020a37a9c4000000b006a68992e400mr3353365qke.494.1655204867985;
        Tue, 14 Jun 2022 04:07:47 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-113-202.dyn.eolo.it. [146.241.113.202])
        by smtp.gmail.com with ESMTPSA id t4-20020a05622a01c400b00304ef50af9fsm7313181qtw.2.2022.06.14.04.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 04:07:47 -0700 (PDT)
Message-ID: <62319ec578f469ff2c39aa6559fd945ba937726c.camel@redhat.com>
Subject: Re: [PATCH] hamradio: 6pack: fix array-index-out-of-bounds in
 decode_std_command()
From:   Paolo Abeni <pabeni@redhat.com>
To:     Xu Jia <xujia39@huawei.com>, linux-hams@vger.kernel.org
Cc:     ajk@comnets.uni-bremen.de, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 14 Jun 2022 13:07:44 +0200
In-Reply-To: <1655112337-48005-1-git-send-email-xujia39@huawei.com>
References: <1655112337-48005-1-git-send-email-xujia39@huawei.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Mon, 2022-06-13 at 17:25 +0800, Xu Jia wrote:
> Hulk Robot reports incorrect sp->rx_count_cooked value in decode_std_command().
> This should be caused by the subtracting from sp->rx_count_cooked before.
> It seems that sp->rx_count_cooked value is changed to 0, which bypassed the
> previous judgment.
> sp->rx_count_cooked is a shared variable but is not protected by a lock.

It's not clear to me how multiple process could access it concurrently,
could you please elaborate more?

> The same applies to sp->rx_count. This patch adds a lock to fix the bug.
> 
> The fail log is shown below:
> =======================================================================
> UBSAN: array-index-out-of-bounds in drivers/net/hamradio/6pack.c:925:31
> index 400 is out of range for type 'unsigned char [400]'
> CPU: 3 PID: 7433 Comm: kworker/u10:1 Not tainted 5.18.0-rc5-00163-g4b97bac0756a #2
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
> Workqueue: events_unbound flush_to_ldisc
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0xcd/0x134
>  ubsan_epilogue+0xb/0x50
>  __ubsan_handle_out_of_bounds.cold+0x62/0x6c
>  sixpack_receive_buf+0xfda/0x1330
>  tty_ldisc_receive_buf+0x13e/0x180
>  tty_port_default_receive_buf+0x6d/0xa0
>  flush_to_ldisc+0x213/0x3f0
>  process_one_work+0x98f/0x1620
>  worker_thread+0x665/0x1080
>  kthread+0x2e9/0x3a0
>  ret_from_fork+0x1f/0x30
>  ...
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Xu Jia <xujia39@huawei.com>
> ---
>  drivers/net/hamradio/6pack.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
> index 45c3c4a..194f22f 100644
> --- a/drivers/net/hamradio/6pack.c
> +++ b/drivers/net/hamradio/6pack.c
> @@ -100,6 +100,8 @@ struct sixpack {
>  	unsigned int		rx_count;
>  	unsigned int		rx_count_cooked;
>  
> +	spinlock_t		rxlock;
> +
>  	int			mtu;		/* Our mtu (to spot changes!) */
>  	int			buffsize;       /* Max buffers sizes */
>  
> @@ -565,6 +567,7 @@ static int sixpack_open(struct tty_struct *tty)
>  	sp->dev = dev;
>  
>  	spin_lock_init(&sp->lock);
> +	spin_lock_init(&sp->rxlock);
>  	refcount_set(&sp->refcnt, 1);
>  	init_completion(&sp->dead);
>  
> @@ -913,6 +916,7 @@ static void decode_std_command(struct sixpack *sp, unsigned char cmd)
>  			sp->led_state = 0x60;
>  			/* fill trailing bytes with zeroes */
>  			sp->tty->ops->write(sp->tty, &sp->led_state, 1);
> +			spin_lock(&sp->rxlock);
>  			rest = sp->rx_count;
>  			if (rest != 0)
>  				 for (i = rest; i <= 3; i++)
> @@ -930,6 +934,7 @@ static void decode_std_command(struct sixpack *sp, unsigned char cmd)
>  				sp_bump(sp, 0);
>  			}
>  			sp->rx_count_cooked = 0;
> +			spin_unlock(&sp->rxlock);

It looks like 'sp->rx_count' and 'sp->rx_count_cooked' are touched also
in decode_data(). Do we need to protect such accesses, too?

Thanks!

Paolo

