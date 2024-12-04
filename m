Return-Path: <linux-hams+bounces-446-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A9C9E3CEF
	for <lists+linux-hams@lfdr.de>; Wed,  4 Dec 2024 15:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48B4FB3B363
	for <lists+linux-hams@lfdr.de>; Wed,  4 Dec 2024 14:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED0B1F7086;
	Wed,  4 Dec 2024 14:07:31 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479E414884D
	for <linux-hams@vger.kernel.org>; Wed,  4 Dec 2024 14:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733321250; cv=none; b=ZMeuRr0NBvMWcOHalF5BZl6dCtHxyYqjipI1q8397a4NBYQUxJycc26zrjOR2UanWSEgdoNVbyPrC2onQfUdvOfU9wgSwdZ9wwKltfh8AgqBsjLZo25eT8vpatsfIAOmkcdq4sxpRXyly0/FT07mr4oy88iyoogRKJ2fPXDs9SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733321250; c=relaxed/simple;
	bh=khYYIL1AZfAz810shLu16zsq05uZ/Al2OnFFyM9OP3M=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ESX0ZbGXdXYOT2uh9LhyxlOcgfAUvln77y3ndDMEj7GkEI05R9dqKUBl2vP/yqJBR4W0JXph2TwQ+en6Upjt25Choa/LyGkEe88M/Eb6/Ju1zhh9tBs3h2odfTW0kXCHudnB6pvlKl/ooiMf/qfxUA9JCmF/Un59Maw75tevxDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3a763f42b35so77569415ab.1
        for <linux-hams@vger.kernel.org>; Wed, 04 Dec 2024 06:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733321248; x=1733926048;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x2Ud3SMcdhxbmWry956o5qPU/FAuzuJBhulUZrst800=;
        b=fjTKMQ5M5vTocr3aznnXqzj/qmIWYD42FbOJoL0Hl8Zm5hzvVf9/b8kRJDGaNeulP3
         Ojjq0QLSpkQ/UkBVAxJtiG96Pefq4QPJUJj0DNCa52jX+dB+sPcgXOUBvHUB6ZgiLhNr
         7l0Q6P8D+LFFOmvNmVsPrw794thVRnXnoOt+u8FIJE6xQfPa/ewYq4vLwOpcjnfY51F7
         xJrdb/qjIha9Eglby/fBhq/jvL1g3S/j8pT/JpQ8AGLuQ/lOsCl3jPjhncIimYYe+UT5
         /NbzBtOOftwyqbfp9h2qyPiCu7KiOJtiEakbxjpjU+7pkzX+uWJmZHF4tIE2HqJAVWmM
         SEdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf/XllDuyAYtMB9Jg4Daf3238DLwPUh8LAV5QyssqpA/339NnRRc74Gpea02SzUigDyK71NtssE3+P@vger.kernel.org
X-Gm-Message-State: AOJu0Yygya/A4jP35r6wkF0hczhmHAsSYDQ7YD7EHZw9hpN9oBF+mSUK
	b0dF1/EZzms6v7+O5m8XDavzaMhl3b62Z3oHUfjsC8zxmcxk6YL6XR1bNsRRzri4SfyPEv704yQ
	X/awRhR18rmezfvzXWuhxSOly3kpz4bXhO/WfCwo6fTZmFIvGLgah9pA=
X-Google-Smtp-Source: AGHT+IEwK46Ytw4aWCL8G5SMWrsrfyDiV8Cg33EL5pES+dlcrO2kpEydm1Tor8HWPEvDkZcP3R2SpYwLZ6zYfp+COfLG5hFpuGNM
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1947:b0:3a7:7d26:4ce4 with SMTP id
 e9e14a558f8ab-3a7fecc8ddemr49118315ab.9.1733321248416; Wed, 04 Dec 2024
 06:07:28 -0800 (PST)
Date: Wed, 04 Dec 2024 06:07:28 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67506220.050a0220.17bd51.006c.GAE@google.com>
Subject: [syzbot] [hams?] kernel BUG in nr_header
From: syzbot <syzbot+fb99d1b0c0f81d94a5e2@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fb24560f31f9 Merge tag 'lsm-pr-20240830' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10da2925980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=62bf36773c1381f1
dashboard link: https://syzkaller.appspot.com/bug?extid=fb99d1b0c0f81d94a5e2
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-fb24560f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c32289df6ffb/vmlinux-fb24560f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4010abcccd39/bzImage-fb24560f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fb99d1b0c0f81d94a5e2@syzkaller.appspotmail.com

