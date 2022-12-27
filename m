Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4C88656778
	for <lists+linux-hams@lfdr.de>; Tue, 27 Dec 2022 07:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbiL0GK1 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 27 Dec 2022 01:10:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiL0GK0 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 27 Dec 2022 01:10:26 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B6A5F54
        for <linux-hams@vger.kernel.org>; Mon, 26 Dec 2022 22:10:25 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bf43so18391992lfb.6
        for <linux-hams@vger.kernel.org>; Mon, 26 Dec 2022 22:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dT50w44llys+/mkAc+IG8pekgIv3FZODTSCtmgN4+DA=;
        b=iaVU+QymokBTwsPYPMPSu3YAMs9054gAbeb4ic48laBCMDDwegeZnL7dHiia4puYTc
         DRUSSvmByT8m4GXIlXsY5B/kDgCQk/GFJsWGCeEb45ls6U6dAvmkS05DmSQ4LWEMrJ8s
         HwO3v3kRyA9rTRdJV45oYBmFyMC3FNQ+EEIQMJKcaxm6JwhSubuDR7jQbJ90Kdoyf9+D
         DUWmHJpfnPlKvpWubSFm4uf/JWvCqpvd4U3SVY+RrFO7Qqkf5v5WLfS01plsopZoWTgF
         qf0NHUPmrwkQadbi6Doei532FstnfM8cGdjR9o5FGE7IuFwqK6EdqESPxSzOru6vAMJt
         9kXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dT50w44llys+/mkAc+IG8pekgIv3FZODTSCtmgN4+DA=;
        b=GipPXcjqLZJKCSlmMbP/cdrSUUODvQRUibKFNT+O323ezaapZgKkCjhjJyKtrMqNYb
         3BqRwsHwKM0QUVyuww/gVZdDms9lN9hRyW/D3rDFTG9/n9/FoGCBuvXu9e7RD5tSbiRn
         A0XsZuCKUXqqj+CY2MPZOOO6yk+yTNTCIrLk9MXnl2JglBrBNUznpRWQa6raUoaopFJ7
         ZMXDUyvflGqywWitoR0h2U5DNaFn12Tylr+s57GDiYzVMoXtBNeIAW03SXZVpEr11E8X
         C+P2zXmcgRjoz8qgCXCr/fMetPNzUMU0yJL7jjqv5jegv5O+zs9JzCJpkxGEuDFStjLG
         MJdQ==
X-Gm-Message-State: AFqh2krk4x9yvfZRgBCtVb7WyIIM67ZcS2jNy3NY30CH29FIY01GhQTR
        8IIif1iimExykNfmjnL5+2zn6EfEAZhyGlcyGF9MK95X
X-Google-Smtp-Source: AMrXdXvQaDGhmVfUsy0u5dgWJ1h+OjZSfFrXJoSLkb0SKcYecNEFZnTgFCIcCIo/j0POga9p5DFTMwLMEqRPpwbRyD8=
X-Received: by 2002:a05:6512:3048:b0:4ac:660b:1f02 with SMTP id
 b8-20020a056512304800b004ac660b1f02mr1475245lfb.9.1672121423021; Mon, 26 Dec
 2022 22:10:23 -0800 (PST)
MIME-Version: 1.0
From:   Chris Maness <christopher.maness@gmail.com>
Date:   Mon, 26 Dec 2022 22:10:11 -0800
Message-ID: <CANnsUMEtqqQbFEoUnqWtbvdeVU4i5adTH97uPUFpzWN=mOp54g@mail.gmail.com>
Subject: Patching the Raspberry Pi OS Kernel for AX.25?
To:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

I would like to try to patch the current 5.15 kernel for the Pi to
bring it up to the ax.25 code that is in 5.19.  I believe in that
version some of the issues have been fixed, but the current kernel
version for the Pi is 5.15.  I have never patched the kernel source
before and I am not sure how to proceed.  I have built them before
many moons ago.

-KQ6UP

-- 
Thanks,
Chris Maness
