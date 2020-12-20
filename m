Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3EA2DF585
	for <lists+linux-hams@lfdr.de>; Sun, 20 Dec 2020 14:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbgLTN1p (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 20 Dec 2020 08:27:45 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:39757 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbgLTN1o (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 20 Dec 2020 08:27:44 -0500
Received: by mail-il1-f197.google.com with SMTP id f2so7012482ils.6
        for <linux-hams@vger.kernel.org>; Sun, 20 Dec 2020 05:27:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=n9Ie067/gR4fMXT4E00lmBGNgEGmIS/KXKirsqgDKdg=;
        b=AaZLr7AnOZ05zO9Apt5DqzwLrmxkc/3SWU7/svbU5v7KeOWaTlWxTCP0gGoTOV0jhW
         Eq9VjYdxWzQU2COItDRdG+RkcaJWiUgrRjKGifM/AuVZ2SjSbiKsqANtN1lR+FdA2LuB
         bIoyk+VQRiPXyBbsYymzY+NfploqkfWJjSBX7yCswR6Kx//+S99jST5GOWYicxnHoxcA
         AtTO43Af1+Co1geg6dz9I+30bilSDHzXf9sJ5kHIRSOy0v9qL7jPkadN3t71ye2tyhmg
         oNsc5axywYHJitaW9peStw9BVguXwOFLp9oXn5KMxSNK97SyYrcz1BEohIzgmz4FStz6
         I5xw==
X-Gm-Message-State: AOAM530OyJAiGEbWRr1qMiSgMNzCC+txhFHpQBMRi7p9PjuByHdKwBWK
        W3oZo01wKnXbAs08l/y11aueauqm6Nag/VnlltzP1m998X9q
X-Google-Smtp-Source: ABdhPJz0WV+bq4gWjQqAdJcKPoyN5LkRsTcO1cLvkLXZ8xk1JhB7qn+3g0G6GSBE/4x5ruMJpzGZwe6nquxbutZpUUb0aujXgxKR
MIME-Version: 1.0
X-Received: by 2002:a02:8482:: with SMTP id f2mr11518809jai.93.1608470823699;
 Sun, 20 Dec 2020 05:27:03 -0800 (PST)
Date:   Sun, 20 Dec 2020 05:27:03 -0800
In-Reply-To: <00000000000089904d057f1e0ae0@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000014086305b6e54cfc@google.com>
Subject: Re: general protection fault in rose_send_frame
From:   syzbot <syzbot+7078ae989d857fe17988@syzkaller.appspotmail.com>
To:     anmol.karan123@gmail.com, davem@davemloft.net, kuba@kernel.org,
        linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, ralf@linux-mips.org,
        syzkaller-bugs@googlegroups.com, yepeilin.cs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit 3b3fd068c56e3fbea30090859216a368398e39bf
Author: Anmol Karn <anmol.karan123@gmail.com>
Date:   Thu Nov 19 19:10:43 2020 +0000

    rose: Fix Null pointer dereference in rose_send_frame()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=139e2b9b500000
start commit:   23ee3e4e Merge tag 'pci-v5.8-fixes-2' of git://git.kernel...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=f87a5e4232fdb267
dashboard link: https://syzkaller.appspot.com/bug?extid=7078ae989d857fe17988
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=157e8964900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10046c54900000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: rose: Fix Null pointer dereference in rose_send_frame()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
