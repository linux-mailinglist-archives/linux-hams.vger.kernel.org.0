Return-Path: <linux-hams+bounces-381-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA22194795A
	for <lists+linux-hams@lfdr.de>; Mon,  5 Aug 2024 12:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 817F71F22371
	for <lists+linux-hams@lfdr.de>; Mon,  5 Aug 2024 10:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3D41369B1;
	Mon,  5 Aug 2024 10:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0sijGpp"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8AD1547D2;
	Mon,  5 Aug 2024 10:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722853253; cv=none; b=KOBOv+/PweexCiLx0ILUc+7Ou2lqRtjGoFHansV98S38g/AerITAHmkMiCG8Uy+8HCK7aKl40B4wJwYiFMIGh0xxBhpyDMpoj2WrD++R2FLYEVAIxHmNLoqrcXncIRwz1zrpcUKwACKV3QvN7nQ6TQsupu6gVOWRNk2QtazNJDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722853253; c=relaxed/simple;
	bh=sDmmkpl/9Bzr5ouY+9/cCRRGcoKUK/ZE+Geg9qVd8LI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JBEpCpsEUWyjwLWLSD8hliZjnqxMcwosSBIfxSHFPogo6JdRPjmAqXp4k3Gs/lqyzXrE9MIR5kDrZjWJB0jHbxk88BY7EZWxbKd7bmLbhLSLHA4JxKR5tXTiLC3ArdPe4B3Cx5piIPur/bQLADIcvoZCvWpcKQxlNSRZIVtvT4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0sijGpp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E85C32782;
	Mon,  5 Aug 2024 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722853252;
	bh=sDmmkpl/9Bzr5ouY+9/cCRRGcoKUK/ZE+Geg9qVd8LI=;
	h=From:To:Cc:Subject:Date:From;
	b=L0sijGppizYGFI9FfUa4t4H+US8qJOejsHAUZ6ME7kcr7My0WY97VSlQVMGRoLNzz
	 XnslQwiY/XoWLIydbaj+DJWuWlf7kal3CKGjs+VYi5x0Hgpj7l44yaVt+G0sVj7Ebs
	 /I+K1DVtb4jbkkEdePfhAiDBrBs+JXeDrAM3t5d1H/5NxGFgz7QDMCfDkET8zJcHKu
	 YWb/0kyuWV5XgW+4ma/AZ6uxEyXrM0uh46tatxav0n1qcDitK9CScxhHgQbfpvqfq5
	 s+0SqsLmq3Vxai8heUN9wxLxxmyolSp6/6FVIhY5PbjZW1OmuSl0WMq1j5yHzWi5uR
	 Uj5IxNhVzefew==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Andreas Koensgen <ajk@comnets.uni-bremen.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Douglas Anderson <dianders@chromium.org>,
	Eric Dumazet <edumazet@google.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	linux-hams@vger.kernel.org,
	Matt Johnston <matt@codeconstruct.com.au>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH 00/13] tty: random fixes and cleanups
Date: Mon,  5 Aug 2024 12:20:33 +0200
Message-ID: <20240805102046.307511-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

this is a series of locally accumulated patches over past months.

The series:
* makes mctp and 6pack use u8s,
* cleans up 6pack a bit,
* fixes two coverity reports,
* uses guard() to make some of the tty function easier to follow.

Cc: Andreas Koensgen <ajk@comnets.uni-bremen.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: linux-hams@vger.kernel.org
Cc: Matt Johnston <matt@codeconstruct.com.au>
Cc: netdev@vger.kernel.org
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Peter Hurley <peter@hurleysoftware.com>


Jiri Slaby (SUSE) (13):
  tty: simplify tty_dev_name_to_number() using guard(mutex)
  serial: protect uart_port_dtr_rts() in uart_shutdown() too
  serial: don't use uninitialized value in uart_poll_init()
  serial: remove quot_frac from serial8250_do_set_divisor()
  serial: use guards for simple mutex locks
  mxser: remove stale comment
  mxser: remove doubled sets of close times
  mctp: serial: propagage new tty types
  6pack: remove sixpack::rbuff
  6pack: drop sixpack::mtu
  6pack: drop sixpack::buffsize
  6pack: remove global strings
  6pack: propagage new tty types

 drivers/net/hamradio/6pack.c         |  60 ++++--------
 drivers/net/mctp/mctp-serial.c       |  23 ++---
 drivers/tty/mxser.c                  |   5 -
 drivers/tty/serial/8250/8250_dwlib.c |   2 +-
 drivers/tty/serial/8250/8250_exar.c  |   2 +-
 drivers/tty/serial/8250/8250_pci.c   |   2 +-
 drivers/tty/serial/8250/8250_port.c  |   4 +-
 drivers/tty/serial/serial_core.c     | 140 ++++++++++++---------------
 drivers/tty/tty_io.c                 |  11 +--
 include/linux/serial_8250.h          |   2 +-
 10 files changed, 103 insertions(+), 148 deletions(-)

-- 
2.46.0


