Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EDC55E798D
	for <lists+linux-hams@lfdr.de>; Fri, 23 Sep 2022 13:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231418AbiIWL0t convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hams@lfdr.de>); Fri, 23 Sep 2022 07:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbiIWL0K (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 23 Sep 2022 07:26:10 -0400
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A3322535
        for <linux-hams@vger.kernel.org>; Fri, 23 Sep 2022 04:26:05 -0700 (PDT)
X-Envelope-From: thomas@osterried.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 28NBPvFe2422386
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Fri, 23 Sep 2022 13:25:57 +0200
Received: from x-berg.in-berlin.de ([217.197.86.42] helo=smtpclient.apple)
        by x-berg.in-berlin.de with esmtpa (Exim 4.94.2)
        (envelope-from <thomas@osterried.de>)
        id 1obgoe-00065y-Qv; Fri, 23 Sep 2022 13:25:56 +0200
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Problems in compiling ax25apps on modern systems -- FIXED
From:   Thomas Osterried <thomas@osterried.de>
In-Reply-To: <f18c0409-dd3a-71cf-6f4f-dab05c600ea2@trinnet.net>
Date:   Fri, 23 Sep 2022 13:25:56 +0200
Cc:     "Bernard, f6bvp" <f6bvp@free.fr>, linux-hams@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <2CEB20FD-4469-4014-80DF-13858987B5B1@osterried.de>
References: <43ef460e-d884-87ad-b865-0b8dcd1cd9a8@trinnet.net>
 <f18c0409-dd3a-71cf-6f4f-dab05c600ea2@trinnet.net>
To:     David Ranch <dranch@trinnet.net>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello,

sorry, I can't reproduce.

I installed ubuntu 22.02
$ cat /etc/apt/sources.list|grep -v ^# |grep -v ^$
deb http://de.archive.ubuntu.com/ubuntu jammy main restricted universe multiverse
deb http://de.archive.ubuntu.com/ubuntu jammy-updates main restricted universe multiverse
deb http://de.archive.ubuntu.com/ubuntu jammy-security main restricted universe multiverse
deb http://de.archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse


$ gcc --version
gcc (Ubuntu 11.2.0-19ubuntu1) 11.2.0



libax25:
========

$ autoreconf --install --force
libtoolize: putting auxiliary files in '.'.
libtoolize: copying file './ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
libtoolize: copying file 'm4/libtool.m4'
libtoolize: copying file 'm4/ltoptions.m4'
libtoolize: copying file 'm4/ltsugar.m4'
libtoolize: copying file 'm4/ltversion.m4'
libtoolize: copying file 'm4/lt~obsolete.m4'
configure.ac:20: warning: The macro `AC_HEADER_STDC' is obsolete.
configure.ac:20: You should run autoupdate.
./lib/autoconf/headers.m4:704: AC_HEADER_STDC is expanded from...
configure.ac:20: the top level
configure.ac:10: installing './compile'
configure.ac:5: installing './missing'
Makefile.am: installing './depcomp'


$ ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --mandir=/usr/share/man 
...
hecking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating Makefile
config.status: creating libax25.spec
config.status: creating config.h
config.status: config.h is unchanged
config.status: executing depfiles commands
config.status: executing libtool commands

$ make
[no error, no warning|
$ echo $?
0
$

=> success


ax25-apps:
==========

$ autoreconf --install --force
configure.ac:36: warning: The macro `AC_HEADER_STDC' is obsolete.
configure.ac:36: You should run autoupdate.
./lib/autoconf/headers.m4:704: AC_HEADER_STDC is expanded from...
configure.ac:36: the top level
configure.ac:44: warning: The macro `AC_HEADER_TIME' is obsolete.
configure.ac:44: You should run autoupdate.
./lib/autoconf/headers.m4:743: AC_HEADER_TIME is expanded from...
configure.ac:44: the top level
configure.ac:10: installing './compile'
configure.ac:4: installing './install-sh'
configure.ac:4: installing './missing'
Makefile.am: installing './INSTALL'
ax25ipd/Makefile.am: installing './depcomp'

$ ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --mandir=/usr/share/man 
...
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating call/Makefile
config.status: creating ax25ipd/Makefile
config.status: creating listen/Makefile
config.status: creating Makefile
config.status: creating ax25rtd/Makefile
config.status: creating ax25mond/Makefile
config.status: creating ax25-apps.spec
config.status: creating config.h
config.status: executing depfiles commands

$ make
...
make[2]: Leaving directory '/usr/local/src/ax25-apps-tools-libax25/ax25-apps/ax25mond'
make[2]: Entering directory '/usr/local/src/ax25-apps-tools-libax25/ax25-apps'
make[2]: Leaving directory '/usr/local/src/ax25-apps-tools-libax25/ax25-apps'
make[1]: Leaving directory '/usr/local/src/ax25-apps-tools-libax25/ax25-apps'
ubuntu-test$ echo $?
0
$

warnings about ignored return values of fgets(), read(), system(), fgwrite(),
and sprintf, strncpy possible overflows (which is a friendly info and has to be fixed).
In detail:
  $ make clean: make 2>&1|grep -i warni |cut -d: -f4-|sort -u
   warning: '%s' directive writing up to 1021 bytes into a region of size 65 [-Wformat-overflow=]
   warning: '%s' directive writing up to 1021 bytes into a region of size between 32 and 68 [-Wformat-overflow=]
   warning: '%s' directive writing up to 1021 bytes into a region of size between 38 and 57 [-Wformat-overflow=]
   warning: '__builtin___strncpy_chk' output may be truncated copying between 0 and 9 bytes from a string of length 12 [-Wstringop-truncation]
   warning: '__builtin_strncpy' output may be truncated copying 12 bytes from a string of length 1012 [-Wstringop-truncation]
   warning: 'parmsbytes' may be used uninitialized in this function [-Wmaybe-uninitialized]
   warning: ignoring return value of 'fgets' declared with attribute 'warn_unused_result' [-Wunused-result]
   warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
   warning: ignoring return value of 'system' declared with attribute 'warn_unused_result' [-Wunused-result]
   warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]

=> success


ax25-tools:
===========

$ autoreconf --install --force
configure.ac:31: warning: The macro `AC_HEADER_STDC' is obsolete.
configure.ac:31: You should run autoupdate.
./lib/autoconf/headers.m4:704: AC_HEADER_STDC is expanded from...
configure.ac:31: the top level
configure.ac:52: warning: The macro `AC_HEADER_TIME' is obsolete.
configure.ac:52: You should run autoupdate.
./lib/autoconf/headers.m4:743: AC_HEADER_TIME is expanded from...
configure.ac:52: the top level
configure.ac:59: warning: AC_FUNC_WAIT3: `wait3' has been removed from POSIX.
configure.ac:59: Remove this `AC_FUNC_WAIT3' and adjust your code to use `waitpid' instead.
./lib/autoconf/functions.m4:2053: AC_FUNC_WAIT3 is expanded from...
configure.ac:59: the top level
configure.ac:10: installing './compile'
configure.ac:4: installing './install-sh'
configure.ac:4: installing './missing'
6pack/Makefile.am: installing './depcomp'
Makefile.am: installing './INSTALL'


$ ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --mandir=/usr/share/man 
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating netrom/Makefile
config.status: creating tcpip/Makefile
config.status: creating ax25/Makefile
config.status: creating ax25/axgetput/Makefile
config.status: creating Makefile
config.status: creating rose/Makefile
config.status: creating user_call/Makefile
config.status: creating kiss/Makefile
config.status: creating 6pack/Makefile
config.status: creating hdlcutil/Makefile
config.status: creating hdlcutil/fl/Makefile
config.status: creating yamdrv/Makefile
config.status: creating dmascc/Makefile
config.status: creating ax25-tools.spec
config.status: creating config.h
config.status: executing depfiles commands


$ make
...
make[2]: Leaving directory '/usr/local/src/ax25-apps-tools-libax25/ax25-tools/dmascc'
make[2]: Entering directory '/usr/local/src/ax25-apps-tools-libax25/ax25-tools'
make[2]: Leaving directory '/usr/local/src/ax25-apps-tools-libax25/ax25-tools'
make[1]: Leaving directory '/usr/local/src/ax25-apps-tools-libax25/ax25-tools'
ubuntu-test$ echo $?
0

warnings about ignored return values of chdir(), chown, fchown, gets(), write
and sprtintf, strrncat, strncpy possible overflows (which is a friendly info and has to be fixed).
In detail:

$ make clean; make 2>&1|grep -i warni |cut -d: -f4-|sort -u
 warning: '%s' directive writing up to 4096 bytes into a region of size 2010 [-Wformat-overflow=]
 warning: '%s' directive writing up to 4096 bytes into a region of size 2027 [-Wformat-overflow=]
 warning: '%s' directive writing up to 4096 bytes into a region of size 2029 [-Wformat-overflow=]
 warning: '__builtin___strncat_chk' output truncated copying between 0 and 6 bytes from a string of length 7 [-Wstringop-truncation]
 warning: '__builtin_strncat' output truncated copying between 0 and 6 bytes from a string of length 7 [-Wstringop-truncation]
 warning: '__builtin_strncpy' output may be truncated copying 11 bytes from a string of length 11 [-Wstringop-truncation]
 warning: '__builtin_strncpy' specified bound 12 equals destination size [-Wstringop-truncation]
 warning: '__builtin_strncpy' specified bound 128 equals destination size [-Wstringop-truncation]
 warning: array subscript 'struct sockaddr_rose[0]' is partly outside array bounds of 'struct sockaddr[1]' [-Warray-bounds]
 warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
 warning: ignoring return value of 'chown' declared with attribute 'warn_unused_result' [-Wunused-result]
 warning: ignoring return value of 'fchown' declared with attribute 'warn_unused_result' [-Wunused-result]
 warning: ignoring return value of 'fgets' declared with attribute 'warn_unused_result' [-Wunused-result]
 warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]


