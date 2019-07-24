Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD6F72583
	for <lists+linux-hams@lfdr.de>; Wed, 24 Jul 2019 05:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbfGXDsy (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 23 Jul 2019 23:48:54 -0400
Received: from mm1.mcn.org ([216.150.240.85]:36294 "EHLO mailbe.mcn.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726426AbfGXDsy (ORCPT <rfc822;linux-hams@vger.kernel.org>);
        Tue, 23 Jul 2019 23:48:54 -0400
Received: (qmail 6297 invoked from network); 24 Jul 2019 03:42:13 -0000
Received: from 63.0.134.39.8.furtherreach.net (HELO [192.168.1.125]) (joego@mcn.org@8.39.134.63)
        by mailbe.mcn.org with (AES128-SHA encrypted) SMTP
        (0558837a-adc5-11e9-92c7-00505681b3bc); Tue, 23 Jul 2019 20:42:13 -0700
Subject: Re: Reminder: 3 open syzbot bugs in "net/ax25" subsystem
To:     linux-hams@vger.kernel.org, netdev@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <20190724024049.GC643@sol.localdomain>
From:   Joe <joego@mcn.org>
Message-ID: <623ff230-5883-560c-22d0-3e6b0eeaba39@mcn.org>
Date:   Tue, 23 Jul 2019 20:42:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190724024049.GC643@sol.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-MagicMail-OS: Unknown
X-MagicMail-UUID: 0558837a-adc5-11e9-92c7-00505681b3bc
X-MagicMail-Authenticated: joego@mcn.org
X-MagicMail-SourceIP: 8.39.134.63
X-MagicMail-RegexMatch: 2
X-MagicMail-EnvelopeFrom: <joego@mcn.org>
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hi Eric, How do I get off of this thread? When I try to unsubscribe it 
tells me I'm not a member of the group.

Thanks in advance,

Joe G.

On 7/23/19 7:40 PM, Eric Biggers wrote:
> [This email was generated by a script.  Let me know if you have any suggestions
> to make it better, or if you want it re-generated with the latest status.]
>
> Of the currently open syzbot reports against the upstream kernel, I've manually
> marked 3 of them as possibly being bugs in the "net/ax25" subsystem.  I've
> listed these reports below, sorted by an algorithm that tries to list first the
> reports most likely to be still valid, important, and actionable.
>
> If you believe a bug is no longer valid, please close the syzbot report by
> sending a '#syz fix', '#syz dup', or '#syz invalid' command in reply to the
> original thread, as explained at https://goo.gl/tpsmEJ#status
>
> If you believe I misattributed a bug to the "net/ax25" subsystem, please let me
> know, and if possible forward the report to the correct people or mailing list.
>
> Here are the bugs:
>
> --------------------------------------------------------------------------------
> Title:              general protection fault in ax25_send_frame
> Last occurred:      0 days ago
> Reported:           204 days ago
> Branches:           Mainline and others
> Dashboard link:     https://syzkaller.appspot.com/bug?id=1cdd5b120f129364fc8e9b2b027826cf99fa696e
> Original thread:    https://lkml.kernel.org/lkml/0000000000009ea37c057e58d787@google.com/T/#u
>
> Unfortunately, this bug does not have a reproducer.
>
> No one replied to the original thread for this bug.
>
> If you fix this bug, please add the following tag to the commit:
>      Reported-by: syzbot+e0b81535a27b8be39502@syzkaller.appspotmail.com
>
> If you send any email or patch for this bug, please consider replying to the
> original thread.  For the git send-email command to use, or tips on how to reply
> if the thread isn't in your mailbox, see the "Reply instructions" at
> https://lkml.kernel.org/r/0000000000009ea37c057e58d787@google.com
>
> --------------------------------------------------------------------------------
> Title:              KASAN: stack-out-of-bounds Write in ax25_getname
> Last occurred:      90 days ago
> Reported:           206 days ago
> Branches:           Mainline and others
> Dashboard link:     https://syzkaller.appspot.com/bug?id=fb195f91dc044978c1b186f1288b1eff61edcc20
> Original thread:    https://lkml.kernel.org/lkml/000000000000ed4120057e2df0c6@google.com/T/#u
>
> This bug has a syzkaller reproducer only.
>
> No one replied to the original thread for this bug.
>
> If you fix this bug, please add the following tag to the commit:
>      Reported-by: syzbot+6a29097222b4d3b8617c@syzkaller.appspotmail.com
>
> If you send any email or patch for this bug, please consider replying to the
> original thread.  For the git send-email command to use, or tips on how to reply
> if the thread isn't in your mailbox, see the "Reply instructions" at
> https://lkml.kernel.org/r/000000000000ed4120057e2df0c6@google.com
>
> --------------------------------------------------------------------------------
> Title:              inconsistent lock state in ax25_std_heartbeat_expiry
> Last occurred:      122 days ago
> Reported:           120 days ago
> Branches:           net
> Dashboard link:     https://syzkaller.appspot.com/bug?id=9086a8eac930890b2730d6441093bd478e32913f
> Original thread:    https://lkml.kernel.org/lkml/0000000000001b07250584efbee3@google.com/T/#u
>
> Unfortunately, this bug does not have a reproducer.
>
> The original thread for this bug received 2 replies; the last was 119 days ago.
>
> If you fix this bug, please add the following tag to the commit:
>      Reported-by: syzbot+e350b81e95a6a214da8a@syzkaller.appspotmail.com
>
> If you send any email or patch for this bug, please consider replying to the
> original thread.  For the git send-email command to use, or tips on how to reply
> if the thread isn't in your mailbox, see the "Reply instructions" at
> https://lkml.kernel.org/r/0000000000001b07250584efbee3@google.com
>
