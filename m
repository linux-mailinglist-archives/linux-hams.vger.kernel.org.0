Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7F94511B4F
	for <lists+linux-hams@lfdr.de>; Wed, 27 Apr 2022 16:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235851AbiD0Nb1 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 27 Apr 2022 09:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235994AbiD0NbZ (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 27 Apr 2022 09:31:25 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E3A42EF4
        for <linux-hams@vger.kernel.org>; Wed, 27 Apr 2022 06:28:05 -0700 (PDT)
Received: from mail-yw1-f181.google.com ([209.85.128.181]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MILnm-1ngS3D3f6q-00EMHi for <linux-hams@vger.kernel.org>; Wed, 27 Apr
 2022 15:28:04 +0200
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-2f7d19cac0bso18268487b3.13
        for <linux-hams@vger.kernel.org>; Wed, 27 Apr 2022 06:28:03 -0700 (PDT)
X-Gm-Message-State: AOAM53015nP1OpNTCSGbYNb2YXeOSdwNNm7e2lAzhElDdRBjaASpdQDg
        7QOorIf2aIozZFWIi66jk3WuOo8boFiFbU2w1uM=
X-Google-Smtp-Source: ABdhPJxvDLgn6FK0Fp4/DTWJZ3UvWsskEiwypeMcAVD0WdgO4bqUgSMSdFh4YH5Tps/XZ3Uyl77dnBHZ+6jCNphuHBI=
X-Received: by 2002:a81:2305:0:b0:2f7:dadb:2162 with SMTP id
 j5-20020a812305000000b002f7dadb2162mr15912441ywj.42.1651066082701; Wed, 27
 Apr 2022 06:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220426175436.417283-1-kuba@kernel.org> <20220426175436.417283-7-kuba@kernel.org>
 <YmhACVaakjATNFl4@x-berg.in-berlin.de> <20220426123941.5c6643ee@kernel.org>
In-Reply-To: <20220426123941.5c6643ee@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 27 Apr 2022 15:27:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3ym6uGLWxX55bc_JDWziDO0hq7K0UksMLC7_b5=aFfcQ@mail.gmail.com>
Message-ID: <CAK8P3a3ym6uGLWxX55bc_JDWziDO0hq7K0UksMLC7_b5=aFfcQ@mail.gmail.com>
Subject: Re: [PATCH net-next 6/6] net: hamradio: remove support for DMA SCC devices
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org,
        jreuter@yaina.de, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Rtg9AIX46tw/XsbE7WJifE8qM8pvDXbq4p6GZvLyTF+HboYx5mz
 Jh+I19qFUL7qDm/aDWOK7g+l7yA+vA32f+6JoVUYfWpLGTSIiiZKF8/PAAvG6BQII5JdvFl
 RwfxaY1eWdFNqKLdMythzD6pcbwv+sClsW3rD3hvVd1SQPt4sUYK/Ulqrm7PlUnhklnx5mW
 swAnm4NmyKOa+3bNoM7/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hwZtrDCQMSE=:SQsV1C5RewXUbzJM/uxkPx
 MMOd6xAJtFqfE6lYZjrRW+p3ZGTJl41pwZKeub7FCwRfNm04DiwKsS5EAPVEu1CSng7DSjLwP
 8Z5nDw9iG0yySsbxjBOlRMvBQHso5MfD21gkyFzYWKQ/DYSvUoAm9BeDAGuDHZLj/SID+qSUO
 ph40qX1Ki/nheVM7Zil3NprTXc12fqL/zBZBXtv+/6toKq5W9HP1YddAKxJa205Foxr0L2hss
 zPuqB+mGKl/Ia90nmKY0PQHxt0BHJDiJfrH4CG8sppB9j/q1HT58roc7N8ymgsHvnopDuSuwJ
 byawR2fWNqdyAFQQSYRVxoCXq7bep+dLY8snFy8/xy1Pc1a5aP9YJvU14bU46Qv+nlUHXJsru
 Lf/Ls+cAD8o1/WdhG8cneR/Zy/lxg8AUBSIbXPwjg+RSUr1vRdgCLLM95gsOJ5vlxYhneDev5
 tbNNu9tKXOPgyWXvR+tZPZdz911apKmTFgt3l9OwUc8QJ+3TNHSPHnHJq76zX7NXL21uvkJA8
 eBEX7fQ7iCZGp14BUXpLzg/k5z9NKZea06kvliq42QB7Hk8CMXrksPj9/C6hEqJin3z/X0lgm
 hJjhOIp9GlIedvtFZ3s4kmLRtXZ/nXgaavqb4OvdQqrN0MsUieO9A6v1u4O7Q1OJ5vk/rz342
 xdqESvBxMQ1L9zrJNCuojOLc19DsIFw9v1YOEGh15noDsE+H3RyumN73JxUZKlBJRh2I=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Tue, Apr 26, 2022 at 9:39 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Tue, 26 Apr 2022 20:55:05 +0200 Thomas Osterried wrote:
> > Jakub informed, that the dmascc driver will be removed from kernel.
> >
> > I think, Jakub's descision should be discussed here on the list, by the users.
>
> Thanks a lot for the forward!
>
> > DMASCC is the "high speed DMA" driver.
> > SCC driver (also with Z8530) will be left in the kernel.
> >
> > Hmm, I cannot really understand the decision of kickoff for DMASCC, and
> > why the code "older" SCC ISA-bus cards will be kept.
>
> We are infamously bad at deciding when to retire code in the kernel,
> the arbitrary rule I used now was "does it depend on VIRT_TO_BUS".
> I figured the non-DMA SCC will go when ISA goes.

Looking at how this driver uses virt_to_bus, I think it can trivially get
converted to isa_virt_to_bus(), which only operates on the low 16MB.

What hardware is ax25 actually used on normally? the drivers I can see
are based on

6pack: serial (through tty layer)
bpqether: ethernet
dmascc: isa (with DMA)
scc: isa (without DMA)
baycom: serial (bypassing tty layer) or parport
yam: serial (bypassing tty layer)

The ISA drivers are clearly the most obsolete, as they require a 32-bit PC
or 1990s RISC workstation with ISA slots.

The baycom and yam drivers in turn look like they could work on any
serial port but are written to assume an ISA-style onboard serial port
on a PC. You can technically still buy new machines that have those,
but the drivers should really be changed to go through the tty layer
if someone wants to use them with a USB-serial adapter or similar.

       Arnd
