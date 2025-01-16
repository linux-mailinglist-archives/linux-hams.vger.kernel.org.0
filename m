Return-Path: <linux-hams+bounces-467-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 338DCA13787
	for <lists+linux-hams@lfdr.de>; Thu, 16 Jan 2025 11:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC2A0165A12
	for <lists+linux-hams@lfdr.de>; Thu, 16 Jan 2025 10:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499C41DC9B8;
	Thu, 16 Jan 2025 10:12:25 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A441DDA32
	for <linux-hams@vger.kernel.org>; Thu, 16 Jan 2025 10:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737022345; cv=none; b=jkC2M5IDDgOOk/LVnMjCIsnfMjtv+3lgg8PSVqkeDF5jmhUi5HZEGfCfllaLGAhgIqEJcbnGkyxqXifkVkhXBffvVzS5p+xiYi2g7JULQ9bUsNrxwBQS6pRP7E2TVLRyAJsCUZxMIeXeV8/JiyOYQK8c8QX719mceE4ccTABPTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737022345; c=relaxed/simple;
	bh=9STRm1svxW5QUhegM8koQv5W+OAbJCN8Cvt/8n16Nfw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=nx9Q1sehwo43QlOOO3t1i1o5NPcl2hLGwVBbV0lserOAzInvscYNmVjXH7eyCXCnbU7PLMQXI6Nv/MxNHvRatqTenKRjCkJmZ5AySegOCCjW8cbwe6Fmdnf24Wx2ZiQOmrImQhaO77AOL0PDmoRawyMv6zNYfOBX2XwXNr9i7Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ce8db7c342so14276855ab.3
        for <linux-hams@vger.kernel.org>; Thu, 16 Jan 2025 02:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737022343; x=1737627143;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vi6bWHZ2WD4rDr2R+lz5qyb7iiwfSNFaHhCWQen1qOk=;
        b=dd43gDhD16W+nJnPQFuBkdgkwLIoxHXD2QZBa0LYxfRlxF1bpoq8O/rVYMEVUgrBmN
         G3hbsZxt9NEfVvwpHZ2cA3HC1NbCDQycDm8MTTheOMgfq33+TzdLj3B1t1jMsYstYOOM
         mKAsN3gA+cU5Drr95AfmxnKXEDa67d5GLnU+r1PNbKkzxcKFyxt0IFNCyDr+5RQ6zscj
         7yT5z9XDiFUAvQ4DP4eMC42ZV3q5uZILfSIeU+yBd5Udun6Rn0wuGUP4cQEi1BaNxEeE
         pNH/fc8JQkwzokrLzA3hFOCCWz45Nj1DjwX9kfBKGGQ9AGK/TwAKpov8CwvTuDY9RJDW
         eT6g==
X-Gm-Message-State: AOJu0Ywdb7J9rrUnfa8gGLbv9qrMp3PUaLJqbksWtf0jqAYz6v2kIKSq
	lJEFP+Shuoh1tA8mM/osY0DwsbA9G90gNz7jn0OtTSenJ1dtWo96soTFsQJMvDKbeOGoUB9Dodg
	jdxS74Sm6y4Ca2KDqB/o0ra1SzQ2zrSyUowpTgDd6gBMz1zIzLKHXUR4=
X-Google-Smtp-Source: AGHT+IEJxyjEqqj2BwsGzMBkjUF56+DFQz5Yavt3OdoaeYdBEfmkRGucBILJZutlcnBX+DPYbTzrtN32tw2zfYkCCfXJdTWr3pLS
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c07:b0:3ce:7d23:34f with SMTP id
 e9e14a558f8ab-3ce7d23048cmr99905335ab.15.1737022342858; Thu, 16 Jan 2025
 02:12:22 -0800 (PST)
Date: Thu, 16 Jan 2025 02:12:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6788db86.050a0220.20d369.002c.GAE@google.com>
Subject: [syzbot] Monthly hams report (Jan 2025)
From: syzbot <syzbot+list6e764589c9e10496560e@syzkaller.appspotmail.com>
To: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hams maintainers/developers,

This is a 31-day syzbot report for the hams subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hams

During the period, 1 new issues were detected and 0 were fixed.
In total, 9 issues are still open and 36 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 3145    Yes   WARNING: refcount bug in ax25_release (3)
                  https://syzkaller.appspot.com/bug?extid=33841dc6aa3e1d86b78a
<2> 517     Yes   possible deadlock in nr_rt_device_down (3)
                  https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
<3> 505     Yes   KMSAN: uninit-value in ax25cmp (3)
                  https://syzkaller.appspot.com/bug?extid=74161d266475935e9c5d
<4> 63      No    KASAN: slab-use-after-free Read in rose_get_neigh
                  https://syzkaller.appspot.com/bug?extid=e04e2c007ba2c80476cb
<5> 50      No    possible deadlock in serial8250_handle_irq
                  https://syzkaller.appspot.com/bug?extid=5fd749c74105b0e1b302
<6> 27      No    possible deadlock in nr_remove_neigh (2)
                  https://syzkaller.appspot.com/bug?extid=8863ad36d31449b4dc17
<7> 7       No    KASAN: slab-use-after-free Read in ax25_release
                  https://syzkaller.appspot.com/bug?extid=a5716c7fb89dcd7205d8

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

