Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F957461472
	for <lists+linux-hams@lfdr.de>; Mon, 29 Nov 2021 13:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbhK2MFk (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 29 Nov 2021 07:05:40 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:48403 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231664AbhK2MDk (ORCPT
        <rfc822;linux-hams@vger.kernel.org>);
        Mon, 29 Nov 2021 07:03:40 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id DA9F8320153D
        for <linux-hams@vger.kernel.org>; Mon, 29 Nov 2021 07:00:20 -0500 (EST)
Received: from imap45 ([10.202.2.95])
  by compute3.internal (MEProxy); Mon, 29 Nov 2021 07:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vehibberd.com;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type; s=fm1; bh=NR/y/tWZz8x8waskEWZnlj+BMHQxuQA
        4pkw6CSUUh/M=; b=C2JPSQFqQPg21KguAMN6lrrLhL7Ul6NXy72qURX/EOnCujR
        wyGR0vv70fyb3Ztp1oUcpg0d659Z0plNY8n4qqvMhPBJL0m4bOsgHYlBMZl8uN40
        90KYz78gLPvC5I+nfRHo8AFjcbg5h4eJ071rlrUqwEIa8cRV/Gye4EiEuMn4Gc8z
        kgsRxv5rPS/8lB90pwdc+dgi0pd5SQLWmgricagfyyRX9YP524kZjf23ZLceLRtl
        MaDeB9f+/pt3QDw8aM2ZBDGHVdQVM03IxPWYc8tCr55uWewoGQIhKGGwVn/E4HVP
        LNGqkNTwCpgzeWY9Rn4B8VUynMnXbmAidpEYTQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NR/y/t
        WZz8x8waskEWZnlj+BMHQxuQA4pkw6CSUUh/M=; b=IBnWR5R7qqCoXpGui9GsZk
        pCWl0HzbkT1zuIzqaIPqE/cCCOtljoBxcdLIrzJGhKBvDXLqVJf0tJN1GPIcZ2gf
        6R2YRnbJZ3XZglPv6wXtgR9LAPeJkG3SABuyTxYb6zLMIV0gvUdafi2aSyGRtpHt
        lY52vQpmOiVoXlxFZO+PGQk19WUf4aciMYHyuqUOba8HfXhVKM0LRJVt/i1vnnr1
        05QmMYz1nKA7zBHlXclR3r1CbKhvaBHfS6rO18xg4189mI/7eFT13Jrvx4scAvUQ
        AzeoGOVsHxrRdZwrB/Hco2O/Y3sdx1Sw8DHN36j1ZOYqfKdv+jRMTCbt2HXQxROQ
        ==
X-ME-Sender: <xms:1MCkYR-1aiuL7nR94WU4morJlPLSyzUwBe-fEgxr1Dz8Bhari8LVjw>
    <xme:1MCkYVsUs33Xy-u8xa00xYDygzoUcFP8uS_dSHZQdvTxVtA2Inuu9QxaTjBaXbZAR
    8ygvUnrZSw_-SfmCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheelgdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
    dtreertdenucfhrhhomhepfdffrghvvgcujfhisggsvghrugdfuceougesvhgvhhhisggs
    vghrugdrtghomheqnecuggftrfgrthhtvghrnhepkeetgfehveehteetfeffffehtdejle
    ekgeekueeiteeuteekjefgjeehuedvuefhnecuffhomhgrihhnpehgihhtlhgrsgdrtgho
    mhdpsghlrggtkhhsphgrtggvrdgrthenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegusehvvghhihgssggvrhgurdgtohhm
X-ME-Proxy: <xmx:1MCkYfDEzQ7gELPSr2lKyG35HgX5yAjJV2FMa3UsI12lFjfZGEIH0g>
    <xmx:1MCkYVfmrx52l9G0n76rD418MH0zJN-iqoKsiuix4QSzxJ9UxzWspg>
    <xmx:1MCkYWMBTyB42hkM93gdsoZAtuJmpkrGVbzmKR3Za36WGJdKxsxRiw>
    <xmx:1MCkYcYEC9ptyGzn6c03gbSHCYLx7NUbYFvItgRSx0P2E_ioAy6fVg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 0950D24A0074; Mon, 29 Nov 2021 07:00:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4409-g12559b250c-fm-20211129.001-g12559b25
Mime-Version: 1.0
Message-Id: <09fdc26a-0db0-4545-b655-9e4c9d5f56a0@www.fastmail.com>
In-Reply-To: <208413a5-c061-2008-0760-f4d4ed55fcdb@blackspace.at>
References: <208413a5-c061-2008-0760-f4d4ed55fcdb@blackspace.at>
Date:   Mon, 29 Nov 2021 11:59:59 +0000
From:   "Dave Hibberd" <d@vehibberd.com>
To:     linux-hams@vger.kernel.org
Subject: Re: soundmodem bit rot prevention
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hey there,

Great work, thanks for taking this on and thank you for caring!

I possibly can't test BLR as I'm not wholly sure what it is and what use it would be on my test rigs (FT-7900, FT-100D) - what's the benefit of the feature? 

I'm keeping track of this, when you get to GTK-3 relative stability, we can think about migrating the soundmodem debian package to the codebase :)

Cheers,

-- 
  Hibby
  MM0RFN

On Sun, 28 Nov 2021, at 5:22 PM, Roland Schwarz wrote:
> To all who care,
>
> I gave the soundmodem some love to save it from bit rot. I know the most 
> important problem is dependency on legacy gtk2. However, this is not 
> resolved yet. I am working on a solution.
>
> I have fixed the warnings and some issues which were found by clang 
> tidy. I also have added systemd support and started improving the docs
> by filling the README file with text.
>
> Most importantly (for me) is the addition of BLR (baseline restoration) 
> to the 9600Bd modem. This addition allowed me to use a Yaesu FTM-400XD 
> with 9600Bd which simply did not work without BLR at all. I expect other
> transceivers to benefit from this addition as well. I would be very 
> interested of your findings.
>
> The code is also on gitlab near Thomas Sailers repo:
>
> https://gitlab.com/packetradio/soundmodem
>
> vy 73 de Roland, oe1rsa
>
>
> -- 
> __________________________________________
>    _  _  | Roland Schwarz
>   |_)(_  |
>   | \__) | mailto:roland.schwarz@blackspace.at
> ________| http://www.blackspace.at
>
> Attachments:
> * OpenPGP_signature
