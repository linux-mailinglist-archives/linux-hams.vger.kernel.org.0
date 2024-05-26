Return-Path: <linux-hams+bounces-330-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F608CF6D6
	for <lists+linux-hams@lfdr.de>; Mon, 27 May 2024 01:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 959E31C20D68
	for <lists+linux-hams@lfdr.de>; Sun, 26 May 2024 23:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69DCF13A26E;
	Sun, 26 May 2024 23:38:27 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83F82563
	for <linux-hams@vger.kernel.org>; Sun, 26 May 2024 23:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716766707; cv=none; b=EtSvtSvlvQA2uMW+nJpF+HC1AX6RVNTR5bOGxU5OcOpIvvZhJ8ht59lad4Ca5RejRTVyth8qJqfBYqeO/vL7/HFtPAq+xfayiuOnHG+ttGpTX9nGC3Qm/xoqDahGFBOWbY8sfUqbrK9rHRirRGTvFIXxHz6CmOGoay0uPv2f35U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716766707; c=relaxed/simple;
	bh=OgZQkhk4M3QzNUouobsj/ggKB851CXj5IFz03CSHFfQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MfJHT7iOvpuY7bj9IVH86/r3AK8usklXauCOsLbhPUgmqAUHYhsBj16SR6wcVw3IAk50+Sy/pxUfvfVZVfqQD8zJdzb3otfe8MpS2WM6A/YIeD9PKjQ5AmIu6PaJWbWrbz0q18pCeZTkIoXHYIgfWc/6nqE30MJOwzdU+NryqmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-7e1eb98f144so480409839f.0
        for <linux-hams@vger.kernel.org>; Sun, 26 May 2024 16:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716766705; x=1717371505;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NmpGlWcVb54KSVRxuIU/rPXHZN3svTORindBW+z2u1c=;
        b=FihYQjZVi3m8byG4h38QYi+cmFF7sqcIbWkD5M/NIawxWWhUOXNVD9mlWsFYEuBo22
         fy6ULh6vc/4yGuATBE66f2Q+Z2pmZHsYgtpi/h+2cSGm+irLCKoiM7YhXFj8dNli1UvS
         w86EQTXKDWGsXNRqfhCuJIqBg+Ayj5MJ2VDtjhAaZuwBlLxRGpu+d7tSvgLxbhsd7VPz
         88fhpTHfdof6T7D+4v9im7Ra6CR+r4sicBJqr9T/gj3Ka7ycJSUUQXKdZuc4NA3sHNXg
         k74bRc1c+0+B50VC+frsyQWCxXq7VaRgtGKwLeJu0lA/yjYj5RhlxKn/DbC9mRWVVioq
         5zGw==
X-Forwarded-Encrypted: i=1; AJvYcCXk6XrenX05C09uinxqhvPFfK7ZAX1g2Vm7+gRM6GfpgPWiYQu4xDFabETmwXDaSeTfYd34ZGIYooTmqinOn6z29hAoCOp3NHfMiA==
X-Gm-Message-State: AOJu0Ywrzhy7BQaVY0yjkd9yUQwZ50yluI34irYFRKvYIuxWPn3fbuuU
	eM2RrwwO/SutuYWFUnYQ3f7Fa8A80ogKnFZcfISCovnL00X1bax34hCQCqSfyw4MVyJ7wJVIS8J
	kCSBtoEqxy0UUp/Otl9uWLFdS8TLOc8TmnSin9h2Q3nvrbz6HrlsghIQ=
X-Google-Smtp-Source: AGHT+IF9mNXWQHEpg3LfjbpsWVS4Ypo8kEnu8VToq+k6LogrMkmiFwwJUggtNx9Lo2LUwt7FRGK9LplKJ76wjRqltIkhXWWnCUbm
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:60c4:b0:7de:e0de:bafb with SMTP id
 ca18e2360f4ac-7e8c66537ffmr22045939f.2.1716766704979; Sun, 26 May 2024
 16:38:24 -0700 (PDT)
