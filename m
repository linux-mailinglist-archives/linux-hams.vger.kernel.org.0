Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 776D1531A75
	for <lists+linux-hams@lfdr.de>; Mon, 23 May 2022 22:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbiEWTb5 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 23 May 2022 15:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232023AbiEWTba (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 23 May 2022 15:31:30 -0400
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B7E1A3598
        for <linux-hams@vger.kernel.org>; Mon, 23 May 2022 12:14:24 -0700 (PDT)
X-Envelope-From: thomas@x-berg.in-berlin.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 24NJEMvR3934463
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Mon, 23 May 2022 21:14:22 +0200
Received: from thomas by x-berg.in-berlin.de with local (Exim 4.94.2)
        (envelope-from <thomas@x-berg.in-berlin.de>)
        id 1ntDVV-0001pz-Vb; Mon, 23 May 2022 21:14:22 +0200
Date:   Mon, 23 May 2022 21:14:21 +0200
From:   Thomas Osterried <thomas@osterried.de>
To:     duoming@zju.edu.cn
Cc:     Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org
Subject: Re: Regression in "ax25: Fix UAF bugs in ax25 timers", patch
 82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
Message-ID: <YovdDeh2Lzy3QrKM@x-berg.in-berlin.de>
References: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
 <57922f90.2c358.180f13e25f0.Coremail.duoming@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57922f90.2c358.180f13e25f0.Coremail.duoming@zju.edu.cn>
Sender: Thomas Osterried <thomas@x-berg.in-berlin.de>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

> > Due to patch 82e31755e55fbcea6a9dfaae5fe4860ade17cbc, any ax25 session is cleaned up anymore on disconnect.
> > -> netstat --ax25 shows the ex-connected session it in state "LISTEN". Makes ax25 unusable in a production environment.
> > => Regression.
> 
> Is there any ways to reproduce this problem? 

I found no ax25 connection that cleaned up anymore.

It's useful to test many (best: all) of these cases:
incoming connection from remote. and initiate disconnect from remote.
  [In this case, we have no socket to userspace]. and send terminate it from there.
outgoing connection initiated by sending an ip packet to remote (iface configured for mode VC).
  [In this case, we have no so socket to userspace]
Incoming connection fron remote and local started ax25d which listens 
for pid=test (-> socket is allocated).
outgoing connection initiated by userspace connect(). and terminate it.

And for each one, kill hard the remote site and 
- see if after idle timer expiry everything goes the correct way.
- send a packet (-> retries until retry timer expiry) and see if after timer expiry everything goes the correct way.

I tested many of these combinations, but not all.

All these cases can happen normaly in the real world.


