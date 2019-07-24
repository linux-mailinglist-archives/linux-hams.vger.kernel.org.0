Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA760723F2
	for <lists+linux-hams@lfdr.de>; Wed, 24 Jul 2019 03:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbfGXBr0 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 23 Jul 2019 21:47:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:57514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbfGXBr0 (ORCPT <rfc822;linux-hams@vger.kernel.org>);
        Tue, 23 Jul 2019 21:47:26 -0400
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net [24.5.143.220])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9596C2238C;
        Wed, 24 Jul 2019 01:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563932844;
        bh=ynXoIaTP+bD7G3EbIql5+OoN47Gr1b+pL9lULzU8ovw=;
        h=Date:From:To:Cc:Subject:From;
        b=I1a1E4Nojt/c/9tpoMi6pd/HkJJnZbc8L+g2nlTtDJb01/PqkVFJ72Y0WBC3yET76
         T9ooPDhZrxRPpWHQfByfU29vzA0wQx5S0EIe2gdPJ4XtKhHXXZlcO1fYNhJj7DGih4
         RzwVrWYL7Qi9NGqx73w0LRlhrBIKM3jo2cy23Qrk=
Date:   Tue, 23 Jul 2019 18:47:23 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     linux-hams@vger.kernel.org, netdev@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        "David S. Miller" <davem@davemloft.net>,
        Cong Wang <xiyou.wangcong@gmail.com>
Cc:     linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Reminder: 13 open syzbot bugs in "net/netrom" subsystem
Message-ID: <20190724014723.GJ643@sol.localdomain>
Mail-Followup-To: linux-hams@vger.kernel.org, netdev@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        "David S. Miller" <davem@davemloft.net>,
        Cong Wang <xiyou.wangcong@gmail.com>, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

[This email was generated by a script.  Let me know if you have any suggestions
to make it better, or if you want it re-generated with the latest status.]

Of the currently open syzbot reports against the upstream kernel, I've manually
marked 13 of them as possibly being bugs in the "net/netrom" subsystem.  I've
listed these reports below, sorted by an algorithm that tries to list first the
reports most likely to be still valid, important, and actionable.

Of these 13 bugs, 8 were seen in mainline in the last week.

Of these 13 bugs, 4 were bisected to commits from the following person:

	Cong Wang <xiyou.wangcong@gmail.com>

If you believe a bug is no longer valid, please close the syzbot report by
sending a '#syz fix', '#syz dup', or '#syz invalid' command in reply to the
original thread, as explained at https://goo.gl/tpsmEJ#status

If you believe I misattributed a bug to the "net/netrom" subsystem, please let
me know, and if possible forward the report to the correct people or mailing
list.

Here are the bugs:

--------------------------------------------------------------------------------
Title:              KASAN: use-after-free Read in nr_insert_socket
Last occurred:      0 days ago
Reported:           5 days ago
Branches:           Mainline and others
Dashboard link:     https://syzkaller.appspot.com/bug?id=44bc727f1e55f249c97e876dd9163484c889b3ad
Original thread:    https://lkml.kernel.org/lkml/00000000000035f65d058df39aed@google.com/T/#u

This bug has a C reproducer.

This bug was bisected to:

	commit c8c8218ec5af5d2598381883acbefbf604e56b5e
	Author: Cong Wang <xiyou.wangcong@gmail.com>
	Date:   Thu Jun 27 21:30:58 2019 +0000

	  netrom: fix a memory leak in nr_rx_frame()

The original thread for this bug has received 1 reply, 5 days ago.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+9399c158fcc09b21d0d2@syzkaller.appspotmail.com

If you send any email or patch for this bug, please reply to the original
thread, which had activity only 5 days ago.  For the git send-email command to
use, or tips on how to reply if the thread isn't in your mailbox, see the "Reply
instructions" at https://lkml.kernel.org/r/00000000000035f65d058df39aed@google.com

--------------------------------------------------------------------------------
Title:              WARNING: refcount bug in nr_rx_frame
Last occurred:      0 days ago
Reported:           5 days ago
Branches:           Mainline
Dashboard link:     https://syzkaller.appspot.com/bug?id=4ffee6ac0fb5068b34959147b4d492bad89e98ab
Original thread:    https://lkml.kernel.org/lkml/000000000000222512058df13ac9@google.com/T/#u

This bug has a C reproducer.

This bug was bisected to:

	commit c8c8218ec5af5d2598381883acbefbf604e56b5e
	Author: Cong Wang <xiyou.wangcong@gmail.com>
	Date:   Thu Jun 27 21:30:58 2019 +0000

	  netrom: fix a memory leak in nr_rx_frame()

No one has replied to the original thread for this bug yet.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+622bdabb128acc33427d@syzkaller.appspotmail.com

