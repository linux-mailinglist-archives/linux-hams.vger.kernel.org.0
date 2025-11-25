Return-Path: <linux-hams+bounces-708-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 298E8C840AD
	for <lists+linux-hams@lfdr.de>; Tue, 25 Nov 2025 09:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0E9B3A7AAE
	for <lists+linux-hams@lfdr.de>; Tue, 25 Nov 2025 08:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42322FDC26;
	Tue, 25 Nov 2025 08:46:29 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6E22DCF55
	for <linux-hams@vger.kernel.org>; Tue, 25 Nov 2025 08:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764060389; cv=none; b=h0pPrAkyOzNqtxNUF4eBeiiu4SC4KPtKwuTT75wM7JXSZ9jb6OM9Acw3fLputBgeCFXfXgfcLDf3D9CO7yxA/V2QPN4Ktu6wVYFC6cJNpX2RTtoE45pgf6PuReToU8inkGTKEjngKINzxYfTHXVwj9KPD5n9zLuV+q/09TUJJ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764060389; c=relaxed/simple;
	bh=mUazT4CGhnuwAIL5Tegt1rikYOeHcjVEU08X4C323s4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=VHW5dpSNkXEzKqcd5nYl4Qx88bot/SEWJBv9vaY9htx0fxVCeriq504voY40gsq8lv3C/cNH2NMqr2m14IvReCI8FXjDpn9xP1hi0GnMCL5zGjh6vBK7xxdu1MMO04gmchDGL339jxI5y7XP07eWX6+lKa0qAVHWZwJIUqCzVLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-433689014feso57043945ab.1
        for <linux-hams@vger.kernel.org>; Tue, 25 Nov 2025 00:46:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764060387; x=1764665187;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1dEBeRnJub0VdFHg6eMlC/lXNTqpgi+LBBoF933KWY=;
        b=BYfhSKLKg6gkK7i1h/EMJ6Gtw9aFCnKGznEhUSbB2X2Vjq2qYEal+0ZK/4DKHn6joz
         W9nQWwLU+kTy5gTQltxnfjv2xZer+tN4/9MpX6qbVFopr0r/u1vtitOg5h8J/smJV0Cn
         cWcA0JiWkO0ggmj4b65xPO7IPax/jFAZgniiCoHVc9W7u6ESdD4zhgFt8/BU72lGmzpe
         TNTiFeYPPQS+uka5exv3CD1wTfBAuDlBFD8KO41qTC2+zmTmPVB96X+/mTlQCrJPzd0/
         mU2yqwXAb4Lzl0Zh+0Jg0geWFdFA5O9Dcnue0ep6BcK5kx50dVWELL8CxyijFlqE5k2G
         gyUg==
X-Gm-Message-State: AOJu0YwedDUKi6300t4sXBBlkPdgxikTw2iaQUuKSopZMIzgzN6ooZJr
	S/rl9+iHVSyzJBK2cXRW7cx/BiNVLbXtIQAXi3ANWW8uX2iUmNGRYhspoQBakMbJyypT7T4VGrx
	dgbYKOqWOyQLiaQxpq2U3jqjTmLElXd4ZsFGAbceAm+coCwdrr1O16DYk3P8=
X-Google-Smtp-Source: AGHT+IGlI0SP+fYg2piPM+tOTAGxNsTjFSc4tHXIHOmEJ5rLmhPAFm0JhWzehDhV4liQjVnyge0vMQjx8uVYYxnLh2IaioxPcYMK
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2789:b0:435:a0b9:5589 with SMTP id
 e9e14a558f8ab-435b98edd8amr116749455ab.39.1764060386998; Tue, 25 Nov 2025
 00:46:26 -0800 (PST)
Date: Tue, 25 Nov 2025 00:46:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69256ce2.a70a0220.d98e3.00a0.GAE@google.com>
Subject: [syzbot] Monthly hams report (Nov 2025)
From: syzbot <syzbot+listfdd86da488cce9cff3d4@syzkaller.appspotmail.com>
To: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hams maintainers/developers,

This is a 31-day syzbot report for the hams subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hams

During the period, 1 new issues were detected and 0 were fixed.
In total, 10 issues are still open and 44 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 9242    Yes   possible deadlock in nr_rt_device_down (3)
                  https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
<2> 2816    Yes   possible deadlock in nr_rt_ioctl (2)
                  https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82
<3> 660     Yes   possible deadlock in nr_remove_neigh (2)
                  https://syzkaller.appspot.com/bug?extid=8863ad36d31449b4dc17
<4> 347     No    WARNING: ODEBUG bug in __run_timers (3)
                  https://syzkaller.appspot.com/bug?extid=7287222a6d88bdb559a7
<5> 1       No    WARNING: refcount bug in nr_del_neigh (2)
                  https://syzkaller.appspot.com/bug?extid=3f991c449d23d41216a2

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

