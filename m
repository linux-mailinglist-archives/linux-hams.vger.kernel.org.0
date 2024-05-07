Return-Path: <linux-hams+bounces-242-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 478F28BDD4B
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 10:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F17691F22F5B
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 08:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FE214D2BB;
	Tue,  7 May 2024 08:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQ9X2413"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C4F13C9A6;
	Tue,  7 May 2024 08:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715071286; cv=none; b=HhLLv+Qx/9OpWcAG6mzHtB6RGxM0jywVAENWimPOTP/8ik0Ta8T3pnkl74bvC0TMtEX47ZeBVWr499NfVZu8c0RPFJQRJXj2MePRjshVEHCwWUZfpTpVuerjEEbTsxtulhqGpU6kQnEBJciTiC4iOVM4zoC+uyNP6KYrx3TJwl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715071286; c=relaxed/simple;
	bh=A/2Xf3e32e9UcB7o3tAbPoI2bnWij43ER/ZIruQceYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YcJ4N8cGWRmgYo8h0RXjiWXFpNHOLTP0C+LzBIJEWYHusZxQX6oiY1PBRB698T5rbmb3bU4GO20S2e/tGAOmb3jN0JbXHNW6NfKf0R0fKsRH+j1hoWbtf+WmndjITe/rNuf7WwuvqghLEXhd8ycnLU7NDU2ZhyGfHzuOXJ1AfFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQ9X2413; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3631CC2BBFC;
	Tue,  7 May 2024 08:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715071286;
	bh=A/2Xf3e32e9UcB7o3tAbPoI2bnWij43ER/ZIruQceYo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=iQ9X2413o12RNjv+LXmSF9xIWMTJLb+TyP6gNMFjhfDCeKmYP524WeQDYWjfwD6R6
	 /2+vg2DR02wsPevCQ2p0RM5UBympySJaLd5+FDMTZEpECVqD27778YNd/nbQyRpQN5
	 DC4bm890/NGAwq68cZrv6EFqQbsenJqCdlCnR3Jh7IvCvL+Lf1lx0z99VPMeCQZhsv
	 g32RPxYkUS6fFdOImpvBCYAPD9bewsdKjqrJfnPjbIZ+ezsJejLPKtaLYgmDtiUhNW
	 mgQTtjs1I7ejCaiXPAu/PWDD1UL7ILw9AEMem1DQHNh1isdg7ciiY7U0KeYbXtFcTH
	 MlS5c2SQgBQcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C95C10F1A;
	Tue,  7 May 2024 08:41:26 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Tue, 07 May 2024 10:40:39 +0200
Subject: [PATCH net-next] ax25: Remove superfuous "return" from
 ax25_ds_set_timer
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-jag-fix_void_ret_ax25-v1-1-507fb246f192@samsung.com>
X-B4-Tracking: v=1; b=H4sIAAbpOWYC/x2MQQqAIBAAvxJ7bsEksfpKhIhutR0sVEKI/p50H
 JiZBxJFpgRT80CkmxOfoULXNuB2GzZC9pVBCtkLJTQedsOVi7lP9iZSNrZIhU4PnVDe+VWPUNs
 rUpX+7wyBMgYqGZb3/QAxNoBicQAAAA==
To: Joerg Reuter <jreuter@yaina.de>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=dQzZAU/bAVlITUmjSe4Wlgex023rGgXtHdNKuKlNEBE=;
 b=owJ4nAHtARL+kA0DAAoBupfNUreWQU8ByyZiAGY56TMcXuz2REsRh/+4pIWo6jsuY6Qwkwzip
 jwFEVTLvwjGoIkBswQAAQoAHRYhBK5HCVcl5jElzssnkLqXzVK3lkFPBQJmOekzAAoJELqXzVK3
 lkFPKhoL/25nUOLnvXhgHq5xRiJ8Ej/14vrShYBRPYQpM2FsDQdr+1aTDO+rbYrGsLncbC4tLCU
 KHMrI7oDjS6Mdl59SH0avR8d2BpA0Z8xH4JeQe1ThRH9u2JGi5G1jL/ObpPV487YwB3lAeqPoZm
 T7ONh3gyzKn7f0OvFk1Z+rM73hQvZchfXng4jFI0hVFIanhNZTUZhrrMh89B2HmcqersZgTdXmt
 Bj1cQxX2wfu8+7JTyDkt2wWttN9XQV2mAp3tP+7tgiZrLkTCnHl8jsIkoE+8mP4wbbldcKRi/me
 bUVv0+Itbzc7pxsVr2fmclidQzfUqNW2ULrPLL5ZnLisUnXtP7Q+5RGJuy+rxt5R1E7wDEYs9bT
 L/tleobFn97hXmsR1uIonaxK1WtYvIr8E7oVFzV38Ltf13/Fx3jKuyZkN7joYi3pWh+NA4wSnAc
 qwNtSPwC51O+p14SQP076eFhO7VMYIDnLRDD3gxuMHte8VnxVt5k1W2JwpSylYPYMHo9nEOMpT8
 lw=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with
 auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
Reply-To: j.granados@samsung.com

From: Joel Granados <j.granados@samsung.com>

Remove the explicit call to "return" in the void ax25_ds_set_timer
function that was introduced in 78a7b5dbc060 ("ax.25: x.25: Remove the
now superfluous sentinel elements from ctl_table array").

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
I did not include a "Fixes:" tag as this (IMO) should not be backported
into a stable kernel. I'm assuming that net-next is going to be merged
into mainline as is and therefore I linked to a specific commit ID (get
back to me if I should do something different)

This comes after a review from Dave Carpenter [1] to an already accepted
patchset [2]

[1] https://lore.kernel.org/all/20240501-jag-sysctl_remset_net-v6-8-370b702b6b4a@samsung.com
[2] https://patchwork.kernel.org/project/netdevbpf/patch/20240501-jag-sysctl_remset_net-v6-1-370b702b6b4a@samsung.com/ 
---
 net/ax25/ax25_ds_timer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/ax25/ax25_ds_timer.c b/net/ax25/ax25_ds_timer.c
index c50a58d9e368..c4f8adbf8144 100644
--- a/net/ax25/ax25_ds_timer.c
+++ b/net/ax25/ax25_ds_timer.c
@@ -55,7 +55,6 @@ void ax25_ds_set_timer(ax25_dev *ax25_dev)
 	ax25_dev->dama.slave_timeout =
 		msecs_to_jiffies(ax25_dev->values[AX25_VALUES_DS_TIMEOUT]) / 10;
 	mod_timer(&ax25_dev->dama.slave_timer, jiffies + HZ);
-	return;
 }
 
 /*

---
base-commit: 179a6f5df8dab7d027aa73a302d8506c6533e463
change-id: 20240507-jag-fix_void_ret_ax25-c78105dcdf79

Best regards,
-- 
Joel Granados <j.granados@samsung.com>



