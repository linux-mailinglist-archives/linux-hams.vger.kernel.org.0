Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87D2E137DAA
	for <lists+linux-hams@lfdr.de>; Sat, 11 Jan 2020 11:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729361AbgAKKAD (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sat, 11 Jan 2020 05:00:03 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:55678 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729229AbgAKKAC (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sat, 11 Jan 2020 05:00:02 -0500
Received: by mail-io1-f70.google.com with SMTP id z21so3056839iob.22
        for <linux-hams@vger.kernel.org>; Sat, 11 Jan 2020 02:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=DrXkIWbrBX7Fd3/gNLvsOw44mmxpzBLe8lrnfiRlxxU=;
        b=oNeLtpJT3pSOjXrNWoeOSuj31BQPhIT3QsJ4LDmD6sZeU00UmvLZUJWmeKhqtkSv5b
         vUHXhUtC+NkcKjJVwaYjAKHNO9DYyenji9P78pkvH8Tcvw1ytywrcIuAqbV7WWKAoDKk
         YAZCD3m1f41/q1nJ/hwJOvTDs5Jxtsg7Pw7GSwdahPx6MX+wvjW9h6AT1ggx7ZiqZuVp
         bVIkPl7+eaiDdyS/uSzlPUttYYB3qzu8A+2+GIe36ZIPLo93+9s7mzAMntNxy6ZqW3D/
         +sryAi3HdPNRujffEmVRra0jjQVMGAg/Zwh9b9GBcD9AtAdSP0+HWpUAwh8/kGjGhpuu
         Xyvw==
X-Gm-Message-State: APjAAAVtk6el6chIUq+MwMtWaKUGSbVLIS7ZD8yalvUhfVqx3vsHZxrV
        jG0n1tvBBxqIaMFfvdN+YkTEDfpKcRk2fjGkTERHI9nSrgEr
X-Google-Smtp-Source: APXvYqyyzAXe87hNpCj8KaNkoKxDWd8rM9/pHrdZJgUyZW+0chTRAqzVJVUlQ1uS+a/5JliEf7yngQJ01ZzullfmzWMeqcTDBvPj
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:5c3:: with SMTP id l3mr6947066ils.260.1578736801574;
 Sat, 11 Jan 2020 02:00:01 -0800 (PST)
Date:   Sat, 11 Jan 2020 02:00:01 -0800
In-Reply-To: <0000000000007a5aad057e7748c9@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004078ac059bda4ef9@google.com>
Subject: Re: KASAN: use-after-free Read in lock_sock_nested
From:   syzbot <syzbot+500c69d1e21d970e461b@syzkaller.appspotmail.com>
To:     davem@davemloft.net, jhogan@kernel.org, linux-hams@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        netdev@vger.kernel.org, paul.burton@mips.com,
        paulburton@kernel.org, ralf@linux-mips.org,
        syzkaller-bugs@googlegroups.com, tbogendoerfer@suse.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

syzbot suspects this bug was fixed by commit:

commit a07e3324538a989b7cdbf2c679be6a7f9df2544f
Author: Thomas Bogendoerfer <tbogendoerfer@suse.de>
Date:   Mon May 13 11:47:25 2019 +0000

     MIPS: kernel: only use i8253 clocksource with periodic clockevent

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11dd033ee00000
start commit:   3ea54d9b Merge tag 'docs-5.3-1' of git://git.lwn.net/linux
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=195ab3ca46c2e324
dashboard link: https://syzkaller.appspot.com/bug?extid=500c69d1e21d970e461b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=145318b4600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14ac7b78600000

If the result looks correct, please mark the bug fixed by replying with:

#syz fix: MIPS: kernel: only use i8253 clocksource with periodic clockevent

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
