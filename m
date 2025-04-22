Return-Path: <linux-hams+bounces-516-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FE7A9658A
	for <lists+linux-hams@lfdr.de>; Tue, 22 Apr 2025 12:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 597E03BBE80
	for <lists+linux-hams@lfdr.de>; Tue, 22 Apr 2025 10:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B15211713;
	Tue, 22 Apr 2025 10:11:37 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F57A200BBC
	for <linux-hams@vger.kernel.org>; Tue, 22 Apr 2025 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316696; cv=none; b=l8fs4tvjMHRM2JZwmQuuOy7Z/LCRtx/OVUNVD6kaF107M/ZC4xoRk+zZa9+BMaZsZ5lrStpqqFEpxhw9cVLARiyX1IVJpKRYMf7+GLtSyk6yA8K1cqUAQd9n4BasiycZpOCeF7hHwidFTfGMXy7kH/aQh81kWri9d5YQ1Ue05xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316696; c=relaxed/simple;
	bh=MyddPXEqkT/ccEpbWGrSBV3tL1l6iZYEwssAfmCAvZU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=m2zFav1OGw/ApijuVsNdbZB9zkECk92GSwFz/haALPVXSVGo0uz3zomWVc9XU+PncJ4w5fzGPWfWxd1tJvbHAJ3Bzd4fhcVUPZMMezdgou8fcPq989FWGXXzxL0kFl32w6M58WlIRbCzDSdSMFHXvyFkVqC1PTD4jX0vyP/CnrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d7f24a7582so82552725ab.0
        for <linux-hams@vger.kernel.org>; Tue, 22 Apr 2025 03:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316694; x=1745921494;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fJWypGmhAyE0A0ZD6qLvLINF6ckB8EvT9cNMNlbIZ24=;
        b=srv7g7k1q9UJ2lV+b3fqIhxWdAYPTD+lMDJz+zVWVqsLQMJ1a+nL6zDxvHjst2gXaC
         5jm69oxRv5G3XCXFuawULDVjPhOXThHZ7i+k8M+z3Pj542kYWiP+5Zdj8QPxkocLa/FG
         xB31MS/+KRWUo7gkjvt19yYPYxIyyBHWHAMcD2mzIQzDr3iS/mA3PQZzUxRcIQ6bpXbz
         chSnNll/SU6lDqBJ/weRNli2YctgsmbNRGEg1efN8ZNcIwu43iMpA0K1LdZcj2XlJkUj
         gY0Jafv1+/5ITs3z+2zk4fZ05Ayr33ZRZqxZwr5OM/5Z4T+kXGasAo2qBoA7Y9193WST
         P+lA==
X-Gm-Message-State: AOJu0Yx8BFu0r+aBOpuYvgCxTbhfH/3Sm+euTnbkvRLHmVEecfcJDFqW
	ROL/19KwGnRITuExrTQgoeRXhcrWWspJ0+9zQ234DYkNSyB0aVngp3soXzP5DZU4tN7LXGS5tJw
	N84zHS5O6KsDJd0p0EJ+sJTiqTgY6Stez9Gi90oF83ePszE05cXvEl10=
X-Google-Smtp-Source: AGHT+IF3Pzr6mNNm3jKbTEmt/tdnyT6K4L/LfgukilGYn+EG5iVlnNcj8TwE+lTNnTv55J0AwtB55Iq05Bdjfx8vUwv8lcpJaQDX
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18c6:b0:3d5:8923:faa5 with SMTP id
 e9e14a558f8ab-3d88edc18eamr129416475ab.10.1745316694304; Tue, 22 Apr 2025
 03:11:34 -0700 (PDT)
Date: Tue, 22 Apr 2025 03:11:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68076b56.050a0220.8500a.0005.GAE@google.com>
Subject: [syzbot] Monthly hams report (Apr 2025)
From: syzbot <syzbot+list7d5d7954b33bdb027232@syzkaller.appspotmail.com>
To: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hams maintainers/developers,

This is a 31-day syzbot report for the hams subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hams

During the period, 0 new issues were detected and 0 were fixed.
In total, 5 issues are still open and 40 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 3688    Yes   possible deadlock in nr_rt_device_down (3)
                  https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
<2> 303     Yes   KASAN: slab-use-after-free Read in rose_get_neigh
                  https://syzkaller.appspot.com/bug?extid=e04e2c007ba2c80476cb
<3> 256     Yes   possible deadlock in nr_remove_neigh (2)
                  https://syzkaller.appspot.com/bug?extid=8863ad36d31449b4dc17
<4> 90      No    possible deadlock in serial8250_handle_irq
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

