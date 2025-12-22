Return-Path: <linux-hams+bounces-737-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5642BCD72FF
	for <lists+linux-hams@lfdr.de>; Mon, 22 Dec 2025 22:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F16B53014A04
	for <lists+linux-hams@lfdr.de>; Mon, 22 Dec 2025 21:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BBE3074AB;
	Mon, 22 Dec 2025 21:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aiHukJxK"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C513009C1
	for <linux-hams@vger.kernel.org>; Mon, 22 Dec 2025 21:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766438564; cv=none; b=HmrJs9d+39akaGNOtHSQtI22DCDLDpaKI2sCnmGbyn8+s1SaemOn1MbHz+CJ7QSkFMYnnTuaYEvkcR4wBZxPo3q+DJXAMCnbB/Ca8faoh/Jz03YlLtWVbLYMDuxtsEQcW2qH54vw+tBPc4yIR42/kwPBMzJXQwihluwWDlg2svE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766438564; c=relaxed/simple;
	bh=8eo4J8AK+aRH1j7peYCAA3rXxRM4PIYen6KnK8j4OuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zr0y5dfPfOo/XGznEGnQRLUPIvs98fpCofetG4FGbUZSbjNB62XkjvLROnRg6txKf2h7RYFwIZineZSn5hhPpNtuktZ8u0yAOZxUTCc0jL4hZrgP+nkhv1TQuBjqJCgs8bGxpY4/n0/H2G1DpX0nlqdEUdOtSkDwVtrkU7bdrV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aiHukJxK; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-78fb7ab7562so24185717b3.2
        for <linux-hams@vger.kernel.org>; Mon, 22 Dec 2025 13:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766438562; x=1767043362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=avc6gMhjIypMIzGq7rfC6eXw+5jZGUWEN+YMRJgojxw=;
        b=aiHukJxK83O7ZoypcjCD1sIWTA2+gBWpxgAMVqeSswY2OtzqNqe/ChcFTAf/zZUgey
         N8Nj/syt0OUm+Ef8swU9DMJG8tqYkyMkE1dcrd+7FjeTn4H8iaA5v+v3k5YWH7VoAURs
         WlHHLyVU1tBWoEgbU7wpZTHC+37aL9qjf9vt12tFBUwCxjKHOVKXmC5sFkwfzKRKcvbX
         hGPf6aoSfTU233hw3kJFnr4mKvxWD9TbWHa6w6mWadFRSeK7zu1mw5l4pfh9DIgto0lT
         kjppY5lIBJZRgJ43hqenCyiPQjmAiJbMbroGA6pXKO2xz3QLEwE1VrZaJ5UznqwGBr6S
         jHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766438562; x=1767043362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avc6gMhjIypMIzGq7rfC6eXw+5jZGUWEN+YMRJgojxw=;
        b=SOYLtAq+wkdaq2z3w7Nabsr0ninDmQi4OC/l6wth5FDsPSVAWnv6C6klQ8XlSHUUbS
         bnG2cL1mOWaP3x4A1SCuVJ9c82TbjUsbf+Z8cahTz/Nu4+GNmvC9SJo8ptcAo/e5BbNr
         ktW56jVVF0GzPDexvBdJcP4RvFjkaJXR7z9ZMeD3crE63FwNRjvr4EuuNQC9OFP+8i1H
         Q3GOCuHS1E5yc93Mgr08jIZpVP86jKaWUJUZlpySW55gaK3gaO6k8C3q34eyRX8gCozD
         otOiOGQBK47UY6g3lFOiZxSpDhrI0ivqRGrALg34BjGojEEVDFzhOooBtgtZd/NlVW9r
         0Z+A==
X-Forwarded-Encrypted: i=1; AJvYcCVa0oyvRAwno7tNAAvNeybwClaQ5vRrwYohmWuu3uuau/CU35QPz+bUH3ncSk6QqN58JkKPgLHOfg7r@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb0OdWARHH2nsetHYgIZ4SCKvp+58v8QRXju4TDiTPuQghtsZR
	eivwPBz1cRNAMinO0Ju63OYkFfl7d9Qf66j5vjclVJnI6pGe+q3/qO/K
