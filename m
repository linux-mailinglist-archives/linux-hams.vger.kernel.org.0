Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1587469838
	for <lists+linux-hams@lfdr.de>; Mon, 15 Jul 2019 17:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730475AbfGOPRj (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 15 Jul 2019 11:17:39 -0400
Received: from mail-ed1-f43.google.com ([209.85.208.43]:36126 "EHLO
        mail-ed1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730221AbfGOPRj (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 15 Jul 2019 11:17:39 -0400
Received: by mail-ed1-f43.google.com with SMTP id k21so15892522edq.3
        for <linux-hams@vger.kernel.org>; Mon, 15 Jul 2019 08:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=VGoZ5zhoCPnycUOFZEOdZ9s+w8Unc1jdSiDuwHRxYNk=;
        b=mC93kSXAYEJVaHaLo/wAA7/DAjGCcjWn/344/pURDI/mKsU/5C4Qk9On1nfCll0qoY
         /rmpZkormkSICcQIW3hSd6OXGqsprWR1E5dAY4bmIzXVkYKQ8zKbiHJ1M+/WlEq16/dK
         EwfwaSgO3ChLhFvcU1tjrflFgUEGXMh6D4KftSaruUYE0WyINRmulYkSTcb86Iv9Qhtr
         Gp+twrE4ogedKZUU15zHOrBOQyKXfJMkLRCZIlCM4PBT56qeZudLWRCxZ8/YxhVr0Zjf
         0sTwLil0c4fLxgAs42NcrImGnfSKza0D/+CYT4/ig66TQJBiGorBK4fij6FyBfRy+jV8
         Ahxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=VGoZ5zhoCPnycUOFZEOdZ9s+w8Unc1jdSiDuwHRxYNk=;
        b=llT/du8BifrDrXBRkV2MtQPaHIxEkSH8wlPfTXnbfGD8ULGtq21t+t17CZ0KZ3Bq7U
         B91LEvIiH2VP1b51chNLVqk8jCBWIpcEwAV5mrPzmYV4mefzGXmex+ZuDhwlrGO+M/fq
         QfM8WzHWDp77MX4Jz5U26U/MvOe5avslabQhv42dv5FGUJtjVaIaO7LZnA6APbD2HXEW
         ewgDrqX4E/RncghdUPSTGdxfnyEZVw/+g0ujshXVVVvhUPOnPlwRcFlyhrI+5dwIrUh4
         Axq6HAJ7TiuAhk5tZi9e3XiJlFtDMFGFVD4MOfe5jya4WRVjxLFFD/B+FS72r6Tj1i89
         Pqzw==
X-Gm-Message-State: APjAAAWtPMUBLrFuXHv+OQhmlwMV2Clcg4deiSktESbd3fCQsyhMvBzy
        AO7tkowVgZBTvycPZM8o3URsMzXR8+bdYo2iJ+KVrjIw
X-Google-Smtp-Source: APXvYqwwmFymD0ag9z2JKetVajfrsRjAOzVAGpELOOCr6aKEIc8RNx+L7Sp9W5Qd+RsewEtKLg8hfVWlsFADFb2fmjo=
X-Received: by 2002:a05:6402:134c:: with SMTP id y12mr23761127edw.96.1563203856980;
 Mon, 15 Jul 2019 08:17:36 -0700 (PDT)
MIME-Version: 1.0
From:   Curt Mills <curt.we7u@gmail.com>
Date:   Mon, 15 Jul 2019 08:17:26 -0700
Message-ID: <CAKDpQXnU7PCWCfD-=DZq-Eik85tc00X+OiQBD8B39y6fVt6Y4g@mail.gmail.com>
Subject: Xastir Release 2.1.4
To:     Linux-Hams List <linux-hams@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Xastir Release 2.1.4

Repository: Xastir/Xastir =C2=B7 Tag: Release-2.1.4 =C2=B7 Commit: 8ee4af9 =
=C2=B7
Released by: tvrusso

This is a maintenance release that is being made primarily because a
bug in Xastir impacts use with GraphicsMagick versions 1.3.32 and
later, and is preventing adoption of Xastir 2.1.2 in package
management systems.

The following changes have been made since Release 2.1.2:

- Code reformatting to match new project style
- Numerous updates to decrease number of warnings from gcc8
- Fix compiler warnings from OS X clang about use of hard-coded degree
symbols in strings.
- Removed the "--without-rtree" option: rtree is now always built into
Xastir if shapefile support is enabled.
- Removed vestigial references to gettext/libintl
internationalization, which hasn't actually been used since at least
2002
- Fix compilation error with GraphicsMagick 1.3.32 and later.

https://github.com/Xastir/Xastir
