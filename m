Return-Path: <linux-hams+bounces-384-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF98194798D
	for <lists+linux-hams@lfdr.de>; Mon,  5 Aug 2024 12:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 693551F22518
	for <lists+linux-hams@lfdr.de>; Mon,  5 Aug 2024 10:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2CC15F3EC;
	Mon,  5 Aug 2024 10:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSWUy8Oi"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C703815EFCC;
	Mon,  5 Aug 2024 10:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722853274; cv=none; b=S75LnazikDoOzYsFvoJXGmxQI6XwHGip14UgizM+XNLBRwWkFtlJWpSKWd03946AkdUgkQ/a57azgvJrhyu19NV7qoV7oACrTUvboookTkwgLAXbg8FWSmOSo3Uw+1t0NlOOtBykcTE7cUCauPj1tNyuvENqa6aS+XLMLlijetA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722853274; c=relaxed/simple;
	bh=/bx8JyDtijw2rJHtb+tZ3h5JPdq8AmW/Z7d+AJaqE4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X2yRCfPD/a+RvlWXwE+TxpGpwIl2tgcOQ7YKeVGEhPie48SqNUA2uFIuoF4kENv8dHuCgdIHk/ZZtGZvWxq2vfyNpNpOinofW9GbuQU4uY55j4KIgJLI/xV4/KspV4BRm8jYwM+Sir7GqLiS9aKV4DjbocFQZSXCBYu4Bj/45u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSWUy8Oi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638DAC4AF0D;
	Mon,  5 Aug 2024 10:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722853274;
	bh=/bx8JyDtijw2rJHtb+tZ3h5JPdq8AmW/Z7d+AJaqE4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sSWUy8OiwyY1dp3BF1PzQOPb5rXZeRbDRtWeuUI20h226MwW8re8Pgkr7dZ1aNpbK
	 EmZslc8ziuqnOV0/x8f6tUu46ALIJVV9vpUTFvBubLG3UG3/6oHgrc3Y2LKywg3qvy
	 iGSDJIbes97+thPWuCxk3gPj7VcxDQ27hMNhMj3E7Gz+q6vRU1KTl+tXC56ZO9mIZO
	 6oik4jrVJTg6rm1TLsstFjfoYpAfpDCXQCDXt9w+GoHzHeGF1LA7+tu7Y/Roz0jUVo
	 pRd/A0QhG0OV2eTteFYV30Xo+tn2BOwESUtLfc9WmBOqFdjBp8X/Zz8ArcRo7Zm+ic
	 aHAYIo5rRrRig==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Andreas Koensgen <ajk@comnets.uni-bremen.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-hams@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 11/13] 6pack: drop sixpack::buffsize
Date: Mon,  5 Aug 2024 12:20:44 +0200
Message-ID: <20240805102046.307511-12-jirislaby@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240805102046.307511-1-jirislaby@kernel.org>
References: <20240805102046.307511-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's never read.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andreas Koensgen <ajk@comnets.uni-bremen.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org
---
 drivers/net/hamradio/6pack.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index f8235b1b60e9..25d6d2308130 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -100,8 +100,6 @@ struct sixpack {
 	unsigned int		rx_count_cooked;
 	spinlock_t		rxlock;
 
-	int			buffsize;       /* Max buffers sizes */
-
 	unsigned long		flags;		/* Flag values/ mode etc */
 	unsigned char		mode;		/* 6pack mode */
 
@@ -584,7 +582,6 @@ static int sixpack_open(struct tty_struct *tty)
 
 	sp->xbuff	= xbuff;
 
-	sp->buffsize	= len;
 	sp->rcount	= 0;
 	sp->rx_count	= 0;
 	sp->rx_count_cooked = 0;
-- 
2.46.0