=> success



What's even more irritating:

1. most of your sys/types.h are already present:

$ for dir in ax25-apps/ ax25-tools/ libax25/; do echo $dir; (cd $dir ; echo $(find . -type f -name \*.c -exec grep -H "^#include <sys/types.h>" '{}' ';' |cut -d: -f1|cut -d/ -f2-) ); done
ax25-apps/
listen/listen.c listen/rspfdump.c call/call.c call/yapp.c ax25mond/ax25mond.c ax25ipd/routing.c ax25ipd/bpqether.c ax25ipd/io.c ax25ipd/config.c ax25rtd/cache_dump.c ax25rtd/ax25rtd.c ax25rtd/ax25rtctl.c
ax25-tools/
user_call/netrom_call.c user_call/ax25_call.c user_call/user_io.c user_call/rose_call.c user_call/tcp_call.c rose/rsmemsiz.c rose/rsparms.c rose/rsdwnlnk.c rose/rsuplnk.c hdlcutil/hdrvcomm.c hdlcutil/smmixer.c hdlcutil/sethdlc.c hdlcutil/smdiag.c tcpip/rip98t.c tcpip/rip98d.c tcpip/ttylinkd.c tcpip/rip98r.c 6pack/m6pack.c netrom/netromd.c netrom/nodesave.c netrom/netromr.c netrom/netromt.c netrom/nrparms.c netrom/nrsdrv.c ax25/axparms.c ax25/mheard.c ax25/ax25d.c ax25/rxecho.c ax25/axctl.c ax25/mheardd.c ax25/beacon.c ax25/axspawn.c ax25/access.c yamdrv/yamcfg.c kiss/net2kiss.c kiss/kissnetd.c kiss/mkiss.c kiss/kissattach.c
libax25/
rsconfig.c axconfig.c nrconfig.c

