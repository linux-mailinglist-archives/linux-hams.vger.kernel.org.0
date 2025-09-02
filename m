Return-Path: <linux-hams+bounces-617-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA426B40BEF
	for <lists+linux-hams@lfdr.de>; Tue,  2 Sep 2025 19:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F6313B7B93
	for <lists+linux-hams@lfdr.de>; Tue,  2 Sep 2025 17:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26D8343211;
	Tue,  2 Sep 2025 17:24:33 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF92C3431F6
	for <linux-hams@vger.kernel.org>; Tue,  2 Sep 2025 17:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756833873; cv=none; b=HEE2bPQjhk9h5DDbC/E/BKzFnlk5RdBBFVWXbI7ZUSVUnXY9BBDYS+eURdDvDaef7+z5hYSKC8g2ljljwB8fqCGD9x24sHXOw6A8qAKCc3zD48nj0Uv5LB4sqJ9WBcEHUrqsFbeorxUEIWCMnCUhmU4B01EzFUci3PRy27YpElI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756833873; c=relaxed/simple;
	bh=r9KSlUAqtHp2GW8vv6y/Cz/b8ewlS56gHFEjxdFHR6k=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=W6Ih2jqkZB6hH+EGTOAsVchnwU/z4IyIGxzUP2KJuHUpsuyuOgumFF7+G9q2U911mEXi6yKupgjanuOM9jagR6jO3m9rcLeQKCYsLwL1hOxLFd1byL5dm1Xw/VXjTyapkssmShDtUoHZnSBoBsRMxxuCS8YDUg696SMkHzdXnbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3f0b5f6aa32so68787195ab.3
        for <linux-hams@vger.kernel.org>; Tue, 02 Sep 2025 10:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756833871; x=1757438671;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iUma2pL435+m+LJeRZecgruwf95ej2KARn6kielNE/Y=;
        b=FDMkP9IxXg+VVeltTdCstJX9fdRIRJd5D+FnpxqVF+bH8x+9PJ5AxCzxHoxaMDJxGS
         mbKg0oaP+zhqa5N02c9QWIBNghIow2IOyoCDMfWoVfN5aW+1b4W415yoynZ8wlT8IEmY
         hJ+E16uCJs4/d7wfynj6gEhlgdbUSqigPg7KqnSj5zg67MG6f0QnEP4VneGmTPsMBvfj
         sTT0Zyi2hk+lKFBAzDgz00dT+BWUtyEhpnTaFXMEFuI0l6HBm+7ZA8yQYoseiQlLY7Yw
         kGDJp/ClU/PwDDxhvuZWXWhQD/vYngIlcXo3cUxpWMO7psejoHj2YsXful/Wcm8z8GAx
         Omew==
X-Forwarded-Encrypted: i=1; AJvYcCVWaUtgKfK1Z1tXfi0Ftuv+BWriv5r+MYlDPOeXIHBUCDte//vDN0BwWZypZ6SxJDL6Diq85u4NvGbW@vger.kernel.org
X-Gm-Message-State: AOJu0YzmnGPxZw1dsNtHU2A4ae+t+U2YoVawl4ju1318r4NMsZcDwS8A
	AXRRF1xQTLTq7QkOgB/lMGp5tjkqVDJE57+SIV2DCiKNI37yN41BeQanpKTvwMnL4CtPLiHKdsp
	FUIAYy3gtemROzt/Ae78iugsgvREk6he+WwdkyHD63OPwUZRh2rDkv18gA7s=
X-Google-Smtp-Source: AGHT+IGe/LZznh6QHYuzY5n8pRqCjbwP8uuEjnaXH9wZGnRBDb5t26Nc/bad4amg7ZszYO+VLvo6VmdgB0gE0LUNWNg8fzMod4WA
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4702:b0:3f6:5688:a088 with SMTP id
 e9e14a558f8ab-3f65688a0c7mr60399325ab.10.1756833871128; Tue, 02 Sep 2025
 10:24:31 -0700 (PDT)
Date: Tue, 02 Sep 2025 10:24:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68b7284f.050a0220.3db4df.01d7.GAE@google.com>
Subject: [syzbot] [hams?] WARNING: ODEBUG bug in __run_timers (3)
From: syzbot <syzbot+7287222a6d88bdb559a7@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b320789d6883 Linux 6.17-rc4
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1204ae62580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=da02162f945f3311
dashboard link: https://syzkaller.appspot.com/bug?extid=7287222a6d88bdb559a7
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7a46ec41bf8b/disk-b320789d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/876c0ffbc199/vmlinux-b320789d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/aa352d634f96/bzImage-b320789d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7287222a6d88bdb559a7@syzkaller.appspotmail.com

