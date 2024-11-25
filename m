Return-Path: <linux-hams+bounces-445-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC149D79E7
	for <lists+linux-hams@lfdr.de>; Mon, 25 Nov 2024 02:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09FBF282420
	for <lists+linux-hams@lfdr.de>; Mon, 25 Nov 2024 01:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BD0EADA;
	Mon, 25 Nov 2024 01:59:21 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D13A846F
	for <linux-hams@vger.kernel.org>; Mon, 25 Nov 2024 01:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732499961; cv=none; b=tdgNIMNU+jcWwu+zu2RV+tJgPJH7uUZVsXJRjrbu2q9CeyuTNWwBdhP9novJ69nS/pgXm62/C3zorpCgwBaZmCLn56NwpCutEGWXR9HESYHfJbLTTHfvIGqPPN6AAR2nFf2cfMo+v/HpFlfDSTlhkkT6qjhRHFzxnTdbTDhUkuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732499961; c=relaxed/simple;
	bh=jOimkNeJ8PSf4wp3zHaf1e+L9kTww0qBwpT05jAXmH8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BOOBXeAzQtNlRP+hwecZKsY6iJBNnEkkD6TzfVw4tXo0sYune2eJYvo90corhuMzXcZiBCB7cqMcIScyP6YlLi+cyzYvTp7SiJ6nv2jsa5zxGjIk8OVocnr5Oeaat2NoRLP1QH2Cn5eobNlf/A2rvYiZpDDAG7PgoilT/Dhxwq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-83e5dd390bfso425885639f.1
        for <linux-hams@vger.kernel.org>; Sun, 24 Nov 2024 17:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732499959; x=1733104759;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hyP2WlpsFyMyoLJM50Bt2iubn7mJqAwE8aaWAzJfa+c=;
        b=EjFmhyv1/uopyJjnA1IOqydBR8fxMYLqBzZtQchYtMqh3+68eX8FL36zRz5OFNTRTp
         5Bkc1HDiwuhs4jr8/r4rMvQknIX37FRqZl7wUQy7Ak2op3NKbQ1IdfTw7uwdx50SNc9S
         DabGugcVBoW+fLnl2TzNwc0sFRqA9knw+Ud2Ti3WoZhc489jLjSRcgOuXFnXhBU2QDdg
         focXmFaoK6IuoX6F3nHSzQYUJi0Nmdsnz5/BoSi6+Amz/XjG4wxXsW2Xq+aFuuGCxmVP
         cMUTF7KkBahDBSaiRQyNVn9geqmyLNmkLtmOmTQ0KCStQymgQVaE8yqyBAsYQjup0WRi
         xCfg==
X-Forwarded-Encrypted: i=1; AJvYcCWUU/5lnHsC6gtW0GYx5EBRFkqkAIFOL7eVZHtEhTyiQA6ZIAXjHml+NV9dMemprkPwQW5zdXZ+mcN9@vger.kernel.org
X-Gm-Message-State: AOJu0Yyecqqs5p9bv+sIY/JWUcitpYw3xeZScTfd4WCPBAoke8+6VCpU
	we12ORd+Y4etLd/ozebOA0PIhb5Y5mgZH9FhPo24+wlnH9hsfT+aFoP1u2ocxX/HozkjWokEu6L
	MVzuhezuSyTSTVJPO2CoZ2gSViAK0xbSQkIaMwmKknXdQuKAFQGXVOr0=
X-Google-Smtp-Source: AGHT+IHFRxvzXqxa5HEqVatsAuNcAjMnKDv88RtOzdFLbuSrRv5HTLcEaFatT/gCwmz8NTzXfOdhnMZFVUt0kZmo4lhOUJ5uxQyn
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca4f:0:b0:3a7:9fff:1353 with SMTP id
 e9e14a558f8ab-3a79fff1550mr100803675ab.0.1732499958844; Sun, 24 Nov 2024
 17:59:18 -0800 (PST)
