Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2716F7C42C
	for <lists+linux-hams@lfdr.de>; Wed, 31 Jul 2019 15:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728975AbfGaN6B (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 31 Jul 2019 09:58:01 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:51019 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbfGaN6B (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 31 Jul 2019 09:58:01 -0400
Received: by mail-io1-f69.google.com with SMTP id m26so75406441ioh.17
        for <linux-hams@vger.kernel.org>; Wed, 31 Jul 2019 06:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=FEF26j1D9ZvC1FOg/2C+u2C5uOIP0wZpzYnp05nqnRo=;
        b=EXPN8kMHsp6ZQgX32HGArse84Vx2OGRpufTvSUPqSpXldE9APOLW0AusTnsLm+z1Zo
         20vFLGPzIZvAfCen4ElVoBk/UpVBLA3S7e1n1+VIDVopkToBlDRO/Vo5hYHBpLqEEjY5
         XudFf5rrViTpnyJ7MseDseY0+tQAy5L8EqZZV+fhA7kmKU/I9JPlV0KLglO49tik0gO9
         7dUjG3LfWWpIRjolKOknJFTV/Tpc0vb5WFhe39m7uV3f5+9oi0RInlf2J6myhKeISzo9
         ckUfQiwBaIvJithwoyTFlg/KkVQA5w7Gqbabqz2Tw2hd7zDk5+G8uEuFIyb4NdMuKA/1
         Qi7g==
X-Gm-Message-State: APjAAAXoFbyS65Vz8gfFNwx/8wBUBQiGlrBvvjaCS/6rsDKJ8oFmLquM
        ivuqAGTc9LzGcylRe4YWcObFSAc4lkTQ+ZnEzatfElc7Zufm
X-Google-Smtp-Source: APXvYqx4v+2B+tDfNufu/8jabqDh174TMHU9YBPhF6J18gSgAFOcH5r9L9/kPu54zg3r+7UAdLNDk/GmtNOPv60wADHFIKWDIzGs
MIME-Version: 1.0
X-Received: by 2002:a02:230a:: with SMTP id u10mr43840113jau.117.1564581480591;
 Wed, 31 Jul 2019 06:58:00 -0700 (PDT)
Date:   Wed, 31 Jul 2019 06:58:00 -0700
In-Reply-To: <000000000000de000a058e9025db@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005f7805058efa8333@google.com>
Subject: Re: KASAN: use-after-free Read in release_sock
From:   syzbot <syzbot+107429d62fb1d293602f@syzkaller.appspotmail.com>
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13b52242600000
start commit:   629f8205 Merge tag 'for-linus-20190730' of git://git.kerne..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=10752242600000
console output: https://syzkaller.appspot.com/x/log.txt?x=17b52242600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4c7b914a2680c9c6
dashboard link: https://syzkaller.appspot.com/bug?extid=107429d62fb1d293602f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16a7c8dc600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1498cfa2600000

Reported-by: syzbot+107429d62fb1d293602f@syzkaller.appspotmail.com
Fixes: c8c8218ec5af ("netrom: fix a memory leak in nr_rx_frame()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
