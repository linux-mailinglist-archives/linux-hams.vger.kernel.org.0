Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C05F4C93B0
	for <lists+linux-hams@lfdr.de>; Tue,  1 Mar 2022 19:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235931AbiCATAE (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 1 Mar 2022 14:00:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234562AbiCATAD (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 1 Mar 2022 14:00:03 -0500
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2DF5910D1
        for <linux-hams@vger.kernel.org>; Tue,  1 Mar 2022 10:59:21 -0800 (PST)
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS Hardened/TrinityOS Hardened) with ESMTP id 221IxKAj016069;
        Tue, 1 Mar 2022 10:59:20 -0800
Subject: Re: Wireshark ax25 dissector
To:     drb@msu.edu, linux-hams@vger.kernel.org
References: <20220301173317.AF98C28A6C6@yagi.h-net.msu.edu>
From:   David Ranch <linux-hams@trinnet.net>
Message-ID: <3b946f99-6b6e-1366-1675-3e68304431bb@trinnet.net>
Date:   Tue, 1 Mar 2022 10:59:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20220301173317.AF98C28A6C6@yagi.h-net.msu.edu>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Tue, 01 Mar 2022 10:59:20 -0800 (GMT+8)
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


Hello Denis,

I have Wireshark 3.2.3 on Ubuntu 20.04 decoding packets on the ax0 
interface and while the ax25_nol3 dissector seems to work ok, the 
standard ax25.src dissector doesn't seem to work for me either. Might be 
worth doing a bug search to see if this is something already known or 
create a new issue if none are found.

--David
KI6ZHD


On 03/01/2022 09:33 AM, Dennis Boone wrote:
> Folks,
>
> I'm having trouble getting Wireshark's ax25 dissector to process
> callsign filters properly.  I can't get _anything_ to match.  I've tried
> expressions like:
>
>      ax25.src ~ "KB8ZQZ"
>      ax25.src ~ "KB8ZQZ-0"
>      ax25.src ~ KB8ZQZ
>      ax25.src ~ KB8ZQZ-0
>
> and the equivalents with ax25.dst.  I've tried various callsigns which
> are in the capture file I'm examining.  The source and destination
> columns in the packet browser are filled in rationally.
>
> debian sid
> wireshark 3.6.2-1
> 5.16.0-1-amd64 #1 SMP PREEMPT Debian 5.16.7-2 (2022-02-09) x86_64
> GNU/Linux
>
> Does anyone know of something different I should be doing?  A known bug?
>
> Thanks,
>
> de KB8ZQZ

