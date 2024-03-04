Return-Path: <linux-hams+bounces-44-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAE686FBBA
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 09:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B90B6B211DA
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 08:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED4918657;
	Mon,  4 Mar 2024 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALBb7snR"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4473C17BC7;
	Mon,  4 Mar 2024 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540487; cv=none; b=Qyb7jI3wH4vu0ytlm6dyaFM5jGka14MgqqnO1JH0skR4qTBNpoQtEwdZ2yWJuAWm8uN3W/6eJBQG/DOjDrJbHe9oID1TR0c+revBmgJRM13fOyKnHntKPtg+m0qona6uvv0txcbLCf2+eHIcxwW2YBtzADIqKa9C+yYs/jpX6co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540487; c=relaxed/simple;
	bh=l+nl5U9gUiRcrhAmCFKOdJkQy4rCXq/0wTXqHsmUOwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sLHEOLb7Hlje5myyCDOBxXogA+MI35B2sk9F+EY2zqNLdIlgaTMdCV14Osk2Z0f7Okvg47mDjXCDaGQkxwuJCpAilFi0r2GtldGI0FMJBCRBZBEWrUiHaAkGLfE9AoTZlHMG0hzTzCT7lGVZ8oAmMC/9HtmZ/Q01tM1G8k4WcSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALBb7snR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dc5d0162bcso35019945ad.0;
        Mon, 04 Mar 2024 00:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709540485; x=1710145285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpAr65Sbm9LW0YCuSNo2yuiYCmshjb/xMNGbnC9d5DA=;
        b=ALBb7snRk03zb5sKzfrgS9H6hYAIFr1E6614AdSwY69/fpjiVduyfCKJl6kPTN4Rup
         fgAwUL0qCSOOY+3jZ3hXfRDKGsMS4zZDtyPbp0zh6vrZwfBUr1+OZ0DlFdb2MPGmeKd2
         QvQh2m4eB6u6Dcyv5DHrfP3BiyAYcyD0PAG28a/WWodLDatjXqjLaUd9YDsHZhactDAf
         RUuSQB8vVBJtuR4LkwWRcnjjb/m2MwNvaYdDmHg/29Y+Deny6AWGzyO7CGbN9pdCLV3Z
         NL69T0kY01pZ4CZa+WkanSqpNW5IzKoMpPh2LSUyBdyogioVywNvX4FbikGRWwZARjBx
         ifFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540485; x=1710145285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpAr65Sbm9LW0YCuSNo2yuiYCmshjb/xMNGbnC9d5DA=;
        b=TLA577TVpPzSto4i8QBDnEzCby1d6nPCIUgOGXcu9woxuRnXsSDqbPsMS/R0hTxMQt
         Ij5iF4/HEkJezkrJGp59Q11z9zcIzbtHq+uFGwk6Xe64ClpoUrDJnCfO/W3rDoAlyR5p
         O1joKuJ5LPhhHM3DoxRuJak3ATe+TgAZlI+9IGaub8Uf/jPuoaPEW2vJqw/ggUTK7swA
         aLeIO9mzYNY+DkQ+eV/sf96Zueu2JlcGT3JexzPkUTin1WEQA9clTlBK65IHPuNDulo7
         7EjbHKT8mxmrJSqL20EnxQZqgExdfyx7MH3W0xTayadX7Z/OBc4tcEw4aZ0l9Mm75oxZ
         pBZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXV2kEfZy0in/uus5ntPepwdW5dn0ED18qf4Tdk1pBLzC1QpuGFz0+yjIm6MGS1cGVyP7itbeEXxBy3/RCDtN9CqtNZnG/
X-Gm-Message-State: AOJu0YwS2RVOj0ZUA2IEU9ktcMMoCP+CJFa/7a54Y1V0qFaBFGvyFAYR
	DgarEqfoQK0RhhfttN9swME0BzOu6F/VbtkOek/M8FMmnP5mLzgt
X-Google-Smtp-Source: AGHT+IGRaGO4WTuo5bXk3RmyfcuoVbeF9kDlApCU7UvX6DHah5bG9EpFMtrbFU2QeKfAI+rktdKeGQ==
X-Received: by 2002:a17:902:ecc5:b0:1dd:7db:69ce with SMTP id a5-20020a170902ecc500b001dd07db69cemr4005022plh.51.1709540485538;
        Mon, 04 Mar 2024 00:21:25 -0800 (PST)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902c3cc00b001dca9a6fdf1sm7897014plj.183.2024.03.04.00.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:21:24 -0800 (PST)
From: Jason Xing <kerneljasonxing@gmail.com>
To: ralf@linux-mips.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-hams@vger.kernel.org,
	netdev@vger.kernel.org,
	kerneljasonxing@gmail.com,
	Jason Xing <kernelxing@tencent.com>
Subject: [PATCH net 11/12] netrom: Fix a data-race around sysctl_netrom_link_fails_count
Date: Mon,  4 Mar 2024 16:20:45 +0800
Message-Id: <20240304082046.64977-12-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20240304082046.64977-1-kerneljasonxing@gmail.com>
References: <20240304082046.64977-1-kerneljasonxing@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Xing <kernelxing@tencent.com>

We need to protect the reader reading the sysctl value because the
value can be changed concurrently.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
 net/netrom/nr_route.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index 89e12e6eea2e..70480869ad1c 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -728,7 +728,7 @@ void nr_link_failed(ax25_cb *ax25, int reason)
 	nr_neigh->ax25 = NULL;
 	ax25_cb_put(ax25);
 
-	if (++nr_neigh->failed < sysctl_netrom_link_fails_count) {
+	if (++nr_neigh->failed < READ_ONCE(sysctl_netrom_link_fails_count)) {
 		nr_neigh_put(nr_neigh);
 		return;
 	}
-- 
2.37.3


