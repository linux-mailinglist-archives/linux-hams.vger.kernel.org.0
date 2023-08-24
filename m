Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2988787607
	for <lists+linux-hams@lfdr.de>; Thu, 24 Aug 2023 18:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242713AbjHXQvc (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 24 Aug 2023 12:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242730AbjHXQvV (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 24 Aug 2023 12:51:21 -0400
Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com [52.119.213.154])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D151B9;
        Thu, 24 Aug 2023 09:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1692895879; x=1724431879;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pG+tRJ116D4api395zLwES3ve0/btluTQIhoO1BD40c=;
  b=UFMT0Hpn34uOMEVRCD85MhmQg4s2bi6BTODYfgiosYTV0kn92PvxGeyi
   +JF4RTQJwy6UNyFJND84iEPdS/xXBEbm+H5Nn0E+gd295B66BbMRv0/el
   QdoaPRH/BYzkP/V5s4x8S54sNT++Y4SsoEBVGUlF84krt6BRoNjaviKWl
   M=;
X-IronPort-AV: E=Sophos;i="6.02,195,1688428800"; 
   d="scan'208";a="150423601"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-pdx-2a-m6i4x-af372327.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-52004.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 16:51:16 +0000
Received: from EX19MTAUWA002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
        by email-inbound-relay-pdx-2a-m6i4x-af372327.us-west-2.amazon.com (Postfix) with ESMTPS id EFDCB60B4D;
        Thu, 24 Aug 2023 16:51:14 +0000 (UTC)
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 24 Aug 2023 16:51:13 +0000
Received: from 88665a182662.ant.amazon.com (10.106.101.26) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Thu, 24 Aug 2023 16:51:10 +0000
From:   Kuniyuki Iwashima <kuniyu@amazon.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
CC:     Kuniyuki Iwashima <kuniyu@amazon.com>,
        Kuniyuki Iwashima <kuni1840@gmail.com>,
        <netdev@vger.kernel.org>, <linux-hams@vger.kernel.org>,
        <syzbot+666c97e4686410e79649@syzkaller.appspotmail.com>
Subject: [PATCH v1 net] netrom: Deny concurrent connect().
Date:   Thu, 24 Aug 2023 09:50:59 -0700
Message-ID: <20230824165059.90977-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.101.26]
X-ClientProxiedBy: EX19D041UWA003.ant.amazon.com (10.13.139.105) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,T_SPF_PERMERROR autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

syzkaller reported null-ptr-deref [0] related to AF_NETROM.
This is another self-accept issue from the strace log. [1]