------------[ cut here ]------------
ODEBUG: free active (active state 0) object: ffff88806ac3a490 object type: timer_list hint: rose_t0timer_expiry+0x0/0x150 include/linux/skbuff.h:2880
WARNING: CPU: 0 PID: 10082 at lib/debugobjects.c:612 debug_print_object+0x1a2/0x2b0 lib/debugobjects.c:612
Modules linked in:
CPU: 0 UID: 0 PID: 10082 Comm: syz.1.930 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
RIP: 0010:debug_print_object+0x1a2/0x2b0 lib/debugobjects.c:612
Code: fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 54 41 56 48 8b 14 dd 60 41 16 8c 4c 89 e6 48 c7 c7 e0 35 16 8c e8 cf 43 91 fc 90 <0f> 0b 90 90 58 83 05 46 ce c2 0b 01 48 83 c4 18 5b 5d 41 5c 41 5d
RSP: 0018:ffffc90000007a28 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000003 RCX: ffffffff817a3358
RDX: ffff888030b6bc00 RSI: ffffffff817a3365 RDI: 0000000000000001
RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff8c163c80
R13: ffffffff8bafedc0 R14: ffffffff8a7fa4f0 R15: ffffc90000007b28
FS:  00007f4947a166c0(0000) GS:ffff8881246b9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f49479f5d58 CR3: 0000000030c4f000 CR4: 0000000000350ef0
Call Trace:
 <IRQ>
 __debug_check_no_obj_freed lib/debugobjects.c:1099 [inline]
 debug_check_no_obj_freed+0x4b7/0x600 lib/debugobjects.c:1129
 slab_free_hook mm/slub.c:2348 [inline]
 slab_free mm/slub.c:4680 [inline]
 kfree+0x28f/0x4d0 mm/slub.c:4879
 rose_neigh_put include/net/rose.h:166 [inline]
 rose_timer_expiry+0x53f/0x630 net/rose/rose_timer.c:183
 call_timer_fn+0x19a/0x620 kernel/time/timer.c:1747
 expire_timers kernel/time/timer.c:1798 [inline]
 __run_timers+0x6ef/0x960 kernel/time/timer.c:2372
 __run_timer_base kernel/time/timer.c:2384 [inline]
 __run_timer_base kernel/time/timer.c:2376 [inline]
 run_timer_base+0x114/0x190 kernel/time/timer.c:2393
 run_timer_softirq+0x1a/0x40 kernel/time/timer.c:2403
 handle_softirqs+0x219/0x8e0 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0x109/0x170 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
 sysvec_apic_timer_interrupt+0xa4/0xc0 arch/x86/kernel/apic/apic.c:1050
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:152 [inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0x31/0x80 kernel/locking/spinlock.c:194
Code: f5 53 48 8b 74 24 10 48 89 fb 48 83 c7 18 e8 76 fe 02 f6 48 89 df e8 5e 52 03 f6 f7 c5 00 02 00 00 75 23 9c 58 f6 c4 02 75 37 <bf> 01 00 00 00 e8 05 4f f3 f5 65 8b 05 0e ac 41 08 85 c0 74 16 5b
RSP: 0018:ffffc9001fae7770 EFLAGS: 00000246
RAX: 0000000000000006 RBX: ffff888079171200 RCX: 0000000000000006
RDX: 0000000000000000 RSI: ffffffff8de4eebc RDI: ffffffff8c163080
RBP: 0000000000000246 R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff90ab8a97 R11: 0000000000000000 R12: ffff888033eb78c0
R13: 0000000000000246 R14: ffff8880791711e8 R15: ffffc9001fae78f8
 spin_unlock_irqrestore include/linux/spinlock.h:406 [inline]
 __skb_try_recv_datagram+0x172/0x4f0 net/core/datagram.c:267
 __unix_dgram_recvmsg+0x1bc/0xc30 net/unix/af_unix.c:2601
 unix_dgram_recvmsg+0xd0/0x110 net/unix/af_unix.c:2700
 sock_recvmsg_nosec net/socket.c:1065 [inline]
 ____sys_recvmsg+0x5f9/0x6b0 net/socket.c:2832
 ___sys_recvmsg+0x114/0x1a0 net/socket.c:2876
 do_recvmmsg+0x2fe/0x750 net/socket.c:2971
 __sys_recvmmsg net/socket.c:3045 [inline]
 __do_sys_recvmmsg net/socket.c:3068 [inline]
 __se_sys_recvmmsg net/socket.c:3061 [inline]
 __x64_sys_recvmmsg+0x22a/0x280 net/socket.c:3061
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4946b8ebe9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f4947a16038 EFLAGS: 00000246 ORIG_RAX: 000000000000012b
RAX: ffffffffffffffda RBX: 00007f4946dc6090 RCX: 00007f4946b8ebe9
RDX: 0000000000010106 RSI: 00002000000000c0 RDI: 0000000000000003
RBP: 00007f4946c11e19 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000002 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f4946dc6128 R14: 00007f4946dc6090 R15: 00007fff631b3388
 </TASK>
----------------
Code disassembly (best guess):
   0:	f5                   	cmc
   1:	53                   	push   %rbx
   2:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   7:	48 89 fb             	mov    %rdi,%rbx
   a:	48 83 c7 18          	add    $0x18,%rdi
   e:	e8 76 fe 02 f6       	call   0xf602fe89
  13:	48 89 df             	mov    %rbx,%rdi
  16:	e8 5e 52 03 f6       	call   0xf6035279
  1b:	f7 c5 00 02 00 00    	test   $0x200,%ebp
  21:	75 23                	jne    0x46
  23:	9c                   	pushf
  24:	58                   	pop    %rax
  25:	f6 c4 02             	test   $0x2,%ah
  28:	75 37                	jne    0x61
* 2a:	bf 01 00 00 00       	mov    $0x1,%edi <-- trapping instruction
  2f:	e8 05 4f f3 f5       	call   0xf5f34f39
  34:	65 8b 05 0e ac 41 08 	mov    %gs:0x841ac0e(%rip),%eax        # 0x841ac49
  3b:	85 c0                	test   %eax,%eax
  3d:	74 16                	je     0x55
  3f:	5b                   	pop    %rbx


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

