Return-Path: <linux-hams+bounces-690-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3251EC07CEA
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 20:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90BAD189C8B9
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 18:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D3134A776;
	Fri, 24 Oct 2025 18:48:31 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609121E51FA
	for <linux-hams@vger.kernel.org>; Fri, 24 Oct 2025 18:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761331711; cv=none; b=IqLobaTenEpfVqKaDBXQ751wB01aeluqkQKB9AbX8TrmsbGvFZCumebg4NP3RMbpJbxJ3e0+HCTtqCssuRsyH43A+i/M3iJnRZRuuWMm98TD/8WC3skJJiCEFruVq2Jqn0RtZ7PvTsEVP0sDNd3GDdPMWM9POH9Y3I9EtafkX40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761331711; c=relaxed/simple;
	bh=fDijtuwiEhlwkDTtGcvFXRtp4U6kxPCtS3/c4WMiHgA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MQpQDO4PncyDtn1gcWeTCPr3a+tkXDS4lhnNqsErGldSFJn7e8kdmeKFTxjygS3m8qDbOkbVvpbLnz1T/IOxISpuYYxc9e5M8rGRyWKnRtNZXjE0hlnU0PY1ofzkWgkJiJr+AESvfAbBdLLRVsqmACrGCjEy8rnOua9IR3M6C8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-430ca53080bso24943125ab.1
        for <linux-hams@vger.kernel.org>; Fri, 24 Oct 2025 11:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761331708; x=1761936508;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7TlINdt0svkSrJe3OM+W/FrHLw0RPfB7YQtqUWUDNfc=;
        b=er0lHa7cshB9fqEDw14POFzUpooeuHYyAP3yMJYeqMrKTVToy5/dCGjIoAUYejTkHo
         cGO+VTuSkg/9LVLGjbquj/0UuGFdsBu9Xg++ovPtfXSXJkCH130YP5HEZ5t6A7pQRUzM
         kkzSXZHzUnVddJlU5GV1TC0BBVi3X4ZXNNA+2EtG6fVxi9cr7qsoGzHDvH+HmRf30D11
         /yNiG6UGmlCJNg8lJ/8GMv+N8iel/NP/H4QxIZ6j+EevCUStvfhOVHfFYOYcUCfpTKuB
         PXUsUMniSvVYN3Q9mC+56mDwq+exe3idKOwrYcSwTP/r7PIuU/vEmKx63zJF3JQjQuNt
         XcdQ==
X-Gm-Message-State: AOJu0Ywql4yuufPFnGNaj+jFR1hlf4kVpeyRdNtNbg/31/pA4D9Gw+nH
	ftxeaSMYyBvcMtkI+Mp7yYIrqmDMEYQ/CveH0JwZJ6AkoL9tWu1IqUYsbCktODFyjFRRR9e9g4n
	9oJVB57f8v+9VCchMjOYD8kuEGNcihCYR2IYyu/jbbvLruWUqvUJs8hxm3ms=
X-Google-Smtp-Source: AGHT+IEHw9DBAt30oJGNzYmdu/6XjHvDF53KydCD/kmP16b6cS6Vveh9KSeZRC8fkn/KpnF4de3BdXlnpk1GrRHhcHKoeoGTuveJ
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c26c:0:b0:431:d864:366a with SMTP id
 e9e14a558f8ab-431d8643888mr128262485ab.2.1761331708479; Fri, 24 Oct 2025
 11:48:28 -0700 (PDT)
Date: Fri, 24 Oct 2025 11:48:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68fbc9fc.050a0220.346f24.0154.GAE@google.com>
Subject: [syzbot] Monthly hams report (Oct 2025)
From: syzbot <syzbot+list9f996a166fa4824c1704@syzkaller.appspotmail.com>
To: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hams maintainers/developers,

This is a 31-day syzbot report for the hams subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hams

During the period, 1 new issues were detected and 1 were fixed.
In total, 10 issues are still open and 44 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 7989    Yes   possible deadlock in nr_rt_device_down (3)
                  https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
<2> 2208    Yes   possible deadlock in nr_rt_ioctl (2)
                  https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82
<3> 709     No    WARNING: ODEBUG bug in handle_softirqs
                  https://syzkaller.appspot.com/bug?extid=60db000b8468baeddbb1
<4> 560     Yes   possible deadlock in nr_remove_neigh (2)
                  https://syzkaller.appspot.com/bug?extid=8863ad36d31449b4dc17
<5> 230     No    WARNING: ODEBUG bug in __run_timers (3)
                  https://syzkaller.appspot.com/bug?extid=7287222a6d88bdb559a7
<6> 13      Yes   WARNING: refcount bug in ax25_setsockopt
                  https://syzkaller.appspot.com/bug?extid=0ee4da32f91ae2a3f015
<7> 2       No    KASAN: slab-use-after-free Write in rose_t0timer_expiry
                  https://syzkaller.appspot.com/bug?extid=350060a9356421ae83dc

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

