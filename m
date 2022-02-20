Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23C2F4BCDBD
	for <lists+linux-hams@lfdr.de>; Sun, 20 Feb 2022 11:21:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240058AbiBTJYI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hams@lfdr.de>); Sun, 20 Feb 2022 04:24:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbiBTJYH (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 20 Feb 2022 04:24:07 -0500
X-Greylist: delayed 328 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 20 Feb 2022 01:23:45 PST
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B13F9377E9
        for <linux-hams@vger.kernel.org>; Sun, 20 Feb 2022 01:23:45 -0800 (PST)
X-Envelope-From: thomas@osterried.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 21K9IEgX005239
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Sun, 20 Feb 2022 10:18:14 +0100
Received: from x-berg.in-berlin.de ([217.197.86.42] helo=smtpclient.apple)
        by x-berg.in-berlin.de with esmtpa (Exim 4.94.2)
        (envelope-from <thomas@osterried.de>)
        id 1nLiM9-0002G1-To; Sun, 20 Feb 2022 10:18:13 +0100
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [AX25] unreleased sockets after disconnecting
From:   Thomas Osterried <thomas@osterried.de>
In-Reply-To: <207b1242-dfb9-1832-c7f6-c4602ad2e9e6@free.fr>
Date:   Sun, 20 Feb 2022 10:18:13 +0100
Cc:     linux-hams@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <6D71ECB7-775D-4D98-B856-C48B88E4DF7C@osterried.de>
References: <4B2CD772.1030106@upmc.fr> <4B2D1025.1020106@gmail.com>
 <4B2E6729.1090102@free.fr> <4B507FAA.8010007@free.fr>
 <20100115203654.GA3084@del.dom.local> <4DFA6A59.2000709@free.fr>
 <581f0c8e-f4fb-523d-df6e-7a973b506c34@sorbonne-universite.fr>
 <207b1242-dfb9-1832-c7f6-c4602ad2e9e6@free.fr>
To:     "Bernard Pidoux , f6bvp" <f6bvp@free.fr>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org



> Am 06.02.2022 um 22:12 schrieb Bernard Pidoux , f6bvp <f6bvp@free.fr>:
> 
> For long time it as been reported by many AX.25 users that connexions were precluded after terminating a connexion with a remote station.
> 
> Some hamradio maintainers have been pretending not to be aware of such issue for lacking proofs.

The problem is known. Iirc correctly, we have seen some approaches over the years to fix this issue. The last one I'd like to discuss is by YO2LOJ
(Subject "NET/ROM bug fix from YO2LOJ?" in this list):

That patch is against the problem, that disconnected sessions still are listet, in "LISTENING" state'.

I'm not sure if it is exactly your problem, because in your /proc/net/ax25 example, those sessions seem to belong to iface "???" instead of "ax0".

I can reproduce (testet last week) is the following:
boot
configure ax25 iface
no userspace process started
connect from outside
disconnect from outside
-> 
netstat --ax25 shows that session in LISTEN state. In contrast to your output, it refers to the interface (not to "???").


The problem with the patch is, we observed a new, in my opinion unliked, behavior:
now a new connection is disconnected instantly (as long as no userspace daemon is listening).
But there are protocols like "IP mode VC" need to be able to connect, even when no userspace daemon is running.

> I must restart my packet radio FPAC node (AX.25, ROSE and NetRom protocoles) every other hour in order to let connexions available again for neighbours.

Perhaps you could try YO2LOJ's kernel patch and test if it helps for your urgent problem, or if there's another problem in the session-cleanup code.

> Here are some evidence from cat  /proc/net/ax25 showing old remnants of connexions presumably there for ax25 sockets were not released.
> 
> 73 de Bernard, f6bvp

vy 73,
	- Thomas  dl9sau
