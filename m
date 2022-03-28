Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D331F4E8B37
	for <lists+linux-hams@lfdr.de>; Mon, 28 Mar 2022 02:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237028AbiC1AUD (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 27 Mar 2022 20:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236817AbiC1AUC (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 27 Mar 2022 20:20:02 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC3F11A17
        for <linux-hams@vger.kernel.org>; Sun, 27 Mar 2022 17:18:23 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so13634557fac.7
        for <linux-hams@vger.kernel.org>; Sun, 27 Mar 2022 17:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=oU5QmbQSK4PQuO1dbj+0TZqeiSG/+1XnTn+GRzyFTeY=;
        b=HfHxP6LbDoe7nrgsjE1Y1iqPNJlN8WmNifLPrZuostYKShS6agQooC6h1Auhl/gsYL
         t1VyDlOrQCQ5DHdH/Ro3Q2OGOkW7KTRiJldkr3B9PWBiDx9xAueWvt4w3dd9F5Cw/PCZ
         Wnqu/Pc7LU8Oxc6KUfkwCcA9qOwK0Z+a7YpulmA4Q1k30E2afaUu3X0r5sUsH8+zJ9Nk
         YHqBCOf8+r3PHuSm4cwrgENz3r0h0RLWUga9IhOmAqSRjkBUGlnnCUKy+ZKDIvhuTuEO
         2esEciDeIF+u6bqoMicHtLwgOodEv8RTm0rcNMWfi4xPswzsr083VBmkipw6B8MiET59
         NObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=oU5QmbQSK4PQuO1dbj+0TZqeiSG/+1XnTn+GRzyFTeY=;
        b=ZDRy7+SYJBzG5giOx78AjkpUn8GOW3qnxZK5fd64XXu4l7Y6wMeEFUyQN8/DhbaahX
         7giRJwhDf2piXBp0NP8RN6PMph0KEMEY7W15AyrY/YRqv4W4o5y0y/yHEYGOBtTBEq/H
         o/cZx+OflQg4sirVLWmCbeQwbDIe4nwV5qzCPxz+kuwYj5QRL5edUS/BCXX45HPC2QzA
         jZVArDZ22Yp0kvAPG0tq9NZOFTX1gYMyEWNFYmNThznODf+m8oMpey8b8NGoo0h6k5+o
         sMHvj57vxqlT0dpPeTT+WQeA7wvyrMVG3DBC7y8DCjhqoDei6e4Uz2Yqy2sRrMX03WOq
         1xTA==
X-Gm-Message-State: AOAM530dNIaliTstTZcaVwSU0mzuadNJG85MNKjjsaX1/5iJERbKEoKs
        gJNIQRw+20azEBV8j3jIDLscOwwAZAlNUhU/ziCvfCv4
X-Google-Smtp-Source: ABdhPJxqxv2it1d0l7+du0FFaWmTORaO20AIZK3ekOZ/9R6oAtQmrQ2aUevXSY63OZ8IuNB1TixiSuoa2IFweU1tzYg=
X-Received: by 2002:a05:6870:c189:b0:da:b3f:2b5d with SMTP id
 h9-20020a056870c18900b000da0b3f2b5dmr13973452oad.252.1648426702351; Sun, 27
 Mar 2022 17:18:22 -0700 (PDT)
MIME-Version: 1.0
From:   "Paul R. Tagliamonte" <paultag@gmail.com>
Date:   Sun, 27 Mar 2022 20:18:11 -0400
Message-ID: <CAO6P2QRhPXpOw6EYkeFv+QsGGZfTce98uTgTd-oYQ7L0sE5TbA@mail.gmail.com>
Subject: AX.25 Linux Packet Forwarding
To:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello, Linux HAMs,

I'm just getting into AX.25, and I've not been able to find the right
set of keywords to search for. I've only started learning about this
two days ago, so pointing me to the right docs would be very welcome
and helpful in this case.

I've got a base station and a Kenwood handheld that I've got working
with AX.25. I have a BBS I can hit via my base station, but not my
handheld.

I'd like to set up my Linux box attached to my base station to forward
AX.25 traffic on-frequency as a relay.

HT: "K3XEC-1" (Kenwood)
Base Station: "MYRELAY" (Yaesu)
Remote Station: "MYBBS"

Assuming MYRELAY and MYBBS are valid callsigns / stations -- I'm going
to use these so that we don't get confused by the same callsign but
different SSIDs.

I'd like to be able to (from my Laptop and Kenwood) do (as K3XEC-1):

$ axcall MYBBS via MYRELAY

which would result in MYRELAY sending traffic K3XEC-2>MYBBS, and
relaying traffic back to K3XEC-2 (or something) back via
MYRELAY>K3XEC-1 (or however it should be properly translated - still
not comfortable with the AX.25 framing yet or if there's a convention
there), and have my base-station relay traffic to and from.

Is there something like "net.ipv4.ip_forward" but for AX.25 that would
allow me to do this? Or a daemon or something? I'd love to allow
anyone else nearby to use my base station, so filtering by callsign is
not required here either.

I /think/ I subscribed, but please do keep me on CC in the event I fudged up.

  Paul K3XEC

--
:wq
