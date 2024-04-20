Return-Path: <linux-hams+bounces-116-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 681358AB896
	for <lists+linux-hams@lfdr.de>; Sat, 20 Apr 2024 03:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40FC51C20AA3
	for <lists+linux-hams@lfdr.de>; Sat, 20 Apr 2024 01:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20E310F7;
	Sat, 20 Apr 2024 01:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="dw5a19Xr"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp68.iad3b.emailsrvr.com (smtp68.iad3b.emailsrvr.com [146.20.161.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42B18F6E
	for <linux-hams@vger.kernel.org>; Sat, 20 Apr 2024 01:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713578223; cv=none; b=hXbUVgSF4Ss+tUgHJ4+gOPU98gjgZeVkWkjEDmqWmyQtYbqjmLHrxOaVq0V0kEexuzhx3oEB473dQ60v+o3E2mtNYlnK1qjM9mlCQpXfTfnAkGAuwBIdoozAENnzRjM4gU7Lhq34Ttck+PR/YgcJBlJCqjXoVPDXHOAaibFVtkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713578223; c=relaxed/simple;
	bh=RLGhrBFyYBT7etQaeh1jAFcDRRfcnJlNegIkJ5yRD7U=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1n3Mhum+ICxwL5IVKMvR9qTjoxM0SMJvF5jv9UcptDMc/5s2eroPxPIsKuS6pmVMXDcGo3kd8PkZoAetURZ8HSMaR99zGWExwD/huqWsUEua/lWbuv6KBGX7GA124usSN40K17JVbtWNXex5cYzKZ/GGrqpCveMsC9V4JV68Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=dw5a19Xr; arc=none smtp.client-ip=146.20.161.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1713577234;
	bh=RLGhrBFyYBT7etQaeh1jAFcDRRfcnJlNegIkJ5yRD7U=;
	h=Date:From:To:Subject:From;
	b=dw5a19Xrw5kyT22VfT1r/oFnq0OWJSrTwsrSAhZg5ipOZbkivNWbyJIi0OyqBsZQ8
	 vSE/uA8zKkNrJ/uWctzCy/TM9/karFlcrCXWzcuniiL6Zf/37iygVDzweYV+tD/fUn
	 pzU3srTZDTrhEKLIVM+GAoNhin2cugxmZtrdFCN4=
X-Auth-ID: lars@oddbit.com
Received: by smtp17.relay.iad3b.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id BFAF0A0344
	for <linux-hams@vger.kernel.org>; Fri, 19 Apr 2024 21:40:34 -0400 (EDT)
Date: Fri, 19 Apr 2024 21:40:34 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: linux-hams@vger.kernel.org
Subject: Re: unregister_netdevice: waiting for ax0 to become free
Message-ID: <p6r6irutux5upw6fuauhczw6dedirm5tr26wnmyunlv44gzjtn@ev4nqkqdh2ip>
References: <CA+Q+rdzYUcfYF8CcX1WOWjVBYiZgidFAY1M0kR4J4KL73yN9yA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Q+rdzYUcfYF8CcX1WOWjVBYiZgidFAY1M0kR4J4KL73yN9yA@mail.gmail.com>
X-Classification-ID: 41f6aee3-87a5-4e07-aba3-67deaf93bc65-1-1

On Tue, Apr 09, 2024 at 05:05:40PM -0400, Lars Kellogg-Stedman wrote:
> If I make a single ax.25 connection to the host
> (to an ax25d hosted service), it will subsequently fail to reboot; the
> kernel gets stuck waiting for an ax.25 interface:
>
>      3   [  217.717327] unregister_netdevice: waiting for ax0 to
>          become free. Usage count = 0

I'm still trying to track down these issues. I've built a minimal kernel
for testing (from 2668e3ae2ef) with ax.25 support compiled in (that is,
no modules), and that seems to have changed the nature of the tracebacks
a bit.

If bring up a couple of axudp ports and a minimal ax25d configuration
and make a single connection and then attempt to reboot, I see:

    refcount_t: underflow; use-after-free.

The call trace looks like this:

    Call Trace:
    <TASK>
    ? show_regs+0x5f/0x70
    ? __warn+0x6c/0xd0
    ? refcount_warn_saturate+0xb2/0x100
    ? report_bug+0x166/0x1b0
    ? prb_read_valid+0x1b/0x20
    ? handle_bug+0x3e/0x70
    ? exc_invalid_op+0x1c/0x70
    ? asm_exc_invalid_op+0x1f/0x30
    ? refcount_warn_saturate+0xb2/0x100
    ? refcount_warn_saturate+0xb2/0x100
    ax25_dev_device_down+0x16e/0x190
    ax25_device_event+0x1a6/0x240
    raw_notifier_call_chain+0x45/0x60
    call_netdevice_notifiers_info+0x4f/0x90
    dev_close_many+0xe1/0x140
    unregister_netdevice_many_notify+0x139/0x7f0
    ? __call_rcu_common.constprop.0+0x8a/0x220
    unregister_netdevice_queue+0x8d/0xd0
    unregister_netdev+0x1b/0x30
    mkiss_close+0x74/0xb0
    tty_ldisc_close+0x26/0x30
    tty_ldisc_hangup+0xf5/0x210
    __tty_hangup.part.0+0x1b2/0x2f0
    tty_vhangup+0x14/0x20
    pty_close+0x122/0x160
    tty_release+0xe0/0x4d0
    __fput+0x8c/0x2a0
    ____fput+0xd/0x10
    task_work_run+0x59/0x80
    do_exit+0x2aa/0x8e0
    ? handle_mm_fault+0xb5/0x300
    do_group_exit+0x33/0x90
    __x64_sys_exit_group+0x17/0x20
    x64_sys_call+0x18c9/0x1aa0
    do_syscall_64+0x55/0x110
    entry_SYSCALL_64_after_hwframe+0x4b/0x53

Stepping through ax25_dev_device_down with gdb, I noticed that there are
two calls to ax25_dev_put (in net/ax25/ax25_dev.c):

    unlock_put:
      spin_unlock_bh(&ax25_dev_lock);
      ax25_dev_put(ax25_dev);
      dev->ax25_ptr = NULL;
      netdev_put(dev, &ax25_dev->dev_tracker);
      ax25_dev_put(ax25_dev);

Is that valid? By the time the code reaches the second call to
ax25_dev_put, ax25_dev->refcount is already 0. If I remove the second
call to ax25_dev_put, that gets rid of the "refcount_t: underflow;
use-after-free." error, but doesn't prevent the kernel from getting
stuck at:

    unregister_netdevice: waiting for ax0 to become free. Usage count = 0

I've include the complete trace below:

------------[ cut here ]------------
refcount_t: underflow; use-after-free.
WARNING: CPU: 0 PID: 269 at lib/refcount.c:28 refcount_warn_saturate+0xb2/0x100
CPU: 0 PID: 269 Comm: ax25ipd Not tainted 6.9.0-rc4-ax25+ #36
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-1.fc39 04/01/2014
RIP: 0010:refcount_warn_saturate+0xb2/0x100
Code: d1 a5 9d 00 01 e8 5e 6b b4 ff 0f 0b 5d c3 80 3d be a5 9d 00 00 75 91 48 c7 c7 08 a1 dc 81 c6 05 ae a5 9d 00 01 e8 3e 6b b4 ff <0f> 0b 5d c3 80 3d 9f a5 9d 00 00 0f 85 6d ff ff ff 48 c7 c7 d8 a0
RSP: 0018:ffffc9000182fb48 EFLAGS: 00010286
RAX: 0000000000000026 RBX: ffff88810a1359c0 RCX: 0000000000000027
RDX: ffff88817bc1bf48 RSI: 0000000000000001 RDI: ffff88817bc1bf40
RBP: ffffc9000182fb48 R08: 00000000ffffefff R09: 00000000ffffefff
R10: 0000000000000001 R11: ffffffff81e3a5e0 R12: ffff888109b6a000
R13: ffff88810a135a50 R14: ffff88810372a400 R15: ffff88810372a460
FS:  0000000000000000(0000) GS:ffff88817bc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005580c08ca8a0 CR3: 00000001017a0006 CR4: 0000000000770eb0
PKRU: 55555554
Call Trace:
 <TASK>
 ? show_regs+0x5f/0x70
 ? __warn+0x6c/0xd0
 ? refcount_warn_saturate+0xb2/0x100
 ? report_bug+0x166/0x1b0
 ? prb_read_valid+0x1b/0x20
 ? handle_bug+0x3e/0x70
 ? exc_invalid_op+0x1c/0x70
 ? asm_exc_invalid_op+0x1f/0x30
 ? refcount_warn_saturate+0xb2/0x100
 ? refcount_warn_saturate+0xb2/0x100
 ax25_dev_device_down+0x16e/0x190
 ax25_device_event+0x1a6/0x240
 raw_notifier_call_chain+0x45/0x60
 call_netdevice_notifiers_info+0x4f/0x90
 dev_close_many+0xe1/0x140
 unregister_netdevice_many_notify+0x139/0x7f0
 ? __call_rcu_common.constprop.0+0x8a/0x220
 unregister_netdevice_queue+0x8d/0xd0
 unregister_netdev+0x1b/0x30
 mkiss_close+0x74/0xb0
 tty_ldisc_close+0x26/0x30
 tty_ldisc_hangup+0xf5/0x210
 __tty_hangup.part.0+0x1b2/0x2f0
 tty_vhangup+0x14/0x20
 pty_close+0x122/0x160
 tty_release+0xe0/0x4d0
 __fput+0x8c/0x2a0
 ____fput+0xd/0x10
 task_work_run+0x59/0x80
 do_exit+0x2aa/0x8e0
 do_group_exit+0x33/0x90
 __x64_sys_exit_group+0x17/0x20
 x64_sys_call+0x18c9/0x1aa0
 do_syscall_64+0x55/0x110
 entry_SYSCALL_64_after_hwframe+0x4b/0x53
RIP: 0033:0x7f140d27491d
Code: Unable to access opcode bytes at 0x7f140d2748f3.
RSP: 002b:00007ffc66356c28 EFLAGS: 00000202 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f140d370fa8 RCX: 00007f140d27491d
RDX: 00000000000000e7 RSI: ffffffffffffff88 RDI: 0000000000000002
RBP: 00007ffc66356c80 R08: 00007ffc66356bc8 R09: 00007ffc66356b4f
R10: 00007ffc66356ac0 R11: 0000000000000202 R12: 0000000000000001
R13: 0000000000000000 R14: 0000000000000002 R15: 00007f140d370fc0
 </TASK>
---[ end trace 0000000000000000 ]---

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

