Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47FCD4CB015
	for <lists+linux-hams@lfdr.de>; Wed,  2 Mar 2022 21:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239388AbiCBUlx (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 2 Mar 2022 15:41:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236431AbiCBUlw (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 2 Mar 2022 15:41:52 -0500
X-Greylist: delayed 3219 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 02 Mar 2022 12:41:04 PST
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B480FDA846
        for <linux-hams@vger.kernel.org>; Wed,  2 Mar 2022 12:41:04 -0800 (PST)
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS Hardened/TrinityOS Hardened) with ESMTP id 222JlHgE023081;
        Wed, 2 Mar 2022 11:47:17 -0800
Subject: Re: Wireshark ax25 dissector
To:     Richard Stearn <richard@rns-stearn.co.uk>,
        Linux Hams <linux-hams@vger.kernel.org>
References: <20220301173317.AF98C28A6C6@yagi.h-net.msu.edu>
 <621F8677.3000008@rns-stearn.co.uk>
From:   David Ranch <dranch@trinnet.net>
Message-ID: <ad99bc17-9a89-9524-b7d8-81a4582e0380@trinnet.net>
Date:   Wed, 2 Mar 2022 11:47:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <621F8677.3000008@rns-stearn.co.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Wed, 02 Mar 2022 11:47:17 -0800 (GMT+8)
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


Hello Richard,

Ah... I think I understand now and this more of an AX-IP filter and not 
a standard AX.25 callsign filter.  I guess the more appropriate filter 
name should be "ax25.srcmac"?

--David
KI6ZHD


On 03/02/2022 07:00 AM, Richard Stearn wrote:
> Dennis Boone wrote:
>
>> I'm having trouble getting Wireshark's ax25 dissector to process
>> callsign filters properly.  I can't get _anything_ to match. I've tried
>> expressions like:
>
> The ax25 dissector never had the ability to filter on a callsign in 
> the form <CALL>-<SSID> it has always used the builtin filter primitives.
>
> See "man wireshark-filter"
>
> So to filter on KB8ZQZ you would use:
>
>     ax25.src[0:6] == 97:85:71:B5:A3:B5
>
> to filter on the source address or
>
>     ax25.dst[0:6] == 97:85:71:B5:A3:B5
>
> You can find the hexadecimal in the AX.25 line in brackets after the
> callsign.
>
> So it is not a bug per se.  More of the point at which I had to abandon
> development due to ill health.
>

