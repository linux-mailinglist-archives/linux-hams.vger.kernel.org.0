Return-Path: <linux-hams+bounces-599-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A39AEB38B23
	for <lists+linux-hams@lfdr.de>; Wed, 27 Aug 2025 22:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F3AB3B153E
	for <lists+linux-hams@lfdr.de>; Wed, 27 Aug 2025 20:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590E4305E19;
	Wed, 27 Aug 2025 20:48:41 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8778F2D73A1
	for <linux-hams@vger.kernel.org>; Wed, 27 Aug 2025 20:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756327721; cv=none; b=Q4ifd680faMcbL5PJiTje0lbWubIv4MyvIoPbfN/4STyYyoN4PQdfNzv5LeQzll5VzwQ9oU6TMdNATwkn+z6sbu9y/M7Y2XVpeSbA+dNKGvFXRGGaPvFpcP/xK6syCui6arTN3PP7flbInW6aR1HSxfRugLY4/B1AMQM3E1nC8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756327721; c=relaxed/simple;
	bh=edvZSjSWEk8fbjeMIWh3To18hcLWl/TICoSVP1AOEWM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=c+hv5GmnOHjsWLggJThqM3IrjvVixltTlkMbCbi1eAIRVIRJi1PFE4b8nAPLsCuxxTHY97aV6bCLRXAPFkj9Z7MiciEaB4CiN1+7TZFkflXKOwZ1au1QaRPEqU3qDihrJe8xV3gDuv2LxKk77Ki7GWXVlcD7iyPEoXR4ZVaIR1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-886e17c1bb2so32844639f.2
        for <linux-hams@vger.kernel.org>; Wed, 27 Aug 2025 13:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756327719; x=1756932519;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zyrX9Z/KC7Cbdb122yU6bg2CzRX3om+w+hw0YF5VEY0=;
        b=oYrDTJWkD7gs8QXqRBZXdZPt8ac8f8eWlT34INB0npnWua4o5nC5+E/33Skvkb+gRT
         23LWcjikmcGycP9hzsXW3n6+zSeGUKI213IrGn+RwGPZrvrTGpZOVydcroz9aU2jU0sn
         xdhL+RJrBlFscp+tCt5VRWzzLGmJ5HCFxxZY2LbYcw8nug9jdpacs84FYVi9ujV3ciNI
         lYDNtc5BTgniZf5+6LbgOkNX3CX8U6JPoFBEFuh3mnijFbot0RuFmVfevzR6mBLhzwJB
         4S+zkkGj2PjJIhYZraPPC2rQ7N0aCV6KEnkwgUBKgOnEfXqtOsKGpGKYriEJh24kSnOL
         BUqg==
X-Forwarded-Encrypted: i=1; AJvYcCUUd8uunP3nw/kybWGl4gDn7RuKn5Bt0reHQ/jUvsYhE0c8CyfcaBXYWVSzdrUV4/8IqOcRQfbhIc4G@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Q9sM88GgiDyNn2FOpbEYN5q9GtyF5UxP43WqNdQmF6O/AQfM
	hpREg2BI527GKJeWLJyHLPfxys2uRZCNDC2wFbzcyPFWLC9BlgMICsrmhRAMkAhqvfSXdWwiqGv
	yDt/PT+PBUbh5aaS0paaS+tHxJT9ASx+qBPchsW6rSLFT5CH7sNS4BYdDgbc=
X-Google-Smtp-Source: AGHT+IEGdUBOvw3aOLFfqqlPcbDlyODBfggIcODZuVnO1Q261R3O4jRxLGT7DdLRTpB2LCtk/spA0ZYpU7BGWqURHJuwmoLxKCva
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:461a:b0:3ef:72ce:3bd5 with SMTP id
 e9e14a558f8ab-3ef72ce3d1cmr84763505ab.13.1756327718754; Wed, 27 Aug 2025
 13:48:38 -0700 (PDT)