Date: Sun, 24 Nov 2024 17:59:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6743d9f6.050a0220.1cc393.0054.GAE@google.com>
Subject: [syzbot] [hams?] KMSAN: uninit-value in sixpack_receive_buf
From: syzbot <syzbot+c08839217d2085e56bb8@syzkaller.appspotmail.com>
To: ajk@comnets.uni-bremen.de, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, linux-hams@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    bf9aa14fc523 Merge tag 'timers-core-2024-11-18' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16d7bae8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1eb27d66c540f6e6
dashboard link: https://syzkaller.appspot.com/bug?extid=c08839217d2085e56bb8
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c0c0e51a2a13/disk-bf9aa14f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/852f5ece75d3/vmlinux-bf9aa14f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4fb1796345b4/bzImage-bf9aa14f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c08839217d2085e56bb8@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in sixpack_decode drivers/net/hamradio/6pack.c:938 [inline]
BUG: KMSAN: uninit-value in sixpack_receive_buf+0x773/0x2d70 drivers/net/hamradio/6pack.c:447
 sixpack_decode drivers/net/hamradio/6pack.c:938 [inline]
 sixpack_receive_buf+0x773/0x2d70 drivers/net/hamradio/6pack.c:447
 tty_ldisc_receive_buf+0x202/0x290 drivers/tty/tty_buffer.c:391
 tty_port_default_receive_buf+0xdf/0x190 drivers/tty/tty_port.c:37
 receive_buf drivers/tty/tty_buffer.c:445 [inline]
 flush_to_ldisc+0x473/0xdb0 drivers/tty/tty_buffer.c:495
 process_one_work kernel/workqueue.c:3229 [inline]
 process_scheduled_works+0xae0/0x1c40 kernel/workqueue.c:3310
 worker_thread+0xea7/0x14f0 kernel/workqueue.c:3391
 kthread+0x3e2/0x540 kernel/kthread.c:389
 ret_from_fork+0x6d/0x90 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4091 [inline]
 slab_alloc_node mm/slub.c:4134 [inline]
 __do_kmalloc_node mm/slub.c:4263 [inline]
 __kmalloc_noprof+0x661/0xf30 mm/slub.c:4276
 kmalloc_noprof include/linux/slab.h:883 [inline]
 tty_buffer_alloc drivers/tty/tty_buffer.c:180 [inline]
 __tty_buffer_request_room+0x36e/0x6d0 drivers/tty/tty_buffer.c:273
 __tty_insert_flip_string_flags+0x140/0x570 drivers/tty/tty_buffer.c:309
 tty_insert_flip_char include/linux/tty_flip.h:77 [inline]
 uart_insert_char+0x39e/0xa10 drivers/tty/serial/serial_core.c:3550
 serial8250_read_char+0x1a7/0x5d0 drivers/tty/serial/8250/8250_port.c:1743
 serial8250_rx_chars drivers/tty/serial/8250/8250_port.c:1760 [inline]
 serial8250_handle_irq+0x970/0x1130 drivers/tty/serial/8250/8250_port.c:1924
 serial8250_default_handle_irq+0x120/0x2b0 drivers/tty/serial/8250/8250_port.c:1949
 serial8250_interrupt+0xc5/0x360 drivers/tty/serial/8250/8250_core.c:86
 __handle_irq_event_percpu+0x118/0xca0 kernel/irq/handle.c:158
 handle_irq_event_percpu kernel/irq/handle.c:193 [inline]
 handle_irq_event+0xef/0x2c0 kernel/irq/handle.c:210
 handle_edge_irq+0x340/0xfb0 kernel/irq/chip.c:831
 generic_handle_irq_desc include/linux/irqdesc.h:173 [inline]
 handle_irq arch/x86/kernel/irq.c:247 [inline]
 call_irq_handler arch/x86/kernel/irq.c:259 [inline]
 __common_interrupt+0x97/0x1f0 arch/x86/kernel/irq.c:285
 common_interrupt+0x92/0xb0 arch/x86/kernel/irq.c:278
 asm_common_interrupt+0x2b/0x40 arch/x86/include/asm/idtentry.h:693

CPU: 1 UID: 0 PID: 7175 Comm: kworker/u8:31 Not tainted 6.12.0-syzkaller-01782-gbf9aa14fc523 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/30/2024
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

