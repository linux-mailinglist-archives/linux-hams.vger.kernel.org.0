Return-Path: <linux-hams+bounces-651-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6390BEDB90
	for <lists+linux-hams@lfdr.de>; Sat, 18 Oct 2025 22:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5F4E5E6490
	for <lists+linux-hams@lfdr.de>; Sat, 18 Oct 2025 20:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DB7288C81;
	Sat, 18 Oct 2025 20:37:33 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397C4285061
	for <linux-hams@vger.kernel.org>; Sat, 18 Oct 2025 20:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760819853; cv=none; b=jDnOTRDDMiCF0q/gom6rlYFt+mSE1CEynd/GS32MnTAjykzXOkkjnl+6op4wh8gQJeuIcyg1hp6ux6a8dUtfFW7647gVZApWjqsOPm4puktHaGuUPdU84SBeSukTbhWAvHL+rQ1SMQfk75muQMDMe9FhjVNLQrZZzMH0V9lfrwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760819853; c=relaxed/simple;
	bh=6+U73PiridVbXFoqwk23Grt5kZg8W4K1LpBJEawvu1o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cDGOwKUWcfNNvxzRqrMOq3XJaxFVjgWoL8jpSGbPSSr+nFuPS8LHVyLPiOuUrNS9mX81x+4Sy0c1K3IC/0RelXyLiJW9I/h7ofusUjgAgtWqjIyINub9N2t4w1io56ZWDocbzxtp3etDjxeLbT8SrFGI8SP5JgHVSCNmfEzDL2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-93e7f4f7bb1so138574639f.3
        for <linux-hams@vger.kernel.org>; Sat, 18 Oct 2025 13:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760819850; x=1761424650;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7VbPk30ZLB68vUzuPJjS4AT2ohpKdJsfVsSPZV5q8g=;
        b=K6UkIthR92TAf1oO4YE6h0Rg4QDgHzCfsi7+ruPCNC9JbtgRS78sr12xnqXJpyQ4kn
         GEic55t/MoJ3R3kgs1AWSA8Gt+yIl/kXvoUDSq0rZgdDgGPS3vu/45p0lIX18zAM9bOU
         8HyZsxicSk/Gbd/4PjFc+6W/l0ZFjuuZfzU4CZAkJLd4s2wrnKc7hq3KwNOnQrWLmo7n
         D77LibSzTRcoPpkrHv6Ml3L2qpJEoKUeimGb38os4mKitnsLxLi97lhIkIG4VsIbgxL1
         p8RjPMfFcdQfswWI6s3QfXkysr+Lc7nlTA7C42vED3bWIJm/C7ZNVy7it2uytDWY9I1D
         MFZw==
X-Forwarded-Encrypted: i=1; AJvYcCUnYm8LnyZM6Rp/v3po+rpJxyHImEtBh0sL4pjw/fpjuagvcmu8dh3ipu4i3wt5sXcatw4eGPkxgwKb@vger.kernel.org
X-Gm-Message-State: AOJu0YzbxEooMAYYsz/reRKlWkUHqZM/VQB73rMI9ZgE5T/GgDsNQF5Y
	Q234ygAjrtlScORX8j/Iq2CZYRw2bQN76LVw+mNBAjgMDLo1kQKnZqUJn5SjKFZfCcPN0ZXys4C
	pi+lVyXlIH3jFddjHfmXUomjoKyVkqNyj3BUln9wXL1mlZ6nUsFB7f42fG94=
X-Google-Smtp-Source: AGHT+IHsL3c89w44NpkSEtZ4YDWbfqnPNvrT7q7IUs5534AZ5W2iPmcIId9mVS27EUA98iln+ckPM77h6N+ARB+BUBXUOd3mX2Sb
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3fc9:b0:93f:fc9a:ef13 with SMTP id
 ca18e2360f4ac-93ffc9af656mr327886339f.0.1760819850285; Sat, 18 Oct 2025
 13:37:30 -0700 (PDT)
Date: Sat, 18 Oct 2025 13:37:30 -0700
In-Reply-To: <68d56f4d.050a0220.25d7ab.0047.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68f3fa8a.050a0220.91a22.0433.GAE@google.com>
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in nr_add_node
From: syzbot <syzbot+2860e75836a08b172755@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    f406055cb18c Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11cf767c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f3e7b5a3627a90dd
dashboard link: https://syzkaller.appspot.com/bug?extid=2860e75836a08b172755
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=155f1de2580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12b6b52f980000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-f406055c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a4db2a99bfb1/vmlinux-f406055c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/91d1ca420bac/bzImage-f406055c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2860e75836a08b172755@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in nr_add_node+0x25db/0x2c00 net/netrom/nr_route.c:248
Read of size 4 at addr ffff888054b8cc30 by task syz.3.7839/22393

CPU: 3 UID: 0 PID: 22393 Comm: syz.3.7839 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xcd/0x630 mm/kasan/report.c:482
 kasan_report+0xe0/0x110 mm/kasan/report.c:595
 nr_add_node+0x25db/0x2c00 net/netrom/nr_route.c:248
 nr_rt_ioctl+0x11b7/0x29b0 net/netrom/nr_route.c:651
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
RIP: 0033:0x7f7f4fb8efc9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7f509c5038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f7f4fde5fa0 RCX: 00007f7f4fb8efc9
RDX: 0000200000000280 RSI: 000000000000890b RDI: 0000000000000004
RBP: 00007f7f4fc11f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f7f4fde6038 R14: 00007f7f4fde5fa0 R15: 00007ffd1bd56f18
 </TASK>

