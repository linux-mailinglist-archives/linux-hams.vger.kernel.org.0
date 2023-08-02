Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7346B76C8A3
	for <lists+linux-hams@lfdr.de>; Wed,  2 Aug 2023 10:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbjHBIs7 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 2 Aug 2023 04:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbjHBIs5 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 2 Aug 2023 04:48:57 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 823B8D9
        for <linux-hams@vger.kernel.org>; Wed,  2 Aug 2023 01:48:56 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-268128a0105so4627300a91.3
        for <linux-hams@vger.kernel.org>; Wed, 02 Aug 2023 01:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690966136; x=1691570936;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebUfZ9Aev/azXU+c0mq8j3e1VS4j3VI5Ob10mVXKXyc=;
        b=E2uAOFY8NLr7VNiY4EeL2UQBbmz7a1HuVZk+9dS7ZWLGALbRdAHAWI4ovYUatCvmdm
         eVqI22Pw4PJCbHjaw4f20EpUl2pj+3VRJ+ANwdqvb3gUaN/qnVJW1OCTlPFhz1cuLPvF
         BkxZ8mbFjQyLCU0oLlZNAbmPIErkIirDRnESWHezsUxY4FYKuKJASX2AhOLril5l+Wg/
         BgSokuEXmfw8cDh+HIGO14dFnD3kzB9PYPYKU8tjBafp6vTSXbbCS9aXDa5SXz5xTspN
         v3esVNMGp1UVTQc+0E4eM9VmZ7NBcAtqFXM8BDYbhwiAhMHY1UqgZFLAte+pxwAL1J4x
         iNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966136; x=1691570936;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ebUfZ9Aev/azXU+c0mq8j3e1VS4j3VI5Ob10mVXKXyc=;
        b=dMKNEr9LlyrmF5o9mkmZ3yOo2jMPqPF6DgJW2j/nYwbguW5JkSwnBLQFRvcA4IdMVn
         WY129i9rBTpeEOepk3FYw+0xVcX8eQiUzEaZGPpJWix8qkEY+LXIR7y7Z8VizYDTxZJC
         kyoWnbQXRJwWoWrjd8pv4I9cB1OlLSSyNvWXkHMfTNlTAb+qlACjHzpVc3mOMWAv9M6r
         rfCKcNWb+PcIS18wiybdDo54cXSs6+w4by4Z6xQKm5rNt4AAIGmpFE5iIU9o7SC4LrqX
         kXaFzY6ajDmwgLMldqJ1DsKsApOrHgMKlqvLC84wmpCQw0NBBjHLyGweNhLI21qGYxgo
         2MMw==
X-Gm-Message-State: ABy/qLbekajMce1JwBfBWmkm7AACcDijjuYkx1eBIBRxa0tUmBB+7hec
        EGdLAdQtNvN2p50YiKaGmHIIZNBnJi6dwY+NtO4=
X-Google-Smtp-Source: APBJJlEZW//Q94b/bnm02q5MP+nW2EVqs6HzZFD2Pr+RoQZgnrd3gOUSsVuC2RdYaPP29jBf9t/wogfRuOnxn3xVH40=
X-Received: by 2002:a17:90b:17c2:b0:267:8012:b39d with SMTP id
 me2-20020a17090b17c200b002678012b39dmr14205223pjb.29.1690966135529; Wed, 02
 Aug 2023 01:48:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:a816:b0:4b5:b7ad:570a with HTTP; Wed, 2 Aug 2023
 01:48:54 -0700 (PDT)
Reply-To: dr.waleed.bin.hadi@gmail.com
From:   "Dr. Waleed Bin Hadi" <clockw401@gmail.com>
Date:   Wed, 2 Aug 2023 10:48:54 +0200
Message-ID: <CADuhRV4+RNxM3J=w03qkav79Nb+fjQG16-r3haNTuX56Em-wrQ@mail.gmail.com>
Subject: INVESTORS
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Salaam,

Our investors are seeking for new business opportunities and projects
for possible funding and capital financing. We are open to further
discussions.

Regards

Dr. Waleed Bin Hadi
Financial Advisory
Doha Qatar
dr.waleed.bin.hadi@gmail.com