Date: Wed, 27 Aug 2025 13:48:38 -0700
In-Reply-To: <68af3e29.a70a0220.3cafd4.002e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68af6f26.a70a0220.3cafd4.0033.GAE@google.com>
Subject: Re: [syzbot] [hams?] general protection fault in rose_rt_ioctl
From: syzbot <syzbot+2eb8d1719f7cfcfa6840@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, eric.dumazet@gmail.com, 
	horms@kernel.org, kuba@kernel.org, kuniyu@google.com, 
	linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com, 
	takamitz@amazon.co.jp
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    ceb951552404 Merge branch 'introduce-refcount_t-for-refere..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=102cdef0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=292f3bc9f654adeb
dashboard link: https://syzkaller.appspot.com/bug?extid=2eb8d1719f7cfcfa6840
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14d12634580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17465c62580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7a0a7a3f8dbc/disk-ceb95155.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ec99703c0bdd/vmlinux-ceb95155.xz
kernel image: https://storage.googleapis.com/syzbot-assets/248da817e5e1/bzImage-ceb95155.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2eb8d1719f7cfcfa6840@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
CPU: 1 UID: 0 PID: 6018 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
RIP: 0010:rose_clear_routes net/rose/rose_route.c:565 [inline]
RIP: 0010:rose_rt_ioctl+0x162/0x1250 net/rose/rose_route.c:760
Code: 3f 31 ff 44 89 fe e8 3d de 52 f7 45 85 ff 74 0a e8 33 db 52 f7 e9 76 02 00 00 48 8b 44 24 28 48 8d 50 10 49 89 d7 49 c1 ef 03 <43> 0f b6 04 2f 84 c0 48 89 54 24 20 0f 85 87 02 00 00 44 0f b6 22
RSP: 0018:ffffc90003797ae0 EFLAGS: 00010202
RAX: 0000000000000000 RBX: ffff8880779a8c00 RCX: 0000000000000000
RDX: 0000000000000010 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90003797c10 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff520006f2f4c R12: dffffc0000000000
R13: dffffc0000000000 R14: ffff8880776ed680 R15: 0000000000000002
FS:  000055556a056500(0000) GS:ffff888125d1b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b31e63fff CR3: 0000000032b0a000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 rose_ioctl+0x3ce/0x8b0 net/rose/af_rose.c:1381
 sock_do_ioctl+0xd9/0x300 net/socket.c:1238
 sock_ioctl+0x576/0x790 net/socket.c:1359
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7faf4938ebe9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff8f03f7e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007faf495b5fa0 RCX: 00007faf4938ebe9
RDX: 0000000000000000 RSI: 00000000000089e4 RDI: 0000000000000008
RBP: 00007faf49411e19 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007faf495b5fa0 R14: 00007faf495b5fa0 R15: 0000000000000002
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:rose_clear_routes net/rose/rose_route.c:565 [inline]
RIP: 0010:rose_rt_ioctl+0x162/0x1250 net/rose/rose_route.c:760
Code: 3f 31 ff 44 89 fe e8 3d de 52 f7 45 85 ff 74 0a e8 33 db 52 f7 e9 76 02 00 00 48 8b 44 24 28 48 8d 50 10 49 89 d7 49 c1 ef 03 <43> 0f b6 04 2f 84 c0 48 89 54 24 20 0f 85 87 02 00 00 44 0f b6 22
RSP: 0018:ffffc90003797ae0 EFLAGS: 00010202
RAX: 0000000000000000 RBX: ffff8880779a8c00 RCX: 0000000000000000
RDX: 0000000000000010 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90003797c10 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff520006f2f4c R12: dffffc0000000000
R13: dffffc0000000000 R14: ffff8880776ed680 R15: 0000000000000002
FS:  000055556a056500(0000) GS:ffff888125d1b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b31e63fff CR3: 0000000032b0a000 CR4: 00000000003526f0
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	31 ff                	xor    %edi,%edi
   2:	44 89 fe             	mov    %r15d,%esi
   5:	e8 3d de 52 f7       	call   0xf752de47
   a:	45 85 ff             	test   %r15d,%r15d
   d:	74 0a                	je     0x19
   f:	e8 33 db 52 f7       	call   0xf752db47
  14:	e9 76 02 00 00       	jmp    0x28f
  19:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  1e:	48 8d 50 10          	lea    0x10(%rax),%rdx
  22:	49 89 d7             	mov    %rdx,%r15
  25:	49 c1 ef 03          	shr    $0x3,%r15
* 29:	43 0f b6 04 2f       	movzbl (%r15,%r13,1),%eax <-- trapping instruction
  2e:	84 c0                	test   %al,%al
  30:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
  35:	0f 85 87 02 00 00    	jne    0x2c2
  3b:	44 0f b6 22          	movzbl (%rdx),%r12d


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

