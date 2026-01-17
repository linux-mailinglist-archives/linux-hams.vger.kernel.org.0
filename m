Return-Path: <linux-hams+bounces-752-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD76D38FED
	for <lists+linux-hams@lfdr.de>; Sat, 17 Jan 2026 18:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08356302C202
	for <lists+linux-hams@lfdr.de>; Sat, 17 Jan 2026 17:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C087240611;
	Sat, 17 Jan 2026 17:00:05 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61FF234966
	for <linux-hams@vger.kernel.org>; Sat, 17 Jan 2026 17:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768669204; cv=none; b=GHQ9m+z8HcjDV4xJUNBYoJGIWQWiIZkRuspvlc/oadmqFLZmZwovoVd9TuFmyZZdPo3HtUwyfi25kWPUxQK4h+Dsfn6T1TK9PpPWiWbsQk41Vj48FB4MdILTROmu9fHtqEV0aLs9hUm5sqBSI+Sc2F9+yf3StZya/6A2vcHFfko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768669204; c=relaxed/simple;
	bh=6F9+pDuLvb8wMjYIzRip030sEnSaVkH0nbJZR7jKfiM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=K72F9MjljVFQ1tB+a4xoAHofx+QHQBfcZWtHOGcxYoxEiFy8oO2cXKG+DF6V9s/vbJnCpUc2yc3l/qgkUXG74ZvjwK0AsFToSUDmQCEZoNI8w1p4kTPr9NcyXsjgOLUavh31+n/nE+FSLsCZiopq0wJE7hIlxi0afTUIaTuiiFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-66102e59148so9199099eaf.2
        for <linux-hams@vger.kernel.org>; Sat, 17 Jan 2026 09:00:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768669201; x=1769274001;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PKusMdsZlLCB78xo6BzsMeO+3r4MZV4WdR4/o1abZH0=;
        b=tq7GrLDT1zEscwkxMVnIIvi/Qenxs9HHRbtZtQjggrA99PCpYCKoIKPbowBHQGJUT3
         PtYRpW3NmuXso3Aj/OFJHlV+sTg4o2+rJnI2NBcbNl98hRtanXqApCvQcZmLG2qn7rQy
         B9ZV9tV3el78WMGk6w4yvtKHvuHo2Vn2u+ZQnS1h88Y5q5YuakjIzjeAysPZSyMJr7KS
         g078FhCd/M22OUQO70Wnx0UBRgjTuue2t74K2sWRFtPGyhY1oIHkJ1qdrePnGHYgPb7V
         zTzHTjVe7AW7FFqsArlvLbSfKUEe1zAJMDSLkEp/GdGEVUtbRFZ0a0g8b3RyVIAoLO0O
         tslA==
X-Forwarded-Encrypted: i=1; AJvYcCVx3w5jVbtECZ3Z/sbYPda6BfOVCz60MGs3P2HQPjvp5D9hBpTWvGoN0tmyTLGbDkbFA3xARR+yQSUG@vger.kernel.org
X-Gm-Message-State: AOJu0YzCJjU54eH92hn1KeutnpUXZ/dnMHsbbsJHTXfCMj3PFVDb+Ivi
	zA7vo5MwFhqt9kGV/LDTBO7zYaUdyS0gi7e79aNLDie3LRylUdSfSp6jwGVvPQ2ebVG5vJ1zLvV
	3YGOeF7sMi5BQoKPZRSkdA9MVgfj4dnrLKJ2BPnsY+Tz/fRyo3lxC7Jbn8GE=
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:216:b0:659:9a49:8eca with SMTP id
 006d021491bc7-66117a44ffbmr2699698eaf.78.1768669201514; Sat, 17 Jan 2026
 09:00:01 -0800 (PST)
Date: Sat, 17 Jan 2026 09:00:01 -0800
In-Reply-To: <20260117142632.180941-1-activprithvi@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <696bc011.050a0220.3390f1.000e.GAE@google.com>
Subject: Re: [syzbot] [hams?] memory leak in nr_add_node
From: syzbot <syzbot+3f2d46b6e62b8dd546d3@syzkaller.appspotmail.com>
To: activprithvi@gmail.com, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-hams@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+3f2d46b6e62b8dd546d3@syzkaller.appspotmail.com
Tested-by: syzbot+3f2d46b6e62b8dd546d3@syzkaller.appspotmail.com

Tested on:

commit:         ea1013c1 Merge tag 'bpf-fixes' of git://git.kernel.org..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1740b522580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d60836e327fd6756
dashboard link: https://syzkaller.appspot.com/bug?extid=3f2d46b6e62b8dd546d3
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15da13fc580000

Note: testing is done by a robot and is best-effort only.

