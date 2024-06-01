Return-Path: <linux-hams+bounces-353-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C198D6D7C
	for <lists+linux-hams@lfdr.de>; Sat,  1 Jun 2024 04:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9635DB216B1
	for <lists+linux-hams@lfdr.de>; Sat,  1 Jun 2024 02:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D436E63D0;
	Sat,  1 Jun 2024 02:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="V8mRXoBW"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp97.iad3b.emailsrvr.com (smtp97.iad3b.emailsrvr.com [146.20.161.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F406046B8
	for <linux-hams@vger.kernel.org>; Sat,  1 Jun 2024 02:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717208825; cv=none; b=J1uaFl+gqiiaiNDbqOw00AUO4xxKVOYTF2jXJqlPUVvPpLPh7ysKTAOl44i8nkCTUWVpEG9iqZRLebLLBlbQpr+3y38DDocons7JrZkISJozdMgK3pw2QlWTdFt58laREquwEYUspFWcBaY73eNV8QkxoVvD8jx4IKi2jkNk0uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717208825; c=relaxed/simple;
	bh=0+tJ8gFJPMTsYyRwwZbrL2nOYRjUqvHwv5pWja/FYgs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tbu0e+e8wArAImtaO5SA56yD5j35X/Mv0FZvO/YNcQUNPx0Dz14n7h6G2Z3Tre78ImWXcAhvW0HTSZqbn5xIJw/jFeyBsc+XYQAH+fZNxczFXMJVAL98j587XQk2vuna8XPOVvyc+MYpegrrb7v58kbCPQqpygERygKP3XdEInM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=V8mRXoBW; arc=none smtp.client-ip=146.20.161.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1717208448;
	bh=0+tJ8gFJPMTsYyRwwZbrL2nOYRjUqvHwv5pWja/FYgs=;
	h=Date:From:To:Subject:From;
	b=V8mRXoBW/j9X5z2dVatFf28PPCUGqMr+uK5ESypRQJxR0wHTAlxejjrgaYDau0ZtT
	 +twUHZWZtBNiUxHlFgZxowbrqAlcD57JrT/fYsPi48F+366ovgHzqNXJhAc1KJgS0n
	 kO4Qmd7nnHA8UWb6rSt5DVHEghABzNdZ85gl9lD0=
X-Auth-ID: lars@oddbit.com
Received: by smtp13.relay.iad3b.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id AF5B56033C
	for <linux-hams@vger.kernel.org>; Fri, 31 May 2024 22:20:48 -0400 (EDT)
Date: Fri, 31 May 2024 22:20:48 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: linux-hams <linux-hams@vger.kernel.org>
Subject: What is the "heartbeat" timer for?
Message-ID: <5ev7x3gcf5sk53svnu7q2lfa2d3et4wy5luy43jz5wwaybmyzl@ztgjeqitelbv>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Classification-ID: 5c008967-f454-41c8-a390-4e7bb8c09e9b-1-1

After an ax25 connection closes, there is a period of approximately 5
seconds during which no new connection can be established to the same
listening callsign.

For example, if I have a listener and I make a connection to it
once/second, like this:

    t_start=$SECONDS

    for _ in {1..10}; do
            echo -n "$((SECONDS-t_start)): "
            timeout 1 call -SRr udp1 host0 && sleep 1
    done

We see output like this:

0: HELLO AX.25 CALLER
1: Terminated
2: Terminated
3: Terminated
4: Terminated
5: Terminated
6: HELLO AX.25 CALLER
7: Terminated
8: Terminated
9: Terminated

This happens because once closed, a socket hangs around until the
heartbeat timer expires, and then in ax25_std_heartbeat_expiry() we
finally call ax25_destroy_socket(), which permits new connections.

Is there a reason for this behavior? Since the remote has already sent a
DISC packet we don't expect any additional packets on this connection.
I'm not clear on what this timer is for or why we don't simply destroy
the socket immediately upon receiving a DISC packet.

Cheers,

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

