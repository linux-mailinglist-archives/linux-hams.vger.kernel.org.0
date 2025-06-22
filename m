Return-Path: <linux-hams+bounces-527-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 309EBAE2F7C
	for <lists+linux-hams@lfdr.de>; Sun, 22 Jun 2025 13:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3E67172185
	for <lists+linux-hams@lfdr.de>; Sun, 22 Jun 2025 11:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317B01DACB1;
	Sun, 22 Jun 2025 11:13:22 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91A11A0BF3
	for <linux-hams@vger.kernel.org>; Sun, 22 Jun 2025 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750590802; cv=none; b=rs/4xepvolyp6SafXLFuFhZ824R4Hf/GSsEnb+koOWaDA//BDgIZdiGfEvwICU2utURXt1xPUQhkldZ6RMU2544Rktbek2WtDeNTnmBoHxYb9PiMpvEKI5g33tP1yoSmcArnlopbbM5+qUbkpILS88D3rWf+t8HWGKNxKZBC93w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750590802; c=relaxed/simple;
	bh=pm3A01ewk32EiC/F0Pad9br1lPBmIU3MENY3LDPUTCQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MCTE4ileSJPPNcdCnu7/FFy6QFaRfEgTefVYzkga+jKxz9vIAgZbbRd1HBrgTrylcAnd9TOiDwqb81njkH2HzpHhBY/K/slg7GlEObkRgQRBkmeT0snD3k0s8BPic0XnUZUoQVhuS4hRerqT28XsQkXSAwyMY/eefcf6Zq+HHGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3ddd5cd020dso74529395ab.0
        for <linux-hams@vger.kernel.org>; Sun, 22 Jun 2025 04:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750590799; x=1751195599;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=soD6h5Yg5UXvYj3hUJ+UCIQjJVcZzTThZZ4L/y9UZiw=;
        b=YZIZg1EWPa9m+6TKcgV5tM70PERzUXwhUvaBovfWlIrLCsz2/EPSibwmoKFJRGGe+O
         nzfUSBGBVxltx+Ty0L5bdHIx9PK5U+jpMEAwaAOB1S06VFv1YYYMTt1d4OVj3AzgBuRt
         sLhC0G9+aWShoVTtG8dne9/FIMXrx9uLPdfwMb6u8XUymFjSPAIfEBXdx9Fpr6VfVHGy
         QU3xYByuBBPyuJfYRE38indGmvut8z5H75DNBJIHPPGr//ejR/dXDAQ0VxbyIU8U0esE
         kyDU1kT5t3HbEb4GwnvuvSdKMun3nIfXLAV+jlZLoAK1HnV5WuONFMKzacLmzyag2yRQ
         pyVA==
X-Forwarded-Encrypted: i=1; AJvYcCUzscyZlKF3nPQGuZLVUBbB/zr8Syk2/sxDn4o3dhPgQvOFA92gAT/7mVueDISqjDenf/2xoRlHZhKt@vger.kernel.org
X-Gm-Message-State: AOJu0YwQTzKBkg+bnaAhntBUZLp2qWSPguZus1H/J67GUbEUyRwm911y
	AFIEOvsO1e8KRX7byRmNeqRFiSodpCMaA2SDeM5oSNFmP26fX0G6KwM4vp7D0d/Z0DfiPbvB7uA
	vXl8PEXC/RGm7dU0TK3wRgh1edoTpzN+wHufcCr5pDCXyR+fo2Z5UTbn36mQ=
X-Google-Smtp-Source: AGHT+IGS4qTWAHVh6HInzDxctIOHNPgHVf3qNkfsUrnTN2z1d47bgHqWTGEfqq1uvEbNSeBurPadRrh+/XlsvB2QIQPAgIbBMwZX
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:194b:b0:3dc:8b2c:4bc7 with SMTP id
 e9e14a558f8ab-3de38c1ba33mr104025595ab.1.1750590798918; Sun, 22 Jun 2025
 04:13:18 -0700 (PDT)
Date: Sun, 22 Jun 2025 04:13:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6857e54e.050a0220.bba34.0006.GAE@google.com>
Subject: [syzbot] [hams?] possible deadlock in serial8250_console_write (2)
From: syzbot <syzbot+02b62f22539c818c8a0e@syzkaller.appspotmail.com>
To: ajk@comnets.uni-bremen.de, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, linux-hams@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    52da431bf03b Merge tag 'libnvdimm-fixes-6.16-rc3' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1190050c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6a237c32900fc479
dashboard link: https://syzkaller.appspot.com/bug?extid=02b62f22539c818c8a0e
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/97afcc470d39/disk-52da431b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/dc0ebacae4ba/vmlinux-52da431b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/85dd67feecea/bzImage-52da431b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+02b62f22539c818c8a0e@syzkaller.appspotmail.com

