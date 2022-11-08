Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 139EE621B7A
	for <lists+linux-hams@lfdr.de>; Tue,  8 Nov 2022 19:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234732AbiKHSKO (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 8 Nov 2022 13:10:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234268AbiKHSKM (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 8 Nov 2022 13:10:12 -0500
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B137E1C423
        for <linux-hams@vger.kernel.org>; Tue,  8 Nov 2022 10:10:09 -0800 (PST)
X-Envelope-From: thomas@x-berg.in-berlin.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 2A8IA7db3113888
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Tue, 8 Nov 2022 19:10:07 +0100
Received: from thomas by x-berg.in-berlin.de with local (Exim 4.94.2)
        (envelope-from <thomas@x-berg.in-berlin.de>)
        id 1osT31-0006dG-0k; Tue, 08 Nov 2022 19:10:07 +0100
Date:   Tue, 8 Nov 2022 19:10:06 +0100
From:   Thomas Osterried <thomas@osterried.de>
To:     "Steven R. Loomis" <srl295@gmail.com>
Cc:     "Mike McCarthy, W1NR" <lists@w1nr.net>, linux-hams@vger.kernel.org
Subject: Re: Replacement for linux-ax25.org git?
Message-ID: <Y2qbfrHkKAf44cdK@x-berg.in-berlin.de>
References: <550e4271-a857-4540-953f-4c395e4bb2f5@app.fastmail.com>
 <ed2bfaa6-4c68-5743-90aa-0149322e5f94@w1nr.net>
 <Y2pybykD07N1nBG+@x-berg.in-berlin.de>
 <29F7FF8E-64E6-4927-9DE6-23E98C763832@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29F7FF8E-64E6-4927-9DE6-23E98C763832@gmail.com>
Sender: Thomas Osterried <thomas@x-berg.in-berlin.de>
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello Steven,

On Tue, Nov 08, 2022 at 11:50:42AM -0600, Steven R. Loomis wrote:
> Thanks for bringing this back.
> 
> “Latest Versions” on the main page right hand sidebar <http://linux-ax25.in-berlin.de/wiki/Main_Page> still link to the linux-ax25.org <http://linux-ax25.org/> URL and are thus broken.

Thank you.

It's recommended to use the git head anyway.


I'll fix the links in the wiki.
But personaly, I really dislike the "releases"-idea in the days of git.
It's much easier to initiate "git pull" to update a previously checked-out
version.
Furthermore, if we really like to to have something like "release", we need a
mechanism that (semi-)automatically makes a new release some time after
a commit (that has been proven bug-free).
Else there's no benefit of using such a "release" in production, because it
remained old and buggy.

vy 73,
	- Thomas  dl9sau

