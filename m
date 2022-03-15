Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94E944DA574
	for <lists+linux-hams@lfdr.de>; Tue, 15 Mar 2022 23:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237247AbiCOWgm (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 15 Mar 2022 18:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352272AbiCOWgl (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 15 Mar 2022 18:36:41 -0400
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0ECF15C856
        for <linux-hams@vger.kernel.org>; Tue, 15 Mar 2022 15:35:28 -0700 (PDT)
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 22FMZRlC018246;
        Tue, 15 Mar 2022 14:35:27 -0800
Subject: Re: Loss of connection state?
To:     drb@msu.edu, linux-hams@vger.kernel.org
References: <20220315213245.3304328BA6B@yagi.h-net.msu.edu>
From:   David Ranch <linux-hams@trinnet.net>
Message-ID: <13d4710d-03cc-66e2-e6a4-f7da4b00ca92@trinnet.net>
Date:   Tue, 15 Mar 2022 15:35:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20220315213245.3304328BA6B@yagi.h-net.msu.edu>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Tue, 15 Mar 2022 14:35:27 -0800 (GMT+8)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


Hello Denis,

> Here's an axlisten dump of an incoming ax25 session.  The path between
> my station (KB8ZQZ) and the other end (W8TCC) is a little marginal, and
> some packets are occasionally lost.

I bet this link is more marginal that you might be expecting and I've 
seen many examples of this.  Best I can tell is the remote TNC cannot 
decode your packets and you're getting into a retry spiral. Is it 
correct to assume you're using a Nino TNC on your side?  Is it operating 
in KISS mode or it's new IL2P mode?  Do you know what kinda of TNC is on 
the remote side?


> Once my end received the RR1+ at 21:02:20, should it not have resent the
> I01 packet?  Is this bug in my understanding, or in the linux kernel?

As I understand it, the RRv1 should be ACKing the two previous data 
frames for I00 and I01 but it seems that KB8ZQZ isn't decoding that 
"RRv1" ACK and it's asking for for a retry at 01:48.29 and then 
2:08.77.  It seems your station is hearing the NAK but it's not 
re-sending the ACK.  It's also strange the remote station isn't 
re-sending the I00 and I01 frames.  What are your TNC's T1/T2/T3 timers 
and window size set to?   Try this script:

http://www.trinityos.com/HAM/CentosDigitalModes/usr/local/sbin/axdispparms.sh

My system reports:
--
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
--


> nino: fm W8TCC to KB8ZQZ ctl SABM+ 21:01:33.281614
> nino: fm KB8ZQZ to W8TCC ctl UA- 21:01:33.306663
> nino: fm KB8ZQZ to W8TCC ctl I00^ pid=F0(Text) len 70 21:01:33.320522
> 0000  P2P only; note that if I can't reach you direct, I cannot respon
> 0040  d P2PM
> nino: fm KB8ZQZ to W8TCC ctl I01+ pid=F0(Text) len 55 21:01:33.341994
> 0000  ;FW: KB8ZQZM[Pat-0.12.1-B2FHMG$]M; W8TCC DE KB8ZQZ ()>M
> nino: fm W8TCC to KB8ZQZ ctl RR1v 21:01:38.125616
> nino: fm KB8ZQZ to W8TCC ctl RR0+ 21:01:48.296217
> nino: fm KB8ZQZ to W8TCC ctl RR0+ 21:02:08.775673
> nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:02:20.726051
> nino: fm KB8ZQZ to W8TCC ctl RR0- 21:02:20.734985
> nino: fm KB8ZQZ to W8TCC ctl RR0+ 21:02:39.495671
> nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:03:05.669523
> nino: fm KB8ZQZ to W8TCC ctl RR0- 21:03:05.678565
> nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:03:12.782127
> nino: fm KB8ZQZ to W8TCC ctl RR0- 21:03:12.791099
> nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:03:17.868836
> nino: fm KB8ZQZ to W8TCC ctl RR0- 21:03:17.879992
> nino: fm KB8ZQZ to W8TCC ctl RR0+ 21:03:20.454989
> nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:03:25.586093
> nino: fm KB8ZQZ to W8TCC ctl RR0- 21:03:25.599152
> nino: fm W8TCC to KB8ZQZ ctl RR1+ 21:03:30.669941
> nino: fm KB8ZQZ to W8TCC ctl RR0- 21:03:30.679536
> nino: fm W8TCC to KB8ZQZ ctl DMv 21:03:38.636458
>
> (Scattered stray M characters were reverse video in the color original,
> representing carriage returns.  Don't think that's relevant here.)


Just for clarity sake, here is a working connection:
--
d710: fm KI6ZHD to K6FB-7 ctl SABM+ 14:12:54.248229
d710: fm K6FB-7 to KI6ZHD ctl UA- 14:12:56.298294
d710: fm K6FB-7 to KI6ZHD ctl I00^ pid=F0(Text) len 80 14:12:57.048799
###CONNECTED TO NODE K6FB-7(K6FB-1) CHANNEL A
ENTER COMMAND: B,C,J,N, or Help ?
d710: fm KI6ZHD to K6FB-7 ctl RR1v 14:13:00.119778
d710: fm KI6ZHD to K6FB-7 ctl I10^ pid=F0(Text) len 5 14:13:05.152216
htlp
d710: fm K6FB-7 to KI6ZHD ctl I11^ pid=F0(Text) len 34 14:13:08.086481
ENTER COMMAND: B,C,J,N, or Help ?
d710: fm KI6ZHD to K6FB-7 ctl I21^ pid=F0(Text) len 5 14:13:10.458632
help
d710: fm K6FB-7 to KI6ZHD ctl I22^ pid=F0(Text) len 128 14:13:13.134070
ABORT           STOP A CONNECTION IN PROGRESS
B(ye)           NODE WILL DISCONNECT
C(onnect) call  CONNECT TO callsign
C call S(
d710: fm K6FB-7 to KI6ZHD ctl I23^ pid=F0(Text) len 128 14:13:14.124312
tay)   STAY CONNECTED TO NODE WHEN END DISCONNECTS
J(heard)        CALLSIGNS WITH DAYSTAMP
J S(hort)       HEARD CALLSIGNS ONLY
d710: fm K6FB-7 to KI6ZHD ctl I24^ pid=F0(Text) len 128 14:13:15.098860
J L(ong)        CALLSIGNS WITH DAYSTAMP AND VIAS
N(odes)         HEARD NODE CALLSIGNS WITH DAYSTAMP
N S(hort)       NODE CALLSIG
d710: fm K6FB-7 to KI6ZHD ctl I25^ pid=F0(Text) len 96 14:13:15.833518
NS ONLY
N L(ong)        NODE CALLSIGNS WITH DAYSTAMP AND VIAS
ENTER COMMAND: B,C,J,N, or Help ?
d710: fm KI6ZHD to K6FB-7 ctl RR6v 14:13:16.243762
--

--David
KI6ZHD
