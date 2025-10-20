Return-Path: <linux-hams+bounces-656-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 853A8BEF5A8
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 07:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 02BD34EAB88
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 05:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66872BFC7B;
	Mon, 20 Oct 2025 05:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eStqRMmD"
X-Original-To: linux-hams@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB2120322;
	Mon, 20 Oct 2025 05:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760938040; cv=none; b=JJ2fWb/BfMcpzb9dmzNXygnTBaZZWLCKACheQKCYCFHwLEglQTBsUQJL1bqakoYAB/OrsZj87XoD56xU/RvJNOMy5T5qLry94J+yi0nourIQdRpBhSclnsEdKKZnXSHwDXyPEybsaN3jXls/AAhGODMUjSArJIareqjZhNgxCZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760938040; c=relaxed/simple;
	bh=pjv27r7QuFlJLltYkIKIqdG/4fKNXr9By/FnskhCl08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pMErOiFbJAIMKt1vFhH987O/rkyy7FN36bakMlvkbKuGZU6HU8pFKj7myv3lIZoI1tsViW7XNe8Z7xsP3pCCwzicymwsDLZUeFDH9UlN06i+J9JzKQNECWn9219HwjZ6wwsctz6iC7k/s4gIQyYS08+mQWgycHvjLgbFsL0At6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eStqRMmD; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=yVsea+HCN4hY4YZQuidit4w4s7phlBugarke+Sz1tAU=; b=eStqRMmDCJEPNcUMBc8FGsBVrf
	UF3TZX00nSkm1drMyNnewzv91Fy7DfC9jsqXVpwLLcHnPuoB7yjWFbQsMXt30UOqwUFLCTV4y/v26
	XyW+FgIOT3PC2nxykESchXuXWEMpUot/qEwai3ZhDeAzkF5468JTP4ugDzYYlk1s8/+KFyeBMU7ED
	jtrPC9B376FD3dhvJxmplbzpBdrr5kGZ6xEwVkTk47RLW3xSVWudGVDwZJplfs8+Kig+edrnKRaYj
	7q7kEP08oCZ/CBLJtO9ngaylZdyGoSFoiht4WhJN2RkClyp7dyOTskzohlxRF9XsHRTBU5fZojWRd
	E9Sv4DzA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAiQP-0000000Bw8d-1eAD;
	Mon, 20 Oct 2025 05:27:17 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: netdev@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	linux-hams@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: networking: ax25: update the mailing list info.
Date: Sun, 19 Oct 2025 22:27:16 -0700
Message-ID: <20251020052716.3136773-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the mailing list subscription information for the linux-hams
mailing list.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: linux-hams@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/networking/ax25.rst |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--- linux-next-20251016.orig/Documentation/networking/ax25.rst
+++ linux-next-20251016/Documentation/networking/ax25.rst
@@ -11,6 +11,7 @@ found on https://linux-ax25.in-berlin.de
 
 There is a mailing list for discussing Linux amateur radio matters
 called linux-hams@vger.kernel.org. To subscribe to it, send a message to
-majordomo@vger.kernel.org with the words "subscribe linux-hams" in the body
-of the message, the subject field is ignored.  You don't need to be
-subscribed to post but of course that means you might miss an answer.
+linux-hams+subscribe@vger.kernel.org or use the web interface at
+https://vger.kernel.org. The subject and body of the message are
+ignored.  You don't need to be subscribed to post but of course that
+means you might miss an answer.

