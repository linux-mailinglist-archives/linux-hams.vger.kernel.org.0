Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1DD758A9AE
	for <lists+linux-hams@lfdr.de>; Fri,  5 Aug 2022 12:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237621AbiHEKub convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hams@lfdr.de>); Fri, 5 Aug 2022 06:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiHEKua (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 5 Aug 2022 06:50:30 -0400
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9135210E3
        for <linux-hams@vger.kernel.org>; Fri,  5 Aug 2022 03:50:20 -0700 (PDT)
X-Envelope-From: thomas@osterried.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 275AoFP92499065
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Fri, 5 Aug 2022 12:50:15 +0200
Received: from x-berg.in-berlin.de ([217.197.86.42] helo=smtpclient.apple)
        by x-berg.in-berlin.de with esmtpa (Exim 4.94.2)
        (envelope-from <thomas@osterried.de>)
        id 1oJuuF-0000cj-33; Fri, 05 Aug 2022 12:50:15 +0200
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: ax25tools axgetput compile error
From:   Thomas Osterried <thomas@osterried.de>
In-Reply-To: <CAFAa3YB4=1Wb9TXCDXeuM7ERQ+Cokgep+6AqNzb99pynw6b5mA@mail.gmail.com>
Date:   Fri, 5 Aug 2022 12:50:14 +0200
Cc:     linux-hams@vger.kernel.org, Lee Woldanski <ve7fet@gmail.com>,
        Bernard Pidoux <f6bvp@free.fr>
Content-Transfer-Encoding: 8BIT
Message-Id: <B2CDEF4D-5614-4DEF-AF7E-AA5529F53AD3@osterried.de>
References: <CAFAa3YCsS23P3iYg9SXBuSbKX=-OECVqVa+9bLLy4yiv9fHX2A@mail.gmail.com>
 <CAFAa3YB4=1Wb9TXCDXeuM7ERQ+Cokgep+6AqNzb99pynw6b5mA@mail.gmail.com>
To:     Bernard Pidoux <bernard.f6bvp@gmail.com>
X-Mailer: Apple Mail (2.3696.100.31)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org



> Am 05.08.2022 um 11:41 schrieb Bernard Pidoux <bernard.f6bvp@gmail.com>:
> 
[..]
> 
> Removing the AC_FUNC_MALLOC in configure.ac solved it.
> ll
> DATA TYPES errors
> 
> In file included from beacon.c:1:
> ../config.h:304:15: error: two or more data types in declaration specifiers
>  304 | #define pid_t int
>      |               ^~~
> ../config.h:301:16: error: two or more data types in declaration specifiers
>  301 | #define mode_t int
>      |                ^~~
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

perhaps it's more a configure/automake issue  (of that newer version) than a compiler incompatibility..


To be concrete: weather substrings like MODE_T nor mode_t are found on the system whereI compiled:

root@lax25-debug1:/usr/local/src/linux-ax25# find . -type f -exec grep -Hi mode_t '{}' ';' 2>/dev/null 
./libax25/ax25io.c:	new->eolmode = EOLMODE_TEXT;
./libax25/ax25io.c:	if (p->eolmode == EOLMODE_TEXT && c == '\n')
./libax25/ax25io.c:		case EOLMODE_TEXT:
./libax25/ax25io.c:		MODE_EDIT | MODE_TRAPSIG,
./libax25/netax25/ax25io.h:#define EOLMODE_TEXT	0
./libax25/netax25/mheard.h:#define	MHEARD_MODE_TEXT	0x0001
./libax25/netax25/mheard.h:#define	MHEARD_MODE_TEXNET	0x0080
./ax25-tools/ax25/mheardd.c:				mheard->entry.mode |= MHEARD_MODE_TEXT;
./ax25-tools/ax25/mheardd.c:				mheard->entry.mode |= MHEARD_MODE_TEXNET;
./ax25-tools/ax25/axgetput/axgetput.c:static mode_t mode_tty;
./ax25-tools/ax25/axgetput/axgetput.c:		mode_tty = statbuf.st_mode;
./ax25-tools/ax25/axgetput/axgetput.c:	if (mode_tty)
./ax25-tools/ax25/axgetput/axgetput.c:		fchmod(fdin, mode_tty);
./ax25-tools/ax25/axspawn.c:	mode_t homedir_mode = S_IRUSR|S_IWUSR|S_IXUSR|S_IXOTH|(secure_home ? 0 : (S_IRGRP|S_IXGRP));
./ax25-tools/ax25/mheard.c:		if (pr->entry.mode & MHEARD_MODE_TEXNET)
./ax25-tools/ax25/mheard.c:		if (pr->entry.mode & MHEARD_MODE_TEXT)
./ax25-tools/ax25/mheard.c:		if (pr->entry.mode & MHEARD_MODE_TEXNET)
./ax25-tools/ax25/mheard.c:		if (pr->entry.mode & MHEARD_MODE_TEXT)


And my automake / autoreconf has not overwritten defaults from repro:

[root@www a]# find . -type f -exec grep -Hi mode_t '{}' ';' 2>/dev/null 
./libax25/netax25/mheard.h:#define      MHEARD_MODE_TEXT        0x0001
./libax25/netax25/mheard.h:#define      MHEARD_MODE_TEXNET      0x0080
./libax25/netax25/ax25io.h:#define EOLMODE_TEXT 0
./libax25/ax25io.c:     new->eolmode = EOLMODE_TEXT;
./libax25/ax25io.c:     if (p->eolmode == EOLMODE_TEXT && c == '\n')
./libax25/ax25io.c:             case EOLMODE_TEXT:
./libax25/ax25io.c:             MODE_EDIT | MODE_TRAPSIG,
./ax25-tools/ax25/mheardd.c:                            mheard->entry.mode |= MHEARD_MODE_TEXT;
./ax25-tools/ax25/mheardd.c:                            mheard->entry.mode |= MHEARD_MODE_TEXNET;
./ax25-tools/ax25/mheard.c:             if (pr->entry.mode & MHEARD_MODE_TEXNET)
./ax25-tools/ax25/mheard.c:             if (pr->entry.mode & MHEARD_MODE_TEXT)
./ax25-tools/ax25/mheard.c:             if (pr->entry.mode & MHEARD_MODE_TEXNET)
./ax25-tools/ax25/mheard.c:             if (pr->entry.mode & MHEARD_MODE_TEXT)
./ax25-tools/ax25/axspawn.c:    mode_t homedir_mode = S_IRUSR|S_IWUSR|S_IXUSR|S_IXOTH|(secure_home ? 0 : (S_IRGRP|S_IXGRP));
./ax25-tools/ax25/axgetput/axgetput.c:static mode_t mode_tty;
./ax25-tools/ax25/axgetput/axgetput.c:          mode_tty = statbuf.st_mode;
./ax25-tools/ax25/axgetput/axgetput.c:  if (mode_tty)
./ax25-tools/ax25/axgetput/axgetput.c:          fchmod(fdin, mode_tty);


Btw, same for your rpl_malloc problem:
root@lax25-debug1:/usr/local/src/linux-ax25# find . -type f -exec grep -Hi rpl_malloc '{}' ';' 2>/dev/null 
root@lax25-debug1:/usr/local/src/linux-ax25# 


My debug system has these versions.
ii  autoconf                         2.69-14                        all          automatic configure script builder
ii  automake                         1:1.16.3-2                     all          Tool for generating GNU Standards-compliant Makefiles



=> Something on your system or your way to prepare is defect.

Something (what?) generated definitions and wrote them to configure.h, and the compiler complained about what he got to eat.
It's like you drive to your petrol station, get 10l fuel, and when you pay, the payment system says "You ordered 10 apples. We have no apple". And you say "what?!".

=> please go back to start.


A good way to bootstrap is

for dir in libax25 ax25-apps ax25-tools; do
  cd $dir && autoreconf --install --force && \
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --mandir=/usr/share/man && \
    make && make install && cd ..
done


vy 73,
	- Thomas  dl9sau




