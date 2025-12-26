Return-Path: <linux-hams+bounces-739-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 393B8CDE717
	for <lists+linux-hams@lfdr.de>; Fri, 26 Dec 2025 08:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 204E53014601
	for <lists+linux-hams@lfdr.de>; Fri, 26 Dec 2025 07:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B788B31327F;
	Fri, 26 Dec 2025 07:48:25 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B287626B755
	for <linux-hams@vger.kernel.org>; Fri, 26 Dec 2025 07:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766735305; cv=none; b=kwc803JVSUd3KYmXgOncHuOy+BElQNe+QYJDyJA2rcM/FgCGonON7b44EhWKQdW++OuUQ4GpmGc6tjPXvzTKyxeTbiM4hZ6XA4AFqCldd3Xf05ia5EnbPkeZiQ2M7wXLzcLUqIdvR5OlM/EjGrfNVpqKD1qcC0AWsOgbpuDnesA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766735305; c=relaxed/simple;
	bh=ftFRFt0U9pmJXxWqQCcAVjc1cKrvlyiFHWcp6A1zYyA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ssluOKL2bld/TeVwF+wO5bI68hMCYrswIzP23fY7OEs1KyClfsbGbj/87yodnHieEMyHJ0aG1/jLDKA8HBQIBUu8oomuH02vZsn+BKE2g6iLjlAtXPenkb8kss9G+LV2rw1gc/6Cfqf9r0kzsQv0JJ0whLwDsm8WyjsGdNx+NtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-65d12f446c2so10482568eaf.1
        for <linux-hams@vger.kernel.org>; Thu, 25 Dec 2025 23:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766735302; x=1767340102;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tGVqrst9LCTnf0SF44BNbr/KWDe7463rRLU2tsdam3o=;
        b=WftwZfllE5gROLw6b5QB+vZ+zvSmZyg5K4jSJGN56DY0ujYF7MjOoUthMLCFG7P6Fh
         dUdaQEpNY+hEhDiAFPecJbcVqAxIsh0giuonbW5ogcO6NLlL3MxGBKtNEAB/rSOe3ye+
         Ca383yxGryG3SDjoQMpoFhlsQByj5VqQdb25oc1B+qaD8OqB8Yo70blG4/0S7pOkKv7i
         Inb3QftzhQwOTxaiCsZbKDC2JB894jzfg7RqImSCqaPAcOOFOxJXiX8+swz/JoOak34j
         L0q6Wo5z914edhZE1VOqWlpMpdJwGsGQT9ucYHys+SbceTYRk+a7S0MrJ+/CTMhJO5Wm
         ZuHg==
X-Gm-Message-State: AOJu0YzbFyjsTrpPErb1SFeXanx/ZIJ6Y5p/G0qSaGeT///dgD57GTUC
	GehG66Qmo3n6PAGwxut+69cLiMQIAQAraV5vdfaWizrqLoOKfRDQww2SjU0gwwCeyjKmL8TUM0x
	Uw9GVAzEUYyG25TAihDEmYjN1zwGcSweihVqa6nJQjaod9Qa+BXKCgDnvc0c=
X-Google-Smtp-Source: AGHT+IGKh7hFRNhGPM0+1u5wGLSrnOLVnl5f97CwncPfn7WEutnADZVGjx4n7e5CAvmuGXeGFm/Z1kPxg1/4JBAyaU2yPP5FGZc/
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1c87:b0:65d:2872:31a6 with SMTP id
 006d021491bc7-65d28723305mr7340780eaf.17.1766735302652; Thu, 25 Dec 2025
 23:48:22 -0800 (PST)
Date: Thu, 25 Dec 2025 23:48:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <694e3dc6.050a0220.35954c.0067.GAE@google.com>
Subject: [syzbot] Monthly hams report (Dec 2025)
From: syzbot <syzbot+list0a9f29ed00cbd992cb40@syzkaller.appspotmail.com>
To: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hams maintainers/developers,

This is a 31-day syzbot report for the hams subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hams

During the period, 0 new issues were detected and 0 were fixed.
In total, 11 issues are still open and 44 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 10788   Yes   possible deadlock in nr_rt_device_down (3)
                  https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
<2> 3818    Yes   possible deadlock in nr_rt_ioctl (2)
                  https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82
<3> 1192    Yes   WARNING: ODEBUG bug in handle_softirqs
                  https://syzkaller.appspot.com/bug?extid=60db000b8468baeddbb1
<4> 799     Yes   possible deadlock in nr_remove_neigh (2)
                  https://syzkaller.appspot.com/bug?extid=8863ad36d31449b4dc17
<5> 394     No    WARNING: ODEBUG bug in __run_timers (3)
                  https://syzkaller.appspot.com/bug?extid=7287222a6d88bdb559a7
<6> 20      Yes   WARNING: refcount bug in ax25_setsockopt
                  https://syzkaller.appspot.com/bug?extid=0ee4da32f91ae2a3f015
<7> 4       Yes   KASAN: slab-use-after-free Read in nr_add_node
                  https://syzkaller.appspot.com/bug?extid=2860e75836a08b172755
<8> 4       No    KMSAN: uninit-value in sixpack_receive_buf (4)
                  https://syzkaller.appspot.com/bug?extid=ecdb8c9878a81eb21e54
<9> 2       Yes   KASAN: slab-use-after-free Read in ax25_find_cb
                  https://syzkaller.appspot.com/bug?extid=caa052a0958a9146870d

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

