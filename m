Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E1E244E8D
	for <lists+linux-hams@lfdr.de>; Fri, 14 Aug 2020 20:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgHNSsJ (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 14 Aug 2020 14:48:09 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:38776 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbgHNSsJ (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 14 Aug 2020 14:48:09 -0400
Received: by mail-il1-f198.google.com with SMTP id t79so7161313ild.5
        for <linux-hams@vger.kernel.org>; Fri, 14 Aug 2020 11:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=FdIRXuZCQukDRQ0XU5HzlXLbagxjzssCGhlf1mUy6ZA=;
        b=f9q4tWCrevJp9wi98CVE3EcVKSDlcfxEVeybK5BVEHBSc+coyN7vHs9OvdywYms1i9
         lasF4VNXoz2orAvvlbfwvriD29CMB/uRwwXFpgU4eBgiQ4plcmmdaRhE1+HazhEshlxy
         806NQxOORz2q0+cdZJ6IKw12y8QGOEZob/IhKd3WFJ9hlnse3ogaYL5/59Acca/vPIXC
         7w8W045ip2l1bdX+FvFtfW0POP4maUG+x6sU7oThn8YXkv+eizUFadR/I5qVzsUdMlDX
         OIKflehlNBb9b5ZpMO7gnpY8mmKBF6Jk8pbIrBgUAEYEWQkdEQqcNE2QJtKMD+3O0lIb
         6boQ==
X-Gm-Message-State: AOAM530+WAygDEtZsvs3hqiONlM3HauEbQgxLQnqBqxLOkdUOuv2RVjI
        YOUNlu6i2O7FoHfT+4hK3EYNY5/5FyTywbEdV+tsyD51csgY
X-Google-Smtp-Source: ABdhPJzNTvNy1dhu9pwSXa3tWa4iLGVzBCdcRYK93MYJzzPqsQW/K4PnkT/GdTdJGW94oI0/s3HorImYD5cpCRRwVwYGVaoycdZT
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:c09:: with SMTP id d9mr3762153ile.289.1597430888599;
 Fri, 14 Aug 2020 11:48:08 -0700 (PDT)
Date:   Fri, 14 Aug 2020 11:48:08 -0700
In-Reply-To: <000000000000eea12405843bc43c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ab163105acdadc50@google.com>
Subject: Re: KASAN: use-after-free Read in refcount_inc_not_zero_checked (2)
From:   syzbot <syzbot+eff6b596cc8194e2f029@syzkaller.appspotmail.com>
To:     ardb@kernel.org, davem@davemloft.net, linux-efi@vger.kernel.org,
        linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@kernel.org, netdev@vger.kernel.org, nivedita@alum.mit.edu,
        ralf@linux-mips.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit 987053a30016a7d9ab3e4ad973e7c51aeb1f1ef6
Author: Arvind Sankar <nivedita@alum.mit.edu>
Date:   Thu Apr 30 18:28:40 2020 +0000

    efi/x86: Move command-line initrd loading to efi_main

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11680f6a900000
start commit:   9c7dc824 Merge tag '5.1-rc-smb3' of git://git.samba.org/sf..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7e1aaa1cfbfe1abf
dashboard link: https://syzkaller.appspot.com/bug?extid=eff6b596cc8194e2f029
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17e294a3200000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: efi/x86: Move command-line initrd loading to efi_main

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
