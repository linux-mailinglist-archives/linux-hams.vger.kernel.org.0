Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 701D53D24A8
	for <lists+linux-hams@lfdr.de>; Thu, 22 Jul 2021 15:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232128AbhGVMuQ (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 22 Jul 2021 08:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbhGVMuP (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 22 Jul 2021 08:50:15 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ACF1C061575
        for <linux-hams@vger.kernel.org>; Thu, 22 Jul 2021 06:30:50 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id c68so5340269qkf.9
        for <linux-hams@vger.kernel.org>; Thu, 22 Jul 2021 06:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=gXziYV1q0GF3Vc2JNWmuOR7wupKhi7PG+OseRMMFZrQ=;
        b=LYxKW8ZIf/NBlwxiAlaNkjRd/zhLN5fJJnCKsGOc7ra5rfv/YtDBanmS9Yby1s6aFL
         /8inY3nFCiOpRxC+P6EnaUtJBOxL9VoE4EVd5yt/+KXNay8NtLmdRTjhNc/vs5aHJpGQ
         vUcjjqpli0SeQuaxIa4MWn3kLJD0p9pw0Wf3uvydQkTZlPm5yu5VYsL/ijaO4IlYsucE
         a4xtrKUtzIpJK2DqO812A2dXWBBqjQ8ggtODXizoCfwydhu1uWwGQFOGnTAYvicfHs6N
         IUcnVuM/R+gYu2EhfVXFUw5uQDroTxsUBSpJDMZQAHJUkF8/yCNfq3sDGUBW9Vg5f2aH
         oEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=gXziYV1q0GF3Vc2JNWmuOR7wupKhi7PG+OseRMMFZrQ=;
        b=i0s2zQ+TUY22gJHcn7Fa4l+Gvv5ygYkHt9KwHKw7AQjR0eSoHI+pJ8Cw3Ko6pfpKGn
         6Rb9ie7O3pDnhdggxkQKD5outrGlUZcOJO0iR7Av0nYOSYP8Aqk0HP7glIQ1mwToGgzq
         qnlIHTYGNXVY0RCScvXJWS4ueBNircg5OdzNAbXYNJi5/FpNOut3bCI4/3zVN3hcfhm3
         QdCTavBewTZUCR6G+5coGpB+723wWFycFIIAaUYzmd6expkjgNW6+3JvXMs1NJmPUVUr
         WgrvUGDlEnM/Wjz99i8Qxxq3BIbU/rLi0ZqoNpy+b5bCtRsdImWYPaH0fWQwidi6JqeL
         PCzQ==
X-Gm-Message-State: AOAM5320pZcK2JoTEQ2XismRwhYC5Mo1i2244m5PQnOgSE+OPtSYYawH
        maCwRywlNU9xSkhFUAgXVBOHg/9hQK9In6V6MCYvx8ca
X-Google-Smtp-Source: ABdhPJxixmYl4t/jzKJbspIP7D7a6F2T7eLeD0h2L3rdZ13RverBTTDuBgHUq6ZHvETWVi+/T2IzABj7rJrFtYwy29s=
X-Received: by 2002:a05:620a:4e9:: with SMTP id b9mr38693810qkh.358.1626960648914;
 Thu, 22 Jul 2021 06:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAH4uzPNH6GVX_H0eCrBUxPdgynRc9a7xLGde1_37dTCz3fgJOA@mail.gmail.com>
 <YPlpLpL3Yrz/YE6R@linux-mips.org> <CAH4uzPPuXA19KvikagjcQZmFYvTjw1nNCVQhY_07LPz_F0mmSw@mail.gmail.com>
In-Reply-To: <CAH4uzPPuXA19KvikagjcQZmFYvTjw1nNCVQhY_07LPz_F0mmSw@mail.gmail.com>
From:   Dave van der Locht <d.vanderlocht@gmail.com>
Date:   Thu, 22 Jul 2021 15:30:38 +0200
Message-ID: <CAH4uzPMD7FpH12bwvh7VsfoDXAtsmvORAmw=Xnh6rYXuea5+pg@mail.gmail.com>
Subject: Fwd: SECURITY: Some type of NETROM frames contain random fragments of
 data from memory
To:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Ralf;

Needed to start somewhere as I think I would have a hard time tracing
and pinning down the root cause.

I'll provide some dumps with the least sensitive data in it. Most of
the dumps are made on a live system because of its connections
activity.
Mostly logging data like system and auth log info and SQL.

The issue is very easy to replicate with a minimal installation in a test setup.

Examples of some SQL fragments in NETROM frames:

0000   00 1e 0b b3 a2 44 dc a6 32 3e 86 71 08 00 45 00   .....D..2>.q..E.
0010   01 2e 9a 32 40 00 40 11 18 97 c0 a8 ca 07 8d 38   ...2@.@........8
0020   6f 0d 00 5d 27 6d 01 1a 88 21 ac 84 62 88 92 8e   o..]'m...!..b...
0030   e0 9c 98 6a ac 96 98 61 a4 cf 9c 98 66 ac 96 98   ...j...a....f...
0040   60 ac 84 62 88 92 8e 61 0f 02 a4 00 07 06 6c 75   `..b...a......lu
0050   67 20 41 53 20 60 67 72 6f 75 70 60 20 46 52 4f   g AS `group` FRO
0060   4d 20 77 70 5f 61 63 74 69 6f 6e 73 28 80 22 80   M wp_actions(.".
0070   75 6c 65 72 5f 61 63 74 69 6f 00 00 00 1e 0b b3   uler_actio......
0080   a2 44 dc a6 32 3e 86 71 08 00 45 00 00 2d 9a 07   .D..2>.q..E..-..
0090   40 00 40 11 19 c3 c0 a8 ca 07 8d 38 6f 0d 00 5d   @.@........8o..]
00a0   27 6d 00 19 87 20 ac 84 62 88 92 8e 60 9c 98 6a   'm... ..b...`..j
00b0   ac 96 98 e1 b9 4f 06 55 44 4e 4e 4f 44 9c 98 66   .....O.UDNNOD..f
00c0   ac 96 98 00 55 44 4e 42 42 53 9c 98 6a ac 96 98   ....UDNBBS..j...
00d0   00 ff 9c 98 6c ac 96 98 00 4e 4c 43 48 41 54 9c   ....l....NLCHAT.
00e0   98 6a ac 96 98 00 ff 9a 13 00 06 00 00 00 34 00   .j............4.
00f0   00 00 34 00 01 00 34 00 01 00 20 01 00 00 20 01   ..4...4... ... .
0100   00 00 04 00 00 00 04 00 00 00 03 00 00 00 54 01   ..............T.
0110   00 00 54 01 01 00 54 01 01 00 19 00 00 00 19 00   ..T...T.........
0120   00 00 04 00 00 00 01 00 00 00 01 00 00 00 00 00   ................
0130   00 00 00 00 01 00 00 00 01 00 8d 31               ...........1

0000   00 1e 0b b3 a2 44 dc a6 32 3e 86 71 08 00 45 00   .....D..2>.q..E.
0010   01 2e 95 b7 40 00 40 11 4c ad c0 a8 ca 07 3e a3   ....@.@.L.....>.
0020   8e 07 27 6d 00 5d 01 1a 58 86 9c 98 72 a8 88 40   ..'m.]..X...r..@
0030   e0 9c 98 6a ac 96 98 61 9a cf 9c 98 66 ac 96 98   ...j...a....f...
0040   60 8a 9c 8e 60 68 60 75 0f 00 7d 00 00 04 02 00   `...`h`u..}.....
0050   00 00 10 00 00 01 08 00 01 00 c0 a8 ca 03 0a 00   ................
0060   02 00 b8 27 eb e4 ab a2 00 00 08 00 04 00 01 00   ...'............
0070   00 00 14 00 03 00 38 c1 00 00 00 9c 98 6a ac 96   ......8......j..
0080   98 e0 86 84 60 a6 82 ae 61 9e cf ac 84 62 88 92   ....`...a....b..
0090   8e 60 9c 98 66 ac 96 98 61 1a 01 04 05 01 05 0d   .`..f...a.......
00a0   27 6d 00 24 73 c9 8c 84 84 40 40 40 e0 9c 98 66   'm.$s....@@@...f
00b0   ac 96 98 61 03 f0 36 37 32 33 32 20 20 21 21 0d   ...a..67232  !!.
00c0   b4 7d 32 33 3a 35 39 27 20 4f 52 44 45 52 20 42   .}23:59' ORDER B
00d0   59 20 61 2e 73 63 68 65 64 75 6c 65 64 5f 64 61   Y a.scheduled_da
00e0   74 65 5f 67 6d 74 20 41 53 43 20 4c 49 4d 49 54   te_gmt ASC LIMIT
00f0   20 30 2c 20 32 30 34 00 01 00 20 01 00 00 20 01    0, 204... ... .
0100   00 00 04 00 00 00 04 00 00 00 03 00 00 00 54 01   ..............T.
0110   00 00 54 01 01 00 54 01 01 00 19 00 00 00 19 00   ..T...T.........
0120   00 00 04 00 00 00 01 00 00 00 01 00 00 00 00 00   ................
0130   00 00 00 00 01 00 00 00 01 00 1b 63               ...........c

Syslog and SQL fragments in a NETROM frame:

0000   00 1e 0b b3 a2 44 dc a6 32 3e 86 71 08 00 45 00   .....D..2>.q..E.
0010   01 2e 95 92 40 00 40 11 4c d2 c0 a8 ca 07 3e a3   ....@.@.L.....>.
0020   8e 07 27 6d 00 5d 01 1a 58 86 9c 98 72 a8 88 40   ..'m.]..X...r..@
0030   e0 9c 98 6a ac 96 98 61 88 cf 9c 98 66 ac 96 98   ...j...a....f...
0040   60 8a 9c 8e 60 68 60 75 0f 00 7d 00 04 06 20 75   `...`h`u..}... u
0050   72 6f 6e 6f 64 65 5b 31 32 36 36 5d 3a 20 55 44   ronode[1266]: UD
0060   4e 4e 4f 44 3a 4e 4c 35 56 4b 4c 20 28 80 22 80   NNOD:NL5VKL (.".
0070   65 63 74 65 64 20 74 6f 00 9c 98 6a 00 1e 0b b3   ected to...j....
0080   a2 44 dc a6 32 3e 86 71 08 00 45 00 00 2d 87 b1   .D..2>.q..E..-..
0090   40 00 40 11 50 64 c0 a8 ca 07 1f bb b8 3f 27 6d   @.@.Pd.......?'m
00a0   6a 63 00 19 62 d5 9c 98 6a a4 92 94 60 9c 98 6a   jc..b...j...`..j
00b0   ac 96 98 e1 11 4a e0 a8 88 40 60 c3 20 21 21 0d   .....J...@`. !!.
00c0   b4 7d c8 1b e4 0f 8b 27 20 41 4e 44 20 65 78 70   .}.....' AND exp
00d0   69 72 61 74 69 6f 6e 20 3e 3d 20 55 4e 49 58 5f   iration >= UNIX_
00e0   54 49 4d 45 53 54 41 4d 50 28 29 49 4d 49 54 20   TIMESTAMP()IMIT
00f0   30 2c 20 31 30 00 00 00 00 00 00 00 00 00 00 00   0, 10...........
0100   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................
0110   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................
0120   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................
0130   00 00 00 00 00 00 00 00 00 00 ca 9c               ............

