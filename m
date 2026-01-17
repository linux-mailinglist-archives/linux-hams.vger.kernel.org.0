Return-Path: <linux-hams+bounces-750-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1124BD38D7E
	for <lists+linux-hams@lfdr.de>; Sat, 17 Jan 2026 10:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A301B301FB4A
	for <lists+linux-hams@lfdr.de>; Sat, 17 Jan 2026 09:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F103346A2;
	Sat, 17 Jan 2026 09:52:05 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00E0334683
	for <linux-hams@vger.kernel.org>; Sat, 17 Jan 2026 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768643525; cv=none; b=g4N4bnK/83OJEZDQ3B3Oft+TqGsQNg43cV60LKgvF5tu87Z9Fgl7WZyqO0dFmdM8I9CVh52bxp2aU/oRzTWx9J2JNnXJCE3xzYx+Xpj2SRzU60w3i84O0wUpuUfXYhCI5m0Yu576nSD+W4cCt3oqe2PEoLgtzSy5q6lhSyhPoKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768643525; c=relaxed/simple;
	bh=eGE6xwnWBaZef2Q9XaOEM+/ndlcgV1e5CHdr5Ad2SH8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HkljDK0+8AuupJOSGH50/paRYb+AemkMf7b/P5lJwSjxTinxpFlGcwTlgeDe7+hc4RkWKOksOgVJIziosG8Al2mZ0s1v9FD9ERHVokB+UK34lhK1tgUZSitTIDiF0BwTkidTM9cl41gzZCkZz/2yxkRiEL70gXiS1UnoIRwz4Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-660feca27c9so4816123eaf.1
        for <linux-hams@vger.kernel.org>; Sat, 17 Jan 2026 01:52:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768643522; x=1769248322;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEPbtUYLx2Jm4/KlE923UzOmbnLMxWXF0DLZ1mFy3hk=;
        b=kYMInEDfrzcvKI8BN5dmo3n7MPX3cBGwmjIw+eC+8CGH/ioL3C/xCnoiBsU84bQcQ+
         fXs8dw6nFGTc7Iwpntpog2FY+CM7VUQmBcatw5PGyF36oLf7N4Co8dSs8NjW8gbS5MIl
         MHDWVwtbYP1Y7JoCdmYHhWY91/O98hDeC/qa61bjEczFRChWCZiWJDOph1WNyybtyOqi
         NtnTeb1Qm2aiUqVEz26MbcYuFujWUvvS834STgFOtn77uG28cHtuE7hmQ63ysddYIRQy
         ZSue1A0RkvFrv1KxHGWXkBZbXoy9CPhN2B0UoHAjdjuv3JuffmC6l19awfpMPKSY2UNd
         TsZw==
X-Forwarded-Encrypted: i=1; AJvYcCVlyFxIktsF5cQv1mUpD6ilnr3nDPEk87vCRxrc3+0s/w84NxxsnL2zOQoFyT4AQqIkgkKFV0S6zRn4@vger.kernel.org
X-Gm-Message-State: AOJu0YxNvbryhPLvY7/+iygNfHrGSAu5JPMBvn1WNtcJ84gvW+OziVg3
	8Rl+vKJyA+mKRzDC+M8x49GaKMetObmIgNLmB1DK5afRh89fhZp0jF35cBorlZwGGviupO06W+8
	2wDn/wsp6U+5phNlGERxXC9sYkgw9jKqWZTUfNtt4Yjjqbi2jbW1A51RWdik=
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2914:b0:65b:387a:835f with SMTP id
 006d021491bc7-661188be5cbmr1959340eaf.31.1768643522624; Sat, 17 Jan 2026
 01:52:02 -0800 (PST)
Date: Sat, 17 Jan 2026 01:52:02 -0800
In-Reply-To: <20260117065313.32506-1-activprithvi@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <696b5bc2.050a0220.3390f1.0008.GAE@google.com>
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in nr_rt_ioctl
From: syzbot <syzbot+df52f4216bf7b4d768e7@syzkaller.appspotmail.com>
To: activprithvi@gmail.com, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-hams@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+df52f4216bf7b4d768e7@syzkaller.appspotmail.com
Tested-by: syzbot+df52f4216bf7b4d768e7@syzkaller.appspotmail.com

Tested on:

commit:         be548645 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=149013fc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=86243b7b185acc7e
dashboard link: https://syzkaller.appspot.com/bug?extid=df52f4216bf7b4d768e7
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16c6939a580000

Note: testing is done by a robot and is best-effort only.

