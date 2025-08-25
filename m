Return-Path: <linux-hams+bounces-588-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF887B339AD
	for <lists+linux-hams@lfdr.de>; Mon, 25 Aug 2025 10:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B27571B23B5B
	for <lists+linux-hams@lfdr.de>; Mon, 25 Aug 2025 08:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5987E28B3EB;
	Mon, 25 Aug 2025 08:40:46 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5690259CA5
	for <linux-hams@vger.kernel.org>; Mon, 25 Aug 2025 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756111246; cv=none; b=ixxYRd76C0gwQEqs58TueAjKCQs9bCzRd+DR/Z0Ckii3LtsKlvIXKTb6+/ZP+BK1PyJWWz0+Cqy3USjH9tPogdrjBqKv2cLnGxSk3ZGAH3d3QEGtUdb2gnNLHgAm2DN120hQ7dhYwagtSYEQwWFX8KLsXDI44MJU0jyeAK4Dm28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756111246; c=relaxed/simple;
	bh=X+2Fbj6S8nuzTyz+2ZgkfPG0CBKFKbl5r8jvD7hPPYw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ecFw8DVvg1H8LMe5jzlLtuIhszmhlLgmyWZ0fRShrkH8T2gw5N0RrcGKRr/hmVEukXmgacBN05xbgAF6gCelCk0F7EjEflb/ZEuuSPmibGD5XY6GEqpOD3I7P/sAmqmjCNqWfAfrUScVEyXkF1O/SqJMjUXheCSrrOCZZlMTuiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-88432cb7627so363270839f.0
        for <linux-hams@vger.kernel.org>; Mon, 25 Aug 2025 01:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756111244; x=1756716044;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e8Hdg78udQncgEx19zGqlBrSwHXLvMSvhZx9CS0nBD8=;
        b=BEdWEFkR9WMcPJNl2tERWzpdDb+JcORxD1wPSbZYM1lH14H5zRpYY0fGSu1+KuoSm8
         oQf+0OdIEMTZ2udFovNhTl/TiBIrT12QrCkC51GsKMWuLZdqfQeWImwcBG735HlF2H39
         /eAqO1d0Lys4ABGb4/2AGCg5rWgQRyQ+IjZzoLUuLw9cbQr2dbCQRGMUMMq1+yjzEd+t
         EvI52bsDmZ9T/uK2BfgIdXt58r8VNmBO0hQ2wKCEJTuqANzjGBbWvF8oJwEQ0YJ69Qi4
         9yNbM6kfWXYu2mwOSAaIZWpqg5GB6hd4fj77CpAYUeNTjbxJoS9YeCgMbG7Touwy1GAY
         YZRw==
X-Gm-Message-State: AOJu0YzB+C1uq3oe8tlQTsNpinapGJr5nhP8Sziv/78mYPKwhejdShcF
	KU2uI1c717PjV5G/Jl7ckSCTid9chmYTdP2evtuiXNpiZdeL7bQGxPC5DyAfD4qxsN4mrKI+e5C
	im/RRbFS11Yj8l72oueqj5lotqe5sQ3ZPfdBHcgk1Q7fX3nO4HtQVELjMMdU=
X-Google-Smtp-Source: AGHT+IEQfoxqhW0ZEVExh/MHqvkydluHD+eOCLUCHY06tn4EmF6hVh3z9SaoiIVaJjMovJ0zERaluIe6O4SZp8xXKp0EnsfuGvQT
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:148c:b0:3e5:5269:89be with SMTP id
 e9e14a558f8ab-3e921a5d80dmr165890935ab.15.1756111243758; Mon, 25 Aug 2025
 01:40:43 -0700 (PDT)
Date: Mon, 25 Aug 2025 01:40:43 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ac218b.a00a0220.33401d.0401.GAE@google.com>
Subject: [syzbot] Monthly hams report (Aug 2025)
From: syzbot <syzbot+listc5aabc82846dc8bee53a@syzkaller.appspotmail.com>
To: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hams maintainers/developers,

This is a 31-day syzbot report for the hams subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hams

During the period, 0 new issues were detected and 0 were fixed.
In total, 9 issues are still open and 41 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 5358    Yes   possible deadlock in nr_rt_device_down (3)
                  https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
<2> 1111    Yes   possible deadlock in nr_rt_ioctl (2)
                  https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82
<3> 327     Yes   possible deadlock in nr_remove_neigh (2)
                  https://syzkaller.appspot.com/bug?extid=8863ad36d31449b4dc17
<4> 155     No    possible deadlock in serial8250_handle_irq
                  https://syzkaller.appspot.com/bug?extid=5fd749c74105b0e1b302
<5> 28      Yes   KMSAN: kernel-infoleak in move_addr_to_user (7)
                  https://syzkaller.appspot.com/bug?extid=346474e3bf0b26bd3090
<6> 7       Yes   WARNING: refcount bug in ax25_setsockopt
                  https://syzkaller.appspot.com/bug?extid=0ee4da32f91ae2a3f015

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

