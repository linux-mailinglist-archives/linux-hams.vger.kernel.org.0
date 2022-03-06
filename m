Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 902DB4CED55
	for <lists+linux-hams@lfdr.de>; Sun,  6 Mar 2022 20:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233902AbiCFTVC (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 6 Mar 2022 14:21:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbiCFTVC (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 6 Mar 2022 14:21:02 -0500
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6ED7F58837
        for <linux-hams@vger.kernel.org>; Sun,  6 Mar 2022 11:20:09 -0800 (PST)
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
        by trinity3.trinnet.net (TrinityOS Hardened/TrinityOS Hardened) with ESMTP id 226JK13M021549;
        Sun, 6 Mar 2022 11:20:01 -0800
From:   David Ranch <linux-hams@trinnet.net>
Subject: Re: Kernel freeze on killall kissattach
To:     Thomas Osterried <thomas@osterried.de>
References: <e037cff4-87fa-ce95-438d-66be0754c6b2@blackspace.at>
 <YiUE9XaViss5I2HR@x-berg.in-berlin.de>
Cc:     Roland Schwarz <roland.schwarz@blackspace.at>,
        linux-hams@vger.kernel.org
Message-ID: <eea690aa-bf23-2b65-187b-af91b38fca10@trinnet.net>
Date:   Sun, 6 Mar 2022 11:20:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <YiUE9XaViss5I2HR@x-berg.in-berlin.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Sun, 06 Mar 2022 11:20:01 -0800 (GMT+8)
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org


Hello Thomas,

Thank you for the help here.  Since we continue to get untested patches 
committed into the upstream Linus branch without ANY due diligence, do 
you think we can ask David Miller (and/or team) to STOP auto-accepting 
patches for the AX25/Netrom/ROSE/etc areas w/o approval from you first?  
I think that if this can be done, it will go a long ways to avoid this 
poor commits coming in and making the AX.25 stack toxic.

--David
KI6ZHD


On 03/06/2022 11:01 AM, Thomas Osterried wrote:
> Hello,
>
> thank you Roland for bringing this up.
>
> I also have prepared a posting to this list; but I liked to first discuss the
> new problem with the authors of the patch that caused the regression.
>
> I'll try to keep it short:
>
> Starting with commit 1ade48d0c27d5da1ccf4b583d8c5fc8b534a3ac8
> (author	Lin Ma<linma@zju.edu.cn>	2021-12-17 10:29:41 +0800)
> kernel will panic if
>    1. there's an active connection
> AND
>    2. you kill kissattach (or rmmod bpqether, etc)
>
>
> The patch above tries to fix a problem that hhas been in the kernel for many years,
> but rarely occured (possible nullpointer exception in ax25_sendmsg()).
>
>
> This new bug caused by patch 1ade48d0c27d5da1ccf4b583d8c5fc8b534a3ac8 is already
> in current linux distributions, like debian bullseye (comes with kernel version 5.10).
>
>
> Unfortunately, that patch has a real stability impact:
> In the kernel trace message I'll append below (Appendix I) we see, that the kernel
> panics due to null pointer exception.
>
> Lin Ma tried to assure in ax25_kill_by_device socket locking,
> before setting s->ax25_dev to NULL:
> +			lock_sock(s->sk);
> +			s->ax25_dev = NULL;
>
> But:
> s->sk can be NULL.
> lock_sock(NULL) leads to kernel panic.
>
>
> You may argue: can s->sk be NULL, or is there another bug somewhere that should
> be fixed instead?
> Maybe, but: until we really understand what causes s->sk to be NULL in some situations
> (and we'll hav found really all such possible cases), we'll have to assure that we
> don't lock_sock(NULL).
>
> The sense of the new lock_sock() is to assure that "s->ax25_dev = NULL" will not cause
> a null pointer deference in ax25_sendmsg() [and may be other functions in
> the ax25 protocol stack].
> On the other hand, if we don't set s->ax25_dev = NULL, it may point to a free()'d
> structure, after the device is free'd.
>
>
> Consider the following as a quick fix (it's tested) against the kernel panic,
> caused by 1ade48d0c27d5da1ccf4b583d8c5fc8b534a3ac8:
>
> diff -up  a/af_ax25.c b/af_ax25.c
> --- a/net/ax25/af_ax25.c	2022-02-26 15:30:35.529637338 +0100
> +++ b/net/ax25/af_ax25.c	2022-02-26 15:34:08.789076313 +0100
> @@ -86,10 +86,16 @@ again:
>   	ax25_for_each(s, &ax25_list) {
>   		if (s->ax25_dev == ax25_dev) {
>   			spin_unlock_bh(&ax25_list_lock);
> +			if (!s->sk) {
> +				ax25_dev = NULL;
> +				ax25_disconnect(s, ENETUNREACH);
> +				goto out;
> +			}
>   			lock_sock(s->sk);
>   			s->ax25_dev = NULL;
> -			release_sock(s->sk);
>   			ax25_disconnect(s, ENETUNREACH);
> +			release_sock(s->sk);
> +out:
>   			spin_lock_bh(&ax25_list_lock);
>   
>   			/* The entry could have been deleted from the
>
>
>
> Keep in mind, that in situation of s->sk == NULL
>    ax25_dev = NULL;
> may still lead to a situation that 1ade48d0c27d5da1ccf4b583d8c5fc8b534a3ac8
> tried to fix.
>
>
>
> If we look at torwald's kernel tree (which is currently up to kernel netdev tree),
> or you remember patches of jan / feb 2022 that we've seen on this list
> (i.e. 4e0f718daf97), the code around lock_sock() in ax25_kill_by_device() has
> changed again (and reordered the call of some functions).
>
> -> My approach to q&d-fix is this:
>
> --- a/af_ax25.c	2022-02-25 11:49:19.000000000 +0100
> +++ b/af_ax25.c	2022-03-01 04:15:16.000000000 +0100
> @@ -86,7 +86,13 @@ static void ax25_kill_by_device(struct n
>   again:
>   	ax25_for_each(s, &ax25_list) {
>   		if (s->ax25_dev == ax25_dev) {
> -			sk = s->sk;
> +			if (!(sk = s->sk)) {
> +				s->ax25_dev = NULL;
> +				spin_unlock_bh(&ax25_list_lock);
> +				ax25_disconnect(s, ENETUNREACH);
> +				spin_lock_bh(&ax25_list_lock);
> +				goto again;
> +			}
>   			sock_hold(sk);
>   			spin_unlock_bh(&ax25_list_lock);
>   			lock_sock(sk);
>
>
>
>
> Apart from this: a new regression:
>
> With patch d01ffb9eee4af165d83b08dd73ebdf9fe94a519b ,
> "ax25: add refcount in ax25_dev to avoid UAF bugs"
> new reference counters for ax25_dev came in.
>
> If you test kernel torwalds tree, we have two problems:
> 1. the kernel panics, as described above (happens when
>      current connected ax25-sessions and you do a killall kissattach)
> 2. a new regression:
>     if you use Roland's example and do
>     1. killall axcall
>     2. netstat -an
>        here you see the well-known ax25-ex-connected-session-now-listening-state-bug:
>        Active AX.25 sockets
>        Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
>        DL9SAU-4   DL9SAU-3   ax0     LISTENING    000/000  0       0
>     3. Now, you do killall kissattach
>        -> kernel complains in intervall:
>          unregister_netdevice: waiting for ax1 to become free. Usage count = 2
>        and this situation lasts for ever.
>        We know, that nothing cleans up those dead ex-sessions in listening-state.
>        More trace: see Appendix II.
>     4. In such a situation, you cannot do anymore, without rebooting,
>         rmmod ax25 and rmmod mkiss
>
>
>
> Final wish:
> please let's talk with each other (may be first in private with someone else,
> then on this list), before sending a patch to the netdev maintainers.
> At least the two problems I've described took only few time of testing and
> I stumbled over the problems they introduced.
>
>
> Two appendixes below.
>
>
> vy 73,
> 	- Thomas  dl9sau
>
>
>
> Appendix I:
> -----------
>
> debian bullseye kernel 5.10, as well as current linux torvalds tree:
>
> kernel panic after killall kissattach when connections are still active:
>   
> [65483.936924] BUG: kernel NULL pointer dereference, address: 0000000000000088
> [65483.937138] #PF: supervisor write access in kernel mode
> [65483.937249] #PF: error_code(0x0002) - not-present page
> [65483.937371] PGD 0 P4D 0
> [65483.937447] Oops: 0002 [#1] SMP NOPTI
> [65483.937547] CPU: 0 PID: 337635 Comm: kissattach Tainted: G            E     5.10.0-11-amd64 #1 Debian 5.10.92-1
> [65483.937739] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
> [65483.937908] RIP: 0010:_raw_spin_lock_bh+0x17/0x30
> [65483.938023] Code: 00 57 9d 0f 1f 44 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 65 81 05 40 65 95 54 00 02 00 00 31 c0 ba 01 00 00 00 <f0> 0f b1 17 75 01 c3 89 c6 e8 bb 14 82 ff 66 90 c3 0f 1f 84 00 00
> [65483.938349] RSP: 0018:ffffac24c0c43c48 EFLAGS: 00010246
> [65483.938466] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000002
> [65483.938606] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000088
> [65483.938755] RBP: 0000000000000088 R08: 0000000000000000 R09: 0000000000000002
> [65483.938902] R10: ffff9622081b9000 R11: 0000000000000000 R12: ffff9622044be000
> [65483.939049] R13: 00000000ffffffea R14: ffff9622044be078 R15: ffffac24c0c43d60
> [65483.939207] FS:  00007f606b22b740(0000) GS:ffff96227dc00000(0000) knlGS:0000000000000000
> [65483.939371] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [65483.939497] CR2: 0000000000000088 CR3: 0000000014344000 CR4: 00000000000006f0
> [65483.939648] Call Trace:
> [65483.939732]  lock_sock_nested+0x1e/0x60
> [65483.939856]  ax25_device_event+0x89/0xe0 [ax25]
> [65483.939969]  raw_notifier_call_chain+0x44/0x60
> [65483.940078]  dev_close_many+0xef/0x150
> [65483.940175]  rollback_registered_many+0x152/0x6c0
> [65483.940337]  ? __schedule+0x28a/0x870
> [65483.940450]  unregister_netdevice_queue+0xcf/0x180
> [65483.940571]  unregister_netdev+0x18/0x20
> [65483.940680]  mkiss_close+0x77/0xb0 [mkiss]
> [65483.940791]  tty_ldisc_release+0x8f/0x180
> [65483.940896]  tty_release_struct+0x13/0x80
> [65483.941003]  tty_release+0x437/0x5d0
> [65483.941105]  __fput+0x95/0x240
> [65483.941195]  task_work_run+0x65/0xa0
> [65483.941294]  do_exit+0x362/0xaa0
> [65483.941389]  do_group_exit+0x33/0xa0
> [65483.941489]  __x64_sys_exit_group+0x14/0x20
> [65483.941601]  do_syscall_64+0x33/0x80
> [65483.941700]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [65483.941820] RIP: 0033:0x7f606b2f9699
> [65483.941915] Code: Unable to access opcode bytes at RIP 0x7f606b2f966f.
>
>
>
> Appendix II:
> ------------
>
> current linux torvalds tree:
> killall axcall; one connection still in listening state; killall kissattach
>
> 	...
> 	[  321.386733] unregister_netdevice: waiting for ax1 to become free. Usage count = 2
> 	[  331.467128] unregister_netdevice: waiting for ax1 to become free. Usage count = 2
> 	[  341.547385] unregister_netdevice: waiting for ax1 to become free. Usage count = 2
> 	[  351.627710] unregister_netdevice: waiting for ax1 to become free. Usage count = 2
> 	[  361.707951] unregister_netdevice: waiting for ax1 to become free. Usage count = 2
> 	[  363.692092] INFO: task kissattach:508 blocked for more than 120 seconds.
> 	[  363.692321]       Tainted: G            E     5.17.0-rc6+ #4
> 	[  363.692444] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> 	[  363.692782] task:kissattach      state:D stack:    0 pid:  508 ppid:     1 flags:0x00000002
> 	[  363.693034] Call Trace:
> 	[  363.693201]  <TASK>
> 	[  363.693451]  __schedule+0x302/0x9a0
> 	[  363.693605]  schedule+0x4e/0xc0
> 	[  363.693730]  schedule_preempt_disabled+0x14/0x20
> 	[  363.693860]  __mutex_lock.constprop.0+0x2b4/0x460
> 	[  363.694009]  ? mod_objcg_state+0x107/0x300
> 	[  363.694134]  tty_release+0x4f/0x5e0
> 	[  363.694217]  ? memcg_slab_free_hook+0xcc/0x190
> 	[  363.694420]  __fput+0x8c/0x240
> 	[  363.694575]  task_work_run+0x5c/0x90
> 	[  363.694749]  do_exit+0x331/0xae0
> 	[  363.694913]  do_group_exit+0x2d/0x90
> 	[  363.697440]  __x64_sys_exit_group+0x14/0x20
> 	[  363.699904]  do_syscall_64+0x3b/0xc0
> 	[  363.702246]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 	[  363.704704] RIP: 0033:0x7f7dd46f7699
> 	[  363.706998] RSP: 002b:00007fff436d7088 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> 	[  363.709437] RAX: ffffffffffffffda RBX: 00007f7dd47ec610 RCX: 00007f7dd46f7699
> 	[  363.711905] RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000000
> 	[  363.714273] RBP: 0000000000000000 R08: ffffffffffffff80 R09: 0000000000000001
> 	[  363.716735] R10: 00007f7dd4825440 R11: 0000000000000246 R12: 00007f7dd47ec610
> 	[  363.719093] R13: 0000000000000001 R14: 00007f7dd47ecae8 R15: 0000000000000000
> 	[  363.721539]  </TASK>
> 	[  371.788201] unregister_netdevice: waiting for ax1 to become free. Usage count = 2
> 	[  381.868436] unregister_netdevice: waiting for ax1 to become free. Usage count = 2
> 	[  391.948686] unregister_netdevice: waiting for ax1 to become free. Usage count = 2
> 	...
>
>
>
>
> On Sun, Mar 06, 2022 at 03:18:14PM +0100, Roland Schwarz wrote:
>> Dear All,
>>
>> please correct me if I am wrong, but as I understand it should not be
>> possible to trigger a kernel freeze by just killing user space processes.
>>
>> While trying to understand a certain behavior of the ax25 driver I came up
>> with a small test case which I ran in a virtual machine (KVM):
>>
>> First I tried with a kernel from Linus tree:
>>
>> uname -r
>> 5.17.0-rc6+
>>
>> cat /etc/ax25/axports
>> ax0     OE1RSA-0        115200  255     7       Test A
>> ax1     OE1RSA-1        115200  255     7       Test B
>>
>> sudo kissattach /dev/ptmx ax0
>> AX.25 port ax0 bound to device ax0
>> Awaiting client connects on
>> /dev/pts/1
>>
>> sudo kissattach /dev/pts/1 ax1
>> AX.25 port ax1 bound to device ax1
>>
>> axcall ax1 OE1RSA-0
>>
>> Now in a second terminal:
>> sudo killall kissattach
>>
>> First terminal:
>> GW4PTS AX.25 Connect v1.11
>> Trying...
>> *** Connected to OE1RSA-0
>> *** Cleared
>>
>> ==> But: Kernel freezes
>>
>> I can see this behaviour also in the debian kernel:
>>
>> uname -r
>> 5.10.0-11-amd64
>>
>> This kernel also freezes. I suspect this to be a bug because if I try to
>> reboot the machine instead of the killall command the machine does not shut
>> off and reboot which is a problem with a remotely installed system.
>>
>> Any ideas?
>>
>> 73 de Roland oe1rsa
>>
>> -- 
>> __________________________________________
>>    _  _  | Roland Schwarz
>>   |_)(_  |
>>   | \__) |mailto:roland.schwarz@blackspace.at
>> ________|http://www.blackspace.at

