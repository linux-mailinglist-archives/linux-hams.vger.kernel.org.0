Return-Path: <linux-hams+bounces-65-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A04886C6C
	for <lists+linux-hams@lfdr.de>; Fri, 22 Mar 2024 13:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 828C01C21811
	for <lists+linux-hams@lfdr.de>; Fri, 22 Mar 2024 12:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F26544C89;
	Fri, 22 Mar 2024 12:56:22 +0000 (UTC)
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAB2446A0
	for <linux-hams@vger.kernel.org>; Fri, 22 Mar 2024 12:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711112182; cv=none; b=Krp7W2TJ+DbHugGEe21oXKvjZp5nBE5mqks+P0CTR25r/Sct2BbRcS2BZHyDz2xJXorPybCNtFAJMww2SIRdbcQn3U/ApdoWc9WnEHAeBCV/jKocl2PIe9PAUJapuI+kl3AJNMPptNpgxGoxWUDfvssSiJ7qgWJVkJ/aG2bzDCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711112182; c=relaxed/simple;
	bh=AKxsIZe47m3HwkKzZpHYJnNtFzfNN0OZqc8+pBilnfo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=GSW97jFmBYv6yT/cseasoEB4s3GLNubCqUDDLmRS3qAfTPvglaR9epvW4g3Av6HmMUUxhZ2KGlRX5KD/7FU4VVzQLLzb3p1ZXBde8xtXKW858xu7to91YN4yyulq9CLtvqpM2bHEPsI+08MaafZ5RPY4SexnT/cWbSPtLu3tUyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7cc044e7456so192706539f.1
        for <linux-hams@vger.kernel.org>; Fri, 22 Mar 2024 05:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711112180; x=1711716980;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=as3kHiPIe02alo97ccAAheYCyCVs1t+AreIadrBewbU=;
        b=fZGUpME1kXiOP2aHRZBI0AJORQsCdDZAIjyw4x0qFSu3l1EgZeXwJHinLEPUJYZHfb
         sxGlGlztcX7/fCkpLv8ZXDPNaBl1h+lGEQtEGOlYMs5tVBflQ4tqvbIgvGP4CQGCpi30
         q3M3qYSjQ/1ipXPtqMNSyHfgm4p0TMZk/Tg8Qhn2+V+VKe15u4gCyCBeMGhXlloutQZB
         tCnQkhLMqCbhPtqG6Q+I9w9QzAKoUPNts0cLxvmCB9QvQA04etqg8CwrTbfYKaflEWIJ
         eIThewOV6ixiPzSK5ujFwTOxcvhef5DzLyV4pGGEBoPsT4dnxfq8rJemlRO9vMK8JMzE
         EqWQ==
X-Gm-Message-State: AOJu0Yy7k7lV0LNOjNV+CWTmQ/Zy+qmcwAUhnBDz/1E8ZxxnlDSXiMBw
	XyshO4itHMLXy9UmFyaB01Ld295in4SlBWmDmmW1in9mwFgvitql9qSRmmvHZV/kxHtJhykFdse
	oLZwYCR8yc/A+JBQISlCBKQpqtC4n4tvePGJ97ERX1IjjrMqvs5I3gtQRug==
X-Google-Smtp-Source: AGHT+IG86pGwdCn0JEExxN2xo64ljJuewF8hAjPl93yXSVAUqGKIY+C7rCnNwzMBrtKUuEATBsFMxnyobTw3G0++DGZZWolC4u6/
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3411:b0:7cc:1019:a69d with SMTP id
 n17-20020a056602341100b007cc1019a69dmr138660ioz.0.1711112179969; Fri, 22 Mar
 2024 05:56:19 -0700 (PDT)
Date: Fri, 22 Mar 2024 05:56:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a8810606143f5948@google.com>
Subject: [syzbot] Monthly hams report (Mar 2024)
From: syzbot <syzbot+list8065faf9059b8f933690@syzkaller.appspotmail.com>
To: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hams maintainers/developers,

This is a 31-day syzbot report for the hams subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hams

During the period, 0 new issues were detected and 0 were fixed.
In total, 5 issues are still open and 32 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 27      No    general protection fault in rose_transmit_link (3)
                  https://syzkaller.appspot.com/bug?extid=677921bcd8c3a67a3df3
<2> 13      Yes   KMSAN: uninit-value in ax25cmp (3)
                  https://syzkaller.appspot.com/bug?extid=74161d266475935e9c5d
<3> 6       Yes   KMSAN: uninit-value in nr_route_frame
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

