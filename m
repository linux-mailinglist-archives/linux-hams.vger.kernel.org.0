Return-Path: <linux-hams+bounces-34-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A296986FBA5
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 09:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 325D3B21E9F
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 08:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B3317588;
	Mon,  4 Mar 2024 08:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgyeIaHM"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8869817564;
	Mon,  4 Mar 2024 08:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540457; cv=none; b=fAuu46f2YUo5Dkp5ytB4rhyufUijsttijP8rqDqkz694a/UfBPV8t2CEsbuvRKKOd9iFZqPGxgfytXS2MTXyDrQ9wctmguEgqtqud2/UEr7n1T0gpTk6Pw432GZm+lqM3vHNwNLSSS3q5KfyTRetMKAmqDgf56MoibWfkIHmZRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540457; c=relaxed/simple;
	bh=F8F0TNbjm61Kg/mo1fXaFeoAP+njBf1JFYUjUJV3wH4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iKAqUzfMXolm3Q/H0E+UeZComGURTsbqcx5cdO6JRBU93Jqnixg7C8hFsHRd45YNm1lk2TlJatcPHbry0R3pxtrxVve8c+7Qejrem42iS4h898iqhxio0YMW1q0k6NSlmgvY79wQ2jrd8/wK3NtbOmYPmzauDp/qxwFk44guiEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgyeIaHM; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1dba177c596so25196855ad.0;
        Mon, 04 Mar 2024 00:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709540456; x=1710145256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuFw7zdJ4b05azmCJ+puSRWM+FoHDlewGP+8VQ0QSgo=;
        b=GgyeIaHM7JLb5pMRdK8ONKaEeQRAjrZ/nZjk9quqzSvcQlyQt/rtzpsLv2R5+Dt2bH
         u3rnxjeuHdEXSDoLm/VEOqZXQkr1+WPg3vE+447a0vwyziF1IFJMLSVwziRVOwZxndHx
         bq2g+qfTfvZfWdzpYboJP/ykE1Jkeu/VDL+OvSMHNp7H9BD74KFHzLa4XJkMv9lFcvO8
         +cCoQl/IXFO+9NMhBKVha2VEUtwmxLsjI6EPvmw7spM12hoD6l5tTaftx1JuDvcu7Q6l
         3O7Y0uqtB+ir4MkY7LCnsEwODB1JFOmLbngwDn2sS9BUHQlv93hW0qxOoWs5q1d+upYm
         wz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540456; x=1710145256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CuFw7zdJ4b05azmCJ+puSRWM+FoHDlewGP+8VQ0QSgo=;
        b=K4Swk5b9JIU5o1Vx9D7dCnm+1hPVr9pnMu/5urwG2aojLow9QvqUxB5VHgydHEkUl5
         bjXW3rFIe4pAatmiz7KM2tfnWMqHCAWxgAcpwlgHh6UGEC+AWGm4HG8xLR7O/DwaqrGe
         TQyXitGofF7GM/NKUbS6v5R4Sqccpy/ke18AgUyNq/hSBc2hj3AkJEGVX9Dd3jDYhVbQ
         2FQASW90/wwrf8KGm/yXX1+WFiGACpVoNtU7TYgv5kWPSJ2hfbVp3T5VU0vKbcLtlTRk
         KdsfdSGkTS5r2l8DoWG9l+NvTlViOA4ogJUVPR/46NTm15fBcY0KQKTEkTOoBFnxH86x
         bJtw==
X-Forwarded-Encrypted: i=1; AJvYcCXBlLtpILDpPEYOBY7C0NmurjxMCheqhGpRN/cEXWExIIPQX9jTmxE9DSWkxHPD0yr3BmCizvt1bc/vXB0axn9HEV6ipEoA
X-Gm-Message-State: AOJu0YzoAGIK5TRDm6mcce8RnKBOMg9tFBCYYQeBgB1Rm6A/R20sOfPY
	NMYqtAt8XLAAWvbcDhIBWKoBwXvh+zIp/xsrcNFLOfv+AFb/vQBr
X-Google-Smtp-Source: AGHT+IFKzxmU5oFjpgAEoD174UxvB1VOv8JxZ0F2EBvWYlFV1bKpAuCvdVRafbskSlh+CBiVEkNRQA==
X-Received: by 2002:a17:903:32cd:b0:1dc:fefe:8050 with SMTP id i13-20020a17090332cd00b001dcfefe8050mr6195208plr.29.1709540455908;
        Mon, 04 Mar 2024 00:20:55 -0800 (PST)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902c3cc00b001dca9a6fdf1sm7897014plj.183.2024.03.04.00.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:20:55 -0800 (PST)
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
Subject: [PATCH net 01/12] netrom: Fix a data-race around sysctl_netrom_default_path_quality
Date: Mon,  4 Mar 2024 16:20:35 +0800
Message-Id: <20240304082046.64977-2-kerneljasonxing@gmail.com>
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

We need to protect the reader reading sysctl_netrom_default_path_quality
because the value can be changed concurrently.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
 net/netrom/nr_route.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index baea3cbd76ca..6f709fdffc11 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -153,7 +153,7 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
 		nr_neigh->digipeat = NULL;
 		nr_neigh->ax25     = NULL;
 		nr_neigh->dev      = dev;
-		nr_neigh->quality  = sysctl_netrom_default_path_quality;
+		nr_neigh->quality  = READ_ONCE(sysctl_netrom_default_path_quality);
 		nr_neigh->locked   = 0;
 		nr_neigh->count    = 0;
 		nr_neigh->number   = nr_neigh_no++;
-- 
2.37.3


