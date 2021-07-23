Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D31E3D3644
	for <lists+linux-hams@lfdr.de>; Fri, 23 Jul 2021 10:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234361AbhGWHeJ (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 23 Jul 2021 03:34:09 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:40813 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234351AbhGWHeJ (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 23 Jul 2021 03:34:09 -0400
Received: (Authenticated sender: ralf@linux-mips.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8DEE124000D;
        Fri, 23 Jul 2021 08:14:41 +0000 (UTC)
Date:   Fri, 23 Jul 2021 10:14:39 +0200
From:   Ralf Baechle <ralf@linux-mips.org>
To:     David Ranch <linux-hams@trinnet.net>
Cc:     linux-hams@vger.kernel.org
Subject: Re: Status of the stuck sockets bugs.
Message-ID: <YPp6b2WSki7pZOoE@linux-mips.org>
References: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
 <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
 <b435d3b3-b632-de9f-2f14-5a94e718f7a8@trinnet.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b435d3b3-b632-de9f-2f14-5a94e718f7a8@trinnet.net>
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Thu, Jul 22, 2021 at 04:22:48PM -0700, David Ranch wrote:

> This issue is still present in all current Linux kernels.  I believe Ralf
> Baechle (current AX.25 kernel module maintainer) has been aware of this
> issue for some time.

I've never been able to reproduce the issue which made it really hard to
debug.  On my own system I've never observed the issue even once.

  Ralf
