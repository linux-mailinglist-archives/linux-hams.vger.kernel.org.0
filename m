Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFE4772EBEC
	for <lists+linux-hams@lfdr.de>; Tue, 13 Jun 2023 21:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjFMTY2 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 13 Jun 2023 15:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232830AbjFMTYO (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 13 Jun 2023 15:24:14 -0400
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA981BF3
        for <linux-hams@vger.kernel.org>; Tue, 13 Jun 2023 12:24:10 -0700 (PDT)
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-33d63df7cd7so66928025ab.0
        for <linux-hams@vger.kernel.org>; Tue, 13 Jun 2023 12:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686684250; x=1689276250;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SgHMOF8OeFwcQdJEJjLCGMA6VWATpWbNVoe8L+fE+wo=;
        b=EiyyGgvTkeRasrdbU654wnGl83Zw/T2IAigOvrTDvRQq2F7WwcfY/LXau4Hk/WkgXP
         ZUPn4zyuB6SmMje+VI3Dr0sE9YvlmsdmMw9XmHu7snRQh5MWjEtoCrbqKQDT1aRYH888
         uHURexsPHR6drbucZnY01/9kjmZR0vCqDSn+9mREovWuL90T9QMKpbMQoL4p+ftl8ydl
         VDKsrf9FOekNj4+9lhpN43p4w1WdJnNTPr+rv4Tv2pt9LxAHh04WBzoZTzHf03RSTTgK
         KtXb4yJq2QrfXy3P64c4YBeDMawFrW13etngkF70cpU+yfOfOeg9F41eRqXcn4cQYnu6
         r3rQ==
X-Gm-Message-State: AC+VfDwu+XtH+EsWDdMrJNAjWOCv4juf2EbdqNjKW25XECuZbQm1zy4U
        NmsTqdvWwCQ0wOUMfkBU+9hJDbGpVwVEcuZsWVTt6NuUS+1w
X-Google-Smtp-Source: ACHHUZ47f/tkHD73IJ2U64Up5h0iDVztKjFpwg4JcF+ze0rI49jXUJvSqYEyO+DPQoKt/oH5Mwkq5wKSoJB1tYC5rhBjRahxTCZn
MIME-Version: 1.0
X-Received: by 2002:a92:d3c2:0:b0:33e:6549:1fa3 with SMTP id
 c2-20020a92d3c2000000b0033e65491fa3mr6170175ilh.0.1686684250278; Tue, 13 Jun
 2023 12:24:10 -0700 (PDT)
Date:   Tue, 13 Jun 2023 12:24:10 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009612bc05fe07c73f@google.com>
Subject: [syzbot] [hams?] memory leak in nr_create (3)
From:   syzbot <syzbot+d327a1f3b12e1e206c16@syzkaller.appspotmail.com>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    33f2b5785a2b Merge tag 'drm-fixes-2023-06-09' of git://ano..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=127f61b3280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ee975febba574924
dashboard link: https://syzkaller.appspot.com/bug?extid=d327a1f3b12e1e206c16
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=110a6ef1280000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/33eb581c818f/disk-33f2b578.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0bcbec3a83cf/vmlinux-33f2b578.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0e577c2e8783/bzImage-33f2b578.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d327a1f3b12e1e206c16@syzkaller.appspotmail.com

2023/06/09 19:03:53 executed programs: 18
BUG: memory leak
unreferenced object 0xffff888114e76800 (size 2048):
  comm "syz-executor.3", pid 5156, jiffies 4294942146 (age 20.470s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    06 00 07 40 00 00 00 00 00 00 00 00 00 00 00 00  ...@............
  backtrace:
    [<ffffffff815461aa>] __do_kmalloc_node mm/slab_common.c:965 [inline]
    [<ffffffff815461aa>] __kmalloc+0x4a/0x120 mm/slab_common.c:979
    [<ffffffff83dbe78d>] kmalloc include/linux/slab.h:563 [inline]
    [<ffffffff83dbe78d>] sk_prot_alloc+0xcd/0x1b0 net/core/sock.c:2035
    [<ffffffff83dc0f06>] sk_alloc+0x36/0x300 net/core/sock.c:2088
    [<ffffffff843dea54>] nr_create+0x84/0x1c0 net/netrom/af_netrom.c:438
    [<ffffffff83db6e3e>] __sock_create+0x1de/0x300 net/socket.c:1547
    [<ffffffff83dba452>] sock_create net/socket.c:1598 [inline]
    [<ffffffff83dba452>] __sys_socket_create net/socket.c:1635 [inline]
    [<ffffffff83dba452>] __sys_socket_create net/socket.c:1620 [inline]
    [<ffffffff83dba452>] __sys_socket+0xa2/0x190 net/socket.c:1663
    [<ffffffff83dba55e>] __do_sys_socket net/socket.c:1676 [inline]
    [<ffffffff83dba55e>] __se_sys_socket net/socket.c:1674 [inline]
    [<ffffffff83dba55e>] __x64_sys_socket+0x1e/0x30 net/socket.c:1674
    [<ffffffff84a17749>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84a17749>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

BUG: memory leak
unreferenced object 0xffff8881185accc0 (size 32):
  comm "syz-executor.3", pid 5156, jiffies 4294942146 (age 20.470s)
  hex dump (first 32 bytes):
    a8 d1 a3 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff81545ac4>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1057
    [<ffffffff823168c2>] kmalloc include/linux/slab.h:559 [inline]
    [<ffffffff823168c2>] kzalloc include/linux/slab.h:680 [inline]
    [<ffffffff823168c2>] apparmor_sk_alloc_security+0x52/0xd0 security/apparmor/lsm.c:828
    [<ffffffff822dbe95>] security_sk_alloc+0x35/0x70 security/security.c:4372
    [<ffffffff83dbe7be>] sk_prot_alloc+0xfe/0x1b0 net/core/sock.c:2038
    [<ffffffff83dc0f06>] sk_alloc+0x36/0x300 net/core/sock.c:2088
    [<ffffffff843dea54>] nr_create+0x84/0x1c0 net/netrom/af_netrom.c:438
    [<ffffffff83db6e3e>] __sock_create+0x1de/0x300 net/socket.c:1547
    [<ffffffff83dba452>] sock_create net/socket.c:1598 [inline]
    [<ffffffff83dba452>] __sys_socket_create net/socket.c:1635 [inline]
    [<ffffffff83dba452>] __sys_socket_create net/socket.c:1620 [inline]
    [<ffffffff83dba452>] __sys_socket+0xa2/0x190 net/socket.c:1663
    [<ffffffff83dba55e>] __do_sys_socket net/socket.c:1676 [inline]
    [<ffffffff83dba55e>] __se_sys_socket net/socket.c:1674 [inline]
    [<ffffffff83dba55e>] __x64_sys_socket+0x1e/0x30 net/socket.c:1674
    [<ffffffff84a17749>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84a17749>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

BUG: memory leak
unreferenced object 0xffff888115867800 (size 2048):
  comm "syz-executor.0", pid 5159, jiffies 4294942269 (age 19.240s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    06 00 07 40 00 00 00 00 00 00 00 00 00 00 00 00  ...@............
  backtrace:
    [<ffffffff815461aa>] __do_kmalloc_node mm/slab_common.c:965 [inline]
    [<ffffffff815461aa>] __kmalloc+0x4a/0x120 mm/slab_common.c:979
    [<ffffffff83dbe78d>] kmalloc include/linux/slab.h:563 [inline]
    [<ffffffff83dbe78d>] sk_prot_alloc+0xcd/0x1b0 net/core/sock.c:2035
    [<ffffffff83dc0f06>] sk_alloc+0x36/0x300 net/core/sock.c:2088
    [<ffffffff843dea54>] nr_create+0x84/0x1c0 net/netrom/af_netrom.c:438
    [<ffffffff83db6e3e>] __sock_create+0x1de/0x300 net/socket.c:1547
    [<ffffffff83dba452>] sock_create net/socket.c:1598 [inline]
    [<ffffffff83dba452>] __sys_socket_create net/socket.c:1635 [inline]
    [<ffffffff83dba452>] __sys_socket_create net/socket.c:1620 [inline]
    [<ffffffff83dba452>] __sys_socket+0xa2/0x190 net/socket.c:1663
    [<ffffffff83dba55e>] __do_sys_socket net/socket.c:1676 [inline]
    [<ffffffff83dba55e>] __se_sys_socket net/socket.c:1674 [inline]
    [<ffffffff83dba55e>] __x64_sys_socket+0x1e/0x30 net/socket.c:1674
    [<ffffffff84a17749>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84a17749>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

BUG: memory leak
unreferenced object 0xffff88811896cae0 (size 32):
  comm "syz-executor.0", pid 5159, jiffies 4294942269 (age 19.240s)
  hex dump (first 32 bytes):
    a8 d1 a3 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff81545ac4>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1057
    [<ffffffff823168c2>] kmalloc include/linux/slab.h:559 [inline]
    [<ffffffff823168c2>] kzalloc include/linux/slab.h:680 [inline]
    [<ffffffff823168c2>] apparmor_sk_alloc_security+0x52/0xd0 security/apparmor/lsm.c:828
    [<ffffffff822dbe95>] security_sk_alloc+0x35/0x70 security/security.c:4372
    [<ffffffff83dbe7be>] sk_prot_alloc+0xfe/0x1b0 net/core/sock.c:2038
    [<ffffffff83dc0f06>] sk_alloc+0x36/0x300 net/core/sock.c:2088
    [<ffffffff843dea54>] nr_create+0x84/0x1c0 net/netrom/af_netrom.c:438
    [<ffffffff83db6e3e>] __sock_create+0x1de/0x300 net/socket.c:1547
    [<ffffffff83dba452>] sock_create net/socket.c:1598 [inline]
    [<ffffffff83dba452>] __sys_socket_create net/socket.c:1635 [inline]
    [<ffffffff83dba452>] __sys_socket_create net/socket.c:1620 [inline]
    [<ffffffff83dba452>] __sys_socket+0xa2/0x190 net/socket.c:1663
    [<ffffffff83dba55e>] __do_sys_socket net/socket.c:1676 [inline]
    [<ffffffff83dba55e>] __se_sys_socket net/socket.c:1674 [inline]
    [<ffffffff83dba55e>] __x64_sys_socket+0x1e/0x30 net/socket.c:1674
    [<ffffffff84a17749>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84a17749>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