Some ELF binary data fragment in a NETROM frame (I think):

0000   00 1e 0b b3 a2 44 dc a6 32 3e 86 71 08 00 45 00   .....D..2>.q..E.
0010   01 2e f1 75 40 00 40 11 c1 53 c0 a8 ca 07 8d 38   ...u@.@..S.....8
0020   6f 0d 00 5d 27 6d 01 1a 88 21 ac 84 62 88 92 8e   o..]'m...!..b...
0030   e0 9c 98 6a ac 96 98 61 8a cf 9c 98 66 ac 96 98   ...j...a....f...
0040   60 ac 84 62 88 92 8e 61 0f 02 0d 00 07 06 08 00   `..b...a........
0050   00 00 00 00 00 00 00 00 00 00 c0 80 ad c4 00 00   ................
0060   00 00 00 00 00 00 00 00 00 00 03 00 00 00 1d 00   ................
0070   00 00 10 f0 bd c1 10 f0 bd c1 00 9c 98 6a ac 96   .............j..
0080   98 60 8a 9c 8e 60 68 60 f5 11 f4 8f e4 be 00 00   .`...`h`........
0090   80 00 ff ff ff ff 7f 45 4c 46 01 01 01 00 00 00   .......ELF......
00a0   00 00 00 00 00 00 02 00 28 00 01 00 00 00 ac 17   ........(.......
00b0   01 00 34 00 00 00 98 62 01 00 00 04 00 05 34 00   ..4....b......4.
00c0   20 00 09 00 28 00 1c 00 1b 00 01 00 00 70 e8 4e    ...(........p.N
00d0   01 00 e8 4e 02 00 e8 4e 02 00 08 00 00 00 08 00   ...N...N........
00e0   00 00 04 00 00 00 04 00 00 00 06 00 00 00 34 00   ..............4.
00f0   00 00 34 00 01 00 34 00 01 00 20 01 00 00 20 01   ..4...4... ... .
0100   00 00 04 00 00 00 04 00 00 00 03 00 00 00 54 01   ..............T.
0110   00 00 54 01 01 00 54 01 01 00 19 00 00 00 19 00   ..T...T.........
0120   00 00 04 00 00 00 01 00 00 00 01 00 00 00 00 00   ................
0130   00 00 00 00 01 00 00 00 01 00 bb c4               ............

Kind regards,
Dave van der Locht

Op do 22 jul. 2021 om 14:48 schreef Ralf Baechle DL5RB <ralf@linux-mips.org>:
>
> On Thu, Jul 22, 2021 at 01:40:23PM +0200, Dave van der Locht wrote:
>
> > With Linux kernel 5.4 and up I've noticed some type of NETROM frames
> > (conn, disc, etc.) contain random fragments of data from memory.
> > I've seen all kinds of data fragments with security sensitive
> > information in them depending on the software running.
> >
> > Those random data fragments seem to appear only in some NETROM frames,
> > haven't noticed them in any other frame type.
> >
> > Most, if not all, remote node software seems to ignore those fragments
> > and it won't be noticed until you capture the AX.25 over UDP frames.
> > You'll see the frames are larger than expected and contain random
> > fragments of data from (shared?) memory.
> >
> > I've tested this with several 5.4 and 5.10 kernel versions
> > distributions and they all seem to leak security sensitive information
> > the same way into NETROM frames. Mostly logging data, but I've also
> > seen MySQL data and other random fragments of data.
> > I've also tested with kernel 4.19, which doesn't seem te be affected.
>
> While that's not as accurate as a git bisect, it's good start.  Can you
> provide a dump of such packets?
>
>   Ralf
