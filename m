Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF686217F2
	for <lists+linux-hams@lfdr.de>; Tue,  8 Nov 2022 16:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234613AbiKHPTB (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 8 Nov 2022 10:19:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234513AbiKHPSg (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 8 Nov 2022 10:18:36 -0500
X-Greylist: delayed 172 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Nov 2022 07:17:50 PST
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC7060E93
        for <linux-hams@vger.kernel.org>; Tue,  8 Nov 2022 07:17:50 -0800 (PST)
X-Envelope-From: thomas@x-berg.in-berlin.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 2A8FEuWb2966879
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Tue, 8 Nov 2022 16:14:56 +0100
Received: from thomas by x-berg.in-berlin.de with local (Exim 4.94.2)
        (envelope-from <thomas@x-berg.in-berlin.de>)
        id 1osQJT-0005ee-Md; Tue, 08 Nov 2022 16:14:55 +0100
Date:   Tue, 8 Nov 2022 16:14:55 +0100
From:   Thomas Osterried <thomas@osterried.de>
To:     "Mike McCarthy, W1NR" <lists@w1nr.net>
Cc:     linux-hams@vger.kernel.org
Subject: Re: Replacement for linux-ax25.org git?
Message-ID: <Y2pybykD07N1nBG+@x-berg.in-berlin.de>
References: <550e4271-a857-4540-953f-4c395e4bb2f5@app.fastmail.com>
 <ed2bfaa6-4c68-5743-90aa-0149322e5f94@w1nr.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed2bfaa6-4c68-5743-90aa-0149322e5f94@w1nr.net>
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

On Tue, Nov 08, 2022 at 08:41:22AM -0500, Mike McCarthy, W1NR wrote:
> Does anyone know if the repos at linux-ax25.org
> were archived anywhere before it went offline?

linux-ax25.org domain is dead due to dns fail.

The host running the repos is still in service and
is available under linux-ax25.in-berlin.de.

That dns name is not my favourite choice (see my post on this list about this topic),
but it is future proven, does not depend on a single person, and is under full control.

I hoped linux-ax25.org will come back. Now we have to live with that solution.

vy 73,
  - Thomas  dl9sau


> 
> Mike, W1NR
> 
> On 11/8/2022 7:41 AM, Dave Hibberd wrote:
> > Hi all,
> > 
> > I'm one of the folks in the Debian Hamradio team with an active interest in keeping our packet tooling going.
> > 
> > With the demise of linux-ax25.org and discussions here about change of maintenance, is there a new canonical repo for ax25-tools and similar where these components are held?
> > 
> > Our last upstram mirror was about 3 years ago, we've got it tagged as 0.0.10-rc5+git20190411+3595f87 [1] - this is what will have flowed down into Ubuntu, Raspberry Pi OS etc.
> > 
> > If there's currently active work going on with these userland components, where is it happening so we can rebase our packages?
> > If not, I guess this is something we need to make a decision on how to proceed as a community!
> > 
> > 
> > [1]: https://salsa.debian.org/debian-hamradio-team/ax25-tools/-/tree/upstream
> > 
