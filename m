Return-Path: <linux-hams+bounces-635-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 281D9B58469
	for <lists+linux-hams@lfdr.de>; Mon, 15 Sep 2025 20:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2AF948832A
	for <lists+linux-hams@lfdr.de>; Mon, 15 Sep 2025 18:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8FA2882BD;
	Mon, 15 Sep 2025 18:19:31 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C691277CB6
	for <linux-hams@vger.kernel.org>; Mon, 15 Sep 2025 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757960371; cv=none; b=ZD6kM1t6a8IL0eKBwHghglLdEhY/+d3mWzC2fKbT4F/OYZTzeZO9t6MXJwCs3Hp0B0a1JX8O9LAgTcKOnvtoai2AfZ8snO1XWbEGebQ/3ZGknLfGUkwBFWBEcxkRC7X1NksGQ05Eep2HXolCGQY1URL6yrjWtzAfRufeh7SBN9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757960371; c=relaxed/simple;
	bh=anZGBq8D/N625QcT0dGgWE2VEqPOgOvij8IgvBl0D/Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SvSnzG21Mxp8ugXoBWSmiK2swmU9WRsz9Smj1tqTO/jI2dBUgiNfxUDqBsR4TpImF9ChvDwYp064754wmZqW5EbpBpP+RNxheHzeYBTMK5J1fRvqnjVbPuLAXfqJmn+Jys1p89+ByASwzMFVsqv4Vv7tDoMNv7t6njJs22k1Efk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-401eba8efecso56354005ab.1
        for <linux-hams@vger.kernel.org>; Mon, 15 Sep 2025 11:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757960368; x=1758565168;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSL+W7rDicp3aXpJlSDXtxEXjcRp5Jhu9gK1+NJpfRU=;
        b=pAoMaeid2jIR8P4bTRREpkZE66cmXrgCpbZgVxbsgdrzxI+uH+94wsZsyJJCYhZAXl
         12NbwvhcMY+CFcUffpgPc4Cpx4AB4IhLJFm/dkwtYpXMfaXl8s7yd2ghjQzPy0Dh/ImI
         IbB8tLPzlziSCD8esyCzZga5uGhDJ6WlDapjPkdf5HP4pa+IXmSuBMiZQo3gksjTarYv
         C/GIHnV/4ekaAZURWVaNdOrnTIzRibmNgk7MLLxGkJAxub0aqV3lICjLfvxFluaqU46e
         uqTrGe3XUpdFHBt9yF9obwqbgm3Tq2x2hq5Au32HmO5aRgkP3PPFXXB2k+sM07Wll5Mc
         eDAw==
X-Forwarded-Encrypted: i=1; AJvYcCVsJeC6kE1dBI0r5BdYjgVp8WvjE9+/OjfgG9YrmtVgXyTO6rBVgjrM+8FM9W3d33C00S4wETkjMm+/@vger.kernel.org
X-Gm-Message-State: AOJu0YzTsI4E6NelyPy559oOwXlHtdcan/6/O0+Enc4KxBdms9lwpKqf
	HIGvI9X5kQl6IrJ8Oisj0CFdT5Fdcsjie9GWinRnVAVa4BNwTMq/7cbB+L94z+fte9oxRKRJVWa
	ANSvymWBODf3vdyAAjomGcTGHMekIn8Y473ZKR9kis2D/QjOKkT68nIwqeZk=
X-Google-Smtp-Source: AGHT+IF+fMW8U2ctkj6TgkXEDhFaVDPRjle2ylsyIdXVQD1AARQ5HuLnFcSoyAHgOjY9kik9Bxtcmi0pYV6aK2Rb729H14mCYFpe
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cd89:0:b0:424:86d:7bb9 with SMTP id
 e9e14a558f8ab-424086d7e93mr29656485ab.0.1757960368625; Mon, 15 Sep 2025
 11:19:28 -0700 (PDT)
