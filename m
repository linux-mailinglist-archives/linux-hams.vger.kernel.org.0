Return-Path: <linux-hams+bounces-371-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B07009159EE
	for <lists+linux-hams@lfdr.de>; Tue, 25 Jun 2024 00:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DF501F22465
	for <lists+linux-hams@lfdr.de>; Mon, 24 Jun 2024 22:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E571A0AFE;
	Mon, 24 Jun 2024 22:37:26 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF51613664B
	for <linux-hams@vger.kernel.org>; Mon, 24 Jun 2024 22:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719268646; cv=none; b=FiM9w5+LqLYnAH33Dld7mmEIpjEqT6SL/RwIDQ5uMw4DdkwiKVeGgoX286+95fJeepIRZxdO3nqSRPA8sGtl5fwbld2KzWujtDQC+eKkYUWmcRGXZ8Mz2eOJCyrZZKO+OFPTieSl3ldE0crGZHUqUr0bU8Z4cOUpyJkQSBFbwF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719268646; c=relaxed/simple;
	bh=JDkANpAzKfpwY21Y7NCdTNYTbCi8+eAWHQXouTPV7bA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qlwH5OkMTvMo+jbmBpBtfInlzb5JAELd9TvPSa5sTelUdkaBbYKidbA/O+Io/BcQdIqJXOBN/O2fD67xftelz9enKJVdm5UmdoiVXRH/fR3dPMiP5XTzbvrhz+v+RErBQ0fg4+rhf0WxmkIucUL2CsvCV8HDVpunio/l25mXV+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-7eafdb25dbbso614206039f.3
        for <linux-hams@vger.kernel.org>; Mon, 24 Jun 2024 15:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719268644; x=1719873444;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vhr9yhJD+Sp+Sh7U/H6JRx2Ajx13ocgLIDyrtpn2EFg=;
        b=bfqSOgj7KsK9AYoEqLWAliU7bD26vMvuFNxqq/GaKgaeWzdPlmNq5UojUsgcRQz2r1
         JEzMaDnlZh0U5/9eInRs58rycGCp0UpP4h2ZgDFIzOU8p///dsTJdM/wwDoEX5dvUBd8
         U7jUYyrTUiohPxD952HS7p210zUKtuZ98erLkHajtUkbp+qbMFlLE6qn8WJSzCz4m2N1
         lDJ+AfJDPFo4gVQ638rOAK/8o9GOsE9CqLb87dOs+xDVybmCqevRbEx6uBo3lvwdGLYx
         8MpaPjujqwBzRz1ou/FqvGE6qqA4Ox9LjJwMzYfg8DVZI4raaOX/yrmPkbZI2s7rvU1U
         blBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXUskCxIFP3bOxiVS3ehjqzFK5aMWSlfRGoaegexC6WzskFKZpfq+YzDqTDO1lF2TJEpCYM83/XvOiBqOqLj1ZU30EsExglBL/tQ==
X-Gm-Message-State: AOJu0YwlPh1N1NmocMooADDJtt5viBeR76KM1Cxx8ekZBQPfdkEC+MEJ
	2LMFmvd2g26j4HBdiIrESUJ2Scwyw2T++NRwFtwhVv3N0OVUYVl8FCdopELSQlVKahTNsPB/FD+
	qtyv8Rdujn5CLfcCEaVMT+EskWV0uoKCwcwuFl9rcw48GR8LfiSVuz8k=
X-Google-Smtp-Source: AGHT+IFw5Hh+qqyrlBrJGjC5aFTYZw7im9QZBrBYbN8R0LtLxwwBcOTLmXpiv+k8uQ/iJRNRoH5aRMAwnZ+SsqP2GFkGPfDNc6A+
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:13a1:b0:376:46d5:6583 with SMTP id
 e9e14a558f8ab-37646d56846mr5623545ab.5.1719268643971; Mon, 24 Jun 2024
 15:37:23 -0700 (PDT)