X-Gm-Gg: AY/fxX4aSKlNQWPMCA1XdzBpJn3+kk3ViZE0BZxd8l+5bOvJ1M8J5Pia4EYREOkav7H
	5lrvGozDnaqbJWSGaTPUolNZRyWh+FKGaq9HCMYBANEHL7+J5R8csrRJahB0VXaZ19Ew+e85OpB
	hyfde7pqU+GxPLlxlMYcVALto77YfVIq9hzuncKs+a9b804pLZrZBIzlo9UxtpdvtafJeUrgHpS
	I1fdeh2ieX75RHOODKQG8hPvpWOCV/fRnSZVyVrjmJM82Ghxxmotp/n5QeDwwMXTNv8Hon6nUzj
	DLqHfOs04Xs/zBW/Z13kEIzu9MUF8T5K4TmykIeEztSyePqQxuwkBkBpZDRLv4oXYCz0+PfOCNK
	sB10Kt4/O0QY9/D/5daeX7FLOttGjg7e1VzRQGzX7iaVar4PwtfgtvrGwW54jl0oPM6EjPlyJ+x
	Z0YnQyY1e4g/7QY6j5CN+sueX4q9OPDk9h
X-Google-Smtp-Source: AGHT+IG+t+vm07IfI0JY8xSOL4QtCu7revhabIMBVxAC10bzdwWyO0GXifIxbCOnzbItWz3g+CPpsQ==
X-Received: by 2002:a05:690c:3709:b0:787:f043:1f10 with SMTP id 00721157ae682-78fb40d9267mr233032437b3.66.1766438561947;
        Mon, 22 Dec 2025 13:22:41 -0800 (PST)
Received: from guava.tail5f562.ts.net ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a8bcc06sm6008624d50.7.2025.12.22.13.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 13:22:41 -0800 (PST)
From: Sai Ritvik Tanksalkar <ritviktanksalkar@gmail.com>
To: kuba@kernel.org,
	pabeni@redhat.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-hams@vger.kernel.org,
	Pwnverse <stanksal@purdue.edu>,
	Fatma Alwasmi <falwasmi@purdue.edu>
Subject: [PATCH net] net: rose: fix invalid array index in rose_kill_by_device()
Date: Mon, 22 Dec 2025 21:22:27 +0000
Message-ID: <20251222212227.4116041-1-ritviktanksalkar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pwnverse <stanksal@purdue.edu>

rose_kill_by_device() collects sockets into a local array[] and then
iterates over them to disconnect sockets bound to a device being brought
down.

The loop mistakenly indexes array[cnt] instead of array[i]. For cnt <
ARRAY_SIZE(array), this reads an uninitialized entry; for cnt ==
ARRAY_SIZE(array), it is an out-of-bounds read. Either case can lead to
an invalid socket pointer dereference and also leaks references taken
via sock_hold().

Fix the index to use i.

Fixes: 64b8bc7d5f143 ("net/rose: fix races in rose_kill_by_device()")
Co-developed-by: Fatma Alwasmi <falwasmi@purdue.edu>
Signed-off-by: Fatma Alwasmi <falwasmi@purdue.edu>
Signed-off-by: Pwnverse <stanksal@purdue.edu>
---
 net/rose/af_rose.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index fd67494f2815..c0f5a515a8ce 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -205,7 +205,7 @@ static void rose_kill_by_device(struct net_device *dev)
 	spin_unlock_bh(&rose_list_lock);
 
 	for (i = 0; i < cnt; i++) {
-		sk = array[cnt];
+		sk = array[i];
 		rose = rose_sk(sk);
 		lock_sock(sk);
 		spin_lock_bh(&rose_list_lock);
-- 
2.43.0


