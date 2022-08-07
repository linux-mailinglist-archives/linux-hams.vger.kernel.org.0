Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7523758BCA3
	for <lists+linux-hams@lfdr.de>; Sun,  7 Aug 2022 21:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiHGTHO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hams@lfdr.de>); Sun, 7 Aug 2022 15:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiHGTHO (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 7 Aug 2022 15:07:14 -0400
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77876643A
        for <linux-hams@vger.kernel.org>; Sun,  7 Aug 2022 12:07:12 -0700 (PDT)
X-Envelope-From: thomas@osterried.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 277J78MM4001616
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Sun, 7 Aug 2022 21:07:09 +0200
Received: from x-berg.in-berlin.de ([217.197.86.42] helo=smtpclient.apple)
        by x-berg.in-berlin.de with esmtpa (Exim 4.94.2)
        (envelope-from <thomas@osterried.de>)
        id 1oKlcC-00004x-Cs; Sun, 07 Aug 2022 21:07:08 +0200
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: Resend : [PATCH] AX25 rose_call - replacing carriage return by
 newlines
From:   Thomas Osterried <thomas@osterried.de>
In-Reply-To: <d3e987ef-2c6d-4ae4-9b58-75d25f7793c2@free.fr>
Date:   Sun, 7 Aug 2022 21:07:07 +0200
Cc:     linux-hams@vger.kernel.org, Francois Romieu <romieu@fr.zoreil.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <ABFC096C-8F65-49C9-8BB9-7B75B3CE30B7@osterried.de>
References: <d5e93cc7-a91f-13d3-49a1-b50c11f0f811@free.fr>
 <YucgpeXpqwZuievg@electric-eye.fr.zoreil.com>
 <A9A8A0B7-5009-4FB0-9317-5033DE17E701@osterried.de>
 <Yuf04XIsXrQMJuUy@electric-eye.fr.zoreil.com>
 <d3e987ef-2c6d-4ae4-9b58-75d25f7793c2@free.fr>
To:     f6bvp <f6bvp@free.fr>
X-Mailer: Apple Mail (2.3696.100.31)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello,

I don't think netev@ is the right addressee here. netdev is for kernel, not for userspace programs like telnet, libreoffice or X11. Or am I wrong? I removed netdev from the list of receipients.


Your patch makes things bad.
Reason: see man page:

       ax25_call, netrom_call, rose_call and tcp_call establish an AX.25, NET/ROM, ROSE or
       a TCP connection in a manner suitable for calling from  either  the  ax25d  program
       directly,  or  from the node program as an external command. By setting the command
       line arguments appropriately it is possible to set the local  callsign  from  which
       the call will be made. No translation of the end of lines is performed by this pro‐
       gram.


Explanation:
EOL convention in PacketRadio is '\r'. Not '\n', and not '\r\n'. There's no algorithm possible for autodetection - so many people have tried over the years, all have failed.
The last sentense, "No translation of the end of lines is performed by this program." is important; it explains the purpose of the program and why it is implemented this way.

The sense of ax25_call is, for example, that it is called from ax25d (i.e. if user connects you to -10, you might pass the connection over to your local mailbox in the LAN).
Same for netrom_call, rose_call.
These commands are not intended for a unix user to be executed directly on the shell. That's why they reside in /usr/sbin.

If the program is used as intended, but with your changes, the packet-radio-user sees now in his terminal:
===
Connecting to %s @ %s ...[linefeed]
                        *** Connected[linefeed]
                                               Hello user xy, welcome to our BBS.
Last login...
mailboxprompt> [linefeed]
               *** Disconnected[linefeed]
===

=> his session is messed up.


Users from shell normally use the call command, which does the correct EOL conversion.


If you have a special usecase, that's out of the scope of the current demands, you may implement a comandline option for changing the EOL character behavior.
But rose_call becomes with such an addition more and more like call. I see no reason why this is useful.

Apart from EOL in the messages, you implemented an EOL-changer for the input buffer.
You missed implementing an EOL changer for what unix user enters (normaly, his lines end with \n): Unix users press enter and don't know, that they have to enter ^M so that remote side understands your line correctly.



A site note on your remark
> However once connected rose_call displays remote message without linefeed. Consequently it is impossible to read messages.

If the remote site is using a software that does not behave like a normal packet-radio-software,
then you could either try to change all client terminal softwares in the world and make \n the new EOL standard,
or please the remote site to correct the EOL according to what's everywhere else used in the packet-radio world.


..and one comment inline:

> Am 07.08.2022 um 20:21 schrieb f6bvp <f6bvp@free.fr>:
> 
> [PATCH] AX25 rose_call - replacing carriage return by newlines
> 
> Previous patch was reversed... resending correct one.
> 
> I have been using intensively rose_call application (part of ax25tools/user_call library) while debugging rose connect issue.
> 
> However once connected rose_call displays remote message without linefeed. Consequently it is impossible to read messages.
> 
> For example calling local node :
> 
> # rose_call rose0 f6bvp f6bvp-4 2080175524
> Connecting to f6bvp-4 @ 2080175524 ...
> 
> *** Connected
> 
> F6BVP-4 (Commands = ?) : Aug  5 2022) for LINUX (help = h)
> 
> 
> Then issuing command P to the connected local node, all answer
> lines are superimposed.
> 
> F6BVP-4 (Commands = ?) : Switch Port
> 
> 
> Now with the proposed patch is the complete info displayed:
> 
> # ./rose_call rose0 f6bvp f6bvp-4 2080175524
> 
> Connecting to f6bvp-4 @ 2080175524 ...
> 
> *** Connected
> 
> User call : F6BVP-0
> 
> Welcome to the last release of Fpac!
> 
> This file is fpac.hello and is displayed when
> 
> a user connects to the node.

I see

many more

newlines.

> 
> 
> 
> FPAC-Node v 4.1.3 (built Aug  5 2022) for LINUX (help = h)
> 
> F6BVP-4 (Commands = ?) :
> 
> 
> In file rose_call.c carriage returns are also replaced by newlines
> in order to let error messages to be correctly displayed.
> 
> Cc: Thomas DL9SAU Osterried <thomas@osterried.de>
> Cc: Francois Romieu <romieu@fr.zoreil.com>
> Signed-off-by: Bernard Pidoux <f6bvp@free.fr>
> 
> <replace_return-linefeed_in_rose_call.patch>


vy 73,
      - Thomas  dl9sau
