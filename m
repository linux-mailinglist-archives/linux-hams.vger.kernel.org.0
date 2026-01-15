Return-Path: <linux-hams+bounces-744-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E48FD2865F
	for <lists+linux-hams@lfdr.de>; Thu, 15 Jan 2026 21:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FABA300F19D
	for <lists+linux-hams@lfdr.de>; Thu, 15 Jan 2026 20:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D18322C8A;
	Thu, 15 Jan 2026 20:26:26 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E012E54BB
	for <linux-hams@vger.kernel.org>; Thu, 15 Jan 2026 20:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768508786; cv=none; b=PrvcoRdY46rNVz77BzdIp05PZX3qK9vgQRcO1s9WjAT1oMy67lIv6AWwFq/NFZn6cdHvEjoworocN2BxohGe+zNhxVo32C8p50vTyZpQ7PVU/kLb1RQtHanQgl2z10Q67KYj8ITnimzbPqRLgKmMUyw+hesNr4vSbsq32oP1sgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768508786; c=relaxed/simple;
	bh=2KQR2FaSiW89mvtfEUMQqvKDwhaDDfwrwnL6W59JH78=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=D1clpRVoGrNhG1I/HIKqgroUI6f7YWlxzE0hp910EW72FP+PkKji7NvJ25ZrDv1ZNkOw9NqD1X9ji9TbMaxN1wSQg2i4+SrD55/xPBjhjw0z3U+nfodqthK6dbfqV0LTX3z6wru0Jt17NYHKrE8PsjulxjPsXdVXznDjspLvmpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-65f30d38617so2663268eaf.1
        for <linux-hams@vger.kernel.org>; Thu, 15 Jan 2026 12:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768508783; x=1769113583;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YciuylvWouOfFUO/a9aUb04b/+eFp2Cck7QuFH19ZlY=;
        b=IJLDyNW/Wk5RJ3V395wJLFatOxFmRV9r8ceH5VQTjQq7pGAR+/shbG4PkLo1HZftSw
         HQDj29Fx7JCZQqIExyaJefMqynYbj9RG9kVMGqYVj+gDLmzNbg/A+EWJZxqKWwqMP6BI
         CnFfx7ShmVf3iEA3Tj1giynV8uWlVm7E/8L9jo23Hkrt5ohN3N+/b+fvv7rihMzZtjCo
         wvqxnk+/j1OvtYDSHr8b9uzW/AhxVg7IQ5+V6gxUQ7xou1c/GVWIHfG4+2d2JwsNM9SE
         d02P8nwG0VfXvEvgNmeuevczLUtb5pEzscxJkVJMqdn9N5dwpk/R0khfUNK0CP6HcoyC
         0f/A==
X-Forwarded-Encrypted: i=1; AJvYcCUVhxRNU+Zae1NeAuDRN3HUROo5FZsgk0+0qKGEeQDZPyy0dQB52MmmQyk44ZOYonkfYbVgeRXooo8+@vger.kernel.org
X-Gm-Message-State: AOJu0YyJkygyzBOfi5JGQtuoLl2bcaBhPNM6IeRAbN88qFn/hxjBvytf
	1fOF7/Oc0h7+b3KhwUd8qRdd5epzcYt+j3VcBLVvNB5EdYcisALondeT2z7ZVfd3vYjHj0IaDHO
	OCeTTnMDxe0dWs9p210+Lpn1az9HoFkvNv+rhlB/892EBtTFXCTw7W/nTxHc=
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:ec41:0:b0:65f:64eb:8ff5 with SMTP id
 006d021491bc7-66117a392c9mr346801eaf.81.1768508783537; Thu, 15 Jan 2026
 12:26:23 -0800 (PST)
