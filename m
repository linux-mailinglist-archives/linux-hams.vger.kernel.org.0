Return-Path: <linux-hams+bounces-21-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8AF828A42
	for <lists+linux-hams@lfdr.de>; Tue,  9 Jan 2024 17:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E71BA2882F5
	for <lists+linux-hams@lfdr.de>; Tue,  9 Jan 2024 16:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD0F3A294;
	Tue,  9 Jan 2024 16:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXWvp3RF"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F953B18A;
	Tue,  9 Jan 2024 16:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB90C43609;
	Tue,  9 Jan 2024 16:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704818726;
	bh=BoIauk8diS1msR+j6h/3IjO6Ifvwea1xzmanxnMUhKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XXWvp3RF9wsXr1MiMoovoQ/ADTPSNTBHuCdv8vp6UmfII40oZQZHXdSsDOhcpmZHT
	 aRlUacg2b8fRAVkDojry/FkgHP6wUSSqBQIPYc0STarTLLqPh+9obPtFk3LpjUiVN9
	 BL2ofTpPERQuKMwwWDkithrSPtpzT5z5GEtgOdgmcCy/WulzDnmbQdqv0KtfEtkQGP
	 Exue6QIRiF6WXJrac3VIfPr8Czfe8w4tiUGqg3lqTqUM34CByS6YiKfv37q8cKMvs/
	 TBVLRISxNfs+FmD9C7TrtLKzBj4QxTy4D7UOoh4oyKh+1Ml/bN47hu8uboGWeqMoOs
	 C3xUWaywoD96A==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	Jakub Kicinski <kuba@kernel.org>,
	Ralf Baechle <ralf@linux-mips.org>,
	linux-hams@vger.kernel.org
Subject: [PATCH net 6/7] MAINTAINERS: mark ax25 as Orphan
Date: Tue,  9 Jan 2024 08:45:16 -0800
Message-ID: <20240109164517.3063131-7-kuba@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109164517.3063131-1-kuba@kernel.org>
References: <20240109164517.3063131-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We haven't heard from Ralf for two years, according to lore.
We get a constant stream of "fixes" to ax25 from people using
code analysis tools. Nobody is reviewing those, let's reflect
this reality in MAINTAINERS.

Subsystem AX.25 NETWORK LAYER
  Changes 9 / 59 (15%)
  (No activity)
  Top reviewers:
    [2]: mkl@pengutronix.de
    [2]: edumazet@google.com
    [2]: stefan@datenfreihafen.org
  INACTIVE MAINTAINER Ralf Baechle <ralf@linux-mips.org>

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: Ralf Baechle <ralf@linux-mips.org>
CC: linux-hams@vger.kernel.org
---
 CREDITS     | 1 +
 MAINTAINERS | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index 1228f96110c4..8a483505e6b1 100644
--- a/CREDITS
+++ b/CREDITS
@@ -183,6 +183,7 @@ E: ralf@gnu.org
 P: 1024/AF7B30C1 CF 97 C2 CC 6D AE A7 FE  C8 BA 9C FC 88 DE 32 C3
 D: Linux/MIPS port
 D: Linux/68k hacker
+D: AX25 maintainer
 S: Hauptstrasse 19
 S: 79837 St. Blasien
 S: Germany
diff --git a/MAINTAINERS b/MAINTAINERS
index 388fe7baf89a..c8636166740f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3372,9 +3372,8 @@ F:	Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
 F:	drivers/iio/adc/hx711.c
 
 AX.25 NETWORK LAYER
-M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-hams@vger.kernel.org
-S:	Maintained
+S:	Orphan
 W:	https://linux-ax25.in-berlin.de
 F:	include/net/ax25.h
 F:	include/uapi/linux/ax25.h
-- 
2.43.0


