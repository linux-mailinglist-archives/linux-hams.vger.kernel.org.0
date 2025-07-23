Return-Path: <linux-hams+bounces-544-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D33EB0EF71
	for <lists+linux-hams@lfdr.de>; Wed, 23 Jul 2025 12:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FABC7BB52D
	for <lists+linux-hams@lfdr.de>; Wed, 23 Jul 2025 10:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C476128D8FF;
	Wed, 23 Jul 2025 10:08:31 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3A228C037
	for <linux-hams@vger.kernel.org>; Wed, 23 Jul 2025 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753265311; cv=none; b=njX1ADRtzQEtG5Sp/N23Xp36Lt+m38NkS642jVIbELDkpMas24fILjkQChUMje9n814/zWjEF11Ps1KzmF9pnOO8rtwwlBgA9c+MQ70TVIY0bNpBVqFJndSFL95dowQ1Ht0N7bI4o7pLMdNn/LVU71S/FfulrVxTYMWqOeZJnTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753265311; c=relaxed/simple;
	bh=kKJQaGhBElhQ20uA93eAYsEevl1YP025Ukp6RiYXQOo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MbzURQtNJz1V6rKnw9oPuWoedP3SLgCmWclZmutHZ2VSX1xpb1vSa3kuoaK/GISVvDC5yo8jXzUN1T6VlPDYnvythBbScAOcqQWJylCTVOq+iHaFA5byjUvL8q8Jtuy70e5JfWup8Guz0nyXVMCtIYU8oP4TOf3EnPZGkIOmJyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-87c13b0a7ffso982636339f.2
        for <linux-hams@vger.kernel.org>; Wed, 23 Jul 2025 03:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753265309; x=1753870109;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xa262BFzbymM4aCqSeO/zKmpLThSI/29qjkAS1Z9TrU=;
        b=YECV0P2ClMkAPJEFIXTZ1pI49X9jGYcykmeLxTd2TCC6ZUOyGyqm17cKBpCQgIy6Mb
         sR6YGOQaoSq78CGX7t6AzHUGUL/isozKhK2A/jL8j6k/oEPjNIQJUmJgUSz5BVI7nOsY
         Xn3TfJZqAH5/tnUD8AkzaEd3QvTYG3DhoRGrq+3n0VlRtUKGOdUOXNY6P8cfI/g1aw9p
         qdoMKLMcrUJn5YHkyeZx3quLgV9Nkbaq7wwfgJnT+dcXcVYTjT9Oqv+Dr9/BlssaoB97
         Jj/L7qmrhdEUxthEzRPv3VQaeSeET8FamsCTv8v0uPStzqkYMKjqxAwFv0O++Fqw9BOk
         m/Ow==
X-Gm-Message-State: AOJu0YzKXRy+DIwHi/4eX/e5xwjFda0B2prohqIoWjw1bKCfgeKIlp9n
	J8ROr6iHcw2YQE6O2ISFBvKrGZEufwFOUIgbqrJLLFAfSR8cNf4jc5XixVE4RwqvqM/M0kVMFvd
	AZPvZPxQ1EEmuIVKTN+tq3nOjtCoVpJaqveO98aEdQn5ouCEsDHndPMSrsOo=
X-Google-Smtp-Source: AGHT+IFcrhHvTGBz1zdoqCV8kRY2Cm0a5LrAOsbdYDWNMhblZGINElXWEkXposOemC7ppVKx+C7Ql8XUnfFzTc05jT3KXSTNW+p6
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b4a:b0:3e2:dc2e:85d8 with SMTP id
 e9e14a558f8ab-3e33556e315mr43529655ab.19.1753265309091; Wed, 23 Jul 2025
 03:08:29 -0700 (PDT)
Date: Wed, 23 Jul 2025 03:08:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6880b49d.050a0220.40ccf.0003.GAE@google.com>
Subject: [syzbot] Monthly hams report (Jul 2025)
From: syzbot <syzbot+list5a87a1528a3f47c76f8a@syzkaller.appspotmail.com>
To: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hams maintainers/developers,

This is a 31-day syzbot report for the hams subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hams

During the period, 0 new issues were detected and 1 were fixed.
In total, 8 issues are still open and 41 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 4423    Yes   possible deadlock in nr_rt_device_down (3)
                  https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
<2> 1359    No    KASAN: slab-use-after-free Read in rose_timer_expiry (3)
                  https://syzkaller.appspot.com/bug?extid=942297eecf7d2d61d1f1
<3> 787     Yes   possible deadlock in nr_rt_ioctl (2)
                  https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82
<4> 279     Yes   possible deadlock in nr_remove_neigh (2)
                  https://syzkaller.appspot.com/bug?extid=8863ad36d31449b4dc17
<5> 131     No    possible deadlock in serial8250_handle_irq
                  https://syzkaller.appspot.com/bug?extid=5fd749c74105b0e1b302

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

