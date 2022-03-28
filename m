Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C676D4E8C91
	for <lists+linux-hams@lfdr.de>; Mon, 28 Mar 2022 05:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237784AbiC1DYV (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 27 Mar 2022 23:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237793AbiC1DYV (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 27 Mar 2022 23:24:21 -0400
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 26E6650B3C
        for <linux-hams@vger.kernel.org>; Sun, 27 Mar 2022 20:22:41 -0700 (PDT)
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 22S3Md7m022715;
        Sun, 27 Mar 2022 19:22:39 -0800
Subject: Re: AX.25 Linux Packet Forwarding
To:     Dennis Boone <drb@msu.edu>, linux-hams@vger.kernel.org
References: <CAO6P2QRhPXpOw6EYkeFv+QsGGZfTce98uTgTd-oYQ7L0sE5TbA@mail.gmail.com>
 <20220328002508.6C25E12EB5@yagi.h-net.msu.edu>
From:   David Ranch <linux-hams@trinnet.net>
Message-ID: <819ca310-b43b-547d-7fae-3ec0a2487b9a@trinnet.net>
Date:   Sun, 27 Mar 2022 20:22:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20220328002508.6C25E12EB5@yagi.h-net.msu.edu>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Sun, 27 Mar 2022 19:22:39 -0800 (GMT+8)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


Hello Paul,

What are you using for a TNC?  If you're using Direwolf, it has a 
built-in digipeating function as well.

Ps.  net.ipv4.ip_forward is for TCP/IPv4 traffic and has nothing to do 
with AX.25 forwarding.


--David
KI6ZHD


On 03/27/2022 05:25 PM, Dennis Boone wrote:
>   > I'd like to set up my Linux box attached to my base station to
>   > forward AX.25 traffic on-frequency as a relay.
>
>   > HT: "K3XEC-1" (Kenwood)
>   > Base Station: "MYRELAY" (Yaesu)
>   > Remote Station: "MYBBS"
>
> The linux stack doesn't digipeat on its own.  There are a couple of
> variants of a digi program that will add the needful.  One such is:
>
> https://github.com/iddq/axdigi2018
>
> All of them seem to be updates of Craig Small's original axdigi tool.
>
> De

