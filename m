Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3740258C864
	for <lists+linux-hams@lfdr.de>; Mon,  8 Aug 2022 14:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234545AbiHHMbm (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 8 Aug 2022 08:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237479AbiHHMbj (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 8 Aug 2022 08:31:39 -0400
Received: from shiva-su2.sorbonne-universite.fr (shiva-su2.sorbonne-universite.fr [134.157.0.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 51FD7655A
        for <linux-hams@vger.kernel.org>; Mon,  8 Aug 2022 05:31:37 -0700 (PDT)
Received: from nirriti.ent.upmc.fr (nirriti.dsi.upmc.fr [134.157.0.215])
        by shiva-su2.sorbonne-universite.fr (Postfix) with ESMTP id 9230240FF1ED;
        Mon,  8 Aug 2022 14:31:35 +0200 (CEST)
Received: from [44.168.19.21] (lfbn-idf1-1-596-24.w86-242.abo.wanadoo.fr [86.242.59.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pidoux)
        by nirriti.ent.upmc.fr (Postfix) with ESMTPSA id 231BD13FF8FF5;
        Mon,  8 Aug 2022 14:31:36 +0200 (CEST)
Message-ID: <71e52ce6-438c-8a90-6241-f6c3409fab8d@free.fr>
Date:   Mon, 8 Aug 2022 14:31:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Resend : [PATCH] AX25 rose_call - replacing carriage return by
 newlines
Content-Language: en-US
To:     Thomas Osterried <thomas@osterried.de>
Cc:     linux-hams@vger.kernel.org, Francois Romieu <romieu@fr.zoreil.com>,
        David Ranch <dranch@trinnet.net>, F3KT <f3kt@free.fr>,
        Eric Dumazet <edumazet@google.com>, k4gbb1@embarqmail.com,
        Woldanski Lee <ve7fet@tparc.org>
References: <d5e93cc7-a91f-13d3-49a1-b50c11f0f811@free.fr>
 <YucgpeXpqwZuievg@electric-eye.fr.zoreil.com>
 <A9A8A0B7-5009-4FB0-9317-5033DE17E701@osterried.de>
 <Yuf04XIsXrQMJuUy@electric-eye.fr.zoreil.com>
 <d3e987ef-2c6d-4ae4-9b58-75d25f7793c2@free.fr>
 <ABFC096C-8F65-49C9-8BB9-7B75B3CE30B7@osterried.de>
From:   f6bvp <f6bvp@free.fr>
In-Reply-To: <ABFC096C-8F65-49C9-8BB9-7B75B3CE30B7@osterried.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
        NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NEUTRAL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hi Thomas,

Many thanks for providing your feelings about what I have done.

I understand you don't want to change old AX.25 tools that are 
convenient for packet radio.

No problem.

As I needed a simple user application to connect ROSE network I will 
still use my application for rose kernel module debugging.

"call" is a multi protocol application that is working for AX25 or 
Netrom but does abolutely not work for rose as it is quite buggy.

This is why I preferred to adapt rose_call that is a single protocol 
simple application.

I already repaired rose module in (net-next kernel 5.19+) that had been 
broken by a patch applied two years ago without any user checking. Very 
bad behavior indeed from AX25 and ROSE so called maintainers. Reverting 
the patch did the job. Without all rose users have to keep using 5.4.79 
kernel.

I spend the last hours to repair call application and rose protocol is 
now working. However it will take a few days to certify the whole.

73 de Bernard, f6bvp / ai7bg

link to commit :

https://lore.kernel.org/all/20201119191043.28813-1-anmol.karan123@gmail.com/

link to call screen image
http://f6bvp.org/call_screen.png


Le 07/08/2022 à 21:07, Thomas Osterried a écrit :
> Hello,
> 
> I don't think netev@ is the right addressee here. netdev is for kernel, not for userspace programs like telnet, libreoffice or X11. Or am I wrong? I removed netdev from the list of receipients.
> 
> 
> Your patch makes things bad.
> Reason: see man page:
> 
>         ax25_call, netrom_call, rose_call and tcp_call establish an AX.25, NET/ROM, ROSE or
>         a TCP connection in a manner suitable for calling from  either  the  ax25d  program
>         directly,  or  from the node program as an external command. By setting the command
>         line arguments appropriately it is possible to set the local  callsign  from  which
>         the call will be made. No translation of the end of lines is performed by this pro‐
>         gram.
> 
> 
> Explanation:
> EOL convention in PacketRadio is '\r'. Not '\n', and not '\r\n'. There's no algorithm possible for autodetection - so many people have tried over the years, all have failed.
> The last sentense, "No translation of the end of lines is performed by this program." is important; it explains the purpose of the program and why it is implemented this way.
> 
> The sense of ax25_call is, for example, that it is called from ax25d (i.e. if user connects you to -10, you might pass the connection over to your local mailbox in the LAN).
> Same for netrom_call, rose_call.
> These commands are not intended for a unix user to be executed directly on the shell. That's why they reside in /usr/sbin.
> 
> If the program is used as intended, but with your changes, the packet-radio-user sees now in his terminal:
> ===
> Connecting to %s @ %s ...[linefeed]
>                          *** Connected[linefeed]
>                                                 Hello user xy, welcome to our BBS.
> Last login...
> mailboxprompt> [linefeed]
>                 *** Disconnected[linefeed]
> ===
> 
> => his session is messed up.
> 
> 
> Users from shell normally use the call command, which does the correct EOL conversion.
> 
> 
> If you have a special usecase, that's out of the scope of the current demands, you may implement a comandline option for changing the EOL character behavior.
> But rose_call becomes with such an addition more and more like call. I see no reason why this is useful.
> 
> Apart from EOL in the messages, you implemented an EOL-changer for the input buffer.
> You missed implementing an EOL changer for what unix user enters (normaly, his lines end with \n): Unix users press enter and don't know, that they have to enter ^M so that remote side understands your line correctly.
> 
> 
> 
> A site note on your remark
>> However once connected rose_call displays remote message without linefeed. Consequently it is impossible to read messages.
> 
> If the remote site is using a software that does not behave like a normal packet-radio-software,
> then you could either try to change all client terminal softwares in the world and make \n the new EOL standard,
> or please the remote site to correct the EOL according to what's everywhere else used in the packet-radio world.
> 
> 
> ..and one comment inline:
> 
>> Am 07.08.2022 um 20:21 schrieb f6bvp <f6bvp@free.fr>:
>>
>> [PATCH] AX25 rose_call - replacing carriage return by newlines
>>
>> Previous patch was reversed... resending correct one.
>>
>> I have been using intensively rose_call application (part of ax25tools/user_call library) while debugging rose connect issue.
>>
>> However once connected rose_call displays remote message without linefeed. Consequently it is impossible to read messages.
>>
>> For example calling local node :
>>
>> # rose_call rose0 f6bvp f6bvp-4 2080175524
>> Connecting to f6bvp-4 @ 2080175524 ...
>>
>> *** Connected
>>
>> F6BVP-4 (Commands = ?) : Aug  5 2022) for LINUX (help = h)
>>
>>
>> Then issuing command P to the connected local node, all answer
>> lines are superimposed.
>>
>> F6BVP-4 (Commands = ?) : Switch Port
>>
>>
>> Now with the proposed patch is the complete info displayed:
>>
>> # ./rose_call rose0 f6bvp f6bvp-4 2080175524
>>
>> Connecting to f6bvp-4 @ 2080175524 ...
>>
>> *** Connected
>>
>> User call : F6BVP-0
>>
>> Welcome to the last release of Fpac!
>>
>> This file is fpac.hello and is displayed when
>>
>> a user connects to the node.
> 
> I see
> 
> many more
> 
> newlines.
> 
>>
>>
>>
>> FPAC-Node v 4.1.3 (built Aug  5 2022) for LINUX (help = h)
>>
>> F6BVP-4 (Commands = ?) :
>>
>>
>> In file rose_call.c carriage returns are also replaced by newlines
>> in order to let error messages to be correctly displayed.
>>
>> Cc: Thomas DL9SAU Osterried <thomas@osterried.de>
>> Cc: Francois Romieu <romieu@fr.zoreil.com>
>> Signed-off-by: Bernard Pidoux <f6bvp@free.fr>
>>
>> <replace_return-linefeed_in_rose_call.patch>
> 
> 
> vy 73,
>        - Thomas  dl9sau
