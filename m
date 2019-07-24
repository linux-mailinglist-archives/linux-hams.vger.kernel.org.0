Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2FCF724C8
	for <lists+linux-hams@lfdr.de>; Wed, 24 Jul 2019 04:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfGXCjD (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 23 Jul 2019 22:39:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:45516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbfGXCjD (ORCPT <rfc822;linux-hams@vger.kernel.org>);
        Tue, 23 Jul 2019 22:39:03 -0400
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net [24.5.143.220])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3729521670;
        Wed, 24 Jul 2019 02:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563935942;
        bh=RA1TnD+FfvHQAbM8YaV15WgVdPoD5QSCIQz4unRK+vw=;
        h=Date:From:To:Cc:Subject:From;
        b=ntFNMrHfm+vQwgpboNJvdUXOgaeD9OHzJqZg1JyKS9r0Xi9nWOQWb+76ZVBEDfLJF
         ysZA9gCp1SAmBGpn+Nj5+Lk9W1LHHsx7ZEwhx+8M7Jo4eMZX6jK4yEJFmJmRsXzuaC
         rvILkgXAT52FBggSA1lJdZjlNyvU4cVUTTtKCxT8=
Date:   Tue, 23 Jul 2019 19:39:00 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     linux-hams@vger.kernel.org, netdev@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Reminder: 3 open syzbot bugs in "net/rose" subsystem
Message-ID: <20190724023900.GZ643@sol.localdomain>
Mail-Followup-To: linux-hams@vger.kernel.org, netdev@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

[This email was generated by a script.  Let me know if you have any suggestions
to make it better, or if you want it re-generated with the latest status.]

Of the currently open syzbot reports against the upstream kernel, I've manually
marked 3 of them as possibly being bugs in the "net/rose" subsystem.  I've
listed these reports below, sorted by an algorithm that tries to list first the
reports most likely to be still valid, important, and actionable.

Of these 3 bugs, 1 was seen in mainline in the last week.

If you believe a bug is no longer valid, please close the syzbot report by
sending a '#syz fix', '#syz dup', or '#syz invalid' command in reply to the
original thread, as explained at https://goo.gl/tpsmEJ#status

If you believe I misattributed a bug to the "net/rose" subsystem, please let me
know, and if possible forward the report to the correct people or mailing list.

Here are the bugs:

--------------------------------------------------------------------------------
Title:              general protection fault in rose_send_frame
Last occurred:      2 days ago
Reported:           194 days ago
Branches:           Mainline and others
Dashboard link:     https://syzkaller.appspot.com/bug?id=f46c94afb217ab49c75350adbd467d86ae2b59a6
Original thread:    https://lkml.kernel.org/lkml/00000000000089904d057f1e0ae0@google.com/T/#u

This bug has a C reproducer.

No one replied to the original thread for this bug.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+7078ae989d857fe17988@syzkaller.appspotmail.com

If you send any email or patch for this bug, please consider replying to the
original thread.  For the git send-email command to use, or tips on how to reply
if the thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/00000000000089904d057f1e0ae0@google.com

--------------------------------------------------------------------------------
Title:              INFO: rcu detected stall in rose_loopback_timer (2)
Last occurred:      46 days ago
Reported:           44 days ago
Branches:           net
Dashboard link:     https://syzkaller.appspot.com/bug?id=42c06438fe5956ab9978486a1898ca2f23b1fc1f
Original thread:    https://lkml.kernel.org/lkml/000000000000cf98fa058adf3615@google.com/T/#u

Unfortunately, this bug does not have a reproducer.

No one has replied to the original thread for this bug yet.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+d37efb0ca1b82682326e@syzkaller.appspotmail.com

If you send any email or patch for this bug, please consider replying to the
original thread.  For the git send-email command to use, or tips on how to reply
if the thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/000000000000cf98fa058adf3615@google.com

--------------------------------------------------------------------------------
Title:              INFO: rcu detected stall in rose_connect
Last occurred:      52 days ago
Reported:           49 days ago
Branches:           net-next
Dashboard link:     https://syzkaller.appspot.com/bug?id=0b258dc8ece5bb93dfb5a137ae25a6db300d5892
Original thread:    https://lkml.kernel.org/lkml/00000000000017b026058a785790@google.com/T/#u

Unfortunately, this bug does not have a reproducer.

No one has replied to the original thread for this bug yet.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+af81c7a21a31b18bec0e@syzkaller.appspotmail.com

If you send any email or patch for this bug, please consider replying to the
original thread.  For the git send-email command to use, or tips on how to reply
if the thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/00000000000017b026058a785790@google.com

