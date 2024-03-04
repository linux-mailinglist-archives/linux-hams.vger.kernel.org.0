Return-Path: <linux-hams+bounces-33-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E7C86FBA0
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 09:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A7BD1C21ADC
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 08:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C63E168D0;
	Mon,  4 Mar 2024 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSC+tFpW"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FE48828;
	Mon,  4 Mar 2024 08:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540455; cv=none; b=exI9W64vpPoz4E0YNEga6lMQY+zxvl18KehkAgVhQtWN/Y3yRGcz1MOi2fhJ/p9l8affm/4PN5fs8Dvq44XAzJnrqZ4TnGY/IgkyLElTvmrP/Dwbk5YLGCl73b/OqTRE4fMv/K9B1O3uIfiQx1+R9R3ICvK07BCbvWALL1Sm6Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540455; c=relaxed/simple;
	bh=F3WJtqLmsRizVpz6XcoOW2IE8Hc87yyXZ/sAUXHPJgs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AchBU6GB7jD2IRiMMiKP5TVZzgHFsGhL7Bm7ibC8REfyX/xzzzWTD1o5q1zgaLbnIUCKdOz0G2xza7obbr85tEVfkD3ageqvC+hVT9V57OipBN2XRZbxsxLYVSn6RzAYR7MtRlYjaSqCnX0Fb5nbRFvejXmuHQyWc2OM+r8jMWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSC+tFpW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dd10a37d68so5691455ad.2;
        Mon, 04 Mar 2024 00:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709540453; x=1710145253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HuUBQk+9lD8phx2gva6SDnvaKaQ30xTMRHshAYSfztc=;
        b=VSC+tFpWhioWAhPAKSn0jZAgztZgmP3YeWrSZfa/OWRmj2QI3phOU+hAKU2zZNxBr7
         Z9E7sqCaXueIGiiMiO97MLIFlqXBwzSRZPIuz4/Fyhy0azsSfYOBppKMLNvDrI/tJYg2
         yGUgmJQtJ7EE9upQyA5EzHp9h9EiIM1sAk3K/eFr3Y34pbxGsxWbZJuiKq/PX0D8tESk
         38vvY3hymkwtlHAlFx6KnOeyWYPXgnGJ9GBIFXNe12iKWU9wUYdfqL1Lalf7a58twHin
         fHXm9uAM1ifTEAT25QDx+u8PR21knPMVC4K5pBrG73ubSnikEhb3sSV8TDmtkLPWlAmM
         9nEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540453; x=1710145253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HuUBQk+9lD8phx2gva6SDnvaKaQ30xTMRHshAYSfztc=;
        b=RgP7vENOrhuwJj3wdt6QD/KEKVDRDGzsLWOValuVIhFq21O4GmrrD+yyBYVeLIJCOJ
         rLOOtAhf4hbbLe6uO9AugkQ22MWU0Mn/8jo4CmqtHztrE3SiVsmS5Ynb+U2+VRqOMYjE
         laH3CLaz69RPrTR2MhnIDRV4kg1Fe/IXTnUpXOVfPr+J8vHXWGVl6qo+EBU6LbfVPdVK
         +xtW5KUOXWNPxACpbcOW/PDLs6JdywyG3vHLx2RgQgj+jx5H9Hlsn1x6klZyhAmo7i5t
         NRUZQDQIImreiE8bUbTNfcAcImrwRi2Lc2PTIMVBavASADNaRlmi7ds7neXUQawO0Smh
         hNbA==
X-Forwarded-Encrypted: i=1; AJvYcCXG0sUadFkEXDLJpHZPR6W0M6VZG29tH1l8DPzLpqtz8u3TBglmhxYcB4WQknvBG63FtMhWJyTSIe2Lx1KE7NtBnh0SPMu7
X-Gm-Message-State: AOJu0Yz+vcuCTgOJly66/6YwCXIVN9K7qk3F3kG08aBbVOZgzHcBn3qA
	eQIvbgFXr1usozxuKl3z4i0Dl/9GolfpdQlzFo4z8M/qid08IEGi
X-Google-Smtp-Source: AGHT+IGQvcrEPWxRCSUn5r8G4sGs+ScedbkTkm8kaZlIpW3QgJGDqBK8/d1eFWaKbo3lu8NIZTbU6A==
X-Received: by 2002:a17:902:d38d:b0:1dc:a844:a38b with SMTP id e13-20020a170902d38d00b001dca844a38bmr7738164pld.67.1709540452905;
        Mon, 04 Mar 2024 00:20:52 -0800 (PST)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902c3cc00b001dca9a6fdf1sm7897014plj.183.2024.03.04.00.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:20:52 -0800 (PST)
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
Subject: [PATCH net 00/12] netrom: Fix all the data-races around sysctls
Date: Mon,  4 Mar 2024 16:20:34 +0800
Message-Id: <20240304082046.64977-1-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Xing <kernelxing@tencent.com>

As the title said, in this patchset I fix the data-race issues because
the writer and the reader can manipulate the same value concurrently.

Jason Xing (12):
  netrom: Fix a data-race around sysctl_netrom_default_path_quality
  netrom: Fix a data-race around
    sysctl_netrom_obsolescence_count_initialiser
  netrom: Fix data-races around sysctl_netrom_network_ttl_initialiser
  netrom: Fix a data-race around sysctl_netrom_transport_timeout
  netrom: Fix a data-race around sysctl_netrom_transport_maximum_tries
  netrom: Fix a data-race around
    sysctl_netrom_transport_acknowledge_delay
  netrom: Fix a data-race around sysctl_netrom_transport_busy_delay
  netrom: Fix a data-race around
    sysctl_netrom_transport_requested_window_size
  netrom: Fix a data-race around
    sysctl_netrom_transport_no_activity_timeout
  netrom: Fix a data-race around sysctl_netrom_routing_control
  netrom: Fix a data-race around sysctl_netrom_link_fails_count
  netrom: Fix data-races around sysctl_net_busy_read

 net/netrom/af_netrom.c | 14 +++++++-------
 net/netrom/nr_dev.c    |  2 +-
 net/netrom/nr_in.c     |  6 +++---
 net/netrom/nr_out.c    |  2 +-
 net/netrom/nr_route.c  |  8 ++++----
 net/netrom/nr_subr.c   |  5 +++--
 6 files changed, 19 insertions(+), 18 deletions(-)

-- 
2.37.3


