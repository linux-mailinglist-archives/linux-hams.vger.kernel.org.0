Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF84FE612
	for <lists+linux-hams@lfdr.de>; Fri, 15 Nov 2019 20:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfKOTzC (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Fri, 15 Nov 2019 14:55:02 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:34690 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbfKOTzC (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Fri, 15 Nov 2019 14:55:02 -0500
Received: by mail-il1-f198.google.com with SMTP id m12so9832974ilq.1
        for <linux-hams@vger.kernel.org>; Fri, 15 Nov 2019 11:55:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=U5n1EJvZkiPV6GmPCMijT0bUs78C96Uzo+x4t7ZUFTY=;
        b=mwDaR4EFW1hlgBnmdl6sWyW4SVSJnr4ZCrCy+okzfi7FrYBtzsoM1oGheD63l8nK3r
         Bon0pXK7WezopBVvWg0HzJDF96R3DHxQ5O/uX4LiVSTceVmui28TiZiyE7+OLCZk4vyk
         xspGf46ELo+jaVB5aOcIh6X7hXmEm4eme+nEEQChlO+c33xEXvKuV+vhmGDsz0LBy9Qi
         QhuE8ZK6rahzD7De6LM8jyVhNs2AvrCLH5gmFEUqswUd36wwqfSODhMWTMZ2tKuRajfl
         0IZ+pcvXhy7LJI+PU0ysUJ5PrYa/+xOJJl3NyP5YWm90PlYHi9MrWy+nY8ujDUWFV1wd
         pxUg==
X-Gm-Message-State: APjAAAV5UCy/uou2rUQgD7DEYaT0lSH0JJepMM+2MuBfLmT/0yOhCUJ3
        8XfVa7BrgaXexEc/aZeXV+oz4JEwH0RLibzC02mX+wIyVf7Y
X-Google-Smtp-Source: APXvYqxIGmxq4iqQA3DbtD/X1J4Jz5IYKL9pXLRzICSI/jIAIToGkzSJvfrosilkvOBlbcbr72OpVhz6cPCg1PZfxcNzZX7u8n7q
MIME-Version: 1.0
X-Received: by 2002:a02:a09:: with SMTP id 9mr2409414jaw.84.1573847701206;
 Fri, 15 Nov 2019 11:55:01 -0800 (PST)
Date:   Fri, 15 Nov 2019 11:55:01 -0800
In-Reply-To: <000000000000ec7273058b877e1f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000029432d059767f930@google.com>
Subject: Re: BUG: MAX_LOCKDEP_ENTRIES too low!
From:   syzbot <syzbot+cd0ec5211ac07c18c049@syzkaller.appspotmail.com>
To:     a@unstable.cc, alex.aring@gmail.com, allison@lohutok.net,
        andrew@lunn.ch, andy@greyhouse.net, ap420073@gmail.com,
        ast@domdv.de, b.a.t.m.a.n@lists.open-mesh.org,
        bridge@lists.linux-foundation.org, cleech@redhat.com,
        daniel@iogearbox.net, davem@davemloft.net, dev@openvswitch.org,
        dsa@cumulusnetworks.com, edumazet@google.com, f.fainelli@gmail.com,
        fw@strlen.de, gbastien@versatic.net, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, haiyangz@microsoft.com,
        idosch@mellanox.com, info@metux.net, j.vosburgh@gmail.com, j@w1.fi,
        jack@suse.com, jack@suse.cz, jakub.kicinski@netronome.com,
        jhs@mojatatu.com, jiri@mellanox.com, jiri@resnulli.us,
        johan.hedberg@gmail.com, johannes.berg@intel.com,
        john.hurley@netronome.com, jwi@linux.ibm.com,
        kstewart@linuxfoundation.org, kvalo@codeaurora.org,
        kys@microsoft.com, linmiaohe@huawei.com,
        linux-bluetooth@vger.kernel.org, linux-hams@vger.kernel.org,
        linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ppp@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-wpan@vger.kernel.org, liuhangbin@gmail.com,
        marcel@holtmann.org, mareklindner@neomailbox.ch, mcroce@redhat.com
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1126f5c2e00000
start commit:   0e3f1ad8 Remove VirtualBox guest shared folders filesystem
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=1326f5c2e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1526f5c2e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1aab6d4187ddf667
dashboard link: https://syzkaller.appspot.com/bug?extid=cd0ec5211ac07c18c049
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1171546ae00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=133ed206e00000

Reported-by: syzbot+cd0ec5211ac07c18c049@syzkaller.appspotmail.com
Fixes: ab92d68fc22f ("net: core: add generic lockdep keys")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
