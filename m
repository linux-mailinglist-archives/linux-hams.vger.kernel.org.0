Return-Path: <linux-hams+bounces-285-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 820388CB067
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 16:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00739B23825
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 14:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D67712FF8E;
	Tue, 21 May 2024 14:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="Tyt0qQ+P"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp66.iad3a.emailsrvr.com (smtp66.iad3a.emailsrvr.com [173.203.187.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB73476410
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 14:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.203.187.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716301609; cv=none; b=RhvEzN3vMs3XbZR3V+9YGn8Q+YaCq5MRZWGEEH6YO1s2mMR7iKK/U/7S9y2uakZwXidvmfRpzIIDr0MwkTHXq44aNi9rAE1OBceSenE9sT12QbkmU/ylIsOHgFETMfWIYm5gDQKZAC9YXgpLtiFo8ibY0XmUl2C1mrICk0ohpZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716301609; c=relaxed/simple;
	bh=6rcao04hQeVno8yrfJmgCPkSPcV3baO7X1HxX+0vjs4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qmg+WYylTkMC9mdlCcc1wEFrpFJMtPNgjLvEqZadCt8OWBYoeJ3uqdA7ulCJLJipgLVozHyoB7EbFEGdKjkglLrl1lxWi+eBqg3iAqeYk7MKzvUrqF0ydvYkU7KYr0wwq5+TaWbQiPBpFOs31d3zr3yNuWC5snOh9iVeJAlUv6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=Tyt0qQ+P; arc=none smtp.client-ip=173.203.187.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1716299325;
	bh=6rcao04hQeVno8yrfJmgCPkSPcV3baO7X1HxX+0vjs4=;
	h=Date:From:To:Subject:From;
	b=Tyt0qQ+PZgzvyTNPpqncmAs8POYnCZBMURAdnFjdzgmI3Sn6D5BihHvznBWUK9IZ2
	 XG5+2OXM7FPEsrgdE9RnGFpINRlK/yNjNtgSeAY/aLpFiXAQyFp+pWZ3TpJ3oJ9twR
	 OyQGo+J5P6oSeuXnvlCM1Ine6sEIp+rNujS/G4ik=
X-Auth-ID: lars@oddbit.com
Received: by smtp17.relay.iad3a.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 7D1FC23C6D;
	Tue, 21 May 2024 09:48:45 -0400 (EDT)
Date: Tue, 21 May 2024 09:48:45 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: netdev@vger.kernel.org, linux-hams@vger.kernel.org
Subject: [PATCH v2] ax25: Fix refcount imbalance on inbound connections
Message-ID: <46ydfjtpinm3py3zt6lltxje4cpdvuugaatbvx4y27m7wxc2hz@4wdtoq7yfrd5>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Classification-ID: c79c05b8-b80d-41a9-a40c-04b626f6090e-1-1

The first version of this patch was posted only to the linux-hams
mailing list. It has been difficult to get the patch reviewed, but the
patch has now been tested successfully by three people (that includes
me) who have all verified that it prevents the crashes that were
previously plaguing inbound ax.25 connections.

Related discussions:

- https://marc.info/?l=linux-hams&m=171629285223248&w=2
- https://marc.info/?l=linux-hams&m=171270115728031&w=2

>8------------------------------------------------------8<

When releasing a socket in ax25_release(), we call netdev_put() to
decrease the refcount on the associated ax.25 device. However, the
execution path for accepting an incoming connection never calls
netdev_hold(). This imbalance leads to refcount errors, and ultimately
to kernel crashes.

A typical call trace for the above situation looks like this:

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

On reboot (or any attempt to remove the interface), the kernel gets
stuck in an infinite loop:

    unregister_netdevice: waiting for ax0 to become free. Usage count = 0

This patch corrects these issues by ensuring that we call netdev_hold()
and ax25_dev_hold() for new connections in ax25_accept(), balancing the
calls to netdev_put() and ax25_dev_put() in ax25_release.

Fixes: 7d8a3a477b
Signed-off-by: Lars Kellogg-Stedman <lars@oddbit.com>
---
 net/ax25/af_ax25.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 8077cf2ee44..ff921272d40 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1381,6 +1381,8 @@ static int ax25_accept(struct socket *sock, struct socket *newsock,
 	DEFINE_WAIT(wait);
 	struct sock *sk;
 	int err = 0;
+	ax25_cb *ax25;
+	ax25_dev *ax25_dev;
 
 	if (sock->state != SS_UNCONNECTED)
 		return -EINVAL;
@@ -1434,6 +1436,10 @@ static int ax25_accept(struct socket *sock, struct socket *newsock,
 	kfree_skb(skb);
 	sk_acceptq_removed(sk);
 	newsock->state = SS_CONNECTED;
+	ax25 = sk_to_ax25(newsk);
+	ax25_dev = ax25->ax25_dev;
+	netdev_hold(ax25_dev->dev, &ax25->dev_tracker, GFP_ATOMIC);
+	ax25_dev_hold(ax25_dev);
 
 out:
 	release_sock(sk);
-- 
2.45.1

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

