Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAF285E913D
	for <lists+linux-hams@lfdr.de>; Sun, 25 Sep 2022 08:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiIYGZQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hams@lfdr.de>); Sun, 25 Sep 2022 02:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiIYGZP (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 25 Sep 2022 02:25:15 -0400
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E0A11A0F
        for <linux-hams@vger.kernel.org>; Sat, 24 Sep 2022 23:25:09 -0700 (PDT)
X-Envelope-From: thomas@osterried.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 28P6P3n23585903
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Sun, 25 Sep 2022 08:25:03 +0200
Received: from x-berg.in-berlin.de ([217.197.86.42] helo=smtpclient.apple)
        by x-berg.in-berlin.de with esmtpa (Exim 4.94.2)
        (envelope-from <thomas@osterried.de>)
        id 1ocL4Z-00021Z-2O; Sun, 25 Sep 2022 08:25:03 +0200
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Problems in compiling ax25apps on modern systems -- nothing to
 fix?
From:   Thomas Osterried <thomas@osterried.de>
In-Reply-To: <0bb5641b-53a8-ff10-1dbe-b4ac913421e2@gmail.com>
Date:   Sun, 25 Sep 2022 08:25:02 +0200
Cc:     David Ranch <dranch@trinnet.net>, linux-hams@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <65A875CE-F0F9-4008-AC96-29AB6E95FF50@osterried.de>
References: <43ef460e-d884-87ad-b865-0b8dcd1cd9a8@trinnet.net>
 <f18c0409-dd3a-71cf-6f4f-dab05c600ea2@trinnet.net>
 <2CEB20FD-4469-4014-80DF-13858987B5B1@osterried.de>
 <0bb5641b-53a8-ff10-1dbe-b4ac913421e2@gmail.com>
To:     Bernard Pidoux <bernard.f6bvp@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,NORMAL_HTTP_TO_IP,
        NUMERIC_HTTP_ADDR,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello Bernard,

congrats, but it does not answer my question.

You mentioned in https://www.spinics.net/lists/linux-hams/msg05082.html compilation errors,
and David sent fixes and askmne to apply, for a problem that I cannot reproduce.

Even more, David's suggested to
  add includes that already exist in the ax25-apps/-tools since 23 years,
and to remove a macro in configure.ac that does not exist. -- with the result that nothing is left to be patched.

I'm still confused about your problems.

vy 73,
	- Thomas  dl9sau



> Am 24.09.2022 um 19:40 schrieb Bernard Pidoux <bernard.f6bvp@gmail.com>:
> 
> Hi David,
> 
> I am using the last kernel available for RaspBerry Pi that includes my recent patch reparing ROSE broken since 5.4.78.
> 
> Linux F6BVP-8 5.15.68-v7+ #1586 SMP Fri Sep 16 12:07:16 BST 2022 armv7l GNU/Linux
> 
> 
> Using the following instructions I can install AX25 library, tools and apps without issues.
> 
> http://44.168.19.18/configuration6_RPi.html
> 
> 
> 
> My updAX25 script is getting and installing AX25 library, tools and apps sources from :
> 
> 
> 
> wget https://github.com/ve7fet/linuxax25/archive/master.zip
> 
> 
> 
> Gcc :
> 
> 
> 
> Using built-in specs.
> 
> COLLECT_GCC=gcc
> 
> COLLECT_LTO_WRAPPER=/usr/lib/gcc/arm-linux-gnueabihf/8/lto-wrapper
> 
> Target: arm-linux-gnueabihf
> 
> Configured with: ../src/configure -v --with-pkgversion='Raspbian 8.3.0-6+rpi1' --with-bugurl=file:///usr/share/doc/gcc-8/README.Bugs --enable-languages=c,ada,c++,go,d,fortran,objc,obj-c++ --prefix=/usr --with-gcc-major-version-only --program-suffix=-8 --program-prefix=arm-linux-gnueabihf- --enable-shared --enable-linker-build-id --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --libdir=/usr/lib --enable-nls --enable-bootstrap --enable-clocale=gnu --enable-libstdcxx-debug --enable-libstdcxx-time=yes --with-default-libstdcxx-abi=new --enable-gnu-unique-object --disable-libitm --disable-libquadmath --disable-libquadmath-support --enable-plugin --with-system-zlib --with-target-system-zlib --enable-objc-gc=auto --enable-multiarch --disable-sjlj-exceptions --with-arch=armv6 --with-fpu=vfp --with-float=hard --disable-werror --enable-checking=release --build=arm-linux-gnueabihf --host=arm-linux-gnueabihf --target=arm-linux-gnueabihf
> 
> Thread model: posix
> 
> gcc version 8.3.0 (Raspbian 8.3.0-6+rpi1)
> 
> 
> 73 de Bernard, f6bvp
> 
> 

