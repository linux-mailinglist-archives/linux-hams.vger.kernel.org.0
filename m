Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21A00656781
	for <lists+linux-hams@lfdr.de>; Tue, 27 Dec 2022 07:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbiL0GcG (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 27 Dec 2022 01:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiL0GcF (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 27 Dec 2022 01:32:05 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7662F2C4
        for <linux-hams@vger.kernel.org>; Mon, 26 Dec 2022 22:32:04 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id v23so2754789ljj.9
        for <linux-hams@vger.kernel.org>; Mon, 26 Dec 2022 22:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yDuZtTCdaoZpABUCV3eFMxfDqpHbcZJ2HeqwvXLq9zc=;
        b=aseaYhM/HETcN+yqszOm3eqDGPPJbLadLFPAPUDxSUpRZkWMw+vjC4fCrePew0z8Xy
         HyG4tNQE+o5kmoHBxkiHPEl20RoGtKgmJOlDRxFc6St7enTNMjncDUAfNvFTg2ku9YBS
         OAu9kggebQBmYiTU8QmPsIDkuOltDlSSvX/qKXqYylZbNt6SrLKgbLm5DxVAhU3exZCW
         H9QFpjXN89KBplIvIh4KSGmRCAGkYqlAigakStBrSekyIHWheUlp9l8iR5GGFjKsZwW3
         fm0Dx3XTMYfok6fMANv3T6yzz5oLn+Vq6k5/df85grbT+auVcq0OXE4pmPcDmJA8XaPM
         zaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yDuZtTCdaoZpABUCV3eFMxfDqpHbcZJ2HeqwvXLq9zc=;
        b=V3bs2BnnM3lKXcgkSKrtOv+thRNl7GHVKVKt5HbnNcVtz048RW80WY09wha2kdH9Dp
         H+BLPY20c8n1hqSw61KdBtmueU1iKkLGgZ3Hm8KtNfssNB6HDhhkJa/K/PwEldh97/Gk
         6Z6xHiX6NMh402JehMFlu0UK3qSpo/LjSi03AH4WDVoQqUgGlXzdwDIuqrNMfqHAgxAO
         NISepMeYQQVmIrd9aVixLMwYv1w0IysDi4hshlh7cTaalo19ngyqQIuIsJpmYbVp+a7O
         GlINRhgtqVenj/NTMgTtIDPfoWUP4EjT7WW8BKWg/S+PJycaJMWsMIm0Gv5rFHka7mGD
         RkxQ==
X-Gm-Message-State: AFqh2kor4P8iqN1KPPnaZSzVKOQeoSZs7ECUyv2aQQYYEwTGi/FI/gmB
        47dgc06cIQy/egBNrcVh8j3MjwXZ0yX06eS6WzkASxmTMKU=
X-Google-Smtp-Source: AMrXdXtwJafoDUmOTzxXhX2VH40hAAAmrL8L6vvlEWh5+RTDcOsmxVaRXircKRiz6IkO7G4dCQ2TXV30NLBSifmFev0=
X-Received: by 2002:a05:651c:247:b0:27f:bfaa:26e2 with SMTP id
 x7-20020a05651c024700b0027fbfaa26e2mr425834ljn.364.1672122722182; Mon, 26 Dec
 2022 22:32:02 -0800 (PST)
MIME-Version: 1.0
References: <CANnsUMEtqqQbFEoUnqWtbvdeVU4i5adTH97uPUFpzWN=mOp54g@mail.gmail.com>
In-Reply-To: <CANnsUMEtqqQbFEoUnqWtbvdeVU4i5adTH97uPUFpzWN=mOp54g@mail.gmail.com>
From:   Chris Maness <christopher.maness@gmail.com>
Date:   Mon, 26 Dec 2022 22:31:50 -0800
Message-ID: <CANnsUMFvEy6TkwdVitOpRs_HhxLmt8=FKbe2=RDK3190syN9Zg@mail.gmail.com>
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

This looks like the patch.

https://lore.kernel.org/all/20220530152158.108619-1-duoming@zju.edu.cn/

On Mon, Dec 26, 2022 at 10:10 PM Chris Maness
<christopher.maness@gmail.com> wrote:
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



-- 
Thanks,
Chris Maness
