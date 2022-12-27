Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01054656E9C
	for <lists+linux-hams@lfdr.de>; Tue, 27 Dec 2022 21:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiL0UXw (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 27 Dec 2022 15:23:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiL0UXv (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 27 Dec 2022 15:23:51 -0500
X-Greylist: delayed 1864 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 27 Dec 2022 12:23:50 PST
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0F71CCE3C
        for <linux-hams@vger.kernel.org>; Tue, 27 Dec 2022 12:23:49 -0800 (PST)
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 2BRJqi7N017030;
        Tue, 27 Dec 2022 11:52:44 -0800
Subject: Re: Patching the Raspberry Pi OS Kernel for AX.25?
To:     linux-hams@vger.kernel.org
References: <CANnsUMEtqqQbFEoUnqWtbvdeVU4i5adTH97uPUFpzWN=mOp54g@mail.gmail.com>
 <CANnsUMFvEy6TkwdVitOpRs_HhxLmt8=FKbe2=RDK3190syN9Zg@mail.gmail.com>
Cc:     Chris Maness <christopher.maness@gmail.com>
From:   David Ranch <linux-hams@trinnet.net>
Message-ID: <91180f1e-2ac9-95c1-ee27-d393e4d681b0@trinnet.net>
Date:   Tue, 27 Dec 2022 11:52:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CANnsUMFvEy6TkwdVitOpRs_HhxLmt8=FKbe2=RDK3190syN9Zg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Tue, 27 Dec 2022 11:52:44 -0800 (PST)
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_20,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


I haven't tried that one patch but there have actually been a bunch of 
patches (5-6 of them) in say the last six months but I don't know which 
ones have been applied to which kernel branches.  I would generally 
recommend to just try the newer kernel version unless you really need 
v5.15.  If you are going to try to apply the patches to the older 
kernel, you'll need to make sure they are properly backported and you 
will also need to apply them in the correct chronological order to avoid 
conflicts.

--David
KI6ZHD



On 12/26/2022 10:31 PM, Chris Maness wrote:
> This looks like the patch.
>
> https://lore.kernel.org/all/20220530152158.108619-1-duoming@zju.edu.cn/
>
> On Mon, Dec 26, 2022 at 10:10 PM Chris Maness
> <christopher.maness@gmail.com> wrote:
>> I would like to try to patch the current 5.15 kernel for the Pi to
>> bring it up to the ax.25 code that is in 5.19.  I believe in that
>> version some of the issues have been fixed, but the current kernel
>> version for the Pi is 5.15.  I have never patched the kernel source
>> before and I am not sure how to proceed.  I have built them before
>> many moons ago.
>>
>> -KQ6UP
>>
>> --
>> Thanks,
>> Chris Maness
>
>

