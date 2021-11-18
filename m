Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7228B4560DF
	for <lists+linux-hams@lfdr.de>; Thu, 18 Nov 2021 17:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233668AbhKRQsy (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 18 Nov 2021 11:48:54 -0500
Received: from porter.cam.gajendra.net ([23.30.150.137]:51769 "EHLO
        yamaloka.gajendra.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S233584AbhKRQsx (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 18 Nov 2021 11:48:53 -0500
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Nov 2021 11:48:53 EST
Received: from localhost (yamaloka.gajendra.net [local])
        by yamaloka.gajendra.net (OpenSMTPD) with ESMTPA id 0fc9b0d0
        for <linux-hams@vger.kernel.org>;
        Thu, 18 Nov 2021 16:39:11 +0000 (UTC)
From:   Dan Cross <crossd@gmail.com>
To:     linux-hams@vger.kernel.org
Subject: NET/ROM bug fix from YO2LOJ?
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <17057.1637252655.1@local.net>
Date:   Thu, 18 Nov 2021 16:39:11 +0000
Message-ID: <27764.1637253551@yamaloka.gajendra.net>
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On October 26 2021, N1URO sent a message to this list asking
about getting "the NetRom status bug" fixed.  There was no
additional context, so perhaps it's unsurprising that no one
responded.

However, his message appears to refer to a legitimate bug in
which NET/ROM sockets can be left in an invalid state after
closing.  Marius Petrescu, YO2LOJ, has a small patch for this
on his web site, but from my searching, I can't find any record
that it ever made it to either this list or the LKML.

Marius's fix is short (slightly reformatted for kernels style):

--- ../reference/linux/net/ax25/ax25_subr.c	Thu Nov 18 15:33:53 2021
+++ ax25_subr.c	Thu Nov 18 16:05:36 2021
@@ -284,5 +284,8 @@
 		}
 		bh_unlock_sock(ax25->sk);
 		local_bh_enable();
+	} else {
+		// YO2LOJ: this is needed for proper NETROM connection cleanup on timeout
+		ax25_destroy_socket(ax25);
 	}
 }

I do not know whether this is the _right_ fix for this issue,
but it seems that additional context towards getting it fixed
would be helpful, hence this message.

Is anyone tracking this issue?

Thanks and 73,

	- Dan C.
	  (KZ2X)

