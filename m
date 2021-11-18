Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40174456385
	for <lists+linux-hams@lfdr.de>; Thu, 18 Nov 2021 20:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbhKRTdj (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 18 Nov 2021 14:33:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhKRTdj (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 18 Nov 2021 14:33:39 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A7EC061574
        for <linux-hams@vger.kernel.org>; Thu, 18 Nov 2021 11:30:38 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id p4so7603249qkm.7
        for <linux-hams@vger.kernel.org>; Thu, 18 Nov 2021 11:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6qPu2e9SxeG5fZDkP5SYiCui5HTlYMfcveay6DoCtE8=;
        b=gzS4W9IKTkSagDcaAJdcj8vQ7SDr0v+zK3U7G49rRyS/qCQXZTiHUy52f5akq08uTi
         mztRfWvnY5DmPyLnyoj2o5MerhSpDzsy4ceZnUClatDOUhVP6iyrkIanLoX9wzUrieeB
         SZESGxj6PjVfygR2xo/rLfoSy1a3yTy79+G15dLyC/4+Q2joHq6mg80kECEQ5Tz7fbYs
         CHhrFso02/LFFY3Wai2M0nv4rsLkHnzLxDrWG7a+2i9wy2bpBosZta+ziw+MJrSC09cB
         kJlw19rhkV9WBMJfGGaeItd5hvaTnKqBxVjquz25tLm17FS+WVGFP1L9sRpOuULC3DNu
         sigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6qPu2e9SxeG5fZDkP5SYiCui5HTlYMfcveay6DoCtE8=;
        b=OuPmHmfPg/IaWIACLwKN3GXKa4KcQcbq+sPhnNc0xX19cUnSWxb58INiFOS5UHMPVI
         OQjXPcaNUvBjbG8PZYVOsOM24OeS0P4n6S/CdcpabszRz0j1eLwGIuwQzaDsPQxuPPJW
         LzFbClpIOoqF6yAeIkZi2QZE+aedMaFCBtMfUiHU4rs6V8RQ332s5FWKTsLRwH07UUth
         yt4u8R/xEmI/4ANFg8AEdmFcBvQaY/IdoNs9RpxwR04BxSxFYyBExRADWAXSDcl1q3LG
         isRxK4gCsxni2F9r4Wd+8fzORYbhErETjYYpfP5IA20yMAxyZsmqCbVTB5Y5m56q6fs3
         uPNw==
X-Gm-Message-State: AOAM5338KfF5hc4m49UUNnGkBh9W2ZHTIaks2YrazzWzTy8MbDOsnm0x
        K03B6Tyc/F1Yd6qi+z6hEW6EcHB/aIhv/slZ0JJ25gSkN/o=
X-Google-Smtp-Source: ABdhPJyHU2T6YEFno6e2MfAn/T4fQ6u0BZ0xmO2zHMI1La2mz2YP46my5SccKt3fJrPxpgzjEkgdJV8lxfPxcuVTus4=
X-Received: by 2002:a37:de15:: with SMTP id h21mr23216144qkj.332.1637263837804;
 Thu, 18 Nov 2021 11:30:37 -0800 (PST)
MIME-Version: 1.0
References: <27764.1637253551@yamaloka.gajendra.net>
In-Reply-To: <27764.1637253551@yamaloka.gajendra.net>
From:   Dave van der Locht <d.vanderlocht@gmail.com>
Date:   Thu, 18 Nov 2021 20:30:27 +0100
Message-ID: <CAH4uzPM9YzJPzLRCLSRWf17vim9ADmAiLM_G+yTDWDuXgzLhAA@mail.gmail.com>
Subject: Re: NET/ROM bug fix from YO2LOJ?
To:     Dan Cross <crossd@gmail.com>
Cc:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

The patch itself made it to this list several times as far as I know.
I also had some conversation here with the maintainer (Ralf) where
it's mentioned including what YO2LOJ did in his patch.
Roland Schwarz posted the patch too on 31th July 2021 with subject:
[PATCH] apply YO2LOJ's changes for proper connection cleanup.

I'm curious too if someone is tracking the issue, any status requests
remain unanswered. It won't be because there's no additional context
provided. There's lots of provided... Which can be found in the
archive.

Maybe it isn't the _right_ fix, but it seems to work pretty well for
everyone using it. And if it isn't the _right_ fix, what is...

The same seems to happen with a serious security issue I reported
where random fragments of data from memory is leaking into NETROM
frames with kernel 5.4 and up.
Unfortunately I'm not very capable of debugging the kernel stuff
myself. After some conversations with the maintainer, and providing
more info and a dump regarding that, there's silence too without any
response to status requests from anyone.

73! Dave

Op do 18 nov. 2021 om 19:37 schreef Dan Cross <crossd@gmail.com>:
>
> On October 26 2021, N1URO sent a message to this list asking
> about getting "the NetRom status bug" fixed.  There was no
> additional context, so perhaps it's unsurprising that no one
> responded.
>
> However, his message appears to refer to a legitimate bug in
> which NET/ROM sockets can be left in an invalid state after
> closing.  Marius Petrescu, YO2LOJ, has a small patch for this
> on his web site, but from my searching, I can't find any record
> that it ever made it to either this list or the LKML.
>
> Marius's fix is short (slightly reformatted for kernels style):
>
> --- ../reference/linux/net/ax25/ax25_subr.c     Thu Nov 18 15:33:53 2021
> +++ ax25_subr.c Thu Nov 18 16:05:36 2021
> @@ -284,5 +284,8 @@
>                 }
>                 bh_unlock_sock(ax25->sk);
>                 local_bh_enable();
> +       } else {
> +               // YO2LOJ: this is needed for proper NETROM connection cleanup on timeout
> +               ax25_destroy_socket(ax25);
>         }
>  }
>
> I do not know whether this is the _right_ fix for this issue,
> but it seems that additional context towards getting it fixed
> would be helpful, hence this message.
>
> Is anyone tracking this issue?
>
> Thanks and 73,
>
>         - Dan C.
>           (KZ2X)
>
