Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FAE926528B
	for <lists+linux-hams@lfdr.de>; Thu, 10 Sep 2020 23:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgIJVOH (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Thu, 10 Sep 2020 17:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731034AbgIJO2b (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 10 Sep 2020 10:28:31 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475D9C0617A2
        for <linux-hams@vger.kernel.org>; Thu, 10 Sep 2020 07:18:35 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id v15so4317534pgh.6
        for <linux-hams@vger.kernel.org>; Thu, 10 Sep 2020 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:date:from:to:reply-to:content-transfer-encoding
         :subject:message-id;
        bh=z9cbGQzvCZGdv2stQ4JjJcY1G86CqEMBICg5YK+66dU=;
        b=T+LRsJD9xcAqKMu+1ssYUKeEArvUAY+XmpUsGsq7I/wbQE5cAa4SwPrmT8H3gzvNHk
         6a0sUXjHm3H91nTLsFvsn66Xdwv5n276wfWTdjUj/HNGo8UUnooHgmVoqz8sBairozPs
         uGRkDCaYBgjPJ+Gr+VgdkqJmOQttVspvul0ayzBRClC0IvhlwHsuoO6KTmK2EB81vqHH
         jXvUR1VaEFyPfPHWw5zN8f0JoUVNIO9bOcbsmCGoimcVx3SsvXMR+PB/3wx0glmVlXYM
         UExUSVQ/r/xbmpdjS4ahPGeDRIi0g+VSgKRqHHGJpYzT/e0MpDld0Td6HlgNv10tR/u6
         jOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:from:to:reply-to
         :content-transfer-encoding:subject:message-id;
        bh=z9cbGQzvCZGdv2stQ4JjJcY1G86CqEMBICg5YK+66dU=;
        b=MuE3WSyCoZWqe5+diipUv9meMdO96QQZu4ntiwaM39/iaErl0HXW7Wmt7Yah+vBbWL
         pE1vErw/RkCkmDQykoadaF0/1Fk8lx+Tw/Ggu4lg8rIFaxvvTur/Qu3ZMXq8B/OzRLfa
         peKREHpfjisOgL49vlPrtwdtBMLMMuJbGD+EgW3sTsi1ZRYX7ADnvaXdYkG6pIB9W04X
         bbhEG6rIBcPFyaTrY10Cu5Pme2EqzsmSaJq+rMtO0tD7zpKBgoVy1h6L29kOkmea6ZZ1
         sTF0ldyOq0foRJbdb34tMRmcRe3TlUC/BlviSIGjzpPjvEtALP5C0656HRWYarZXUAAW
         7shA==
X-Gm-Message-State: AOAM530lNcDMzLhhJNg+8ixmUImzqLW9U9VOoK3OnzW9so81s9yyi6hr
        jtXEkcc2+4+WDZm0pzH8yd33PGqq7Q==
X-Google-Smtp-Source: ABdhPJyVgVB66IypKMMWSYF9oU7k6k9X4B01a7jaZ2e18BN/ocGoNIysU/THDnHIQvywFXxZu1S05w==
X-Received: by 2002:a62:1dcb:0:b029:13e:d13d:a131 with SMTP id d194-20020a621dcb0000b029013ed13da131mr5595479pfd.25.1599747513859;
        Thu, 10 Sep 2020 07:18:33 -0700 (PDT)
Received: from WIN-25FFVSIPLS1 (149-255-36-142.static.hvvc.us. [149.255.36.142])
        by smtp.gmail.com with ESMTPSA id l5sm4835668pgm.80.2020.09.10.07.18.32
        for <linux-hams@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2020 07:18:32 -0700 (PDT)
MIME-Version: 1.0
Date:   Thu, 10 Sep 2020 07:18:24 -0700
X-Priority: 3 (Normal)
From:   nebraskabella02@gmail.com
To:     linux-hams@vger.kernel.org
Reply-To: nebraskabella02@gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Subject: hey
Message-ID: <7BEDEC95D525460E84FBA537C8533CA9EE52635D@WIN-25FFVSIPLS1>
Sender: linux-hams-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

Facebook sweepstake lottery notification, Click on this link to claim yo=
ur winning payment https://zfrmz.com/Ps5t04H6zwHXI1u9RV8F
