Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C592FF1CD
	for <lists+linux-hams@lfdr.de>; Thu, 21 Jan 2021 18:26:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388079AbhAURZk (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 21 Jan 2021 12:25:40 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:33479 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388447AbhAURZN (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 21 Jan 2021 12:25:13 -0500
Received: by mail-io1-f70.google.com with SMTP id m3so4576963ioy.0
        for <linux-hams@vger.kernel.org>; Thu, 21 Jan 2021 09:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=78ZaQKe6zAPg2gzOxVKmlEzg1IJiNYJcU6afzCCeGLU=;
        b=BNGmgpNWn+3NmHemUQXp5N7ODrWpyp8Y4Yk/7ECZIZMwANcySVQJ4cSVyMyfxCgowl
         82qvsNUX13vuT8ucKc1lWb72WQVQCux/JvqAKqMVozddBpy7voT3vFbY6Ey2RgIGkrKC
         1jFZn4ge7arKwW+gHlhPz0xhxwKT0f6tDeYyn8Y9PJPqVXTXWqpUsOFLXEYLTq33ucUi
         FxjnjoM+zsLNT7HXDzgfURqk6uaSeaBSASunxV39x34hfZQfDC0vgOqR5na/BzpT9HmH
         Kh79mrQLeeJP5MYTZJB/Y+ky93+HihDjtwXxL4+MoBo3W824MzHNKqvSSd5KzY/R9JNi
         Dq4w==
X-Gm-Message-State: AOAM533tx3CZIYUQFUH8csLHiLpubLpzzck+ciMgRiQGpjwg2FBm9PDr
        RmgfdJ7wB3DdVwWM6ZYF1AT62mi8x1tz418Wp9JG80/qfH1H
X-Google-Smtp-Source: ABdhPJxHlp9KzUVXcvQaW1Pz/zSNjoqk+vUle0gJqOlWKcH75q0VnpDY/mL99A5LNIW4Yod4bj5HF+ufU2wUH0fwOJKfHpBtP4lk
MIME-Version: 1.0
X-Received: by 2002:a92:58c2:: with SMTP id z63mr663764ilf.53.1611249872571;
 Thu, 21 Jan 2021 09:24:32 -0800 (PST)
Date:   Thu, 21 Jan 2021 09:24:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004c9e3505b96c58eb@google.com>
Subject: UBSAN: array-index-out-of-bounds in decode_data
From:   syzbot <syzbot+70ba6cae2f44c82dcb76@syzkaller.appspotmail.com>
To:     ajk@comnets.uni-bremen.de, davem@davemloft.net, kuba@kernel.org,
        linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    9791581c Merge tag 'for-5.11-rc4-tag' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11970b20d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=39701af622f054a9
dashboard link: https://syzkaller.appspot.com/bug?extid=70ba6cae2f44c82dcb76
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+70ba6cae2f44c82dcb76@syzkaller.appspotmail.com

UBSAN: array-index-out-of-bounds in drivers/net/hamradio/6pack.c:845:16
index 400 is out of range for type 'unsigned char [400]'
CPU: 0 PID: 24 Comm: kworker/u4:1 Not tainted 5.11.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events_unbound flush_to_ldisc
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
 __ubsan_handle_out_of_bounds.cold+0x62/0x6c lib/ubsan.c:356
 decode_data.part.0+0x2c8/0x2e0 drivers/net/hamradio/6pack.c:845
 decode_data drivers/net/hamradio/6pack.c:965 [inline]
 sixpack_decode drivers/net/hamradio/6pack.c:968 [inline]
 sixpack_receive_buf drivers/net/hamradio/6pack.c:458 [inline]
 sixpack_receive_buf+0xd8c/0x1320 drivers/net/hamradio/6pack.c:435
 tty_ldisc_receive_buf+0x14a/0x190 drivers/tty/tty_buffer.c:465
 tty_port_default_receive_buf+0x6e/0xa0 drivers/tty/tty_port.c:38
 receive_buf drivers/tty/tty_buffer.c:481 [inline]
 flush_to_ldisc+0x20d/0x380 drivers/tty/tty_buffer.c:533
 process_one_work+0x98d/0x15f0 kernel/workqueue.c:2275
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
 kthread+0x3b1/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
================================================================================
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 24 Comm: kworker/u4:1 Not tainted 5.11.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events_unbound flush_to_ldisc
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 panic+0x306/0x73d kernel/panic.c:231
 ubsan_epilogue+0x54/0x5a lib/ubsan.c:162
 __ubsan_handle_out_of_bounds.cold+0x62/0x6c lib/ubsan.c:356
 decode_data.part.0+0x2c8/0x2e0 drivers/net/hamradio/6pack.c:845
 decode_data drivers/net/hamradio/6pack.c:965 [inline]
 sixpack_decode drivers/net/hamradio/6pack.c:968 [inline]
 sixpack_receive_buf drivers/net/hamradio/6pack.c:458 [inline]
 sixpack_receive_buf+0xd8c/0x1320 drivers/net/hamradio/6pack.c:435
 tty_ldisc_receive_buf+0x14a/0x190 drivers/tty/tty_buffer.c:465
 tty_port_default_receive_buf+0x6e/0xa0 drivers/tty/tty_port.c:38
 receive_buf drivers/tty/tty_buffer.c:481 [inline]
 flush_to_ldisc+0x20d/0x380 drivers/tty/tty_buffer.c:533
 process_one_work+0x98d/0x15f0 kernel/workqueue.c:2275
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
 kthread+0x3b1/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
