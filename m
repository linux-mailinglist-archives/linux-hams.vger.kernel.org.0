Return-Path: <linux-hams+bounces-436-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C9F99D78C
	for <lists+linux-hams@lfdr.de>; Mon, 14 Oct 2024 21:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFEE4283F14
	for <lists+linux-hams@lfdr.de>; Mon, 14 Oct 2024 19:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607141CBE8F;
	Mon, 14 Oct 2024 19:37:29 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3513A1B6
	for <linux-hams@vger.kernel.org>; Mon, 14 Oct 2024 19:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728934649; cv=none; b=ScqStADv1rs/e22h14r1a81iH3o4fozTOQUWNGl841S+v2T7C/i0jHWA88Fdaiku/gVzusTO9VlVHJ++jHL8730dSyIppe3Hp4HWyXbDXQyu2HzXL1ZkbQBpqdd0a0ChDFezwQ9Wyhy1+RL9JLT0XG3JYQsazNRYgm6dGrOzdxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728934649; c=relaxed/simple;
	bh=dkWprYV06yBPj2Ha6asytNuUnKevf8LMQ5Bu9plBsdQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QZzqe2dMpM4PKholCdlN44PyPUFnF5RystFWL5r9WovA2CTAHMB2nOB9TbL574S2Q3HHltkWXEGjTfpWl30/hI1C8I+eqjV3g89BkHVmq/q4eu0M5T+xDrQ+hb0lusjXqALMXtgIcOKoyykn8pSO7j1Rh79gVxqGHOqAcxugfg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a3b506c87cso30377045ab.1
        for <linux-hams@vger.kernel.org>; Mon, 14 Oct 2024 12:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728934647; x=1729539447;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m6zhfEcmvR8LP5RK+N2RnIo+SojN5GzY1Y3M0H1jhJ8=;
        b=wpeKEY+Xz3Ht03kA2XPt4W3wM0xauShrXuu6ghJGDHMFfjEeu+ZRYC7c99a2HtRBUs
         W5eaWHJ1fpRI1rwafTcKEMCf7dP4Xux7LWbz/rCjQ+imoNO7kV7105PBw3+O+KP85+X4
         /F4cR608p6Hy9pcZdlLboB9oUAZHAH2Yw3onrxP+Nq3wzrWPEpxPl4wzbTWjOz93M4Uu
         Z12er4z/cGo916BavCScqjzbzHXbk/5h2tpkhgEjHQjZ6z8QzA6DAEcQdXncUCKtJYro
         q8YSOzbPaYfn+rLii09HH3tqoz8OWftdBVNfsxYx+8l1uXBJcvJMNTzaOXyEf6UOS8Qr
         CcZQ==
X-Gm-Message-State: AOJu0Yx27hX+dv1hbR0Ii7cgMRUyM5MA6vTs8k/CtqklSdgrhsm3aHk/
	hNm361UZj9nX1yKOeec8/3bQbBRRJyhi1VRt9g17XcO8nfh4//AkPhr+z6TJkW8qm5MC8jD9oUT
	Mq1AaLY9gy0zqHtK5zsbGoD2ujonsRtsmGJYtdVrDmz0Gk0UI44B77ZA=
X-Google-Smtp-Source: AGHT+IGKwTJp0LfjG357DzLfqB9veonEo++LAW2nl8riHWqn/umiza2bLxlvwyRdvGk5DLnw4oRolR1EktgSsZsFliZ03tnrf4LQ
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c26c:0:b0:3a0:aa6c:8a51 with SMTP id
 e9e14a558f8ab-3a3b5f294b4mr90390205ab.8.1728934647042; Mon, 14 Oct 2024
 12:37:27 -0700 (PDT)
Date: Mon, 14 Oct 2024 12:37:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <670d72f7.050a0220.3e960.00da.GAE@google.com>
Subject: [syzbot] Monthly hams report (Oct 2024)
From: syzbot <syzbot+list35935b20563268355f33@syzkaller.appspotmail.com>
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
<1> 1181    Yes   WARNING: refcount bug in ax25_release (3)
                  https://syzkaller.appspot.com/bug?extid=33841dc6aa3e1d86b78a
<2> 334     Yes   KMSAN: uninit-value in ax25cmp (3)
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

