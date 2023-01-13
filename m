Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC12C669A1F
	for <lists+linux-hams@lfdr.de>; Fri, 13 Jan 2023 15:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjAMOaZ (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 13 Jan 2023 09:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbjAMO3e (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 13 Jan 2023 09:29:34 -0500
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E84C15F1B
        for <linux-hams@vger.kernel.org>; Fri, 13 Jan 2023 06:21:07 -0800 (PST)
Received: by mail-vk1-xa2a.google.com with SMTP id b81so10256541vkf.1
        for <linux-hams@vger.kernel.org>; Fri, 13 Jan 2023 06:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vp7WJEQeqfECJPHW0AuERFkvo4NbV7HrEE/sJXMZfd8=;
        b=QjPHGx5LVyYTukYBgvYG6wBr0ccvf8dR7Cy7FM1R8d51Jghstjrr6KNpTaZleU9LAx
         uk9bQV5CL5l8hnTo9et/SFi0hvUb35+u1AkxduiiBySDBQ0vk2kJ07W4IBz5caJU75KD
         YjUYPMItFMpdxjP1EnmECk1OGYKfo3SpeolHy87kLU1VEWuanwMfocF8mVChKTEFlN1Y
         xpAle2PihTrgkxM2Uta9HrranVk0sAFdoAtOQlwUtvxXswy5+FaGxmLTRFdvb/eQr2+P
         tOsn19bvi/sOTWX4snnMyXcKe1daVP3g9yQB34gEmfGKKqO7PJiViqsand+vTazpgkzV
         S4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp7WJEQeqfECJPHW0AuERFkvo4NbV7HrEE/sJXMZfd8=;
        b=hLYLeamtqSwkZOrlmjfTjKbVKmRXqq9Zx3lXclmke0Tla/RTEuXE3WtEM9f12A2UAS
         H3bSrkeRoe0IJi88y3vg+GE5j3iQTJpPWlgKqeeibhS1p/5o3W+dpEYUHoQ42z1po2rX
         7cf7JIPhTumcJHRSolpq04qmXF/moNRYh1c+7ye6G5YYiQ20ZxDYV2he3oKaVP2LfRfQ
         qIaVYg+O4XNIp/EmPwdT994rl7kHqpLZOZos/6R74pMtfE4iP6VCW+kjR7qQOLQTawNM
         mNDgQ1oqiChCj3hOAb9GrVDu4vDljkSVWRdjDU89lV++3p1ZYb6PvPSyutZu4BPlsnpy
         rISA==
X-Gm-Message-State: AFqh2koytlwqmAnxeEXuhYrWNKrUjrQltMzRVxki/978o+LaMZNY6YD8
        dPPX1sIYPq0l/UDf1yEXbEPUbG8/W3jfYbK94IKsEK1+mwg=
X-Google-Smtp-Source: AMrXdXvx3EeYZgaSOQQfRkE/wBEYa2Mzwx63KmEAYx1khTfWPnFPoF0ddHka79huWZhb2zr5GNmparFK9YvGbQGMW8M=
X-Received: by 2002:a1f:2714:0:b0:3cc:1019:57ef with SMTP id
 n20-20020a1f2714000000b003cc101957efmr10575114vkn.6.1673619665776; Fri, 13
 Jan 2023 06:21:05 -0800 (PST)
MIME-Version: 1.0
References: <CANnsUMEtqqQbFEoUnqWtbvdeVU4i5adTH97uPUFpzWN=mOp54g@mail.gmail.com>
In-Reply-To: <CANnsUMEtqqQbFEoUnqWtbvdeVU4i5adTH97uPUFpzWN=mOp54g@mail.gmail.com>
From:   Lorenzo Simoncello <lorenzo.simoncello@gmail.com>
Date:   Fri, 13 Jan 2023 15:20:25 +0100
Message-ID: <CAA+Jh9wEr7b68C16d6xMc8yeYco-hdFWaw0Qe+tx8t9EFh1o+w@mail.gmail.com>
Subject: Re: Patching the Raspberry Pi OS Kernel for AX.25?
To:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Happy to know that some issues have been fixed :)
I think we can find some plus info here:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/?h=linux-5.19.y&qt=grep&q=ax25

We can switch the kernel branches and check which ones have been
applied... so the problem is which branch is the better at now? :)
If anyone checked it will be much appreciated

Thanks
Lorenzo Simoncello IW3HER


Il giorno mar 27 dic 2022 alle ore 07:34 Chris Maness
<christopher.maness@gmail.com> ha scritto:
>
> I would like to try to patch the current 5.15 kernel for the Pi to
> bring it up to the ax.25 code that is in 5.19.  I believe in that
> version some of the issues have been fixed, but the current kernel
> version for the Pi is 5.15.  I have never patched the kernel source
> before and I am not sure how to proceed.  I have built them before
> many moons ago.
>
> -KQ6UP
>
> --
> Thanks,
> Chris Maness
