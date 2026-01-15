Return-Path: <linux-hams+bounces-747-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43404D28680
	for <lists+linux-hams@lfdr.de>; Thu, 15 Jan 2026 21:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA50D3021050
	for <lists+linux-hams@lfdr.de>; Thu, 15 Jan 2026 20:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4863203B6;
	Thu, 15 Jan 2026 20:27:24 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ot1-f80.google.com (mail-ot1-f80.google.com [209.85.210.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDB33191B1
	for <linux-hams@vger.kernel.org>; Thu, 15 Jan 2026 20:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768508844; cv=none; b=pbFMUVZC69mCOCRkaeLErXVEruwva0wZnT68OImCNuWyJQHqYWTHcRr1yaFlbZXi5tZ5jc9LNZy1ctqE9Zn/nCaE1nIEzVzbdoo/wkPOm8fcqw5s4ikfOg2by4LT1rneI/t/Aye3lONl9HJtSVgCrO/CldJd3e22EHsWKcTv4+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768508844; c=relaxed/simple;
	bh=UrdChwHP7pZmiMijK/W6RuSlsiLI+tzWeOnvP4VXQD8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Fnin6fAUZa+WkFAXCi1o9dNqMbh/v5k7GEZ03vOo6OuN9BRCdNxedliz0EbXUTWtDOWX1kgSvRLInI+wIWTADAnA67Qqj20bzynsf+EyeCFo9x4Ih6yR17pn5EIPdrT4a+m6MngVUWWIN9cWxnF3RIPv1j3VM65CLEfEeHOmtKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f80.google.com with SMTP id 46e09a7af769-7cfd0f67288so3070116a34.3
        for <linux-hams@vger.kernel.org>; Thu, 15 Jan 2026 12:27:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768508841; x=1769113641;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2n0HFZioqg65bnRVEd2ae+it8sFqH4gMon663JHkIzI=;
        b=roknGHj9a/U6nU6jyCjZuH7frOuFZRBD4Z8ydvx+7tdDrauHBQhU1iVWT4DxCp+d8C
         lk3GmyD63iFWkzrpYa6iYEXJWp0hYM91D3kdHFtCZWR94crhdyQ3/qS6gMjs8mNLX5xx
         fR/Tfw7oTqltFIq3okfCiwEaYlJTWWjY0SQ0PG9losrxsyK3SsyELSqnqr4BkyraTmYB
         jMSK/0DoKXzgEng6ubYfV7MyqDddX0Po6r41Cw8vZymOY5tkfTZj4bQP31kCj/AM+mwf
         JqX8zaxkWvwQn9Om5lNTdq+a2/GG4G2WVBRmGMHUywQ07ZvMnOXJFvLnNoehZaROsx0J
         I4AA==
X-Forwarded-Encrypted: i=1; AJvYcCWnBCrOA8ATeRtK5ayVc3r7d27pLkxX4+q0/dlVvUNCPXA3MukSUm7il1iU9dj72hDJ7uOtO17fd1xF@vger.kernel.org
X-Gm-Message-State: AOJu0YwaL3/pgroGevQH+TEiMzbqqEhMzH76AmRN4aYUeo+8jLS0Idv6
	GE+g8DtPVA0tAfKRG/oToIBNbVraxzCeFLrWK+M3waJdbEaU9VLwOazTLsLLNDtbNgAd+QIIZdY
	t+Ah7T8JBoFkkmFIYR7CuwJUegAzEHvQwrnjH3Hqo2/1JngMRSVoo7byjiYE=
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1349:b0:65d:d0b:fd3b with SMTP id
 006d021491bc7-6611888710cmr204061eaf.15.1768508841396; Thu, 15 Jan 2026
 12:27:21 -0800 (PST)
Date: Thu, 15 Jan 2026 12:27:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69694da9.050a0220.58bed.002a.GAE@google.com>
Subject: [syzbot] [hams?] KASAN: slab-use-after-free Read in nr_rt_ioctl
From: syzbot <syzbot+df52f4216bf7b4d768e7@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    be548645527a Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13a78a18580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7ac4cd61d548c1ef
dashboard link: https://syzkaller.appspot.com/bug?extid=df52f4216bf7b4d768e7
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1064ebc4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1751b1df980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/91e0bf046854/disk-be548645.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ff709482aab5/vmlinux-be548645.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2fe3e1268671/bzImage-be548645.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+df52f4216bf7b4d768e7@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in nr_dec_obs net/netrom/nr_route.c:471 [inline]
BUG: KASAN: slab-use-after-free in nr_rt_ioctl+0x599/0xfb0 net/netrom/nr_route.c:692
Read of size 2 at addr ffff88807ee561b2 by task syz-executor425/6336

CPU: 1 UID: 0 PID: 6336 Comm: syz-executor425 Not tainted 6.13.0-rc6-syzkaller-00290-gbe548645527a #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:489
 kasan_report+0x143/0x180 mm/kasan/report.c:602
 nr_dec_obs net/netrom/nr_route.c:471 [inline]
 nr_rt_ioctl+0x599/0xfb0 net/netrom/nr_route.c:692
 sock_do_ioctl+0x158/0x460 net/socket.c:1209
 sock_ioctl+0x626/0x8e0 net/socket.c:1328
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff6b4589869
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 31 1a 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd2b36d5d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007ff6b4589869
RDX: 0000000000000000 RSI: 00000000000089e2 RDI: 0000000000000005
RBP: 0000000000000000 R08: 00007ff6b45d7214 R09: 00007ff6b45d7214
R10: 00007ff6b45d7214 R11: 0000000000000246 R12: 00007ffd2b36d5fc
R13: 00007ffd2b36d630 R14: 00007ffd2b36d610 R15: 0000000000000067
 </TASK>

Allocated by task 6336:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x98/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x243/0x390 mm/slub.c:4329
 kmalloc_noprof include/linux/slab.h:901 [inline]
 nr_add_node+0x856/0x2230 net/netrom/nr_route.c:146
 nr_rt_ioctl+0xd43/0xfb0 net/netrom/nr_route.c:651
 sock_do_ioctl+0x158/0x460 net/socket.c:1209
 sock_ioctl+0x626/0x8e0 net/socket.c:1328
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6336:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:582
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x59/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4613 [inline]
 kfree+0x196/0x430 mm/slub.c:4761
 nr_dec_obs net/netrom/nr_route.c:469 [inline]
 nr_rt_ioctl+0x2e5/0xfb0 net/netrom/nr_route.c:692
 sock_do_ioctl+0x158/0x460 net/socket.c:1209
 sock_ioctl+0x626/0x8e0 net/socket.c:1328
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88807ee56180
 which belongs to the cache kmalloc-64 of size 64
The buggy address is located 50 bytes inside of
 freed 64-byte region [ffff88807ee56180, ffff88807ee561c0)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7ee56
ksm flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801ac418c0 ffffea0000cf4700 0000000000000007
raw: 0000000000000000 0000000080200020 00000001f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 5824, tgid 5824 (syz-executor425), ts 77902070664, free_ts 77575093775
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f3/0x230 mm/page_alloc.c:1558
 prep_new_page mm/page_alloc.c:1566 [inline]
 get_page_from_freelist+0x3651/0x37a0 mm/page_alloc.c:3476
 __alloc_pages_noprof+0x292/0x710 mm/page_alloc.c:4753
 alloc_pages_mpol_noprof+0x3e8/0x680 mm/mempolicy.c:2269
 alloc_slab_page+0x6a/0x110 mm/slub.c:2423
 allocate_slab+0x5a/0x2b0 mm/slub.c:2589
 new_slab mm/slub.c:2642 [inline]
 ___slab_alloc+0xc27/0x14a0 mm/slub.c:3830
 __slab_alloc+0x58/0xa0 mm/slub.c:3920
 __slab_alloc_node mm/slub.c:3995 [inline]
 slab_alloc_node mm/slub.c:4156 [inline]
 __kmalloc_cache_noprof+0x27b/0x390 mm/slub.c:4324
 kmalloc_noprof include/linux/slab.h:901 [inline]
 __netdev_adjacent_dev_insert+0x157/0x8d0 net/core/dev.c:7889
 __netdev_adjacent_dev_link_lists net/core/dev.c:7981 [inline]
 __netdev_adjacent_dev_link_neighbour net/core/dev.c:8010 [inline]
 __netdev_upper_dev_link+0x404/0x670 net/core/dev.c:8070
 netdev_upper_dev_link+0x9e/0xf0 net/core/dev.c:8116
 ipvlan_link_new+0x5cb/0xa30 drivers/net/ipvlan/ipvlan_main.c:621
 rtnl_newlink_create+0x2ee/0xa40 net/core/rtnetlink.c:3786
 __rtnl_newlink net/core/rtnetlink.c:3897 [inline]
 rtnl_newlink+0x1c7e/0x2210 net/core/rtnetlink.c:4012
 rtnetlink_rcv_msg+0x791/0xcf0 net/core/rtnetlink.c:6922
page last free pid 5829 tgid 5829 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_unref_page+0xd2c/0x1000 mm/page_alloc.c:2659
 __slab_free+0x2c2/0x380 mm/slub.c:4524
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x9a/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x14f/0x170 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x23/0x80 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4119 [inline]
 slab_alloc_node mm/slub.c:4168 [inline]
 __kmalloc_cache_noprof+0x1d9/0x390 mm/slub.c:4324
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 kset_create lib/kobject.c:965 [inline]
 kset_create_and_add+0x5b/0x170 lib/kobject.c:1008
 register_queue_kobjects net/core/net-sysfs.c:1890 [inline]
 netdev_register_kobject+0x181/0x2e0 net/core/net-sysfs.c:2143
 register_netdevice+0x12c5/0x1b00 net/core/dev.c:10618
 veth_newlink+0x3fd/0xb00 drivers/net/veth.c:1815
 rtnl_newlink_create+0x2ee/0xa40 net/core/rtnetlink.c:3786
 __rtnl_newlink net/core/rtnetlink.c:3897 [inline]
 rtnl_newlink+0x1c7e/0x2210 net/core/rtnetlink.c:4012
 rtnetlink_rcv_msg+0x791/0xcf0 net/core/rtnetlink.c:6922
 netlink_rcv_skb+0x1e3/0x430 net/netlink/af_netlink.c:2542
 netlink_unicast_kernel net/netlink/af_netlink.c:1321 [inline]
 netlink_unicast+0x7f6/0x990 net/netlink/af_netlink.c:1347
 netlink_sendmsg+0x8e4/0xcb0 net/netlink/af_netlink.c:1891

Memory state around the buggy address:
 ffff88807ee56080: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
 ffff88807ee56100: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
>ffff88807ee56180: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                                     ^
 ffff88807ee56200: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff88807ee56280: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
==================================================================


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