=====================================================
WARNING: HARDIRQ-safe -> HARDIRQ-unsafe lock order detected
6.16.0-rc2-syzkaller-00047-g52da431bf03b #0 Not tainted
-----------------------------------------------------
kworker/u8:6/3455 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
ffffffff8ece08d8 (disc_data_lock){.+.+}-{3:3}, at: sp_get drivers/net/hamradio/6pack.c:370 [inline]
ffffffff8ece08d8 (disc_data_lock){.+.+}-{3:3}, at: sixpack_write_wakeup+0x30/0x480 drivers/net/hamradio/6pack.c:391

and this task is already holding:
ffffffff99d96058 (&port_lock_key){-.-.}-{3:3}, at: uart_port_lock_irqsave include/linux/serial_core.h:717 [inline]
ffffffff99d96058 (&port_lock_key){-.-.}-{3:3}, at: uart_port_ref_lock+0xc4/0x3b0 drivers/tty/serial/serial_core.c:83
which would create a new lock dependency:
 (&port_lock_key){-.-.}-{3:3} -> (disc_data_lock){.+.+}-{3:3}

but this new dependency connects a HARDIRQ-irq-safe lock:
 (&port_lock_key){-.-.}-{3:3}

... which became HARDIRQ-irq-safe at:
  lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
  _raw_spin_lock_irqsave+0xa7/0xf0 kernel/locking/spinlock.c:162
  uart_port_lock_irqsave include/linux/serial_core.h:717 [inline]
  serial8250_console_write+0x17e/0x1ba0 drivers/tty/serial/8250/8250_port.c:3415
  console_emit_next_record kernel/printk/printk.c:3138 [inline]
  console_flush_all+0x728/0xc40 kernel/printk/printk.c:3226
  __console_flush_and_unlock kernel/printk/printk.c:3285 [inline]
  console_unlock+0xc4/0x270 kernel/printk/printk.c:3325
  vprintk_emit+0x5b7/0x7a0 kernel/printk/printk.c:2450
  _printk+0xcf/0x120 kernel/printk/printk.c:2475
  vkms_vblank_simulate+0x2be/0x320 drivers/gpu/drm/vkms/vkms_crtc.c:27
  __run_hrtimer kernel/time/hrtimer.c:1761 [inline]
  __hrtimer_run_queues+0x529/0xc60 kernel/time/hrtimer.c:1825
  hrtimer_interrupt+0x45b/0xaa0 kernel/time/hrtimer.c:1887
  local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1039 [inline]
  __sysvec_apic_timer_interrupt+0x10b/0x410 arch/x86/kernel/apic/apic.c:1056
  instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
  sysvec_apic_timer_interrupt+0xa1/0xc0 arch/x86/kernel/apic/apic.c:1050
  asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
  __outl arch/x86/include/asm/shared/io.h:24 [inline]
  iowrite32+0x35/0x90 lib/iomap.c:225
  setup_vq+0x169/0x2e0 drivers/virtio/virtio_pci_legacy.c:150
  vp_setup_vq+0xc4/0x400 drivers/virtio/virtio_pci_common.c:222
  vp_find_one_vq_msix+0xc4/0x490 drivers/virtio/virtio_pci_common.c:352
  vp_find_vqs_msix+0x9b0/0xd00 drivers/virtio/virtio_pci_common.c:429
  vp_find_vqs+0x9c/0x760 drivers/virtio/virtio_pci_common.c:525
  virtio_find_vqs include/linux/virtio_config.h:226 [inline]
  virtnet_find_vqs drivers/net/virtio_net.c:6435 [inline]
  init_vqs+0xbda/0x12d0 drivers/net/virtio_net.c:6520
  virtnet_probe+0x1e35/0x4270 drivers/net/virtio_net.c:6907
  virtio_dev_probe+0x914/0xbe0 drivers/virtio/virtio.c:341
  call_driver_probe drivers/base/dd.c:-1 [inline]
  really_probe+0x26a/0x9a0 drivers/base/dd.c:657
  __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
  driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
  __driver_attach+0x452/0x700 drivers/base/dd.c:1215
  bus_for_each_dev+0x230/0x2b0 drivers/base/bus.c:370
  bus_add_driver+0x345/0x640 drivers/base/bus.c:678
  driver_register+0x23a/0x320 drivers/base/driver.c:249
  virtio_net_driver_init+0x96/0xe0 drivers/net/virtio_net.c:7211
  do_one_initcall+0x233/0x820 init/main.c:1274
  do_initcall_level+0x137/0x1f0 init/main.c:1336
  do_initcalls+0x69/0xd0 init/main.c:1352
  kernel_init_freeable+0x3d9/0x570 init/main.c:1584
  kernel_init+0x1d/0x1d0 init/main.c:1474
  ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

