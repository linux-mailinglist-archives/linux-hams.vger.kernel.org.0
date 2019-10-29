Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D965E8A41
	for <lists+linux-hams@lfdr.de>; Tue, 29 Oct 2019 15:09:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388742AbfJ2OJC (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 29 Oct 2019 10:09:02 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:56738 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388520AbfJ2OJC (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 29 Oct 2019 10:09:02 -0400
Received: by mail-io1-f71.google.com with SMTP id o2so3583975ioa.23
        for <linux-hams@vger.kernel.org>; Tue, 29 Oct 2019 07:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=ZXDP0wwnNkRnGcZ/hxzyUBVhVAKO5MP3N/7b/HrN89M=;
        b=JpxyxaMuwvzBdGK+rXHXR072BHPGLLjyUJquT/hQogAjwZwcITtBbVuyVJsoMsbuGo
         D1zttb4wscNJ/lJ6j+yukjIJLRKrXWVruT03Jb1w9N9pIwSaqrJnJqf++gUuSFN8vlOl
         a+pzY7KES+KVVQ/CPlhAFfvt9K2mj91OYgPwTgchRkEHsF0Qr/sIX+mM0MnF0uWx+AFj
         GMx2XSaDyqtPQG7qe/EEap0joVBzMhQ4EMMz+mGVGBArYSAOyxO8vxPxsgQjewj1b3yU
         4T53VOZ9Tts0ms8pNXYCd7vnq9tr6cims21dQEDtktMeasvX6bsKJOO/S0vjswoC44I4
         fltQ==
X-Gm-Message-State: APjAAAW1/Ocn0XpUORLzWj7utHuVrX1zSZczWkWGs5+VZ+1ZdTFQid6Y
        li6Ns99UM8spNURJF/+1ikMWTmAPxKKSo71uet/nPTHIu/SU
X-Google-Smtp-Source: APXvYqyEO6WTdX2TT1MAC5wh+aMxnQAZiQ9NAP9Ue+ASML0EMHR89Lk5xJp5JZTyc5Ij4tXWW9iYcXeag4DdS0UpQCxA/Rt7L8JZ
MIME-Version: 1.0
X-Received: by 2002:a92:8394:: with SMTP id p20mr28056667ilk.73.1572358141217;
 Tue, 29 Oct 2019 07:09:01 -0700 (PDT)
Date:   Tue, 29 Oct 2019 07:09:01 -0700
In-Reply-To: <0000000000009ea5720595dc03a3@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007792ff05960d289d@google.com>
Subject: Re: BUG: MAX_LOCKDEP_KEYS too low!
From:   syzbot <syzbot+692f39f040c1f415567b@syzkaller.appspotmail.com>
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12e05224e00000
start commit:   60c1769a Add linux-next specific files for 20191028
git tree:       linux-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=11e05224e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=16e05224e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb86688f30db053d
dashboard link: https://syzkaller.appspot.com/bug?extid=692f39f040c1f415567b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10be9ed0e00000

Reported-by: syzbot+692f39f040c1f415567b@syzkaller.appspotmail.com
Fixes: ab92d68fc22f ("net: core: add generic lockdep keys")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
