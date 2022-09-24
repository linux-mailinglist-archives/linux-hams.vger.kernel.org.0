Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECE915E8EFE
	for <lists+linux-hams@lfdr.de>; Sat, 24 Sep 2022 19:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiIXRkj (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sat, 24 Sep 2022 13:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbiIXRkj (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sat, 24 Sep 2022 13:40:39 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4263337E
        for <linux-hams@vger.kernel.org>; Sat, 24 Sep 2022 10:40:37 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id bq9so4438537wrb.4
        for <linux-hams@vger.kernel.org>; Sat, 24 Sep 2022 10:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=0lfrD7ZleLdHNPUYxj9OTLOSER+pee6RpIp19RzwxO0=;
        b=iF3urywrgD/VNiHguz9bYV8P1YN+eZf0t/A0dcncKMk7K4N4ObP8MKGKGoF2jTIm9d
         0R8KNs7CGCOXHs2zvPW6M0l8e9Zy6UQfs2Q6ohZ2n6jTnsFwxK7g/bUtp5ylxIC0rUsR
         MEKpHqPWk3TAFf/Z24d/63P1rgxKabLSo/UY23uKNxwhstb1t3U5+xeXSUkvwEYyZRzj
         u2npnAZdtEQfesna7P3hmH6kJx3oIPkozyk9rGLepi5yM7LCgPnI7c5NOqAd8tl+/zI6
         aVGxchQmkig4HQRB7tkeKzfaORI6SqhEEqRt60+nGCgbTNstwSczu7XemVo/FjPEfWfg
         KHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=0lfrD7ZleLdHNPUYxj9OTLOSER+pee6RpIp19RzwxO0=;
        b=qjhGD1uQgj4TY6GzgW5Q/FnhOJwOd7Rga35/5LUTQ2g7gpZSfHIIbvhRykPAArwDzs
         4y/cS3t7WhFjU5mIGSSl3ljjXgRZLtEtiAnOOJA8x1iIaCzXl2lCnrVVzafrVBaHexoY
         8OHmKfeWH/ur+QKnwA1gnPAorlinnCoAQepKjLJ9Gmwbrn7EZcnl85JTJRy4ATysLBT1
         rE4NwoR1Yc2dbDBQbTy560v03Qqx5rWtClrUuYMTwFqwExQO7MfmhwR4/zW/HOycTxQw
         p/eyjpzCCdDmVyV7uX4EHjlyafWb7FNaBzKJSsrfOz0375BieBIlEcxnN4HZMKX3Hkf7
         nzfQ==
X-Gm-Message-State: ACrzQf0cWr0gPqqk0bzO5OY4jW0xSG9opLhYDfcxAv9+o6kjPiAKEakL
        Xi3QHjGUerb0LYFWIBjCEHE=
X-Google-Smtp-Source: AMsMyM5QMPKDMetM5JaTA+r8zbApcgJgLERJBUrZc7bdhBdXqzOUQhmPa+6Fu+bbgcjynrhTqZZerg==
X-Received: by 2002:a05:6000:1d8b:b0:22a:c046:946d with SMTP id bk11-20020a0560001d8b00b0022ac046946dmr8722728wrb.249.1664041236102;
        Sat, 24 Sep 2022 10:40:36 -0700 (PDT)
Received: from [44.168.19.21] (lfbn-idf1-1-596-24.w86-242.abo.wanadoo.fr. [86.242.59.24])
        by smtp.gmail.com with ESMTPSA id e4-20020a05600c4e4400b003a682354f63sm6030595wmq.11.2022.09.24.10.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 10:40:35 -0700 (PDT)
Message-ID: <0bb5641b-53a8-ff10-1dbe-b4ac913421e2@gmail.com>
Date:   Sat, 24 Sep 2022 19:40:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Problems in compiling ax25apps on modern systems -- FIXED
Content-Language: en-US
To:     David Ranch <dranch@trinnet.net>
Cc:     linux-hams@vger.kernel.org, Thomas Osterried <thomas@osterried.de>
References: <43ef460e-d884-87ad-b865-0b8dcd1cd9a8@trinnet.net>
 <f18c0409-dd3a-71cf-6f4f-dab05c600ea2@trinnet.net>
 <2CEB20FD-4469-4014-80DF-13858987B5B1@osterried.de>
From:   Bernard Pidoux <bernard.f6bvp@gmail.com>
In-Reply-To: <2CEB20FD-4469-4014-80DF-13858987B5B1@osterried.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hi David,

I am using the last kernel available for RaspBerry Pi that includes my 
recent patch reparing ROSE broken since 5.4.78.

Linux F6BVP-8 5.15.68-v7+ #1586 SMP Fri Sep 16 12:07:16 BST 2022 armv7l 
GNU/Linux


Using the following instructions I can install AX25 library, tools and 
apps without issues.

http://44.168.19.18/configuration6_RPi.html



My updAX25 script is getting and installing AX25 library, tools and apps 
sources from :



wget https://github.com/ve7fet/linuxax25/archive/master.zip



Gcc :



Using built-in specs.

COLLECT_GCC=gcc

COLLECT_LTO_WRAPPER=/usr/lib/gcc/arm-linux-gnueabihf/8/lto-wrapper

Target: arm-linux-gnueabihf

Configured with: ../src/configure -v --with-pkgversion='Raspbian 
8.3.0-6+rpi1' --with-bugurl=file:///usr/share/doc/gcc-8/README.Bugs 
--enable-languages=c,ada,c++,go,d,fortran,objc,obj-c++ --prefix=/usr 
--with-gcc-major-version-only --program-suffix=-8 
--program-prefix=arm-linux-gnueabihf- --enable-shared 
--enable-linker-build-id --libexecdir=/usr/lib 
--without-included-gettext --enable-threads=posix --libdir=/usr/lib 
--enable-nls --enable-bootstrap --enable-clocale=gnu 
--enable-libstdcxx-debug --enable-libstdcxx-time=yes 
--with-default-libstdcxx-abi=new --enable-gnu-unique-object 
--disable-libitm --disable-libquadmath --disable-libquadmath-support 
--enable-plugin --with-system-zlib --with-target-system-zlib 
--enable-objc-gc=auto --enable-multiarch --disable-sjlj-exceptions 
--with-arch=armv6 --with-fpu=vfp --with-float=hard --disable-werror 
--enable-checking=release --build=arm-linux-gnueabihf 
--host=arm-linux-gnueabihf --target=arm-linux-gnueabihf

Thread model: posix

gcc version 8.3.0 (Raspbian 8.3.0-6+rpi1)


73 de Bernard, f6bvp