to a HARDIRQ-irq-unsafe lock:
 (disc_data_lock){.+.+}-{3:3}

... which became HARDIRQ-irq-unsafe at:
...
  lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
  __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
  _raw_read_lock+0x36/0x50 kernel/locking/spinlock.c:228
  sp_get drivers/net/hamradio/6pack.c:370 [inline]
  sixpack_ioctl+0x84/0x590 drivers/net/hamradio/6pack.c:676
  tty_ioctl+0x9c6/0xde0 drivers/tty/tty_io.c:2801
  vfs_ioctl fs/ioctl.c:51 [inline]
  __do_sys_ioctl fs/ioctl.c:907 [inline]
  __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
  entry_SYSCALL_64_after_hwframe+0x77/0x7f

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

6 locks held by kworker/u8:6/3455:
 #0: ffff88801a489148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff88801a489148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3321
 #1: ffffc9000c317bc0 ((work_completion)(&buf->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc9000c317bc0 ((work_completion)(&buf->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3321
 #2: ffff888024680ca0 (&buf->lock){+.+.}-{4:4}, at: flush_to_ldisc+0x38/0x720 drivers/tty/tty_buffer.c:467
 #3: ffff88807d4ea0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref+0x1c/0x90 drivers/tty/tty_ldisc.c:263
 #4: ffffffff99d96058 (&port_lock_key){-.-.}-{3:3}, at: uart_port_lock_irqsave include/linux/serial_core.h:717 [inline]
 #4: ffffffff99d96058 (&port_lock_key){-.-.}-{3:3}, at: uart_port_ref_lock+0xc4/0x3b0 drivers/tty/serial/serial_core.c:83
 #5: ffff88807d4ea0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref+0x1c/0x90 drivers/tty/tty_ldisc.c:263