Date: Mon, 15 Sep 2025 11:19:28 -0700
In-Reply-To: <000000000000e8231f0601095c8e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68c858b0.050a0220.3c6139.0d1c.GAE@google.com>
Subject: Re: [syzbot] [hams?] possible deadlock in serial8250_handle_irq
From: syzbot <syzbot+5fd749c74105b0e1b302@syzkaller.appspotmail.com>
To: ajk@comnets.uni-bremen.de, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, linux-hams@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, paulus@samba.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    590b221ed425 Add linux-next specific files for 20250912
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17af5762580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9134e501f17b95a4
dashboard link: https://syzkaller.appspot.com/bug?extid=5fd749c74105b0e1b302
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e41762580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10a88e42580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/872439e79d04/disk-590b221e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/09ebcfd707c1/vmlinux-590b221e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e3417bc549df/bzImage-590b221e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5fd749c74105b0e1b302@syzkaller.appspotmail.com

=====================================================
WARNING: HARDIRQ-safe -> HARDIRQ-unsafe lock order detected
syzkaller #0 Not tainted
-----------------------------------------------------
kworker/u8:1/13 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
ffffffff8f1127b8 (disc_data_lock){.?.+}-{3:3}, at: sp_get drivers/net/hamradio/6pack.c:370 [inline]
ffffffff8f1127b8 (disc_data_lock){.?.+}-{3:3}, at: sixpack_write_wakeup+0x30/0x480 drivers/net/hamradio/6pack.c:391

and this task is already holding:
ffffffff9a263db8 (&port_lock_key){-.-.}-{3:3}, at: uart_port_lock_irqsave include/linux/serial_core.h:717 [inline]
ffffffff9a263db8 (&port_lock_key){-.-.}-{3:3}, at: uart_port_ref_lock+0xc4/0x3b0 drivers/tty/serial/serial_core.c:83
which would create a new lock dependency:
 (&port_lock_key){-.-.}-{3:3} -> (disc_data_lock){.?.+}-{3:3}

but this new dependency connects a HARDIRQ-irq-safe lock:
 (&port_lock_key){-.-.}-{3:3}

... which became HARDIRQ-irq-safe at:
  lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
  _raw_spin_lock_irqsave+0xa7/0xf0 kernel/locking/spinlock.c:162
  uart_port_lock_irqsave include/linux/serial_core.h:717 [inline]
  serial8250_handle_irq+0x6b/0xbb0 drivers/tty/serial/8250/8250_port.c:1798
  serial8250_default_handle_irq+0xbf/0x200 drivers/tty/serial/8250/8250_port.c:1846
  serial8250_interrupt+0x8d/0x180 drivers/tty/serial/8250/8250_core.c:82
  __handle_irq_event_percpu+0x295/0xab0 kernel/irq/handle.c:203
  handle_irq_event_percpu kernel/irq/handle.c:240 [inline]
  handle_irq_event+0x8b/0x1e0 kernel/irq/handle.c:257
  handle_edge_irq+0x23b/0xa10 kernel/irq/chip.c:855
  generic_handle_irq_desc include/linux/irqdesc.h:173 [inline]
  handle_irq arch/x86/kernel/irq.c:254 [inline]
  call_irq_handler arch/x86/kernel/irq.c:-1 [inline]
  __common_interrupt+0x141/0x1f0 arch/x86/kernel/irq.c:325
  common_interrupt+0xb6/0xe0 arch/x86/kernel/irq.c:318
  asm_common_interrupt+0x26/0x40 arch/x86/include/asm/idtentry.h:688
  native_safe_halt arch/x86/include/asm/irqflags.h:48 [inline]
  pv_native_safe_halt+0x13/0x20 arch/x86/kernel/paravirt.c:81
  arch_safe_halt arch/x86/include/asm/paravirt.h:107 [inline]
  default_idle+0x13/0x20 arch/x86/kernel/process.c:767
  default_idle_call+0x74/0xb0 kernel/sched/idle.c:122
  cpuidle_idle_call kernel/sched/idle.c:190 [inline]
  do_idle+0x1e8/0x510 kernel/sched/idle.c:330
  cpu_startup_entry+0x44/0x60 kernel/sched/idle.c:428
  rest_init+0x2de/0x300 init/main.c:756
  start_kernel+0x3a9/0x410 init/main.c:1109
  x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
  x86_64_start_kernel+0x143/0x1c0 arch/x86/kernel/head64.c:291
  common_startup_64+0x13e/0x147

to a HARDIRQ-irq-unsafe lock:
 (disc_data_lock){.?.+}-{3:3}

