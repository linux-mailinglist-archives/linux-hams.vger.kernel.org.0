Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2914C3EBF
	for <lists+linux-hams@lfdr.de>; Fri, 25 Feb 2022 08:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbiBYHK2 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 25 Feb 2022 02:10:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233702AbiBYHK1 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 25 Feb 2022 02:10:27 -0500
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B551E016C
        for <linux-hams@vger.kernel.org>; Thu, 24 Feb 2022 23:09:55 -0800 (PST)
Received: by mail-yb1-xb44.google.com with SMTP id w63so4105201ybe.10
        for <linux-hams@vger.kernel.org>; Thu, 24 Feb 2022 23:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Y7X8uyaFI8LljuLAxhyM48+yTSBDN9zANH/IhPwl+SQ=;
        b=YxomcVhOZ/D49FW5qhwHTKoVVib0raMx5yC3Cya4g5ngOi0w1jl8BZoM4/clKni9Pb
         yqoJGrMCYLdk/a/fBmkEj5mgtBGwevKi6DWOOV0i0q7qvExwaF9CzGOrqPOYG/1lG9zD
         ZwlOgzI2BA+6PahiABm3nQLGehJn3VM6QwcvY/6neMPcrXkzQ9Tl7TGKGYzlEQJljtlD
         zbhL1ayhMorW5QmGKTl51KHBUSHxXl8QHxXV/adaBlMgVTOPldniBdDjFZpOD9Clltms
         ZjeouqtAZnm9o9GLdHn3NNZg9HBE79mH3Hh0s/2fuDMGHH/3d5dX93GnySGwNtbU1hfT
         FGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Y7X8uyaFI8LljuLAxhyM48+yTSBDN9zANH/IhPwl+SQ=;
        b=wzb1OrF4fAl4xtWzoW2x6ufd/SlF9k63NimCi9G8tC1m4zF//OeRtGcrMECdosfF+E
         celfSBDD4hOQEQY1feZa3TdCPGF3iCqcNZSCng+J/XriNrCqo4Z8TuapO3S7OxRL4HmN
         +V1C+xpIvF4cpE5Rdpi7pkkEI/7g8q6bBPWsaAyhOIcMrGT/ig2GnqKr8mfXD1khMti7
         zqv6YqlgEeJi+i2v5pAatNEkbYPO3RBS7grt0YULJ3gOIoPFEB7bhPC+QUglOupeos3b
         yA90g1hbOGVezxynj70N0MxlhlLVQBWIosLsJTWVEbTsqFPu2AoOsNnK3JPx8LnM2eHt
         q+WQ==
X-Gm-Message-State: AOAM530rJOWUxLNetIyiYOZ0W93Z7hbJpEwmWDjhHijkwSPtPaJKDAqF
        HDtfB2Bn52tn90MPKp/a/MWFWQoWt9UbK+BONvE=
X-Google-Smtp-Source: ABdhPJzqP1eVeGmxq/Knm0kECMjsxmNWnoVdI9YWwZX0WuM0dRU/22lNt/XNJwSwuYOkYZicPx9TtPhvmt88a1BmNmE=
X-Received: by 2002:a25:8149:0:b0:623:bc3c:be06 with SMTP id
 j9-20020a258149000000b00623bc3cbe06mr6240911ybm.223.1645772994878; Thu, 24
 Feb 2022 23:09:54 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a81:a389:0:0:0:0:0 with HTTP; Thu, 24 Feb 2022 23:09:54
 -0800 (PST)
Reply-To: markwillima00@gmail.com
From:   Mark <nnannacolins@gmail.com>
Date:   Thu, 24 Feb 2022 23:09:54 -0800
Message-ID: <CAJAQTionfYc5m6BnPT_TCmsEnQvktMLHod+ArwPjJ_2yQ_V0RQ@mail.gmail.com>
Subject: Re: Greetings!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b44 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [nnannacolins[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [markwillima00[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello,

The HSBC Bank is a financial institution in United Kingdom. We
promotes long-term,sustainable and broad-based economic growth in
developing and emerging countries by providing financial support like
loans and investment to large, small and
medium-sized companies (SMEs) as well as fast-growing enterprises
which in turn helps to create secure and permanent jobs and reduce
poverty.

If you need fund to promotes your business, project(Project Funding),
Loan, planning, budgeting and expansion of your business(s) , do not
hesitate to indicate your interest as we are here to serve you better
by granting your request.

Thank you
Mr:Mark
