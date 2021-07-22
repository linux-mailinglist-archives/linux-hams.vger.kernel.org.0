Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99EE33D2386
	for <lists+linux-hams@lfdr.de>; Thu, 22 Jul 2021 14:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbhGVMIP (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 22 Jul 2021 08:08:15 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:53945 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbhGVMIP (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 22 Jul 2021 08:08:15 -0400
Received: (Authenticated sender: ralf@linux-mips.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id BD1DE200011;
        Thu, 22 Jul 2021 12:48:48 +0000 (UTC)
Date:   Thu, 22 Jul 2021 14:48:46 +0200
From:   Ralf Baechle DL5RB <ralf@linux-mips.org>
To:     Dave van der Locht <d.vanderlocht@gmail.com>
Cc:     linux-hams@vger.kernel.org
Subject: Re: SECURITY: Some type of NETROM frames contain random fragments of
 data from memory
Message-ID: <YPlpLpL3Yrz/YE6R@linux-mips.org>
References: <CAH4uzPNH6GVX_H0eCrBUxPdgynRc9a7xLGde1_37dTCz3fgJOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH4uzPNH6GVX_H0eCrBUxPdgynRc9a7xLGde1_37dTCz3fgJOA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Thu, Jul 22, 2021 at 01:40:23PM +0200, Dave van der Locht wrote:

> With Linux kernel 5.4 and up I've noticed some type of NETROM frames
> (conn, disc, etc.) contain random fragments of data from memory.
> I've seen all kinds of data fragments with security sensitive
> information in them depending on the software running.
> 
> Those random data fragments seem to appear only in some NETROM frames,
> haven't noticed them in any other frame type.
> 
> Most, if not all, remote node software seems to ignore those fragments
> and it won't be noticed until you capture the AX.25 over UDP frames.
> You'll see the frames are larger than expected and contain random
> fragments of data from (shared?) memory.
> 
> I've tested this with several 5.4 and 5.10 kernel versions
> distributions and they all seem to leak security sensitive information
> the same way into NETROM frames. Mostly logging data, but I've also
> seen MySQL data and other random fragments of data.
> I've also tested with kernel 4.19, which doesn't seem te be affected.

While that's not as accurate as a git bisect, it's good start.  Can you
provide a dump of such packets?

  Ralf
