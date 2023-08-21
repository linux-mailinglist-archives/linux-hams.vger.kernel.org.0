Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAD2878348D
	for <lists+linux-hams@lfdr.de>; Mon, 21 Aug 2023 23:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbjHUUo2 (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 21 Aug 2023 16:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231414AbjHUUnj (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 21 Aug 2023 16:43:39 -0400
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3302CF4
        for <linux-hams@vger.kernel.org>; Mon, 21 Aug 2023 13:42:12 -0700 (PDT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-56582095936so4126143a12.0
        for <linux-hams@vger.kernel.org>; Mon, 21 Aug 2023 13:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692650532; x=1693255332;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L2+zyESOsFHr6OKCoXoHDulmqthrco1Hmm/wWbD+8ec=;
        b=QBrHQWpqixRVaaMPMTD3PI6q5mnv2NJdydM2lrXIfamXn+he2xaUUj/MPgMWk0WCCu
         5z5WJE3B17ZjgGcBOQQQwjc2RzwdWPMcTqF+X4d4uVz8p8/fz673nQq3eBDeklo50do4
         +LMNl5Pk+ChMp1HhqeWexEwt/nkQPAGkm+v+uBOSZmPRFq1HL/b/J3x4CDaNDcU6uHu2
         jwq0Joo/AwzRt0kFdX/c5GbxNuonJVevgKpgZmSs3bbq+SUw9sfYmDf/FMaJd4+QK85s
         +bTaqpz7P3g6c2SNOOKJDuCW9ZiZCyotM0URrwGaIt7amoYyTqNPumN4CzFfVIiUBNgR
         gAow==
X-Gm-Message-State: AOJu0YzKkmZJMSqBHWKEnDWz9D+8ozyNXSY04iptHgjUKmvXcBkJtXXF
        gofIaIqrmoVzmliJOhWaguablG2j+FYzNYDK9wVUULKFIbeq7Mw=
X-Google-Smtp-Source: AGHT+IGyhbJNaw58JigChgXQOYGOGBDShDQ+rv8G3fWrvuyeMKzsnqNuCB8MY9SJ33ZPXHrYeO04vtY8IL5lQy3iWPK2TEI3myay
MIME-Version: 1.0
X-Received: by 2002:a17:902:e743:b0:1b8:a555:3865 with SMTP id
 p3-20020a170902e74300b001b8a5553865mr3937298plf.6.1692650532383; Mon, 21 Aug
 2023 13:42:12 -0700 (PDT)
Date:   Mon, 21 Aug 2023 13:42:12 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b6320d060374e933@google.com>
Subject: [syzbot] Monthly hams report (Aug 2023)
From:   syzbot <syzbot+list1892093e816ecfe5f01a@syzkaller.appspotmail.com>
To:     linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hello hams maintainers/developers,

This is a 31-day syzbot report for the hams subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hams

During the period, 1 new issues were detected and 0 were fixed.
In total, 5 issues are still open and 30 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 17      No    general protection fault in rose_transmit_link (3)
                  https://syzkaller.appspot.com/bug?extid=677921bcd8c3a67a3df3
<2> 4       Yes   memory leak in nr_create (3)
                  https://syzkaller.appspot.com/bug?extid=d327a1f3b12e1e206c16
<3> 3       Yes   general protection fault in prepare_to_wait (2)
                  https://syzkaller.appspot.com/bug?extid=666c97e4686410e79649

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
