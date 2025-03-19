Return-Path: <linux-hams+bounces-482-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAB7A69AD6
	for <lists+linux-hams@lfdr.de>; Wed, 19 Mar 2025 22:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 481263AB2D9
	for <lists+linux-hams@lfdr.de>; Wed, 19 Mar 2025 21:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B08215783;
	Wed, 19 Mar 2025 21:27:32 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AF12139C8
	for <linux-hams@vger.kernel.org>; Wed, 19 Mar 2025 21:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742419652; cv=none; b=Y4mWUJqRpZW3QSlJyeKkVRgemjs6tV4IxDfF5oK+r0uXb3VP9+bY5+o5snL/FylXygCCUz3mE2f0UM9LWt/Nbu28MVcEHHUcnNP8dNwKu+NYU32NaTY0eKlZP76fhpvZUfQDXj5zwEYdBI6e6ymsbO0Bqe40nBAfixGRIap9vK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742419652; c=relaxed/simple;
	bh=yG4T9nNH2N5xGMJjilcN5AZWkftQcmaDCs0H6C9F1GM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=X/1ehCGCSMYUHQ1kg65kNha1Y1uVlqbsp4xQUiGtZXmD7y4X99DuXsjLG2EbXoNuBjcPYQzNKY4UfMXWVWWQupZqF6NUcfzsUfD0pEhNfOCxfN0iznlIsykWu12/0odt6UYbp+ih3Dy98cJv02bGZw9IO7iCR8DSREJmZw3i0MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d453d367a0so2419585ab.3
        for <linux-hams@vger.kernel.org>; Wed, 19 Mar 2025 14:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742419650; x=1743024450;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qY/nusyBLkaT+7tx8zhuJubwT7+e+QzAs+yIBZGHAEo=;
        b=E3Kq2ulYCWDIeGSXZIu7lkuM1nV9eKC8nlNxglTBFUdoBTWgpQIA1RbvQkn4Kj+VQ7
         3bTarViRUc/0xnIEcgvODDBcW02I+gmDPDqlaK8ye3Zqc1BWZj6vvhT30/UcZPYQ3EER
         yWfG+jTqFhBRE2pHKeLFflAyGr7CzC+DLI0kBTMfmZ+SvI0IwVQsvCG37D/LlfrSccQV
         EVDtTOEDMlAGt1XCYp7FpVGMqFR+QzOvPPF2gH7W2IdqSbjpJBmzrZvrQOt3ZTj4qKDQ
         NHRVmLs2vpFUCBMWWUh5VFqAbQf9I6bFITDeX5OZYDi6/JtN2oJ6zp41Hnx+38Kz1Q/e
         jfTQ==
X-Gm-Message-State: AOJu0YySW23kHAhzDj4jkKxaC0YD6sSamcj9yBDd4AGbRBW6s2qAIULn
	nJEh9OqUgNF6kTQEHLQtb1p/xQWxREiwEy5WYjfDLytgzuA4UFZkZPexZnWb0dP+OGWrM7L3Olv
	88qgVB0+e7bLCUAOcE0rgtsA8oAmWA5igDokIbhQlZGhCX6LLKQuVGV0=
X-Google-Smtp-Source: AGHT+IE8+/yGNnZ1gsnCXBWXO6rvHzVfh87XxnxS3QI8gA8r0RYh5t2hFpcauWtsyJIY5pvRkv0BZ78LcCMD7zMENYvg56eUi9dX
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d04:b0:3d4:2306:6d6 with SMTP id
 e9e14a558f8ab-3d586bfec38mr41382085ab.21.1742419650004; Wed, 19 Mar 2025
 14:27:30 -0700 (PDT)
Date: Wed, 19 Mar 2025 14:27:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67db36c1.050a0220.2ca2c6.01ef.GAE@google.com>
Subject: [syzbot] Monthly hams report (Mar 2025)
From: syzbot <syzbot+list33bbae2fb714b9ee1117@syzkaller.appspotmail.com>
To: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hams maintainers/developers,

This is a 31-day syzbot report for the hams subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hams

During the period, 0 new issues were detected and 0 were fixed.
In total, 6 issues are still open and 40 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 3367    Yes   possible deadlock in nr_rt_device_down (3)
                  https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
<2> 219     Yes   possible deadlock in nr_remove_neigh (2)
                  https://syzkaller.appspot.com/bug?extid=8863ad36d31449b4dc17
<3> 175     No    KASAN: slab-use-after-free Read in rose_get_neigh
                  https://syzkaller.appspot.com/bug?extid=e04e2c007ba2c80476cb
<4> 63      No    possible deadlock in serial8250_handle_irq
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

