Return-Path: <linux-hams+bounces-743-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B10F5D285B6
	for <lists+linux-hams@lfdr.de>; Thu, 15 Jan 2026 21:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE6F9308952E
	for <lists+linux-hams@lfdr.de>; Thu, 15 Jan 2026 20:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D0631AA82;
	Thu, 15 Jan 2026 20:15:26 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-oa1-f79.google.com (mail-oa1-f79.google.com [209.85.160.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3CA218592
	for <linux-hams@vger.kernel.org>; Thu, 15 Jan 2026 20:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768508126; cv=none; b=jgFYI6cOreBbwACSvWk7+h7AhGDNIyF3zHrjPbJEsOxpfde7ZkPXIpJm1/56pfErEifVvFxNohGiD5YCzKE+fAugqhXYdiTuqIPMHODXYpsECnHWG1EC9u2l5U+ee/pInF4kvHSz2RjtusmjXuOvFzaZeC7EiIVuYjXaFGzK8Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768508126; c=relaxed/simple;
	bh=Z5acAB17dor4Dz1aGkef3WF4HTPuYFFSnSwJpAGhP+o=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Mc2GP0IXqanwRwAW8yMZc8Q7MMdNoi4pkQKm2JSkG1u9MkTc07IiUak1uk2FsXq0wyY5r0aCu0xzxKovJRlCHppj4ilIEDB2LKHS9oWy3BnPSTiEkac8ReKV0/SRafWW8EJlSjIOy8IHMxbZegrEgQObVc/sxdF4tXShWu1GMpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f79.google.com with SMTP id 586e51a60fabf-4040b9ea153so2299906fac.1
        for <linux-hams@vger.kernel.org>; Thu, 15 Jan 2026 12:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768508123; x=1769112923;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KiZTjRLBlsA3Wcygqju07dmSc4w9UmIri5a110gs5xc=;
        b=mXYiC+naxGHTPndCuiV8QJgpQoh+PVCF+MefyzrmHVxySEPVjWJxH6WRcuaZ0+s0Rn
         gjzVE3CsN2SGMUlhYQKWCAVZd+0HpsEKT7/WUIdqDXp1Mov6e2cgYyCqBFCdj3PlsZ3P
         ZbHBRL5DBJuB7Ko0pvQ8SuoHUtxm/uaFrJuq+XMt7ZN2xIjy/6KbbunbGaIytKf9M6Q7
         YnKfMSJhrRSx0rz58a8bGGSPCnM6LmRy8sdfzh5rLCT+Uq0XIYNBzTCXn7HxSbwaf6XF
         wORRJD7LMhC2iEMQbfQfC8RILIm4hYQpSNIoD0sHq1FrsW5H9hG2BPKk7DwKm7PmZ6aD
         V3Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXoLDGoFW1LsKGnG6sdeGp2/np8uRwmcHezxLtCHruPyeol+w5q/meXr+SklMxtNXOv3QnSkeEx6n+e@vger.kernel.org
X-Gm-Message-State: AOJu0YyihUkJFoXF9QtTDIAf9HljQ6I6VfQUjOvljTKhXudJDTWO4dtO
	nVeE4n6gjYqy2m/5YbzvXWvgM37/Dg93DJyLE89NDCEqOUytlHdV9KzC/Es5I9Gd+rFQXQe5ilw
	1lM7a1UBJNYT7obCBNSnaQqdZUGD1NQmay2FGQVDwr8KGMQlOD2I5u9zUiw4=
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c93:b0:65f:6582:6b23 with SMTP id
 006d021491bc7-6611898345cmr182581eaf.38.1768508123564; Thu, 15 Jan 2026
 12:15:23 -0800 (PST)
Date: Thu, 15 Jan 2026 12:15:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69694adb.050a0220.58bed.0026.GAE@google.com>
Subject: [syzbot] [hams?] KASAN: slab-use-after-free Write in rose_send_frame
From: syzbot <syzbot+9cc08d5dcb1fc8feee76@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    46a51f4f5eda Merge tag 'for-v6.17-rc' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17204e42580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f5b21423ca3f0a96
dashboard link: https://syzkaller.appspot.com/bug?extid=9cc08d5dcb1fc8feee76
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e7338673c380/disk-46a51f4f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b3b702fe6d97/vmlinux-46a51f4f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7c58e7a0c4c8/bzImage-46a51f4f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9cc08d5dcb1fc8feee76@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in rose_send_frame+0x131/0x220 net/rose/rose_link.c:106
Write of size 8 at addr ffff88805a57c018 by task ktimers/0/16

CPU: 0 UID: 0 PID: 16 Comm: ktimers/0 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/18/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 rose_send_frame+0x131/0x220 net/rose/rose_link.c:106
 rose_transmit_restart_request net/rose/rose_link.c:198 [inline]
 rose_t0timer_expiry+0x143/0x360 net/rose/rose_link.c:83
 call_timer_fn+0x17e/0x5f0 kernel/time/timer.c:1747
 expire_timers kernel/time/timer.c:1798 [inline]
 __run_timers kernel/time/timer.c:2372 [inline]
 __run_timer_base+0x648/0x970 kernel/time/timer.c:2384
 run_timer_base kernel/time/timer.c:2393 [inline]
 run_timer_softirq+0xb7/0x180 kernel/time/timer.c:2403
 handle_softirqs+0x22f/0x710 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 run_ktimerd+0xcf/0x190 kernel/softirq.c:1043
 smpboot_thread_fn+0x53f/0xa60 kernel/smpboot.c:160
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x439/0x7d0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 11663:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:388 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:405
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x1a8/0x320 mm/slub.c:4407
 kmalloc_noprof include/linux/slab.h:905 [inline]
 rose_add_node+0x26f/0xf20 net/rose/rose_route.c:85
 rose_rt_ioctl+0xd74/0x1300 net/rose/rose_route.c:748
 rose_ioctl+0x3ce/0x8b0 net/rose/af_rose.c:1381
 sock_do_ioctl+0xdc/0x300 net/socket.c:1238
 sock_ioctl+0x579/0x790 net/socket.c:1359
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 29:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:243 [inline]
 __kasan_slab_free+0x5b/0x80 mm/kasan/common.c:275
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2422 [inline]
 slab_free mm/slub.c:4695 [inline]
 kfree+0x195/0x550 mm/slub.c:4894
 rose_neigh_put include/net/rose.h:166 [inline]
 rose_timer_expiry+0x4cb/0x600 net/rose/rose_timer.c:183
 call_timer_fn+0x17e/0x5f0 kernel/time/timer.c:1747
 expire_timers kernel/time/timer.c:1798 [inline]
 __run_timers kernel/time/timer.c:2372 [inline]
 __run_timer_base+0x648/0x970 kernel/time/timer.c:2384
 run_timer_base kernel/time/timer.c:2393 [inline]
 run_timer_softirq+0xb7/0x180 kernel/time/timer.c:2403
 handle_softirqs+0x22f/0x710 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 run_ktimerd+0xcf/0x190 kernel/softirq.c:1043
 smpboot_thread_fn+0x53f/0xa60 kernel/smpboot.c:160
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x439/0x7d0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88805a57c000
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 24 bytes inside of
 freed 512-byte region [ffff88805a57c000, ffff88805a57c200)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff88805a57f800 pfn:0x5a57c
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000240(workingset|head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000240 ffff888019841c80 ffffea0000a34c10 ffffea00008f7510
raw: ffff88805a57f800 000000000010000c 00000000f5000000 0000000000000000
head: 0080000000000240 ffff888019841c80 ffffea0000a34c10 ffffea00008f7510
head: ffff88805a57f800 000000000010000c 00000000f5000000 0000000000000000
head: 0080000000000002 ffffea0001695f01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5851, tgid 5851 (syz-executor), ts 123546082948, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1851
 prep_new_page mm/page_alloc.c:1859 [inline]
 get_page_from_freelist+0x2119/0x21b0 mm/page_alloc.c:3858
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5148
 alloc_pages_mpol+0xd1/0x380 mm/mempolicy.c:2416
 alloc_slab_page mm/slub.c:2492 [inline]
 allocate_slab+0x8a/0x370 mm/slub.c:2660
 new_slab mm/slub.c:2714 [inline]
 ___slab_alloc+0x8d1/0xdc0 mm/slub.c:3901
 __slab_alloc mm/slub.c:3992 [inline]
 __slab_alloc_node mm/slub.c:4067 [inline]
 slab_alloc_node mm/slub.c:4228 [inline]
 __kmalloc_cache_noprof+0xe6/0x320 mm/slub.c:4402
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 mca_alloc net/ipv6/mcast.c:876 [inline]
 __ipv6_dev_mc_inc+0x44f/0xa50 net/ipv6/mcast.c:966
 ipv6_add_dev+0xea1/0x13c0 net/ipv6/addrconf.c:475
 addrconf_notify+0x794/0x1010 net/ipv6/addrconf.c:3650
 notifier_call_chain+0x1b3/0x3e0 kernel/notifier.c:85
 call_netdevice_notifiers_extack net/core/dev.c:2267 [inline]
 call_netdevice_notifiers net/core/dev.c:2281 [inline]
 register_netdevice+0x163c/0x1b10 net/core/dev.c:11244
 register_vlan_dev+0x3cb/0x800 net/8021q/vlan.c:179
 vlan_newlink+0x4b2/0x610 net/8021q/vlan_netlink.c:194
 rtnl_newlink_create+0x310/0xb00 net/core/rtnetlink.c:3825
 __rtnl_newlink net/core/rtnetlink.c:3942 [inline]
 rtnl_newlink+0x16d6/0x1c70 net/core/rtnetlink.c:4057
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88805a57bf00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff88805a57bf80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff88805a57c000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffff88805a57c080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88805a57c100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


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