... which became HARDIRQ-irq-unsafe at:
...
  lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
  __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
  _raw_read_lock+0x36/0x50 kernel/locking/spinlock.c:228
  sp_get drivers/net/hamradio/6pack.c:370 [inline]
  sixpack_receive_buf+0x5c/0x1450 drivers/net/hamradio/6pack.c:433
  tty_ldisc_receive_buf+0x119/0x160 drivers/tty/tty_buffer.c:391
  tty_port_default_receive_buf+0x6e/0xa0 drivers/tty/tty_port.c:37
  receive_buf drivers/tty/tty_buffer.c:445 [inline]
  flush_to_ldisc+0x24a/0x6e0 drivers/tty/tty_buffer.c:495
  process_one_work kernel/workqueue.c:3263 [inline]
  process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
  worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
  kthread+0x711/0x8a0 kernel/kthread.c:463
  ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

other info that might help us debug this:

 Possible interrupt unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(disc_data_lock);
                               local_irq_disable();
                               lock(&port_lock_key);
                               lock(disc_data_lock);
  <Interrupt>
    lock(&port_lock_key);

 *** DEADLOCK ***

6 locks held by kworker/u8:1/13:
 #0: ffff88801a889148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3238 [inline]
 #0: ffff88801a889148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3346
 #1: ffffc90000127ba0 ((work_completion)(&buf->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3239 [inline]
 #1: ffffc90000127ba0 ((work_completion)(&buf->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3346
 #2: ffff888141b28ca0 (&buf->lock){+.+.}-{4:4}, at: flush_to_ldisc+0x38/0x6e0 drivers/tty/tty_buffer.c:467
 #3: ffff88807808d0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref+0x1c/0x90 drivers/tty/tty_ldisc.c:263
 #4: ffffffff9a263db8 (&port_lock_key){-.-.}-{3:3}, at: uart_port_lock_irqsave include/linux/serial_core.h:717 [inline]
 #4: ffffffff9a263db8 (&port_lock_key){-.-.}-{3:3}, at: uart_port_ref_lock+0xc4/0x3b0 drivers/tty/serial/serial_core.c:83
 #5: ffff88807808d0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref+0x1c/0x90 drivers/tty/tty_ldisc.c:263