If you send any email or patch for this bug, please reply to the original
thread.  For the git send-email command to use, or tips on how to reply if the
thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/000000000000222512058df13ac9@google.com

--------------------------------------------------------------------------------
Title:              KASAN: use-after-free Read in lock_sock_nested
Last occurred:      3 days ago
Reported:           202 days ago
Branches:           Mainline and others
Dashboard link:     https://syzkaller.appspot.com/bug?id=6c137905024f86513297b035845acecb55fa9dab
Original thread:    https://lkml.kernel.org/lkml/0000000000007a5aad057e7748c9@google.com/T/#u

This bug has a syzkaller reproducer only.

No one replied to the original thread for this bug.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+500c69d1e21d970e461b@syzkaller.appspotmail.com

If you send any email or patch for this bug, please consider replying to the
original thread.  For the git send-email command to use, or tips on how to reply
if the thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/0000000000007a5aad057e7748c9@google.com

--------------------------------------------------------------------------------
Title:              memory leak in nr_create
Last occurred:      1 day ago
Reported:           57 days ago
Branches:           Mainline
Dashboard link:     https://syzkaller.appspot.com/bug?id=24be997a573ef9d497d6d7302518779b75d8119a
Original thread:    https://lkml.kernel.org/lkml/0000000000009412c60589e804d8@google.com/T/#u

This bug has a C reproducer.

No one has replied to the original thread for this bug yet.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+10f1194569953b72f1ae@syzkaller.appspotmail.com

If you send any email or patch for this bug, please consider replying to the
original thread.  For the git send-email command to use, or tips on how to reply
if the thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/0000000000009412c60589e804d8@google.com

--------------------------------------------------------------------------------
Title:              WARNING: held lock freed in nr_release
Last occurred:      0 days ago
Reported:           6 days ago
Branches:           Mainline and others
Dashboard link:     https://syzkaller.appspot.com/bug?id=5c3fd3a41060d8d775822814f4651f86a68eb0aa
Original thread:    https://lkml.kernel.org/lkml/00000000000015d943058ddcb1b3@google.com/T/#u

This bug has a C reproducer.

This bug was bisected to:

	commit c8c8218ec5af5d2598381883acbefbf604e56b5e
	Author: Cong Wang <xiyou.wangcong@gmail.com>
	Date:   Thu Jun 27 21:30:58 2019 +0000

	  netrom: fix a memory leak in nr_rx_frame()

No one has replied to the original thread for this bug yet.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+a34e5f3d0300163f0c87@syzkaller.appspotmail.com

If you send any email or patch for this bug, please reply to the original
thread.  For the git send-email command to use, or tips on how to reply if the
thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/00000000000015d943058ddcb1b3@google.com

--------------------------------------------------------------------------------
Title:              KASAN: use-after-free Read in nr_release
Last occurred:      1 day ago
Reported:           45 days ago
Branches:           Mainline and others
Dashboard link:     https://syzkaller.appspot.com/bug?id=5332f4a9ce674d6378f0bd91af752d2be80f3aba
Original thread:    https://lkml.kernel.org/lkml/0000000000007e8b70058acbd60f@google.com/T/#u

This bug has a syzkaller reproducer only.

No one has replied to the original thread for this bug yet.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+6eaef7158b19e3fec3a0@syzkaller.appspotmail.com

If you send any email or patch for this bug, please consider replying to the
original thread.  For the git send-email command to use, or tips on how to reply
if the thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/0000000000007e8b70058acbd60f@google.com

--------------------------------------------------------------------------------
Title:              WARNING: refcount bug in nr_insert_socket
Last occurred:      0 days ago
Reported:           14 days ago
Branches:           Mainline and others
Dashboard link:     https://syzkaller.appspot.com/bug?id=521a764b3fc8145496efa50600dfe2a67e49b90b
Original thread:    https://lkml.kernel.org/lkml/0000000000000595ea058d411c35@google.com/T/#u

This bug has a C reproducer.

No one has replied to the original thread for this bug yet.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+ec1fd464d849d91c3665@syzkaller.appspotmail.com

If you send any email or patch for this bug, please reply to the original
thread.  For the git send-email command to use, or tips on how to reply if the
thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/0000000000000595ea058d411c35@google.com

--------------------------------------------------------------------------------
Title:              general protection fault in prepare_to_wait
Last occurred:      18 days ago
Reported:           201 days ago
Branches:           Mainline and others
Dashboard link:     https://syzkaller.appspot.com/bug?id=c670fb9da2ce08f7b5101baa9426083b39ee9f90
Original thread:    https://lkml.kernel.org/lkml/000000000000fa6a2c057e8b7064@google.com/T/#u

This bug has a C reproducer.

