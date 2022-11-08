Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5BD621112
	for <lists+linux-hams@lfdr.de>; Tue,  8 Nov 2022 13:41:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbiKHMlC (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 8 Nov 2022 07:41:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234060AbiKHMlB (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 8 Nov 2022 07:41:01 -0500
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9362F51C0A
        for <linux-hams@vger.kernel.org>; Tue,  8 Nov 2022 04:41:00 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id C529F5C00C1
        for <linux-hams@vger.kernel.org>; Tue,  8 Nov 2022 07:40:59 -0500 (EST)
Received: from imap45 ([10.202.2.95])
  by compute5.internal (MEProxy); Tue, 08 Nov 2022 07:40:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vehibberd.com;
         h=cc:content-type:date:date:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1667911259; x=1667997659; bh=k8cxV3A4BmoNa0iXlLNs9KAgUrmFGsEf+Sv
        guRTM8/w=; b=EX2joWj2jBAhuUxCquWiMTEPWuZK6BZZLcr+8LV3W+uhOfiJVUH
        kJ43SXWIU+pQumVahBssY5uzvRHeZmBMV2N0K3aOHC0MVo7vYCgFkiDF8gKLety+
        Sjs/CVyRkXJHUVqws4a1o0Sk55geLXQOtaK1LoTu2n5c30V7Fk0ArkEV3X73TU7X
        DJcj0N1KNjpWjgoKXyWgZJ1IhQkLhL9SO3qhKXeeJaf9inh9kPYiIrXWNmM5BrPy
        MaFMWjxYzWg81+p2JvaEiTvKRBCFjzh4cK6L2T8UfgFrZyvD05tfueiRiBGU/wVl
        fRJjX6evZantRD3zlBeTnOg86Ho/IUfsbLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:message-id:mime-version
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667911259; x=
        1667997659; bh=k8cxV3A4BmoNa0iXlLNs9KAgUrmFGsEf+SvguRTM8/w=; b=Q
        c7V4vyUT4MBghDqzPSd7I6aD/CA+lPjhCubP8IbqNFneLkkxJ0kFRoae42TFwjq8
        Mkzf6prt/aVMXMvcZqEZAA4zLlENm7o/5vUqPbpunHFr6fpc1Pq29wVjv4iFzuBh
        YzM1DoCYbfHhnot35XzzIHa7+3h1jL5Z/Ass+oWoxP+lNC2C79ehXAZTF8eILT/+
        O7eM8VH4sZgPO9n7wEJWsSzIs/cO9pFVb1DSYW6YdA+hUJupsYOANCEdLwKCYuQj
        QOvc9Ql/mYuG6n24ALKES5H7Ws5oVRxnjJ6mGyt2OGPZS2wDDP0qc8GIIQpjmI/H
        UdZsB+7WzzqszBAa+8bvA==
X-ME-Sender: <xms:W05qY0V8J535R39N-IO8nB5tMqZIYiXrOJfl6tyB4xFAU0OMaYlhwA>
    <xme:W05qY4kDCBGcBzcSfT6WSw2P5OZMjOpsZ52Ugl51SZm2ZhWRaDjGcJLP2qn-AIxgO
    gWa6YL9N5jWPVUQkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedtgdegfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtredtre
    ertdenucfhrhhomhepfdffrghvvgcujfhisggsvghrugdfuceougesvhgvhhhisggsvghr
    ugdrtghomheqnecuggftrfgrthhtvghrnhephefgveevueetudfhheehhfehhfeuteeile
    euleffheeuheejffejtdehfeettdehnecuffhomhgrihhnpehlihhnuhigqdgrgidvhedr
    ohhrghdpuggvsghirghnrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepugesvhgvhhhisggsvghrugdrtghomh
X-ME-Proxy: <xmx:W05qY4bvQnvSsypZ2iG5y64NQzx3ozgkGGOlUPv_uDfrIF_i-ELL6A>
    <xmx:W05qYzXMHeddeIw0XPAnCDiUpEJzYk15O6h2reIXH4bSOec5yMpneg>
    <xmx:W05qY-lUR6BLqTieY79pfAcRw_VPYZUvw011HT0q9fxEgHMa34V8fg>
    <xmx:W05qY6xKjyVRKRCk_zk88jxLPoFk4ZsPj4tnCPLPhfkBhwD50jDk_g>
Feedback-ID: i6c7042c5:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 9E20A272007A; Tue,  8 Nov 2022 07:40:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <550e4271-a857-4540-953f-4c395e4bb2f5@app.fastmail.com>
Date:   Tue, 08 Nov 2022 12:41:12 +0000
From:   "Dave Hibberd" <d@vehibberd.com>
To:     linux-hams@vger.kernel.org
Subject: Replacement for linux-ax25.org git?
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hi all,

I'm one of the folks in the Debian Hamradio team with an active interest in keeping our packet tooling going. 

With the demise of linux-ax25.org and discussions here about change of maintenance, is there a new canonical repo for ax25-tools and similar where these components are held? 

Our last upstram mirror was about 3 years ago, we've got it tagged as 0.0.10-rc5+git20190411+3595f87 [1] - this is what will have flowed down into Ubuntu, Raspberry Pi OS etc. 

If there's currently active work going on with these userland components, where is it happening so we can rebase our packages? 
If not, I guess this is something we need to make a decision on how to proceed as a community!


[1]: https://salsa.debian.org/debian-hamradio-team/ax25-tools/-/tree/upstream

-- 
  Hibby
  MM0RFN
