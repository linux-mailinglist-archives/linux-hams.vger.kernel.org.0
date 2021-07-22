Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4091E3D30A7
	for <lists+linux-hams@lfdr.de>; Fri, 23 Jul 2021 02:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232682AbhGVXbG (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 22 Jul 2021 19:31:06 -0400
Received: from trinity.trinnet.net ([96.78.144.185]:3992 "EHLO
        trinity3.trinnet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232550AbhGVXbF (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 22 Jul 2021 19:31:05 -0400
X-Greylist: delayed 2932 seconds by postgrey-1.27 at vger.kernel.org; Thu, 22 Jul 2021 19:31:05 EDT
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS Hardened/TrinityOS Hardened) with ESMTP id 16MNMm7G021163
        for <linux-hams@vger.kernel.org>; Thu, 22 Jul 2021 15:22:48 -0800
Subject: Re: Status of the stuck sockets bugs.
To:     linux-hams@vger.kernel.org
References: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
 <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
From:   David Ranch <linux-hams@trinnet.net>
Message-ID: <b435d3b3-b632-de9f-2f14-5a94e718f7a8@trinnet.net>
Date:   Thu, 22 Jul 2021 16:22:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Thu, 22 Jul 2021 15:22:48 -0800 (GMT+8)
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


This issue is still present in all current Linux kernels.  I believe 
Ralf Baechle (current AX.25 kernel module maintainer) has been aware of 
this issue for some time.

--David
KI6ZHD


On 07/22/2021 10:42 AM, Dave van der Locht wrote:
> Is anybody able to tell me more / give answers to questions about this issue?
>
> Kind regards,
> Dave van der Locht
>
> Op di 29 jun. 2021 om 19:32 schreef Dave van der Locht
> <d.vanderlocht@gmail.com>:
>> Hello,
>>
>> Is there any news about the well known bug regarding sockets getting
>> stuck in LISTENING state?
>>
>> Some years ago (already) Marius Petrescu YO2LOJ wrote a patch for the
>> ax25_subr.c file which seems to work very well and solves the issue.
>> But it's really annoying having to patch the kernel with each update
>> again.
>>
>> What about that patch, I've heard it was rejected several times for
>> some reason? But can't find info regarding that.
>> What can be done - or who is able - to get rid of this bug and get it
>> fixed in the kernel?
>>
>> Kind regards,
>> Dave van der Locht

