Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 193344DB665
	for <lists+linux-hams@lfdr.de>; Wed, 16 Mar 2022 17:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236673AbiCPQol (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 16 Mar 2022 12:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357462AbiCPQoi (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 16 Mar 2022 12:44:38 -0400
Received: from yagi.h-net.msu.edu (yagi.h-net.msu.edu [35.9.18.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2BFDC1CFC7
        for <linux-hams@vger.kernel.org>; Wed, 16 Mar 2022 09:43:21 -0700 (PDT)
Received: from yagi.h-net.org (unknown [127.0.0.1])
        by yagi.h-net.msu.edu (Postfix) with ESMTP id 467262902D1
        for <linux-hams@vger.kernel.org>; Wed, 16 Mar 2022 12:43:21 -0400 (EDT)
X-Virus-Scanned: amavisd-new at example.com
Received: from yagi.h-net.msu.edu ([127.0.0.1])
        by yagi.h-net.org (yagi.h-net.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id XpWloPtjs0uW for <linux-hams@vger.kernel.org>;
        Wed, 16 Mar 2022 12:43:21 -0400 (EDT)
Received: from yagi.h-net.org (localhost [127.0.0.1])
        by yagi.h-net.msu.edu (Postfix) with ESMTP
        for <linux-hams@vger.kernel.org>; Wed, 16 Mar 2022 12:43:21 -0400 (EDT)
References: <13d4710d-03cc-66e2-e6a4-f7da4b00ca92@trinnet.net> <20220315213245.3304328BA6B@yagi.h-net.msu.edu>
To:     linux-hams@vger.kernel.org
From:   Dennis Boone <drb@msu.edu>
Subject: Re: Loss of connection state?
In-reply-to: (Your message of Tue, 15 Mar 2022 19:15:29 -0400.)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <88892.1647449001.1@yagi.h-net.org>
Date:   Wed, 16 Mar 2022 12:43:21 -0400
Message-Id: <20220316164321.467262902D1@yagi.h-net.msu.edu>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

 > I _had_ been interpreting most of the rest of the RRx frames as idle
 > polls, but I can see where that may have been erroneous and they
 > could be getting lost.  I don't _think_ that explains why I don't
 > resend I01 after I get RR1 from him.

David,

I went back and reviewed the spec.  Comparing the timing of the
conversation with his expected timer settings my known ones, I've
concluded that what I thought were T3 timeouts (channel keepalives) were
probably in fact FRACK timeouts, and that therefore as you suggested,
more packets were getting lost than I originally thought.

This link is a little marginal, and it varies by time of day, but it
isn't usually _this_ bad.

De
