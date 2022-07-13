Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD4C857312D
	for <lists+linux-hams@lfdr.de>; Wed, 13 Jul 2022 10:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231748AbiGMIeD (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 13 Jul 2022 04:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234806AbiGMIeC (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 13 Jul 2022 04:34:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0ADFB74DD6
        for <linux-hams@vger.kernel.org>; Wed, 13 Jul 2022 01:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657701238;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=74dW0jhlKIvaOyEGuXtY/bgXjn9zQ+zDadO8O10/PE4=;
        b=aIKtupRNEH2SKNNHxvUh4RcXNRL+R10L5gkoewRC0jIb/mVSzQUkQfGCmf/aq7y2ymqjSF
        7ttzIJrpj6MpaTBML8anB3PeDogKkrilnPl+Xw80hAFwIVy6iofVcTzonPuNBMFNLQAnEC
        ALS/1UaxN5Iy2spvFepuV/Znkm9z3XI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-9yrNsyJGOmC55BZ95qcNBw-1; Wed, 13 Jul 2022 04:33:57 -0400
X-MC-Unique: 9yrNsyJGOmC55BZ95qcNBw-1
Received: by mail-wm1-f69.google.com with SMTP id t25-20020a7bc3d9000000b003a2ea772bd2so667298wmj.2
        for <linux-hams@vger.kernel.org>; Wed, 13 Jul 2022 01:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=74dW0jhlKIvaOyEGuXtY/bgXjn9zQ+zDadO8O10/PE4=;
        b=3RKPH+4zgKSEr1GprgpfyYGdCOGxpfGLBMBqh/Uo2lfjnVddF7NwIVPisit3jHVgl2
         AIDHwaZGURJziaZjg9kjGkDXsmOoOgsvOHMScaZzg1le08owCTQgeoDySZh0HlDHdkNZ
         xqgs0YPZ91MU15R9BgMC3BA6fR/zX2H3fZ/xSMXNNk1BoAWOgtQ4EgYEUclbRPWo2LB1
         R7DD3syDLthbX/eSKkDhXJovsoMpyQ4ji/5wdbKXovSKid8oEiOslqO2E2RWTRoRj5OU
         T8WRDND5XwDyTNnuIU18/i/GIl1YdKp2kdFwC2dJjCkPMHmr6HYBlQpPTB6ettQj/p5I
         3i6Q==
X-Gm-Message-State: AJIora/juFa213ZvpDn4DyRMKG3rZqVRiTPEj0tQu3/nrJxrhZOPOWGK
        IZAiaDMZr9dgwSlBUjA9B2EmV/eZeZGFS1kgIFP3gi+P1kP3Sdt9AfVQmNUZ+1esAcjoOkQwG5+
        G4q/FgkspLr0FGN0i5kMMTw==
X-Received: by 2002:adf:eccb:0:b0:21d:7b41:22c7 with SMTP id s11-20020adfeccb000000b0021d7b4122c7mr1924337wro.543.1657701236586;
        Wed, 13 Jul 2022 01:33:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u8ITw976yDjianJL9XwDcoXz2Y6QyUbFXu8PB3MPkowu/ymg7juX4C+XbujXlltHzYiurZOQ==
X-Received: by 2002:adf:eccb:0:b0:21d:7b41:22c7 with SMTP id s11-20020adfeccb000000b0021d7b4122c7mr1924318wro.543.1657701236338;
        Wed, 13 Jul 2022 01:33:56 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-97-238.dyn.eolo.it. [146.241.97.238])
        by smtp.gmail.com with ESMTPSA id l26-20020a056000023a00b0021d96b3b6adsm10266971wrz.106.2022.07.13.01.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 01:33:55 -0700 (PDT)
Message-ID: <2dc058285c524363b93ebf9468ff85186b9c72c2.camel@redhat.com>
Subject: Re: [PATCH net v6] net: rose: fix null-ptr-deref caused by
 rose_kill_by_neigh
From:   Paolo Abeni <pabeni@redhat.com>
To:     duoming@zju.edu.cn
Cc:     linux-hams@vger.kernel.org, ralf@linux-mips.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 13 Jul 2022 10:33:54 +0200
In-Reply-To: <540ab034.3f081.181f6895dba.Coremail.duoming@zju.edu.cn>
References: <20220711013111.33183-1-duoming@zju.edu.cn>
         <daa2b799956c286b2cce898bee22fb2a043f5177.camel@redhat.com>
         <540ab034.3f081.181f6895dba.Coremail.duoming@zju.edu.cn>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Wed, 2022-07-13 at 15:50 +0800, duoming@zju.edu.cn wrote:
> Hello,
> 
> On Tue, 12 Jul 2022 13:00:49 +0200 Paolo Abeni wrote:
> 
> > On Mon, 2022-07-11 at 09:31 +0800, Duoming Zhou wrote:
> > > When the link layer connection is broken, the rose->neighbour is
> > > set to null. But rose->neighbour could be used by rose_connection()
> > > and rose_release() later, because there is no synchronization among
> > > them. As a result, the null-ptr-deref bugs will happen.
> > > 
> > > One of the null-ptr-deref bugs is shown below:
> > > 
> > >     (thread 1)                  |        (thread 2)
> > >                                 |  rose_connect
> > > rose_kill_by_neigh              |    lock_sock(sk)
> > >   spin_lock_bh(&rose_list_lock) |    if (!rose->neighbour)
> > >   rose->neighbour = NULL;//(1)  |
> > >                                 |    rose->neighbour->use++;//(2)
> > > 
> > > The rose->neighbour is set to null in position (1) and dereferenced
> > > in position (2).
> > > 
> > > The KASAN report triggered by POC is shown below:
> > > 
> > > KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
> > > ...
> > > RIP: 0010:rose_connect+0x6c2/0xf30
> > > RSP: 0018:ffff88800ab47d60 EFLAGS: 00000206
> > > RAX: 0000000000000005 RBX: 000000000000002a RCX: 0000000000000000
> > > RDX: ffff88800ab38000 RSI: ffff88800ab47e48 RDI: ffff88800ab38309
> > > RBP: dffffc0000000000 R08: 0000000000000000 R09: ffffed1001567062
> > > R10: dfffe91001567063 R11: 1ffff11001567061 R12: 1ffff11000d17cd0
> > > R13: ffff8880068be680 R14: 0000000000000002 R15: 1ffff11000d17cd0
> > > ...
> > > Call Trace:
> > >   <TASK>
> > >   ? __local_bh_enable_ip+0x54/0x80
> > >   ? selinux_netlbl_socket_connect+0x26/0x30
> > >   ? rose_bind+0x5b0/0x5b0
> > >   __sys_connect+0x216/0x280
> > >   __x64_sys_connect+0x71/0x80
> > >   do_syscall_64+0x43/0x90
> > >   entry_SYSCALL_64_after_hwframe+0x46/0xb0
> > > 
> > > This patch adds lock_sock() in rose_kill_by_neigh() in order to
> > > synchronize with rose_connect() and rose_release(). Then, changing
> > > type of 'neighbour->use' from unsigned short to atomic_t in order to
> > > mitigate race conditions caused by holding different socket lock while
> > > updating 'neighbour->use'.
> > > 
> > > Meanwhile, this patch adds sock_hold() protected by rose_list_lock
> > > that could synchronize with rose_remove_socket() in order to mitigate
> > > UAF bug caused by lock_sock() we add.
> > > 
> > > What's more, there is no need using rose_neigh_list_lock to protect
> > > rose_kill_by_neigh(). Because we have already used rose_neigh_list_lock
> > > to protect the state change of rose_neigh in rose_link_failed(), which
> > > is well synchronized.
> > > 
> > > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > > Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> > > ---
> > > Changes in v6:
> > >   - Change sk_for_each() to sk_for_each_safe().
> > >   - Change type of 'neighbour->use' from unsigned short to atomic_t.
> > > 
> > >  include/net/rose.h    |  2 +-
> > >  net/rose/af_rose.c    | 19 +++++++++++++------
> > >  net/rose/rose_in.c    | 12 ++++++------
> > >  net/rose/rose_route.c | 24 ++++++++++++------------
> > >  net/rose/rose_timer.c |  2 +-
> > >  5 files changed, 33 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/include/net/rose.h b/include/net/rose.h
> > > index 0f0a4ce0fee..d5ddebc556d 100644
> > > --- a/include/net/rose.h
> > > +++ b/include/net/rose.h
> > > @@ -95,7 +95,7 @@ struct rose_neigh {
> > >  	ax25_cb			*ax25;
> > >  	struct net_device		*dev;
> > >  	unsigned short		count;
> > > -	unsigned short		use;
> > > +	atomic_t		use;
> > >  	unsigned int		number;
> > >  	char			restarted;
> > >  	char			dce_mode;
> > > diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
> > > index bf2d986a6bc..54e7b76c4f3 100644
> > > --- a/net/rose/af_rose.c
> > > +++ b/net/rose/af_rose.c
> > > @@ -163,16 +163,23 @@ static void rose_remove_socket(struct sock *sk)
> > >  void rose_kill_by_neigh(struct rose_neigh *neigh)
> > >  {
> > >  	struct sock *s;
> > > +	struct hlist_node *tmp;
> > >  
> > >  	spin_lock_bh(&rose_list_lock);
> > > -	sk_for_each(s, &rose_list) {
> > > +	sk_for_each_safe(s, tmp, &rose_list) {
> > >  		struct rose_sock *rose = rose_sk(s);
> > >  
> > > +		sock_hold(s);
> > > +		spin_unlock_bh(&rose_list_lock);
> > > +		lock_sock(s);
> > >  		if (rose->neighbour == neigh) {
> > >  			rose_disconnect(s, ENETUNREACH, ROSE_OUT_OF_ORDER, 0);
> > > -			rose->neighbour->use--;
> > > +			atomic_dec(&rose->neighbour->use);
> > >  			rose->neighbour = NULL;
> > >  		}
> > > +		release_sock(s);
> > > +		sock_put(s);
> > 
> > I'm sorry, this does not work. At this point both 's' and 'tmp' sockets
> > can be freed and reused. Both iterators are not valid anymore when you
> > acquire the 'rose_list_lock' later.
> 
> Thank you for your time and reply! But I think both 's' and 'tmp' can not
> be freed and reused in rose_kill_by_neigh(). Because rose_remove_socket()
> calls sk_del_node_init() which is protected by rose_list_lock to delete the
> socket node from the hlist and if sk->sk_refcnt equals to 1, the socket will
> be deallocated.
> 
> static void rose_remove_socket(struct sock *sk)
> {
> 	spin_lock_bh(&rose_list_lock);
> 	sk_del_node_init(sk);
> 	spin_unlock_bh(&rose_list_lock);
> }
> 
> https://elixir.bootlin.com/linux/v5.19-rc6/source/net/rose/af_rose.c#L152
> 
> Both 's' and 'tmp' in rose_kill_by_neigh() is also protected by rose_list_lock.

The above loop explicitly releases the rose_list_lock at each
iteration. Additionally, the reference count to 's' is released before
re-acquiring such lock. By the time rose_list_lock is re-acquired, some
other process could have removed from the list both 's' and 'tmp' and
even de-allocate them.

Moving the 'sock_put(s);' after re-acquiring the rose_list_lock could
protect from 's' being de-allocated, but can't protect from 'tmp' being
deallocated, neither from 's' and 'tmp' being removed from the list.

The above code is not safe.

/P


