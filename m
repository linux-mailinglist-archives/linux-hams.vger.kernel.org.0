Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 560132E5F6
	for <lists+linux-hams@lfdr.de>; Wed, 29 May 2019 22:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbfE2USG (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 29 May 2019 16:18:06 -0400
Received: from mail-it1-f200.google.com ([209.85.166.200]:53996 "EHLO
        mail-it1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfE2USG (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 29 May 2019 16:18:06 -0400
Received: by mail-it1-f200.google.com with SMTP id m14so2969701itl.3
        for <linux-hams@vger.kernel.org>; Wed, 29 May 2019 13:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=LKEz7XTZ4qr1/XdWlgCrAy6dfMnUYHHEKllZWvUwqVI=;
        b=TiK/OIGjjmfMGFcMSOHDLkmVi7CYx4+w8y97ChLYS97TTss1mQ0Wm+mCJR5HYq6Qqo
         zMEhKZ4+XGScSjr1Jhgi+5CZvQWiawfwseo65Gxqj7Hqjhz6Og8+NkAkJH1GU41diqJU
         MWYBWGd/SqvFwLtx4es922sWcqGWAdsrMq5gJ3VCezg0NKNkcnjvVzifVNmAcohg7CfS
         7qU1RbBW78iFCUflRxLPSZXDSUPKR1adztWCYaBmk4folUQ6/Tj4Dej2oVsOujLmauev
         XaNA6GQjoY/X6HYHj0qxcmAgt8YTBdLkBMtYCSPObLNn/zxTUSTLTnC8POoRPWfglIsm
         n3og==
X-Gm-Message-State: APjAAAVcMIZmkMVHANB7k/p6LXILv+QcECM7pFg8jHxA6y1kh8oqyhB9
        wOO+tZJoWw8LL6M19RtKrSbiSBN96HOzlgyApnX7ZBXZHAli
X-Google-Smtp-Source: APXvYqzvVxVAHNou2Z0JaDILwh5XC9INnPe18/MwMxlAaS+3+d7wuVTTgJmnuK++bU6CaL5R1gRXPm2uk+odi2PdKTc0W8tsRp4A
MIME-Version: 1.0
X-Received: by 2002:a02:1a45:: with SMTP id 66mr80221047jai.124.1559161085617;
 Wed, 29 May 2019 13:18:05 -0700 (PDT)
Date:   Wed, 29 May 2019 13:18:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a7f012058a0c7a65@google.com>
Subject: memory leak in nr_loopback_queue
From:   syzbot <syzbot+470d1a4a7b7a7c225881@syzkaller.appspotmail.com>
To:     davem@davemloft.net, linux-hams@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        ralf@linux-mips.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    9fb67d64 Merge tag 'pinctrl-v5.2-2' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15956d52a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=64479170dcaf0e11
dashboard link: https://syzkaller.appspot.com/bug?extid=470d1a4a7b7a7c225881
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11bc96a2a00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+470d1a4a7b7a7c225881@syzkaller.appspotmail.com

2019/05/29 16:46:11 executed programs: 584
2019/05/29 16:46:19 executed programs: 614
2019/05/29 16:46:26 executed programs: 624
2019/05/29 16:46:33 executed programs: 640
2019/05/29 16:46:41 executed programs: 654
BUG: memory leak
unreferenced object 0xffff888117e5ba00 (size 224):
   comm "syz-executor.2", pid 10957, jiffies 4294999655 (age 10.170s)
   hex dump (first 32 bytes):
     d0 50 cc 17 81 88 ff ff d0 50 cc 17 81 88 ff ff  .P.......P......
     00 00 00 00 00 00 00 00 00 10 b2 08 81 88 ff ff  ................
   backtrace:
     [<00000000af44a575>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:55 [inline]
     [<00000000af44a575>] slab_post_alloc_hook mm/slab.h:439 [inline]
     [<00000000af44a575>] slab_alloc_node mm/slab.c:3269 [inline]
     [<00000000af44a575>] kmem_cache_alloc_node+0x153/0x2a0 mm/slab.c:3579
     [<000000007d2ff911>] __alloc_skb+0x6e/0x210 net/core/skbuff.c:198
     [<00000000f697bd2b>] alloc_skb include/linux/skbuff.h:1058 [inline]
     [<00000000f697bd2b>] nr_loopback_queue+0x26/0xc0  
net/netrom/nr_loopback.c:37
     [<00000000eb3a969d>] nr_route_frame+0x2d1/0x340  
net/netrom/nr_route.c:775
     [<000000002dad2e7e>] nr_transmit_buffer+0x86/0xc0  
net/netrom/nr_out.c:212
     [<000000006d8f7662>] nr_write_internal+0x133/0x2e0  
net/netrom/nr_subr.c:208
     [<0000000004553967>] nr_establish_data_link+0x2d/0x60  
net/netrom/nr_out.c:230
     [<000000000382326a>] nr_connect+0x13b/0x490 net/netrom/af_netrom.c:716
     [<00000000a27cdfc2>] __sys_connect+0x11d/0x170 net/socket.c:1840
     [<0000000074ede9c3>] __do_sys_connect net/socket.c:1851 [inline]
     [<0000000074ede9c3>] __se_sys_connect net/socket.c:1848 [inline]
     [<0000000074ede9c3>] __x64_sys_connect+0x1e/0x30 net/socket.c:1848
     [<000000000940d4eb>] do_syscall_64+0x76/0x1a0  
arch/x86/entry/common.c:301
     [<00000000307bfe5c>] entry_SYSCALL_64_after_hwframe+0x44/0xa9



---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
