Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13C32676169
	for <lists+linux-hams@lfdr.de>; Sat, 21 Jan 2023 00:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjATXT5 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 20 Jan 2023 18:19:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbjATXT4 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 20 Jan 2023 18:19:56 -0500
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5443F1B57D;
        Fri, 20 Jan 2023 15:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1674256794; x=1705792794;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AGJRiC/W+St3o5LjGqFKu3H60ix7V5vheV/MWUVuzZI=;
  b=hrkyDiF3Iny97WijXP6JiL1ZuHZ8McYlgTfBv8+GSoB8CVy4b8C0aK1t
   NKe+3ylwyNbkhZsdpMr7tK9RllINT+JfkFImydvnCbsaScZoPSlEcchC0
   KqW82lOfGX4WehOPh/9Dn2HXdhsGDjNLIHYJAXtq7mM3th1P7A0KxEXhs
   I=;
X-IronPort-AV: E=Sophos;i="5.97,233,1669075200"; 
   d="scan'208";a="173396634"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-iad-1e-m6i4x-6e7a78d7.us-east-1.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 23:19:46 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
        by email-inbound-relay-iad-1e-m6i4x-6e7a78d7.us-east-1.amazon.com (Postfix) with ESMTPS id 716EC831AE;
        Fri, 20 Jan 2023 23:19:43 +0000 (UTC)
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Fri, 20 Jan 2023 23:19:41 +0000
Received: from 88665a182662.ant.amazon.com (10.43.161.198) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.7;
 Fri, 20 Jan 2023 23:19:38 +0000
From:   Kuniyuki Iwashima <kuniyu@amazon.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
CC:     Nguyen Dinh Phi <phind.uet@gmail.com>,
        Kuniyuki Iwashima <kuniyu@amazon.com>,
        Kuniyuki Iwashima <kuni1840@gmail.com>,
        <netdev@vger.kernel.org>, <linux-hams@vger.kernel.org>,
        <syzbot+5fafd5cfe1fc91f6b352@syzkaller.appspotmail.com>
Subject: [PATCH v1 net] netrom: Fix use-after-free of a listening socket.
Date:   Fri, 20 Jan 2023 15:19:27 -0800
Message-ID: <20230120231927.51711-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.161.198]
X-ClientProxiedBy: EX13D34UWC004.ant.amazon.com (10.43.162.155) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

syzbot reported a use-after-free in do_accept(), precisely nr_accept()
as sk_prot_alloc() allocated the memory and sock_put() frees it. [0]

The issue could happen if the heartbeat timer is fired and
nr_heartbeat_expiry() calls nr_destroy_socket(), where a socket
has SOCK_DESTROY or a listening socket has SOCK_DEAD.

In this case, the first condition cannot be true.  SOCK_DESTROY is
flagged in nr_release() only when the file descriptor is close()d,
but accept() is being called for the listening socket, so the second
condition must be true.

Usually, the AF_NETROM listener neither starts timers nor sets
SOCK_DEAD.  However, the condition is met if connect() fails before
listen().  connect() starts the t1 timer and heartbeat timer, and
t1timer calls nr_disconnect() when timeout happens.  Then, SOCK_DEAD
is set, and if we call listen(), the heartbeat timer calls
nr_destroy_socket().

  nr_connect
    nr_establish_data_link(sk)
      nr_start_t1timer(sk)
    nr_start_heartbeat(sk)
                                    nr_t1timer_expiry
                                      nr_disconnect(sk, ETIMEDOUT)
                                        nr_sk(sk)->state = NR_STATE_0
                                        sk->sk_state = TCP_CLOSE
                                        sock_set_flag(sk, SOCK_DEAD)
nr_listen
  if (sk->sk_state != TCP_LISTEN)
    sk->sk_state = TCP_LISTEN
                                    nr_heartbeat_expiry
                                      switch (nr->state)
                                      case NR_STATE_0
                                        if (sk->sk_state == TCP_LISTEN &&
                                            sock_flag(sk, SOCK_DEAD))
                                          nr_destroy_socket(sk)

This path seems expected, and nr_destroy_socket() is called to clean
up resources.  Initially, there was sock_hold() before nr_destroy_socket()
so that the socket would not be freed, but the commit 517a16b1a88b
("netrom: Decrease sock refcount when sock timers expire") accidentally
removed it.

To fix use-after-free, let's add sock_hold().

[0]:
BUG: KASAN: use-after-free in do_accept+0x483/0x510 net/socket.c:1848
Read of size 8 at addr ffff88807978d398 by task syz-executor.3/5315