Date: Thu, 15 Jan 2026 12:26:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69694d6f.050a0220.58bed.0027.GAE@google.com>
Subject: [syzbot] [hams?] general protection fault in rose_transmit_link (4)
From: syzbot <syzbot+d00f90e0af54102fb271@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6f3b6e91f720 Merge tag 'io_uring-6.18-20251016' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1714fdcd980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f3e7b5a3627a90dd
dashboard link: https://syzkaller.appspot.com/bug?extid=d00f90e0af54102fb271
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12483de2580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=148d5c58580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-6f3b6e91.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9a3a64b415ae/vmlinux-6f3b6e91.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1a864a92eaa0/bzImage-6f3b6e91.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d00f90e0af54102fb271@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000006: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000030-0x0000000000000037]
CPU: 1 UID: 0 PID: 6092 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:rose_transmit_link+0x32/0x5f0 net/rose/rose_link.c:266
Code: 41 55 41 54 55 48 89 fd 53 48 89 f3 48 83 ec 08 e8 23 80 69 f7 48 8d 7b 36 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 04 02 48 89 fa 83 e2 07 38 d0 7f 08 84 c0 0f 85 d8 04 00 00
RSP: 0018:ffffc90003f67a00 EFLAGS: 00010207
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff8a545988
RDX: 0000000000000006 RSI: ffffffff8a53b88d RDI: 0000000000000036
RBP: ffff88803bc14780 R08: 0000000000000005 R09: 000000000000001f
R10: 0000000000000013 R11: 0000000000000000 R12: ffff888028c2e000
R13: 0000000000000010 R14: 0000000000000013 R15: ffff88805181e41a
FS:  00007ff7e01a96c0(0000) GS:ffff8880d6ad6000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000562fe4bbada8 CR3: 000000003ceb8000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 rose_write_internal+0x2f6/0x1850 net/rose/rose_subr.c:198
 rose_release+0x1f1/0x740 net/rose/af_rose.c:671
 __sock_release+0xb3/0x270 net/socket.c:662
 sock_close+0x1c/0x30 net/socket.c:1455
 __fput+0x402/0xb70 fs/file_table.c:468
 task_work_run+0x150/0x240 kernel/task_work.c:227
 get_signal+0x1d0/0x26d0 kernel/signal.c:2807
 arch_do_signal_or_restart+0x8f/0x7c0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x85/0x130 kernel/entry/common.c:40
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 do_syscall_64+0x426/0xfa0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff7df38efc9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff7e01a9038 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: 0000000000000000 RBX: 00007ff7df5e5fa0 RCX: 00007ff7df38efc9
RDX: 0000000000000040 RSI: 0000200000000140 RDI: 0000000000000005
RBP: 00007ff7df411f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ff7df5e6038 R14: 00007ff7df5e5fa0 R15: 00007ffc5e3517f8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:rose_transmit_link+0x32/0x5f0 net/rose/rose_link.c:266
Code: 41 55 41 54 55 48 89 fd 53 48 89 f3 48 83 ec 08 e8 23 80 69 f7 48 8d 7b 36 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 04 02 48 89 fa 83 e2 07 38 d0 7f 08 84 c0 0f 85 d8 04 00 00
RSP: 0018:ffffc90003f67a00 EFLAGS: 00010207
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff8a545988
RDX: 0000000000000006 RSI: ffffffff8a53b88d RDI: 0000000000000036
RBP: ffff88803bc14780 R08: 0000000000000005 R09: 000000000000001f
R10: 0000000000000013 R11: 0000000000000000 R12: ffff888028c2e000
R13: 0000000000000010 R14: 0000000000000013 R15: ffff88805181e41a
FS:  00007ff7e01a96c0(0000) GS:ffff8880d6ad6000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000562fe4bbada8 CR3: 000000003ceb8000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	41 55                	push   %r13
   2:	41 54                	push   %r12
   4:	55                   	push   %rbp
   5:	48 89 fd             	mov    %rdi,%rbp
   8:	53                   	push   %rbx
   9:	48 89 f3             	mov    %rsi,%rbx
   c:	48 83 ec 08          	sub    $0x8,%rsp
  10:	e8 23 80 69 f7       	call   0xf7698038
  15:	48 8d 7b 36          	lea    0x36(%rbx),%rdi
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax <-- trapping instruction
  2e:	48 89 fa             	mov    %rdi,%rdx
  31:	83 e2 07             	and    $0x7,%edx
  34:	38 d0                	cmp    %dl,%al
  36:	7f 08                	jg     0x40
  38:	84 c0                	test   %al,%al
  3a:	0f 85 d8 04 00 00    	jne    0x518


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

