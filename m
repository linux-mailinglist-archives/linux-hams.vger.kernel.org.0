Return-Path: <linux-hams+bounces-742-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D80D2849E
	for <lists+linux-hams@lfdr.de>; Thu, 15 Jan 2026 21:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CFF63058472
	for <lists+linux-hams@lfdr.de>; Thu, 15 Jan 2026 20:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E027631ED67;
	Thu, 15 Jan 2026 20:04:27 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-oo1-f77.google.com (mail-oo1-f77.google.com [209.85.161.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427E31D61BC
	for <linux-hams@vger.kernel.org>; Thu, 15 Jan 2026 20:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768507467; cv=none; b=StPu88XnUAk1tsAVH/82vTb2smqnxN6wkv8IFo/VA+ZrmdbdYV1ConoI4Rfn32SKambhQ/QVt67x15ZVSNdoAfVufgg/A1chK7DvfrjvnvFLlYSIyBMubINTuHu3sOGOV0SvxgxjDsRjr59Lcnm+T/9tUawU5WXwYGNbpcji/Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768507467; c=relaxed/simple;
	bh=rWBstfbzf1z7y4/sY4ZKVCSi1bwr3zlYRKvlnu4jqGw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=mPJ1TLh+3dWe7jdyhF6sAIVjhmPt6ZPPsMJd08MbEOiMSiuU+a3Z6gcN3H46stJ32Pvhfmb9XYLSLQ/hgNn/3ZmkmJAOOEqJ2U5mhD8ZvhRPuHlrYur2rO/dzxMa3aPS+zZcPNh3SVfrooG+8677QPrJBQW8t9tZyqjZz7K9JCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f77.google.com with SMTP id 006d021491bc7-6610d312bc3so4482392eaf.3
        for <linux-hams@vger.kernel.org>; Thu, 15 Jan 2026 12:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768507465; x=1769112265;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=crnuoM0pogZ/BTfdoYh6CD5pzgeMjwMohO7mQOnJJMY=;
        b=iQCqN2xUDSLTiEhGZrWVE5pbROag3aZKsLKLC6HERxcBJzSbjAXR2lMbu7WmytkUcR
         qu3H+qjyZ8v1UXrC7td+brGIM7cv/qr1Q7KEXnpkJvlogc0kWJXbRdhZyPHQ2ajHLwfN
         gZ3sYxRc0EOBU0diVs40UDLGdsk9cyzFD3mypLONLV9XavVd5pERpRu7vH/M9YIFmXr4
         uDtmSQ2Ji5zjiYUfbxzF88OFHfyh0yGDF7xv1G76X95L5voKe5wtMi3DKTF2VksRI7E3
         YhuTYcScgRHdThbpBPZLSJMUOjVXzQAueUNBAqQrW73X+/O9DfLC1MAhHgIYylMtiNx5
         1RUg==
X-Forwarded-Encrypted: i=1; AJvYcCWgf+kwXh/ucGL4nXQuaAhDMQTuoeJ1nD4pRs1iRXFDVb0HBGLw/CwmOBX2t85/74B7niTcGHGTnPbK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdk3i/BNg4JRML5EPnwHLBhHw4zY5onFhSbyYCKvO+Hds5Vi/3
	f5tbTzD6Jz5aq/+AwzPOD3AytVDncs/YCwojBQMwNb4uJR8hk0VKUAhp+sLwm61dO6s56QuUzaK
	TqYEaZTroNreubed+DEKjSwUFX4fQQEBSv4Mwm5L26vEVm6Vq3SxgoQsmVR0=
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f015:b0:659:9a49:8f55 with SMTP id
 006d021491bc7-6611796e949mr429357eaf.26.1768507465160; Thu, 15 Jan 2026
 12:04:25 -0800 (PST)
Date: Thu, 15 Jan 2026 12:04:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69694849.050a0220.58bed.0025.GAE@google.com>
Subject: [syzbot] [hams?] memory leak in nr_add_node
From: syzbot <syzbot+3f2d46b6e62b8dd546d3@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ea1013c15392 Merge tag 'bpf-fixes' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=147cb184580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d60836e327fd6756
dashboard link: https://syzkaller.appspot.com/bug?extid=3f2d46b6e62b8dd546d3
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c839b4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=127cb184580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5ee91238d53c/disk-ea1013c1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b8eb70b8203f/vmlinux-ea1013c1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3aed81c1b1c5/bzImage-ea1013c1.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/6e21e0104490/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3f2d46b6e62b8dd546d3@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88811b404b80 (size 64):
  comm "syz.0.17", pid 6071, jiffies 4294944872
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    cc cc cc cc cc cc 02 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc f88ea0ab):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    __kmalloc_cache_noprof+0x3b2/0x570 mm/slub.c:5771
    kmalloc_noprof include/linux/slab.h:957 [inline]
    nr_add_node+0x5bf/0x14b0 net/netrom/nr_route.c:146
    nr_rt_ioctl+0xc32/0x16e0 net/netrom/nr_route.c:651
    nr_ioctl+0x11f/0x1a0 net/netrom/af_netrom.c:1254
    sock_do_ioctl+0x84/0x1a0 net/socket.c:1254
    sock_ioctl+0x149/0x480 net/socket.c:1375
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff88811b404d00 (size 64):
  comm "syz.0.18", pid 6078, jiffies 4294944884
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    cc cc cc cc cc cc 02 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 8f10725b):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    __kmalloc_cache_noprof+0x3b2/0x570 mm/slub.c:5771
    kmalloc_noprof include/linux/slab.h:957 [inline]
    nr_add_node+0x5bf/0x14b0 net/netrom/nr_route.c:146
    nr_rt_ioctl+0xc32/0x16e0 net/netrom/nr_route.c:651
    nr_ioctl+0x11f/0x1a0 net/netrom/af_netrom.c:1254
    sock_do_ioctl+0x84/0x1a0 net/socket.c:1254
    sock_ioctl+0x149/0x480 net/socket.c:1375
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff88811b404f80 (size 64):
  comm "syz.0.19", pid 6086, jiffies 4294944897
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    cc cc cc cc cc cc 02 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 14b53e34):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    __kmalloc_cache_noprof+0x3b2/0x570 mm/slub.c:5771
    kmalloc_noprof include/linux/slab.h:957 [inline]
    nr_add_node+0x5bf/0x14b0 net/netrom/nr_route.c:146
    nr_rt_ioctl+0xc32/0x16e0 net/netrom/nr_route.c:651
    nr_ioctl+0x11f/0x1a0 net/netrom/af_netrom.c:1254
    sock_do_ioctl+0x84/0x1a0 net/socket.c:1254
    sock_ioctl+0x149/0x480 net/socket.c:1375
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
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

