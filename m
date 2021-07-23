Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF9D63D368C
	for <lists+linux-hams@lfdr.de>; Fri, 23 Jul 2021 10:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234382AbhGWHjX (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 23 Jul 2021 03:39:23 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:33997 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234376AbhGWHjW (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 23 Jul 2021 03:39:22 -0400
Received: (Authenticated sender: ralf@linux-mips.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id EFCE3E0006;
        Fri, 23 Jul 2021 08:19:54 +0000 (UTC)
Date:   Fri, 23 Jul 2021 10:19:53 +0200
From:   Ralf Baechle <ralf@linux-mips.org>
To:     Dave van der Locht <d.vanderlocht@gmail.com>
Cc:     linux-hams@vger.kernel.org
Subject: Re: Status of the stuck sockets bugs.
Message-ID: <YPp7qeWGSW/s4TI6@linux-mips.org>
References: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
 <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Thu, Jul 22, 2021 at 07:42:18PM +0200, Dave van der Locht wrote:

> Is anybody able to tell me more / give answers to questions about this issue?
> 
> Kind regards,
> Dave van der Locht
> 
> Op di 29 jun. 2021 om 19:32 schreef Dave van der Locht
> <d.vanderlocht@gmail.com>:
> >
> > Hello,
> >
> > Is there any news about the well known bug regarding sockets getting
> > stuck in LISTENING state?
> >
> > Some years ago (already) Marius Petrescu YO2LOJ wrote a patch for the
> > ax25_subr.c file which seems to work very well and solves the issue.
> > But it's really annoying having to patch the kernel with each update
> > again.
> >
> > What about that patch, I've heard it was rejected several times for
> > some reason? But can't find info regarding that.
> > What can be done - or who is able - to get rid of this bug and get it
> > fixed in the kernel?

I wasn't even aware of these patches and an internet search didn't turn
up anything.  Fortunately it turned out I have friends who happen to
know Marius so who pointed me at his "patches" really quickly.

And they were not even patches but a broken out net/ax25 directory from
a Debian kernel with random changes.  That said, while the way these
changes were hidden away and present leaves space for improvments,
technically they appear to have benefit, so I'm now working through
them.

  Ralf
