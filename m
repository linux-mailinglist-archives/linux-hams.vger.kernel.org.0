Return-Path: <linux-hams+bounces-122-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6529A8AFE52
	for <lists+linux-hams@lfdr.de>; Wed, 24 Apr 2024 04:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 979E31C22119
	for <lists+linux-hams@lfdr.de>; Wed, 24 Apr 2024 02:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15C1125D5;
	Wed, 24 Apr 2024 02:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="LskPPg+d"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp93.iad3b.emailsrvr.com (smtp93.iad3b.emailsrvr.com [146.20.161.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B5910A1A
	for <linux-hams@vger.kernel.org>; Wed, 24 Apr 2024 02:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713925323; cv=none; b=sm2iczwJCVeHigBKVU0G8bhilkiKylPgQq3Oc3Ll3q6KWVfslHtX0VFuSVOmHczw8OptS433WpzJjOZ7DJYgDyhiQKZ4+G6C+g5FKh9sWzaQGz5PhNrliLXHQ3lZG4MTno5To6bQDzuzXR3MCkxKzN2UWaNfB+KtrjxQoyGsqQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713925323; c=relaxed/simple;
	bh=h18vntQOe84NHzUFr2dBg4jN+5aBeltgrHlchSJ/yMw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SP8zwVYoZ6MvxH4Ed1eplXURK+Ywv2TVCCVxTyZqFkEw/b5UbAMQ/yKmMBi7ijKe4Qtn8EOPWtWN0LM4N3MwqAvYJNdDMp2m2WAufzabrAz9FYfis5IeBdtdEY1U6NgTqQMV+1T8VbMvvu8/VufPxjzppsXWT8r8NJsQ6pYgmQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=LskPPg+d; arc=none smtp.client-ip=146.20.161.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1713924405;
	bh=h18vntQOe84NHzUFr2dBg4jN+5aBeltgrHlchSJ/yMw=;
	h=Date:From:To:Subject:From;
	b=LskPPg+d0ILTrd7rAOUN97PXfqFinreZgMOmM/gzjmXAXQJQ1Hpyc2339f8A0JiH0
	 g9ljXyVt/1lyx3PYkDGN+bA2+lXAKX73JwDOGYduEfCCbhNqEdmiXodNsH2KEsuFzS
	 7djablubdkqixWIjayN3I83ulTFkxIXVeFMFnF98=
X-Auth-ID: lars@oddbit.com
Received: by smtp4.relay.iad3b.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 30FDC202E7
	for <linux-hams@vger.kernel.org>; Tue, 23 Apr 2024 22:06:45 -0400 (EDT)
Date: Tue, 23 Apr 2024 22:06:44 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: linux-hams@vger.kernel.org
Subject: Re: unregister_netdevice: waiting for ax0 to become free
Message-ID: <hkgoneb732pm7cqc2wisrrducn3pdcxaauoeli6u7tgdigovax@oattb6ovobyq>
References: <CA+Q+rdzYUcfYF8CcX1WOWjVBYiZgidFAY1M0kR4J4KL73yN9yA@mail.gmail.com>
 <p6r6irutux5upw6fuauhczw6dedirm5tr26wnmyunlv44gzjtn@ev4nqkqdh2ip>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <p6r6irutux5upw6fuauhczw6dedirm5tr26wnmyunlv44gzjtn@ev4nqkqdh2ip>
X-Classification-ID: 53be3af9-38f8-4ef9-b202-77f6d0ffe002-1-1

To help figure out what's going on, I wrote an `ax-sockets` command [1]
for gdb that iterates over the `ax25_list` variable to show active
sockets. The output looks something like this:

    0xffff888109fe9800 LISTEN       ax1 src:TEST-1     dst:<none>     cb:02 dev:03
    0xffff888100860600 LISTEN       ax0 src:TEST-0     dst:<none>     cb:02 dev:03

The two fields at the end (labeled `cb:` and `dev:`) show the value of
the `refcount` attribute of the `ax25_cb` struct and the corresponding
`ax25_cb->ax25_dev` struct.

When the system first boots up and we create some listening sockets
with ax25d, each ax.25 interface has a refcount of 3 (that's what we see
in the above output). Every time we initiate a connection between the
sockets...

    axcall udp0 TEST-1

...the refcount on the listening device drops by one when the connection closes.
That is, after making one connection, we have:

    0xffff888109fe9800 LISTEN       ax1 src:TEST-1     dst:<none>     cb:02 dev:02
    0xffff888100860600 LISTEN       ax0 src:TEST-0     dst:<none>     cb:02 dev:03

And after another connection:

    0xffff888109fe9800 LISTEN       ax1 src:TEST-1     dst:<none>     cb:02 dev:01
    0xffff888100860600 LISTEN       ax0 src:TEST-0     dst:<none>     cb:02 dev:03

After a third connection:

    0xffff888109fe9800 LISTEN       ax1 src:TEST-1     dst:<none>     cb:02 dev:00
    0xffff888100860600 LISTEN       ax0 src:TEST-0     dst:<none>     cb:02 dev:03

And then after a fourth connection, we get a kernel traceback with
"refcount_t: underflow; use-after-free." and the following backtrace:

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
    ax25_dev_put+0x37/0x40
    ax25_release+0x377/0x3b0
    __sock_release+0x35/0xa0
    sock_close+0x19/0x20
    __fput+0x91/0x2a0
    ____fput+0x12/0x20
    task_work_run+0x5e/0x90
    do_exit+0x2f5/0xa00
    ? handle_mm_fault+0xba/0x300
    do_group_exit+0x38/0x90
    __x64_sys_exit_group+0x1c/0x20
    x64_sys_call+0x18ce/0x1aa0
    do_syscall_64+0x55/0x110
    entry_SYSCALL_64_after_hwframe+0x4b/0x53

If we look at things when a connection is established -- e.g., at the
top of ax25_accept -- we see that refcount for the *source* interface
(udp0/ax0 in this example) has incremented:

    0xffff888103eb3a00 ESTABLISHED  ax1 src:TEST-1     dst:TEST-0     cb:02 dev:03
    0xffff888103ea4400 SABM_SENT    ax0 src:TEST-0     dst:TEST-1     cb:02 dev:04
    0xffff888103eb3600 LISTEN       ax1 src:TEST-1     dst:<none>     cb:02 dev:03
    0xffff888103eb3400 LISTEN       ax0 src:TEST-0     dst:<none>     cb:02 dev:04

It looks like we may be failing to increment the refcount on the
*listening* socket when a connection is established...but we're
decrementing it when the connection is closed, leading to problems.

[1]: https://github.com/larsks/ax25-debugging

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

