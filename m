Return-Path: <linux-hams+bounces-480-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC85A377EA
	for <lists+linux-hams@lfdr.de>; Sun, 16 Feb 2025 22:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D37D63ACB0F
	for <lists+linux-hams@lfdr.de>; Sun, 16 Feb 2025 21:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12911A3154;
	Sun, 16 Feb 2025 21:54:26 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0825118FDAA
	for <linux-hams@vger.kernel.org>; Sun, 16 Feb 2025 21:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739742866; cv=none; b=ZTMAYa3ghibvwqmKWkPglsUP3lpT+Yj9375XrR16mFSgpdhF++XcowaguixDB5SK0or6C4K0dYxGUuEZQUptQnEmpy1zcfd5a87hRReMa38Urb8+QBuKcP2JeZ2usSIvrbotcpcpteedKlXAPz0HnWbP1AFANjM4vwgokIRhg4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739742866; c=relaxed/simple;
	bh=12FxA9JP68+2LUTYA+wtHbmtTMgzkFGriLT2SJUjRiE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hi7O8ASow5qzx4c9wmPUTGUdggLmvQB43JPkg/0EaQJoub3L7EBcUQ0/ax0J5vvfNRtBlRXYOJv5h2ULMrRd7yBJ/7tlS20AX3mVpJBpsLWOzDCWGyV4lzeEN22u1COv0sA9TTaPT1EbkAYO/mwqNRz8CCGPCPf8PD4pqO+pcUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d190ae831fso65387595ab.3
        for <linux-hams@vger.kernel.org>; Sun, 16 Feb 2025 13:54:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739742864; x=1740347664;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DF9gO2b1dWsDC7qG/opNyDJomEflT7vtEOvv8g3Isps=;
        b=jej5v6lDF2c4PbLaQ6/a4gfVJKoD3AiH3RTDipkP+YCfeFDgSbTeTieDcOKLajnbNL
         e0XbRAl3fop0KzPr4vqXVyhN+vK8DM0z6NegSu+mHZSuXifdrF0dwfmZAdLJLxmjGd3A
         vkm2bgE21gSmBasQKlgSSeWdAsF3TqO+8Bx7Kn8UY79vRB9jbRFucsItHNLHO5WD8//l
         sfw0aZDBH6PrQcRRN36YLrk38XNEBWbwTfcC60GzO0smZHLq+1abH6WZe0sLYRF7MLMb
         eiXBBOh1q6idSZrSnv3QY3xjXHWi5039Fw5APU1MGjg7Y3jU/IRdr5G72e6XbmLMIWfy
         6D+g==
X-Gm-Message-State: AOJu0Yw/vO3kpPAt9aUhQwREx1KIwrWwxaN88pD4ohtHW+V/0/fDQK6M
	3JhlosSma0u1qfHiI85xByWFU8EbIp14ybitD39WOwnzddb0lHHVACigZknYtEPMEyqvv0gjGDf
	5KxDDOisZUU5QcTDr2lpiqGBe9jhMp5FJd84Qyt7td5MYoDcHzTZFdZw=
X-Google-Smtp-Source: AGHT+IGCcxhH2fiV0PN+XnZx3IknqK2g+XFDc+UO72yVPyz10o42DRVkyI3UBnGTiZih2AYyKDbuGaj/RwZi5PvPQ0ySnPsA5Oxg
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c24d:0:b0:3cf:bb6e:3065 with SMTP id
 e9e14a558f8ab-3d279694a2emr59373375ab.0.1739742864085; Sun, 16 Feb 2025
 13:54:24 -0800 (PST)
Date: Sun, 16 Feb 2025 13:54:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67b25e90.050a0220.173698.0018.GAE@google.com>
Subject: [syzbot] Monthly hams report (Feb 2025)
From: syzbot <syzbot+list840c40be55a03514cfd1@syzkaller.appspotmail.com>
To: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hams maintainers/developers,

This is a 31-day syzbot report for the hams subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hams

During the period, 0 new issues were detected and 3 were fixed.
In total, 8 issues are still open and 40 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1687    Yes   possible deadlock in nr_rt_device_down (3)
                  https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
<2> 92      No    KASAN: slab-use-after-free Read in rose_get_neigh
                  https://syzkaller.appspot.com/bug?extid=e04e2c007ba2c80476cb
<3> 59      No    possible deadlock in serial8250_handle_irq
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

