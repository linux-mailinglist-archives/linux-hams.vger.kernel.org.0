Return-Path: <linux-hams+bounces-709-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A839CC84C16
	for <lists+linux-hams@lfdr.de>; Tue, 25 Nov 2025 12:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2D991350605
	for <lists+linux-hams@lfdr.de>; Tue, 25 Nov 2025 11:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93632274FF5;
	Tue, 25 Nov 2025 11:35:27 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CF62701C0
	for <linux-hams@vger.kernel.org>; Tue, 25 Nov 2025 11:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764070527; cv=none; b=UdkdZy4KPfcV2Z5nuqhahWOnzbeGixj4N1RXD7Zu2TcUKM81YB+Nu7QV4hRmQSc12GAYbtCD9o0NtIlmDMdyY3NcZzHRGLZC+PDQO9lUwdRmzYpyPGia+boTSKBcwei/VVdImExW+c+A9vGy5LWKGnKLkb38lS2EJ4QANhnfVUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764070527; c=relaxed/simple;
	bh=N9e9kXKrkLY3hdJMVKAOJQ64uFmsSyeVEVDaOqkBz68=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=FGiD8B26wHmZh80UoyF2EMaKBys5cYP6u/4KbUeJ5b/L5eJ4SGkRlsDXMsHFPefmkghmZGuVZaMxk6+yIMh8ivEC8JMQzhUqc1XsLaoN5BLv6fXfVYsQCFNW8iaxPc6CYGaNq2f9HHdOS1+2ji7f9TF8raOylOBbx1bC3NyJvGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-433689014feso58018415ab.1
        for <linux-hams@vger.kernel.org>; Tue, 25 Nov 2025 03:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764070525; x=1764675325;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ChoXgka1YWDsPKLbtTABFBVAbPQcMKaAZFHLUr1f2I8=;
        b=JMaZhfuuu7KN1EeF1x/jD0Nni1qE2e1BMcWr075of+GhrhWUOBeE+cComBrpreAaZ6
         cFe6ittkHakj+yB30UMfQ1shHCwHwHbOBCHy45N6H6PFhILKJ3Gf0r6m5U2hhuAB9SFP
         N9SrlS+3odbH9t2YQK9CxgR5AE6WXhHzHtEAuzguLNKQX6St8wQsa43h4rqkE2138XSb
         fs+RUkYj3WKudu+FJBgm9ql3+kON2r1bRJ5rxL0K8fHvvxpyLMqO5wUx1Rr8CKsLY12Z
         +k8jHk6/laCNb0FhOv8YqNji9QvZLPrGp/PeHiw30lAKecoKkrc9Rmn9Dj2BmqMqJMZX
         vvsg==
X-Forwarded-Encrypted: i=1; AJvYcCVCE9xRGUaOzRFEIWkTScMfnrF8PTAIPjHf0NUAC5krXSYz7AE3X31KYm0uIFpVVP0PIST+C39dw3WA@vger.kernel.org
X-Gm-Message-State: AOJu0YwiN4f45zdGIiP05UHfZ8ESve5Bx0rSabF9OnDlkK2uOoVY0wD7
	qdaS0yw5QccB50yBsnum+/uCJBAeVQPsSCAOd32P7+fg4HrFrlYI7oQc3STIeAEO+EU8oE+GwZo
	tB8TG33jQfQFDbu4PNpbmCu1mi4gvxgzjU7Mhv2UOUQKKuLSX/6u6CFhOFF4=
X-Google-Smtp-Source: AGHT+IG/+ZXI4COkQeVB/sPLJPpDukEVsRV4EgCEQSp8GzW14yrp3MQgKhPKcvOMXnVRsAvqwXRkEe9bPBZrSiXNxBhWmj+Buyoz
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3810:b0:433:51fd:4cda with SMTP id
 e9e14a558f8ab-435b98c5d10mr118389165ab.25.1764070525069; Tue, 25 Nov 2025
 03:35:25 -0800 (PST)
