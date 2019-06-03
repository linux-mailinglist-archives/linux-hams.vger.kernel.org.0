Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABDB32684
	for <lists+linux-hams@lfdr.de>; Mon,  3 Jun 2019 04:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbfFCCRR (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Sun, 2 Jun 2019 22:17:17 -0400
Received: from mail-ed1-f43.google.com ([209.85.208.43]:35162 "EHLO
        mail-ed1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfFCCRQ (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Sun, 2 Jun 2019 22:17:16 -0400
Received: by mail-ed1-f43.google.com with SMTP id p26so24664329edr.2
        for <linux-hams@vger.kernel.org>; Sun, 02 Jun 2019 19:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=IzGhEC/wUC48hivBHHfohlPJnezwP4Vn2voBER9H2lk=;
        b=rhxVv4UsnAizcE6YBnHzSadxB5PIhnL5eB6UYf0R9qaFlbZF29lbY/aA6QKODwrqyu
         MncapgL5vtLH0cBLTr53b1QaBE+J0HfdnHAii709iUqu2B9aFnBNgKJANdG+kWJAsYW0
         /xiv5FVO8Qx81oxaBVLANJRWn7KDC7FAh1g1+Sgcqkr9Zd4CI8UkC8sABgaFEKlh0mx3
         Z2HAU+lF0qFGRTbOCO27GNsfPeEfL7Jt8f/ttMakgLHAkqcfaosktqZAB8dK2iWDgtT1
         7tc7T7E2CRJPePRZPWvPPMCD3LgQ0Aetp5hYLoZnylHVi6LS4oAPb+RY3R7dFb6X7gSq
         d5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=IzGhEC/wUC48hivBHHfohlPJnezwP4Vn2voBER9H2lk=;
        b=QK2m5EPYIxbEiruNSZfCiYEKAnlsTJZRvMDd88GO+f1PBZLGUM9yLBUerPGsUVBLj4
         uk8OqxdyOLViGjqQXv82/F+fmfjVazk9TbdBkQQ4wgY1IxeSQUraU5dmgK0YUgP43Say
         8bHkW+Tog4h2wxoqhBHD1wbDJKX21n4kF4FXS2d33UCas9oDc93YgwulybQqECFGXpAx
         zpCZE/WqrAWNXojea6zwO67fxLsiDnempNceKN45ntG2huyrjYwGe1X+Qby9oqvGn5Oi
         eBKkree1aHUl0xxsqPjqef08K5D/L8b8R6ZCK21JtOzLkioqbBO8Qw1cU9hJCSnEc3wH
         C4Pg==
X-Gm-Message-State: APjAAAWCIhbj80vEJTbE1yGR/EU2uAyWkGm3rYBxC2HE4sP0U8Sd3KbG
        5/KH3w3bn/F0dSFZ8byrHlXk/4kDbRoACTjEgoJuyA==
X-Google-Smtp-Source: APXvYqwWESgxghqQa34aJeDCNW/fPHdk2KtyucbRH6QeqqtnMBdP4BGUqhRYKZ6feQAIZ7aKtYTXL6pVQuBOC7BJw4M=
X-Received: by 2002:aa7:c607:: with SMTP id h7mr23028616edq.269.1559528234506;
 Sun, 02 Jun 2019 19:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAKDpQX=UP1cwrMm0KsBTw_wc=K324wSFWQy=_tjfk89pHOg4cQ@mail.gmail.com>
In-Reply-To: <CAKDpQX=UP1cwrMm0KsBTw_wc=K324wSFWQy=_tjfk89pHOg4cQ@mail.gmail.com>
From:   Curt Mills <curt.we7u@gmail.com>
Date:   Sun, 2 Jun 2019 19:17:03 -0700
Message-ID: <CAKDpQXkqsdzHbDKD7LyecfRZofroOsKngDcNK-K=oOJBrBvk8w@mail.gmail.com>
Subject: Fwd: Xastir Release 2.1.2
To:     Linux-Hams List <linux-hams@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

This release of Xastir implements the following changes:

- National Weather Service shapefile script updated, dbfawk files added.

- Compilation errors in OS X earlier than 10.6 fixed.

- Tiger WMS server maps added.

- A new set of National Map .geo files replaces those that referenced
WMS products that have gone off-line since the last release.

- GDAL and OGR support removed.

- Xastir builds are now reproducible (builds no longer contain the
build date and time).

- Deprecated GraphicsMagick and ImageMagick function calls replaced
with new API.

- Download of tiled maps is now handled by a download manager running
in a separate thread, dramatically improving map update speed.

- Obsolete interface to old Tiger/Line map server removed (the server
went down years ago).

- OpenTrac decoding support removed.

- Support for the old PocketAPRS (PalmOS based APRS) map format has
been removed.  Users of these old map types should transition to a
more modern format.

- Xastir sources no longer contains a copy of an old version of
shapelib source.  Shapelib support must now always be provided by an
external library.

- The embryonic "Xastir-qt" project has been moved to a separate repository.

- "Xastir -V" will now cause Xastir to report its version number (with
git sha-1 hash appended if built from a git clone) and exit.

- Support for many additional satellite navigation (GNSS) receivers
has been added to the existing GPS support.  Prior to this release,
only NMEA sentences starting with $GP were recognized.

- Many compilation warnings from recent GCC and Clang compilers have
been eliminated, resulting in a cleaner build.

- Our Makefiles now default to "silent rules" to reduce uninteresting
output during compliation.  The old, noisier behavior may be invoked
by adding "V=1" to the "make" line at build time.

- The configure summary now shows the status of its probe for Xpm
libraries under "Xpm / Snapshots".

Xastir web pages: xastir.org
Xastir Code: github.com/Xastir/Xastir
