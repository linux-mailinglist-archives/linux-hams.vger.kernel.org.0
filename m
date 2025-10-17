Return-Path: <linux-hams+bounces-648-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC1CBE6C0E
	for <lists+linux-hams@lfdr.de>; Fri, 17 Oct 2025 08:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B80C1A66AAE
	for <lists+linux-hams@lfdr.de>; Fri, 17 Oct 2025 06:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03FC3112BA;
	Fri, 17 Oct 2025 06:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUpAwkPo"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31D230FC18
	for <linux-hams@vger.kernel.org>; Fri, 17 Oct 2025 06:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760683553; cv=none; b=Gg62PMWpEZOJ7oUwXw7IYtf+0crz9sozzQEItt2aS7GGvyuURlkLNI4808QHw1i17PnNEpG6ed/5itbrlfk9VDNq7N9YwkvbD/+Q/DkFHzPVTL4Ujt7T+FbPO23CUnUlSjqikObOZ4unM7u8/Al+2sh6vj+9t6SutdPJtrcuu38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760683553; c=relaxed/simple;
	bh=76MXJi1GEaLekMNsuMxE/KJvLVrO4E/BO/gvBM1ACzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ih7Gp3QpyWrt9c9m9vOywJq11Bep5+l1wJCG69gWk7it9LexzkzS8JDqtrd5BWdt/NQbdmTpbVNSkA2IhB/WQrJajXOYrOIi5UuQCjkVIsqhv9+4SZFVq0iMFYKzPp5b6PC6t//eXvBVYhvmLCENpqhFe1yIOJh1H6kG+VmFy3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUpAwkPo; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-78f3bfe3f69so1447238b3a.2
        for <linux-hams@vger.kernel.org>; Thu, 16 Oct 2025 23:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760683550; x=1761288350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DTkieSjdzW2L1FZWBBhfo8N9JLViedhpHr/nKm6IjJA=;
        b=EUpAwkPoBsvUpTUsVUB1z3KQAZsjPCl7tGnqTFufa9M1lupibcqsHy+3IiqxyZr8VZ
         qjd+24YVLIJ5ScjqwfOPkD4T0E8ngBAEWdQPUDvvchJ9I21WpLy7UyydvcIBRspB3Jlo
         pCcooLJLageM8onTa87D6MGlWqIG4lr5HNOiBWFscq3EWBN4JvM6pTjuMBOVGM2BPqvx
         4x3L/W0n2C0MHkTAHC4sirqiz3BzhAS2uvamnG3mUJUvSxcJlN+DMOjhaJIg/vNUIMYk
         fjN6wM5H8mpDvvuSUFKWkJLifpQTgurzRmAqn+gTX7eOVLhWj2BlgYFsVwBNyRS2NIBb
         dO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760683550; x=1761288350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTkieSjdzW2L1FZWBBhfo8N9JLViedhpHr/nKm6IjJA=;
        b=iaOOf0AFxxju0AtJM35oeeCW3s0dQOuNR94wSrL6GMNv5RfVDMAKieEwwOTVCwhCgl
         qrBtvXsYazEGy6Q1hVDhRvIh4lP3c0XPmE/zda92SgmWVIEhqL4KwzjrYPg6D5s17FqP
         z3kUWBZ95hdqy5L2VhFLy72G8HqmQPOSVpCcHsOwSD77kTqlkstGANBzFDLMQeDNLZS9
         tf2O7DCK1hB/c5aHP/l7bH1MFV5se0nYcfOHM7dnenN1GRzK0WnzT+/KVezrcx2S8yyc
         FeNUxQlEvzyKL2vhjG43w+ICCy+ZpMbTwQVDCp2WUkPMjzt4O2Ca/QnOxQKyJDEmR5qP
         AIQA==
X-Forwarded-Encrypted: i=1; AJvYcCUVCKtixE3HGyuXpDDu1v45aPJgHYpELozJYNYKRDWB+sKxnONcB0FfFDmeFxH5W0mkKu4blfLwDvmw@vger.kernel.org
X-Gm-Message-State: AOJu0YwjuwRnr5NvJp17goags8C03W60qCKc7glgGukMl7hI0hJ31QmG
	waPfMTTuHmkqtCxg9B/BB3aok9TT2Ujr/EshihHrvy6EEJML58fiSTx4
X-Gm-Gg: ASbGncvVZi1eaP2svL5NXkd/Gar4gWaZL5CYdvv+ktG4NKyNnvoApb+XOBX1Vz3Tlhw
	liTgeg3evC6Vmy5Xx3wcYb3oebhXj9tvkQGbsmBIfwc9sT/YjJl/JRIAzEGMuy5u0jb+s5FS48F
	mu3hiZ+SMNGnIiMmjrEUAzYiFgJ1/dvKGDrZNWsQyYwsX5LgcRJam9N/4S3SbKjjimjZPbvMG2B
	3Poy2X2iuyRMlB7Zms31gCP4DeqPSJuf4rW6laHK/2QBJv+7/ey9MhB9SMoiHNYhpeTy55jPKwH
	b04OezIiX1v3gG6SYbZSIDQ90DTKLStt31k01gWwcRzbLmg3htS1ykKvuFTCIZ8ThsvhJv8o7/y
	2TJPxs0MhEiUcx2SJ8Xx6WVETLqoLLsLtU1AOdw0XXfJ4hgusuNnxABtGPTLtDZStATEKf6fbhY
	gzhC1OEKuJ8Bnz5g==
X-Google-Smtp-Source: AGHT+IEem/fSrEehwV3DtzcYZfeezgViQv1+qknKNWni/oU4JGS8WMmMY//d2kREKtWf2xINR4Ntsw==
X-Received: by 2002:a05:6a00:130e:b0:781:15d0:8848 with SMTP id d2e1a72fcca58-7a2208eec13mr3101403b3a.13.1760683550201;
        Thu, 16 Oct 2025 23:45:50 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-799283c1a15sm5249113b3a.0.2025.10.16.23.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 23:45:49 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 265884528ADD; Fri, 17 Oct 2025 13:45:44 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	linux-hams@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andreas Koensgen <ajk@comnets.uni-bremen.de>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH net-next 0/2] networking docs section headings cleanup
Date: Fri, 17 Oct 2025 13:45:24 +0700
Message-ID: <20251017064525.28836-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=537; i=bagasdotme@gmail.com; h=from:subject; bh=76MXJi1GEaLekMNsuMxE/KJvLVrO4E/BO/gvBM1ACzs=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkfn2wP2+n+ZsO6mh0sAWeV2pb3qzslGMZvVY9IUbfPW VrJHTWvo5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABOJC2BkOH+xgGGG+Iaqxwxb S60FV9eYLNjl+vHB7kNzpCcs+sH/r5Dhny3bKkmxBR3iVqGuuVqNj7n+Sni7n5u0f02syrnv9w7 8ZQUA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Just two net docs patches cleaning up section headings. The shortlog below
should be self-explanatory.

Enjoy!

Bagas Sanjaya (2):
  net: nfc: Format userspace interface subsection headings
  net: 6pack: Demote "How to turn on 6pack support" section heading

 Documentation/networking/6pack.rst | 2 +-
 Documentation/networking/nfc.rst   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)


base-commit: 7e0d4c111369ed385ec4aaa6c9c78c46efda54d0
-- 
An old man doll... just what I always wanted! - Clara


