Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAF70E0758
	for <lists+linux-hams@lfdr.de>; Tue, 22 Oct 2019 17:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730217AbfJVP22 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 22 Oct 2019 11:28:28 -0400
Received: from trinity.trinnet.net ([96.78.144.185]:1958 "EHLO
        trinity3.trinnet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729666AbfJVP21 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 22 Oct 2019 11:28:27 -0400
X-Greylist: delayed 1640 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Oct 2019 11:28:27 EDT
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS/8.15.2) with ESMTP id x9MF14KZ022303;
        Tue, 22 Oct 2019 07:01:04 -0800
Subject: Re: Status of the LISTENING stuck state machine bug
To:     Gavin Rogers <grogers@vk6hgr.echidna.id.au>,
        linux-hams@vger.kernel.org
References: <e398cccb-0edf-7751-3c58-565b3fd166ef@vk6hgr.echidna.id.au>
From:   David Ranch <debian-hams@trinnet.net>
Message-ID: <02b938e5-7e81-8bc4-7a58-90e05c236e9a@trinnet.net>
Date:   Tue, 22 Oct 2019 08:01:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <e398cccb-0edf-7751-3c58-565b3fd166ef@vk6hgr.echidna.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Tue, 22 Oct 2019 07:01:05 -0800 (GMT+8)
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


Hell Gavin,

Yes, this is still an active issue but it doesn't happen to all users.  
Can you elaborate a little bit on your setup?  Regardless, there are 
some people looking at the issue for it but there isn't anything 
available yet.  Until then, it's understood that 4.1.21 and older 
kernels have a properly functioning AX.25 stack.  Can you downgrade your 
kernel?

--David
KI6ZHD


On 10/22/2019 01:13 AM, Gavin Rogers wrote:
> Hello.
>
> Does anyone know the status of the bug in 4.x kernels causing the 
> kernel to become stuck after an AX.25 connection has closed down, 
> causing it to permanently stay in a callsign-1 callsign-2 LISTENING 
> status?
>
> i.e. https://www.spinics.net/lists/linux-hams/msg04029.html
>
> The latest kernel machine I have ready access to is running 4.19 and 
> it's still there.
>
> I don't know much about kernel development - is this an open bug or 
> how can it get attention to be fixed?
>
> Gavin
> VK6HGR
>

