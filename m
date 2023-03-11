Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4710A6B60B9
	for <lists+linux-hams@lfdr.de>; Sat, 11 Mar 2023 21:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbjCKUyS (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sat, 11 Mar 2023 15:54:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjCKUyP (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sat, 11 Mar 2023 15:54:15 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72FF1259C
        for <linux-hams@vger.kernel.org>; Sat, 11 Mar 2023 12:53:50 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id y15so1501198lfa.7
        for <linux-hams@vger.kernel.org>; Sat, 11 Mar 2023 12:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678568026;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jYqarH6yRmH0LuJ3MMvmnq1A4xlgUvvOnTFpPsJ8tFg=;
        b=pY34aob2YtDbEv3woQG7QVVPoUyEp34GIzMrN2KdA1xmscJPUpvVlOw0LkjFWfZC4p
         paoL+2q14a4V4Df9HW2xG4Swd8b1MKWeYUp78L86jx+TqbcGnxZLrNkmbzTmGub9x46T
         W/tSRJrL6e5VsuvxPoHIfNfd++Ulyvhxfw2e1FfUmsz54fFdjeI3Evv64P7JaSCDqBhj
         YF1O9uLFkkUqlzAEwoOvS/+54B6eDOlOKNCOHXPskG6KfdGDw9YeMiR2kA//I08DSyHg
         tMkgP99FONY3rAgdqGKo1Q3jjW/PpI7GAaNxDRpO25z0EE0JhCpBNIfG175YZcbvJd4u
         YFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678568026;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jYqarH6yRmH0LuJ3MMvmnq1A4xlgUvvOnTFpPsJ8tFg=;
        b=0Yc2zFw7RQrwZABJSN7U+dVJjc7RUpNurVwsR1zSMy7ETzQUAYtNX8oa93kIPkGlOY
         B2Z8bKo12p7UDZm7wx4FXA8+XGKFy/G0LeV+sl7Oml8yBQ8yViPwjAMhR5KtbrnKutOq
         Ty6VuLcfRjb/V5F1im6gqtc+cR7NGlinHI80/L6TLF1i1zmRB+NZZFPi6tT0jCLYjD7n
         szkq95rIaSbWtm8TuL5i4utGOcudKNmdjeW+CTDeRTxRwQCiDVXfTPvBIsJbkdBL9f5Z
         tathmL73eq+qGc5HBGtqfDeGlE3BRDWQ0H/aUhgkRcI1eSTvdhuFKVnnjKBnMscV4/vx
         h3tg==
X-Gm-Message-State: AO0yUKUAUVYalga2eBz3UhQXoGvqkfIKPxGLnsL/8iRv32d/G43iGdA7
        OPDLdNgHMc17vha2o6soNENQVMqDOl+hwCWwC8p97ns/w7s=
X-Google-Smtp-Source: AK7set9bnMmPuJ1oOm7k+Y266XFzJT0ssYxqXgqPgb3UOyEuwXnyPUEygNfJj9GuO2nvy6uMTiuVL0NOXskOfpIubXU=
X-Received: by 2002:ac2:530f:0:b0:4db:266c:4338 with SMTP id
 c15-20020ac2530f000000b004db266c4338mr8959202lfh.1.1678568026128; Sat, 11 Mar
 2023 12:53:46 -0800 (PST)
MIME-Version: 1.0
From:   Chris Maness <christopher.maness@gmail.com>
Date:   Sat, 11 Mar 2023 12:53:34 -0800
Message-ID: <CANnsUMG_aubfxQ4+dmVovrdri46c58ZZ5ky6TseZ4QCKRnOf2Q@mail.gmail.com>
Subject: One Slipped By
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

Looks like I missed a patch compared to my hand patched kernel, I see:


diff linux-6.2.5/net/ax25/af_ax25.c linux-5.15.89/net/ax25/af_ax25.c
105,106c105
<                               netdev_put(ax25_dev->dev,
<                                          &ax25_dev->dev_tracker);
---
>                               dev_put(ax25_dev->dev);
225c224
< ax25_cb *ax25_find_cb(const ax25_address *src_addr, ax25_address *dest_addr,
---
> ax25_cb *ax25_find_cb(ax25_address *src_addr, ax25_address *dest_addr,
726c725
<       valptr = &val;
---
>       valptr = (void *) &val;
781c780
<                       strscpy(devname, ax25_dev->dev->name, sizeof(devname));
---
>                       strlcpy(devname, ax25_dev->dev->name, sizeof(devname));
788c787
<               valptr = devname;
---
>               valptr = (void *) devname;
1069c1068
<               netdev_put(ax25_dev->dev, &ax25->dev_tracker);
---
>               dev_put(ax25_dev->dev);
1150c1149
<               netdev_hold(ax25_dev->dev, &ax25->dev_tracker, GFP_ATOMIC);
---
>               dev_hold(ax25_dev->dev);
-- 
Thanks,
Chris Maness
