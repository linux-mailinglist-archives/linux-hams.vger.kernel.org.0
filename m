Return-Path: <linux-hams+bounces-149-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 385808B42E1
	for <lists+linux-hams@lfdr.de>; Sat, 27 Apr 2024 01:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A20C1C22842
	for <lists+linux-hams@lfdr.de>; Fri, 26 Apr 2024 23:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76593FB9B;
	Fri, 26 Apr 2024 23:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="VGy7Skhb"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp91.iad3a.emailsrvr.com (smtp91.iad3a.emailsrvr.com [173.203.187.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E09E3FB89
	for <linux-hams@vger.kernel.org>; Fri, 26 Apr 2024 23:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.203.187.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714175808; cv=none; b=bGUd4WVZRfbXxOdrwRGAIEpiGB+6ZOcv10SWPU77EWBaNfW9W6drr2wZ9jEy9DOl08Lk9xpeogCxJhUjS/m7SPabXbkMAqKHMN7r12dzTgMSkRICBeKIGU6VpdHYpQnEXwrjh3UK4tZtiWJGqBva/Q7V8cdTOw6MP0EqdJIbGik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714175808; c=relaxed/simple;
	bh=yQ8fA8FirZXIYHJCBT8XXO+Ld7zlUxkCMB9Ot3LJPiI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K1GfeAvUsi4AussCnBLen7/AFOjT5bxE4FgOUOIhjztbJYq/JvLCjbr0aC006wJu1PXUgxve8huyn5LZWfRg1TfXoyxgFxToy7wAKwPpT5IqEuD7DcMVzZTpPHAXR0Xc2skDj2asH0lqpk2VB/XAYK2/9pKVyg5LUG4djJMHnUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=VGy7Skhb; arc=none smtp.client-ip=173.203.187.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1714166980;
	bh=yQ8fA8FirZXIYHJCBT8XXO+Ld7zlUxkCMB9Ot3LJPiI=;
	h=Date:From:To:Subject:From;
	b=VGy7Skhbix5oeooNYAZfC91WO1W2q82hj5K4g2F5v5vESJbHTi+s5WVqoCqHDdS5U
	 TB6D34FEGEc14xHVx/QV3pGtTbcOh4DFX/pUO5MAYJ+tZsZz/2EBVygXMhO9lie4Cz
	 SaaBP3KbQ6gDTgszTFPKnzlhjFhmjgrVVvWf+Mxw=
X-Auth-ID: lars@oddbit.com
Received: by smtp12.relay.iad3a.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 439E22505F
	for <linux-hams@vger.kernel.org>; Fri, 26 Apr 2024 17:29:40 -0400 (EDT)
Date: Fri, 26 Apr 2024 17:29:40 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: linux-hams@vger.kernel.org
Subject: [PATCH RFC] ax25: Fix (more) netdev refcount issues
Message-ID: <6kant25vimoq36blyb5sjqgq3xxjcqbqeskbgf5zihdho3iulb@ni2lvhiytfrg>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Classification-ID: 50e1119f-5d6a-4ce8-bb71-74dfa43cc334-1-1

Folks,

I'm posting the following patch here before sending it to netdev in the
hopes that someone can take a look at the change and comment on the
correctness. This resolves all of the issues I've been experiencing
recently with ax.25.

...

When closing a socket, the ax.25 code releases references via
netdev_put() and ax25_dev_put(). In the case when the socket was the
result of an incoming connection, these references were never allocated in
the first place, causing underflows in both ax25_dev->refcount and
ax25_dev->dev->refcnt_tracker->untracked. This would result in a variety of
errors:

- After an initial connection and then again after several subsequent
  connections:

      refcount_t: decrement hit 0; leaking memory.

- After several subsequent connections:

      refcount_t: underflow; use-after-free.

A typical call trace for the above two issues would look like:

    Call Trace:
    <TASK>
    ? show_regs+0x64/0x70
    ? __warn+0x83/0x120
    ? refcount_warn_saturate+0xb2/0x100
    ? report_bug+0x158/0x190
    ? prb_read_valid+0x20/0x30
    ? handle_bug+0x3e/0x70
    ? exc_invalid_op+0x1c/0x70
    ? asm_exc_invalid_op+0x1f/0x30
    ? refcount_warn_saturate+0xb2/0x100
    ? refcount_warn_saturate+0xb2/0x100
    ax25_release+0x2ad/0x360
    __sock_release+0x35/0xa0
    sock_close+0x19/0x20
    [...]

On reboot, the kernel would get stuck in an infinite loop:

    unregister_netdevice: waiting for ax1 to become free. Usage count = 0

The attached patch corrects all three of the above problems by ensuring
that we call netdev_hold() and ax25_dev_hold() for incoming connections.

Signed-off-by: Lars Kellogg-Stedman <lars@oddbit.com>
---
 net/ax25/ax25_in.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
index 1cac25aca63..35a55ad05f2 100644
--- a/net/ax25/ax25_in.c
+++ b/net/ax25/ax25_in.c
@@ -411,6 +411,8 @@ static int ax25_rcv(struct sk_buff *skb, struct net_device *dev,
 	ax25->state = AX25_STATE_3;
 
 	ax25_cb_add(ax25);
+	netdev_hold(ax25_dev->dev, &ax25->dev_tracker, GFP_ATOMIC);
+	ax25_dev_hold(ax25_dev);
 
 	ax25_start_heartbeat(ax25);
 	ax25_start_t3timer(ax25);
-- 
2.44.0

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

