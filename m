Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC6534107AA
	for <lists+linux-hams@lfdr.de>; Sat, 18 Sep 2021 18:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237222AbhIRQ73 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sat, 18 Sep 2021 12:59:29 -0400
Received: from trinity.trinnet.net ([96.78.144.185]:4067 "EHLO
        trinity3.trinnet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233741AbhIRQ73 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sat, 18 Sep 2021 12:59:29 -0400
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS Hardened/TrinityOS Hardened) with ESMTP id 18IGw4Ms002153
        for <linux-hams@vger.kernel.org>; Sat, 18 Sep 2021 08:58:05 -0800
Subject: Re: unknown kiss packet: 0x80 0x9e
To:     linux-hams@vger.kernel.org
References: <654f3a4d-6420-4fba-e6d9-5693a67f6459@blackspace.at>
 <47ff7a73-dbe7-fcf3-f99f-36e63d709520@trinnet.net>
 <0ef34530-6a91-c3e2-4f52-18eb3546eeff@blackspace.at>
From:   David Ranch <linux-hams@trinnet.net>
Message-ID: <3be878a4-d1ef-1179-cf53-bed047c23a99@trinnet.net>
Date:   Sat, 18 Sep 2021 09:58:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <0ef34530-6a91-c3e2-4f52-18eb3546eeff@blackspace.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Sat, 18 Sep 2021 08:58:05 -0800 (GMT+8)
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


Hello Roland,


> I tried it and have to agree, that it really performs well and it has
> the FX25 implementation, however it lacks features I'd like to use i.e.
> multibaud mode.

Ok.. the choice is yours but when you're only getting about a 60% decode 
rate compared to Direwolf, you're loosing a lot of packets on a single 
baud rate let alone multiple.


>> or even G8BPQ's port of UZ7HO's "soundmodem" will offer better
>> decoding rates, stability, etc.
>
> Did'nt hear about this modem. Can you put me a pointer pls?

Please search for "UZ7HO soundmodem" and it will come right up.  It's a 
Windows only program written in Delphi but it's written and tested to 
work with WINE.


As a correction, G8BPQ's TNCPi9k6's Teensy TNC doesn't use UZ7HO's 
soundmodem code but instead, he ported Thomas Sailer's soundmodem code 
his TNCPi9k6 hardware TNC.

https://www.cantab.net/users/john.wiseman/Documents/TeensyTNC.txt


> Btw.: What I like about soundmodem is it clean design and good
> integration into the linux stack. Using direwolf needs a little more
> "hacking" to use it as a TNC for the linux stack. But of course it does
> work.

I started with Thomas Sailer's soundmodem softTNC and Linux and now use 
WB2OSZ's Direwolf.  Setting up both soft-tncs is a bit different but I 
wouldn't say that one is more difficult than the other.  If you'd like 
to see some examples, I have an Rpi-centric document here:

    https://www.trinityos.com/HAM/CentosDigitalModes/RPi/rpi4-setup.html

--David
KI6ZHD