No one replied to the original thread for this bug.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+55f9d3e51d49e20b2ce5@syzkaller.appspotmail.com

If you send any email or patch for this bug, please consider replying to the
original thread.  For the git send-email command to use, or tips on how to reply
if the thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/000000000000fa6a2c057e8b7064@google.com

--------------------------------------------------------------------------------
Title:              WARNING: held lock freed! (2)
Last occurred:      18 days ago
Reported:           15 days ago
Branches:           net
Dashboard link:     https://syzkaller.appspot.com/bug?id=e19c72fff579b255a707a12853df187bdfc81ea3
Original thread:    https://lkml.kernel.org/lkml/000000000000c3810f058d30910b@google.com/T/#u

This bug has a C reproducer.

This bug was bisected to:

	commit c8c8218ec5af5d2598381883acbefbf604e56b5e
	Author: Cong Wang <xiyou.wangcong@gmail.com>
	Date:   Thu Jun 27 21:30:58 2019 +0000

	  netrom: fix a memory leak in nr_rx_frame()

No one has replied to the original thread for this bug yet.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+e54ed2cb16c6da22c549@syzkaller.appspotmail.com

If you send any email or patch for this bug, please consider replying to the
original thread.  For the git send-email command to use, or tips on how to reply
if the thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/000000000000c3810f058d30910b@google.com

--------------------------------------------------------------------------------
Title:              KASAN: use-after-free Write in nr_insert_socket
Last occurred:      1 day ago
Reported:           0 days ago
Branches:           Mainline
Dashboard link:     https://syzkaller.appspot.com/bug?id=e2f70927690b76d55da8d228e55832274d7c0bd0
Original thread:    https://lkml.kernel.org/lkml/0000000000006241fe058e5b9490@google.com/T/#u

Unfortunately, this bug does not have a reproducer.

The original thread for this bug has received 1 reply, 9 hours ago.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+5e54e8e637bc970bbd2b@syzkaller.appspotmail.com

If you send any email or patch for this bug, please reply to the original
thread, which had activity only 9 hours ago.  For the git send-email command to
use, or tips on how to reply if the thread isn't in your mailbox, see the "Reply
instructions" at https://lkml.kernel.org/r/0000000000006241fe058e5b9490@google.com

--------------------------------------------------------------------------------
Title:              KASAN: use-after-free Read in nr_rx_frame (2)
Last occurred:      4 days ago
Reported:           0 days ago
Branches:           Mainline
Dashboard link:     https://syzkaller.appspot.com/bug?id=35d6bc3fe6f43d63357b5d70379d196aa420d6b7
Original thread:    https://lkml.kernel.org/lkml/000000000000e42667058e554371@google.com/T/#u

Unfortunately, this bug does not have a reproducer.

The original thread for this bug has received 1 reply, 16 hours ago.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+701728447042217b67c1@syzkaller.appspotmail.com

If you send any email or patch for this bug, please reply to the original
thread, which had activity only 16 hours ago.  For the git send-email command to
use, or tips on how to reply if the thread isn't in your mailbox, see the "Reply
instructions" at https://lkml.kernel.org/r/000000000000e42667058e554371@google.com

--------------------------------------------------------------------------------
Title:              KASAN: use-after-free Read in refcount_inc_not_zero_checked (2)
Last occurred:      97 days ago
Reported:           129 days ago
Branches:           Mainline
Dashboard link:     https://syzkaller.appspot.com/bug?id=b0192a79bb2d222d3e723d7db60dfb5e0ec0e570
Original thread:    https://lkml.kernel.org/lkml/000000000000eea12405843bc43c@google.com/T/#u

This bug has a syzkaller reproducer only.

No one replied to the original thread for this bug.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+eff6b596cc8194e2f029@syzkaller.appspotmail.com

If you send any email or patch for this bug, please consider replying to the
original thread.  For the git send-email command to use, or tips on how to reply
if the thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/000000000000eea12405843bc43c@google.com

--------------------------------------------------------------------------------
Title:              memory leak in nr_loopback_queue
Last occurred:      55 days ago
Reported:           55 days ago
Branches:           Mainline
Dashboard link:     https://syzkaller.appspot.com/bug?id=20e5b6ff68ec36b9ba8ac5225e560a3a563f343a
Original thread:    https://lkml.kernel.org/lkml/000000000000a7f012058a0c7a65@google.com/T/#u

This bug has a syzkaller reproducer only.

No one has replied to the original thread for this bug yet.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+470d1a4a7b7a7c225881@syzkaller.appspotmail.com

If you send any email or patch for this bug, please consider replying to the
original thread.  For the git send-email command to use, or tips on how to reply
if the thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/000000000000a7f012058a0c7a65@google.com

