Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 858085F048F
	for <lists+linux-hams@lfdr.de>; Fri, 30 Sep 2022 08:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbiI3GKQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hams@lfdr.de>); Fri, 30 Sep 2022 02:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbiI3GKD (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 30 Sep 2022 02:10:03 -0400
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B69413686F
        for <linux-hams@vger.kernel.org>; Thu, 29 Sep 2022 23:09:57 -0700 (PDT)
X-Envelope-From: thomas@osterried.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 28U69noq3697126
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Fri, 30 Sep 2022 08:09:50 +0200
Received: from x-berg.in-berlin.de ([217.197.86.42] helo=smtpclient.apple)
        by x-berg.in-berlin.de with esmtpa (Exim 4.94.2)
        (envelope-from <thomas@osterried.de>)
        id 1oe9DZ-0002kK-Cw; Fri, 30 Sep 2022 08:09:49 +0200
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Problems in compiling ax25apps on modern systems -- FIXED
From:   Thomas Osterried <thomas@osterried.de>
In-Reply-To: <b3dcd90a-0217-1eba-dfb8-e949c9d7af85@trinnet.net>
Date:   Fri, 30 Sep 2022 08:09:48 +0200
Cc:     "Bernard, f6bvp" <f6bvp@free.fr>, linux-hams@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <DED3A740-397D-43D9-B025-9A65AC7D0331@osterried.de>
References: <43ef460e-d884-87ad-b865-0b8dcd1cd9a8@trinnet.net>
 <f18c0409-dd3a-71cf-6f4f-dab05c600ea2@trinnet.net>
 <2CEB20FD-4469-4014-80DF-13858987B5B1@osterried.de>
 <b3dcd90a-0217-1eba-dfb8-e949c9d7af85@trinnet.net>
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

> Am 26.09.2022 um 23:39 schrieb David Ranch <dranch@trinnet.net>:
> 
> 
> Hello Everyone,
> 
> Thomas: 
> 
>>  
>> I installed ubuntu 22.02
>> $ cat /etc/apt/sources.list|grep -v ^# |grep -v ^$
>> deb 
>> http://de.archive.ubuntu.com/ubuntu
>>  jammy main restricted universe multiverse
>> deb 
>> http://de.archive.ubuntu.com/ubuntu
>>  jammy-updates main restricted universe multiverse
>> deb 
>> http://de.archive.ubuntu.com/ubuntu
>>  jammy-security main restricted universe multiverse
>> deb 
>> http://de.archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse
> 
> That looks fine
> 
> 
>> $ gcc --version
>> gcc (Ubuntu 11.2.0-19ubuntu1) 11.2.0
>> 
> 
> That looks fine
> 
> 
>> ax25-apps:
>> ==========
>> 
>> . . .
>> $ make
>> ...
>> make[2]: Leaving directory '/usr/local/src/ax25-apps-tools-libax25/ax25-apps/ax25mond'
>> make[2]: Entering directory '/usr/local/src/ax25-apps-tools-libax25/ax25-apps'
>> make[2]: Leaving directory '/usr/local/src/ax25-apps-tools-libax25/ax25-apps'
>> make[1]: Leaving directory '/usr/local/src/ax25-apps-tools-libax25/ax25-apps'
>> ubuntu-test$ echo $?
>> 0
>> 
> 
> I assume you deleted out all the various compile lines and various binaries were indeed installed

??

I installed with apt-get install make autoconf automake zlib1g-dev libtool the necessary programs.
The compiled libs and programs were installed correct.
I did only paste in my e-mail just the relevant / interesting lines.


>> ax25-tools:
>> ===========
>> 
> 
> What is the source of your ax25tools?  You need to be using the master branch from https://github.com/ve7fet/linuxax25  (not your repo per se)

Of course I tested linux-ax25.in-berlin.de.

In the original thread, https://www.spinics.net/lists/linux-hams/msg05068.html , Bernard did not mention if he uses a clone.

In your e-mail of 2022-09-21, you asked me to commit the changes.
So I did a compile test on the mentioned ubuntu 2022-04.

It compiled.
So I dig into and found, that nothing needed to add (include <sys/types.h> is already included since 23 years), and nothing to be removed from the macro (because the variable AC_FUNC_MALLOC is not there).


>> $ autoreconf --install --force
>> configure.ac:31: warning: The macro `AC_HEADER_STDC' is obsolete.
>> configure.ac:31: You should run autoupdate.
>> ./lib/autoconf/headers.m4:704: AC_HEADER_STDC is expanded from...
>> configure.ac:31: the top level
>> configure.ac:52: warning: The macro `AC_HEADER_TIME' is obsolete.
>> configure.ac:52: You should run autoupdate.
>> ./lib/autoconf/headers.m4:743: AC_HEADER_TIME is expanded from...
>> configure.ac:52: the top level
>> configure.ac:59: warning: AC_FUNC_WAIT3: `wait3' has been removed from POSIX.
>> configure.ac:59: Remove this `AC_FUNC_WAIT3' and adjust your code to use `waitpid' instead.
>> ./lib/autoconf/functions.m4:2053: AC_FUNC_WAIT3 is expanded from...
>> configure.ac:59: the top level
>> configure.ac:10: installing './compile'
>> configure.ac:4: installing './install-sh'
>> configure.ac:4: installing './missing'
>> 6pack/Makefile.am: installing './depcomp'
>> Makefile.am: installing './INSTALL'
>> 
> 
> 
> I see the following output when I run "autoreconf --install"  where I'm NOT using the "--force" option.  It's interesting that I'm seeing MORE output than you:
> 
> --
> configure.ac:4: warning: The macro `AC_CONFIG_HEADER' is obsolete.
> configure.ac:4: You should run autoupdate.
> ./lib/autoconf/status.m4:719: AC_CONFIG_HEADER is expanded from...
> configure.ac:4: the top level
> configure.ac:52: warning: Checking for headers with the preprocessor is
> configure.ac:52: deprecated. Specify prerequisite code to AC_CHECK_HEADER
> configure.ac:52: instead of using fourth argument `-'. (Many headers need
> configure.ac:52: no prerequisites. If you truly need to test whether
> configure.ac:52: something passes the preprocessor but not the compiler,
> configure.ac:52: use AC_PREPROC_IFELSE.)
> ./lib/autoconf/headers.m4:115: _AC_CHECK_HEADER_PREPROC is expanded from...
> ./lib/autoconf/headers.m4:56: AC_CHECK_HEADER is expanded from...
> lib/m4sugar/m4sh.m4:651: AS_FOR is expanded from...
> ./lib/autoconf/headers.m4:217: AC_CHECK_HEADERS is expanded from...
> configure.ac:52: the top level
> configure.ac:64: warning: The macro `AC_HEADER_STDC' is obsolete.
> configure.ac:64: You should run autoupdate.
> ./lib/autoconf/headers.m4:704: AC_HEADER_STDC is expanded from...
> configure.ac:64: the top level
> configure.ac:77: warning: The macro `AC_HEADER_TIME' is obsolete.
> configure.ac:77: You should run autoupdate.
> ./lib/autoconf/headers.m4:743: AC_HEADER_TIME is expanded from...
> configure.ac:77: the top level
> configure.ac:86: warning: The macro `AC_TYPE_SIGNAL' is obsolete.
> configure.ac:86: You should run autoupdate.
> ./lib/autoconf/types.m4:776: AC_TYPE_SIGNAL is expanded from...
> configure.ac:86: the top level
> configure.ac:20: installing './compile'
> configure.ac:81: installing './config.guess'
> configure.ac:81: installing './config.sub'
> configure.ac:5: installing './install-sh'
> configure.ac:5: installing './missing'
> 6pack/Makefile.am: installing './depcomp'
> --


You said you use https://github.com/ve7fet/linuxax25 . That's another repo. If the one is broken and the other isn't, you get different results.


>> $ ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --mandir=/usr/share/man 
>> checking that generated files are newer than configure... done
>> configure: creating ./config.status
>> config.status: creating netrom/Makefile
>> config.status: creating tcpip/Makefile
>> config.status: creating ax25/Makefile
>> config.status: creating ax25/axgetput/Makefile
>> config.status: creating Makefile
>> config.status: creating rose/Makefile
>> config.status: creating user_call/Makefile
>> config.status: creating kiss/Makefile
>> config.status: creating 6pack/Makefile
>> config.status: creating hdlcutil/Makefile
>> config.status: creating hdlcutil/fl/Makefile
>> config.status: creating yamdrv/Makefile
>> config.status: creating dmascc/Makefile
>> config.status: creating ax25-tools.spec
>> config.status: creating config.h
>> config.status: executing depfiles commands
>> 
> 
> I run "./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --datadir=/usr/share --datarootdir=/usr/share" and it works ok.
> 
> 
> 
>> $ make
>> ...
>> make[2]: Leaving directory '/usr/local/src/ax25-apps-tools-libax25/ax25-tools/dmascc'
>> make[2]: Entering directory '/usr/local/src/ax25-apps-tools-libax25/ax25-tools'
>> make[2]: Leaving directory '/usr/local/src/ax25-apps-tools-libax25/ax25-tools'
>> make[1]: Leaving directory '/usr/local/src/ax25-apps-tools-libax25/ax25-tools'
>> ubuntu-test$ echo $?
>> 0
>> 
> 
> When I run "make" (without any -j option), I get an instant failure:
> --
> make  all-recursive
> make[1]: Entering directory '/usr/src/packaging/linuxax25-test2/ax25tools'
> Making all in ax25
> make[2]: Entering directory '/usr/src/packaging/linuxax25-test2/ax25tools/ax25'
> Making all in axgetput
> make[3]: Entering directory '/usr/src/packaging/linuxax25-test2/ax25tools/ax25/axgetput'
> gcc -DHAVE_CONFIG_H -I. -I../..  -D_GNU_SOURCE   -g -O2 -MT axgetput.o -MD -MP -MF .deps/axgetput.Tpo -c -o axgetput.o axgetput.c
> In file included from axgetput.c:18:
> ../../config.h:308:16: error: two or more data types in declaration specifiers
>   308 | #define mode_t int
>       |                ^~~
> ../../config.h:311:15: error: two or more data types in declaration specifiers
>   311 | #define pid_t int
>       |               ^~~
> axgetput.c: In function ?eol_convention?:
> axgetput.c:113:17: warning: ignoring return value of ?write? declared with attribute ?warn_unused_result? [-Wunused-result]
>   113 |                 write(fderr, BIN_ON, strlen(BIN_ON));
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> axgetput.c:116:17: warning: ignoring return value of ?write? declared with attribute ?warn_unused_result? [-Wunused-result]
>   116 |                 write(fderr, BIN_OFF, strlen(BIN_OFF));
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> make[3]: *** [Makefile:380: axgetput.o] Error 1
> make[3]: Leaving directory '/usr/src/packaging/linuxax25-test2/ax25tools/ax25/axgetput'
> make[2]: *** [Makefile:595: all-recursive] Error 1
> make[2]: Leaving directory '/usr/src/packaging/linuxax25-test2/ax25tools/ax25'
> make[1]: *** [Makefile:392: all-recursive] Error 1
> make[1]: Leaving directory '/usr/src/packaging/linuxax25-test2/ax25tools'
> make: *** [Makefile:331: all] Error 2
> --

Other source trees, other errors..

>> $ make clean; make 2>&1|grep -i warni |cut -d: -f4-|sort -u
>>  warning: '%s' directive writing up to 4096 bytes into a region of size 2010 [-Wformat-overflow=]
>>  warning: '%s' directive writing up to 4096 bytes into a region of size 2027 [-Wformat-overflow=]
>>  warning: '%s' directive writing up to 4096 bytes into a region of size 2029 [-Wformat-overflow=]
>>  warning: '__builtin___strncat_chk' output truncated copying between 0 and 6 bytes from a string of length 7 [-Wstringop-truncation]
>>  warning: '__builtin_strncat' output truncated copying between 0 and 6 bytes from a string of length 7 [-Wstringop-truncation]
>>  warning: '__builtin_strncpy' output may be truncated copying 11 bytes from a string of length 11 [-Wstringop-truncation]
>>  warning: '__builtin_strncpy' specified bound 12 equals destination size [-Wstringop-truncation]
>>  warning: '__builtin_strncpy' specified bound 128 equals destination size [-Wstringop-truncation]
>>  warning: array subscript 'struct sockaddr_rose[0]' is partly outside array bounds of 'struct sockaddr[1]' [-Warray-bounds]
>>  warning: ignoring return value of 'chdir' declared with attribute 'warn_unused_result' [-Wunused-result]
>>  warning: ignoring return value of 'chown' declared with attribute 'warn_unused_result' [-Wunused-result]
>>  warning: ignoring return value of 'fchown' declared with attribute 'warn_unused_result' [-Wunused-result]
>>  warning: ignoring return value of 'fgets' declared with attribute 'warn_unused_result' [-Wunused-result]
>>  warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
>> 
>> 
>> => success
>> 
> 
> If you look closely, that "make" isn't actually doing anything.  Just do a "make" and you should see the errors I'm seeing.

Did it before. And I wrote success because it succeeded.

This command above was for you (and me) to see warnings (warnings are non-critical) that the latest gcc compiler shows. This is helpful; previous compilers were not so verbose.

>> What's even more irritating:
>> 
>> 1. most of your sys/types.h are already present:
>> 
>> $ for dir in ax25-apps/ ax25-tools/ libax25/; do echo $dir; (cd $dir ; echo $(find . -type f -name \*.c -exec grep -H "^#include <sys/types.h>" '{}' ';' |cut -d: -f1|cut -d/ -f2-) ); done
>> ax25-apps/
>> listen/listen.c listen/rspfdump.c call/call.c call/yapp.c ax25mond/ax25mond.c ax25ipd/routing.c ax25ipd/bpqether.c ax25ipd/io.c ax25ipd/config.c ax25rtd/cache_dump.c ax25rtd/ax25rtd.c ax25rtd/ax25rtctl.c
>> ax25-tools/
>> user_call/netrom_call.c user_call/ax25_call.c user_call/user_io.c user_call/rose_call.c user_call/tcp_call.c rose/rsmemsiz.c rose/rsparms.c rose/rsdwnlnk.c rose/rsuplnk.c hdlcutil/hdrvcomm.c hdlcutil/smmixer.c hdlcutil/sethdlc.c hdlcutil/smdiag.c tcpip/rip98t.c tcpip/rip98d.c tcpip/ttylinkd.c tcpip/rip98r.c 6pack/m6pack.c netrom/netromd.c netrom/nodesave.c netrom/netromr.c netrom/netromt.c netrom/nrparms.c netrom/nrsdrv.c ax25/axparms.c ax25/mheard.c ax25/ax25d.c ax25/rxecho.c ax25/axctl.c ax25/mheardd.c ax25/beacon.c ax25/axspawn.c ax25/access.c yamdrv/yamcfg.c kiss/net2kiss.c kiss/kissnetd.c kiss/mkiss.c kiss/kissattach.c
>> libax25/
>> rsconfig.c axconfig.c nrconfig.c
>> 
> 
> Please uninstall any existing ax25 deb packages and/or "make install" based binaries/libraries/etc and only build from the ground up using the VE7FET repo.

Sorry, I'm not the right person to ask for.


>> 2. You dif'ed "-AC_FUNC_MALLOC":
>> $ find . -type f -exec grep -H 'AC_FUNC_MALLOC' '{}' ';'  
>> $ 
>> -> it is not in the source tree
>> 
> 
> It's there in the VE7FET repo:
> --
> /usr/src/packaging/linuxax25-test2/ax25tools$ find . -type f -exec grep -H 'AC_FUNC_MALLOC' '{}' ';'  
> ./configure.ac:AC_FUNC_MALLOC
> --
> 
> 
> 
>> Conclusion:
>> I found nothing to fix. 
>> Instead of looking for possible compiler incompatibilities of current ubuntu 22.04 (I showed I've found none), I ask the question about what you are currently tested.
>> It can't be the current git tree.
>> 
> 
> I have to assume you are not using the VE7FET sources and instead, you're using your own git repo.

Correct.

>> That brings me to the next, unfortunately unsurprising fact, that the domain linux-ax25.org has technical problems, and the one who could solve it, is not reachable.
>> I'm considering some options.
>> Until then (and even afterwards, because the long existing internal hostname linux-ax25.in-berlin.de is future-prove), I'd like to bring back in mind the git and compilation info:
>>   
>> https://linux-ax25.in-berlin.de/wiki/GIT
>> 
>>   
>> https://linux-ax25.in-berlin.de/wiki/Compilation
> 
> Ok.. thank you for getting an alternative site working!
> 
> --David
> KI6ZHD
> 

vy 73,
	- Thomas  dl9sau