the dependencies between HARDIRQ-irq-safe lock and the holding lock:
-> (&port_lock_key){-.-.}-{3:3} {
   IN-HARDIRQ-W at:
                    lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
                    __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
                    _raw_spin_lock_irqsave+0xa7/0xf0 kernel/locking/spinlock.c:162
                    uart_port_lock_irqsave include/linux/serial_core.h:717 [inline]
                    serial8250_handle_irq+0x6b/0xbb0 drivers/tty/serial/8250/8250_port.c:1798
                    serial8250_default_handle_irq+0xbf/0x200 drivers/tty/serial/8250/8250_port.c:1846
                    serial8250_interrupt+0x8d/0x180 drivers/tty/serial/8250/8250_core.c:82
                    __handle_irq_event_percpu+0x295/0xab0 kernel/irq/handle.c:203
                    handle_irq_event_percpu kernel/irq/handle.c:240 [inline]
                    handle_irq_event+0x8b/0x1e0 kernel/irq/handle.c:257
                    handle_edge_irq+0x23b/0xa10 kernel/irq/chip.c:855
                    generic_handle_irq_desc include/linux/irqdesc.h:173 [inline]
                    handle_irq arch/x86/kernel/irq.c:254 [inline]
                    call_irq_handler arch/x86/kernel/irq.c:-1 [inline]
                    __common_interrupt+0x141/0x1f0 arch/x86/kernel/irq.c:325
                    common_interrupt+0xb6/0xe0 arch/x86/kernel/irq.c:318
                    asm_common_interrupt+0x26/0x40 arch/x86/include/asm/idtentry.h:688
                    native_safe_halt arch/x86/include/asm/irqflags.h:48 [inline]
                    pv_native_safe_halt+0x13/0x20 arch/x86/kernel/paravirt.c:81
                    arch_safe_halt arch/x86/include/asm/paravirt.h:107 [inline]
                    default_idle+0x13/0x20 arch/x86/kernel/process.c:767
                    default_idle_call+0x74/0xb0 kernel/sched/idle.c:122
                    cpuidle_idle_call kernel/sched/idle.c:190 [inline]
                    do_idle+0x1e8/0x510 kernel/sched/idle.c:330
                    cpu_startup_entry+0x44/0x60 kernel/sched/idle.c:428
                    rest_init+0x2de/0x300 init/main.c:756
                    start_kernel+0x3a9/0x410 init/main.c:1109
                    x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
                    x86_64_start_kernel+0x143/0x1c0 arch/x86/kernel/head64.c:291
                    common_startup_64+0x13e/0x147
   IN-SOFTIRQ-W at:
                    lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
                    __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
                    _raw_spin_lock_irqsave+0xa7/0xf0 kernel/locking/spinlock.c:162
                    uart_port_lock_irqsave include/linux/serial_core.h:717 [inline]
                    serial8250_handle_irq+0x6b/0xbb0 drivers/tty/serial/8250/8250_port.c:1798
                    serial8250_default_handle_irq+0xbf/0x200 drivers/tty/serial/8250/8250_port.c:1846
                    serial8250_interrupt+0x8d/0x180 drivers/tty/serial/8250/8250_core.c:82
                    __handle_irq_event_percpu+0x295/0xab0 kernel/irq/handle.c:203
                    handle_irq_event_percpu kernel/irq/handle.c:240 [inline]
                    handle_irq_event+0x8b/0x1e0 kernel/irq/handle.c:257
                    handle_edge_irq+0x23b/0xa10 kernel/irq/chip.c:855
                    generic_handle_irq_desc include/linux/irqdesc.h:173 [inline]
                    handle_irq arch/x86/kernel/irq.c:254 [inline]
                    call_irq_handler arch/x86/kernel/irq.c:-1 [inline]
                    __common_interrupt+0x141/0x1f0 arch/x86/kernel/irq.c:325
                    common_interrupt+0x5e/0xe0 arch/x86/kernel/irq.c:318
                    asm_common_interrupt+0x26/0x40 arch/x86/include/asm/idtentry.h:688
                    __sanitizer_cov_trace_pc+0x0/0x70
                    deliver_ptype_list_skb net/core/dev.c:2483 [inline]
                    __netif_receive_skb_core+0x393a/0x4020 net/core/dev.c:5997
                    __netif_receive_skb_one_core net/core/dev.c:6038 [inline]
                    __netif_receive_skb+0x72/0x380 net/core/dev.c:6153
                    process_backlog+0x60e/0x14f0 net/core/dev.c:6505
                    __napi_poll+0xc7/0x360 net/core/dev.c:7555
                    napi_poll net/core/dev.c:7618 [inline]
                    net_rx_action+0x707/0xe30 net/core/dev.c:7745
                    handle_softirqs+0x286/0x870 kernel/softirq.c:579
                    do_softirq+0xec/0x180 kernel/softirq.c:480
                    __local_bh_enable_ip+0x17d/0x1c0 kernel/softirq.c:407
                    local_bh_enable include/linux/bottom_half.h:33 [inline]
                    rcu_read_unlock_bh include/linux/rcupdate.h:910 [inline]
                    __dev_queue_xmit+0x1d79/0x3b50 net/core/dev.c:4752
                    dev_queue_xmit include/linux/netdevice.h:3361 [inline]
                    neigh_hh_output include/net/neighbour.h:531 [inline]
                    neigh_output include/net/neighbour.h:545 [inline]
                    ip6_finish_output2+0xf70/0x1480 net/ipv6/ip6_output.c:136
                    NF_HOOK_COND include/linux/netfilter.h:307 [inline]
                    ip6_output+0x340/0x550 net/ipv6/ip6_output.c:247
                    NF_HOOK+0x9e/0x380 include/linux/netfilter.h:318
                    mld_sendpack+0x8d4/0xe60 net/ipv6/mcast.c:1855
                    mld_send_cr net/ipv6/mcast.c:2154 [inline]
                    mld_ifc_work+0x83e/0xd60 net/ipv6/mcast.c:2693
                    process_one_work kernel/workqueue.c:3263 [inline]
                    process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
                    worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
                    kthread+0x711/0x8a0 kernel/kthread.c:463
                    ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
                    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
   INITIAL USE at:
                   lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
                   __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
                   _raw_spin_lock_irqsave+0xa7/0xf0 kernel/locking/spinlock.c:162
                   uart_port_lock_irqsave include/linux/serial_core.h:717 [inline]
                   class_uart_port_lock_irqsave_constructor include/linux/serial_core.h:797 [inline]
                   serial8250_do_set_termios+0x4d1/0x1c30 drivers/tty/serial/8250/8250_port.c:2760
                   uart_set_options+0x3c2/0x5b0 drivers/tty/serial/serial_core.c:2262
                   serial8250_console_setup+0x2f4/0x3c0 drivers/tty/serial/8250/8250_port.c:3405
                   univ8250_console_setup+0x43a/0x540 drivers/tty/serial/8250/8250_core.c:426
                   console_call_setup kernel/printk/printk.c:3773 [inline]
                   try_enable_preferred_console+0x4e4/0x650 kernel/printk/printk.c:3817
                   register_console+0x551/0xf90 kernel/printk/printk.c:4011
                   univ8250_console_init+0x3a/0x70 drivers/tty/serial/8250/8250_core.c:511
                   console_init+0x10e/0x430 kernel/printk/printk.c:4298
                   start_kernel+0x254/0x410 init/main.c:1047
                   x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
                   x86_64_start_kernel+0x143/0x1c0 arch/x86/kernel/head64.c:291
                   common_startup_64+0x13e/0x147
 }
 ... key      at: [<ffffffff9a2631a0>] port_lock_key+0x0/0x20

