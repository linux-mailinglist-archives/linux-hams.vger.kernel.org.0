Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02F7A53A04E
	for <lists+linux-hams@lfdr.de>; Wed,  1 Jun 2022 11:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350243AbiFAJ1w (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 1 Jun 2022 05:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350221AbiFAJ1v (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 1 Jun 2022 05:27:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 88A9A1FCEF
        for <linux-hams@vger.kernel.org>; Wed,  1 Jun 2022 02:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654075667;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2FyH8lXYLGF3MpXKp21Y2koOxGdNAE7vo1QNwOmCf2g=;
        b=Y78Ebgh4TDfLcamAoWu2qfDOtz2K7inidp8HxWSRjKW8nMML27S83XdnAMsB88IJVK2YZh
        ps4BeS6M77hzsxFJlVJX+zUHyUeYPYLy3vTB2MmNAZ+2sOeigi1HY65sor/7S7VYeLeA8t
        CuLG/lNhwsmpcAvsUYi0x4p5kH2e+uU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-v2n0ToyeNziIlP6n0RAQwQ-1; Wed, 01 Jun 2022 05:27:45 -0400
X-MC-Unique: v2n0ToyeNziIlP6n0RAQwQ-1
Received: by mail-wm1-f70.google.com with SMTP id k7-20020a05600c1c8700b003974d762928so638812wms.7
        for <linux-hams@vger.kernel.org>; Wed, 01 Jun 2022 02:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2FyH8lXYLGF3MpXKp21Y2koOxGdNAE7vo1QNwOmCf2g=;
        b=Qnrl3dz94Cp4cAeZWqzZ7aybkOKQdwi4pVgkVMvv/lwULZ92yL1w19jMvU9v2Ukuqa
         VR4EJrMpQm+J9zCn2g+LJ5xrXL2TvD080yntgC+G4xLzgWH1PoI70zd8c/PYU2w+iELQ
         STQ+k1UHdFD1m/hdfv7IEOnMwqlVRaIf4PL0en4zlNMDedn4xrGLFYQMYBCgVw7EX/Od
         vp3tKFei6xihOQYMcwL9OW3abG6vmGGQISQm7xVCjJnthJ1IW8/xhO8yC1CuwV1pYLRG
         KRiG8H9WtZLnHLLgl0LT3GakFwiwy7hi1NkGOvhcEVX1Px81zQqrQyatsJUQsjPWNp8s
         0ugQ==
X-Gm-Message-State: AOAM531WkFzT59F9JX6+1FOKbznv59NMzqnUuPNM5MHZLOGvN8qJMu8A
        griDnpwcEXtJ6/Oo3s1Gtj3VAtOfMHuanfBFtBzhuKOsOfeY2ueDq6ikPxHt5PnUupN+vlAxTyA
        zRFx5TCuIKHzTaKvCPvpwfw==
X-Received: by 2002:a7b:ca59:0:b0:397:8c63:4bd2 with SMTP id m25-20020a7bca59000000b003978c634bd2mr23278495wml.76.1654075664499;
        Wed, 01 Jun 2022 02:27:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxT0g1Ab4X08yRtshka7xZqzxRxrNeP8Ie7Zbg4eA3kWjY549uN9KZWrdUtL9IMo9F3GnmC5A==
X-Received: by 2002:a7b:ca59:0:b0:397:8c63:4bd2 with SMTP id m25-20020a7bca59000000b003978c634bd2mr23278457wml.76.1654075664194;
        Wed, 01 Jun 2022 02:27:44 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-112-184.dyn.eolo.it. [146.241.112.184])
        by smtp.gmail.com with ESMTPSA id q15-20020adff50f000000b002102e6b757csm1213568wro.90.2022.06.01.02.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 02:27:43 -0700 (PDT)
Message-ID: <73d2f3a52773d418405efc1c4987294fb60c5ac1.camel@redhat.com>
Subject: Re: [PATCH net v5] ax25: Fix ax25 session cleanup problems
From:   Paolo Abeni <pabeni@redhat.com>
To:     Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org
Cc:     jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, thomas@osterried.de
Date:   Wed, 01 Jun 2022 11:27:42 +0200
In-Reply-To: <20220530152158.108619-1-duoming@zju.edu.cn>
References: <20220530152158.108619-1-duoming@zju.edu.cn>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Mon, 2022-05-30 at 23:21 +0800, Duoming Zhou wrote:
> There are session cleanup problems in ax25_release() and
> ax25_disconnect(). If we setup a session and then disconnect,
> the disconnected session is still in "LISTENING" state that
> is shown below.
> 
> Active AX.25 sockets
> Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
> DL9SAU-4   DL9SAU-3   ???     LISTENING    000/000  0       0
> DL9SAU-3   DL9SAU-4   ???     LISTENING    000/000  0       0
> 
> The first reason is caused by del_timer_sync() in ax25_release().
> The timers of ax25 are used for correct session cleanup. If we use
> ax25_release() to close ax25 sessions and ax25_dev is not null,
> the del_timer_sync() functions in ax25_release() will execute.
> As a result, the sessions could not be cleaned up correctly,
> because the timers have stopped.
> 
> In order to solve this problem, this patch adds a device_up flag
> in ax25_dev in order to judge whether the device is up. If there
> are sessions to be cleaned up, the del_timer_sync() in
> ax25_release() will not execute. What's more, we add ax25_cb_del()
> in ax25_kill_by_device(), because the timers have been stopped
> and there are no functions that could delete ax25_cb if we do not
> call ax25_release(). Finally, we reorder the position of
> ax25_list_lock in ax25_cb_del() in order to synchronize among
> different functions that call ax25_cb_del().
> 
> The second reason is caused by improper check in ax25_disconnect().
> The incoming ax25 sessions which ax25->sk is null will close
> heartbeat timer, because the check "if(!ax25->sk || ..)" is
> satisfied. As a result, the session could not be cleaned up properly.
> 
> In order to solve this problem, this patch changes the improper
> check to "if(ax25->sk && ..)" in ax25_disconnect().
> 
> What`s more, the ax25_disconnect() may be called twice, which is
> not necessary. For example, ax25_kill_by_device() calls
> ax25_disconnect() and sets ax25->state to AX25_STATE_0, but
> ax25_release() calls ax25_disconnect() again.
> 
> In order to solve this problem, this patch add a check in
> ax25_release(). If the flag of ax25->sk equals to SOCK_DEAD,
> the ax25_disconnect() in ax25_release() should not be executed.
> 
> Fixes: 82e31755e55f ("ax25: Fix UAF bugs in ax25 timers")
> Fixes: 8a367e74c012 ("ax25: Fix segfault after sock connection timeout")
> Reported-and-tested-by: Thomas Osterried <thomas@osterried.de>
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
> Changes since v1:
>   - Add ax25_cb_del() in ax25_kill_by_device().
>   - Mitigate race conditions through lock.
>   - Fix session cleanup problem in ax25_disconnect().
>   - Fix ax25_disconnect() may be called twice problem.
>   - Change check in ax25_disconnect() to "if(ax25->sk && ..)".
> 
>  include/net/ax25.h   |  1 +
>  net/ax25/af_ax25.c   | 27 +++++++++++++++++----------
>  net/ax25/ax25_dev.c  |  1 +
>  net/ax25/ax25_subr.c |  2 +-
>  4 files changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/include/net/ax25.h b/include/net/ax25.h
> index 0f9790c455b..a427a05672e 100644
> --- a/include/net/ax25.h
> +++ b/include/net/ax25.h
> @@ -228,6 +228,7 @@ typedef struct ax25_dev {
>  	ax25_dama_info		dama;
>  #endif
>  	refcount_t		refcount;
> +	bool device_up;
>  } ax25_dev;
>  
>  typedef struct ax25_cb {
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index 363d47f9453..289f355e185 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -62,12 +62,12 @@ static void ax25_free_sock(struct sock *sk)
>   */
>  static void ax25_cb_del(ax25_cb *ax25)
>  {
> +	spin_lock_bh(&ax25_list_lock);
>  	if (!hlist_unhashed(&ax25->ax25_node)) {
> -		spin_lock_bh(&ax25_list_lock);
>  		hlist_del_init(&ax25->ax25_node);
> -		spin_unlock_bh(&ax25_list_lock);
>  		ax25_cb_put(ax25);
>  	}
> +	spin_unlock_bh(&ax25_list_lock);
>  }
>  
>  /*
> @@ -81,6 +81,7 @@ static void ax25_kill_by_device(struct net_device *dev)
>  
>  	if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
>  		return;
> +	ax25_dev->device_up = false;
>  
>  	spin_lock_bh(&ax25_list_lock);
>  again:
> @@ -91,6 +92,7 @@ static void ax25_kill_by_device(struct net_device *dev)
>  				spin_unlock_bh(&ax25_list_lock);
>  				ax25_disconnect(s, ENETUNREACH);
>  				s->ax25_dev = NULL;
> +				ax25_cb_del(s);
>  				spin_lock_bh(&ax25_list_lock);
>  				goto again;
>  			}
> @@ -103,6 +105,7 @@ static void ax25_kill_by_device(struct net_device *dev)
>  				dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
>  				ax25_dev_put(ax25_dev);
>  			}
> +			ax25_cb_del(s);
>  			release_sock(sk);
>  			spin_lock_bh(&ax25_list_lock);
>  			sock_put(sk);
> @@ -995,9 +998,11 @@ static int ax25_release(struct socket *sock)
>  	if (sk->sk_type == SOCK_SEQPACKET) {
>  		switch (ax25->state) {
>  		case AX25_STATE_0:
> -			release_sock(sk);
> -			ax25_disconnect(ax25, 0);
> -			lock_sock(sk);
> +			if (!sock_flag(ax25->sk, SOCK_DEAD)) {
> +				release_sock(sk);
> +				ax25_disconnect(ax25, 0);
> +				lock_sock(sk);
> +			}
>  			ax25_destroy_socket(ax25);
>  			break;
>  
> @@ -1053,11 +1058,13 @@ static int ax25_release(struct socket *sock)
>  		ax25_destroy_socket(ax25);
>  	}
>  	if (ax25_dev) {
> -		del_timer_sync(&ax25->timer);
> -		del_timer_sync(&ax25->t1timer);
> -		del_timer_sync(&ax25->t2timer);
> -		del_timer_sync(&ax25->t3timer);
> -		del_timer_sync(&ax25->idletimer);
> +		if (!ax25_dev->device_up) {
> +			del_timer_sync(&ax25->timer);
> +			del_timer_sync(&ax25->t1timer);
> +			del_timer_sync(&ax25->t2timer);
> +			del_timer_sync(&ax25->t3timer);
> +			del_timer_sync(&ax25->idletimer);
> +		}
>  		dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
>  		ax25_dev_put(ax25_dev);
>  	}
> diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
> index d2a244e1c26..5451be15e07 100644
> --- a/net/ax25/ax25_dev.c
> +++ b/net/ax25/ax25_dev.c
> @@ -62,6 +62,7 @@ void ax25_dev_device_up(struct net_device *dev)
>  	ax25_dev->dev     = dev;
>  	dev_hold_track(dev, &ax25_dev->dev_tracker, GFP_ATOMIC);
>  	ax25_dev->forward = NULL;
> +	ax25_dev->device_up = true;
>  
>  	ax25_dev->values[AX25_VALUES_IPDEFMODE] = AX25_DEF_IPDEFMODE;
>  	ax25_dev->values[AX25_VALUES_AXDEFMODE] = AX25_DEF_AXDEFMODE;
> diff --git a/net/ax25/ax25_subr.c b/net/ax25/ax25_subr.c
> index 3a476e4f6cd..9ff98f46dc6 100644
> --- a/net/ax25/ax25_subr.c
> +++ b/net/ax25/ax25_subr.c
> @@ -268,7 +268,7 @@ void ax25_disconnect(ax25_cb *ax25, int reason)
>  		del_timer_sync(&ax25->t3timer);
>  		del_timer_sync(&ax25->idletimer);
>  	} else {
> -		if (!ax25->sk || !sock_flag(ax25->sk, SOCK_DESTROY))
> +		if (ax25->sk && !sock_flag(ax25->sk, SOCK_DESTROY))
>  			ax25_stop_heartbeat(ax25);
>  		ax25_stop_t1timer(ax25);
>  		ax25_stop_t2timer(ax25);

Side note outside the scope of this patch: I think the ax25
implementation is prone to other races, as it looks like a bit of code
lives under the assumption that once acquired bh_lock_sock() it can
modify the socket status arbitrary. It can't: it will still race with a
different process context acquiring the plain socket lock.

As said, outside the scope of this patch.

Paolo

