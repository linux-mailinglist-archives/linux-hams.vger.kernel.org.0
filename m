Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6945D55F25A
	for <lists+linux-hams@lfdr.de>; Wed, 29 Jun 2022 02:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbiF2A10 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 28 Jun 2022 20:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiF2A10 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 28 Jun 2022 20:27:26 -0400
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net (zg8tmja5ljk3lje4ms43mwaa.icoremail.net [209.97.181.73])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 9DBC02A97C;
        Tue, 28 Jun 2022 17:27:21 -0700 (PDT)
Received: from ubuntu.localdomain (unknown [221.192.178.115])
        by mail-app3 (Coremail) with SMTP id cC_KCgDnt8hCnLtiHEMWAQ--.35491S2;
        Wed, 29 Jun 2022 08:26:53 +0800 (CST)
From:   Duoming Zhou <duoming@zju.edu.cn>
To:     linux-hams@vger.kernel.org
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
        davem@davemloft.net, ralf@linux-mips.org,
        Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH v3 RESEND] net: rose: fix UAF bugs caused by timer handler
Date:   Wed, 29 Jun 2022 08:26:40 +0800
Message-Id: <20220629002640.5693-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgDnt8hCnLtiHEMWAQ--.35491S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtr1DGw45AF4kXry3Jr17Awb_yoWxtw15pF
        W7Ka47Jr4rtw42grW8Ars7CrW3t3W5Jry7Ar1xXF4IyFn7WrWUXF1DAryjqa13GFWkGFy3
        XF1kXrySyFn7taDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUym14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
        r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
        xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
        cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
        AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
        14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAgIPAVZdtacoVwAEss
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

There are UAF bugs in rose_heartbeat_expiry(), rose_timer_expiry()
and rose_idletimer_expiry(). The root cause is that del_timer()
could not stop the timer handler that is running and the refcount
of sock is not managed properly.

One of the UAF bugs is shown below:

    (thread 1)          |        (thread 2)
                        |  rose_bind
                        |  rose_connect
                        |    rose_start_heartbeat
rose_release            |    (wait a time)
  case ROSE_STATE_0     |
  rose_destroy_socket   |  rose_heartbeat_expiry
    rose_stop_heartbeat |
    sock_put(sk)        |    ...
  sock_put(sk) // FREE  |
                        |    bh_lock_sock(sk) // USE

The sock is deallocated by sock_put() in rose_release() and
then used by bh_lock_sock() in rose_heartbeat_expiry().

Although rose_destroy_socket() calls rose_stop_heartbeat(),
it could not stop the timer that is running.

The KASAN report triggered by POC is shown below:

BUG: KASAN: use-after-free in _raw_spin_lock+0x5a/0x110
Write of size 4 at addr ffff88800ae59098 by task swapper/3/0
...
Call Trace:
 <IRQ>
 dump_stack_lvl+0xbf/0xee
 print_address_description+0x7b/0x440
 print_report+0x101/0x230
 ? irq_work_single+0xbb/0x140
 ? _raw_spin_lock+0x5a/0x110
 kasan_report+0xed/0x120
 ? _raw_spin_lock+0x5a/0x110
 kasan_check_range+0x2bd/0x2e0
 _raw_spin_lock+0x5a/0x110
 rose_heartbeat_expiry+0x39/0x370
 ? rose_start_heartbeat+0xb0/0xb0
 call_timer_fn+0x2d/0x1c0
 ? rose_start_heartbeat+0xb0/0xb0
 expire_timers+0x1f3/0x320
 __run_timers+0x3ff/0x4d0
 run_timer_softirq+0x41/0x80
 __do_softirq+0x233/0x544
 irq_exit_rcu+0x41/0xa0
 sysvec_apic_timer_interrupt+0x8c/0xb0
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1b/0x20
RIP: 0010:default_idle+0xb/0x10
RSP: 0018:ffffc9000012fea0 EFLAGS: 00000202
RAX: 000000000000bcae RBX: ffff888006660f00 RCX: 000000000000bcae
RDX: 0000000000000001 RSI: ffffffff843a11c0 RDI: ffffffff843a1180
RBP: dffffc0000000000 R08: dffffc0000000000 R09: ffffed100da36d46
R10: dfffe9100da36d47 R11: ffffffff83cf0950 R12: 0000000000000000
R13: 1ffff11000ccc1e0 R14: ffffffff8542af28 R15: dffffc0000000000
...
Allocated by task 146:
 __kasan_kmalloc+0xc4/0xf0
 sk_prot_alloc+0xdd/0x1a0
 sk_alloc+0x2d/0x4e0
 rose_create+0x7b/0x330
 __sock_create+0x2dd/0x640
 __sys_socket+0xc7/0x270
 __x64_sys_socket+0x71/0x80
 do_syscall_64+0x43/0x90
 entry_SYSCALL_64_after_hwframe+0x46/0xb0

Freed by task 152:
 kasan_set_track+0x4c/0x70
 kasan_set_free_info+0x1f/0x40
 ____kasan_slab_free+0x124/0x190
 kfree+0xd3/0x270
 __sk_destruct+0x314/0x460
 rose_release+0x2fa/0x3b0
 sock_close+0xcb/0x230
 __fput+0x2d9/0x650
 task_work_run+0xd6/0x160
 exit_to_user_mode_loop+0xc7/0xd0
 exit_to_user_mode_prepare+0x4e/0x80
 syscall_exit_to_user_mode+0x20/0x40
 do_syscall_64+0x4f/0x90
 entry_SYSCALL_64_after_hwframe+0x46/0xb0

