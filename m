Return-Path: <linux-hams+bounces-423-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4103F977CD9
	for <lists+linux-hams@lfdr.de>; Fri, 13 Sep 2024 12:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B26E72827FA
	for <lists+linux-hams@lfdr.de>; Fri, 13 Sep 2024 10:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1B21D88B9;
	Fri, 13 Sep 2024 10:03:25 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4EF1D86F1
	for <linux-hams@vger.kernel.org>; Fri, 13 Sep 2024 10:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726221805; cv=none; b=Ghj7NXZKNS30+dR1SSHRW0hR0w/xrdcbtM2+dQgaQf5h7g+mWCt+c5kjNIMyjSYkMI1zBHxwEatIJbLcD1igiVfDSK3JKL3YF6Cg3drBGIBdxMihTygy8c6Uqn0+uBjeYX8kcFz0CAl1J/nv6tPqKQxq5M2Oh+et6ScQ4DDK7oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726221805; c=relaxed/simple;
	bh=FbUmRP2XHGZQhiOCWtw7JE6mpsESXDH4ur8n7VuSaiY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=u8L1v+kxWUFYJYx44u5yEWnPdfbP83hHjntXLCJLf2kAtoM/RY0vSIusOBxFk+73+O7RdTy7OhYZjFDWp2BW5y2bOYIiP0tOxRDcroZCcxpJobo5Cy4BsylpoC2hSI2QVPoaC/Dct7s3q33F8H6HNQ5xN2hLi/Z0Hw/kuUKyxAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-82cdb4971b9so223201939f.2
        for <linux-hams@vger.kernel.org>; Fri, 13 Sep 2024 03:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726221802; x=1726826602;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EMSeyNmo4I5UKIr27ZSFVFOvJj/3uCTuGvzRA3OhzIM=;
        b=QprIS8T+1hOI8OoKhnOaVTfZsnU91XPbaNyKGmxYr62uxjUiLP+MSqE7YtNVtiBO1s
         HMWm5LiXPbP2bnWgpmlGbv25/fh+kqUmvUoThgbq1C0jsHtUDXPC6FThdbMEINdsyuBJ
         lc8AaQ/qBdqcLH4VptjKmZCsnee6+nZExejRHOJjePyoA+qYIbTb2DUA8piM3Y0IWoSt
         JBM8RvApCm/miDFdhV3lHt2LHFVeMsRZTcAY8bluqypwW20yyBkxuBwQRKzzCd60xs66
         +BTHW7hkPB2hMwDJa2Wl4D8J433on9BnX1zrG9X/3NRB1nOmnqmVrYU/JtsjdoL5KVYt
         UuIQ==
X-Gm-Message-State: AOJu0Yxzj7DRANgcWBDDwV2SSRHsHTKFy/jM/qBK958siVy/0VBT2O9W
	74paQpsZKZgIQPSy5I0shqzsy+Sf7UnMWy6iyy9W9lc7hv9LUd9m33icFmWGkDWv9s/8QwmyWLG
	qoVqbfTRG/BAD4QGq3phSEqArq+cZ3tGXELBxBnVxZxxeaEtIIS8mh+Q=
X-Google-Smtp-Source: AGHT+IGUtAV7wYUEQOtWKgLLetpmFJnkMxMiloBQa0eQtht2JsrKsSBTlQgqXwlD1EtBNmyF24ElD7niM2jw2fYU953TyI4tkOdx
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d1a:b0:3a0:4bd1:c1ba with SMTP id
 e9e14a558f8ab-3a084924382mr47735975ab.16.1726221802575; Fri, 13 Sep 2024
 03:03:22 -0700 (PDT)
Date: Fri, 13 Sep 2024 03:03:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000058a7dd0621fd5528@google.com>
Subject: [syzbot] Monthly hams report (Sep 2024)
From: syzbot <syzbot+listd30be793d42f6338da3b@syzkaller.appspotmail.com>
To: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hams maintainers/developers,

This is a 31-day syzbot report for the hams subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hams

During the period, 0 new issues were detected and 0 were fixed.
In total, 6 issues are still open and 35 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 687     Yes   WARNING: refcount bug in ax25_release (3)
                  https://syzkaller.appspot.com/bug?extid=33841dc6aa3e1d86b78a
<2> 312     Yes   KMSAN: uninit-value in ax25cmp (3)
                  https://syzkaller.appspot.com/bug?extid=74161d266475935e9c5d
<3> 18      Yes   KMSAN: uninit-value in nr_route_frame
                  https://syzkaller.appspot.com/bug?extid=f770ce3566e60e5573ac

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

