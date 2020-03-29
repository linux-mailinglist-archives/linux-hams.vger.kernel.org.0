Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4685D196DED
	for <lists+linux-hams@lfdr.de>; Sun, 29 Mar 2020 16:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgC2Odk (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 29 Mar 2020 10:33:40 -0400
Received: from mr011msr.fastwebnet.it ([85.18.95.111]:39148 "EHLO
        mr011msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbgC2Odj (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 29 Mar 2020 10:33:39 -0400
X-Greylist: delayed 316 seconds by postgrey-1.27 at vger.kernel.org; Sun, 29 Mar 2020 10:33:39 EDT
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedugedrudeifedgjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfetuffvhgfguedpucfqfgfvnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpedfofgrrhgtohcuffhiucforghrthhinhhoucdlkfghvdfqjfgimddfuceoihifvdhohhigsehifidvohhhgidrnhgvtheqnecuffhomhgrihhnpehsohhurhgtvghfohhrghgvrdhnvghtpdhtrhhinhhithihohhsrdgtohhmnecukfhppedvrddvfeekrdduleeirdejjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedruddruddufegnpdhinhgvthepvddrvdefkedrudeliedrjeejpdhmrghilhhfrhhomhepoehifidvohhhgiesihifvdhohhigrdhnvghtqecuuefqffgjpeekuefkvffokffogfdprhgtphhtthhopeeoihifvdhohhigsehifidvohhhgidrnhgvtheqpdhrtghpthhtohepoehlihhnuhigqdhhrghmshesthhrihhnnhgvthdrnhgvtheqpdhrtghpthhtohepoehlihhnuhigqdhhrghmshesvhhgvghrrdhkvghrnhgvlhdrohhrgheq
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.1.113] (2.238.196.77) by mr011msr.fastwebnet.it (5.8.208) (authenticated as madimartino@fastwebnet.it)
        id 5E3193B6032F7472; Sun, 29 Mar 2020 16:28:19 +0200
Subject: Re: New Linpac pre-release ready for testing..
To:     David Ranch <linux-hams@trinnet.net>,
        Linux Hams <linux-hams@vger.kernel.org>
References: <4df52fc2-29b3-dcfd-613a-cb165b411bea@trinnet.net>
From:   "Marco Di Martino (IW2OHX)" <iw2ohx@iw2ohx.net>
Message-ID: <e47e6651-5614-ce7a-513e-712ebfbc39ad@iw2ohx.net>
Date:   Sun, 29 Mar 2020 16:28:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4df52fc2-29b3-dcfd-613a-cb165b411bea@trinnet.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello David,

thanks a lot for your effort.

Well, I've just compiled it and started having fun with Linpac.

All fine so far on Ubuntu 18.04!

Regards,

Marco

iw2ohx

On 27/03/20 18:48, David Ranch wrote:
> Hello Everyone,
>
> If you're a Linux AX.25 user, I'm looking for compile-savvy testers to 
> give the new version of Linpac posted in my DEVELOP branch a test:
>
>    https://sourceforge.net/projects/linpac/
>
>
> If you're not familiar with Linpac, the description is:
>    --
>    A modular TUI oriented (ncurses) amateur radio AX.25 keyboard to 
> keyboard chat and PBBS program using Linux's AX.25 stack. Includes 
> support for multiple concurrent connected sessions, a unconnected (UI) 
> message screen, and an automated packet message client
>    --
>
>
> Compiling and install guides are available in :
>
>    - The source's README file
>    https://sourceforge.net/p/linpac/linpac/ci/develop/tree/README
>
>    - Raspberry Pi / Debian centric guide:
> http://www.trinityos.com/HAM/CentosDigitalModes/RPi/rpi4-setup.html#28.install-linpac 
>
>
>    - Centos centric (includes screen captures):
> http://www.trinityos.com/HAM/CentosDigitalModes/hampacketizing-centos.html#11.linpac 
>
>
>
> If you need any help, you can post to this list or to the Discussion 
> area on SourceForge:
>
>    https://sourceforge.net/p/linpac/discussion/
>
> If you find any bugs / real issues, please create a ticket on Linpac's 
> SourceForge area:
>
>    https://sourceforge.net/p/linpac/_list/tickets
>
>
> --David
> KI6ZHD
