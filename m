Return-Path: <linux-hams+bounces-386-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D3894799C
	for <lists+linux-hams@lfdr.de>; Mon,  5 Aug 2024 12:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8727B20B5A
	for <lists+linux-hams@lfdr.de>; Mon,  5 Aug 2024 10:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B963165EFD;
	Mon,  5 Aug 2024 10:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WapI0yCn"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50996165EF1;
	Mon,  5 Aug 2024 10:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722853280; cv=none; b=omAPqh3rsTpfD+osO5vgQOYLDQey7OaX3zWQYIMch/eYCCNQpY+aSVg5EoG+9HdIGp7FlfkzBudXiXXOft40AHoMaBDwL166BhRUJlRkd+LRAN/UH007eNHyACBJn5avR2I2iDOgPXCSA/WRoYLlWR06wqTUHXVjIcJ28APQY30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722853280; c=relaxed/simple;
	bh=UTNt9b26mQWZHW0TPCLWfErk9+9NMWIJfFgYZHzW/Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3m7mr7Lps+nFEQoiyR42x5fJ025oW3EQCktdMoXlkR8mrWqbv/9sNKf5i2uxNBX08TF1OU11B6b0Ca55ySPuBMQfIVjDkwEUXQzjMVaz1Wnwj9HQSBX6Q67D7DZMuCnxWeDvadKo168qEg+1E+ZjPhyhY8aYkFxDnuF12xy+Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WapI0yCn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B38C4AF0D;
	Mon,  5 Aug 2024 10:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722853280;
	bh=UTNt9b26mQWZHW0TPCLWfErk9+9NMWIJfFgYZHzW/Wc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WapI0yCngBCE5c2SNP9W/lPrqFLrVQ0ceeV4igrs5u8Semeb5mvQUaLid0mtRX4oP
	 lct/25I9Dg7wVEF3ElCrvifB+dH+Dv4gG8lpGNIZuL0t81CHJY5H/Z7RpVpJrI1lLj
	 urQqqML02c3GUVjuLyafJI9AeTeU5jqhxNvbqc9aatqdgeVuElHBNpbQOoOb8vHsYl
	 FBPfIa0vvDoys4MG4zX0pMh3P8eOxg7oT0Lo6Nz4v97qtRuBLwMNTI2bid76is3nNE
	 WNYTYTBs6weQiBzqMoTKDvQdgNXjI8XHO45ARk2Z9XQwbeHo6+DKIjgm6HX30u3OLz
	 Q3d9n91pYrPjg==
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
Subject: [PATCH 13/13] 6pack: propagage new tty types
Date: Mon,  5 Aug 2024 12:20:46 +0200
Message-ID: <20240805102046.307511-14-jirislaby@kernel.org>
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

In tty, u8 is now used for data, ssize_t for sizes (with possible
negative error codes). Propagate these types to 6pack.

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
 drivers/net/hamradio/6pack.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index 5c47730f5d58..3bf6785f9057 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -91,8 +91,8 @@ struct sixpack {
 	unsigned char		*xhead;         /* next byte to XMIT */
 	int			xleft;          /* bytes left in XMIT queue  */
 
-	unsigned char		raw_buf[4];
-	unsigned char		cooked_buf[400];
+	u8			raw_buf[4];
+	u8			cooked_buf[400];
 
 	unsigned int		rx_count;
 	unsigned int		rx_count_cooked;
@@ -107,8 +107,8 @@ struct sixpack {
 	unsigned char		slottime;
 	unsigned char		duplex;
 	unsigned char		led_state;
-	unsigned char		status;
-	unsigned char		status1;
+	u8			status;
+	u8			status1;
 	unsigned char		status2;
 	unsigned char		tx_enable;
 	unsigned char		tnc_state;
@@ -122,7 +122,7 @@ struct sixpack {
 
 #define AX25_6PACK_HEADER_LEN 0
 
-static void sixpack_decode(struct sixpack *, const unsigned char[], int);
+static void sixpack_decode(struct sixpack *, const u8 *, size_t);
 static int encode_sixpack(unsigned char *, unsigned char *, int, unsigned char);
 
 /*
@@ -327,7 +327,7 @@ static void sp_bump(struct sixpack *sp, char cmd)
 {
 	struct sk_buff *skb;
 	int count;
-	unsigned char *ptr;
+	u8 *ptr;
 
 	count = sp->rcount + 1;
 
@@ -425,7 +425,7 @@ static void sixpack_receive_buf(struct tty_struct *tty, const u8 *cp,
 				const u8 *fp, size_t count)
 {
 	struct sixpack *sp;
-	int count1;
+	size_t count1;
 
 	if (!count)
 		return;
@@ -800,9 +800,9 @@ static int encode_sixpack(unsigned char *tx_buf, unsigned char *tx_buf_raw,
 
 /* decode 4 sixpack-encoded bytes into 3 data bytes */
 
-static void decode_data(struct sixpack *sp, unsigned char inbyte)
+static void decode_data(struct sixpack *sp, u8 inbyte)
 {
-	unsigned char *buf;
+	u8 *buf;
 
 	if (sp->rx_count != 3) {
 		sp->raw_buf[sp->rx_count++] = inbyte;
@@ -828,9 +828,9 @@ static void decode_data(struct sixpack *sp, unsigned char inbyte)
 
 /* identify and execute a 6pack priority command byte */
 
-static void decode_prio_command(struct sixpack *sp, unsigned char cmd)
+static void decode_prio_command(struct sixpack *sp, u8 cmd)
 {
-	int actual;
+	ssize_t actual;
 
 	if ((cmd & SIXP_PRIO_DATA_MASK) != 0) {     /* idle ? */
 
@@ -878,9 +878,9 @@ static void decode_prio_command(struct sixpack *sp, unsigned char cmd)
 
 /* identify and execute a standard 6pack command byte */
 
-static void decode_std_command(struct sixpack *sp, unsigned char cmd)
+static void decode_std_command(struct sixpack *sp, u8 cmd)
 {
-	unsigned char checksum = 0, rest = 0;
+	u8 checksum = 0, rest = 0;
 	short i;
 
 	switch (cmd & SIXP_CMD_MASK) {     /* normal command */
@@ -928,10 +928,10 @@ static void decode_std_command(struct sixpack *sp, unsigned char cmd)
 /* decode a 6pack packet */
 
 static void
-sixpack_decode(struct sixpack *sp, const unsigned char *pre_rbuff, int count)
+sixpack_decode(struct sixpack *sp, const u8 *pre_rbuff, size_t count)
 {
-	unsigned char inbyte;
-	int count1;
+	size_t count1;
+	u8 inbyte;
 
 	for (count1 = 0; count1 < count; count1++) {
 		inbyte = pre_rbuff[count1];
-- 
2.46.0