the dependencies between the lock to be acquired
 and HARDIRQ-irq-unsafe lock:
-> (disc_data_lock){.?.+}-{3:3} {
   IN-HARDIRQ-R at:
                    lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
                    __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
                    _raw_read_lock+0x36/0x50 kernel/locking/spinlock.c:228
                    sp_get drivers/net/hamradio/6pack.c:370 [inline]
                    sixpack_write_wakeup+0x30/0x480 drivers/net/hamradio/6pack.c:391
                    tty_wakeup+0xbe/0x100 drivers/tty/tty_io.c:515
                    tty_port_default_wakeup+0xfb/0x170 drivers/tty/tty_port.c:67
                    serial8250_tx_chars+0x72e/0x970 drivers/tty/serial/8250/8250_port.c:1719
                    serial8250_handle_irq+0x633/0xbb0 drivers/tty/serial/8250/8250_port.c:1827
                    serial8250_default_handle_irq+0xbf/0x200 drivers/tty/serial/8250/8250_port.c:1846
                    serial8250_interrupt+0x8d/0x180 drivers/tty/serial/8250/8250_core.c:82
                    __handle_irq_event_percpu+0x295/0xab0 kernel/irq/handle.c:203
                    handle_irq_event_percpu kernel/irq/handle.c:240 [inline]
                    handle_irq_event+0x8b/0x1e0 kernel/irq/handle.c:257
                    handle_edge_irq+0x23b/0xa10 kernel/irq/chip.c:855
                    generic_handle_irq_desc include/linux/irqdesc.h:173 [inline]
                    handle_irq arch/x86/kernel/irq.c:254 [inline]
                    call_irq_handler arch/x86/kernel/irq.c:-1 [inline]
                    __common_interrupt+0x141/0x1f0 arch/x86/kernel/irq.c:325
                    common_interrupt+0xb6/0xe0 arch/x86/kernel/irq.c:318
                    asm_common_interrupt+0x26/0x40 arch/x86/include/asm/idtentry.h:688
                    __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:152 [inline]
                    _raw_spin_unlock_irqrestore+0xa8/0x110 kernel/locking/spinlock.c:194
                    spin_unlock_irqrestore include/linux/spinlock.h:406 [inline]
                    uart_port_unlock_irqrestore include/linux/serial_core.h:788 [inline]
                    uart_port_unlock_deref+0x111/0x2f0 drivers/tty/serial/serial_core.c:91
                    uart_write+0xe8/0x130 drivers/tty/serial/serial_core.c:634
                    decode_prio_command drivers/net/hamradio/6pack.c:868 [inline]
                    sixpack_decode drivers/net/hamradio/6pack.c:943 [inline]
                    sixpack_receive_buf+0x447/0x1450 drivers/net/hamradio/6pack.c:447
                    tty_ldisc_receive_buf+0x119/0x160 drivers/tty/tty_buffer.c:391
                    tty_port_default_receive_buf+0x6e/0xa0 drivers/tty/tty_port.c:37
                    receive_buf drivers/tty/tty_buffer.c:445 [inline]
                    flush_to_ldisc+0x24a/0x6e0 drivers/tty/tty_buffer.c:495
                    process_one_work kernel/workqueue.c:3263 [inline]
                    process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
                    worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
                    kthread+0x711/0x8a0 kernel/kthread.c:463
                    ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
                    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
   HARDIRQ-ON-R at:
                    lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
                    __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
                    _raw_read_lock+0x36/0x50 kernel/locking/spinlock.c:228
                    sp_get drivers/net/hamradio/6pack.c:370 [inline]
                    sixpack_receive_buf+0x5c/0x1450 drivers/net/hamradio/6pack.c:433
                    tty_ldisc_receive_buf+0x119/0x160 drivers/tty/tty_buffer.c:391
                    tty_port_default_receive_buf+0x6e/0xa0 drivers/tty/tty_port.c:37
                    receive_buf drivers/tty/tty_buffer.c:445 [inline]
                    flush_to_ldisc+0x24a/0x6e0 drivers/tty/tty_buffer.c:495
                    process_one_work kernel/workqueue.c:3263 [inline]
                    process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
                    worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
                    kthread+0x711/0x8a0 kernel/kthread.c:463
                    ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
                    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
   SOFTIRQ-ON-R at:
                    lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
                    __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
                    _raw_read_lock+0x36/0x50 kernel/locking/spinlock.c:228
                    sp_get drivers/net/hamradio/6pack.c:370 [inline]
                    sixpack_receive_buf+0x5c/0x1450 drivers/net/hamradio/6pack.c:433
                    tty_ldisc_receive_buf+0x119/0x160 drivers/tty/tty_buffer.c:391
                    tty_port_default_receive_buf+0x6e/0xa0 drivers/tty/tty_port.c:37
                    receive_buf drivers/tty/tty_buffer.c:445 [inline]
                    flush_to_ldisc+0x24a/0x6e0 drivers/tty/tty_buffer.c:495
                    process_one_work kernel/workqueue.c:3263 [inline]
                    process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
                    worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
                    kthread+0x711/0x8a0 kernel/kthread.c:463
                    ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
                    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
   INITIAL USE at:
                   lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
                   __raw_write_lock_irq include/linux/rwlock_api_smp.h:195 [inline]
                   _raw_write_lock_irq+0xa2/0xf0 kernel/locking/spinlock.c:326
                   sixpack_close+0x2c/0x280 drivers/net/hamradio/6pack.c:641
                   tty_ldisc_kill+0xa3/0x1a0 drivers/tty/tty_ldisc.c:613
                   tty_ldisc_release+0x174/0x200 drivers/tty/tty_ldisc.c:781
                   tty_release_struct+0x2a/0xd0 drivers/tty/tty_io.c:1681
                   tty_release+0xcb0/0x1640 drivers/tty/tty_io.c:1852
                   __fput+0x44c/0xa70 fs/file_table.c:468
                   task_work_run+0x1d4/0x260 kernel/task_work.c:227
                   resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
                   exit_to_user_mode_loop+0xec/0x130 kernel/entry/common.c:43
                   exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
                   syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
                   syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
                   do_syscall_64+0x2bd/0xfa0 arch/x86/entry/syscall_64.c:100
                   entry_SYSCALL_64_after_hwframe+0x77/0x7f
   INITIAL READ USE at:
                        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
                        __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
                        _raw_read_lock+0x36/0x50 kernel/locking/spinlock.c:228
                        sp_get drivers/net/hamradio/6pack.c:370 [inline]
                        sixpack_receive_buf+0x5c/0x1450 drivers/net/hamradio/6pack.c:433
                        tty_ldisc_receive_buf+0x119/0x160 drivers/tty/tty_buffer.c:391
                        tty_port_default_receive_buf+0x6e/0xa0 drivers/tty/tty_port.c:37
                        receive_buf drivers/tty/tty_buffer.c:445 [inline]
                        flush_to_ldisc+0x24a/0x6e0 drivers/tty/tty_buffer.c:495
                        process_one_work kernel/workqueue.c:3263 [inline]
                        process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
                        worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
                        kthread+0x711/0x8a0 kernel/kthread.c:463
                        ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
                        ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 }
 ... key      at: [<ffffffff8f1127b8>] disc_data_lock+0x18/0x100 6pack.c:-1
 ... acquired at:
   lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
   __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
   _raw_read_lock+0x36/0x50 kernel/locking/spinlock.c:228
   sp_get drivers/net/hamradio/6pack.c:370 [inline]
   sixpack_write_wakeup+0x30/0x480 drivers/net/hamradio/6pack.c:391
   tty_wakeup+0xbe/0x100 drivers/tty/tty_io.c:515
   tty_port_default_wakeup+0xfb/0x170 drivers/tty/tty_port.c:67
   serial8250_tx_chars+0x72e/0x970 drivers/tty/serial/8250/8250_port.c:1719
   __start_tx+0x33b/0x480 drivers/tty/serial/8250/8250_port.c:1426
   __uart_start+0x23f/0x460 drivers/tty/serial/serial_core.c:161
   uart_write+0xdc/0x130 drivers/tty/serial/serial_core.c:633
   decode_prio_command drivers/net/hamradio/6pack.c:868 [inline]
   sixpack_decode drivers/net/hamradio/6pack.c:943 [inline]
   sixpack_receive_buf+0x447/0x1450 drivers/net/hamradio/6pack.c:447
   tty_ldisc_receive_buf+0x119/0x160 drivers/tty/tty_buffer.c:391
   tty_port_default_receive_buf+0x6e/0xa0 drivers/tty/tty_port.c:37
   receive_buf drivers/tty/tty_buffer.c:445 [inline]
   flush_to_ldisc+0x24a/0x6e0 drivers/tty/tty_buffer.c:495
   process_one_work kernel/workqueue.c:3263 [inline]
   process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
   worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
   kthread+0x711/0x8a0 kernel/kthread.c:463
   ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245