CPU: 0 PID: 5315 Comm: syz-executor.3 Not tainted 6.2.0-rc3-syzkaller-00165-gd9fc1511728c #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd1/0x138 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:306 [inline]
 print_report+0x15e/0x461 mm/kasan/report.c:417
 kasan_report+0xbf/0x1f0 mm/kasan/report.c:517
 do_accept+0x483/0x510 net/socket.c:1848
 __sys_accept4_file net/socket.c:1897 [inline]
 __sys_accept4+0x9a/0x120 net/socket.c:1927
 __do_sys_accept net/socket.c:1944 [inline]
 __se_sys_accept net/socket.c:1941 [inline]
 __x64_sys_accept+0x75/0xb0 net/socket.c:1941
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fa436a8c0c9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fa437784168 EFLAGS: 00000246 ORIG_RAX: 000000000000002b
RAX: ffffffffffffffda RBX: 00007fa436bac050 RCX: 00007fa436a8c0c9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000005
RBP: 00007fa436ae7ae9 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffebc6700df R14: 00007fa437784300 R15: 0000000000022000
 </TASK>

Allocated by task 5294:
 kasan_save_stack+0x22/0x40 mm/kasan/common.c:45
 kasan_set_track+0x25/0x30 mm/kasan/common.c:52
 ____kasan_kmalloc mm/kasan/common.c:371 [inline]
 ____kasan_kmalloc mm/kasan/common.c:330 [inline]
 __kasan_kmalloc+0xa3/0xb0 mm/kasan/common.c:380
 kasan_kmalloc include/linux/kasan.h:211 [inline]
 __do_kmalloc_node mm/slab_common.c:968 [inline]
 __kmalloc+0x5a/0xd0 mm/slab_common.c:981
 kmalloc include/linux/slab.h:584 [inline]
 sk_prot_alloc+0x140/0x290 net/core/sock.c:2038
 sk_alloc+0x3a/0x7a0 net/core/sock.c:2091
 nr_create+0xb6/0x5f0 net/netrom/af_netrom.c:433
 __sock_create+0x359/0x790 net/socket.c:1515
 sock_create net/socket.c:1566 [inline]
 __sys_socket_create net/socket.c:1603 [inline]
 __sys_socket_create net/socket.c:1588 [inline]
 __sys_socket+0x133/0x250 net/socket.c:1636
 __do_sys_socket net/socket.c:1649 [inline]
 __se_sys_socket net/socket.c:1647 [inline]
 __x64_sys_socket+0x73/0xb0 net/socket.c:1647
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Freed by task 14:
 kasan_save_stack+0x22/0x40 mm/kasan/common.c:45
 kasan_set_track+0x25/0x30 mm/kasan/common.c:52
 kasan_save_free_info+0x2b/0x40 mm/kasan/generic.c:518
 ____kasan_slab_free mm/kasan/common.c:236 [inline]
 ____kasan_slab_free+0x13b/0x1a0 mm/kasan/common.c:200
 kasan_slab_free include/linux/kasan.h:177 [inline]
 __cache_free mm/slab.c:3394 [inline]
 __do_kmem_cache_free mm/slab.c:3580 [inline]
 __kmem_cache_free+0xcd/0x3b0 mm/slab.c:3587
 sk_prot_free net/core/sock.c:2074 [inline]
 __sk_destruct+0x5df/0x750 net/core/sock.c:2166
 sk_destruct net/core/sock.c:2181 [inline]
 __sk_free+0x175/0x460 net/core/sock.c:2192
 sk_free+0x7c/0xa0 net/core/sock.c:2203
 sock_put include/net/sock.h:1991 [inline]
 nr_heartbeat_expiry+0x1d7/0x460 net/netrom/nr_timer.c:148
 call_timer_fn+0x1da/0x7c0 kernel/time/timer.c:1700
 expire_timers+0x2c6/0x5c0 kernel/time/timer.c:1751
 __run_timers kernel/time/timer.c:2022 [inline]
 __run_timers kernel/time/timer.c:1995 [inline]
 run_timer_softirq+0x326/0x910 kernel/time/timer.c:2035
 __do_softirq+0x1fb/0xadc kernel/softirq.c:571

Fixes: 517a16b1a88b ("netrom: Decrease sock refcount when sock timers expire")
Reported-by: syzbot+5fafd5cfe1fc91f6b352@syzkaller.appspotmail.com
Signed-off-by: Kuniyuki Iwashima <kuniyu@amazon.com>
---
 net/netrom/nr_timer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/netrom/nr_timer.c b/net/netrom/nr_timer.c
index a8da88db7893..4e7c968cde2d 100644
--- a/net/netrom/nr_timer.c
+++ b/net/netrom/nr_timer.c
@@ -121,6 +121,7 @@ static void nr_heartbeat_expiry(struct timer_list *t)
 		   is accepted() it isn't 'dead' so doesn't get removed. */
 		if (sock_flag(sk, SOCK_DESTROY) ||
 		    (sk->sk_state == TCP_LISTEN && sock_flag(sk, SOCK_DEAD))) {
+			sock_hold(sk);
 			bh_unlock_sock(sk);
 			nr_destroy_socket(sk);
 			goto out;
-- 
2.30.2