This patch adds refcount of sock when we use functions
such as rose_start_heartbeat() and so on to start timer,
and decreases the refcount of sock when timer is finished
or deleted by functions such as rose_stop_heartbeat()
and so on. As a result, the UAF bugs could be mitigated.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
Tested-by: Duoming Zhou <duoming@zju.edu.cn>
---
Changes in v3:
  - Change del_timer to sk_stop_timer in order to fix refcount leak.

 net/rose/rose_timer.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/net/rose/rose_timer.c b/net/rose/rose_timer.c
index b3138fc2e55..f06ddbed3fe 100644
--- a/net/rose/rose_timer.c
+++ b/net/rose/rose_timer.c
@@ -31,89 +31,89 @@ static void rose_idletimer_expiry(struct timer_list *);
 
 void rose_start_heartbeat(struct sock *sk)
 {
-	del_timer(&sk->sk_timer);
+	sk_stop_timer(sk, &sk->sk_timer);
 
 	sk->sk_timer.function = rose_heartbeat_expiry;
 	sk->sk_timer.expires  = jiffies + 5 * HZ;
 
-	add_timer(&sk->sk_timer);
+	sk_reset_timer(sk, &sk->sk_timer, sk->sk_timer.expires);
 }
 
 void rose_start_t1timer(struct sock *sk)
 {
 	struct rose_sock *rose = rose_sk(sk);
 
-	del_timer(&rose->timer);
+	sk_stop_timer(sk, &rose->timer);
 
 	rose->timer.function = rose_timer_expiry;
 	rose->timer.expires  = jiffies + rose->t1;
 
-	add_timer(&rose->timer);
+	sk_reset_timer(sk, &rose->timer, rose->timer.expires);
 }
 
 void rose_start_t2timer(struct sock *sk)
 {
 	struct rose_sock *rose = rose_sk(sk);
 
-	del_timer(&rose->timer);
+	sk_stop_timer(sk, &rose->timer);
 
 	rose->timer.function = rose_timer_expiry;
 	rose->timer.expires  = jiffies + rose->t2;
 
-	add_timer(&rose->timer);
+	sk_reset_timer(sk, &rose->timer, rose->timer.expires);
 }
 
 void rose_start_t3timer(struct sock *sk)
 {
 	struct rose_sock *rose = rose_sk(sk);
 
-	del_timer(&rose->timer);
+	sk_stop_timer(sk, &rose->timer);
 
 	rose->timer.function = rose_timer_expiry;
 	rose->timer.expires  = jiffies + rose->t3;
 
-	add_timer(&rose->timer);
+	sk_reset_timer(sk, &rose->timer, rose->timer.expires);
 }
 
 void rose_start_hbtimer(struct sock *sk)
 {
 	struct rose_sock *rose = rose_sk(sk);
 
-	del_timer(&rose->timer);
+	sk_stop_timer(sk, &rose->timer);
 
 	rose->timer.function = rose_timer_expiry;
 	rose->timer.expires  = jiffies + rose->hb;
 
-	add_timer(&rose->timer);
+	sk_reset_timer(sk, &rose->timer, rose->timer.expires);
 }
 
 void rose_start_idletimer(struct sock *sk)
 {
 	struct rose_sock *rose = rose_sk(sk);
 
-	del_timer(&rose->idletimer);
+	sk_stop_timer(sk, &rose->idletimer);
 
 	if (rose->idle > 0) {
 		rose->idletimer.function = rose_idletimer_expiry;
 		rose->idletimer.expires  = jiffies + rose->idle;
 
-		add_timer(&rose->idletimer);
+		sk_reset_timer(sk, &rose->idletimer, rose->idletimer.expires);
 	}
 }
 
 void rose_stop_heartbeat(struct sock *sk)
 {
-	del_timer(&sk->sk_timer);
+	sk_stop_timer(sk, &sk->sk_timer);
 }
 
 void rose_stop_timer(struct sock *sk)
 {
-	del_timer(&rose_sk(sk)->timer);
+	sk_stop_timer(sk, &rose_sk(sk)->timer);
 }
 
 void rose_stop_idletimer(struct sock *sk)
 {
-	del_timer(&rose_sk(sk)->idletimer);
+	sk_stop_timer(sk, &rose_sk(sk)->idletimer);
 }
 
 static void rose_heartbeat_expiry(struct timer_list *t)
@@ -130,6 +130,7 @@ static void rose_heartbeat_expiry(struct timer_list *t)
 		    (sk->sk_state == TCP_LISTEN && sock_flag(sk, SOCK_DEAD))) {
 			bh_unlock_sock(sk);
 			rose_destroy_socket(sk);
+			sock_put(sk);
 			return;
 		}
 		break;
@@ -152,6 +153,7 @@ static void rose_heartbeat_expiry(struct timer_list *t)
 
 	rose_start_heartbeat(sk);
 	bh_unlock_sock(sk);
+	sock_put(sk);
 }
 
 static void rose_timer_expiry(struct timer_list *t)
@@ -181,6 +183,7 @@ static void rose_timer_expiry(struct timer_list *t)
 		break;
 	}
 	bh_unlock_sock(sk);
+	sock_put(sk);
 }
 
 static void rose_idletimer_expiry(struct timer_list *t)
@@ -205,4 +208,5 @@ static void rose_idletimer_expiry(struct timer_list *t)
 		sock_set_flag(sk, SOCK_DEAD);
 	}
 	bh_unlock_sock(sk);
+	sock_put(sk);
 }
-- 
2.17.1

