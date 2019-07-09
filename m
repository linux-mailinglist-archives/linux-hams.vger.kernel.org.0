Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7AEE63CAF
	for <lists+linux-hams@lfdr.de>; Tue,  9 Jul 2019 22:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfGIUWD (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 9 Jul 2019 16:22:03 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:42547 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729532AbfGIUWB (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 9 Jul 2019 16:22:01 -0400
Received: by mail-io1-f70.google.com with SMTP id f22so173252ioj.9
        for <linux-hams@vger.kernel.org>; Tue, 09 Jul 2019 13:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=gNp6IGzQMQGefwcCXwihte4j+oJMtUnlDKJXuaM+cUk=;
        b=CT38LtlcY/k0Loq1naAEIpBOZoJgXRGz947t6UXLqgnR0KdJi4E+Sx1Umnhzw4R39i
         3Ut3X9TARP/LevuTzi747vXdZ1NcLMvG5fpUqhbJrjqky4xn5Yn3lqzGI5aqoUbAg9Lt
         5X0VbtzVNZYu0KjntowTmCgr7dMyVcyiGYxpPtT+5FwpHsN3gUWM5zMsok1onTuE4r5c
         kbH7z11esVx3iVbDJ/xLROEdsa/G2p7WhPCn8QXFnwnCn4J6mXThwRcRp+h/qbpMriyJ
         aQ7Mrr6WzjZA2a0xiACDWZnfbkphJ2zy8fEcRS2S7J46/9W2+t6rLLKzycLAimyM3Zia
         1mVg==
X-Gm-Message-State: APjAAAWB6xHgj1stc7GIgCBWuYtMXDuayhOh5Ua1nxAyOnGe69i3ILG5
        YRQYaH1eILSipIMy7q01hmjDDG6PgwPRMWP0FHvto/lvzHz7
X-Google-Smtp-Source: APXvYqwFgwJAcUPiL5NbtuCyvSACDdRE25Si64mrNjVzIA9vXUAmOPuBWXTLl+KgXo65r6gDEueAVIzpruHAb52RcugMcVs1Xph6
MIME-Version: 1.0
X-Received: by 2002:a6b:6409:: with SMTP id t9mr9378524iog.270.1562703720611;
 Tue, 09 Jul 2019 13:22:00 -0700 (PDT)
Date:   Tue, 09 Jul 2019 13:22:00 -0700
In-Reply-To: <0000000000000595ea058d411c35@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000280332058d45509c@google.com>
Subject: Re: WARNING: refcount bug in nr_insert_socket
From:   syzbot <syzbot+ec1fd464d849d91c3665@syzkaller.appspotmail.com>
To:     davem@davemloft.net, linux-hams@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        ralf@linux-mips.org, syzkaller-bugs@googlegroups.com,
        xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

syzbot has bisected this bug to:

commit c8c8218ec5af5d2598381883acbefbf604e56b5e
Author: Cong Wang <xiyou.wangcong@gmail.com>
Date:   Thu Jun 27 21:30:58 2019 +0000

     netrom: fix a memory leak in nr_rx_frame()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1677f227a00000
start commit:   4608a726 Add linux-next specific files for 20190709
git tree:       linux-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=1577f227a00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1177f227a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a02e36d356a9a17
dashboard link: https://syzkaller.appspot.com/bug?extid=ec1fd464d849d91c3665
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16b47be8600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15172e7ba00000

Reported-by: syzbot+ec1fd464d849d91c3665@syzkaller.appspotmail.com
Fixes: c8c8218ec5af ("netrom: fix a memory leak in nr_rx_frame()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