Date: Mon, 24 Jun 2024 15:37:23 -0700
In-Reply-To: <0000000000009ce262061963e5e4@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cc372e061baa6cd6@google.com>
Subject: Re: [syzbot] [hams?] WARNING: refcount bug in ax25_release (3)
From: syzbot <syzbot+33841dc6aa3e1d86b78a@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, jreuter@yaina.de, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    568ebdaba637 MAINTAINERS: adjust file entry in FREESCALE Q..
git tree:       net-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=132d6dea980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e78fc116033e0ab7
dashboard link: https://syzkaller.appspot.com/bug?extid=33841dc6aa3e1d86b78a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=121324ae980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1607cdda980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1d754ea220a6/disk-568ebdab.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/232f2545fca4/vmlinux-568ebdab.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6398bb41810d/bzImage-568ebdab.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+33841dc6aa3e1d86b78a@syzkaller.appspotmail.com

------------[ cut here ]------------
refcount_t: decrement hit 0; leaking memory.
WARNING: CPU: 0 PID: 5091 at lib/refcount.c:31 refcount_warn_saturate+0xfa/0x1d0 lib/refcount.c:31
Modules linked in:
CPU: 0 PID: 5091 Comm: syz-executor127 Not tainted 6.10.0-rc4-syzkaller-00875-g568ebdaba637 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/07/2024
RIP: 0010:refcount_warn_saturate+0xfa/0x1d0 lib/refcount.c:31
Code: b2 00 00 00 e8 37 51 e7 fc 5b 5d c3 cc cc cc cc e8 2b 51 e7 fc c6 05 d6 3f e9 0a 01 90 48 c7 c7 a0 97 1f 8c e8 67 81 a9 fc 90 <0f> 0b 90 90 eb d9 e8 0b 51 e7 fc c6 05 b3 3f e9 0a 01 90 48 c7 c7
RSP: 0018:ffffc900033df9c8 EFLAGS: 00010246
RAX: 9aea901d1711a200 RBX: ffff88807bf2c664 RCX: ffff8880287d9e00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: 0000000000000004 R08: ffffffff81585822 R09: fffffbfff1c39994
R10: dffffc0000000000 R11: fffffbfff1c39994 R12: ffff88807bf2c620
R13: 0000000000000000 R14: ffff88807bf2c664 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa556961110 CR3: 0000000075faa000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __refcount_dec include/linux/refcount.h:336 [inline]
 refcount_dec include/linux/refcount.h:351 [inline]
 ref_tracker_free+0x6af/0x7e0 lib/ref_tracker.c:236
 netdev_tracker_free include/linux/netdevice.h:4056 [inline]
 netdev_put include/linux/netdevice.h:4073 [inline]
 ax25_release+0x368/0x950 net/ax25/af_ax25.c:1069
 __sock_release net/socket.c:659 [inline]
 sock_close+0xbc/0x240 net/socket.c:1421
 __fput+0x406/0x8b0 fs/file_table.c:422
 task_work_run+0x24f/0x310 kernel/task_work.c:180
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0xa27/0x27e0 kernel/exit.c:874
 do_group_exit+0x207/0x2c0 kernel/exit.c:1023
 __do_sys_exit_group kernel/exit.c:1034 [inline]
 __se_sys_exit_group kernel/exit.c:1032 [inline]
 __x64_sys_exit_group+0x3f/0x40 kernel/exit.c:1032
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa5568e5c49
Code: Unable to access opcode bytes at 0x7fa5568e5c1f.
RSP: 002b:00007ffc83eaf9b8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fa5568e5c49
RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000000
RBP: 00007fa5569602b0 R08: ffffffffffffffb8 R09: 0000000000000006
R10: 00000000200003c0 R11: 0000000000000246 R12: 00007fa5569602b0
R13: 0000000000000000 R14: 00007fa556960d00 R15: 00007fa5568b6e90
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