syz-executor creates an AF_NETROM socket and calls connect(), which
is blocked at that time.  Then, sk->sk_state is TCP_SYN_SENT and
sock->state is SS_CONNECTING.

  [pid  5059] socket(AF_NETROM, SOCK_SEQPACKET, 0) = 4
  [pid  5059] connect(4, {sa_family=AF_NETROM, sa_data="..." <unfinished ...>

Another thread calls connect() concurrently, which finally fails
with -EINVAL.  However, the problem here is the socket state is
reset even while the first connect() is blocked.

  [pid  5060] connect(4, NULL, 0 <unfinished ...>
  [pid  5060] <... connect resumed>)      = -1 EINVAL (Invalid argument)

As sk->state is TCP_CLOSE and sock->state is SS_UNCONNECTED, the
following listen() succeeds.  Then, the first connect() looks up
itself as a listener and puts skb into the queue with skb->sk itself.
As a result, the next accept() gets another FD of itself as 3, and
the first connect() finishes.

  [pid  5060] listen(4, 0 <unfinished ...>
  [pid  5060] <... listen resumed>)       = 0
  [pid  5060] accept(4, NULL, NULL <unfinished ...>
  [pid  5060] <... accept resumed>)       = 3
  [pid  5059] <... connect resumed>)      = 0

Then, accept4() is called but blocked, which causes the general protection
fault later.

  [pid  5059] accept4(4, NULL, 0x20000400, SOCK_NONBLOCK <unfinished ...>

After that, another self-accept occurs by accept() and writev().

  [pid  5060] accept(4, NULL, NULL <unfinished ...>
  [pid  5061] writev(3, [{iov_base=...}] <unfinished ...>
  [pid  5061] <... writev resumed>)       = 99
  [pid  5060] <... accept resumed>)       = 6

Finally, the leader thread close()s all FDs.  Since the three FDs
reference the same socket, nr_release() does the cleanup for it
three times, and the remaining accept4() causes the following fault.

  [pid  5058] close(3)                    = 0
  [pid  5058] close(4)                    = 0
  [pid  5058] close(5)                    = -1 EBADF (Bad file descriptor)
  [pid  5058] close(6)                    = 0
  [pid  5058] <... exit_group resumed>)   = ?
  [   83.456055][ T5059] general protection fault, probably for non-canonical address 0xdffffc0000000003: 0000 [#1] PREEMPT SMP KASAN

To avoid the issue, we need to return an error for connect() if
another connect() is in progress, as done in __inet_stream_connect().

[0]:
general protection fault, probably for non-canonical address 0xdffffc0000000003: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
CPU: 0 PID: 5059 Comm: syz-executor.0 Not tainted 6.5.0-rc5-syzkaller-00194-gace0ab3a4b54 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/26/2023
RIP: 0010:__lock_acquire+0x109/0x5de0 kernel/locking/lockdep.c:5012
Code: 45 85 c9 0f 84 cc 0e 00 00 44 8b 05 11 6e 23 0b 45 85 c0 0f 84 be 0d 00 00 48 ba 00 00 00 00 00 fc ff df 4c 89 d1 48 c1 e9 03 <80> 3c 11 00 0f 85 e8 40 00 00 49 81 3a a0 69 48 90 0f 84 96 0d 00
RSP: 0018:ffffc90003d6f9e0 EFLAGS: 00010006
RAX: ffff8880244c8000 RBX: 1ffff920007adf6c RCX: 0000000000000003
RDX: dffffc0000000000 RSI: 0000000000000000 RDI: 0000000000000018
RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000001
R10: 0000000000000018 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  00007f51d519a6c0(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f51d5158d58 CR3: 000000002943f000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 lock_acquire kernel/locking/lockdep.c:5761 [inline]
 lock_acquire+0x1ae/0x510 kernel/locking/lockdep.c:5726
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x3a/0x50 kernel/locking/spinlock.c:162
 prepare_to_wait+0x47/0x380 kernel/sched/wait.c:269
 nr_accept+0x20d/0x650 net/netrom/af_netrom.c:798
 do_accept+0x3a6/0x570 net/socket.c:1872
 __sys_accept4_file net/socket.c:1913 [inline]
 __sys_accept4+0x99/0x120 net/socket.c:1943
 __do_sys_accept4 net/socket.c:1954 [inline]
 __se_sys_accept4 net/socket.c:1951 [inline]
 __x64_sys_accept4+0x96/0x100 net/socket.c:1951
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f51d447cae9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 20 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f51d519a0c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000120
RAX: ffffffffffffffda RBX: 00007f51d459bf80 RCX: 00007f51d447cae9
RDX: 0000000020000400 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00007f51d44c847a R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000800 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000000b R14: 00007f51d459bf80 R15: 00007ffc25c34e48
 </TASK>

Link: https://syzkaller.appspot.com/text?tag=CrashLog&x=152cdb63a80000 [1]
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+666c97e4686410e79649@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=666c97e4686410e79649
Signed-off-by: Kuniyuki Iwashima <kuniyu@amazon.com>
---
 net/netrom/af_netrom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
index eb8ccbd58df7..96e91ab71573 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -660,6 +660,11 @@ static int nr_connect(struct socket *sock, struct sockaddr *uaddr,
 		goto out_release;
 	}
 
+	if (sock->state == SS_CONNECTING) {
+		err = -EALREADY;
+		goto out_release;
+	}
+
 	sk->sk_state   = TCP_CLOSE;
 	sock->state = SS_UNCONNECTED;
 
-- 
2.30.2