the dependencies between HARDIRQ-irq-safe lock and the holding lock:
-> (&port_lock_key){-.-.}-{3:3} {
   IN-HARDIRQ-W at:
                    lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
                    __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
                    _raw_spin_lock_irqsave+0xa7/0xf0 kernel/locking/spinlock.c:162
                    uart_port_lock_irqsave include/linux/serial_core.h:717 [inline]
                    serial8250_console_write+0x17e/0x1ba0 drivers/tty/serial/8250/8250_port.c:3415
                    console_emit_next_record kernel/printk/printk.c:3138 [inline]
                    console_flush_all+0x728/0xc40 kernel/printk/printk.c:3226
                    __console_flush_and_unlock kernel/printk/printk.c:3285 [inline]
                    console_unlock+0xc4/0x270 kernel/printk/printk.c:3325
                    vprintk_emit+0x5b7/0x7a0 kernel/printk/printk.c:2450
                    _printk+0xcf/0x120 kernel/printk/printk.c:2475
                    vkms_vblank_simulate+0x2be/0x320 drivers/gpu/drm/vkms/vkms_crtc.c:27
                    __run_hrtimer kernel/time/hrtimer.c:1761 [inline]
                    __hrtimer_run_queues+0x529/0xc60 kernel/time/hrtimer.c:1825
                    hrtimer_interrupt+0x45b/0xaa0 kernel/time/hrtimer.c:1887
                    local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1039 [inline]
                    __sysvec_apic_timer_interrupt+0x10b/0x410 arch/x86/kernel/apic/apic.c:1056
                    instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
                    sysvec_apic_timer_interrupt+0xa1/0xc0 arch/x86/kernel/apic/apic.c:1050
                    asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
                    __outl arch/x86/include/asm/shared/io.h:24 [inline]
                    iowrite32+0x35/0x90 lib/iomap.c:225
                    setup_vq+0x169/0x2e0 drivers/virtio/virtio_pci_legacy.c:150
                    vp_setup_vq+0xc4/0x400 drivers/virtio/virtio_pci_common.c:222
                    vp_find_one_vq_msix+0xc4/0x490 drivers/virtio/virtio_pci_common.c:352
                    vp_find_vqs_msix+0x9b0/0xd00 drivers/virtio/virtio_pci_common.c:429
                    vp_find_vqs+0x9c/0x760 drivers/virtio/virtio_pci_common.c:525
                    virtio_find_vqs include/linux/virtio_config.h:226 [inline]
                    virtnet_find_vqs drivers/net/virtio_net.c:6435 [inline]
                    init_vqs+0xbda/0x12d0 drivers/net/virtio_net.c:6520
                    virtnet_probe+0x1e35/0x4270 drivers/net/virtio_net.c:6907
                    virtio_dev_probe+0x914/0xbe0 drivers/virtio/virtio.c:341
                    call_driver_probe drivers/base/dd.c:-1 [inline]
                    really_probe+0x26a/0x9a0 drivers/base/dd.c:657
                    __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
                    driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
                    __driver_attach+0x452/0x700 drivers/base/dd.c:1215
                    bus_for_each_dev+0x230/0x2b0 drivers/base/bus.c:370
                    bus_add_driver+0x345/0x640 drivers/base/bus.c:678
                    driver_register+0x23a/0x320 drivers/base/driver.c:249
                    virtio_net_driver_init+0x96/0xe0 drivers/net/virtio_net.c:7211
                    do_one_initcall+0x233/0x820 init/main.c:1274
                    do_initcall_level+0x137/0x1f0 init/main.c:1336
                    do_initcalls+0x69/0xd0 init/main.c:1352
                    kernel_init_freeable+0x3d9/0x570 init/main.c:1584
                    kernel_init+0x1d/0x1d0 init/main.c:1474
                    ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
                    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
   IN-SOFTIRQ-W at:
                    lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
                    __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
                    _raw_spin_lock_irqsave+0xa7/0xf0 kernel/locking/spinlock.c:162
                    uart_port_lock_irqsave include/linux/serial_core.h:717 [inline]
                    serial8250_handle_irq+0x6b/0xbb0 drivers/tty/serial/8250/8250_port.c:1917
                    serial8250_default_handle_irq+0xbf/0x1b0 drivers/tty/serial/8250/8250_port.c:1966
                    serial8250_interrupt+0xa5/0x1d0 drivers/tty/serial/8250/8250_core.c:86
                    __handle_irq_event_percpu+0x28c/0x980 kernel/irq/handle.c:158
                    handle_irq_event_percpu kernel/irq/handle.c:193 [inline]
                    handle_irq_event+0x8b/0x1e0 kernel/irq/handle.c:210
                    handle_edge_irq+0x267/0x9c0 kernel/irq/chip.c:789
                    generic_handle_irq_desc include/linux/irqdesc.h:173 [inline]
                    handle_irq arch/x86/kernel/irq.c:254 [inline]
                    call_irq_handler arch/x86/kernel/irq.c:266 [inline]
                    __common_interrupt+0x143/0x250 arch/x86/kernel/irq.c:292
                    common_interrupt+0xb6/0xe0 arch/x86/kernel/irq.c:285
                    asm_common_interrupt+0x26/0x40 arch/x86/include/asm/idtentry.h:693
                    memset_orig+0x75/0xb0 arch/x86/lib/memset_64.S:91
                    unwind_next_frame+0xc98/0x2390 arch/x86/kernel/unwind_orc.c:592
                    arch_stack_walk+0x11c/0x150 arch/x86/kernel/stacktrace.c:25
                    stack_trace_save+0x9c/0xe0 kernel/stacktrace.c:122
                    kasan_save_stack mm/kasan/common.c:47 [inline]
                    kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
                    kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
                    poison_slab_object mm/kasan/common.c:247 [inline]
                    __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
                    kasan_slab_free include/linux/kasan.h:233 [inline]
                    slab_free_hook mm/slub.c:2381 [inline]
                    slab_free mm/slub.c:4643 [inline]
                    kfree+0x18e/0x440 mm/slub.c:4842
                    slab_free_after_rcu_debug+0x60/0x2a0 mm/slub.c:4680
                    rcu_do_batch kernel/rcu/tree.c:2576 [inline]
                    rcu_core+0xca8/0x1710 kernel/rcu/tree.c:2832
                    handle_softirqs+0x286/0x870 kernel/softirq.c:579
                    run_ksoftirqd+0x9b/0x100 kernel/softirq.c:968
                    smpboot_thread_fn+0x53f/0xa60 kernel/smpboot.c:164
                    kthread+0x70e/0x8a0 kernel/kthread.c:464
                    ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
                    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
   INITIAL USE at:
                   lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
                   __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
                   _raw_spin_lock_irqsave+0xa7/0xf0 kernel/locking/spinlock.c:162
                   uart_port_lock_irqsave include/linux/serial_core.h:717 [inline]
                   serial8250_do_set_termios+0x4bb/0x1c20 drivers/tty/serial/8250/8250_port.c:2774
                   uart_set_options+0x3c2/0x5b0 drivers/tty/serial/serial_core.c:2309
                   serial8250_console_setup+0x2f4/0x3c0 drivers/tty/serial/8250/8250_port.c:3519
                   univ8250_console_setup+0x43a/0x540 drivers/tty/serial/8250/8250_core.c:428
                   console_call_setup kernel/printk/printk.c:3799 [inline]
                   try_enable_preferred_console+0x4e4/0x650 kernel/printk/printk.c:3843
                   register_console+0x551/0xf90 kernel/printk/printk.c:4037
                   univ8250_console_init+0x52/0x90 drivers/tty/serial/8250/8250_core.c:513
                   console_init+0x1a1/0x670 kernel/printk/printk.c:4323
                   start_kernel+0x2cc/0x500 init/main.c:1036
                   x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:307
                   x86_64_start_kernel+0x143/0x1c0 arch/x86/kernel/head64.c:288
                   common_startup_64+0x13e/0x147
 }
 ... key      at: [<ffffffff99d95420>] port_lock_key+0x0/0x20