Date: Sun, 26 May 2024 16:38:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009ce262061963e5e4@google.com>
Subject: [syzbot] [hams?] WARNING: refcount bug in ax25_release (3)
From: syzbot <syzbot+33841dc6aa3e1d86b78a@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, jreuter@yaina.de, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    56fb6f92854f Merge tag 'drm-next-2024-05-25' of https://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17e2d748980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=34e05c35ec964e75
dashboard link: https://syzkaller.appspot.com/bug?extid=33841dc6aa3e1d86b78a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6f3028c1d0fa/disk-56fb6f92.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/81203e55e7d0/vmlinux-56fb6f92.xz
kernel image: https://storage.googleapis.com/syzbot-assets/37bf21eee59d/bzImage-56fb6f92.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+33841dc6aa3e1d86b78a@syzkaller.appspotmail.com

------------[ cut here ]------------
refcount_t: decrement hit 0; leaking memory.
WARNING: CPU: 1 PID: 19983 at lib/refcount.c:31 refcount_warn_saturate+0xfa/0x1d0 lib/refcount.c:31
Modules linked in:
CPU: 1 PID: 19983 Comm: syz-executor.4 Not tainted 6.9.0-syzkaller-12277-g56fb6f92854f #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
RIP: 0010:refcount_warn_saturate+0xfa/0x1d0 lib/refcount.c:31
Code: b2 00 00 00 e8 27 b8 ef fc 5b 5d c3 cc cc cc cc e8 1b b8 ef fc c6 05 fc 35 f0 0a 01 90 48 c7 c7 a0 bf 1e 8c e8 47 e8 b1 fc 90 <0f> 0b 90 90 eb d9 e8 fb b7 ef fc c6 05 d9 35 f0 0a 01 90 48 c7 c7
RSP: 0018:ffffc9001b83f908 EFLAGS: 00010246
RAX: 2a301f9112304400 RBX: ffff88807b02a664 RCX: 0000000000040000
RDX: ffffc9000b33b000 RSI: 000000000000ca38 RDI: 000000000000ca39
RBP: 0000000000000004 R08: ffffffff815846c2 R09: 1ffffffff25ededb
R10: dffffc0000000000 R11: fffffbfff25ededc R12: ffff88807b02a620
R13: 0000000000000000 R14: ffff88807b02a664 R15: dffffc0000000000
FS:  00007f475dfe66c0(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff2b9901723 CR3: 000000007ac0a000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __refcount_dec include/linux/refcount.h:336 [inline]
 refcount_dec include/linux/refcount.h:351 [inline]
 ref_tracker_free+0x6af/0x7e0 lib/ref_tracker.c:236
 netdev_tracker_free include/linux/netdevice.h:4058 [inline]
 netdev_put include/linux/netdevice.h:4075 [inline]
 ax25_release+0x368/0x950 net/ax25/af_ax25.c:1069
 __sock_release net/socket.c:659 [inline]
 sock_close+0xbc/0x240 net/socket.c:1421
 __fput+0x406/0x8b0 fs/file_table.c:422
 task_work_run+0x24f/0x310 kernel/task_work.c:180
 get_signal+0x15e6/0x1740 kernel/signal.c:2681
 arch_do_signal_or_restart+0x96/0x860 arch/x86/kernel/signal.c:310
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0xc9/0x370 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f475d27cee9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 20 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f475dfe60c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000036
RAX: 0000000000000000 RBX: 00007f475d3ac050 RCX: 00007f475d27cee9
RDX: 0000000000000019 RSI: 0000000000000101 RDI: 0000000000000004
RBP: 00007f475d2c949e R08: 0000000000000010 R09: 0000000000000000
R10: 00000000200002c0 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000006e R14: 00007f475d3ac050 R15: 00007ffd8cfeadc8
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

