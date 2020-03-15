Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0D91185EF6
	for <lists+linux-hams@lfdr.de>; Sun, 15 Mar 2020 19:28:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728145AbgCOS2p convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hams@lfdr.de>); Sun, 15 Mar 2020 14:28:45 -0400
Received: from trinity.trinnet.net ([96.78.144.185]:2264 "EHLO
        trinity3.trinnet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727399AbgCOS2o (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 15 Mar 2020 14:28:44 -0400
X-Greylist: delayed 3542 seconds by postgrey-1.27 at vger.kernel.org; Sun, 15 Mar 2020 14:28:44 EDT
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS/8.15.2) with ESMTP id 02FHTg8c031843
        for <linux-hams@vger.kernel.org>; Sun, 15 Mar 2020 09:29:42 -0800
Subject: Re: Quesion: AX.25 socket data corruption
To:     linux-hams@vger.kernel.org
References: <CAJ4MR4Z=DQQ=cZoKb=7vS+5nx0u9AhTxjeApsmKW2K2WRx-bhw@mail.gmail.com>
 <CAJ4MR4bWV4FyiyyUmRLVgn84fq_uTyJRchwHYx2=rmBzL1KhDQ@mail.gmail.com>
From:   David Ranch <linux-hams@trinnet.net>
Message-ID: <bcee9062-8e2c-5c64-112f-e8ce3c3e2129@trinnet.net>
Date:   Sun, 15 Mar 2020 10:29:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ4MR4bWV4FyiyyUmRLVgn84fq_uTyJRchwHYx2=rmBzL1KhDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Sun, 15 Mar 2020 09:29:42 -0800 (GMT+8)
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


Hello Ivan,

Thank you for posting this video and bug report at 
https://github.com/ve7fet/linuxax25/issues/9#issuecomment-599236879 .  
With this easier to reproduce scenario, maybe we can find a kernel 
developer to help us debug and fix this issue.  Finding this resource to 
fix this has been a serious challenge so far.

--David
KI6ZHD


On 03/15/2020 09:42 AM, Ivan Savitsky wrote:
> Now I ran out of ideas while debugging my proxy.c.
> It really looks like indeed there is a system buffer corruption during
> the write() into SOCK_SEQPACKET socket.
>
> Today I did what I had to do in the first place before anything else —
> tried something that worked before for years.
> I log in into the remote system via AX.25 SVC  by using the 'call'
> utility and see if the in/out data is consistent.
> What I found: there is a data corruption there as well. I recorded a
> short video where hexdump output misalignment
> is shown. Here is the YouTube link if anyone interested:
> https://youtu.be/K4vhCXLK1b0
>
> With best regards,
> Ivan