the dependencies between the lock to be acquired
 and HARDIRQ-irq-unsafe lock:
-> (disc_data_lock){.+.+}-{3:3} {
   HARDIRQ-ON-R at:
                    lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
                    __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
                    _raw_read_lock+0x36/0x50 kernel/locking/spinlock.c:228
                    sp_get drivers/net/hamradio/6pack.c:370 [inline]
                    sixpack_ioctl+0x84/0x590 drivers/net/hamradio/6pack.c:676
                    tty_ioctl+0x9c6/0xde0 drivers/tty/tty_io.c:2801
                    vfs_ioctl fs/ioctl.c:51 [inline]
                    __do_sys_ioctl fs/ioctl.c:907 [inline]
                    __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
                    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
                    do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
                    entry_SYSCALL_64_after_hwframe+0x77/0x7f
   SOFTIRQ-ON-R at:
                    lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
                    __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
                    _raw_read_lock+0x36/0x50 kernel/locking/spinlock.c:228
                    sp_get drivers/net/hamradio/6pack.c:370 [inline]
                    sixpack_ioctl+0x84/0x590 drivers/net/hamradio/6pack.c:676
                    tty_ioctl+0x9c6/0xde0 drivers/tty/tty_io.c:2801
                    vfs_ioctl fs/ioctl.c:51 [inline]
                    __do_sys_ioctl fs/ioctl.c:907 [inline]
                    __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
                    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
                    do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
                    entry_SYSCALL_64_after_hwframe+0x77/0x7f
   INITIAL USE at:
                   lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
                   __raw_write_lock_irq include/linux/rwlock_api_smp.h:195 [inline]
                   _raw_write_lock_irq+0xa2/0xf0 kernel/locking/spinlock.c:326
                   sixpack_close+0x2c/0x280 drivers/net/hamradio/6pack.c:641
                   tty_ldisc_kill+0xa3/0x1a0 drivers/tty/tty_ldisc.c:613
                   tty_ldisc_release+0x174/0x200 drivers/tty/tty_ldisc.c:781
                   tty_release_struct+0x2a/0xd0 drivers/tty/tty_io.c:1681
                   tty_release+0xcb0/0x1640 drivers/tty/tty_io.c:1852
                   __fput+0x449/0xa70 fs/file_table.c:465
                   task_work_run+0x1d1/0x260 kernel/task_work.c:227
                   resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
                   exit_to_user_mode_loop+0xec/0x110 kernel/entry/common.c:114
                   exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
                   syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
                   syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
                   do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
                   entry_SYSCALL_64_after_hwframe+0x77/0x7f
   INITIAL READ USE at:
                        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
                        __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
                        _raw_read_lock+0x36/0x50 kernel/locking/spinlock.c:228
                        sp_get drivers/net/hamradio/6pack.c:370 [inline]
                        sixpack_ioctl+0x84/0x590 drivers/net/hamradio/6pack.c:676
                        tty_ioctl+0x9c6/0xde0 drivers/tty/tty_io.c:2801
                        vfs_ioctl fs/ioctl.c:51 [inline]
                        __do_sys_ioctl fs/ioctl.c:907 [inline]
                        __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
                        do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
                        do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
                        entry_SYSCALL_64_after_hwframe+0x77/0x7f
 }
 ... key      at: [<ffffffff8ece08d8>] disc_data_lock+0x18/0x100 6pack.c:-1
 ... acquired at:
   lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
   __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
   _raw_read_lock+0x36/0x50 kernel/locking/spinlock.c:228
   sp_get drivers/net/hamradio/6pack.c:370 [inline]
   sixpack_write_wakeup+0x30/0x480 drivers/net/hamradio/6pack.c:391
   tty_wakeup+0xbb/0x100 drivers/tty/tty_io.c:515
   tty_port_default_wakeup+0xa2/0xf0 drivers/tty/tty_port.c:69
   serial8250_tx_chars+0x72e/0x970 drivers/tty/serial/8250/8250_port.c:1838
   __start_tx+0x33b/0x480 drivers/tty/serial/8250/8250_port.c:1543
   __uart_start+0x23c/0x440 drivers/tty/serial/serial_core.c:161
   uart_write+0xdc/0x130 drivers/tty/serial/serial_core.c:636
   decode_prio_command drivers/net/hamradio/6pack.c:868 [inline]
   sixpack_decode drivers/net/hamradio/6pack.c:943 [inline]
   sixpack_receive_buf+0x447/0x1450 drivers/net/hamradio/6pack.c:447
   tty_ldisc_receive_buf+0x116/0x160 drivers/tty/tty_buffer.c:391
   tty_port_default_receive_buf+0x6e/0xa0 drivers/tty/tty_port.c:37
   receive_buf drivers/tty/tty_buffer.c:445 [inline]
   flush_to_ldisc+0x24a/0x720 drivers/tty/tty_buffer.c:495
   process_one_work kernel/workqueue.c:3238 [inline]
   process_scheduled_works+0xade/0x17b0 kernel/workqueue.c:3321
   worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
   kthread+0x70e/0x8a0 kernel/kthread.c:464
   ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245


