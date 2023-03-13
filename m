Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE5F86B6E7C
	for <lists+linux-hams@lfdr.de>; Mon, 13 Mar 2023 05:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjCMEgA (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 13 Mar 2023 00:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbjCMEf7 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 13 Mar 2023 00:35:59 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D3741084
        for <linux-hams@vger.kernel.org>; Sun, 12 Mar 2023 21:35:58 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id j2so10036292wrh.9
        for <linux-hams@vger.kernel.org>; Sun, 12 Mar 2023 21:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678682156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FEq+6Yc2CakAyQHZqng4sb/n5lhAfLuBUykYMIEWDBY=;
        b=Hd2etXftiRtDDL9iP+R1l73B+/2C20ADMvlvFGdUWagYEYkuV1YXIERV4sB1T9Ag3c
         ZvR62Tb+2qtxEitjTorx2XiRGEcvZYI6/l4yT9Bp5tUrfsyVUpewoa+UadAOZDEc0snR
         zZLhKznes7tu4sOhU8H+oD4gwpk4AbYQiZo0z8evm3zgEL5EFOFrL4MVbU55BYukmaPT
         rd61jTt4sC5GxXXdYA2Tu8d5DtykQB32MskzpeUGdNa4/oFaU4/KHghAPSPjweX4jEgI
         /76FwFJx121qR/ey6KQd9azpBos1w68fRXYcBYSApWveIqZUnsBknGd5HdkLKZHhrOh+
         p+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678682156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEq+6Yc2CakAyQHZqng4sb/n5lhAfLuBUykYMIEWDBY=;
        b=ClUUZ965la/kRHPY1XkdGiOvUMP3RshMt0xowbatBgmhFFSjAySt0nvdma3z1dvrWs
         UQor4+pVfuHr3c4i3JVSckizei97I/0dsfzPj8C7OfoRctAq3nWRSaYr2kmacegh9EW1
         nTS/LhV4kW6oXNLF/uTiEmX0MSzYbNjZG+Tj6/QgxfZ7dQSumSNxKPnSi4ehBBKdC2Yl
         40rP9OcOoUGiPYw/1CWm9EdTa5vgufrnG+/wOB5WIqhoo3cB0DxSjh2OjZsMLcewbanK
         HKmKojwmJ+OzNq91A/eBlXo4C3/NyOwWUJ3L4+5IdcnWgsxg0HCXQqQDGZsOW6qKoRd2
         6Xrg==
X-Gm-Message-State: AO0yUKWgalVOQrUeJK53g/GmKzQSvE2MI44akZP/DNPeH3RK1UNdMbdj
        FT2g5G4lUtKV4xK7BapnWiSkaiMbBbw=
X-Google-Smtp-Source: AK7set+ozBnQH9jIQNOeR6s1ZiBIesOaBm+wFQrw/pu5kqlptCvAXAsFB6TPy039hW+qZa3qyypajQ==
X-Received: by 2002:a5d:4fd2:0:b0:2c5:4d35:5260 with SMTP id h18-20020a5d4fd2000000b002c54d355260mr7509654wrw.16.1678682156375;
        Sun, 12 Mar 2023 21:35:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z10-20020a5d654a000000b002ceaa0e6aa5sm3771336wrv.73.2023.03.12.21.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 21:35:55 -0700 (PDT)
Date:   Mon, 13 Mar 2023 07:35:52 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Chris Maness <christopher.maness@gmail.com>
Cc:     linux-hams@vger.kernel.org
Subject: Re: One Slipped By
Message-ID: <3a9c6704-dbfe-459d-b0a4-817137786d42@kili.mountain>
References: <CANnsUMG_aubfxQ4+dmVovrdri46c58ZZ5ky6TseZ4QCKRnOf2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANnsUMG_aubfxQ4+dmVovrdri46c58ZZ5ky6TseZ4QCKRnOf2Q@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Sat, Mar 11, 2023 at 12:53:34PM -0800, Chris Maness wrote:
> Looks like I missed a patch compared to my hand patched kernel, I see:
> 
> 
> diff linux-6.2.5/net/ax25/af_ax25.c linux-5.15.89/net/ax25/af_ax25.c
> 105,106c105

These days when we're discussing patches it needs to be in terms of git
such as
commit d62607c3fe45 ("net: rename reference+tracking helpers")

At first glance this diff in this email seems like clean up patches
which don't need to be backported or stuff that was backported and the
function names look slightly different as a result.

regards,
dan carpenter

