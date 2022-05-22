Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32AC3530275
	for <lists+linux-hams@lfdr.de>; Sun, 22 May 2022 12:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243934AbiEVKiU (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 22 May 2022 06:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231797AbiEVKiU (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 22 May 2022 06:38:20 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3F6167DC
        for <linux-hams@vger.kernel.org>; Sun, 22 May 2022 03:38:18 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id wh22so23113817ejb.7
        for <linux-hams@vger.kernel.org>; Sun, 22 May 2022 03:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=oBm2nuGS95Z6zqgokrsEOA3WmX/ZZ65CGDJ3szR6ErU=;
        b=EaaIKAVrmqkNcMShkRxxtZKR+Z566b0ZtIBv+U7PwP2XjBWLX+v/Ddc86jnTN3fDcN
         zzfpYJ8ZsafVntuvh1Gl7z3cuBUse8T/G7f36EBX3DaNxBR5tOFIV2kiS/ySY2KcAZun
         fJ8QGRB7+0thKyeb7cWuQ8JOCk64vgjQRrFJW7Qqwx8HlH1wsmwy81YZT6MYXyhz744D
         J4D5q2A9Qe6kH50PDoXMmz2UziYm9ysqhvnb2CezfGxbSFWOH1Mw32jaksCGwfcXW4lk
         L8q6It3GQt1uY3zPHyEp0Itw3y4TD9xE3eb76L1wKYC0n7muowk/kubDjPTwopvDSfj/
         PKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=oBm2nuGS95Z6zqgokrsEOA3WmX/ZZ65CGDJ3szR6ErU=;
        b=jZqpXAQR7OiSbLg468QFE8zFkVCvzZMGtsk9Pycq2eeBR/hIWMC9DVC6L5Xw4oCELE
         KCKzcQGWFctyLcpWYBdfzcpH7fgY6PPkNovlhfaGl5hPTA7cdo14XbOi3crcgrEgd1Ae
         9md4IZbB2Ip52V+2+bD1hdSX7ZxQWAVBtdUItV35UIQMAq92XglJmGxNsXUEUGKEotJG
         vUk7wJyfOkZzTk5kE78cKmBzB2NpksONYYAQBWc08PKzzkQ4CD/TgbMxViC0zlvIUu8t
         FvdLyPX5I51MSXJFq5anAPrIqUlHNbB7n3wRmawrEgeiw0tkFPfuib4T3ULBqIPGoaVI
         eakA==
X-Gm-Message-State: AOAM5333kPtXqa69ouXOQaNE2VsVRPusVeyUm2rjiTNoz7P6QHW6wggz
        8rqc4+Ph61hFFtwncB94kI0eLTWz0tLf8FVyH48=
X-Google-Smtp-Source: ABdhPJyYlxMcbCOb2TCV6NBvPhttMKxW1/9Gk/y2l5Dzrkebh7svf8GEdOApKN4yAfjENFm2MSzbthHe7a4saNvvnbk=
X-Received: by 2002:a17:907:2daa:b0:6fe:b449:6a8f with SMTP id
 gt42-20020a1709072daa00b006feb4496a8fmr8294026ejc.318.1653215897086; Sun, 22
 May 2022 03:38:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:9626:b0:6fe:9ae9:4fa5 with HTTP; Sun, 22 May 2022
 03:38:16 -0700 (PDT)
Reply-To: infoilluminattemple@gmail.com
From:   Kelvin Wood <abubakargaladimamafara@gmail.com>
Date:   Sun, 22 May 2022 11:38:16 +0100
Message-ID: <CAFyWfQh6nd83974feYwtVaRDf_p_Lf-kJftqf-_wfWzOpk0Jcw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:62d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [abubakargaladimamafara[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  1.7 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

-- 
JOIN THE ILLUMINATI BROTHERHOOD TODAY AND HAVE ALL YOUR DESIRES IN
LIFE. "NO HUMAN SACRIFICE,
OCCULT FESTIVAL IS HERE AGAIN!
Join the Illuminate Brotherhood online today for Riches, Fame, Power
and Success. Every new member(s) receive undeniable rewards of $450000
U.S dollars immediately after initiation to fit the class and status
of the club members. New member(s) also receives $15,500 U.S dollars
monthly salary. Note that the higher you go in the society, the better
your life becomes. Join us today and become rich and famous. Contact
us with the email or the cell phone number displayed below if you are
18 years and above. Make good use of this great opportunity and have
all your desires in life. NOTE: THERE IS NO HUMAN SACRIFICE. You can
send us the following information as we prepare you for your
initiation.

Email Address: infoilluminattemple@gmail.com
WhatSapp Number: +380 66 369 2971
