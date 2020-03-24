Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB80D19070D
	for <lists+linux-hams@lfdr.de>; Tue, 24 Mar 2020 09:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgCXIIQ (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 24 Mar 2020 04:08:16 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:41507 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbgCXIIM (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 24 Mar 2020 04:08:12 -0400
Received: by mail-io1-f69.google.com with SMTP id n15so14170956iog.8
        for <linux-hams@vger.kernel.org>; Tue, 24 Mar 2020 01:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=hHXlzX2YhutrAXAO/2d9zPrQ+gr2qIaq8tPdZuhbzNc=;
        b=hp8RoYGQ85UFbqZWnu6rZ8Pdw7f+HT/yYwrhku5Lk3GcKF5yOVmQZB4jozLYR1Akpn
         oLGOi27L56J0wwNpbjTt8N3NjLAWdjZoPdZ1YKIg8FNg4eUs66wMLiMeVk38lLMejCYW
         sY3Pu9K/I06acTRK63LVml5vikjqq7UKRkSu4KaG7JulvGHu7FSu73hjA/AMycgADkTx
         8Gusr7Q87ItncnzhhRGJe5N7S09DM8KGnGaiZecq/+rpU/D3H1Sp2094ByZeCGnOZ1aX
         yQzdbI1qMsrr/4s2yaaTEa1iQ6CpZ+/OaKVglmkRLwFumC4kRt1jZmeuiAVFwms/gXj6
         ZmOQ==
X-Gm-Message-State: ANhLgQ0mZ1UUvFHromXxLjC7Pd4u3zbi+K9SWu9hOklI3cNrq0x1diNB
        1u3VDuiejZilOzXebOrYEUOOsFVJ2AHEYdgyMr9ndqjr80CA
X-Google-Smtp-Source: ADFU+vveVCtjZFe00P8L3XaLLQqnYWVVmmBwqGMbFCFoBQ1tSt95B7Zv+mSEhz6cOYO8MKdGXim2hF2cI87+uh34wivVtdtgOkSM
MIME-Version: 1.0
X-Received: by 2002:a02:3808:: with SMTP id b8mr24506069jaa.136.1585037291793;
 Tue, 24 Mar 2020 01:08:11 -0700 (PDT)
Date:   Tue, 24 Mar 2020 01:08:11 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bbb17d05a19540cd@google.com>
Subject: KCSAN: data-race in decode_data.part.0 / sixpack_receive_buf
From:   syzbot <syzbot+673c2668e8c71c021637@syzkaller.appspotmail.com>
To:     ajk@comnets.uni-bremen.de, davem@davemloft.net, elver@google.com,
        linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    245a4300 Merge branch 'rcu/kcsan' into tip/locking/kcsan
git tree:       https://github.com/google/ktsan.git kcsan
console output: https://syzkaller.appspot.com/x/log.txt?x=16543101e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a4b9db179318d21f
dashboard link: https://syzkaller.appspot.com/bug?extid=673c2668e8c71c021637
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+673c2668e8c71c021637@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in decode_data.part.0 / sixpack_receive_buf

read to 0xffff8880a68aa8f6 of 1 bytes by task 8699 on cpu 1:
 decode_data.part.0+0x8d/0x120 drivers/net/hamradio/6pack.c:846
 decode_data drivers/net/hamradio/6pack.c:965 [inline]
 sixpack_decode drivers/net/hamradio/6pack.c:968 [inline]
 sixpack_receive_buf+0x901/0xb90 drivers/net/hamradio/6pack.c:458
 tiocsti drivers/tty/tty_io.c:2200 [inline]
 tty_ioctl+0xb75/0xe10 drivers/tty/tty_io.c:2576
 vfs_ioctl fs/ioctl.c:47 [inline]
 file_ioctl fs/ioctl.c:545 [inline]
 do_vfs_ioctl+0x84f/0xcf0 fs/ioctl.c:732
 ksys_ioctl+0xbd/0xe0 fs/ioctl.c:749
 __do_sys_ioctl fs/ioctl.c:756 [inline]
 __se_sys_ioctl fs/ioctl.c:754 [inline]
 __x64_sys_ioctl+0x4c/0x60 fs/ioctl.c:754
 do_syscall_64+0xcc/0x3a0 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

write to 0xffff8880a68aa8f6 of 1 bytes by task 8154 on cpu 0:
 decode_data drivers/net/hamradio/6pack.c:837 [inline]
 sixpack_decode drivers/net/hamradio/6pack.c:968 [inline]
 sixpack_receive_buf+0x40e/0xb90 drivers/net/hamradio/6pack.c:458
 tty_ldisc_receive_buf+0xeb/0xf0 drivers/tty/tty_buffer.c:465
 tty_port_default_receive_buf+0x87/0xd0 drivers/tty/tty_port.c:38
 receive_buf drivers/tty/tty_buffer.c:481 [inline]
 flush_to_ldisc+0x1d5/0x260 drivers/tty/tty_buffer.c:533
 process_one_work+0x3d4/0x890 kernel/workqueue.c:2264
 worker_thread+0xa0/0x800 kernel/workqueue.c:2410
 kthread+0x1d4/0x200 drivers/block/aoe/aoecmd.c:1253
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:352

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 PID: 8154 Comm: kworker/u4:5 Not tainted 5.5.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events_unbound flush_to_ldisc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
