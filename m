Return-Path: <linux-hams+bounces-276-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 393E88C9EF3
	for <lists+linux-hams@lfdr.de>; Mon, 20 May 2024 16:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B0451C21358
	for <lists+linux-hams@lfdr.de>; Mon, 20 May 2024 14:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1FF136675;
	Mon, 20 May 2024 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="Y8WBV1H1"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp84.iad3b.emailsrvr.com (smtp84.iad3b.emailsrvr.com [146.20.161.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E72136986
	for <linux-hams@vger.kernel.org>; Mon, 20 May 2024 14:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716216156; cv=none; b=D1w8JvOzqjOPGl9ZcUoGYfcf36L4N/EY+PMCVyilqRa/R00325G059kxZcHqufhzUqkvpXELPvdG7lotMR6Arnn7WnhWoDSIfRnALXo2/dBpVySe9F8nWpZ4KTg/5WRP2roCCqimVPgrprZDG7gWWjDjLDbSgG2C24mwjGP8hvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716216156; c=relaxed/simple;
	bh=aO095P075vm3m7tOXMSrKIgFC9Qxfp5wqp9Bqq50xQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBY3cjPwZoS7Zs2L+gTxCVCgYAEwNdPlpR7y6CTqD9EiVVDpq3dmr0GeqW3o3+gmkLH/MYjSYA5FqPHgQr49zi+y6giANXfaerSx2M1Db8CB37HDHT/HGSP6syrexCGgCAr9vKB7TLUUa23zmjZCJsEuQyIKC6Dz6v1O+gTW7nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=Y8WBV1H1; arc=none smtp.client-ip=146.20.161.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1716216148;
	bh=aO095P075vm3m7tOXMSrKIgFC9Qxfp5wqp9Bqq50xQc=;
	h=Date:From:To:Subject:From;
	b=Y8WBV1H1TAG9qKbjwZ0l3qBIENlfD+2bxZlVUnP4eeleg+GXUru1twpwbGe5SO6ES
	 Dtp0v34ZSCtzMLkZQ5fY0zIz5M9ICMd2nQTs4NPwLgX2YAI5U5zF771b7wQKtCJhPQ
	 7Rvfw74ukI4s64So/ZSKOX9QRK/1wtoltILOV/lw=
X-Auth-ID: lars@oddbit.com
Received: by smtp3.relay.iad3b.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 40B5C40118;
	Mon, 20 May 2024 10:42:28 -0400 (EDT)
Date: Mon, 20 May 2024 10:42:27 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Chris Maness <christopher.maness@gmail.com>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, 
	dan.carpenter@linaro.org
Subject: Re: Kernel 6.9.1 AX.25 Crash
Message-ID: <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn>
 <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
X-Classification-ID: e7489826-6226-4360-81cf-1e0abcdd2388-1-1

On Sun, May 19, 2024 at 07:52:41PM GMT, Chris Maness wrote:
> Since you guys have been working on this, I have started playing around
> with slackware-current to check on your progress.  I setup LinFBB with one
> pseudo tty  port generated with ax25ipd.  It does release the socket after
> connection, and worked for a couple of hours.  However, it crashed hard
> with no terminal dump when I was forwarding some bulls over AX.25 over UDP
> to the ax25ipd.  This does involve the AX.25 stack as FBB needs an ax0 port.

Chris,

At the moment, the Linux ax.25 stack is unusable for handling incoming
connections (outbound connections seem to be stable).

I posted a patch to this list at the end of April that has completely
resolved the ax.25 crashing problems for me. I'm running it on x86_64
systems with kernel 6.9.0, and on Raspberry Pi systems running 6.6.30.

Dan was unhappy with the patch, and Duoming has been silent on this
topic, so I'm not sure how to proceed. I am confident that there is a
"more correct" solution to this problem, but I am also confident that
this patch corrects a real issue; without a more experienced developer
either suggesting changes to this patch or submitting their own I don't
know if this will move forward. Duoming indicated some interest  in
the issue on 5/15 [1], but I haven't heard anything since then.

I've included the current version of the patch in this email. If you
have the chance to try it out, I'm curious to know whether or not it
solves your problems.

Cheers,

-- Lars

[1] https://marc.info/?l=linux-kernel&m=171576662414653&w=2

>8------------------------------------------------------8<

When closing a socket in ax25_release(), we call netdev_put() to decrease
the refcount on the ax.25 device. However, the execution path for accepting
an incoming connection never calls ax25_hold(). This imbalance leads to
refcount errors, and ultimately to kernel crashes.

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

    unregister_netdevice: waiting for ax1 to become free. Usage count = 0

The attached patch corrects these issues by ensuring that we call
netdev_hold() and ax25_dev_hold() in ax25_accept().

Fixes: 7d8a3a477b
Signed-off-by: Lars Kellogg-Stedman <lars@oddbit.com>
---
 net/ax25/af_ax25.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 9169efb2f43..5aa6e5c3495 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1381,6 +1381,8 @@ static int ax25_accept(struct socket *sock, struct socket *newsock, int flags,
 	DEFINE_WAIT(wait);
 	struct sock *sk;
 	int err = 0;
+	ax25_cb *ax25;
+	ax25_dev *ax25_dev;
 
 	if (sock->state != SS_UNCONNECTED)
 		return -EINVAL;
@@ -1434,6 +1436,10 @@ static int ax25_accept(struct socket *sock, struct socket *newsock, int flags,
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

