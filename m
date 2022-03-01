Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5097F4C91D6
	for <lists+linux-hams@lfdr.de>; Tue,  1 Mar 2022 18:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbiCARjU (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 1 Mar 2022 12:39:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbiCARjU (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 1 Mar 2022 12:39:20 -0500
X-Greylist: delayed 319 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 01 Mar 2022 09:38:38 PST
Received: from yagi.h-net.msu.edu (yagi.h-net.msu.edu [35.9.18.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6B35F6571
        for <linux-hams@vger.kernel.org>; Tue,  1 Mar 2022 09:38:37 -0800 (PST)
Received: from yagi.h-net.org (unknown [127.0.0.1])
        by yagi.h-net.msu.edu (Postfix) with ESMTP id AF98C28A6C6
        for <linux-hams@vger.kernel.org>; Tue,  1 Mar 2022 12:33:17 -0500 (EST)
X-Virus-Scanned: amavisd-new at example.com
Received: from yagi.h-net.msu.edu ([127.0.0.1])
        by yagi.h-net.org (yagi.h-net.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EA4osl_yAcuz for <linux-hams@vger.kernel.org>;
        Tue,  1 Mar 2022 12:33:17 -0500 (EST)
Received: from yagi.h-net.org (localhost [127.0.0.1])
        by yagi.h-net.msu.edu (Postfix) with ESMTP
        for <linux-hams@vger.kernel.org>; Tue,  1 Mar 2022 12:33:17 -0500 (EST)
To:     linux-hams@vger.kernel.org
From:   Dennis Boone <drb@msu.edu>
Subject: Wireshark ax25 dissector
Reply-to: drb@msu.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <77336.1646155997.1@yagi.h-net.org>
Date:   Tue, 01 Mar 2022 12:33:17 -0500
Message-Id: <20220301173317.AF98C28A6C6@yagi.h-net.msu.edu>
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_05,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Folks,

I'm having trouble getting Wireshark's ax25 dissector to process
callsign filters properly.  I can't get _anything_ to match.  I've tried
expressions like:

    ax25.src ~ "KB8ZQZ"
    ax25.src ~ "KB8ZQZ-0"
    ax25.src ~ KB8ZQZ
    ax25.src ~ KB8ZQZ-0

and the equivalents with ax25.dst.  I've tried various callsigns which
are in the capture file I'm examining.  The source and destination
columns in the packet browser are filled in rationally.

debian sid
wireshark 3.6.2-1
5.16.0-1-amd64 #1 SMP PREEMPT Debian 5.16.7-2 (2022-02-09) x86_64
GNU/Linux

Does anyone know of something different I should be doing?  A known bug?

Thanks,

de KB8ZQZ
