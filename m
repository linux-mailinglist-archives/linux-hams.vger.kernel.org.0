Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 924F04CEC6E
	for <lists+linux-hams@lfdr.de>; Sun,  6 Mar 2022 18:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbiCFRPp (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 6 Mar 2022 12:15:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiCFRPo (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 6 Mar 2022 12:15:44 -0500
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8A0CE53B7A
        for <linux-hams@vger.kernel.org>; Sun,  6 Mar 2022 09:14:52 -0800 (PST)
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS Hardened/TrinityOS Hardened) with ESMTP id 226HEmbr020991;
        Sun, 6 Mar 2022 09:14:48 -0800
Subject: Re: Kernel freeze on killall kissattach
To:     Roland Schwarz <roland.schwarz@blackspace.at>,
        linux-hams@vger.kernel.org
References: <e037cff4-87fa-ce95-438d-66be0754c6b2@blackspace.at>
From:   David Ranch <linux-hams@trinnet.net>
Message-ID: <ca12cec2-3301-2926-f04a-cf8103af72e8@trinnet.net>
Date:   Sun, 6 Mar 2022 09:14:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <e037cff4-87fa-ce95-438d-66be0754c6b2@blackspace.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Sun, 06 Mar 2022 09:14:48 -0800 (GMT+8)
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_05,KHOP_HELO_FCRDNS,
        NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


Hello Roland,

You're correct, a Linux machine should never crash.  Would it be 
possible for you to take a screen capture of the CONSOLE screen of the 
machine you kill kissattach on?  To get to this view (depending on your 
Linux distribution), you would hit the control-alt-F1 key or say 
control-alt-F3 on say Ubuntu 20.04 to see a text only login console 
(VTY).  At that point, remotely log into the machine running kissattach 
via SSH and then kill the kissattach process.

After you can observe the kernel panic screen in the text CLI view, you 
will need to enable kernel panic debugging.  One example of this for 
u20.04 is here:

    https://ubuntu.com/server/docs/kernel-crash-dump

--David
KI6ZHD


On 03/06/2022 06:18 AM, Roland Schwarz wrote:
> Dear All,
>
> please correct me if I am wrong, but as I understand it should not be 
> possible to trigger a kernel freeze by just killing user space processes.
>
> While trying to understand a certain behavior of the ax25 driver I 
> came up with a small test case which I ran in a virtual machine (KVM):
>
> First I tried with a kernel from Linus tree:
>
> uname -r
> 5.17.0-rc6+
>
> cat /etc/ax25/axports
> ax0     OE1RSA-0        115200  255     7       Test A
> ax1     OE1RSA-1        115200  255     7       Test B
>
> sudo kissattach /dev/ptmx ax0
> AX.25 port ax0 bound to device ax0
> Awaiting client connects on
> /dev/pts/1
>
> sudo kissattach /dev/pts/1 ax1
> AX.25 port ax1 bound to device ax1
>
> axcall ax1 OE1RSA-0
>
> Now in a second terminal:
> sudo killall kissattach
>
> First terminal:
> GW4PTS AX.25 Connect v1.11
> Trying...
> *** Connected to OE1RSA-0
> *** Cleared
>
> ==> But: Kernel freezes
>
> I can see this behaviour also in the debian kernel:
>
> uname -r
> 5.10.0-11-amd64
>
> This kernel also freezes. I suspect this to be a bug because if I try 
> to reboot the machine instead of the killall command the machine does 
> not shut off and reboot which is a problem with a remotely installed 
> system.
>
> Any ideas?
>
> 73 de Roland oe1rsa
>