stack backtrace:
CPU: 0 UID: 0 PID: 13 Comm: kworker/u8:1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/18/2025
Workqueue: events_unbound flush_to_ldisc
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_bad_irq_dependency kernel/locking/lockdep.c:2616 [inline]
 check_irq_usage kernel/locking/lockdep.c:2857 [inline]
 check_prev_add kernel/locking/lockdep.c:3169 [inline]
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain+0x1f05/0x2140 kernel/locking/lockdep.c:3908
 __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5237
 lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
 __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
 _raw_read_lock+0x36/0x50 kernel/locking/spinlock.c:228
 sp_get drivers/net/hamradio/6pack.c:370 [inline]
 sixpack_write_wakeup+0x30/0x480 drivers/net/hamradio/6pack.c:391
 tty_wakeup+0xbe/0x100 drivers/tty/tty_io.c:515
 tty_port_default_wakeup+0xfb/0x170 drivers/tty/tty_port.c:67
 serial8250_tx_chars+0x72e/0x970 drivers/tty/serial/8250/8250_port.c:1719
 __start_tx+0x33b/0x480 drivers/tty/serial/8250/8250_port.c:1426
 __uart_start+0x23f/0x460 drivers/tty/serial/serial_core.c:161
 uart_write+0xdc/0x130 drivers/tty/serial/serial_core.c:633
 decode_prio_command drivers/net/hamradio/6pack.c:868 [inline]
 sixpack_decode drivers/net/hamradio/6pack.c:943 [inline]
 sixpack_receive_buf+0x447/0x1450 drivers/net/hamradio/6pack.c:447
 tty_ldisc_receive_buf+0x119/0x160 drivers/tty/tty_buffer.c:391
 tty_port_default_receive_buf+0x6e/0xa0 drivers/tty/tty_port.c:37
 receive_buf drivers/tty/tty_buffer.c:445 [inline]
 flush_to_ldisc+0x24a/0x6e0 drivers/tty/tty_buffer.c:495
 process_one_work kernel/workqueue.c:3263 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

