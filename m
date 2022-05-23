Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F0A5308FA
	for <lists+linux-hams@lfdr.de>; Mon, 23 May 2022 07:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbiEWFrN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hams@lfdr.de>); Mon, 23 May 2022 01:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiEWFrM (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 23 May 2022 01:47:12 -0400
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07CA727B3F
        for <linux-hams@vger.kernel.org>; Sun, 22 May 2022 22:47:09 -0700 (PDT)
X-Envelope-From: thomas@osterried.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 24N5kx3k3579142
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Mon, 23 May 2022 07:46:59 +0200
Received: from x-berg.in-berlin.de ([217.197.86.42] helo=smtpclient.apple)
        by x-berg.in-berlin.de with esmtpa (Exim 4.94.2)
        (envelope-from <thomas@osterried.de>)
        id 1nt0uA-0006Ar-EF; Mon, 23 May 2022 07:46:58 +0200
From:   Thomas Osterried <thomas@osterried.de>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Date:   Mon, 23 May 2022 07:46:57 +0200
Subject: Regression in "ax25: Fix UAF bugs in ax25 timers", patch 
        82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
Cc:     "David S. Miller" <davem@davemloft.net>,
        Paolo Abeni <pabeni@redhat.com>
To:     linux-hams@vger.kernel.org, Duoming Zhou <duoming@zju.edu.cn>
Message-Id: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


Regression due to patch 82e31755e55fbcea6a9dfaae5fe4860ade17cbc0 "ax25: Fix UAF bugs in ax25 timers",
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/net/ax25/af_ax25.c?id=82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
and discussion about necessarity of
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/net/ax25/ax25_subr.c?id=fc6d01ff9ef03b66d4a3a23b46fc3c3d8cf92009
(because it addresses the same problem).


Due to patch 82e31755e55fbcea6a9dfaae5fe4860ade17cbc, any ax25 session is cleaned up anymore on disconnect.
-> netstat --ax25 shows the ex-connected session it in state "LISTEN". Makes ax25 unusable in a production environment.
=> Regression.


This is my proposal for a fix.
I'd appreciate you test and give feedback.

For more details, see below.

$ diff -Naur af_ax25.c.orig af_ax25.c.dl9sau  
--- af_ax25.c.orig      2022-05-04 12:16:35.229499063 +0200
+++ af_ax25.c.dl9sau    2022-05-23 06:48:06.268171116 +0200
@@ -86,11 +86,18 @@
 again:
        ax25_for_each(s, &ax25_list) {
                if (s->ax25_dev == ax25_dev) {
+                       // Stop timers. Really needed? ax25_disconnect(), that we call with arg ENETUNREACH will also stop the timers.
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
@@ -104,6 +111,7 @@
                                ax25_dev_put(ax25_dev);
                        }
                        release_sock(sk);
+                       ax25_cb_del(s);
                        spin_lock_bh(&ax25_list_lock);
                        sock_put(sk);
                        /* The entry could have been deleted from the
@@ -995,9 +1003,11 @@
        if (sk->sk_type == SOCK_SEQPACKET) {
                switch (ax25->state) {
                case AX25_STATE_0:
-                       release_sock(sk);
-                       ax25_disconnect(ax25, 0);
-                       lock_sock(sk);
+                       if (!sock_flag(ax25->sk, SOCK_DEAD)) {
+                               release_sock(sk);
+                               ax25_disconnect(ax25, 0);
+                               lock_sock(sk);
+                       }
                        ax25_destroy_socket(ax25);
                        break;
 
@@ -1052,12 +1062,8 @@
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

Argumentation:

Author Duoming Zhou <duoming@zju.edu.cn> described his patch 82e31755e55fbcea6a9dfaae5fe4860ade17cbc0 , that lead to the regession, with:

===
ax25: Fix UAF bugs in ax25 timers
There are race conditions that may lead to UAF bugs in
ax25_heartbeat_expiry(), ax25_t1timer_expiry(), ax25_t2timer_expiry(),
ax25_t3timer_expiry() and ax25_idletimer_expiry(), when we call
ax25_release() to deallocate ax25_dev.

One of the UAF bugs caused by ax25_release() is shown below:

      (Thread 1)                    |      (Thread 2)
ax25_dev_device_up() //(1)          |
...                                 | ax25_kill_by_device()
ax25_bind()          //(2)          |
ax25_connect()                      | ...
 ax25_std_establish_data_link()     |
  ax25_start_t1timer()              | ax25_dev_device_down() //(3)
   mod_timer(&ax25->t1timer,..)     |
                                    | ax25_release()
   (wait a time)                    |  ...
                                    |  ax25_dev_put(ax25_dev) //(4)FREE
   ax25_t1timer_expiry()            |
    ax25->ax25_dev->values[..] //USE|  ...
     ...                            |

We increase dev in position (1) and (2), and
decrease the refcount of ax25_dev in position (3) and (4).
The ax25_dev will be freed in position (4) and be used in
ax25_t1timer_expiry().
===


Imho, Duoming has overseen when he fixed the ifconfig device down issue, that ax25_release() is called every time a userspace program closes his socket.
(.release        = ax25_release)

Timers are for good, not for bad. ax25 timers are important for correct behavior of the AX25_STATE machine. And the "heartbeat" timer is used internally for correct session cleanup.
I.e., if user closes his AX25-sessioon, kernel should send DISC upon either UA or DM are received, or until t1 expiry. The session and it's state needs still to be known for some time on normal session close. The only case where the session sate not needed anymore if you set ifcoonfig iface down.


Duoming's approach lead to
if (ax25_dev) {  // existence of ax25_dev: normal situation for a regularly closed ax25 session
              del_timer_sync(&ax25->timer);   // this is the "heartbeat" timer
              del_timer_sync(&ax25->t1timer); // .. and these are the others
              del_timer_sync(&ax25->t2timer);
              del_timer_sync(&ax25->t3timer);
              del_timer_sync(&ax25->idletimer);


The assurance that timers are stopped should to go to ax25_kill_by_device() [this is for the situation, that the SysOp sets ifconfig ax25iface down], from where ax25_release() is called. See my patch suggestion.

I argue, that the stopping of the timer in ax25_kill_by_device() is not really necessary, because it calls
ax25_disconnect(s, ENETUNREACH);
and ax25_disconnect() does:
        if (reason == ENETUNREACH) {
                del_timer_sync(&ax25->timer);
                del_timer_sync(&ax25->t1timer);
                del_timer_sync(&ax25->t2timer);
                del_timer_sync(&ax25->t3timer);
                del_timer_sync(&ax25->idletimer);

-> Our timers get stopped anyway.

But on the other hand, Duoming had the "BUG: KASAN: use-after-free in ax25_t1timer_expiry+0x1c/0x60" issue, that inspired him for his patch..

But on another hand. the reason == ENETUNREACH check in ax5_disconnect is quite new: It came by Duoming's "ax25: Fix NULL pointer dereferences in ax25 timers" patch to ax25_subr.c, ten days before (commit ID fc6d01ff). If ax25_disconnect() deletes the timers correctly, it may not be needed as an insurance for ax25_kill_by_device().
Both of Duoming's patches try to solve the same problem.
It should be investigated if the del_timer_sync()-assurance has to be at so many different points: we stop them, and call a function that also stops them. If this is really needed, than the problem we try to resolve with this lays somewhere else.


ax25_destroy_socket() is called on heartbeat expiry if AX25_STATE is 0. In the case we stop the timers in ax25_kill_by_device(), ax25_destroy_socket() is not called.
ax25_cb_del() is normaly done by ax25_destroy_socket(). 

If we don't call ax25_cb_del() directly, the situation is this, for a current incoming connection in state ESTABLISHED and after ifdown bpq0:
DL9AU-3    DL9SAU-1   ???     LISTENING    000/000  0       0
-> No timer cleans this up.

If I'd try to call ax25_destroy_socket() instead of ax25_cb_del(), this would cause a refcount-underflow OOPS due to the dev_put_track-stuff.

ax25_destroy_socket() would do ax25_cb_del(), and also stop timers. But it also may start timers again (ax25_start_heartbeat(sax25), or by timer_setup(&ax25->dtimer, ax25_destroy_timer, 0) ) -- which is not in our interest in this the case the device is set to down.

That's why assure ax25_cb_del() in my approach.


In the ax25_disconnect() del_timer_sync in "reason == ENETUNREACH", I suggest to revert. This was also introduced to solve the ax25_kill_by_device() problem.
The need for enforced stopping the timers I only see in the special case when a device is set to down.


Cc goes to David Miller and Paolo Abeni, because they committed the both patches I discussed above.


vy 73,
	- Thomas  dl9sau



