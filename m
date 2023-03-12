Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97C946B6A35
	for <lists+linux-hams@lfdr.de>; Sun, 12 Mar 2023 19:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbjCLShz (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 12 Mar 2023 14:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjCLShy (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 12 Mar 2023 14:37:54 -0400
X-Greylist: delayed 1144 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 12 Mar 2023 11:37:17 PDT
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D1DD349CE
        for <linux-hams@vger.kernel.org>; Sun, 12 Mar 2023 11:37:17 -0700 (PDT)
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 32CI5sZU010948
        for <linux-hams@vger.kernel.org>; Sun, 12 Mar 2023 10:05:54 -0800
Subject: Re: Backport to LTR?
To:     "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>
References: <CANnsUMExojiA6ZNyH=_zjO44N4hR0ytqj-BWrRjO0L6Ox=MjsA@mail.gmail.com>
From:   David Ranch <linux-hams@trinnet.net>
Message-ID: <8a2cea63-b0e2-c348-1b72-0f810c022332@trinnet.net>
Date:   Sun, 12 Mar 2023 11:05:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CANnsUMExojiA6ZNyH=_zjO44N4hR0ytqj-BWrRjO0L6Ox=MjsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Sun, 12 Mar 2023 10:05:54 -0800 (PST)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


Hello Chris,

I think this post covers your question:

https://unix.stackexchange.com/questions/715465/how-to-submit-patches-and-fixes-to-lts-linux-kernels

--David
KI6ZHD


On 03/11/2023 12:48 PM, Chris Maness wrote:
> I am wondering what the process is to get maintainers to backport
> AX.25 fixes to LTS kernels.  Any suggestions?  This is a diff I pulled
> off the latest LTS kernel, so unfortunately it still has not been
> committed.
>
> diff linux-5.15.100/net/ax25/af_ax25.c linux-5.15.89/net/ax25/af_ax25.c
> (I patched 5.15.89 by hand, and it has been working solid on both
> x86_64 and also 64 bit Pi.
>
> I am going to the latest release branch and see if runs my
> Slackware-15 ok.  I will keep my stuff as a fallback.
>
> 64a65
>>        spin_lock_bh(&ax25_list_lock);
> 66d66
> <               spin_lock_bh(&ax25_list_lock);
> 68d67
> <               spin_unlock_bh(&ax25_list_lock);
> 70a70
>>        spin_unlock_bh(&ax25_list_lock);
> 83a84
>>        ax25_dev->device_up = false;
> 93a95
>>                                ax25_cb_del(s);
> 105a108
>>                        ax25_cb_del(s);
> 998,1000c1001,1005
> <                       release_sock(sk);
> <                       ax25_disconnect(ax25, 0);
> <                       lock_sock(sk);
> ---
>>                        if (!sock_flag(ax25->sk, SOCK_DEAD)) {
>>                                release_sock(sk);
>>                                ax25_disconnect(ax25, 0);
>>                                lock_sock(sk);
>>                        }
> 1056,1060c1061,1067
> <               del_timer_sync(&ax25->timer);
> <               del_timer_sync(&ax25->t1timer);
> <               del_timer_sync(&ax25->t2timer);
> <               del_timer_sync(&ax25->t3timer);
> <               del_timer_sync(&ax25->idletimer);
> ---
>>                if (!ax25_dev->device_up) {
>>                        del_timer_sync(&ax25->timer);
>>                        del_timer_sync(&ax25->t1timer);
>>                        del_timer_sync(&ax25->t2timer);
>>                        del_timer_sync(&ax25->t3timer);
>>                        del_timer_sync(&ax25->idletimer);
>>                }
>
>

