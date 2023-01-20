Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 425D867495C
	for <lists+linux-hams@lfdr.de>; Fri, 20 Jan 2023 03:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbjATCbO (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 19 Jan 2023 21:31:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjATCbN (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 19 Jan 2023 21:31:13 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21CB9A5CC1
        for <linux-hams@vger.kernel.org>; Thu, 19 Jan 2023 18:31:12 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id z7so4150404ljz.4
        for <linux-hams@vger.kernel.org>; Thu, 19 Jan 2023 18:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tZhOuBL8+I5U6G4zCY0HTFekmLsX7Bp0I1srcnWnQS0=;
        b=OA8F4lIlO9Iz4dcdK8jlcLpBT4tQ6L7EB6Obj/pTBHeW4uqXb8vHOP62IsAEzI1FTT
         DLP3KI3cFaJw6kIFsJV2bJpd1aqlgtVUx/hZP8QVoanyKqjxgs3R5zaYQ0ipy4BL7gKi
         gvJGlAP/Td+g4ImY1WnyeS4nAO0/AGqrZIY5blzFTdwyNIpsKI0gmg6MaSwxRC9ph8ps
         U1GHahhIeEvST4UZvRHhQR4FBTFAKzB/bk3rILjQ/CDj6napbaWj8a3YRnuAvNnBCCIJ
         kj2Sy/mScDce6DPItrXy69n5YtAHJiVLgTvUI+AOTDSV85GQrWqrj9PSatYIEgU29pq6
         gloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZhOuBL8+I5U6G4zCY0HTFekmLsX7Bp0I1srcnWnQS0=;
        b=2996AxY73UYS4bm/xG62nwh93fcFobkB4X5+0liBoRBXBUaXdZsBST4rtUOCuNBrsA
         tO5NUDRuM1vptoeDrn4JyXFOjF7kXzE1PjoFilZHSsWRLNFZmrSRsw5D7jGCA/woUusG
         Y2sEuiP5B3zMaqAlXPfbY0RcZz6InymCrzbcwPN7fcKw97KXeGo+KPbdwZgy3iuEOVTF
         O+bXdnXvXI4B5CrLPT32crYFwxNJik1aLk8z8hCsl/3rlK0QKmH/Tnt+JokJKMZDR4z+
         aOEDChyk844vpBdMS1hjAheZNm2z2BtqCZtJaS4YFijd3OwoTFgqNgI5bCtKfaqMTM1+
         PtSw==
X-Gm-Message-State: AFqh2kovA0so5ANm+/2orOBmAWz5spekQQJk5PKe/nUyzOiPW9+5nJfC
        BjdPrzanMydnHBQmE7iNXcuInOTbMAv4UnY6FOcZmeTuEi4=
X-Google-Smtp-Source: AMrXdXtxsQSx0Y5OTVkUOUMmmuv9ipgD6SmWIc8Ba/EtzM2jTrUpMkII0mit8jxKgnyXur417fcgKHvPePICdSPEhoM=
X-Received: by 2002:a2e:9248:0:b0:28b:64c6:c94b with SMTP id
 v8-20020a2e9248000000b0028b64c6c94bmr675011ljg.490.1674181870183; Thu, 19 Jan
 2023 18:31:10 -0800 (PST)
MIME-Version: 1.0
From:   Chris Maness <christopher.maness@gmail.com>
Date:   Thu, 19 Jan 2023 18:30:58 -0800
Message-ID: <CANnsUMFRCJ1rszt-67GywV4_pU0yyW56dis1iSnSO9f23-oa=w@mail.gmail.com>
Subject: AX.25 Patches and the 5.15.89 Kernel tree?
To:     Duoming Zhou <duoming@zju.edu.cn>,
        committer Paolo Abeni <pabeni@redhat.com>,
        linux-hams@vger.kernel.org
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

Thanks for fixing the AX.25 issues, I was able to get them backported
to the Raspberry Pi source tree for the current version.  However, for
desktop Linux distros, they are generally running some iteration of
5.15 as well.  I pulled the latest from kernel.org and compared it to
my pi code that has the patches committed, and I see that the latest
(5.15.89) does not have the patches committed.  Is there any way you
guys could commit to that tree to?  I have not attempted a checkout
for kernel code before and feel a tad intimidated to do so.

VY 73 de Chris KQ6UP

-- 
Thanks,
Chris Maness
