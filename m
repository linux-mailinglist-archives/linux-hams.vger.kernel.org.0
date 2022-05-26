Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8587535647
	for <lists+linux-hams@lfdr.de>; Fri, 27 May 2022 01:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbiEZXCF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hams@lfdr.de>); Thu, 26 May 2022 19:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344491AbiEZXCE (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 26 May 2022 19:02:04 -0400
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D642600
        for <linux-hams@vger.kernel.org>; Thu, 26 May 2022 16:01:59 -0700 (PDT)
X-Envelope-From: thomas@osterried.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 24QMudDZ1867476
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Fri, 27 May 2022 00:56:39 +0200
Received: from x-berg.in-berlin.de ([217.197.86.42] helo=smtpclient.apple)
        by x-berg.in-berlin.de with esmtpa (Exim 4.94.2)
        (envelope-from <thomas@osterried.de>)
        id 1nuMPF-00008Q-Ur; Fri, 27 May 2022 00:56:38 +0200
Subject: Re: Regression in "ax25: Fix UAF bugs in ax25 timers", patch
 82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Content-Type: text/plain;
        charset=us-ascii
From:   Thomas Osterried <thomas@osterried.de>
X-Priority: 3
In-Reply-To: <19ff1cc8.2f102.180f910a87a.Coremail.duoming@zju.edu.cn>
Date:   Fri, 27 May 2022 00:56:37 +0200
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-hams@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Paolo Abeni <pabeni@redhat.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <CE99195A-25DD-4715-BABF-A83B2E572635@osterried.de>
References: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
 <20220523135214.GE4009@kadam>
 <B0C9F5C5-898E-4682-8B32-9802E1605A9E@osterried.de>
 <56fec66b.2f2d0.180f5ae1971.Coremail.duoming@zju.edu.cn>
 <FF735FC8-5566-4E32-ACD4-7F9BC278B53F@osterried.de>
 <19ff1cc8.2f102.180f910a87a.Coremail.duoming@zju.edu.cn>
To:     Duoming Zhou <duoming@zju.edu.cn>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,XPRIO autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello,

first of all:
Your approach with
   if (!ax25_dev->device_up) { ...
looks good and I will test it.



I'm not so happy with adding new states to the ax25_dev struct.
When I asked "If we like to delete the timers here because we are in ax25_release due
  to the ax25_kill_by_device/ax25_dev_device_down event, do we have another option to
  see what called us, and for being able to handle the case correctly?",
I had in mind if we could see this situation in the current state inside
the ax25_cb, like ax25->state or ax25->sk->..

But in case of ax25->state, ax25_connect() changes the state when executed in
a parallel thread after ax25_kill_by_device() -> that's no option


Another one I thought about was an assurance in ax25_start_xxx_timer() functions,
that timer should not start if ax25_cb->ax25_dev == NULL,
but your examples showed, that
  mod_timer(&ax25->t1timer,..)
is also used directly to modify running timer.


An other option may be assurances in ax25_xxx_expiry() to immediately return if
ax25_cb->ax25_dev == NULL.

Indeed, I see in ax25_heartbeat_expiry(struct timer_list *t) this assurance:
          if (ax25->ax25_dev)
                proto = ax25->ax25_dev->values[AX25_VALUES_PROTOCOL];
Unfortunately, those checks are missing in the other timer_expiry functions and
one of them is ax25_t1timer_expiry, for which you showed in your kernel panic
backtrace.

If I see it correctly, this would solve the issue you had with the running
timers, without forced-stopping them in ax25_release().
But on the other hand: if the interface is really down, there's no need
for the timers to keep running, and keeping things running where parts
may already be freed is dangerous. The session has to been cleaned up immediately.
-> This clearly speaks for your latest approach.

Perhaps it's a good idea anyway to add the assurance (like ax25_heartbeat_expiry()
does) to the other ax25_xxx_expiry() functions. 



An other approach I had in mind was a variable in struct ax25_cb, that the cb
is in progress of being cleaned up.
This way, we could prohibit starting or modifying timers.
Unfortunately, there might be many checks in various functions necessary.
-> This clearly speaks for your latest approach.

Perhaps it's a good idea to also test in
ax25_setsockopt SO_BINDTODEVICE
and in
ax25_bind_to_device
if ax25_ dev->device_up flag is 0, and if so, return in  -ENODEV;


Off-topic-question: about the quite-new dev_hold_track():
while looking to 
ax25_setsockopt() and ax25_bind() for SO_BINDTODEVICE,
I se only that dev_hold_track() is called in ax25_bind(),
but not in ax25_setsockopt() for SO_BINDTODEVICE.
Is it correct that ax25_setsockopt() for SO_BINDTODEVICE
does not need to trigger the tracker?



About your answer (comments inline):


> Am 25.05.2022 um 04:34 schrieb duoming@zju.edu.cn:
> 
> 
> Hello,
> 
> On Tue, 24 May 2022 23:52:58 +0200 Thomas wrote:
> 
>>>>> I tried to apply your patch but the format is wrong...  :/
>>>> 
>>>> I thought it would help us to discuss the problem on the mailinglist
>>>> at the code fragment.
>>>> But I also asked for testing, and then you need a working patch
>>>> Was my fault. Sorry for that.
>>>> 
>>>> 
>>>> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
>>>> index 363d47f94532..498e92fb43b7 100644
>>>> --- a/net/ax25/af_ax25.c
>>>> +++ b/net/ax25/af_ax25.c
>>>> @@ -86,11 +86,17 @@ static void ax25_kill_by_device(struct net_device *dev)
>>>> again:
>>>>       ax25_for_each(s, &ax25_list) {
>>>>               if (s->ax25_dev == ax25_dev) {
>>>> +                       del_timer_sync(&s->timer);
>>>> +                       del_timer_sync(&s->t1timer);
>>>> +                       del_timer_sync(&s->t2timer);
>>>> +                       del_timer_sync(&s->t3timer);
>>>> +                       del_timer_sync(&s->idletimer);
>>> 
>>> These del_timer_sync() functions are unnecessary, Because when the device is detaching, 
>>> the reason parameter of ax25_disconnect() equals to ENETUNREACH, the del_timer_sync()
>>> in ax25_disconnect() will execute.
>> 
>> On the other hand, we have the ENETUNREACH case only in exact this scenario:
>> device goes down -> ax25_kill_by_device -> ax25_disconnect().
>> 
>> That's why argued it's better here to stop the timers.
> 
> I think you miss one situation:

You mixed this e-mail together with a next e-mail where we already talked about keeping
del_timer_sync() in ax25_release().

> If we don't call ax25_bind() before ax25_kill_by_device(), there is no s->ax25_dev
> equals to ax25_dev when ax25_kill_by_device() is executing and the del_timer_sync()
> will not execute.
>
> static void ax25_kill_by_device(struct net_device *dev)
> {
> ...
> 	ax25_for_each(s, &ax25_list) {
> 		if (s->ax25_dev == ax25_dev) { //no s->ax25_dev equals to ax25_dev
> +                       del_timer_sync(&s->timer);  //will not execute and the same below
> +                       del_timer_sync(&s->t1timer); 
> +                       del_timer_sync(&s->t2timer);
> +                       del_timer_sync(&s->t3timer);
> +                       del_timer_sync(&s->idletimer);
> 
> Even if ax25_kill_by_device() has been executed, the timers could not be stopped as well. 
> As a result, the following UAF bug will happen:
> 
>      (Thread 1)                       |      (Thread 2)
> ax25_dev_device_up()                   |
> ...                                    | ax25_kill_by_device()
> ax25_bind()                            |
> ax25_connect()                         | ...
> ax25_std_establish_data_link()        |
>  ax25_start_t1timer()                 | ax25_dev_device_down()
>   mod_timer(&ax25->t1timer,..)        |
>                                       | ax25_release()
>   (wait a time)                       |  ...
>                                       |  ax25_dev_put(ax25_dev) //FREE
>   ax25_t1timer_expiry()               |
>    ax25->ax25_dev->values[..] //USE   |  ...
>     ...                               |
> 
> Your new patch could not mitigate this problem.





>>>>                       sk = s->sk;
>>>>                       if (!sk) {
>>>>                               spin_unlock_bh(&ax25_list_lock);
>>>>                               ax25_disconnect(s, ENETUNREACH);
>>>>                               s->ax25_dev = NULL;
>>>> +                               ax25_cb_del(s);
>>>>                               spin_lock_bh(&ax25_list_lock);
>>>>                               goto again;
>>>>                       }
>>>> @@ -104,6 +110,7 @@ static void ax25_kill_by_device(struct net_device *dev)
>>>>                               ax25_dev_put(ax25_dev);
>>>>                       }
>>>>                       release_sock(sk);
>>>> +                       ax25_cb_del(s);
>>>>                       spin_lock_bh(&ax25_list_lock);
>>>>                       sock_put(sk);
>>>>                       /* The entry could have been deleted from the
>>>> @@ -1052,12 +1059,8 @@ static int ax25_release(struct socket *sock)
>>>>               sk->sk_state_change(sk);
>>>>               ax25_destroy_socket(ax25);
>>>>       }
>>>> +
>>>>       if (ax25_dev) {
>>>> -               del_timer_sync(&ax25->timer);
>>>> -               del_timer_sync(&ax25->t1timer);
>>>> -               del_timer_sync(&ax25->t2timer);
>>>> -               del_timer_sync(&ax25->t3timer);
>>>> -               del_timer_sync(&ax25->idletimer);
>>>>               dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
>>>>               ax25_dev_put(ax25_dev);
>>>>       }
>>> 
>>> I think these del_timer_sync() functions could not be removed, otherwise the UAF bugs caused by
>>> timer handler could not be mitigated.
>> 
>> I disagree. See below:
>> 
>>> 
>>> 
>>>     (Thread 1)                       |      (Thread 2)
>>> ax25_dev_device_up() //(1)             |
>>> ...                                    | ax25_kill_by_device()
>>> ax25_bind()          //(2)             |
>>> ax25_connect()                         | ...
>>> ax25_std_establish_data_link()        |
>>> ax25_start_t1timer()                 | ax25_dev_device_down() //(3)
>>>  mod_timer(&ax25->t1timer,..)        |
>>>                                      | ax25_release()
>>>  (wait a time)                       |  ...
>>>                                      |  ax25_dev_put(ax25_dev) //(4)FREE
>>>  ax25_t1timer_expiry()               |
>>>   ax25->ax25_dev->values[..] //(5)USE|  ...
>>>    ...                               |
>>> 
>>> The ax25_dev is deallocated in position (4) and use in position (5).
>> 
>> I see the problem.
>> 
>> 
>> ax25_release() is the wrong place.
>> ax25_release() is called on normal socket close() from userspace
>> (i.E. termination of "call" session to a remote host).
>> The (running) timers are needed for a normal session cleanup (ending DISC); 
>> that's the sense of these timers.
>> You see this in the
>>  case AX25_STATE_3:
>>  case AX25_STATE_4:
>> conditions, where t1 is started.
>> => The ax25_dev != NULL condition is normal for a normal session close condition.
>> 
>> 
>> If we like to delete the timers here because we are in ax25_release due to the
>> ax25_kill_by_device/ax25_dev_device_down event, do we have another option to see who
>> called us, and for being able to handle the case correctly?
>> 
>> 
>> Or better - I already asked this question:
>> ax25_kill_by_device calls ax25_disconnect(ENETUNREACH), and in
>> ax25_disconnect() the timers are stopped.
>> That was introduced by one of your patches.
>> After this, ax25_release() is called.
>> Since ax25_disconnect() already stopped the timers, there's no need to stop them
>> again. ->
> 
> If we don't call ax25_bind() before ax25_kill_by_device(), there is no s->ax25_dev
> equals to ax25_dev when ax25_kill_by_device is executing and the ax25_disconnect()
> will not execute. Even if ax25_kill_by_device() has been executed, the timers could
> not be stopped as well. So we need to stop them again in ax25_release(). 
> 
>>  If ax25_release() is called by userspace socket_close(), timers are not stoped,
>>  and session shutdown with timers runs properly.
> 
> I think adding a check in ax25_release() which is used to judge whether ax25_kill_by_device()
> has been executed before ax25_release() is better. The detail is shown below:
> 
> diff --git a/include/net/ax25.h b/include/net/ax25.h
> index 0f9790c455b..a427a05672e 100644
> --- a/include/net/ax25.h
> +++ b/include/net/ax25.h
> @@ -228,6 +228,7 @@ typedef struct ax25_dev {
>        ax25_dama_info          dama;
> #endif
>        refcount_t              refcount;
> +       bool device_up;
> } ax25_dev;
> 
> typedef struct ax25_cb {
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index 363d47f9453..47ce6b630cc 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -81,6 +81,7 @@ static void ax25_kill_by_device(struct net_device *dev)
> 
>        if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
>                return;
> +       ax25_dev->device_up = false;
> 
>        spin_lock_bh(&ax25_list_lock);
> again:
> @@ -1053,11 +1054,13 @@ static int ax25_release(struct socket *sock)
>                ax25_destroy_socket(ax25);
>        }
>        if (ax25_dev) {
> -               del_timer_sync(&ax25->timer);
> -               del_timer_sync(&ax25->t1timer);
> -               del_timer_sync(&ax25->t2timer);
> -               del_timer_sync(&ax25->t3timer);
> -               del_timer_sync(&ax25->idletimer);
> +               if (!ax25_dev->device_up) {
> +                       del_timer_sync(&ax25->timer);
> +                       del_timer_sync(&ax25->t1timer);
> +                       del_timer_sync(&ax25->t2timer);
> +                       del_timer_sync(&ax25->t3timer);
> +                       del_timer_sync(&ax25->idletimer);
> +               }
>                dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
>                ax25_dev_put(ax25_dev);
>        }
> diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
> index d2a244e1c26..5451be15e07 100644
> --- a/net/ax25/ax25_dev.c
> +++ b/net/ax25/ax25_dev.c
> @@ -62,6 +62,7 @@ void ax25_dev_device_up(struct net_device *dev)
>        ax25_dev->dev     = dev;
>        dev_hold_track(dev, &ax25_dev->dev_tracker, GFP_ATOMIC);
>        ax25_dev->forward = NULL;
> +       ax25_dev->device_up = true;
> 
>        ax25_dev->values[AX25_VALUES_IPDEFMODE] = AX25_DEF_IPDEFMODE;
>        ax25_dev->values[AX25_VALUES_AXDEFMODE] = AX25_DEF_AXDEFMODE;

ack

It's by far the easiest and clearest solution.

> 
>> Furthermore:
>> directly after ax25_disconnect() which you call in ax25_kill_by_device(), 
>> struct ax25_cb *s s->ax25_dev is set to NULL.
>> -> If ax25_release() is called for the ax25_cb, the del_timer_assurances in
>> ax25_release() won't work anyway, because they are in the "if (ax25_dev) { ..." part.
> 
> We only need to stop timers once. If the timers could be stopped in ax25_kill_by_device(),
> there is no need to stop them in ax25_release(). In other words, if the timers could not
> be stopped in ax25_kill_by_device(), we need to stop them in ax25_release().
> 
> Best regards,
> Duoming Zhou

vy 73,
	- Thomas  dl9sau

