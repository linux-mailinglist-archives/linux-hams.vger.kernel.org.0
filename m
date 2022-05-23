Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37EDE531784
	for <lists+linux-hams@lfdr.de>; Mon, 23 May 2022 22:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiEWTTC (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 23 May 2022 15:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiEWTSj (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 23 May 2022 15:18:39 -0400
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E9C011AFE9
        for <linux-hams@vger.kernel.org>; Mon, 23 May 2022 11:53:37 -0700 (PDT)
X-Envelope-From: thomas@x-berg.in-berlin.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 24NIrXS13925656
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Mon, 23 May 2022 20:53:33 +0200
Received: from thomas by x-berg.in-berlin.de with local (Exim 4.94.2)
        (envelope-from <thomas@x-berg.in-berlin.de>)
        id 1ntDBN-0001ja-9N; Mon, 23 May 2022 20:53:33 +0200
Date:   Mon, 23 May 2022 20:53:33 +0200
From:   Thomas Osterried <thomas@osterried.de>
To:     Roland Schwarz <roland.schwarz@blackspace.at>
Cc:     duoming@zju.edu.cn, Thomas Osterried <thomas@osterried.de>,
        linux-hams@vger.kernel.org
Subject: Re: Regression in "ax25: Fix UAF bugs in ax25 timers", patch
 82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
Message-ID: <YovYLRTLOJnVW4GP@x-berg.in-berlin.de>
References: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
 <57922f90.2c358.180f13e25f0.Coremail.duoming@zju.edu.cn>
 <4e38f3dc-88f5-1df9-bdd4-f1d169d67439@blackspace.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e38f3dc-88f5-1df9-bdd4-f1d169d67439@blackspace.at>
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

On Mon, May 23, 2022 at 06:05:47PM +0200, Roland Schwarz wrote:
> 
> 
> On 23.05.22 at 16:07 wrote duoming@zju.edu.cn:
> ...>
> > Is there any ways to reproduce this problem?
> > 
> 
> As I understand it, the stuck LISTEN state is the
> infamous long-standing "stuck sockets" bug which
> Dave was pointing at in his mail "Status of the
> stuck sockets bugs" from 2021-06-29.

No, this is a new cause, resulting to the same
symtom (listening state ex-connected sessions).

As said, of you stop timers in cases you don't need
to, nothing tidies up (and nothing honors
the ax25 state machine).


There had been cases observed (since a few years).
I've seen such a case and have a fix I'll present
later. But let's resolve one after another,
not in parallel.

vy 73,
  - Thomas  dl9sau
