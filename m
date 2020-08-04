Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCF2923C1F0
	for <lists+linux-hams@lfdr.de>; Wed,  5 Aug 2020 00:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgHDWgz (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Tue, 4 Aug 2020 18:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgHDWgy (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Tue, 4 Aug 2020 18:36:54 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF617C06174A
        for <linux-hams@vger.kernel.org>; Tue,  4 Aug 2020 15:36:54 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id w17so24144273ply.11
        for <linux-hams@vger.kernel.org>; Tue, 04 Aug 2020 15:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=gAGQPSeE7HOwYwavskE5e9li4T5ni5I6TXg1XHHwgN0=;
        b=uKBHahCNUHbvnY9fXZ8KQxjrJ3MewJjUtS0xw0YgqOjUW7tYgjMb8Xgbhi7WHqDMRo
         8b1Cy4hlrRqulAU5SAycErms5MsuXDFYjc8UmwgSE0klNCl1FrrlrpI7AkABmxcf37Tu
         kixfc+z/CnBY/niinIC7aTo9W/rL0lDF8WS5rivXXEPU/0UKrVa8H1s2IqnohpG4asAH
         pLiVQlIrorM3J343dSun/xLtCBhVcuuL2wBg98A4pQMprC6L+RwZKGlcl3l0ZDiFDzBj
         I/Zvt8TCOh61NW4Jcz9HrUniuJHIc2DdTAqquVB/i/BzqHl5uYW65l5RspUjLyYUcvCW
         1/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=gAGQPSeE7HOwYwavskE5e9li4T5ni5I6TXg1XHHwgN0=;
        b=UejTp7SWPoIpNp7fOCguzhpwwA8fBk+eLbDslug3mnxlbcOWFOGaBQdA+qZiuYMsVv
         34lQ0+dbOodesduLVA40wjlNBGL1gOj2EPkcUnyZJRrnXDi959vsiYdrroFeT5eaxejM
         z3e1pXPohS4qGaKZRJW/l+XauZgJ0OZw29ity944rASItxbjrnPq/mvBsnqjRsqqiM4g
         3MfGi31zBK54K1+5bPGAAJnpq+mhquwB5S6iSpnRWocG8Ny0CNQgixFYP7BE/9fO6Jdq
         KnRvX22xUuiaTQMp6n9XZHMa+xBJwWNgIFY49yx2AZsIgCKDjrI3mGSpvYFUxiA55t3k
         zsTA==
X-Gm-Message-State: AOAM531Hv03EU3I27nMWAHwScM6I2wY9giH/UcPsyPg7j5ABDGsRNbUd
        QBXDBm7jKgHyxVefmcrK9fIuOVLTW4hKZKMfHEg=
X-Google-Smtp-Source: ABdhPJxNsnM3QrJkN/d6ljBxAf6zwryvLudYEl7As+fNZL41AEcbus30JxPCjTx5Qx+/vYL9FbRjKfGleF0Y08yfj6k=
X-Received: by 2002:a17:90b:138a:: with SMTP id hr10mr324160pjb.161.1596580614048;
 Tue, 04 Aug 2020 15:36:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:2841:0:0:0:0 with HTTP; Tue, 4 Aug 2020 15:36:53
 -0700 (PDT)
Reply-To: sararrobrt@gmail.com
In-Reply-To: <CAF6WC9YxWr-mBsc4Ci_Bgyt+PcGiFpgHpF+cjtZGCpK2bEuhEg@mail.gmail.com>
References: <CAF6WC9ZiEnw3SDVQ+D-+smiTRNdyECgk=NmcN7YxzYt5-dGyEQ@mail.gmail.com>
 <CAF6WC9YEZ316bc51M8+Rx1vkhs-JxnTWHbKzG1Zx4mdho+5AJw@mail.gmail.com>
 <CAF6WC9Z2BA7oP8zMrMQkb0xZQr+GHAaZhheA5dJMsKKtQRcVgQ@mail.gmail.com>
 <CAF6WC9ZKt+vq_=tDu7cBqZjC8a2uAc31u8-PJ=uBRhtUiD5+7w@mail.gmail.com>
 <CAF6WC9Yjsuvhvt=3F4rfa4ymPgh6WW059T6Kd3nFbudPGh9Vbg@mail.gmail.com>
 <CAF6WC9bYh7QQPZpnhCKGt3kXLdBCgi=oiynF0AbJAZfHcXR+fA@mail.gmail.com>
 <CAF6WC9a+8DMFaRf1yGnXbcScvoWQ_1nVT98=TEEzxxGJ0Qof4g@mail.gmail.com>
 <CAF6WC9b=FJWb8=Q=tmrRBiZGUj1o8axDh96RRYhHefxJC9VoKQ@mail.gmail.com>
 <CAF6WC9YPkY=RSetOOB3FmmS471DA32Ld8A2hWwh5AxVnG2bwSg@mail.gmail.com>
 <CAF6WC9a9+_6y9xW_yCti0rCOp63q5OM+3NXWFB59sVqrW=C+Ew@mail.gmail.com>
 <CAF6WC9ZpiWSt-dmHgNV+d2ZBRyafGe8NikeFUGJvQfQu+f=87Q@mail.gmail.com>
 <CAF6WC9ZkV9BQC_m9xv6jdqET+VK8x5h+zY8+Z7R11ywkiQLbTg@mail.gmail.com>
 <CAF6WC9bNc850YNtkfRKyChC=ABMWF23cSdgYa6h0fsdiS6Lmjg@mail.gmail.com>
 <CAF6WC9bzR6Qy6tjWuosODaat25ShtUv_gcECfr6n6j0QW8X4Og@mail.gmail.com>
 <CAF6WC9ZU=kmsJ6JGhE0pVhNMD_STeGTgmNBj_KZ9ky05=HULig@mail.gmail.com>
 <CAF6WC9YD+E8tH6NrP1s10rGpSMH5e1cddhFjeWqWsUgW=T+-uw@mail.gmail.com>
 <CAF6WC9a_QL-3edqN+GVEezRjJ1rPHYT=EjPrYffA_3y3KFzrQg@mail.gmail.com>
 <CAF6WC9YnL2hxC9a6PQYGMXUDx_aZH4bn4iyBrnR+=qg9=RZ4GQ@mail.gmail.com>
 <CAF6WC9Y63Nk_Z7wA_=cMsbEzPBMrWPT3h0fC6csNrRrWPL+gBw@mail.gmail.com>
 <CAF6WC9ZNtJNaq6nZ-9pGiiDeC0sma2An=rCB7hyNX-NVTM4kPA@mail.gmail.com>
 <CAF6WC9Yu_R2j6KXX=TzZHe8etFf48yujpxuc5CSFNJvy9q7TfQ@mail.gmail.com> <CAF6WC9YxWr-mBsc4Ci_Bgyt+PcGiFpgHpF+cjtZGCpK2bEuhEg@mail.gmail.com>
From:   "Mrs. Sarah Robert" <godwin11emefiele@gmail.com>
Date:   Tue, 4 Aug 2020 23:36:53 +0100
Message-ID: <CAF6WC9a42DWc8wnrhkubrKqS4bbVUENMWu4jKFeSm_Th6_+EOg@mail.gmail.com>
Subject: Greeting?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

My Dear,
I'm Mrs. Sarah H. Robert, 77 years old dying widow from Australia;
that was diagnosed of cancer about 4 years ago. I got your details
after an extensive online search Via (Network Power Charitable Trust)
for a reliable person,  I have decided to donate my late husband WILL
valued of ($5,500,000,00) (Five Million Five Hundred Thousand United
States Dollars) to you for charitable goals. Get back to me if you
will be interesting in carrying out this humanitarian project, so that
i can arrange for the release of the funds to you for the work of
charity before entering the surgery theater. Contact me via
E-mail at :  sararrobrt@gmail.com
Sincerely,
Mrs. Sarah H. Robert.
