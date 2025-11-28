Return-Path: <linux-hams+bounces-713-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 520DFC9343A
	for <lists+linux-hams@lfdr.de>; Fri, 28 Nov 2025 23:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E9BB64E1AC7
	for <lists+linux-hams@lfdr.de>; Fri, 28 Nov 2025 22:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC292E7186;
	Fri, 28 Nov 2025 22:38:28 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DDF2DC776
	for <linux-hams@vger.kernel.org>; Fri, 28 Nov 2025 22:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764369508; cv=none; b=ShmfW2kOhPcz70f2pPHchBsk0Avj3Rfq3f9VQGDfAVNurFYlB71o/fG9+B2GxcqXxTU5R8VS9QTcxINFldZSdFn+jQga7uUY6DJfGKnmniAu0TlkPCAKaGTYAskuYE2+4BghsgN/GMOfmNi9J7UYIHLEA3MLxP1dmwfAogGMGB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764369508; c=relaxed/simple;
	bh=IG01os/BJWzzYylXx+a6YciL33bKhWMfQNEEViXDF7w=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Yy3g8C8LpQYmUwsBh6NelYiPGlJx4yEazoB/qjic7kFEMqJXn9YxxW8sBEq28DeWnt6X/UTx6lQsijWj81FOEX2F7ku7TN+oWPddgCIeujncmtSNyrcz0xSdgB2Ge2mPrwmvhlEdDwyGu3J78n6cyAT0fC4p318Cxu2njsBAVoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-435a145a992so11563205ab.3
        for <linux-hams@vger.kernel.org>; Fri, 28 Nov 2025 14:38:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764369506; x=1764974306;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IQzT7/5CE5IFqAe+p9Z+Zwso7DEm39odd+xM8BU3SoY=;
        b=ZovXWDIcR2tfS787N1XUeykan43dVbgEheocvNp4YxjUIwTJXKZgvFpJFCBTiVl+U7
         EYHwWVqtxEaDIdOo5+00oW3cYc77c7hj11gidDlFIQ1iW4EFCZKAtz8B2YNnLQAOI6XF
         BguCdA1ETa74mIb8dmufnKL4C/hiqPQRzECwOa4YuFOhD0A+ASd7C99BQ51ZgObJ9egW
         r3VKGFdFbkbuS2qyg91/sIe/WZoa8juDm/3jTpPWdsWVqpJc2TA5Em3XYdWU2CJfV3Te
         GkKUR7hH39eFsR7NQNvJrlYHE32H+N8MgxgPCy3Xm+KhDw75XYpjh3XQw1RVhUfEVkGE
         Iqqg==
X-Forwarded-Encrypted: i=1; AJvYcCVie9BfbkvHtn50AFiHJLkmskZgq2fNV0FDQ4VM6fBvBCKSufooMLozxN+MsAnQJ+aVKQezQiadqk/u@vger.kernel.org
X-Gm-Message-State: AOJu0YxRoRjVqMDFk+RHTUb12v9cwoASUB15mNlU+XSLKt1/V87vBetv
	52SbxBx77PSbm+bQ4Z3sKHDGKuO+ZPh/mAQkxAZU9p0Y9p5FMqg11O6EF5PGQXA5m0EvVeORWPc
	RL98tEXmKSMjU++M/eOmKZkghsckhlgKJtUE068HVfYNi7rifA7+0J8TUX1c=
X-Google-Smtp-Source: AGHT+IFbXkAMtwSczTrJvW3HXiXxzPLAkQDHdlpJC5A++P0p+D9L/FoWnUDNxbvCDDmYd2RQrrmsvGDFhgs51+b6iLXQh48Xd/Z7
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12ee:b0:42f:8b0f:bad2 with SMTP id
 e9e14a558f8ab-435b8c0908amr210202075ab.10.1764369506051; Fri, 28 Nov 2025
 14:38:26 -0800 (PST)
Date: Fri, 28 Nov 2025 14:38:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <692a2462.a70a0220.d98e3.0152.GAE@google.com>
Subject: [syzbot] [hams?] memory leak in nr_sendmsg
From: syzbot <syzbot+d7abc36bbbb6d7d40b58@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ac3fd01e4c1e Linux 6.18-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=117ab612580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f30cc590c4f6da44
dashboard link: https://syzkaller.appspot.com/bug?extid=d7abc36bbbb6d7d40b58
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13dd8f42580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=115bc612580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/308a482d95ee/disk-ac3fd01e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ed239243510b/vmlinux-ac3fd01e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/dd12243dca3d/bzImage-ac3fd01e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d7abc36bbbb6d7d40b58@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888129f35500 (size 240):
  comm "syz.0.17", pid 6119, jiffies 4294944652
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 10 52 28 81 88 ff ff  ..........R(....
  backtrace (crc 1456a3e4):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    kmem_cache_alloc_node_noprof+0x36f/0x5e0 mm/slub.c:5340
    __alloc_skb+0x203/0x240 net/core/skbuff.c:660
    alloc_skb include/linux/skbuff.h:1383 [inline]
    alloc_skb_with_frags+0x69/0x3f0 net/core/skbuff.c:6671
    sock_alloc_send_pskb+0x379/0x3e0 net/core/sock.c:2965
    sock_alloc_send_skb include/net/sock.h:1859 [inline]
    nr_sendmsg+0x287/0x450 net/netrom/af_netrom.c:1105
    sock_sendmsg_nosec net/socket.c:727 [inline]
    __sock_sendmsg net/socket.c:742 [inline]
    sock_write_iter+0x293/0x2a0 net/socket.c:1195
    new_sync_write fs/read_write.c:593 [inline]
    vfs_write+0x45d/0x710 fs/read_write.c:686
    ksys_write+0x143/0x170 fs/read_write.c:738
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xfa0 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff8881112c0000 (size 65536):
  comm "syz.0.17", pid 6119, jiffies 4294944652
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01  ................
    01 00 00 05 02 98 92 9c aa b0 40 02 00 00 00 00  ..........@.....
  backtrace (crc 75262837):
    ___kmalloc_large_node+0xc1/0x100 mm/slub.c:5604
    __kmalloc_large_node_noprof+0x18/0xa0 mm/slub.c:5622
    __do_kmalloc_node mm/slub.c:5638 [inline]
    __kmalloc_node_track_caller_noprof+0x412/0x6b0 mm/slub.c:5759
    kmalloc_reserve+0x96/0x180 net/core/skbuff.c:601
    __alloc_skb+0xd4/0x240 net/core/skbuff.c:670
    alloc_skb include/linux/skbuff.h:1383 [inline]
    alloc_skb_with_frags+0x69/0x3f0 net/core/skbuff.c:6671
    sock_alloc_send_pskb+0x379/0x3e0 net/core/sock.c:2965
    sock_alloc_send_skb include/net/sock.h:1859 [inline]
    nr_sendmsg+0x287/0x450 net/netrom/af_netrom.c:1105
    sock_sendmsg_nosec net/socket.c:727 [inline]
    __sock_sendmsg net/socket.c:742 [inline]
    sock_write_iter+0x293/0x2a0 net/socket.c:1195
    new_sync_write fs/read_write.c:593 [inline]
    vfs_write+0x45d/0x710 fs/read_write.c:686
    ksys_write+0x143/0x170 fs/read_write.c:738
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xfa0 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

