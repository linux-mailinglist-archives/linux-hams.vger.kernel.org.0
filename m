Return-Path: <linux-hams+bounces-655-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3385BEDE6C
	for <lists+linux-hams@lfdr.de>; Sun, 19 Oct 2025 07:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E4F694E305B
	for <lists+linux-hams@lfdr.de>; Sun, 19 Oct 2025 05:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F356A21FF4A;
	Sun, 19 Oct 2025 05:21:05 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BBC21B9E2
	for <linux-hams@vger.kernel.org>; Sun, 19 Oct 2025 05:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760851265; cv=none; b=dNUwWEUy8+t9aSWCyY2VhxiPmelp+sKUZvdqC6y880hjA+hpT1boUuAB+Rth2dxtswW+Q3ToOco9qUNiTSoAHUGArTrAI0JibdLqtoBhBvLWkcZ/rB1K88rEwLp7ZbpAU7nbeUbvSy/TVh5Z7lK+S4oMNM0LfZJmYvr3aKJ9fT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760851265; c=relaxed/simple;
	bh=hQaHikWcVr2i7ZAH1RrJiLpW9x6EFM0CftXG8wfoV3w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ERVe+A0HhVA5toztqdvYbGIQogB+rNKNQyNSoqELEyZuFx02RKv0mUYYiJwwxBtyLU7OQ9MJon9+jFzRFOeBwNqVVqYoPfxUS65bd3W+7KRyfs7m97XVp7ajh5fCOzzVDWECjPD1a72XYPGA2HRWlfJBufXNiqmpLN0FAC4JyXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-940123e842bso179071139f.1
        for <linux-hams@vger.kernel.org>; Sat, 18 Oct 2025 22:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760851263; x=1761456063;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhzhcHUwo4ZyompuCoZqx2j3/YltPabeKiRa2l7zjes=;
        b=IK1W68WO3yYzuKYcZXwu3gBUpyGJquwwARKMph2hs/7Z5t34tCrjOxqk81ZpX0FB3K
         o9sQL9f2YHHzEJ62e4ulYt8FNrnTNVUuTHqWVixkT8wuyUFy/uBLy3G0btv9l+Ejxei7
         2N2qi/AmXV4H0sJdyMIKNzT/wkeaKUGipG9SScK1HrIOsiLagPPwOT4UWt7C8dlkpT3l
         FxtdFggPgBgzl1AtResH6xVctK3ZhR7/iNaIwRvjJYorwoJ2z7HnTiOAW7SMwZmhj3Fz
         uWfP9MRMjIKd8J4CYsaXV+fNEhHzMiDfsfDt72n3CSMV3QchCDENm3wMEiIoJDHEssmf
         mzlw==
X-Forwarded-Encrypted: i=1; AJvYcCW4iCLAXMm6uvYsNYU26D1thIy79Q/AfirXb2irUvZRH3glcxf04kxZfU9yzsSj+tzKWJVRYTWpzZT+@vger.kernel.org
X-Gm-Message-State: AOJu0YzLHt7UnfNxAW+DY5eYGZUiyxdhHC2cjAUPuyzd8m0UDJ1yCGD/
	opVCriOXH1HqyWpF2vNkq/T4hsjeu1RlsVLLxZeqbn77mt7amSHHFYwaflOnqX3SGs/Z0pmuUTz
	jC1Dt1Bp+xljNkfRzIREHROpYxAtZcRSd6kV7KUp5GY0B/VUFOcbrjrp7rIs=
X-Google-Smtp-Source: AGHT+IFuKYukxdLm/ppJg+C4mWBSwZpcLCiKXhLDI9Rn/aF9zGghOTi/S4VNihhWa9fjAeCDcj97w7AsKQUnxIbU5WruXjlyHZ07
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:489:b0:93e:2f4c:97be with SMTP id
 ca18e2360f4ac-93e7642f8e7mr1520982939f.15.1760851263078; Sat, 18 Oct 2025
 22:21:03 -0700 (PDT)
Date: Sat, 18 Oct 2025 22:21:03 -0700
In-Reply-To: <u5ck7lywwa3aa54w2wnfftzqfch3pr6eguayue5ljvsneefd5x@swt7jxbxaeur>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68f4753f.a70a0220.205af.0011.GAE@google.com>
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in nr_add_node
From: syzbot <syzbot+2860e75836a08b172755@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	listout@listout.xyz, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in nr_add_node

==================================================================
BUG: KASAN: slab-use-after-free in nr_add_node+0x25e5/0x2c10 net/netrom/nr_route.c:249
Read of size 4 at addr ffff88805466ddb0 by task syz.1.4225/15237

