Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4683D22D8
	for <lists+linux-hams@lfdr.de>; Thu, 22 Jul 2021 13:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbhGVLAA (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 22 Jul 2021 07:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbhGVK77 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 22 Jul 2021 06:59:59 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26285C061575
        for <linux-hams@vger.kernel.org>; Thu, 22 Jul 2021 04:40:35 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id t185so5059840qkd.3
        for <linux-hams@vger.kernel.org>; Thu, 22 Jul 2021 04:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=eQtJQ4P316qQMDpjVagXnI8D23ccDm1yazVuAnvOzVQ=;
        b=PCNCWOqT2RhDYXowKJfftMUOGseJk5H6uQMgdYqE9V3ohsl2yujFSVTq3NEfyviVqP
         xb5FKcZuui8nV/Y6wmHxEO7orDlDloLRHYnVtyG+UOfTFwQ+1nmZo693t4pjiY0H01Ek
         5+sQeIpS4CNEF+JXUmsJqMWtUm1vnO4iFFuc36hC/FCOpp6Z4WqvW5bgeUuM9UZp0wJ0
         GgRraHeLWDGIISEBI4h7kWQ1/5IdS0PPP73GnZvDkV0xHTCmHFJjJE63zOsYkdKXrsBx
         apgBO6+Gu5EU0RHArhmVmX0ai94WQ28OXPYVmIxtGkToIyyVFayPx2wlkEf/pSED6YR9
         yfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=eQtJQ4P316qQMDpjVagXnI8D23ccDm1yazVuAnvOzVQ=;
        b=JrmVsXpeADHDoU4oI7VyUzQlM4rVjzch72BAha9ytZQvqzOlzJK6J1YrW2VNWJI7BL
         4XKGz5H3uOBdGqV9Weg6vi1se7R1HbuMiPpwIU0ya4KMUo9OTczbhh7v0hwoYxNpUjf4
         uq7M7yXg/792aqvY9UHq+sMQM08eIrsJPFYywsqpLxsTcsOwZWaesUkE/N8z5SN30PHS
         jTLw/jomapqUMewxCIfY7H71eRHne/kUKbkb472/lxJQ0DPdIUijqiB21nBQqPckvxE3
         /y27IGjkuxSK7ypYbdSdcwx45qragXf6LCo5An/u/Zz6rXSuk9o52sDSRhHGzBL3dKX5
         NcEQ==
X-Gm-Message-State: AOAM533X9kWw4HIVQnJ7pB1J5lWYqLqhYR7/PDGZXlvswEr6Ll5Gwxd7
        Ekajw1h5aSSF8UyqzAFULqP321nOYrdDS21OhPoaAfC7
X-Google-Smtp-Source: ABdhPJy/vmr+eiqES1gALsFQaaABoC+I+92m5uL3kkIQM/qnoohfjYV5TSeUGkrC5+/cn2GHEf6jv7gtltW1Fp0Fa30=
X-Received: by 2002:a05:620a:16cc:: with SMTP id a12mr35361909qkn.97.1626954034258;
 Thu, 22 Jul 2021 04:40:34 -0700 (PDT)
MIME-Version: 1.0
From:   Dave van der Locht <d.vanderlocht@gmail.com>
Date:   Thu, 22 Jul 2021 13:40:23 +0200
Message-ID: <CAH4uzPNH6GVX_H0eCrBUxPdgynRc9a7xLGde1_37dTCz3fgJOA@mail.gmail.com>
Subject: SECURITY: Some type of NETROM frames contain random fragments of data
 from memory
To:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Hi,

With Linux kernel 5.4 and up I've noticed some type of NETROM frames
(conn, disc, etc.) contain random fragments of data from memory.
I've seen all kinds of data fragments with security sensitive
information in them depending on the software running.

Those random data fragments seem to appear only in some NETROM frames,
haven't noticed them in any other frame type.

Most, if not all, remote node software seems to ignore those fragments
and it won't be noticed until you capture the AX.25 over UDP frames.
You'll see the frames are larger than expected and contain random
fragments of data from (shared?) memory.

I've tested this with several 5.4 and 5.10 kernel versions
distributions and they all seem to leak security sensitive information
the same way into NETROM frames. Mostly logging data, but I've also
seen MySQL data and other random fragments of data.
I've also tested with kernel 4.19, which doesn't seem te be affected.

Kind regards,
Dave van der Locht
