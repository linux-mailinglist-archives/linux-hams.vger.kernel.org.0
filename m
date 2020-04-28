Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8731BCC7B
	for <lists+linux-hams@lfdr.de>; Tue, 28 Apr 2020 21:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbgD1TiQ (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 28 Apr 2020 15:38:16 -0400
Received: from mail-il1-f200.google.com ([209.85.166.200]:51935 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728474AbgD1TiP (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 28 Apr 2020 15:38:15 -0400
Received: by mail-il1-f200.google.com with SMTP id p12so24593414iln.18
        for <linux-hams@vger.kernel.org>; Tue, 28 Apr 2020 12:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=eDc8NZEKFhvGM6dQ3kv1NE06m1a7uFN0dbkh7RytWGA=;
        b=QF+uQmfXJDizHlUXnRDPvv3wC4CrqnTRDQcJpqHy1LBKUM0MnIKeK6PVYK/O26o9ml
         BhtWY7V8/cOLTtl2T2yDgEaFE0uIloP6+VBmNmKzh4PcU0W+GTcoPxFQtcd0E+VUf7as
         MiplQd9mwa9iLagMJUkRs5K6cKT3Wh8pMMlekxE45HuiHoOdCLjyJQYezT2EP8tEhfpE
         RVKDLT0I8CM2orMY9f9RbG7+cv+CPwZ/Z/6jmwmrU0KqyHHVK5JxXaA+jfZNSSGYVmlp
         yWhPvBTxsaoxnEQY+hwUI7eCGlyoyAkVWZhW3jrdfsIr+KRtzIXUSQml21WhyuOexudn
         FlPw==
X-Gm-Message-State: AGi0PuaGjw82Snuh7ERtd3K9tcSRq42CuhBspQQ2oay+KUyljVtzCjax
        TpdcwCpTqeDwCYEKyHCfPyaQDX4/i4EQBm5J5m5WcDmsClgP
X-Google-Smtp-Source: APiQypIEFXc6pRBKZG5veE+k1ZMkPrZdlFSYtHt4b+M+rJ3vtx2X+beJ6e6vYmreUCgHtZcT7jfIf2I4WjT50f61CK5A5jAoWbFJ
MIME-Version: 1.0
X-Received: by 2002:a92:cb4c:: with SMTP id f12mr28882461ilq.263.1588102694984;
 Tue, 28 Apr 2020 12:38:14 -0700 (PDT)
Date:   Tue, 28 Apr 2020 12:38:14 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000000638405a45ef96d@google.com>
Subject: KMSAN: uninit-value in ax25_connect
From:   syzbot <syzbot+c82752228ed975b0a623@syzkaller.appspotmail.com>
To:     davem@davemloft.net, glider@google.com, jreuter@yaina.de,
        kuba@kernel.org, linux-hams@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        ralf@linux-mips.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    8bbbc5cf kmsan: don't compile memmove
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=14c92275e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cd0e9a6b0e555cc3
dashboard link: https://syzkaller.appspot.com/bug?extid=c82752228ed975b0a623
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11d74a75e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14694b45e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+c82752228ed975b0a623@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in ax25_connect+0x92d/0x1e00 net/ax25/af_ax25.c:1203
CPU: 1 PID: 11844 Comm: syz-executor808 Not tainted 5.6.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1c9/0x220 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x58/0xa0 mm/kmsan/kmsan_instr.c:215
 ax25_connect+0x92d/0x1e00 net/ax25/af_ax25.c:1203
 __sys_connect_file net/socket.c:1857 [inline]
 __sys_connect+0x6f7/0x770 net/socket.c:1874
 __do_sys_connect net/socket.c:1885 [inline]
 __se_sys_connect net/socket.c:1882 [inline]
 __ia32_sys_connect+0xdb/0x130 net/socket.c:1882
 do_syscall_32_irqs_on arch/x86/entry/common.c:339 [inline]
 do_fast_syscall_32+0x3c7/0x6e0 arch/x86/entry/common.c:410
 entry_SYSENTER_compat+0x68/0x77 arch/x86/entry/entry_64_compat.S:139
RIP: 0023:0xf7ff7d99
Code: 90 e8 0b 00 00 00 f3 90 0f ae e8 eb f9 8d 74 26 00 89 3c 24 c3 90 90 90 90 90 90 90 90 90 90 90 90 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 002b:00000000ff80833c EFLAGS: 00000246 ORIG_RAX: 000000000000016a
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000020000000
RDX: 000000000000003c RSI: 00000000080ea078 RDI: 00000000ff808390
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000

Local variable ----address@__sys_connect created at:
 __sys_connect+0xf7/0x770 net/socket.c:1870
 __sys_connect+0xf7/0x770 net/socket.c:1870
=====================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
