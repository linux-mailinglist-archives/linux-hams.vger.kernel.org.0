Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334BB4181A5
	for <lists+linux-hams@lfdr.de>; Sat, 25 Sep 2021 13:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243920AbhIYL3S (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sat, 25 Sep 2021 07:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232363AbhIYL3R (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sat, 25 Sep 2021 07:29:17 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5813BC061570
        for <linux-hams@vger.kernel.org>; Sat, 25 Sep 2021 04:27:43 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so11186997otb.1
        for <linux-hams@vger.kernel.org>; Sat, 25 Sep 2021 04:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=habets.se; s=google;
        h=in-reply-to:mime-version:references:from:date:message-id:subject:to
         :cc;
        bh=jmpEd3ko5Fxc4oOmXsxe6TKORaItYCGxlPaH6VD9doY=;
        b=W4LskNMN6KMF7JtY1hI8kmaeRuCi0KG8Ttx+oBMpVIfzLQSRKHh9t6mFzH0LIuqXil
         7k858rkyuDCRzSKQRDgGTlRcVdTiXnq5Xla9Gl/jxOp9R9OyQrjt3LkKiuGo44r4JPz+
         /jVsVXt2vJpAk9gX6O1KTo6x7eLVee0xQytCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:in-reply-to:mime-version:references:from:date
         :message-id:subject:to:cc;
        bh=jmpEd3ko5Fxc4oOmXsxe6TKORaItYCGxlPaH6VD9doY=;
        b=C4mDHGWSh851Vs+pUMHIoB0BxC5FMGoiSb7P3os1qxRMsEeksRLslzzdgoXDuuYmbj
         ATy0InDdPv4bnZZc7Aeq6QbZzJz8JIINWi4i7fgFiGeMI3RwSv27s3FGsvTIXrL8jpWF
         EWlL8sGd0+w3dRkSkDMS2IpHqC0XL9MbV8IPcP8DJ2qw2QhOdD/+Htysd/0jW913SByl
         gCxMkd7oJwZKD1ZSuvxzTwujIYkb2epO/C4NhoPEttha9nk2QZOeSKKUTcFFHKqn14Ug
         Dts6MrGjdn9d2OdQWCg1pgPNjmRY87Q9r9xx8zxx5Il2D3o99oC/En8l9oqCFtMlJMXE
         f6vw==
X-Gm-Message-State: AOAM531GsUhYvtI6aUxTHpMNOfC9oACUjgTqViYz/DmGi3CFEmkmH6Kx
        mNI47u2Px0xgsMSKEdL9Ti2TYdoEcEAaOGjlAGy0dTpfzHiVxg==
X-Google-Smtp-Source: ABdhPJwHXSnLaop4y8tdnQcIbUzEAqCWKwMobYWrYfAYFE/Sbn2EIbOr0F/V+NrmzQEXA16+fRquLMYTfMzdtMrMCY4=
X-Received: by 2002:a9d:5a8e:: with SMTP id w14mr8319861oth.322.1632569262600;
 Sat, 25 Sep 2021 04:27:42 -0700 (PDT)
Received: from 195210475306 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 25 Sep 2021 04:27:41 -0700
In-Reply-To: <bd512f69-976b-129c-b54b-f6ad8230dc89@trinnet.net>
MIME-Version: 1.0
References: <CA+kHd+e=XQ6m7YgMGMmK5FjkX=bYVEQ7n57GaY8j0qHtwzZPpg@mail.gmail.com>
 <e235ee10-5774-f690-0c5e-5dc575482936@trinnet.net> <CA+kHd+cvbwz+T2rwnGG7JpcK33DAn25kk4FWUckVT3P9nY+2=A@mail.gmail.com>
 <CA+kHd+fZgoTd=H7wCOqTh1HS3Co-cydpQW5jf48Sv3z=ZdpL2A@mail.gmail.com> <bd512f69-976b-129c-b54b-f6ad8230dc89@trinnet.net>
From:   thomas@habets.se
Date:   Sat, 25 Sep 2021 04:27:41 -0700
Message-ID: <CA+kHd+cavMi-_vvAoJTvc2EDUH7nbMOQ9QqVkx0TOh+KJOOpjA@mail.gmail.com>
Subject: Re: Unable to receive UI frames with DGRAM socket
To:     David Ranch <linux-hams@trinnet.net>
Cc:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Fri, 24 Sep 2021 19:18:25 +0100, David Ranch <linux-hams@trinnet.net> said:
> I would recommend to start a discussion with the Linux
> AX.25 maintainer who would know better on a programmatic level:

Thanks, I'll do that.

> Ps.  It dawned on me that there is another approach to give non-root yet
> promiscuous AX.25 listening abilities in Linux:
>
>     ax25spyd:  https://salsa.debian.org/debian-hamradio-team/ax25spyd

Thanks. I had a look, and it seems that this is essentially a root
daemon that multiplexes AX.25 access through an API.

Note that I don't actually want promiscuous AX.25 listening. I just
want to bind() and then receive UI frames destined for that
address. Just like UDP.

If I understand that correctly then really the applications no longer
use AX.25 sockets, and I start wondering if it's even worth having
support for them in the kernel, as opposed to just having a KISS
multiplexer daemon plus a library.

I tried out ax25spyd and as expected I got:

socket(AF_INET, SOCK_PACKET, 0x300 /* IPPROTO_??? */) = -1 EPERM
(Operation not permitted)

--
typedef struct me_s {
  char name[]      = { "Thomas Habets" };
  char email[]     = { "thomas@habets.se" };
  char kernel[]    = { "Linux" };
  char *pgpKey[]   = { "http://www.habets.pp.se/pubkey.txt" };
  char pgp[] = { "9907 8698 8A24 F52F 1C2E  87F6 39A4 9EEA 460A 0169" };
  char coolcmd[]   = { "echo '. ./_&. ./_'>_;. ./_" };
} me_t;
