Return-Path: <linux-hams+bounces-459-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5157D9FE20D
	for <lists+linux-hams@lfdr.de>; Mon, 30 Dec 2024 03:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF12E1882307
	for <lists+linux-hams@lfdr.de>; Mon, 30 Dec 2024 02:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85DB913CA99;
	Mon, 30 Dec 2024 02:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="X45rSFzP"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1E77DA88
	for <linux-hams@vger.kernel.org>; Mon, 30 Dec 2024 02:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735526414; cv=none; b=Pe7w/xnQ68e1iE7jSxSV6AZXF8h+0Dqkvt2xGg7Hr2uUehN6Jj9cc7CPgqDVGmYfsX14ZdpHWYkPhWfGDZK/wj5rmSGLKvSuSRKcxWs/6+MOYAetjh5y03SJ6jEnP+g9qNmERe6nsjj82ztDPXLt8Zm7RwUVITG5Cw9zAkxMfsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735526414; c=relaxed/simple;
	bh=JIcjDKA9qK0PY7AUI8KJkAQFsjxctQSEKWZiINnLzoU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oIFA2xNjzL7btpAdVkjt6QuAQUsGnfR7FgNqxCSpsDlBDb3gzriCzu4+gw9l4RvNlBLBrdkeoR8igpWoOr8MaeTQqOqOxUyWZ2D6XpI/27JTiZDygHwlOk6HeLibbb82qJJxXpLVVkrEZwE/NsywTihAyPQy16+0YudRV/N4+nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=X45rSFzP; arc=none smtp.client-ip=79.135.106.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=protonmail3; t=1735526402; x=1735785602;
	bh=JIcjDKA9qK0PY7AUI8KJkAQFsjxctQSEKWZiINnLzoU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=X45rSFzP6mGfB3Q0Xj3o3p4ggMg7V/aGJjVI2pxtj/QjpVOD/mEzIKyYhF8RX2hvX
	 7kAci35SfLdC1uGGYAd8QDXfRLJpR/kaIPGV/+LWQ91F3zAmjEuutfO0JU+kxkQr/k
	 X8FKnhWbHX7qYbQQED9/XWfU0EQO/MwZFjmn1LQ4TsDK9O9V4iMR8b9CnTUoK9ylpy
	 aEqnN4CoHuMWCOTqzwH8yLLA6THVgGUYI00TcO5c2YJ7I7zsSgrhYgcxSDfHiriMCx
	 rqZeamyPOGzlWcycQjUZ3TJwyFyMkJzIwHxLEN7yDpePUIqwKcYMaMc1Rt7+yS/ZO0
	 8zCc4O2eYCxKg==
Date: Mon, 30 Dec 2024 02:39:59 +0000
To: linux-hams@vger.kernel.org
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: remove Thomas Sailer due to missing address
Message-ID: <6gbmhswn47d7lxazh5fnqebujknuzmj6k5pghaxvnuhmjjyfuc@5g4uxhqcxnnv>
Feedback-ID: 28410670:user:proton
X-Pm-Message-ID: e0a32089cf96fc95dadaafa616409b88dd58a370
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thomas Sailer's <t.sailer@alumni.ethz.ch> email address no longer
exists. When I tried to email him I received a bounceback email from his
mailserver.

Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 910305c11e8a..7ea9b92e22f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3886,9 +3886,8 @@ F:=09include/uapi/linux/batman_adv.h
 F:=09net/batman-adv/
=20
 BAYCOM/HDLCDRV DRIVERS FOR AX.25
-M:=09Thomas Sailer <t.sailer@alumni.ethz.ch>
 L:=09linux-hams@vger.kernel.org
-S:=09Maintained
+S:=09Orphan
 W:=09http://www.baycom.org/~tom/ham/ham.html
 F:=09drivers/net/hamradio/baycom*
=20
--=20
2.47.1


