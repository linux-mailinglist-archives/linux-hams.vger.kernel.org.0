Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3345A533324
	for <lists+linux-hams@lfdr.de>; Tue, 24 May 2022 23:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241866AbiEXVxR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hams@lfdr.de>); Tue, 24 May 2022 17:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241204AbiEXVxR (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 24 May 2022 17:53:17 -0400
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 491807092B
        for <linux-hams@vger.kernel.org>; Tue, 24 May 2022 14:53:15 -0700 (PDT)
X-Envelope-From: thomas@osterried.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 24OLr0H5537581
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Tue, 24 May 2022 23:53:00 +0200
Received: from x-berg.in-berlin.de ([217.197.86.42] helo=smtpclient.apple)
        by x-berg.in-berlin.de with esmtpa (Exim 4.94.2)
        (envelope-from <thomas@osterried.de>)
        id 1ntcSZ-0001gi-Ol; Tue, 24 May 2022 23:52:59 +0200
Subject: Re: Regression in "ax25: Fix UAF bugs in ax25 timers", patch
 82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Content-Type: text/plain;
        charset=us-ascii
From:   Thomas Osterried <thomas@osterried.de>
X-Priority: 3
In-Reply-To: <56fec66b.2f2d0.180f5ae1971.Coremail.duoming@zju.edu.cn>
Date:   Tue, 24 May 2022 23:52:58 +0200
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-hams@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Paolo Abeni <pabeni@redhat.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <FF735FC8-5566-4E32-ACD4-7F9BC278B53F@osterried.de>
References: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
 <20220523135214.GE4009@kadam>
 <B0C9F5C5-898E-4682-8B32-9802E1605A9E@osterried.de>
 <56fec66b.2f2d0.180f5ae1971.Coremail.duoming@zju.edu.cn>
To:     duoming@zju.edu.cn
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org



> Am 24.05.2022 um 12:47 schrieb duoming@zju.edu.cn:
> 
> Hello,
> 
> On Tue, 24 May 2022 11:25:28 +0200 Thomas wrote:
> 
>>> I tried to apply your patch but the format is wrong...  :/
>> 
>> I thought it would help us to discuss the problem on the mailinglist
>> at the code fragment.
>> But I also asked for testing, and then you need a working patch
>> Was my fault. Sorry for that.
>> 
>> 
>> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
>> index 363d47f94532..498e92fb43b7 100644
>> --- a/net/ax25/af_ax25.c
>> +++ b/net/ax25/af_ax25.c
>> @@ -86,11 +86,17 @@ static void ax25_kill_by_device(struct net_device *dev)
>> again:
>>        ax25_for_each(s, &ax25_list) {
>>                if (s->ax25_dev == ax25_dev) {
>> +                       del_timer_sync(&s->timer);
>> +                       del_timer_sync(&s->t1timer);
>> +                       del_timer_sync(&s->t2timer);
>> +                       del_timer_sync(&s->t3timer);
>> +                       del_timer_sync(&s->idletimer);
> 
> These del_timer_sync() functions are unnecessary, Because when the device is detaching, 
> the reason parameter of ax25_disconnect() equals to ENETUNREACH, the del_timer_sync()
> in ax25_disconnect() will execute.

On the other hand, we have the ENETUNREACH case only in exact this scenario:
device goes down -> ax25_kill_by_device -> ax25_disconnect().

That's why argued it's better here to stop the timers.

> 
>>                        sk = s->sk;
>>                        if (!sk) {
>>                                spin_unlock_bh(&ax25_list_lock);
>>                                ax25_disconnect(s, ENETUNREACH);
>>                                s->ax25_dev = NULL;
>> +                               ax25_cb_del(s);
>>                                spin_lock_bh(&ax25_list_lock);
>>                                goto again;
>>                        }
>> @@ -104,6 +110,7 @@ static void ax25_kill_by_device(struct net_device *dev)
>>                                ax25_dev_put(ax25_dev);
>>                        }
>>                        release_sock(sk);
>> +                       ax25_cb_del(s);
>>                        spin_lock_bh(&ax25_list_lock);
>>                        sock_put(sk);
>>                        /* The entry could have been deleted from the
>> @@ -1052,12 +1059,8 @@ static int ax25_release(struct socket *sock)
>>                sk->sk_state_change(sk);
>>                ax25_destroy_socket(ax25);
>>        }
>> +
>>        if (ax25_dev) {
>> -               del_timer_sync(&ax25->timer);
>> -               del_timer_sync(&ax25->t1timer);
>> -               del_timer_sync(&ax25->t2timer);
>> -               del_timer_sync(&ax25->t3timer);
>> -               del_timer_sync(&ax25->idletimer);
>>                dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
>>                ax25_dev_put(ax25_dev);
>>        }
> 
> I think these del_timer_sync() functions could not be removed, otherwise the UAF bugs caused by
> timer handler could not be mitigated.

I disagree. See below:

> 
> 
>      (Thread 1)                       |      (Thread 2)
> ax25_dev_device_up() //(1)             |
> ...                                    | ax25_kill_by_device()
> ax25_bind()          //(2)             |
> ax25_connect()                         | ...
> ax25_std_establish_data_link()        |
>  ax25_start_t1timer()                 | ax25_dev_device_down() //(3)
>   mod_timer(&ax25->t1timer,..)        |
>                                       | ax25_release()
>   (wait a time)                       |  ...
>                                       |  ax25_dev_put(ax25_dev) //(4)FREE
>   ax25_t1timer_expiry()               |
>    ax25->ax25_dev->values[..] //(5)USE|  ...
>     ...                               |
> 
> The ax25_dev is deallocated in position (4) and use in position (5).

I see the problem.


ax25_release() is the wrong place.
ax25_release() is called on normal socket close() from userspace
(i.E. termination of "call" session to a remote host).
The (running) timers are needed for a normal session cleanup (ending DISC); 
that's the sense of these timers.
You see this in the
  case AX25_STATE_3:
  case AX25_STATE_4:
conditions, where t1 is started.
=> The ax25_dev != NULL condition is normal for a normal session close condition.


If we like to delete the timers here because we are in ax25_release due to the
ax25_kill_by_device/ax25_dev_device_down event, do we have another option to see who
called us, and for being able to handle the case correctly?


Or better - I already asked this question:
ax25_kill_by_device calls ax25_disconnect(ENETUNREACH), and in
ax25_disconnect() the timers are stopped.
That was introduced by one of your patches.
After this, ax25_release() is called.
Since ax25_disconnect() already stopped the timers, there's no need to stop them
again. ->
  If ax25_release() is called by userspace socket_close(), timers are not stoped,
  and session shutdown with timers runs properly.


Furthermore:
directly after ax25_disconnect() which you call in ax25_kill_by_device(), 
struct ax25_cb *s s->ax25_dev is set to NULL.
-> If ax25_release() is called for the ax25_cb, the del_timer_assurances in
ax25_release() won't work anyway, because they are in the "if (ax25_dev) { ..." part.



This would lead to the following patch:

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 363d47f94532..07693eb13185 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1052,12 +1052,8 @@ static int ax25_release(struct socket *sock)
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


ax25_subr.c: unchanged



> 
>      (Thread 1)                    |      (Thread 2)
> ax25_connect()                      |
> ax25_std_establish_data_link()     |
>  ax25_start_t1timer()              |
>   mod_timer(&ax25->t1timer,..)     |
>                                    | ax25_kill_by_device()
>   (wait a time)                    |  ...
>                                    |  s->ax25_dev = NULL; //(1)
>   ax25_t1timer_expiry()            |
>    ax25->ax25_dev->values[..] //(2)|  ...
>     ...                            |
> 
> We set null to ax25_cb->ax25_dev in position (1) and dereference
> the null pointer in position (2).

Well, perhaps one solution is to check in ax25_xxx_timer_expiry() if ax25->ax25_dev is not NULL.

> 
>> In my diff from yesterday, I also had a part around "case AX25_STATE_0:").
>> This fixes another problem.
>> I removed it from my patch above: it has to discussed later as separate topic.
>> 
>> 
>> Btw, Douming, you introduced del_timer_sync().
>> ax25_stop_heartbeat(), ax25_stop_t1timer(), ax25_stop_t2timer(), ax25_stop_t3timer(),
>> ax25_stop_idletimer() from ax25_timer.c use del_timer().
>> 
>> Why do you use del_timer_sync() directly?
>> And if del_timer_sync() is needed, is it only needed in a special case,
>> or isn't it cleaner to change the ax25_stop_xxx() timer functions?
> 
> We could not change del_timer() in ax25_stop_xxx() to del_timer_sync(). Because
> the ax25_stop_xxx() is called by many functions such as ax25_ds_state1_machine(),
> ax25_ctl_ioctl(), ax25_release() and so on. If we block and wait for timer handler
> to finish in these functions, the system will hang in some cases.
> 
> Only the reason parameter of ax25_disconnect() equals to ENETUNREACH which means
> the device is detaching or the ax25 socket has been destroyed should we use
> del_timer_sync() to wait the timer handler to finish. 
> 
> Best regards,
> Duoming Zhou

vy 73,
	- Thomas  dl9sau

