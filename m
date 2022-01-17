Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF12490853
	for <lists+linux-hams@lfdr.de>; Mon, 17 Jan 2022 13:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236742AbiAQMJl (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 17 Jan 2022 07:09:41 -0500
Received: from einhorn.in-berlin.de ([192.109.42.8]:45663 "EHLO
        einhorn-mail-out.in-berlin.de" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230132AbiAQMJk (ORCPT
        <rfc822;linux-hams@vger.kernel.org>);
        Mon, 17 Jan 2022 07:09:40 -0500
X-Envelope-From: thomas@x-berg.in-berlin.de
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
        by einhorn.in-berlin.de  with ESMTPS id 20HBtQJD026276
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Mon, 17 Jan 2022 12:55:26 +0100
Received: from thomas by x-berg.in-berlin.de with local (Exim 4.92)
        (envelope-from <thomas@x-berg.in-berlin.de>)
        id 1n9Qbe-0004Mw-CZ; Mon, 17 Jan 2022 12:55:26 +0100
Date:   Mon, 17 Jan 2022 12:55:26 +0100
From:   Thomas Osterried <thomas@osterried.de>
To:     Roland Schwarz <roland.schwarz@blackspace.at>
Cc:     linux-hams@vger.kernel.org
Subject: Re: Please explain /proc/net/ax25_route
Message-ID: <20220117115526.GA18529@x-berg.in-berlin.de>
References: <74ced8bf-f742-b2d2-b2bb-3eff2b168cd8@blackspace.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74ced8bf-f742-b2d2-b2bb-3eff2b168cd8@blackspace.at>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Thomas Osterried <thomas@x-berg.in-berlin.de>
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello Roland,

On Sun, Jan 16, 2022 at 12:33:57PM +0100, Roland Schwarz wrote:
> Dear all,
> 
> can anyone, please, give me a helping hand understanding ax25 kernel
> routing? Will the tables allow digipeating of ax25 frames or are they only
> meant for use with axip?

Unfortunately, linux kernel ax25 does not implement (even simple) AX.2 layer2 digipeating.

This functionality is up to userspace programs. Personaly, I think simple digipeating
would be great (for reasons as performance and simplicity), butt that's another story.

The kernel routing table is basically for IP over AX.25.
You see the reference for ax25_ip_xmit in ax25_ip_xmit in ax25_ip.c
If kernel likes to send an IP-frame, it requests IP routes for interfces, finds i.e.
an AX.25 ARP for that route, and need two things to know:
1. use Mode VC or Mode DG?
2. is it directly reachable or via an ax25 path (that's why the struct has the
   digi path information).
This is done without interaction with userspace utilities.

For beeing easily able to see the content of that routing table, it's available through
/proc.
It can be filled and adjusted from userspace with axparms (by hand, startup script, etc.)
or by ax25rtd.

The userspace programs use ioctls via ax25_ioctl()
like SIOCADDRT, SIOCDELRT, SIOCAX25OPTRT,
in af_ax25.c, which calls ax25_rt_ioctl() in ax25_route.c


vy 73,
		- Thomas  dl9sau
