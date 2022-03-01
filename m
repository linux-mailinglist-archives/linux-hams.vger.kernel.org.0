Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 643FA4C9436
	for <lists+linux-hams@lfdr.de>; Tue,  1 Mar 2022 20:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234949AbiCAT1p (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 1 Mar 2022 14:27:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232531AbiCAT1o (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 1 Mar 2022 14:27:44 -0500
Received: from yagi.h-net.msu.edu (yagi.h-net.msu.edu [35.9.18.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D97AA140CC
        for <linux-hams@vger.kernel.org>; Tue,  1 Mar 2022 11:27:02 -0800 (PST)
Received: from yagi.h-net.org (unknown [127.0.0.1])
        by yagi.h-net.msu.edu (Postfix) with ESMTP id 7572C28AB27
        for <linux-hams@vger.kernel.org>; Tue,  1 Mar 2022 14:27:02 -0500 (EST)
X-Virus-Scanned: amavisd-new at example.com
Received: from yagi.h-net.msu.edu ([127.0.0.1])
        by yagi.h-net.org (yagi.h-net.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id CvcdpUT5084a for <linux-hams@vger.kernel.org>;
        Tue,  1 Mar 2022 14:27:02 -0500 (EST)
Received: from yagi.h-net.org (localhost [127.0.0.1])
        by yagi.h-net.msu.edu (Postfix) with ESMTP
        for <linux-hams@vger.kernel.org>; Tue,  1 Mar 2022 14:27:02 -0500 (EST)
References: <3b946f99-6b6e-1366-1675-3e68304431bb@trinnet.net> <20220301173317.AF98C28A6C6@yagi.h-net.msu.edu>
To:     linux-hams@vger.kernel.org
From:   Dennis Boone <drb@msu.edu>
Subject: Re: Wireshark ax25 dissector
In-reply-to: (Your message of Tue, 01 Mar 2022 10:59:20 -0800.)
             <3b946f99-6b6e-1366-1675-3e68304431bb@trinnet.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8656.1646162822.1@yagi.h-net.org>
Date:   Tue, 01 Mar 2022 14:27:02 -0500
Message-Id: <20220301192702.7572C28AB27@yagi.h-net.msu.edu>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

 > I have Wireshark 3.2.3 on Ubuntu 20.04 decoding packets on the ax0
 > interface and while the ax25_nol3 dissector seems to work ok, the
 > standard ax25.src dissector doesn't seem to work for me either. Might
 > be worth doing a bug search to see if this is something already known
 > or create a new issue if none are found.

David,

Thanks for the confirmation.  I can't find a relevant bug in their
gitlab tracker, so have opened one.

https://gitlab.com/wireshark/wireshark/-/issues/17973

De
