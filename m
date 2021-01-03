Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E622E8C48
	for <lists+linux-hams@lfdr.de>; Sun,  3 Jan 2021 14:28:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbhACN1g (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 3 Jan 2021 08:27:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbhACN1f (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 3 Jan 2021 08:27:35 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81BFAC061573
        for <linux-hams@vger.kernel.org>; Sun,  3 Jan 2021 05:26:55 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id z12so8200231pjn.1
        for <linux-hams@vger.kernel.org>; Sun, 03 Jan 2021 05:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=b9BRlR3g3mDnqaKhwBhCqc+UAa0PWs1R1Y6TK87QC+0=;
        b=brgFbTKIV1No9+tfBJfrhvGJPU3t1TIUTVUMzwAikcVLYZJwIaJfIJkLSHzuu1ePtW
         SUmq8+9T12C/zYgC6fW960tK2GN34cXbArv2YyrHRzLEKTni7JxdVT+qG42LzGmIlhA4
         0t19o7AUUAFMlaqQnj+OfDUspumJBwivQ3szOFZbenpZoyQzb6tBoyaJHhWbNtiL+wI4
         uCKRn94YiQIHdBQDQZh8mpFRwAlbnDp1c7jtNgUeRxWJJQrORW/zAZGbYyRyWySPC12i
         PcnFpPluwQGqBdKhU8UHu6byatDxQmMiwoQCZHeXikrE948MLhLHu+WLo4UI2E8lkXpF
         w8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=b9BRlR3g3mDnqaKhwBhCqc+UAa0PWs1R1Y6TK87QC+0=;
        b=Se7ORQ2nqVIZVnsEe/3QrHCR8MpPMm5ZItNllDbZY4uHifPeehqqPYOTmdJwQOqhm5
         P8GpFg9Ewgt8WBzFsGFi8PkYhWnIVmBUs/Xl+O4KmMWVFd7Kr6cGVIf0mjt4WiAdscMa
         5senm//rU5wpm/CVfIdqRKijNdksUUXI5dhzbAyMNx+DCJ7noVALm/C1nfosK9rq8SCm
         Qlztg/zoql7BazpN7JH5wYm9LoginJw4MK52q36Fd6LYkPuIpQSO2k8QcUmNg++TO5BE
         lzbTzly3VcL5NMjrEfdwAwGRv2cVeO7eZLVTmtJof57cJUo76x604t46VsTW7wovWXoP
         ZHXQ==
X-Gm-Message-State: AOAM532jZ9qz8MhEZCJXPncqEif0Lx+v/MY33FpxVNyFlTbuh3GyuP9X
        AnfDYURjOPHf+ojHKiPB+xwSXXPhyhGMrCpTvUQ=
X-Google-Smtp-Source: ABdhPJx5fb5CZsaatCyEdZ4/5vjF8nIrBXbVL9WMDCDErWhtOaHz7UHZnIBy2w7U8E80Ed3oSKNbm7BoXsiqTyqdodQ=
X-Received: by 2002:a17:90b:8d5:: with SMTP id ds21mr25028657pjb.5.1609680414982;
 Sun, 03 Jan 2021 05:26:54 -0800 (PST)
MIME-Version: 1.0
Sender: mrsamal.ouedrago5@gmail.com
Received: by 2002:a17:90a:590e:0:0:0:0 with HTTP; Sun, 3 Jan 2021 05:26:54
 -0800 (PST)
From:   Liz Johnson <lizjohnson786@gmail.com>
Date:   Sun, 3 Jan 2021 05:26:54 -0800
X-Google-Sender-Auth: _m6J4vvz4vsf7rNoDdpsCpBvVek
Message-ID: <CABTkuS4Q246FXqNnUgFXC12_c65yCWHoxw62ctOB=4FPju2dQw@mail.gmail.com>
Subject: =?UTF-8?B?5L2g5aW9?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

5L2g5aW9DQoNCuS9oOWlveWQl++8nyDmiJHmmK8yNOWygeeahOiOieWFueOAgiDmiJHnnIvliLDk
uobmgqjnmoTnlLXlrZDpgq7ku7bogZTns7vkurrvvIzlm6DmraTlhrPlrprkuI7mgqjogZTns7vv
vIzmiJHorqTkuLrmgqjmmK/kuIDkuKrlpb3kurrvvIzlpoLmnpzlj6/ku6XvvIzmiJHmg7PmiJDk
uLrmgqjnmoTmnIvlj4vjgIINCuW9k+aIkeaUtuWIsOaCqOeahOW9leWPlumAmuefpeaXtu+8jOaI
keS8muWRiuivieaCqOabtOWkmuacieWFs+aIkeeahOS/oeaBrw0KDQrosKLosKLvvIENCg0K5oOz
6KaB5oiQ5Li65L2g55qE5pyL5Y+L44CCDQoNCumXruWAmeOAgg0KDQrkuL3lhbkNCg0KDQoNCkhv
dyBhcmUgeW91PyBJ4oCZbSBMaXosIDI0IHllYXJzIG9sZC4gSSBzYXcgeW91ciBlbWFpbCBjb250
YWN0IGFuZCBJDQpkZWNpZGVkIHRvIGNvbnRhY3QgeW91LCBJIHRoaW5rIHlvdSBhcmUgYSBraW5k
IHBlcnNvbiwgSWYgeW91IG1heSwgSQ0Kd291bGQgbGlrZSB0byBiZSB5b3VyIGZyaWVuZC4gSSB3
aWxsIHRlbGwgeW91IG1vcmUgYWJvdXQgbWUsIHdoZW4gaQ0KcmVjZWl2ZSB5b3VyIGFjY2VwdGFu
Y2UNCg0KVGhhbmtzIQ0KDQpXYW50aW5nIHRvIGJlIHlvdXIgZnJpZW5kLg0KDQpSZWdhcmRzLg0K
DQoNCkxpei4NCg==
