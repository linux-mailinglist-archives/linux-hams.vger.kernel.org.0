Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA38CE7F58
	for <lists+linux-hams@lfdr.de>; Tue, 29 Oct 2019 05:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbfJ2EqC (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 29 Oct 2019 00:46:02 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:45180 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728139AbfJ2EqC (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 29 Oct 2019 00:46:02 -0400
Received: by mail-il1-f199.google.com with SMTP id n84so5943758ila.12
        for <linux-hams@vger.kernel.org>; Mon, 28 Oct 2019 21:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=YLV8f9ZsfAXyIIZYYq3+IarNtK/1IHU/hb3TF47qpcU=;
        b=BAGUuQ4qvpheHZxKN8iJcGBXUtWSXtOJVC14keKcY2qpjavK4qn1GcKPNRNw2Wm4Ih
         Entc+Lheys3/60EzcVZ8JP2iZDnTHtLuSSmgHwrzX2UrseTEcsKDU8IINF7L4gaY8g9p
         Ch9wDqTzXJt72po68xQeAqiN3/7A+FbjZqJfW2h4iMvQ2BSUPRptZSfIlaIHp/W6fols
         wZ9nckKuusy0WEl042pNzfZbrf/ncZWzlU3qoH6eC/vJMeB4yWlxH0Aoo31X5vzf53WD
         gi3K9dAsFFUS6hPve/eWzgWHj5v7p4t6JZYlaNAnOjBevoZWeQ7rtyLB0lN3Sti0MFgI
         n9xw==
X-Gm-Message-State: APjAAAX3aH8yzA/oq89hZi0a3a7SoI5Ih/ZZvJwzL66Lrr5l413Mv3tj
        iY4aHYsMGqdy4ndMUP7A5JjlB9LZ3yEDSNe8srtsCY05lQRN
X-Google-Smtp-Source: APXvYqy8A5HcqCyEPL5dtBElWBUVccfpfDJnoTHkuyLyMyzE3tC2AL+v78u811xV2KkRr1yWR23ZU1ZAqiGqqPS8jMwtkIRFFbuv
MIME-Version: 1.0
X-Received: by 2002:a5e:d90c:: with SMTP id n12mr1656385iop.140.1572324361470;
 Mon, 28 Oct 2019 21:46:01 -0700 (PDT)
Date:   Mon, 28 Oct 2019 21:46:01 -0700
In-Reply-To: <000000000000fc25a1059602460a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000987900596054b0f@google.com>
Subject: Re: INFO: trying to register non-static key in bond_3ad_update_lacp_rate
From:   syzbot <syzbot+0d083911ab18b710da71@syzkaller.appspotmail.com>
To:     a@unstable.cc, alex.aring@gmail.com, allison@lohutok.net,
        andrew@lunn.ch, andy@greyhouse.net, ap420073@gmail.com,
        aroulin@cumulusnetworks.com, ast@domdv.de,
        b.a.t.m.a.n@lists.open-mesh.org, bridge@lists.linux-foundation.org,
        cleech@redhat.com, daniel@iogearbox.net, davem@davemloft.net,
        dcaratti@redhat.com, dsa@cumulusnetworks.com, edumazet@google.com,
        f.fainelli@gmail.com, fw@strlen.de, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, gvaradar@cisco.com, haiyangz@microsoft.com,
        idosch@mellanox.com, info@metux.net, ivan.khoronzhuk@linaro.org,
        j.vosburgh@gmail.com, j@w1.fi, jakub.kicinski@netronome.com,
        jhs@mojatatu.com, jiri@mellanox.com, jiri@resnulli.us,
        johan.hedberg@gmail.com, johannes.berg@intel.com,
        john.hurley@netronome.com, jwi@linux.ibm.com,
        kstewart@linuxfoundation.org, kvalo@codeaurora.org,
        kys@microsoft.com, lariel@mellanox.com, linmiaohe@huawei.com,
        linux-bluetooth@vger.kernel.org, linux-hams@vger.kernel.org,
        linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ppp@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-wpan@vger.kernel.org, liuhangbin@gmail.com,
        marcel@holtmann.org, mareklindner@neomailbox.ch
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

syzbot has bisected this bug to:

commit ab92d68fc22f9afab480153bd82a20f6e2533769
Author: Taehee Yoo <ap420073@gmail.com>
Date:   Mon Oct 21 18:47:51 2019 +0000

     net: core: add generic lockdep keys

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1467f674e00000
start commit:   60c1769a Add linux-next specific files for 20191028
git tree:       linux-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=1667f674e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1267f674e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb86688f30db053d
dashboard link: https://syzkaller.appspot.com/bug?extid=0d083911ab18b710da71
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15381ee0e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11571570e00000

Reported-by: syzbot+0d083911ab18b710da71@syzkaller.appspotmail.com
Fixes: ab92d68fc22f ("net: core: add generic lockdep keys")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
