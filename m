Return-Path: <linux-hams+bounces-707-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F98C78231
	for <lists+linux-hams@lfdr.de>; Fri, 21 Nov 2025 10:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9D8F5343DC4
	for <lists+linux-hams@lfdr.de>; Fri, 21 Nov 2025 09:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC4C3431E7;
	Fri, 21 Nov 2025 09:20:34 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EFF342C80
	for <linux-hams@vger.kernel.org>; Fri, 21 Nov 2025 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763716833; cv=none; b=GCgJzrHD2Nvf0/GgzgrJsxhMZIKEbldmmK3Q5Rmody6NKy5Ldeqd+AALSSAaE5lwVvPmbTbH5i9eoGusbRKgdYrLC3Ilnbuw/s/MC+bL9V9/zN6dw5vofg721t1wU/OaxFt3XzZ7RvoipC5PGCQz4CPOAjSRdVVpUzOQo2qpAMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763716833; c=relaxed/simple;
	bh=cL1RS04Vlbg5/isdthq1+y1Pb3yMmqLyOIAoOc+x41Q=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=f5GurzJBnNFLwA54nfu+y7QNOmKLuQcnaSOW9km45LQaxYt66neCTByzJ7wdO4O4CoKH6iufJzp/lBol81YEhjPlXSkLJYpfopFKfPFSXqFWKNm6L2RTk/BdQHmgtPnRnOKr6g/0q0X71QV7Q66Kr1f3oi8fgqyL7hwLX6bGgjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-94908fb82e0so154180239f.3
        for <linux-hams@vger.kernel.org>; Fri, 21 Nov 2025 01:20:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763716831; x=1764321631;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y57Wj2emBMA0I4GdDAAg7azio1mhTOb6C4GKyshX+cY=;
        b=ZfrnxviujwaU5i4VZaX30ybI4goaye0EMrQLcajCkAJzfSvDGSS7EMe9NnJU4YhXqL
         0KxzrfzVPg6Ib3cV2x4GesRIfyxXxmNeO7H63kD0aEvEu62RiQaHO1Ol7811XwQC4dIW
         Ddlsm5HE3DavliBgjsR5NTZmY3a+wtTjN5qAvPvMNYzq6qEDr2eZElqwgd7+23Y7sT4G
         Pi0WIzmxIc4EuFHH8mVmMNBBiH7BIomgA5NLNQHAuhdkZCPa3KV++UXnCHY19qokkcyB
         yieAJWvs3mlTuauqFnsNqTCgTFddLTy4EJfztq4+cO8PAbaXZ2Q8xbtdyD2+xAmdLF0W
         DEig==
X-Forwarded-Encrypted: i=1; AJvYcCWXhurXPa0rwwPYDVDn36Q2rVVWkHdkAmIVg9eYy0JtfWyMpWaQKe6VGpEUh7KY6cP/AlvzyjRs//8Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzXH/AlJrGBBG2qsnYX7cafklnuVJJeoTOGvKcEfPneYyOVHMN+
	Pb8HYOvdOgJ972V48AXp6TFrkQD6CKz4g9ZQYapNuc8P4DB6RGyGypa4i/paCagdC2nWEMo/Q45
	ZRBmX9CNZREoPKb2qMsN3ReTVqGNjMb+4b+tSsmvB43boEp9enj1e7z5ZLkk=
X-Google-Smtp-Source: AGHT+IEac/g/gQ2aIQk1kyITjzB+Ny9W97Qb1XEBlpBiMdpCj5JGgoWXsiWSPhL9UBO6t5j28HdwCKBQ/U0+5yIxQpUE1U/X72h0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3f06:b0:434:77cf:9df with SMTP id
 e9e14a558f8ab-435b8e790f1mr18431775ab.32.1763716831338; Fri, 21 Nov 2025
 01:20:31 -0800 (PST)
Date: Fri, 21 Nov 2025 01:20:31 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69202edf.a70a0220.2ea503.004c.GAE@google.com>
Subject: [syzbot] [hams?] WARNING: refcount bug in nr_del_neigh (2)
From: syzbot <syzbot+3f991c449d23d41216a2@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    407a06507c23 mlxsw: spectrum: Fix memory leak in mlxsw_sp_..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=10c11b42580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e46b8a1c645465a9
dashboard link: https://syzkaller.appspot.com/bug?extid=3f991c449d23d41216a2
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/62d11ae9564e/disk-407a0650.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/997cf054bfb9/vmlinux-407a0650.xz
kernel image: https://storage.googleapis.com/syzbot-assets/827a9f03aefe/bzImage-407a0650.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3f991c449d23d41216a2@syzkaller.appspotmail.com

------------[ cut here ]------------
refcount_t: underflow; use-after-free.
WARNING: CPU: 1 PID: 13218 at lib/refcount.c:28 refcount_warn_saturate+0x11a/0x1d0 lib/refcount.c:28
Modules linked in:
CPU: 1 UID: 0 PID: 13218 Comm: syz.3.2115 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
RIP: 0010:refcount_warn_saturate+0x11a/0x1d0 lib/refcount.c:28
Code: 40 58 be 8b e8 07 a4 f9 fc 90 0f 0b 90 90 eb d7 e8 1b 88 36 fd c6 05 b9 84 dd 0a 01 90 48 c7 c7 a0 58 be 8b e8 e7 a3 f9 fc 90 <0f> 0b 90 90 eb b7 e8 fb 87 36 fd c6 05 96 84 dd 0a 01 90 48 c7 c7
RSP: 0018:ffffc9001a9a7a58 EFLAGS: 00010246
RAX: df5324e680d95e00 RBX: 0000000000000003 RCX: ffff88802f279e40
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000002
RBP: 0000000000000000 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffffbfff1bba684 R12: dffffc0000000000
R13: ffffffff8c7f8848 R14: ffff888056783c3c R15: 0000000000000000
FS:  00007f267354c6c0(0000) GS:ffff88812623b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000007e2f0000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 nr_del_neigh+0x16c/0x1d0 net/netrom/nr_route.c:440
 nr_rt_ioctl+0xb1b/0xd50 net/netrom/nr_route.c:682
 sock_do_ioctl+0xdc/0x300 net/socket.c:1254
 sock_ioctl+0x576/0x790 net/socket.c:1375
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f267278f6c9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f267354c038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f26729e5fa0 RCX: 00007f267278f6c9
RDX: 00002000000000c0 RSI: 000000000000890c RDI: 0000000000000013
RBP: 00007f2672811f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f26729e6038 R14: 00007f26729e5fa0 R15: 00007fff2eed0978
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

