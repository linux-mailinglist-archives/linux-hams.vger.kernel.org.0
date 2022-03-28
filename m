Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0274E990A
	for <lists+linux-hams@lfdr.de>; Mon, 28 Mar 2022 16:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236168AbiC1OO5 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 28 Mar 2022 10:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243689AbiC1OO4 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 28 Mar 2022 10:14:56 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D88E659A
        for <linux-hams@vger.kernel.org>; Mon, 28 Mar 2022 07:13:15 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id w17-20020a056830111100b005b22c584b93so10746286otq.11
        for <linux-hams@vger.kernel.org>; Mon, 28 Mar 2022 07:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=HwoRoWuQqXBASJghdVP0q7Mxs44uxFBJl2N304C9jhI=;
        b=qjMmTOMawd8pRFTm1d5JCKVTEXO1N4+8vlo44iU+TZcnxbvHyIDD271hlANIqBpjjf
         JTK/3xDRe2B1dbLUqWEKJRCzxc0of0V5YrI5SaZQHMsjqfBFyoW28Ys/S/YpsZmixIQJ
         B8z9LySGBV6/L9EFgeQZLm4po7K5+qyWE6g40qk2VXbosEIwFqcYAR/wTP0b9m3CvYAE
         CCo3HvPQ6HGHRhsEr7MyviTt460XSJx9VVM5AAxTdzyN4ho0807Gf0ZbGmATcfrElGAF
         8fjBTbLLAHNjpjymAmuTDMwMSAl08qea1SfPGQSrvhqqb1kQHwu6Kgi28DfGcCdKTv0t
         3dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=HwoRoWuQqXBASJghdVP0q7Mxs44uxFBJl2N304C9jhI=;
        b=l3gBEDOYE1aJHfMyQSkrff3BOv1UM3l6OfmDchPMAbCg/w5a9kY8ILcGwdlN9Rcudk
         1iq6OqQwT6lRSMY4x1+GCkPXKe9TkGUNJGPbONTbLMbCFs9I1ncoHm0yuyeO6zwGFQlm
         rgeLs3Gn2Rk7Oh9uLQ2MvH3pPbUvz4GSx9AUu3jiQz4ZUgJEoxuefPo/EyUn21rjqpxi
         gQsdTTCkZ+LAR942xXopCQE3We0nd4RxVdrHL3jaucH79Ef0o4RmF8VCm8McaUu0KfGM
         BNYLF6rpgylPKMQk1ApPbrMxckkYfjw7wj67ecfS1Xi5z+m443CDgvZ6pBlDJkAFNnul
         ISDA==
X-Gm-Message-State: AOAM530JgoW4Cc7xeqvv9UwSGjot76TIvKeMx2/XaI2D56lC565DuePv
        TFmjjyS60awjpjn3YzIS20S0MjF7dmsg6m0sWaSXFt/9
X-Google-Smtp-Source: ABdhPJyi5aWR+iPrLnUgNEQzKQLhwHQYPBSjX1I4crZ0a7ef6Q6fEMyMxY715XieOC4gOqfXIWoju+Ffx73qFVwNOXE=
X-Received: by 2002:a9d:7b45:0:b0:5cb:5d55:907f with SMTP id
 f5-20020a9d7b45000000b005cb5d55907fmr10041596oto.61.1648476794751; Mon, 28
 Mar 2022 07:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAO6P2QRhPXpOw6EYkeFv+QsGGZfTce98uTgTd-oYQ7L0sE5TbA@mail.gmail.com>
In-Reply-To: <CAO6P2QRhPXpOw6EYkeFv+QsGGZfTce98uTgTd-oYQ7L0sE5TbA@mail.gmail.com>
From:   "Paul R. Tagliamonte" <paultag@gmail.com>
Date:   Mon, 28 Mar 2022 10:13:04 -0400
Message-ID: <CAO6P2QR1kYnT9ag_bB1yiTU3jJNkwNvcE9Yo-jGfrWcczriATQ@mail.gmail.com>
Subject: Re: AX.25 Linux Packet Forwarding
To:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Thank you Dennis and David!

I was able to get the right parts moving after picking up the phrase
"Digipeating" - I have it all working, thank you very much for your
help!

Paul K3XEC


On Sun, Mar 27, 2022 at 8:18 PM Paul R. Tagliamonte <paultag@gmail.com> wrote:
>
> Hello, Linux HAMs,
>
> I'm just getting into AX.25, and I've not been able to find the right
> set of keywords to search for. I've only started learning about this
> two days ago, so pointing me to the right docs would be very welcome
> and helpful in this case.
>
> I've got a base station and a Kenwood handheld that I've got working
> with AX.25. I have a BBS I can hit via my base station, but not my
> handheld.
>
> I'd like to set up my Linux box attached to my base station to forward
> AX.25 traffic on-frequency as a relay.
>
> HT: "K3XEC-1" (Kenwood)
> Base Station: "MYRELAY" (Yaesu)
> Remote Station: "MYBBS"
>
> Assuming MYRELAY and MYBBS are valid callsigns / stations -- I'm going
> to use these so that we don't get confused by the same callsign but
> different SSIDs.
>
> I'd like to be able to (from my Laptop and Kenwood) do (as K3XEC-1):
>
> $ axcall MYBBS via MYRELAY
>
> which would result in MYRELAY sending traffic K3XEC-2>MYBBS, and
> relaying traffic back to K3XEC-2 (or something) back via
> MYRELAY>K3XEC-1 (or however it should be properly translated - still
> not comfortable with the AX.25 framing yet or if there's a convention
> there), and have my base-station relay traffic to and from.
>
> Is there something like "net.ipv4.ip_forward" but for AX.25 that would
> allow me to do this? Or a daemon or something? I'd love to allow
> anyone else nearby to use my base station, so filtering by callsign is
> not required here either.
>
> I /think/ I subscribed, but please do keep me on CC in the event I fudged up.
>
>   Paul K3XEC
>
> --
> :wq



--
:wq
