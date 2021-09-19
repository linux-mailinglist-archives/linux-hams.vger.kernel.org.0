Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBBE410C23
	for <lists+linux-hams@lfdr.de>; Sun, 19 Sep 2021 17:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhISPYG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hams@lfdr.de>); Sun, 19 Sep 2021 11:24:06 -0400
Received: from trinity.trinnet.net ([96.78.144.185]:4143 "EHLO
        trinity3.trinnet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbhISPYF (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 19 Sep 2021 11:24:05 -0400
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS Hardened/TrinityOS Hardened) with ESMTP id 18JFM4Uh014100;
        Sun, 19 Sep 2021 07:22:04 -0800
Subject: Re: AX25 disconnect patch and ROSE socket failure
To:     Dave van der Locht <d.vanderlocht@gmail.com>,
        "Bernard Pidoux , f6bvp" <f6bvp@free.fr>
References: <8b7a1545-3631-b62d-6430-4a51652023ba@free.fr>
 <CAH4uzPPVfYnRzGH5OTL6JX7JC64sY5XSsurHBLt=EOV+EPbJ2A@mail.gmail.com>
 <45792400-294f-b496-9c7e-679d19614884@free.fr>
 <CAH4uzPPtsgz8tnQXwukDVL7=_pgfnK8OS+J8tdHBnsnJE1m5kw@mail.gmail.com>
Cc:     Brian <n1uro@n1uro.com>, Cathryn Mataga <cathryn@junglevision.com>,
        linux-hams@vger.kernel.org,
        =?UTF-8?Q?Ralf_B=c3=a4chle_DL5RB?= <ralf@linux-mips.org>,
        David Miller <davem@davemloft.net>,
        Dmitry Vyukov <dvyukov@google.com>,
        Thomas Osterried <thomas@osterried.de>,
        Charles Schuman <k4gbb1@gmail.com>,
        Richard Stearn <richard@rns-stearn.co.uk>,
        Basil Gunn <basil@pacabunga.com>
From:   David Ranch <linux-hams@trinnet.net>
Message-ID: <ca4f0c90-53e6-24e8-9a51-f079d6da574c@trinnet.net>
Date:   Sun, 19 Sep 2021 08:22:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAH4uzPPtsgz8tnQXwukDVL7=_pgfnK8OS+J8tdHBnsnJE1m5kw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Sun, 19 Sep 2021 07:22:05 -0800 (GMT+8)
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


Actually, if you look at the linux-hams@vger.kernel.org archives, you'll 
see some recent kernel patches submitted by Ralf for some issues:

https://marc.info/?l=linux-hams&w=2&r=1&s=Baechle&q=a

The issue I see is that I don't see any acknowledgement and "approved" 
replies showing that the diffs are making into the mainline sources.  
Maybe they are making it in and I just don't see those responses from 
say David Miller, etc. for other commits that come in through this email 
alias.  The other challenge is that the fixes Ralf is submitting aren't 
the big issues we're facing today. I'm talking about bugs like the 
hung-after-disconnect AX.25 connections issue, minor AX.25 packet loss 
issues, etc.  I think all of us want to see those get fixed first.

--David
KI6ZHD



On 09/19/2021 05:41 AM, Dave van der Locht wrote:
> Hi Bernard,
>
> Not sure about Ralf's current involvement with Linux Hamradio but he
> isn't completely disappeared from the radars. Recently I had some
> conversations with him regarding the stuck sockets bug and a security
> issue I noticed with kernel 5.4 and up where NETROM frames are stuffed
> with random fragments of data from memory. After a couple of messages
> back and forward it went completely silent unfortunately, same like
> with the stuck sockets bugs.
>
> I agree on your thoughts about the maintainer succession, but who's
> able, willing and having time to do so?
> Currently it's getting only worser and worser for some years and even
> security flaws don't seem to be taken serious while they should. Makes
> me wondering if there's still anyone involved with Linux Hamradio
> development at all except for Ralf (if he stil is...).
>
> 73! Dave
>
> Op zo 19 sep. 2021 om 13:37 schreef Bernard Pidoux , f6bvp <f6bvp@free.fr>:
>> Hi Dave,
>>
>> Ralf seems to have disappeared from Linux Hamradio (AX25, NetRom, Rose) radars.
>>
>> Read this :
>>
>> https://marc.info/?l=linux-hams&m=162655590320801&w=2
>>
>> I read that MIPS company is no longer in activity and that Ralf had hardware issues.
>>
>> Anyhow Ralf never tried to survey ROSE protocole while kernel evolved and it is now stuck since 5.4 kernels.
>>
>> This is very bad for ROSE/FPAC is used in emergency radio network in Florida (for example).
>>
>> Perhaps it is time someone applies for Hamradio Linux Hamradio maintainer succession that will save Linux hamradio net from splashdown ?
>>
>>
>> 73 de Bernard, f6bvp
>>
>> http://radiotelescope-lavillette.fr/
>> http://f6bvp.org
>>
>>
>> Le 06/09/2021 à 12:49, Dave van der Locht a écrit :
>>
>> Hi Bernard,
>>
>> A patch for the AX25 socket issue is there for some years now. Already
>> talked with several others like Brian (N1URO) about the issue/patch
>> but for some reason that particular patch has been rejected multiple
>> times now. Although I asked Ralf about it I'm not getting any concrete
>> answer about it and nobody seems to know why... Very strange things,
>> but the HAM stack's shape is getting worser and worser it seems. While
>> structural problems, where a seemingly good solution is available,
>> won't get fixed... Very frustrating to see there's not taken care
>> about that part of the Linux kernel by the linux-hams anymore like it
>> seems.
>>
>> As far as I know Ralf is still the AX25 maintainer for the Linux
>> kernel, but maybe I've missed something lately. Hopefully he's (still)
>> able and willing to help us all. I know another HAM (forgot his
>> name/callsign) is seriously trying to get things done and resolved
>> another way around by trying to get another kernel developer involved,
>> even when he needs to be payed. Not only to resolve already known
>> issues, but also to make the complete HAM stack more up2date than it
>> currently is regarding 'new' techniques/protocols/specifications.
>>
>> About the ROSE issue in 5.10 kernels... I'm not aware of any issues
>> there but unfortunately it's completely in-line with the HAM stack
>> getting more and more problematic. The complete HAM stack needs
>> attention regarding several issues in drivers and modules that aren't
>> solved or came in the last decade or so.
>>
>> 73! Dave
>>
>>
>>
>> Op zo 5 sep. 2021 om 23:19 schreef Bernard Pidoux , f6bvp <f6bvp@free.fr>:
>>
>> Hi Dave,
>>
>> I have been away from AX25 and ROSE job for a long time.
>>
>> I read this thread about AX25 bug and was please to see that there was a patch.
>>
>> It should be interesting to commit this long awaited AX25 bug disconnect removal.
>>
>> It seems that Ralf has resigned from AX25 maintener task.
>>
>> Someone should replace him in order to start again some good work on AX25.
>>
>> By the way, I would like to know if you are aware of a ROS socket failure with 5.x kernels ?
>>
>> 5.4.79 is ok but 5.10 is not and I will try to figure out when it failed.
>>
>> List:       linux-hams
>> Subject:    Re: Status of the stuck sockets bugs.
>> From:       Dave van der Locht <d.vanderlocht () gmail ! com>
>> Date:       2021-07-24 6:44:38
>> Message-ID: CAH4uzPPniVbXfTvs4PyXiPDa5G+xUvCjQzEzDktDSrg-v7oXAg () mail ! gmail ! com
>> [Download RAW message or body]
>>
>> Hi Ralf,
>>
>> It can be reproduced very easily without the need / setup of a TNC.
>> Just an AX.25 over UDP link to another pretty minimal system and using
>> NETROM is enough. Create a NETROM connection, disconnect or let it
>> disconnect due to idle and see what's happening with the sockets.
>>
>> Not sure where it started occuring as it is there for years already, I
>> thought it was somewhere around 4.4.23 or 4.9.23 and personally I
>> haven't seen it working correctly without patches ever since. It seems
>> like a 100% hit to go wrong which makes me wonder why you haven't seen
>> the issue on your own system.
>>
>> Bottom line, many others are having and reporting the exact same issue
>> in the past years. A working fix seems to be available, without side
>> effects (as far as I've seen), but isn't comitted yet or solved
>> otherwise.
>> I hope someone's willing and able to do 1 of those, It would help many
>> packetradio enthousiasts.
>>
>> Kind regards,
>> Dave van der Locht
>>
>> Regards de Bernard, f6bvp
>>
>> http://radiotelescope-lavillette.fr/
>> http://f6bvp.org


