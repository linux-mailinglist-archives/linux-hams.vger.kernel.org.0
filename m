Return-Path: <linux-hams+bounces-721-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D592ACA245A
	for <lists+linux-hams@lfdr.de>; Thu, 04 Dec 2025 04:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87A0830450A0
	for <lists+linux-hams@lfdr.de>; Thu,  4 Dec 2025 03:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25092E8B83;
	Thu,  4 Dec 2025 03:41:04 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB931A3160
	for <linux-hams@vger.kernel.org>; Thu,  4 Dec 2025 03:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764819664; cv=none; b=ol7jc9/H0bH5v5WW4vOdP/bRaitgnesRdHKy3808V5eot9qyHSgAEwj5VaHoXx8xCyYrDj/kChKdMGXgWNjGMG3hqKeP7oNxV0NCmEup+GJ4tGwrpWJ6GkIyKJTI6u/IXAzPZWJ+PvCmRpruv+LqTGfuv1yg4BGadQsGJdNBtfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764819664; c=relaxed/simple;
	bh=LY7YjXSMv5QM2d97Lzo7vjQ+FF0L6bDVj++sa3wHLXg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CkeYYZMLaxMeJHV5OYzhFE3T2TvuAYxRBSpuKgHkDQmEQYG816R15WMJey9kQEy0dbIl1USwfbBEpJpiqQaLkpUaX2vZHByhv5zn9SgekJPhQag/2LYYFpqcuideSppfd2JZvv6/0r/Rg+KaU85Di0odmzrKmPBvy4EI9uAci7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6579875eaa2so629173eaf.3
        for <linux-hams@vger.kernel.org>; Wed, 03 Dec 2025 19:41:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764819662; x=1765424462;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=684mHjX5Nuuudv1FXk1bczf9PYLaj/JLC+XpOhoFlCY=;
        b=a06MsyLkeSqtDjXojxHthv1Q3ujGvvqnRo72c9V+vuYOw5+SfYtW4mWPdM8yMYSVKw
         jj0deAi4HqZ+ooYV7Ws4p0WHLxdKYKBcd9nmCwTZ++/FziShj+QH0qgkGD7hWM4cklyK
         zuqkwAfIozk62iCnxaNW1B+Ic5m1ZnCQ5a0IIjbWObF/8tLn7m0ikNfBmqzA58ut9ugo
         yvSB7Pd6odDmmmTUFYnwJ+ugsqddDHxRHI/yMi5g35HqzxjY/erSDfuAMZIefEqZXQig
         iyzrya9FJ4NJNSZ/1h24qIypQsPkwSxqs7wTih6dK59Ca3ABRS+4BVxRnt6qB4Ez0cP5
         5RLw==
X-Forwarded-Encrypted: i=1; AJvYcCU4th/FCpLYk3OPvzxK6X8Txp30AXwVt0rXuk2fr4HRoX8OwScVc8yzcEsYEAXnkS87fT/2S9y8elBv@vger.kernel.org
X-Gm-Message-State: AOJu0YyP0iOzulyEXPztjQ8Vd2A/5iz8GwksT8ZM/UkQPofCzEDXfxyB
	mVh+xLV+KA3dl2SSxI8F4LiCBgM5DqfakPOXz86jInQLS6Qk0dIoFcaKloho4+HymlL4dKZWCVV
	QUwpF52oPPv8AkX75PPZJJRThrPxDHZVchYEeMhDB3MRe5ev9ZqQTlMAjsRw=
X-Google-Smtp-Source: AGHT+IHnGqFrARWr3pjgt/PmTApuc+h3wnpIoZP9JgWK2WINWrnQjFcCmHZrsPoLFh9eb9Z9UzP8Ely3Sd1nYD5034Pj7XuKRQ9o
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1782:b0:453:315b:4f5c with SMTP id
 5614622812f47-4536e55cbebmr2838921b6e.56.1764819662377; Wed, 03 Dec 2025
 19:41:02 -0800 (PST)
Date: Wed, 03 Dec 2025 19:41:02 -0800
In-Reply-To: <20251204032128.23306-1-junjie.cao@intel.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <693102ce.a70a0220.d98e3.01c5.GAE@google.com>
Subject: Re: [syzbot] [hams?] possible deadlock in nr_rt_ioctl (2)
From: syzbot <syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com>
To: junjie.cao@intel.com, linux-hams@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com
Tested-by: syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com

Tested on:

commit:         8dcc9e1c netrom: fix possible deadlock in nr_rt_device..
git tree:       https://github.com/Junjie650/linux.git v2-fix-netrom-deadlock
console output: https://syzkaller.appspot.com/x/log.txt?x=1674401a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=90f44281c1be60ac
dashboard link: https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