I pick up one example:
> --- ax25/beacon.c.orig    2022-09-21 10:06:09.105941772 -0700
> +++ ax25/beacon.c    2022-09-21 10:06:33.681786202 -0700
> @@ -1,3 +1,4 @@
> +#include <sys/types.h

https://linux-ax25.in-berlin.de/cgit/ax25-tools.git/commit/ax25/beacon.c?id=17287576555a5c46fa23549e2e5f073660dccb70
-> already in there since 1999-04-21  (!!)



2. You dif'ed "-AC_FUNC_MALLOC":
$ find . -type f -exec grep -H 'AC_FUNC_MALLOC' '{}' ';'  
$ 
-> it is not in the source tree


Conclusion:
I found nothing to fix. 
Instead of looking for possible compiler incompatibilities of current ubuntu 22.04 (I showed I've found none), I ask the question about what you are currently tested.
It can't be the current git tree.



That brings me to the next, unfortunately unsurprising fact, that the domain linux-ax25.org has technical problems, and the one who could solve it, is not reachable.
I'm considering some options.
Until then (and even afterwards, because the long existing internal hostname linux-ax25.in-berlin.de is future-prove), I'd like to bring back in mind the git and compilation info:
  https://linux-ax25.in-berlin.de/wiki/GIT
  https://linux-ax25.in-berlin.de/wiki/Compilation

I'll come back to the topic of the fqdn change in a separate mail.


vy 73,
	- Thomas  dl9sau

> Am 21.09.2022 um 20:15 schrieb David Ranch <dranch@trinnet.net>:
> 
> 
> Hey Bernard, Thomas,
> 
> I just sent the following email to a user who was having problems with compiling the ax25tools package.  While I did find your email thread between eachother about this issue, I found the resolution to be incomplete.  I have come up with the following detail that is complete and allows me to complete the compilation.
> 
> Bernard: Would you please verify these changes and if you agree, can you please commit them into VE7FET repo?
> 
> Thomas: Now that you have complete control of the official ax.25 packages, repos, etc. at http://linux-ax25.in-berlin.de/wiki/Main_Page, can you commit these changes into your Git repo?  In addition to this, maybe it's time that we can discuss the merge of these two repos back into your repo and deprecate the VE7FET one.  I understand there are some fundamental differences between the two repos but I feel we cannot afford to continue this fork considering the small community, the confusion the fork has been creating, etc.
> 
> 
> --David
> 
> 
> -------- Forwarded Message --------
> Subject:	Re: Alpha Document of HamDigify Ubuntu
> Date:	Wed, 21 Sep 2022 10:56:34 -0700
> From:	David Ranch <dranch@trinnet.net>
> To:	Chuck Smith <chksmithcis@gmail.com>
> 
> 
> 
> Hello Chuck,
> 
>> Wanted to provide some feedback for installing the VE7FET ax25tools package per the raspberry pi setup docs.  I have no idea if anyone else has had the issues I describe below.  Note that I am attempting to install on Linux Mint 21 in a Virtual Box VM.  
> 
> I confirmed that things are also failing on Ubuntu 22.04 running "gcc version 11.2.0 (Ubuntu 11.2.0-19ubuntu1) " though it compiles on u20.04.  In Googling around, this was previously discussed here:
> 
>    https://www.spinics.net/lists/linux-hams/msg05068.html
> 
> 
> In that thread, it was partially fixed by:
> 
> 1. Adding the following line:
>    --
>    #include <sys/types.h>
>    --
> 
>    To the following files:
> 
>       - ax25/axgetput/axgetput.c  just after the top comment block in the
>      - to the TOP line in the files: 
>          ax25/axgetput/axgetput.c
>          ax25/beacon.c 
>          rose/rsuplnk.c 
>          rose/rsdwnlnk.c
>          tcpip/rip98d.c
> 
> 
> Instead of doing this manually, here is a patch file that should make these changes for you:
> --
> 
> --- ax25/axgetput/axgetput.c.orig    2022-09-21 09:52:27.435144017 -0700
> +++ ax25/axgetput/axgetput.c    2022-09-21 10:02:10.099454962 -0700
> @@ -14,6 +14,8 @@
>   *
>   */
>  
> +#include <sys/types.h>
> +
>  #ifdef HAVE_CONFIG_H
>  #include <config.h>
>  #endif
> 
> 
> --- ax25/beacon.c.orig    2022-09-21 10:06:09.105941772 -0700
> +++ ax25/beacon.c    2022-09-21 10:06:33.681786202 -0700
> @@ -1,3 +1,4 @@
> +#include <sys/types.h>
>  #include <config.h>
>  #include <unistd.h>
>  #include <stdio.h>
> 
> 
> --- rose/rsuplnk.c.orig    2022-09-21 10:21:51.504492235 -0700
> +++ rose/rsuplnk.c    2022-09-21 10:23:33.903936174 -0700
> @@ -1,3 +1,4 @@
> +#include <sys/types.h>
>  #include <stdio.h>
>  #include <string.h>
>  #include <unistd.h>
> 
> 
> --- ./rose/rsdwnlnk.c.orig    2022-09-21 10:36:20.171506951 -0700
> +++ ./rose/rsdwnlnk.c    2022-09-21 10:37:31.995078639 -0700
> @@ -1,3 +1,4 @@
> +#include <sys/types.h>
>  #include <stdio.h>
>  #include <string.h>
>  #include <unistd.h>
> 
> 
> --- ./tcpip/rip98d.c.orig    2022-09-21 10:40:31.466003550 -0700
> +++ ./tcpip/rip98d.c    2022-09-21 10:40:51.537882952 -0700
> @@ -1,4 +1,4 @@
> -
> +#include <sys/types.h>
>  #ifdef HAVE_CONFIG_H
>  #include <config.h>
>  #endif
> 
> --
> 
> 
> 2. You need to modify the configure.ac file to DELETE one line:
> 
>    --
>    AC_FUNC_MALLOC
>    --
> 
> 
> 
> Instead of doing this manually, here is a patch file that should make these changes for you:
> 
> --
> 
> --- configure.ac.orig    2022-09-21 10:10:52.756146179 -0700
> +++ configure.ac    2022-09-21 10:11:20.035973476 -0700
> @@ -80,7 +80,6 @@
>  dnl Checks for library functions.
>  AC_FUNC_CHOWN
>  AC_FUNC_FORK
> -AC_FUNC_MALLOC
>  AC_FUNC_MEMCMP
>  AC_FUNC_SELECT_ARGTYPES
>  AC_TYPE_SIGNAL
> 
> --
> 
> 
> Once you complete those changes, then run the commands:
> 
>    autoreconf --install
> 
>    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --datadir=/usr/share --datarootdir=/usr/share
> 
>    make -j8
> 
> --David

