Return-Path: <linux-hams-owner@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D32674C7849
	for <lists+linux-hams@lfdr.de>; Mon, 28 Feb 2022 19:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233419AbiB1Srb (ORCPT <rfc822;lists+linux-hams@lfdr.de>);
        Mon, 28 Feb 2022 13:47:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbiB1Sr2 (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Mon, 28 Feb 2022 13:47:28 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82F921D
        for <linux-hams@vger.kernel.org>; Mon, 28 Feb 2022 10:46:48 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d17so11860371pfl.0
        for <linux-hams@vger.kernel.org>; Mon, 28 Feb 2022 10:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bogomips.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=QEvhm6SqwOZbJ1C68hIJNq3B6gugT4X8lGqjwEO/UC8=;
        b=VtgRwj+XSbnnRPf6lygQwCYiY8kQ/JWCvYJX9N5KJwnthXdruiUYN41SSWpMYmkXxk
         vAa4bijLgWj4ZsGCEXE4u6HCA8wYodWDL8KBtgRGQxMB3PVEKUy7650YRGUAIDkdt8BZ
         sZRVYcRnZf6AoNWKzT3folpntI0UhNhDMl3k4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=QEvhm6SqwOZbJ1C68hIJNq3B6gugT4X8lGqjwEO/UC8=;
        b=4YvhuUDU1Pi+tYAyHMx+lhR1OGPhQiLB7fPnuIDo1sEotb6m/0CqU8xz7mfvmlGDWy
         w5ZqCGuFRVDROheJBi2UM3Ph9mAo4GFvl4BE9+B9ehb+/hCzyc9hRmJvPBbyeC3PrGoq
         Y2uh27iAAkPJIJXHTWX0+bgU1VEe4aXls6u0n+A/gzIsXo+olhonQNhvtI+8iOpTzpiA
         FMPCvAQU1AfdJHJe9Dra/0KeUCgq6iJBcQelCZEznMkkqyhDe8u9Kv3A1FRBusMYj7IW
         5T9umYuHpC27TyDJe6CsIzRremuY+NrZlY2FUj3KE1hGHeUI5Db/oRPX4SZQ5ANcxoGQ
         KmBg==
X-Gm-Message-State: AOAM530SglDCW1m1x4WXmaus7LIIwVxnTl/6U5PaE/Q6hbTDnK7KsyQY
        Jdsy75xx0wYGSefja8hQ5mgkocKT2Rrmhtm1naZc1sGbIGvfqQ==
X-Google-Smtp-Source: ABdhPJzVI00DP2zn//h4kNisf7G9J8Juc5+OZ+LKywx0xjDVHqidivlD9K4fRn40PI6k87tQFJtSdOv/SM3EBsIQYuM=
X-Received: by 2002:a63:a509:0:b0:36c:6a53:7cd with SMTP id
 n9-20020a63a509000000b0036c6a5307cdmr18480475pgf.403.1646074008154; Mon, 28
 Feb 2022 10:46:48 -0800 (PST)
MIME-Version: 1.0
From:   John Paul Morrison <jmorrison@bogomips.com>
Date:   Mon, 28 Feb 2022 10:46:38 -0800
Message-ID: <CAO-kYtEhzohMYgk=K_jt0hQ+bdrmReUVBkAzMYTKJeAK9vcenQ@mail.gmail.com>
Subject: [PATCH] libax25 hamradio: higher baud rate support
To:     linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

The kissattach program rejects valid baud rates in /etc/ax25/axports
so I updated libax25

I tested on x86_64 and armv7l (Raspberry Pi)  up to 1.5 Mbps

VE7JPM


Signed-off-by: John Paul Morrison <jmorrison@bogomips.com>
---

diff --git a/ttyutils.c b/ttyutils.c
index a374103..981d630 100644
--- a/ttyutils.c
+++ b/ttyutils.c
@@ -32,6 +32,36 @@ static struct speed_struct {
 #endif
 #ifdef  B460800
  {460800, B460800},
+#endif
+#ifdef  B500000
+ {500000, B500000},
+#endif
+#ifdef  B921600
+ {921600, B921600},
+#endif
+#ifdef  B1000000
+ {1000000, B1000000},
+#endif
+#ifdef  B1152000
+ {1152000, B1152000},
+#endif
+#ifdef  B1500000
+ {1500000, B1500000},
+#endif
+#ifdef  B2000000
+ {2000000, B2000000},
+#endif
+#ifdef  B2500000
+ {2500000, B2500000},
+#endif
+#ifdef  B3000000
+ {3000000, B3000000},
+#endif
+#ifdef  B3500000
+ {1000000, B3500000},
+#endif
+#ifdef  B4000000
+ {4000000, B4000000},
 #endif
  {-1, B0}
 };
