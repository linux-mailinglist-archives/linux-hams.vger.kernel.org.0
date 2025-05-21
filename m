Return-Path: <linux-hams+bounces-518-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8D0ABF89C
	for <lists+linux-hams@lfdr.de>; Wed, 21 May 2025 17:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB16C4E7072
	for <lists+linux-hams@lfdr.de>; Wed, 21 May 2025 15:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3F5221FAD;
	Wed, 21 May 2025 14:55:35 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21690221734
	for <linux-hams@vger.kernel.org>; Wed, 21 May 2025 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839335; cv=none; b=nivTizpwVwvma/2OnakbvoR/ejEAFfJNAXEPDLvSUYnKnmPz23HfgBLTJPQSSafsy+1GWuqjl+tOZcYQh4GgApTTpHAvaERxwIPRmMcnvM5pHs9Smk5XpILK/fM6nlHODcvGnzXZvHwy33s81Q/lymFiFf6ZbeVjMnUrZWken0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839335; c=relaxed/simple;
	bh=7aC1JFlJZC4DzuXo5UNsxoo2hoz3sVAMFo0FeeyWrBA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=izUYcn7XVd8Z75j8vzCZAEe9g1DBkodRVZ+QQJrz4TNC9gQWRrFWN+mycAnHHCezltOGXlyvNiJNPRKx6vvy+tMdQ6ZRtxHsMgJei5C6q8ezIA5jVwaTFHLsgRIWuoXL8nYHvNT4KWT6cRJb5hepIwz3CG7XByQkX0Mi8D9lT2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86a50b5f5bdso345417839f.0
        for <linux-hams@vger.kernel.org>; Wed, 21 May 2025 07:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839333; x=1748444133;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVkLcreEGxWf9CWcJBGD5Glu9UoiEI6rdnhABCYz4Uc=;
        b=N9z4OUlbjav9mil06EOAGbq1IsvYMapo9QVW8QSSlDZQRSaElHP7ebWQ/yd1tXrKfq
         n063ychOGQprJLhptvksIU+OO3GoU1DfYZ9dxk6Zo3lxelmT5hmHCaIZ5HSjk1eUIL4e
         KGKmfHmgPVyb0EMqOOZm38h0GYmQWaTg5VdhqvxOm/V8hnYKBn5NOebXAXr98WbwH6Yw
         Jk7c51ldNhtK8+M1PXg40vfigf1lBBo/1yOwOhHTpFXk/qGX1lzocrQsQETSShEiylHt
         duMRgQPSB+gje+/4J6mSQhKX1v2saYpAXb/Vh+82V7RHNjYaBJIdjhaDoQ2zTLKLshId
         RiPA==
X-Gm-Message-State: AOJu0YyHBWrod7OzAkgRLUFY/d0dbOPKmVCqqUI8WKlCI2J9CmSEVGat
	3BGBxhrUUvAD3khO64IBh6+bAcdnWyj3Ey0SMzoMtLhic+qZsyRKfmFbFk8vYOB8oBDX4Bh3RYn
	ZatDpVY9b2MzTmuxpPwn9DZDeWbJZESVwNqQ2xsEpI02vtk3jj5Yumco6w/M=
X-Google-Smtp-Source: AGHT+IHU3VOEtR1uxykFIZrxe5rsDjd3adSviinbsN8tiduT8BUfJ+kIHoWgSOKKBBfAdvb56JDQ1InZaweUiKFe+b6dknXVv2b2
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6a8e:b0:866:217f:80a with SMTP id
 ca18e2360f4ac-86a24c12feemr2365065639f.7.1747839333227; Wed, 21 May 2025
 07:55:33 -0700 (PDT)
Date: Wed, 21 May 2025 07:55:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682de965.a00a0220.29bc26.0290.GAE@google.com>
Subject: [syzbot] Monthly hams report (May 2025)
From: syzbot <syzbot+list0ce723fccf3cd8df852f@syzkaller.appspotmail.com>
To: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hams maintainers/developers,

This is a 31-day syzbot report for the hams subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hams

During the period, 1 new issues were detected and 0 were fixed.
In total, 5 issues are still open and 40 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 4013    Yes   possible deadlock in nr_rt_device_down (3)
                  https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
<2> 685     Yes   KASAN: slab-use-after-free Read in rose_get_neigh
                  https://syzkaller.appspot.com/bug?extid=e04e2c007ba2c80476cb
<3> 263     Yes   possible deadlock in nr_remove_neigh (2)
                  https://syzkaller.appspot.com/bug?extid=8863ad36d31449b4dc17
<4> 97      No    possible deadlock in serial8250_handle_irq
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

