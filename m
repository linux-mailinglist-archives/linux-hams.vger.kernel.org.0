Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9F2E631003
	for <lists+linux-hams@lfdr.de>; Sat, 19 Nov 2022 18:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234939AbiKSRg2 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sat, 19 Nov 2022 12:36:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235128AbiKSRgW (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sat, 19 Nov 2022 12:36:22 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0AA51156
        for <linux-hams@vger.kernel.org>; Sat, 19 Nov 2022 09:36:20 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id a15so10345321ljb.7
        for <linux-hams@vger.kernel.org>; Sat, 19 Nov 2022 09:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hk4d10zRJmdTHu3kfgsw0vZgQ6veoV/sWEX3sdZGUoM=;
        b=UnF5v9tJz+WKz1sh2cxAFG6oQqRwkY1J5e9EBkkv5wMAYH9Mf57QMBBaGNlAoOw1eJ
         qguD2VZ4HGqhShdEf4zJIBbvq44Skg2xL5Ny6UuRU3it5Xi8qwmKfyG2g08opS9CG0pY
         i6bPVK/Oi5JLsPYVESdcDUvRYy1yCU00oME6xe2aqsXzcGiGNflDG+bkVbwcsG4lXCTa
         4FludxWFUjmdYuZCyUYl3K18wCo8ntr4Xbgn5q+2rFlmKuwGpscG/07wpXGsmLS39H+y
         j2uD7/l5YK4p8q2mMrwfZFxdgU3OUjP1CVv21qiedonWx7Fy6OhT/Sh5/TpfrkuZmV8C
         lHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hk4d10zRJmdTHu3kfgsw0vZgQ6veoV/sWEX3sdZGUoM=;
        b=Ux9LXmdiz59XSnfvpgqIqsgR2//RZjl9OSPM29NsOjx5PSq7B5xMaTwbYANG8hovNw
         52CcPHVx0M82bkPMWU3FbIR9Go7kZEWLITtzXT9qyuu6veXB7JgpasZux48D9Qgd6nDJ
         2mb4VyapGBFzP/SumP/qE37vtP9t/RfEe7xrihR+Ln+di0M4HZ5m9J5HamflDIQFuOnz
         /aZuFgWL4jl2qFNzJCOAvWCO+j2BQ5j4CzkkzF9QO4PyBP1gPbQiQbEdTRkim67Ufib2
         axYHdl8RiwLhRk3uHPoZPI9SXgs5qwiTqJPjMVj0XKrqRP2BFb3jmOCkv/VakMCuqwdU
         rGFg==
X-Gm-Message-State: ANoB5pkOLHfwFFv9P5jH2UgbH+t40VBx3aUPH5p5387iTSAPn0D1+55n
        YI/b7IjIZIy2OjxljF0OgJbvPFeZknL5RYgt6t/0ByK+mzg=
X-Google-Smtp-Source: AA0mqf6ApFIFz/tNTd/eyh1bYrs58nI3KdH63BnrrXAhBUb/1glbGnFZnPOrOLI9a1ahdZtmhRYNArlWEGNYlJddBdA=
X-Received: by 2002:a2e:8806:0:b0:276:ff14:7a4d with SMTP id
 x6-20020a2e8806000000b00276ff147a4dmr602242ljh.490.1668879378605; Sat, 19 Nov
 2022 09:36:18 -0800 (PST)
MIME-Version: 1.0
References: <CANnsUMFwS=mmkd8sMYUmkPFhNNK79vSs9mwMW7y3uNfZx9vX2Q@mail.gmail.com>
In-Reply-To: <CANnsUMFwS=mmkd8sMYUmkPFhNNK79vSs9mwMW7y3uNfZx9vX2Q@mail.gmail.com>
From:   Chris Maness <christopher.maness@gmail.com>
Date:   Sat, 19 Nov 2022 09:36:27 -0800
Message-ID: <CANnsUME3OjjKZ_R-XfhahgeKucTm-qScHx4Atcz4Qu5ZtfaeUQ@mail.gmail.com>
Subject: =?UTF-8?Q?Greetings_=E2=80=94_New_Member_KQ6UP?=
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

Just dropped in to find out the current AX.25 situation in kernel/user
space.  Been playing with doing NETROM using UROnode.  Also wondering
what happened to Linux-ax25.org

73 de Chris KQ6UP
--
Thanks,
Chris Maness
-Sent from my iPhone
