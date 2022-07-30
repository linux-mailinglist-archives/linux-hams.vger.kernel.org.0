Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29381585BEE
	for <lists+linux-hams@lfdr.de>; Sat, 30 Jul 2022 21:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235688AbiG3T7b convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hams@lfdr.de>); Sat, 30 Jul 2022 15:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235804AbiG3T7b (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sat, 30 Jul 2022 15:59:31 -0400
X-Greylist: delayed 171 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 30 Jul 2022 12:59:29 PDT
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70FE3167F2
        for <linux-hams@vger.kernel.org>; Sat, 30 Jul 2022 12:59:29 -0700 (PDT)
X-Envelope-From: thomas@osterried.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 26UJuZic3121455
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Sat, 30 Jul 2022 21:56:35 +0200
Received: from x-berg.in-berlin.de ([217.197.86.42] helo=smtpclient.apple)
        by x-berg.in-berlin.de with esmtpa (Exim 4.94.2)
        (envelope-from <thomas@osterried.de>)
        id 1oHsZe-0002dk-Ow; Sat, 30 Jul 2022 21:56:34 +0200
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: ax25tools axgetput compile error
From:   Thomas Osterried <thomas@osterried.de>
In-Reply-To: <e1a3b453-24d4-122e-9620-2c4ea2c69870@free.fr>
Date:   Sat, 30 Jul 2022 21:56:34 +0200
Cc:     linux-hams@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <66D07683-48DE-4429-AE6D-69C0E2F3E165@osterried.de>
References: <32aa83bc-481f-f025-023f-0c173b34efd4@free.fr>
 <e1a3b453-24d4-122e-9620-2c4ea2c69870@free.fr>
To:     Bernard f6bvp <f6bvp@free.fr>
X-Mailer: Apple Mail (2.3696.100.31)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello Bernard,

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
> This add made compilation possible ... although with a number of warnings in ax25tools compilation.

Ah. Oh. Interesiting.

Previous compiler versions "knew" what "int" is.
And yes, todays compilers also know what int is (i.e. int main() {};) -- without including sys/types.h.
But the preprocessor is "before" the actual compiling stuff. Perhaps there were reasons to make him less intelligent / more stupid.

I can't imagine why current gcc behaves so and considers this as error.


Btw, I recently compiled it on debian bullseye with

root@lax25-debug1:/usr/local/src/linux-ax25# gcc --version
gcc (Debian 10.2.1-6) 10.2.1 20210110
Copyright (C) 2020 Free Software Foundation, Inc.
..


> For example :
> 
> gcc -DHAVE_CONFIG_H -I. -I../.. -D_GNU_SOURCE   -g -O2 -MT axgetput.o -MD -MP -MF .deps/axgetput.Tpo -c -o axgetput.o axgetput.c
> axgetput.c: In function 'eol_convention':
> axgetput.c:115:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
>   115 |                 write(fderr, BIN_ON, strlen(BIN_ON));
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> axgetput.c:118:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
>   118 |                 write(fderr, BIN_OFF, strlen(BIN_OFF));
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> mv -f .deps/axgetput.Tpo .deps/axgetput.Po
> gcc  -g -O2   -o axgetput axgetput.o util.o proto_bin.o


1. on my debian bullseye, I only get these warnings:

roto_bin.c: In function ‘bput’:
proto_bin.c:167:44: warning: ‘%s’ directive writing up to 4096 bytes into a region of size 2027 [-Wformat-overflow=]
  167 |     sprintf(err_msg, "error: cannot unlink %s (%s)\n", filename, strerror(errno));
      |                                            ^~          ~~~~~~~~
proto_bin.c:167:5: note: ‘sprintf’ output 26 or more bytes (assuming 4122) into a destination of size 2048
  167 |     sprintf(err_msg, "error: cannot unlink %s (%s)\n", filename, strerror(errno));
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
proto_bin.c:173:41: warning: ‘%s’ directive writing up to 4096 bytes into a region of size 2029 [-Wformat-overflow=]
  173 |    sprintf(err_msg, "error: cannot open %s (%s)\n", filename, strerror(errno));
      |                                         ^~          ~~~~~~~~
proto_bin.c:173:4: note: ‘sprintf’ output 24 or more bytes (assuming 4120) into a destination of size 2048
  173 |    sprintf(err_msg, "error: cannot open %s (%s)\n", filename, strerror(errno));
      |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
proto_bin.c: In function ‘bget’:
proto_bin.c:334:41: warning: ‘%s’ directive writing up to 4096 bytes into a region of size 2029 [-Wformat-overflow=]
  334 |    sprintf(err_msg, "error: cannot open %s (%s)\n", filename, strerror(errno));
      |                                         ^~          ~~~~~~~~
proto_bin.c:334:4: note: ‘sprintf’ output 24 or more bytes (assuming 4120) into a destination of size 2048
  334 |    sprintf(err_msg, "error: cannot open %s (%s)\n", filename, strerror(errno));
      |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mv -f .deps/proto_bin.Tpo .deps/proto_bin.Po
gcc  -g -O2 -Wall   -o axgetput axgetput.o util.o proto_bin.o  


=>


Indeed, the compiler found a probable buffer overflow.
err_msg should be sizeof(PATH_MAX+x).
char err_msg[PATH_MAX*2];
should be sufficient for text and errorstring.


This warning I did not get with my compiler:

>> axgetput.c: In function 'eol_convention':
>> axgetput.c:113:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
>>   113 |                 write(fderr, BIN_ON, strlen(BIN_ON));
>>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> axgetput.c:116:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
>>   116 |                 write(fderr, BIN_OFF, strlen(BIN_OFF));
>>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> make[3]: *** [Makefile:380: axgetput.o] Error 1
>> make[3]: Leaving directory '/usr/local/src/ax25/linuxax25-master/ax25tools/ax25/axgetput'
>> make[2]: *** [Makefile:595: all-recursive] Error 1
>> make[2]: Leaving directory '/usr/local/src/ax25/linuxax25-master/ax25tools/ax25'
>> make[1]: *** [Makefile:392: all-recursive] Error 1
>> make[1]: Leaving directory '/usr/local/src/ax25/linuxax25-master/ax25tools'



I admit i did not care. We wrote almost nothing to fderr. I expected there will be always enough buffers. And if this fails, well, then user was disconnected, axspawn terminates and user childs like bash and this we (it's child axget or axput) will be forced to terminate anyway.

If we do not like to live with this warning, we can
either
  int throwaway;
  throwaway = write(fderr, BIN_OFF, strlen(BIN_OFF));

But this is so much ugly. Then we have to take the effort and do things right, like

again:
char *p = BIN_ON;
n = write(fderr, p, strlen(p));
if (n < p) {
  if (n > 0 && n < p)
    p = p+n;
  sleep(10);
  goto again;
}  // yes this is still really ugly. I doub't this is really needed here.
  

Or use the secure_write() from util.c. And if this returns -1, then exit(1).


I'll commit these changes later.
Currently we have a DNS problem. Tried to reach Ralf for weeks. If this runs in my personal timeout (-- soon...), then
we need to change the domain (I already have a plan).

vy 73,
	- Thomas  dl9sau




