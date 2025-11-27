Return-Path: <linux-hams+bounces-711-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E77BC8CA76
	for <lists+linux-hams@lfdr.de>; Thu, 27 Nov 2025 03:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D0E3D34EBBE
	for <lists+linux-hams@lfdr.de>; Thu, 27 Nov 2025 02:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA08261B9B;
	Thu, 27 Nov 2025 02:25:07 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5CC25C80D
	for <linux-hams@vger.kernel.org>; Thu, 27 Nov 2025 02:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764210307; cv=none; b=nqIB79Yn5Se4wH3b+apL3kP6WaEUyT+wFh5fOJNHqywli21wgvnT+64AKSNmWNI4l/sqfxBFkx6rphNYjgFYQCvpLKICLQPjouQH0nDDMiF6/xaOtdLrZbBa7+OSYOxqTVzyp2gcfgPn0d4ZclSl0dRUFuLSVQbJFx5nv1SQdjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764210307; c=relaxed/simple;
	bh=c0KQ8T/M4WXFjjg+kIvWA0I5TSTPUPCp/vqmYNwhtF0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bXsLF0jpn8O3/WnZyPWKpfBMf8oc+/qYyMHmednwtfiwXs9qDIOXVp3t7Ps4AhzYjrkZSepqMfw2r+0wUje6DD1l/eqGGqDO3jysXf5hpOJfVMVQXZJDpxNBdahKhandpcC0Gj56va4YSQT9Bu/SgPHu3aflLG9GLw+AgCv3I20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-4331d49b5b3so3852765ab.0
        for <linux-hams@vger.kernel.org>; Wed, 26 Nov 2025 18:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764210302; x=1764815102;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5qoesk12NMlwM7nNkl6e9P0XCKUFBF2i/seWbWJwzTU=;
        b=nTeLNotIgdyTj452X/Zd2K0aPqVu2zFYSk9vAJAGeBc2lNtKgfwuB4ssDv+il3Apit
         L0Zvr5GDJATFKGyl+uFHyLeRjPkjr7UxUjkcytRZsANlCfd+ECHnWtp8+mCcwbCQoKZQ
         3npymnfb084pqDKNqi4VpzIaTdYKTWO7UAX3Choj1dnPp5ezgqoRoeH0PKzwtnFfWEGu
         qwiLJoInrKpj33dvWg0JDSkIGX1r6MgARUwFoq+oK6ma2AKQZZatx2tqxCAEtSGSFRHF
         EWRNQqFGV4pw/RWhPzHAOD7oQgeU4hEs8ZjUG0JjpuYlHQdXQs9PfyoyPyRIlgraENJi
         z0Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUeo5qoYt8P18gD9mQh+NHjHOHYvYTkraY1BNtolU484ZwiNQ1gTH97T0Y7GIgIWQ1bxzI2PHTWoN6G@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz4juoYzmojZ4CN9b5FoZyv84AqHmVc8FIIQzFOk0QsfOwpeZc
	dgBCh8JzsMSf3eKpC1HDGLoLKD3RFAtYoywvUILIo/dGpMWxhQ/L7kmHErZkGemvz3uP20PvRbu
	BWbhFHQti/zV/YiIT5vq8fHUNhg6pI+YOvmCB95RBRPMVSFjLVHh4rEMHOBc=
X-Google-Smtp-Source: AGHT+IF/0CyR1eYO0Jwonqp0JIyT9uMpd1LMBtJsnDudsccN03fh5rT4fgH9cIKCYqTMJyzr61fPH+9nEAkucJu5NlPQqvqzVDgd
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:214e:b0:433:6f20:32cc with SMTP id
 e9e14a558f8ab-435dd065a57mr67975855ab.16.1764210302375; Wed, 26 Nov 2025
 18:25:02 -0800 (PST)
Date: Wed, 26 Nov 2025 18:25:02 -0800
In-Reply-To: <20251127020450.118479-1-junjie.cao@intel.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6927b67e.a70a0220.d98e3.00e8.GAE@google.com>
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

commit:         a3aa8a52 net/netrom: Fix deadlock in nr_rt_ioctl
git tree:       https://github.com/Junjie650/linux.git fix-netrom-deadlock
console output: https://syzkaller.appspot.com/x/log.txt?x=17016e12580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61603eec826f5965
dashboard link: https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

