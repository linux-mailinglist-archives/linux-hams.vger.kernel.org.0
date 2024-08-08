Return-Path: <linux-hams+bounces-392-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF7794BB5E
	for <lists+linux-hams@lfdr.de>; Thu,  8 Aug 2024 12:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B98D1C2192F
	for <lists+linux-hams@lfdr.de>; Thu,  8 Aug 2024 10:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C81F18E022;
	Thu,  8 Aug 2024 10:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWKmgYYM"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60A918E04B;
	Thu,  8 Aug 2024 10:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723113375; cv=none; b=SGBoixLieHBlsHQZ5wks7FpARuVdoYsO9glVhLlTd23Tiq4uQhqg+d/ocki3dFPirLUl+gccmRc49XZqL6gnIori7wLBxRWKA+r5CD9vHINwKDLuHJnEZBq6zSipb0uE6R54ODvF0xX32MtFnOoB+9ZMq37/bQfNtMEgwtgWZx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723113375; c=relaxed/simple;
	bh=/bx8JyDtijw2rJHtb+tZ3h5JPdq8AmW/Z7d+AJaqE4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YySURA2Fcw+4QL6FKCZSSqByfYEOSQ+ksFJ0G7hFIA0z0IEpQfTSqwS/woD79+aZAxcU7JVktd0Megy2rqEwM8YyIZyuyjDrNPZLzy3y09tLlJExvn4kKW/2OIuUyla+krhtCgX0J9Uf8w/KAF/dofHL+dgl4Fr93eHJML+Z+QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWKmgYYM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA52C4AF10;
	Thu,  8 Aug 2024 10:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723113374;
	bh=/bx8JyDtijw2rJHtb+tZ3h5JPdq8AmW/Z7d+AJaqE4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lWKmgYYMINBEXwVwfECdApHcr2t7E+C73AZJtQq0SJjGodndd+Tj/eK6GNoirpMzU
	 aDmSf5Vz5isrbjOWEa7ZvLGIfMgzgmTggzgUDPsOYhXuBPBwXSOdG+2AlpBq362IHr
	 NA8qbvYkgSvCIhU5XTxL/7dXfCD4uRohELQz7E7Iu/1BhgG1vD31CuNVfB99l8ACzA
	 65IzARmQbPCfzGkCgawMAEbce66WAA62jg5JjT9LARLgl4w9Vg2K21g15uqXBNaSdM
	 7q81tHqALjgcLrX4aX0CLMvBBIKMB80b9ag2pNG7MSOoOcv/0Z5RvSHbSDMa0BYdCv
	 REkggDy4pl3ag==
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
Subject: [PATCH v2 09/11] 6pack: drop sixpack::buffsize
Date: Thu,  8 Aug 2024 12:35:45 +0200
Message-ID: <20240808103549.429349-10-jirislaby@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240808103549.429349-1-jirislaby@kernel.org>
References: <20240808103549.429349-1-jirislaby@kernel.org>
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


