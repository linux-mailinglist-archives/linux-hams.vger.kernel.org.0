Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46FBD58A8F1
	for <lists+linux-hams@lfdr.de>; Fri,  5 Aug 2022 11:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236064AbiHEJmH (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 5 Aug 2022 05:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiHEJmG (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 5 Aug 2022 05:42:06 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA6181263A
        for <linux-hams@vger.kernel.org>; Fri,  5 Aug 2022 02:42:03 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d16so2162706pll.11
        for <linux-hams@vger.kernel.org>; Fri, 05 Aug 2022 02:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Q5ToksxVSnI9ImpfYGVxNHTpJgFrcYYpvCVGSXJUGpA=;
        b=nadX83LL4s2Mv7vO22+GkT+6EL+gZnUeIOecgtvapTjS7XiF8y7OiUYeRL8HMquV9U
         szwwNyBwbS1JMJ5VW8KTmK47qcNyZHwQqoVx36zeDQJY1dkkw3mqJWvQgBzKBb64uIev
         xXcrDhOZsG4ArnXbWvMBDlCumrvxMakLEAfEUovVmuHFetcNtQ78seCKmvhNhUQlz1Gq
         vdE0zoRnqvZrLnZ6QyddXLq5XUb/CzpAnxard0/cLWRlOHHz1YQi+3F/9rhGPzAQfhgb
         HD9ShNWgE4uyAsuzAO2awXODVxUcvDU2n0e3FwVq8TvcxcwT11XCh5Un+w8l5/y2lIfA
         UyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q5ToksxVSnI9ImpfYGVxNHTpJgFrcYYpvCVGSXJUGpA=;
        b=QFVOkmfRWlqAZfeHbKBw5BgXuuQ2ZXZItUGdZTZ4YeR1bVYV0G9nq1I8k+fZg+SyoC
         rtocipENHz/1nzka4w8aTNemy1VeFgR0DgiiL43muEXW156raZOux6lcJNnYUOmN1sF6
         y6MO/QOv+huEdvRkNOuQwx1O3YcwkYwSZ0/PkMOnxyOUTf2v4/4Q5ThDD1bhYsCZ/rcr
         Tvue8YVa6CkJ1kR3FrRwOxRfqKlxGp/36TchFXa/4Lh/2pUA5xB66Qf/L+DBYv8ncZxj
         3TenE/wOwebLWB8U+F3UQTlfpVOh2b7wxPVrM5B7Q7FLiyUldlQkfgJ5vEz/W5JzrLPj
         TZsA==
X-Gm-Message-State: ACgBeo1sp29/3w7uLOYMZqqi6FDpDe4NUyXERgz64pZYFZVlQjeOUKrw
        NGYmbo2z2AgLT5DX2b2eBHYAJ+P4ilg5YeJliU9xZW+L+nhmcYCl
X-Google-Smtp-Source: AA6agR7PMX51D5m5dJ2S6bniQSPh2E/IR27VFbCQ1sHV0LYx6kYdhuhol84OKZVuL1tfBntTQyCiH5URWvTVmBwRCPw=
X-Received: by 2002:a17:90a:1d4f:b0:1f3:10f2:155c with SMTP id
 u15-20020a17090a1d4f00b001f310f2155cmr14602773pju.25.1659692523291; Fri, 05
 Aug 2022 02:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAFAa3YCsS23P3iYg9SXBuSbKX=-OECVqVa+9bLLy4yiv9fHX2A@mail.gmail.com>
In-Reply-To: <CAFAa3YCsS23P3iYg9SXBuSbKX=-OECVqVa+9bLLy4yiv9fHX2A@mail.gmail.com>
From:   Bernard Pidoux <bernard.f6bvp@gmail.com>
Date:   Fri, 5 Aug 2022 11:41:51 +0200
Message-ID: <CAFAa3YB4=1Wb9TXCDXeuM7ERQ+Cokgep+6AqNzb99pynw6b5mA@mail.gmail.com>
Subject: Re: ax25tools axgetput compile error
To:     thomas@osterried.de
Cc:     linux-hams@vger.kernel.org, Lee Woldanski <ve7fet@gmail.com>,
        Bernard Pidoux <f6bvp@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Here are some changed I performed in order I could to achieve
ax25tools compilation:

mheard.c: In function =E2=80=98LoadPortData=E2=80=99:
../config.h:305:16: warning: implicit declaration of function
=E2=80=98rpl_malloc=E2=80=99; did you mean =E2=80=98realloc=E2=80=99?
[-Wimplicit-function-declaration]
  305 | #define malloc rpl_malloc
      |                ^~~~~~~~~~
mheard.c:261:22: note: in expansion of macro =E2=80=98malloc=E2=80=99
  261 |                 pr =3D malloc(sizeof(struct PortRecord));
      |                      ^~~~~~
mheard.c:261:20: warning: assignment to =E2=80=98struct PortRecord *=E2=80=
=99 from
=E2=80=98int=E2=80=99 makes pointer from integer without a cast [-Wint-conv=
ersion]
  261 |                 pr =3D malloc(sizeof(struct PortRecord));
      |                    ^
https://lists.gnu.org/archive/html/automake/2003-05/msg00020.html

Removing the AC_FUNC_MALLOC in configure.ac solved it.
ll
DATA TYPES errors

In file included from beacon.c:1:
../config.h:304:15: error: two or more data types in declaration specifiers
  304 | #define pid_t int
      |               ^~~
../config.h:301:16: error: two or more data types in declaration specifiers
  301 | #define mode_t int
      |                ^~~

Edit configure.ac

dnl Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL
AC_C_CONST
AC_TYPE_UID_T
#AC_TYPE_PID_T
#AC_TYPE_MODE_T
AC_TYPE_SIZE_T
m4_warn([obsolete],

I don't know why I still had to edit config.h redefinition

/* Define as a signed integer type capable of holding a process identifier.=
 */
/* #define pid_t int */


Bernard



Am 30.07.2022 um 16:08 schrieb Bernard f6bvp <f6bvp@free.fr>:

As a turn around I added #include <sys/type.h to axgetput.c

#include <sys/types.h>

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif
#include "includes.h"

#include "axgetput.h"

This add made compilation possible ... although with a number of
warnings in ax25tools compilation.

Ah. Oh. Interesiting.

Previous compiler versions "knew" what "int" is.
And yes, todays compilers also know what int is (i.e. int main() {};)
-- without including sys/types.h.
But the preprocessor is "before" the actual compiling stuff. Perhaps
there were reasons to make him less intelligent / more stupid.

I can't imagine why current gcc behaves so and considers this as error.


Btw, I recently compiled it on debian bullseye with

root@lax25-debug1:/usr/local/src/linux-ax25# gcc --version
gcc (Debian 10.2.1-6) 10.2.1 20210110
Copyright (C) 2020 Free Software Foundation, Inc.
..



Le ven. 5 ao=C3=BBt 2022 =C3=A0 11:23, Bernard Pidoux <bernard.f6bvp@gmail.=
com> a =C3=A9crit :
>
> Here are some changed I performed in order I could to achieve ax25tools c=
ompilation:
>
> mheard.c: In function =E2=80=98LoadPortData=E2=80=99:
> ../config.h:305:16: warning: implicit declaration of function =E2=80=98rp=
l_malloc=E2=80=99; did you mean =E2=80=98realloc=E2=80=99? [-Wimplicit-func=
tion-declaration]
>   305 | #define malloc rpl_malloc
>       |                ^~~~~~~~~~
> mheard.c:261:22: note: in expansion of macro =E2=80=98malloc=E2=80=99
>   261 |                 pr =3D malloc(sizeof(struct PortRecord));
>       |                      ^~~~~~
> mheard.c:261:20: warning: assignment to =E2=80=98struct PortRecord *=E2=
=80=99 from =E2=80=98int=E2=80=99 makes pointer from integer without a cast=
 [-Wint-conversion]
>   261 |                 pr =3D malloc(sizeof(struct PortRecord));
>       |                    ^
> https://lists.gnu.org/archive/html/automake/2003-05/msg00020.html
>
> Removing the AC_FUNC_MALLOC in configure.ac solved it.
> ll
> DATA TYPES errors
>
> In file included from beacon.c:1:
> ../config.h:304:15: error: two or more data types in declaration specifie=
rs
>   304 | #define pid_t int
>       |               ^~~
> ../config.h:301:16: error: two or more data types in declaration specifie=
rs
>   301 | #define mode_t int
>       |                ^~~
>
> Edit configure.ac
>
> dnl Checks for typedefs, structures, and compiler characteristics.
> AC_HEADER_STDBOOL
> AC_C_CONST
> AC_TYPE_UID_T
> #AC_TYPE_PID_T
> #AC_TYPE_MODE_T
> AC_TYPE_SIZE_T
> m4_warn([obsolete],
>
> I don't know why I still had to edit config.h redefinition
>
> /* Define as a signed integer type capable of holding a process identifie=
r. */
> /* #define pid_t int */
>
>
> Bernard
>
>
>
> Am 30.07.2022 um 16:08 schrieb Bernard f6bvp <f6bvp@free.fr>:
>
> As a turn around I added #include <sys/type.h to axgetput.c
>
> #include <sys/types.h>
>
> #ifdef HAVE_CONFIG_H
> #include <config.h>
> #endif
> #include "includes.h"
>
> #include "axgetput.h"
>
> This add made compilation possible ... although with a number of warnings=
 in ax25tools compilation.
>
> Ah. Oh. Interesiting.
>
> Previous compiler versions "knew" what "int" is.
> And yes, todays compilers also know what int is (i.e. int main() {};) -- =
without including sys/types.h.
> But the preprocessor is "before" the actual compiling stuff. Perhaps ther=
e were reasons to make him less intelligent / more stupid.
>
> I can't imagine why current gcc behaves so and considers this as error.
>
>
> Btw, I recently compiled it on debian bullseye with
>
> root@lax25-debug1:/usr/local/src/linux-ax25# gcc --version
> gcc (Debian 10.2.1-6) 10.2.1 20210110
> Copyright (C) 2020 Free Software Foundation, Inc.
> ..
>
>
