Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4350362399E
	for <lists+linux-hams@lfdr.de>; Thu, 10 Nov 2022 03:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232227AbiKJCM0 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 9 Nov 2022 21:12:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbiKJCMZ (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 9 Nov 2022 21:12:25 -0500
X-Greylist: delayed 551 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Nov 2022 18:12:21 PST
Received: from mail.ehzed.com (unknown [IPv6:2600:3c01::f03c:91ff:fe69:d6d2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755A2140BC
        for <linux-hams@vger.kernel.org>; Wed,  9 Nov 2022 18:12:21 -0800 (PST)
Received: from [192.168.64.233] (cpe-70-95-16-76.san.res.rr.com [70.95.16.76])
        by mail.ehzed.com (Postfix) with ESMTPSA id DD335EE813;
        Thu, 10 Nov 2022 02:03:09 +0000 (UTC)
Message-ID: <53dac3d4-d8ca-ea2b-f82c-4d23d258cc4d@w6xm.org>
Date:   Wed, 9 Nov 2022 18:03:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Replacement for linux-ax25.org git?
To:     Dave Hibberd <d@vehibberd.com>, linux-hams@vger.kernel.org
References: <550e4271-a857-4540-953f-4c395e4bb2f5@app.fastmail.com>
Content-Language: en-US
From:   John Weaver <w6xm@w6xm.org>
In-Reply-To: <550e4271-a857-4540-953f-4c395e4bb2f5@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=4.0 required=5.0 tests=BAYES_05,NICE_REPLY_A,
        RCVD_IN_SBL_CSS,RCVD_IN_XBL,RDNS_NONE,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

It looks like the website and git repos moved here: 
https://linux-ax25.in-berlin.de/wiki/Main_Page

-john, W6XM


On 11/8/22 04:41, Dave Hibberd wrote:
> Hi all,
>
> I'm one of the folks in the Debian Hamradio team with an active interest in keeping our packet tooling going.
>
> With the demise of linux-ax25.org and discussions here about change of maintenance, is there a new canonical repo for ax25-tools and similar where these components are held?
>
> Our last upstram mirror was about 3 years ago, we've got it tagged as 0.0.10-rc5+git20190411+3595f87 [1] - this is what will have flowed down into Ubuntu, Raspberry Pi OS etc.
>
> If there's currently active work going on with these userland components, where is it happening so we can rebase our packages?
> If not, I guess this is something we need to make a decision on how to proceed as a community!
>
>
> [1]: https://salsa.debian.org/debian-hamradio-team/ax25-tools/-/tree/upstream
>
