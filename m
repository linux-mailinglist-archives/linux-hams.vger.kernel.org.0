Return-Path: <linux-hams+bounces-344-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB84A8D4037
	for <lists+linux-hams@lfdr.de>; Wed, 29 May 2024 23:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0887E1C22346
	for <lists+linux-hams@lfdr.de>; Wed, 29 May 2024 21:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0301C68AC;
	Wed, 29 May 2024 21:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="jG9OM9BQ"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp115.iad3b.emailsrvr.com (smtp115.iad3b.emailsrvr.com [146.20.161.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C568C184132
	for <linux-hams@vger.kernel.org>; Wed, 29 May 2024 21:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717017704; cv=none; b=eIzDXpz9qWzW1tuwLQupWSIEUJLbJGRUtYG/teUeVLwf6Sa5DpADrrO+ju0v7lF651LUGB2rsaN2B5V7NBo7QQgbgYzxkEdurCKkkLK5pcWmeD5LqfQGTR/Ji5dLWLVDOce0Z1P4OwqNmcA3lEnlY8V6LFem+ksKkaWlxDKmCks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717017704; c=relaxed/simple;
	bh=gZIbqElXbfJoBpohO3oo2x4JxPeULVyaHlE2qTAlEHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QKvS4nwaTXELj20Cz9LCrDsdWewRcECM6o4rfxBjWkt1354fgQWuJnf+JI48i1f4SHI51NHmumqrELpdxoDc6B/iwaJ/ItsYp8pntovFk/jWVFkhR1KObD0VG9+n0VQbgVnjjkY8lh40AixPkdeapQ+akr6mqacYUlsWATHSFAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=jG9OM9BQ; arc=none smtp.client-ip=146.20.161.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1717016617;
	bh=gZIbqElXbfJoBpohO3oo2x4JxPeULVyaHlE2qTAlEHM=;
	h=From:To:Subject:Date:From;
	b=jG9OM9BQz73vH128qGBihxB8cpYXEvybIcNjn21kyjCvuGwRjCqLJuAE+CKOIvBhm
	 B35g8ZeaTEJWyHwB3Pnzd3OjvmbMCEu1HA7ZtAiG7B6F/MF3kqhVfWNvMOES4fvx8i
	 RyGpawWfim8rPCCGbjpSZOw8UfEzLuvHLGA9xbkA=
X-Auth-ID: lars@oddbit.com
Received: by smtp23.relay.iad3b.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 84CABA0102;
	Wed, 29 May 2024 17:03:37 -0400 (EDT)
From: lars@oddbit.com
To: netdev@vger.kernel.org,
	linux-hams@vger.kernel.org
Cc: Lars Kellogg-Stedman <lars@oddbit.com>,
	Duoming Zhou <duoming@zju.edu.cn>,
	Dan Cross <crossd@gmail.com>,
	Chris Maness <christopher.maness@gmail.com>
Subject: [PATCH v5] ax25: Fix refcount imbalance on inbound connections
Date: Wed, 29 May 2024 17:02:43 -0400
Message-ID: <20240529210242.3346844-2-lars@oddbit.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 26658878-d9cb-4c61-a403-7ac0033a3083-1-1

From: Lars Kellogg-Stedman <lars@oddbit.com>

When releasing a socket in ax25_release(), we call netdev_put() to
decrease the refcount on the associated ax.25 device. However, the
execution path for accepting an incoming connection never calls
netdev_hold(). This imbalance leads to refcount errors, and ultimately
to kernel crashes.

A typical call trace for the above situation will start with one of the
following errors:

    refcount_t: decrement hit 0; leaking memory.
    refcount_t: underflow; use-after-free.

And will then have a trace like:

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
and ax25_dev_hold() for new connections in ax25_accept(). This makes the
logic leading to ax25_accept() match the logic for ax25_bind(): in both
cases we increment the refcount, which is ultimately decremented in
ax25_release().

Fixes: 9fd75b66b8f6 ("ax25: Fix refcount leaks caused by ax25_cb_del()")
Signed-off-by: Lars Kellogg-Stedman <lars@oddbit.com>
Tested-by: Duoming Zhou <duoming@zju.edu.cn>
Tested-by: Dan Cross <crossd@gmail.com>
Tested-by: Chris Maness <christopher.maness@gmail.com>
---
 net/ax25/af_ax25.c | 6 ++++++
 1 file changed, 6 insertions(+)

v3:
- Address naveenm's comments regarding the ordering of variable declarations
  (https://lore.kernel.org/netdev/SJ2PR18MB5635B7ADC7339BEDB79B183DA2EA2@SJ2PR18MB5635.namprd18.prod.outlook.com/)

v4:
- Respond to kuba's comments regarding the Fixes: tag
  (https://lore.kernel.org/netdev/20240522100701.4d9edf99@kernel.org/)

v5:
- Respond to pabeni's comments regarding the Fixes: tag and running
  checkpatch.pl
  (https://lore.kernel.org/netdev/8e9a1c59f78a7774268bb6defed46df6f3771cbc.camel@redhat.com/)
- Respond to dan.carpenter's request about rewording the commit message
  (https://lore.kernel.org/netdev/962afcda-8f67-400f-b3eb-951bf2e46fb7@moroto.mountain/)
- Accept duoming's suggestion for the Fixes: tag
  (https://lore.kernel.org/netdev/3cf699c4.20d18.18fc4df304a.Coremail.duoming@zju.edu.cn/)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 8077cf2ee44..d6f9fae06a9 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1378,8 +1378,10 @@ static int ax25_accept(struct socket *sock, struct socket *newsock,
 {
 	struct sk_buff *skb;
 	struct sock *newsk;
+	ax25_dev *ax25_dev;
 	DEFINE_WAIT(wait);
 	struct sock *sk;
+	ax25_cb *ax25;
 	int err = 0;
 
 	if (sock->state != SS_UNCONNECTED)
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


