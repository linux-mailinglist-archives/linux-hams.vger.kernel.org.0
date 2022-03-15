Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B58D34DA624
	for <lists+linux-hams@lfdr.de>; Wed, 16 Mar 2022 00:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348841AbiCOXQn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hams@lfdr.de>); Tue, 15 Mar 2022 19:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236985AbiCOXQn (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 15 Mar 2022 19:16:43 -0400
Received: from yagi.h-net.msu.edu (yagi.h-net.msu.edu [35.9.18.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 63D6646644
        for <linux-hams@vger.kernel.org>; Tue, 15 Mar 2022 16:15:30 -0700 (PDT)
Received: from yagi.h-net.org (unknown [127.0.0.1])
        by yagi.h-net.msu.edu (Postfix) with ESMTP id BC71728C098
        for <linux-hams@vger.kernel.org>; Tue, 15 Mar 2022 19:15:29 -0400 (EDT)
X-Virus-Scanned: amavisd-new at example.com
Received: from yagi.h-net.msu.edu ([127.0.0.1])
        by yagi.h-net.org (yagi.h-net.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vx3-eaMh_67p for <linux-hams@vger.kernel.org>;
        Tue, 15 Mar 2022 19:15:29 -0400 (EDT)
Received: from yagi.h-net.org (localhost [127.0.0.1])
        by yagi.h-net.msu.edu (Postfix) with ESMTP
        for <linux-hams@vger.kernel.org>; Tue, 15 Mar 2022 19:15:29 -0400 (EDT)
References: <13d4710d-03cc-66e2-e6a4-f7da4b00ca92@trinnet.net> <20220315213245.3304328BA6B@yagi.h-net.msu.edu>
To:     linux-hams@vger.kernel.org
From:   Dennis Boone <drb@msu.edu>
Subject: Re: Loss of connection state?
In-reply-to: (Your message of Tue, 15 Mar 2022 15:35:27 -0700.)
             <13d4710d-03cc-66e2-e6a4-f7da4b00ca92@trinnet.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <65056.1647386129.1@yagi.h-net.org>
Content-Transfer-Encoding: 8BIT
Date:   Tue, 15 Mar 2022 19:15:29 -0400
Message-Id: <20220315231529.BC71728C098@yagi.h-net.msu.edu>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

David,

 > I bet this link is more marginal that you might be expecting and I've
 > seen many examples of this.  Best I can tell is the remote TNC cannot
 > decode your packets and you're getting into a retry spiral. Is it
 > correct to assume you're using a Nino TNC on your side?  Is it
 > operating in KISS mode or it's new IL2P mode?  Do you know what kinda
 > of TNC is on the remote side?

Mine _is_ a Nino TNC, they only do kiss, and it's in 1200 baud AX.25
mode, not IL2P and not GMSK.

I believe the other end is a DR-135 with the EJ-41U add-in TNC.

 > As I understand it, the RRv1 should be ACKing the two previous data
 > frames for I00 and I01 but it seems that KB8ZQZ isn't decoding that
 > "RRv1" ACK and it's asking for for a retry at 01:48.29 and then
 > 2:08.77.  It seems your station is hearing the NAK but it's not
 > re-sending the ACK.  It's also strange the remote station isn't
 > re-sending the I00 and I01 frames.  What are your TNC's T1/T2/T3
 > timers and window size set to?  Try this script:

I think the RR1v ("ready to receive 1", response, doesn't have the p/f
bit set) only acks the I00^ I sent.

Not sure I understand how the frame could come through the TNC, up the
USB channel, and into the kernel to the point where axlisten can see it,
and it could be failing to decode.

The question arises when I receive his:

    nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:02:20.726051 

At this point, since I've already sent I01, and he's still clearly
waiting for it, why don't I resend it?

Also, the RR1v arrives at 01:38.125616, and I wait a suspiciously
familiar 10 seconds (T1/FRACK?) before sending the sending the RR0+ at
01:48.296217.  But if T1 expired, shouldn't I be re-sending the I01
frame?

I _had_ been interpreting most of the rest of the RRx frames as idle
polls, but I can see where that may have been erroneous and they could
be getting lost.  I don't _think_ that explains why I don't resend I01
after I get RR1 from him.

 > http://www.trinityos.com/HAM/CentosDigitalModes/usr/local/sbin/axdispparms.sh

AX.25 Device Parameters
Parameters for device ax0
Default AX.25 mode             : Standard (Modulo 7)
AX.25 Backoff Mode             : Linear
AX.25 Connection Mode          : All
Standard Window Size           : 2
Extended Window Size           : 32
Maximum Packet Length          : 256 bytes
Maximum Retry Count            : 10
Default IP Mode                : Datagram
T1 Timeout (Frack)             : 10.0 seconds
T2 Timeout (Resp)              : 3.0 seconds
T3 Timeout (Check)             : 5 minutes
Idle Timeout (Disc)            : None

De