Date: Tue, 25 Nov 2025 03:35:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6925947d.a70a0220.d98e3.00a6.GAE@google.com>
Subject: [syzbot] [hams?] KMSAN: uninit-value in sixpack_receive_buf (4)
From: syzbot <syzbot+ecdb8c9878a81eb21e54@syzkaller.appspotmail.com>
To: ajk@comnets.uni-bremen.de, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, linux-hams@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fd95357fd8c6 Merge tag 'sched_ext-for-6.18-rc6-fixes-2' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14b20e92580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61a9bf3cc5d17a01
dashboard link: https://syzkaller.appspot.com/bug?extid=ecdb8c9878a81eb21e54
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/68372e629a75/disk-fd95357f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d18e790887c9/vmlinux-fd95357f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4eb563ad2c24/bzImage-fd95357f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ecdb8c9878a81eb21e54@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in sixpack_decode drivers/net/hamradio/6pack.c:891 [inline]
BUG: KMSAN: uninit-value in sixpack_receive_buf+0xcf1/0x2d20 drivers/net/hamradio/6pack.c:413
 sixpack_decode drivers/net/hamradio/6pack.c:891 [inline]
 sixpack_receive_buf+0xcf1/0x2d20 drivers/net/hamradio/6pack.c:413
 tty_ldisc_receive_buf+0x1f7/0x2c0 drivers/tty/tty_buffer.c:391
 tty_port_default_receive_buf+0xd7/0x1a0 drivers/tty/tty_port.c:37
 receive_buf drivers/tty/tty_buffer.c:445 [inline]
 flush_to_ldisc+0x43e/0xe30 drivers/tty/tty_buffer.c:495
 process_one_work kernel/workqueue.c:3263 [inline]
 process_scheduled_works+0xb91/0x1d80 kernel/workqueue.c:3346
 worker_thread+0xedf/0x1590 kernel/workqueue.c:3427
 kthread+0xd5c/0xf00 kernel/kthread.c:463
 ret_from_fork+0x1f5/0x4c0 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4985 [inline]
 slab_alloc_node mm/slub.c:5288 [inline]
 __do_kmalloc_node mm/slub.c:5649 [inline]
 __kmalloc_noprof+0xabb/0x1b40 mm/slub.c:5662
 kmalloc_noprof include/linux/slab.h:961 [inline]
 tty_buffer_alloc drivers/tty/tty_buffer.c:180 [inline]
 __tty_buffer_request_room+0x3d4/0x7a0 drivers/tty/tty_buffer.c:273
 __tty_insert_flip_string_flags+0x157/0x6f0 drivers/tty/tty_buffer.c:309
 tty_insert_flip_char include/linux/tty_flip.h:77 [inline]
 uart_insert_char+0x368/0x930 drivers/tty/serial/serial_core.c:3457
 serial8250_read_char+0x1ba/0x670 drivers/tty/serial/8250/8250_port.c:1641
 serial8250_rx_chars drivers/tty/serial/8250/8250_port.c:1658 [inline]
 serial8250_handle_irq+0x930/0x1110 drivers/tty/serial/8250/8250_port.c:1822
 serial8250_default_handle_irq+0x116/0x370 drivers/tty/serial/8250/8250_port.c:1846
 serial8250_interrupt+0xcb/0x430 drivers/tty/serial/8250/8250_core.c:82
 __handle_irq_event_percpu+0x11e/0xf80 kernel/irq/handle.c:203
 handle_irq_event_percpu kernel/irq/handle.c:240 [inline]
 handle_irq_event+0xe0/0x2a0 kernel/irq/handle.c:257
 handle_edge_irq+0x2a9/0xb50 kernel/irq/chip.c:855
 generic_handle_irq_desc include/linux/irqdesc.h:173 [inline]
 handle_irq arch/x86/kernel/irq.c:254 [inline]
 call_irq_handler arch/x86/kernel/irq.c:-1 [inline]
 __common_interrupt+0x9d/0x180 arch/x86/kernel/irq.c:325
 common_interrupt+0x4c/0xb0 arch/x86/kernel/irq.c:318
 asm_common_interrupt+0x2b/0x40 arch/x86/include/asm/idtentry.h:688

CPU: 1 UID: 0 PID: 13878 Comm: kworker/u8:21 Tainted: G        W           syzkaller #0 PREEMPT(none) 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Workqueue: events_unbound flush_to_ldisc
=====================================================


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