skbuff: skb_under_panic: text:ffffffff89fd546a len:24 put:20 head:ffff88802a0b9b00 data:ffff88802a0b9afe tail:0x16 end:0x140 dev:nr0.2
------------[ cut here ]------------
kernel BUG at net/core/skbuff.c:205!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 2 UID: 0 PID: 5056 Comm: dhcpcd Not tainted 6.11.0-rc5-syzkaller-00207-gfb24560f31f9 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:skb_panic+0x157/0x1d0 net/core/skbuff.c:205
Code: b6 04 01 84 c0 74 04 3c 03 7e 21 8b 4b 70 41 56 45 89 e8 48 c7 c7 80 3f 7a 8c 41 57 56 48 89 ee 52 4c 89 e2 e8 0a ee 83 f8 90 <0f> 0b 4c 89 4c 24 10 48 89 54 24 08 48 89 34 24 e8 04 38 02 f9 4c
RSP: 0018:ffffc9000404f668 EFLAGS: 00010286
RAX: 0000000000000086 RBX: ffff88802335c780 RCX: ffffffff816c4a19
RDX: 0000000000000000 RSI: ffffffff816cde56 RDI: 0000000000000005
RBP: ffffffff8c7a52a0 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000201 R11: 0000000000000000 R12: ffffffff89fd546a
R13: 0000000000000014 R14: ffff88805209a130 R15: 0000000000000140
FS:  00007f4e4cfb9740(0000) GS:ffff88806a800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000203e9000 CR3: 0000000028878000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 000000000000000e DR6: 00000000ffff0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 skb_under_panic net/core/skbuff.c:215 [inline]
 skb_push+0xca/0xf0 net/core/skbuff.c:2617
 nr_header+0x2a/0x3e0 net/netrom/nr_dev.c:69
 dev_hard_header include/linux/netdevice.h:3159 [inline]
 vlan_dev_hard_header+0x13f/0x520 net/8021q/vlan_dev.c:83
 dev_hard_header include/linux/netdevice.h:3159 [inline]
 lapbeth_data_transmit+0x2a0/0x350 drivers/net/wan/lapbether.c:257
 lapb_data_transmit+0x93/0xc0 net/lapb/lapb_iface.c:447
 lapb_transmit_buffer+0xce/0x390 net/lapb/lapb_out.c:149
 lapb_send_control+0x1c8/0x320 net/lapb/lapb_subr.c:251
 lapb_establish_data_link+0xeb/0x110 net/lapb/lapb_out.c:163
 lapb_device_event+0x398/0x570 net/lapb/lapb_iface.c:512
 notifier_call_chain+0xb9/0x410 kernel/notifier.c:93
 call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:1994
 call_netdevice_notifiers_extack net/core/dev.c:2032 [inline]
 call_netdevice_notifiers net/core/dev.c:2046 [inline]
 __dev_notify_flags+0x12d/0x2e0 net/core/dev.c:8877
 dev_change_flags+0x10c/0x160 net/core/dev.c:8915
 devinet_ioctl+0x127a/0x1f10 net/ipv4/devinet.c:1177
 inet_ioctl+0x3aa/0x3f0 net/ipv4/af_inet.c:1003
 sock_do_ioctl+0x116/0x280 net/socket.c:1222
 sock_ioctl+0x22e/0x6c0 net/socket.c:1341
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __x64_sys_ioctl+0x193/0x220 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4e4d087d49
Code: 5c c3 48 8d 44 24 08 48 89 54 24 e0 48 89 44 24 c0 48 8d 44 24 d0 48 89 44 24 c8 b8 10 00 00 00 c7 44 24 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 76 10 48 8b 15 ae 60 0d 00 f7 d8 41 83 c8
RSP: 002b:00007ffeb96a1d98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f4e4cfb96c0 RCX: 00007f4e4d087d49
RDX: 00007ffeb96b1f88 RSI: 0000000000008914 RDI: 000000000000001b
RBP: 00007ffeb96c2148 R08: 00007ffeb96b1f48 R09: 00007ffeb96b1ef8
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffeb96b1f88 R14: 0000000000000028 R15: 0000000000008914
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:skb_panic+0x157/0x1d0 net/core/skbuff.c:205
Code: b6 04 01 84 c0 74 04 3c 03 7e 21 8b 4b 70 41 56 45 89 e8 48 c7 c7 80 3f 7a 8c 41 57 56 48 89 ee 52 4c 89 e2 e8 0a ee 83 f8 90 <0f> 0b 4c 89 4c 24 10 48 89 54 24 08 48 89 34 24 e8 04 38 02 f9 4c
RSP: 0018:ffffc9000404f668 EFLAGS: 00010286
RAX: 0000000000000086 RBX: ffff88802335c780 RCX: ffffffff816c4a19
RDX: 0000000000000000 RSI: ffffffff816cde56 RDI: 0000000000000005
RBP: ffffffff8c7a52a0 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000201 R11: 0000000000000000 R12: ffffffff89fd546a
R13: 0000000000000014 R14: ffff88805209a130 R15: 0000000000000140
FS:  00007f4e4cfb9740(0000) GS:ffff88806a800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000203e9000 CR3: 0000000028878000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 000000000000000e DR6: 00000000ffff0ff0 DR7: 0000000000000400


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

