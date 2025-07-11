Return-Path: <linux-hams+bounces-540-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0B5B0206D
	for <lists+linux-hams@lfdr.de>; Fri, 11 Jul 2025 17:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5029547AFD
	for <lists+linux-hams@lfdr.de>; Fri, 11 Jul 2025 15:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DA52EAB97;
	Fri, 11 Jul 2025 15:28:37 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31B12EAB77
	for <linux-hams@vger.kernel.org>; Fri, 11 Jul 2025 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752247717; cv=none; b=S8duooSeuGFw+ypcjaGtOnd9LBV57UcrDLZLsVenzi3Tsc5O3MXtCZbJfS5K7IegHlAGWEX+95mBcCXb1mhmguitUlorhSud0iZbnK4zlRndv0Vf8588gXZPff9kQKU7+RXZaLzm3tMJ8rPQ+IaAITfhhQAdcxrTRhOKUHxTYQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752247717; c=relaxed/simple;
	bh=R8bzj8BnA7xeu1Ejvt/BsrBAhec9/uuK7hWClDnpXTk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=fHhUfCYuV4Dgswrwu/a0GOiMTrLs20nGoyZAXh3XzCOhtDVAxPlT4lE4ZrOkt0EZMTyMzrz/2LTgULAkZDcUaPDi8JBkRO3+X6MiASEDuqoabUSTsUGN0cVw4OsxKWRFmfXyZlA6SaL7EYflHZOMINu+HvXsXLbxdmbfJA9SqBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-86d0aa2dc99so237704539f.1
        for <linux-hams@vger.kernel.org>; Fri, 11 Jul 2025 08:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752247715; x=1752852515;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qUNjYbfnIGUDJ+fH4l34rKGE25OHoqzo1g6K2n9c1ag=;
        b=GtkoyVEhKVljrqidLJE7AUqZaoHF9RtKwCDv+Z6QHutRu72ZCKcWd1GE+29M1MNnjT
         d8UG3B0fYrDW0C82vra/tR77IFDWyC7vnZnzVek2lfFz/pOezBiDRb5kguInH4R6hH2j
         2pwfKfqM/MQj7Kz72Y+dQwhTh6l0HyHEqkpjz3lZb/HPbLwspvxRa7QJAD/mAzujQBGJ
         DFPX2LWvNPv7zRrgBlrXk2TbiS2gnxh5b7gwLdeP3qUhiUkQuFAHqtapH40NBJWwn6wM
         zrjK8RyWtlVLP0s5Rvt/teraO+1FC0ptrp0WavPo/lezN6UbWRLQRnYctJnCN0u8kyCr
         94zw==
X-Forwarded-Encrypted: i=1; AJvYcCWmC+69LMp7RbzqUm0NvLhHb3oAm9SHPdEh/fX9weZYQp9QKrLBB5FlahH7KSr5dP/WtEEGGd9F8JsU@vger.kernel.org
X-Gm-Message-State: AOJu0YyK3da9eyprdnTljD7HhBfUS6XEXGbCnKyOY0vBrrBXBceRXA92
	SrwMobboE9Z23QLqd7cETQCj45pLTTpELhYYSR/1Khwx9IgaAQfnd0xwmbOiBKbOf7VsvD/nYUb
	BjB9qMyCe/Cukf0XGT+YDGPeuexditCWyV0yeugtmWhPpOzCVPwwFVW7I7Pc=
X-Google-Smtp-Source: AGHT+IGYZn4X48OCo8kCHHADiKQ5Dln3PDwFXiplHCO//8GCHwE1OHJRDwnBPZ6U8h8w0sqyFj7hWoJrDVyjppe8t0yks4IxL3sv
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1589:b0:86d:60:702f with SMTP id
 ca18e2360f4ac-87977e8b783mr477224139f.0.1752247714648; Fri, 11 Jul 2025
 08:28:34 -0700 (PDT)
Date: Fri, 11 Jul 2025 08:28:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68712da2.a00a0220.26a83e.0052.GAE@google.com>
Subject: [syzbot] [hams?] WARNING: refcount bug in ax25_setsockopt
From: syzbot <syzbot+0ee4da32f91ae2a3f015@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	jreuter@yaina.de, kuba@kernel.org, linux-hams@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    faeefc173be4 sock: Correct error checking condition for (a..
git tree:       net-next
console output: https://syzkaller.appspot.com/x/log.txt?x=157b9c04580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eecd7902e39d7933
dashboard link: https://syzkaller.appspot.com/bug?extid=0ee4da32f91ae2a3f015
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15875398580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=137b9c04580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/25a813551e04/disk-faeefc17.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/06484bfac01b/vmlinux-faeefc17.xz
kernel image: https://storage.googleapis.com/syzbot-assets/df48cbb45ee8/bzImage-faeefc17.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0ee4da32f91ae2a3f015@syzkaller.appspotmail.com

------------[ cut here ]------------
refcount_t: addition on 0; use-after-free.
WARNING: CPU: 1 PID: 6151 at lib/refcount.c:25 refcount_warn_saturate+0x13a/0x1d0 lib/refcount.c:25
Modules linked in:
CPU: 1 UID: 0 PID: 6151 Comm: syz-executor223 Not tainted 6.15.0-rc1-syzkaller-00209-gfaeefc173be4 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:refcount_warn_saturate+0x13a/0x1d0 lib/refcount.c:25
Code: 00 6b a1 8c e8 17 87 7d fc 90 0f 0b 90 90 eb b9 e8 0b 65 be fc c6 05 94 dc 44 0b 01 90 48 c7 c7 60 6b a1 8c e8 f7 86 7d fc 90 <0f> 0b 90 90 eb 99 e8 eb 64 be fc c6 05 75 dc 44 0b 01 90 48 c7 c7
RSP: 0018:ffffc900046afc68 EFLAGS: 00010246
RAX: 975256fdc5619000 RBX: ffff888034835ac8 RCX: ffff888078041e00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: 0000000000000002 R08: ffffffff81828a12 R09: fffffbfff1d7a978
R10: dffffc0000000000 R11: fffffbfff1d7a978 R12: 1ffff110069bac05
R13: ffff888034835a00 R14: ffff888013018000 R15: ffff888034dd6028
FS:  000055556b9c9380(0000) GS:ffff888125093000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffdd88feca8 CR3: 0000000029122000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 ax25_setsockopt+0xbb7/0xf00 net/ax25/af_ax25.c:705
 do_sock_setsockopt+0x3b1/0x710 net/socket.c:2296
 __sys_setsockopt net/socket.c:2321 [inline]
 __do_sys_setsockopt net/socket.c:2327 [inline]
 __se_sys_setsockopt net/socket.c:2324 [inline]
 __x64_sys_setsockopt+0x1ee/0x280 net/socket.c:2324
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f59be6f7969
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 31 1a 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffdd88feda8 EFLAGS: 00000246 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 0000200000000000 RCX: 00007f59be6f7969
RDX: 0000000000000019 RSI: 0000000000000101 RDI: 0000000000000004
RBP: 0000000000000000 R08: 0000000000000010 R09: 00007f59be745214
R10: 0000200000000000 R11: 0000000000000246 R12: 00007ffdd88fedcc
R13: 00007ffdd88fee00 R14: 00007ffdd88fede0 R15: 0000000000000036
 </TASK>


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