Allocated by task 22380:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:56
 kasan_save_track+0x14/0x30 mm/kasan/common.c:77
 poison_kmalloc_redzone mm/kasan/common.c:400 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:417
 kmalloc_noprof include/linux/slab.h:957 [inline]
 nr_add_node+0xe4e/0x2c00 net/netrom/nr_route.c:146
 nr_rt_ioctl+0x11b7/0x29b0 net/netrom/nr_route.c:651
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

Freed by task 22393:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:56
 kasan_save_track+0x14/0x30 mm/kasan/common.c:77
 __kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:587
 kasan_save_free_info mm/kasan/kasan.h:406 [inline]
 poison_slab_object mm/kasan/common.c:252 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:284
 kasan_slab_free include/linux/kasan.h:234 [inline]
 slab_free_hook mm/slub.c:2523 [inline]
 slab_free mm/slub.c:6611 [inline]
 kfree+0x2b8/0x6d0 mm/slub.c:6818
 nr_neigh_put include/net/netrom.h:143 [inline]
 nr_neigh_put include/net/netrom.h:137 [inline]
 nr_add_node+0x23b9/0x2c00 net/netrom/nr_route.c:246
 nr_rt_ioctl+0x11b7/0x29b0 net/netrom/nr_route.c:651
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

The buggy address belongs to the object at ffff888054b8cc00
 which belongs to the cache kmalloc-64 of size 64
The buggy address is located 48 bytes inside of
 freed 64-byte region [ffff888054b8cc00, ffff888054b8cc40)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x54b8c
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801b4428c0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 6074, tgid 6074 (syz-executor), ts 126099390276, free_ts 126098882568
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1c0/0x230 mm/page_alloc.c:1850
 prep_new_page mm/page_alloc.c:1858 [inline]
 get_page_from_freelist+0x10a3/0x3a30 mm/page_alloc.c:3884
 __alloc_frozen_pages_noprof+0x25f/0x2470 mm/page_alloc.c:5183
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2416
 alloc_slab_page mm/slub.c:3039 [inline]
 allocate_slab mm/slub.c:3212 [inline]
 new_slab+0x24a/0x360 mm/slub.c:3266
 ___slab_alloc+0xdc4/0x1ae0 mm/slub.c:4636
 __slab_alloc.constprop.0+0x63/0x110 mm/slub.c:4755
 __slab_alloc_node mm/slub.c:4831 [inline]
 slab_alloc_node mm/slub.c:5253 [inline]
 __kmalloc_cache_noprof+0x477/0x780 mm/slub.c:5743
 kmalloc_noprof include/linux/slab.h:957 [inline]
 __team_option_inst_add+0xbf/0x330 drivers/net/team/team_core.c:160
 __team_option_inst_add_option drivers/net/team/team_core.c:182 [inline]
 __team_options_register+0x355/0x720 drivers/net/team/team_core.c:276
 team_options_register drivers/net/team/team_core.c:341 [inline]
 team_init+0x5c8/0xce0 drivers/net/team/team_core.c:1658
 register_netdevice+0x653/0x2270 net/core/dev.c:11221
 team_newlink+0xb4/0x190 drivers/net/team/team_core.c:2213
 rtnl_newlink_create net/core/rtnetlink.c:3833 [inline]
 __rtnl_newlink net/core/rtnetlink.c:3950 [inline]
 rtnl_newlink+0xc45/0x2000 net/core/rtnetlink.c:4065
 rtnetlink_rcv_msg+0x95e/0xe90 net/core/rtnetlink.c:6954
 netlink_rcv_skb+0x158/0x420 net/netlink/af_netlink.c:2552
page last free pid 6074 tgid 6074 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1394 [inline]
 __free_frozen_pages+0x7df/0x1160 mm/page_alloc.c:2906
 selinux_genfs_get_sid security/selinux/hooks.c:1357 [inline]
 inode_doinit_with_dentry+0xacb/0x12e0 security/selinux/hooks.c:1555
 selinux_d_instantiate+0x26/0x30 security/selinux/hooks.c:6523
 security_d_instantiate+0x142/0x1a0 security/security.c:4148
 d_instantiate+0x5c/0x90 fs/dcache.c:1961
 __debugfs_create_file+0x286/0x6b0 fs/debugfs/inode.c:459
 debugfs_create_file_full+0x41/0x60 fs/debugfs/inode.c:469
 ref_tracker_dir_debugfs+0x19d/0x290 lib/ref_tracker.c:441
 ref_tracker_dir_init include/linux/ref_tracker.h:70 [inline]
 alloc_netdev_mqs+0x314/0x1550 net/core/dev.c:11907
 rtnl_create_link+0xc08/0xf90 net/core/rtnetlink.c:3641
 rtnl_newlink_create net/core/rtnetlink.c:3823 [inline]
 __rtnl_newlink net/core/rtnetlink.c:3950 [inline]
 rtnl_newlink+0xb69/0x2000 net/core/rtnetlink.c:4065
 rtnetlink_rcv_msg+0x95e/0xe90 net/core/rtnetlink.c:6954
 netlink_rcv_skb+0x158/0x420 net/netlink/af_netlink.c:2552
 netlink_unicast_kernel net/netlink/af_netlink.c:1320 [inline]
 netlink_unicast+0x5aa/0x870 net/netlink/af_netlink.c:1346
 netlink_sendmsg+0x8c8/0xdd0 net/netlink/af_netlink.c:1896
 sock_sendmsg_nosec net/socket.c:727 [inline]
 __sock_sendmsg net/socket.c:742 [inline]
 __sys_sendto+0x4a3/0x520 net/socket.c:2244

Memory state around the buggy address:
 ffff888054b8cb00: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
 ffff888054b8cb80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>ffff888054b8cc00: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                                     ^
 ffff888054b8cc80: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
 ffff888054b8cd00: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

