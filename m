Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD48B53265C
	for <lists+linux-hams@lfdr.de>; Tue, 24 May 2022 11:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234733AbiEXJZr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hams@lfdr.de>); Tue, 24 May 2022 05:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233917AbiEXJZp (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 24 May 2022 05:25:45 -0400
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131E674DC6
        for <linux-hams@vger.kernel.org>; Tue, 24 May 2022 02:25:42 -0700 (PDT)
X-Envelope-From: thomas@osterried.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 24O9PTo4107452
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Tue, 24 May 2022 11:25:29 +0200
Received: from x-berg.in-berlin.de ([217.197.86.42] helo=smtpclient.apple)
        by x-berg.in-berlin.de with esmtpa (Exim 4.94.2)
        (envelope-from <thomas@osterried.de>)
        id 1ntQnA-0006Kk-TJ; Tue, 24 May 2022 11:25:28 +0200
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: Regression in "ax25: Fix UAF bugs in ax25 timers", patch
 82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
From:   Thomas Osterried <thomas@osterried.de>
In-Reply-To: <20220523135214.GE4009@kadam>
Date:   Tue, 24 May 2022 11:25:28 +0200
Cc:     linux-hams@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Paolo Abeni <pabeni@redhat.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <B0C9F5C5-898E-4682-8B32-9802E1605A9E@osterried.de>
References: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
 <20220523135214.GE4009@kadam>
To:     Dan Carpenter <dan.carpenter@oracle.com>, duoming@zju.edu.cn
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


> Am 23.05.2022 um 15:52 schrieb Dan Carpenter <dan.carpenter@oracle.com>:
> 
> 
[..]
> 
> I tried to apply your patch but the format is wrong...  :/

I thought it would help us to discuss the problem on the mailinglist
at the code fragment.
But I also asked for testing, and then you need a working patch
Was my fault. Sorry for that.


diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 363d47f94532..498e92fb43b7 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -86,11 +86,17 @@ static void ax25_kill_by_device(struct net_device *dev)
 again:
        ax25_for_each(s, &ax25_list) {
                if (s->ax25_dev == ax25_dev) {
+                       del_timer_sync(&s->timer);
+                       del_timer_sync(&s->t1timer);
+                       del_timer_sync(&s->t2timer);
+                       del_timer_sync(&s->t3timer);
+                       del_timer_sync(&s->idletimer);
                        sk = s->sk;
                        if (!sk) {
                                spin_unlock_bh(&ax25_list_lock);
                                ax25_disconnect(s, ENETUNREACH);
                                s->ax25_dev = NULL;
+                               ax25_cb_del(s);
                                spin_lock_bh(&ax25_list_lock);
                                goto again;
                        }
@@ -104,6 +110,7 @@ static void ax25_kill_by_device(struct net_device *dev)
                                ax25_dev_put(ax25_dev);
                        }
                        release_sock(sk);
+                       ax25_cb_del(s);
                        spin_lock_bh(&ax25_list_lock);
                        sock_put(sk);
                        /* The entry could have been deleted from the
@@ -1052,12 +1059,8 @@ static int ax25_release(struct socket *sock)
                sk->sk_state_change(sk);
                ax25_destroy_socket(ax25);
        }
+
        if (ax25_dev) {
-               del_timer_sync(&ax25->timer);
-               del_timer_sync(&ax25->t1timer);
-               del_timer_sync(&ax25->t2timer);
-               del_timer_sync(&ax25->t3timer);
-               del_timer_sync(&ax25->idletimer);
                dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
                ax25_dev_put(ax25_dev);
        }


In that context, I ask to revert (as I argued in my initial mail):
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/net/ax25/ax25_subr.c?id=fc6d01ff9ef03b66d4a3a23b46fc3c3d8cf92009



In my diff from yesterday, I also had a part around "case AX25_STATE_0:").
This fixes another problem.
I removed it from my patch above: it has to discussed later as separate topic.


Btw, Douming, you introduced del_timer_sync().
ax25_stop_heartbeat(), ax25_stop_t1timer(), ax25_stop_t2timer(), ax25_stop_t3timer(),
ax25_stop_idletimer() from ax25_timer.c use del_timer().

Why do you use del_timer_sync() directly?
And if del_timer_sync() is needed, is it only needed in a special case,
or isn't it cleaner to change the ax25_stop_xxx() timer functions?


vy 73,
	- Thomas  dl9sau