CPU: 2 UID: 0 PID: 15237 Comm: syz.1.4225 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xcd/0x630 mm/kasan/report.c:482
 kasan_report+0xe0/0x110 mm/kasan/report.c:595
 nr_add_node+0x25e5/0x2c10 net/netrom/nr_route.c:249
 nr_rt_ioctl+0x11b7/0x29b0 net/netrom/nr_route.c:653
 nr_ioctl+0x19a/0x2d0 net/netrom/af_netrom.c:1254
 sock_do_ioctl+0x118/0x280 net/socket.c:1254
 sock_ioctl+0x227/0x6b0 net/socket.c:1375
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4229d8efc9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f422ac41038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f4229fe5fa0 RCX: 00007f4229d8efc9
RDX: 0000200000000280 RSI: 000000000000890b RDI: 0000000000000004
RBP: 00007f4229e11f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f4229fe6038 R14: 00007f4229fe5fa0 R15: 00007ffe9d4efb98
 </TASK>

Allocated by task 15224:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:56
 kasan_save_track+0x14/0x30 mm/kasan/common.c:77
 poison_kmalloc_redzone mm/kasan/common.c:400 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:417
 kmalloc_noprof include/linux/slab.h:957 [inline]
 nr_add_node+0xe4e/0x2c10 net/netrom/nr_route.c:146
 nr_rt_ioctl+0x11b7/0x29b0 net/netrom/nr_route.c:653
 nr_ioctl+0x19a/0x2d0 net/netrom/af_netrom.c:1254
 sock_do_ioctl+0x118/0x280 net/socket.c:1254
 sock_ioctl+0x227/0x6b0 net/socket.c:1375
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 15237:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:56
 kasan_save_track+0x14/0x30 mm/kasan/common.c:77
 __kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:587
 kasan_save_free_info mm/kasan/kasan.h:406 [inline]
 poison_slab_object mm/kasan/common.c:252 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:284
 kasan_slab_free include/linux/kasan.h:234 [inline]
 slab_free_hook mm/slub.c:2530 [inline]
 slab_free mm/slub.c:6619 [inline]
 kfree+0x2b8/0x6d0 mm/slub.c:6826
 nr_neigh_put include/net/netrom.h:143 [inline]
 nr_neigh_put include/net/netrom.h:137 [inline]
 nr_add_node+0x23c3/0x2c10 net/netrom/nr_route.c:246
 nr_rt_ioctl+0x11b7/0x29b0 net/netrom/nr_route.c:653
 nr_ioctl+0x19a/0x2d0 net/netrom/af_netrom.c:1254
 sock_do_ioctl+0x118/0x280 net/socket.c:1254
 sock_ioctl+0x227/0x6b0 net/socket.c:1375
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88805466dd80
 which belongs to the cache kmalloc-64 of size 64
The buggy address is located 48 bytes inside of
 freed 64-byte region [ffff88805466dd80, ffff88805466ddc0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x5466d
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801b4428c0 ffffea0000867b00 dead000000000004
raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 5345, tgid 5345 (udevd), ts 58557594470, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1c0/0x230 mm/page_alloc.c:1850
 prep_new_page mm/page_alloc.c:1858 [inline]
 get_page_from_freelist+0x10a3/0x3a30 mm/page_alloc.c:3884
 __alloc_frozen_pages_noprof+0x25f/0x2470 mm/page_alloc.c:5183
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2416
 alloc_slab_page mm/slub.c:3046 [inline]
 allocate_slab mm/slub.c:3219 [inline]
 new_slab+0x24a/0x360 mm/slub.c:3273
 ___slab_alloc+0xdc4/0x1ae0 mm/slub.c:4643
 __slab_alloc.constprop.0+0x63/0x110 mm/slub.c:4762
 __slab_alloc_node mm/slub.c:4838 [inline]
 slab_alloc_node mm/slub.c:5260 [inline]
 __do_kmalloc_node mm/slub.c:5633 [inline]
 __kmalloc_noprof+0x501/0x880 mm/slub.c:5646
 kmalloc_noprof include/linux/slab.h:961 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 tomoyo_encode2+0x100/0x3e0 security/tomoyo/realpath.c:45
 tomoyo_encode+0x29/0x50 security/tomoyo/realpath.c:80
 tomoyo_realpath_from_path+0x18f/0x6e0 security/tomoyo/realpath.c:283
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_check_open_permission+0x2ab/0x3c0 security/tomoyo/file.c:771
 tomoyo_file_open+0x6b/0x90 security/tomoyo/tomoyo.c:334
 security_file_open+0x84/0x1e0 security/security.c:3183
 do_dentry_open+0x596/0x1530 fs/open.c:942
 vfs_open+0x82/0x3f0 fs/open.c:1097
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88805466dc80: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
 ffff88805466dd00: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
>ffff88805466dd80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                                     ^
 ffff88805466de00: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
 ffff88805466de80: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
==================================================================


Tested on:

commit:         1c64efcb Merge tag 'rust-rustfmt' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12a8bde2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f3e7b5a3627a90dd
dashboard link: https://syzkaller.appspot.com/bug?extid=2860e75836a08b172755
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13e20de2580000