stack backtrace:
CPU: 0 UID: 0 PID: 3455 Comm: kworker/u8:6 Not tainted 6.16.0-rc2-syzkaller-00047-g52da431bf03b #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: events_unbound flush_to_ldisc
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_bad_irq_dependency kernel/locking/lockdep.c:2619 [inline]
 check_irq_usage kernel/locking/lockdep.c:2860 [inline]
 check_prev_add kernel/locking/lockdep.c:3172 [inline]
 check_prevs_add kernel/locking/lockdep.c:3287 [inline]
 validate_chain+0x1f05/0x2140 kernel/locking/lockdep.c:3911
 __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5240
 lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
 __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
 _raw_read_lock+0x36/0x50 kernel/locking/spinlock.c:228
 sp_get drivers/net/hamradio/6pack.c:370 [inline]
 sixpack_write_wakeup+0x30/0x480 drivers/net/hamradio/6pack.c:391
 tty_wakeup+0xbb/0x100 drivers/tty/tty_io.c:515
 tty_port_default_wakeup+0xa2/0xf0 drivers/tty/tty_port.c:69
 serial8250_tx_chars+0x72e/0x970 drivers/tty/serial/8250/8250_port.c:1838
 __start_tx+0x33b/0x480 drivers/tty/serial/8250/8250_port.c:1543
 __uart_start+0x23c/0x440 drivers/tty/serial/serial_core.c:161
 uart_write+0xdc/0x130 drivers/tty/serial/serial_core.c:636
 decode_prio_command drivers/net/hamradio/6pack.c:868 [inline]
 sixpack_decode drivers/net/hamradio/6pack.c:943 [inline]
 sixpack_receive_buf+0x447/0x1450 drivers/net/hamradio/6pack.c:447
 tty_ldisc_receive_buf+0x116/0x160 drivers/tty/tty_buffer.c:391
 tty_port_default_receive_buf+0x6e/0xa0 drivers/tty/tty_port.c:37
 receive_buf drivers/tty/tty_buffer.c:445 [inline]
 flush_to_ldisc+0x24a/0x720 drivers/tty/tty_buffer.c:495
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xade/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

