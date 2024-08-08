Return-Path: <linux-hams+bounces-389-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 543D894BB3E
	for <lists+linux-hams@lfdr.de>; Thu,  8 Aug 2024 12:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 057CB1F22D37
	for <lists+linux-hams@lfdr.de>; Thu,  8 Aug 2024 10:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929B518A92A;
	Thu,  8 Aug 2024 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NtgrOA9O"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCC018A6AB;
	Thu,  8 Aug 2024 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723113355; cv=none; b=sQl3EI0QEmlCl63OGfSre5c+lwgrRSJzq3igGyczQ+a6PEkjs4rS+uS6bzKyS4gAB/TCYmmWjCEqW5upKmXcvq97dDbjCpPjIqvRuxtzjYhV6ieMG3IUGJR1X22qDtJY1EsNTsBZcrb13ZVDVW2HvvcQzdT64ToDq1VMuWQMHec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723113355; c=relaxed/simple;
	bh=xgT1DTrtS2BTALYpnpNPT2qA7RzEiYYzMnGwhu3460I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CilIk1H67SfPGNg1bhsUaH1dYgO4ZZCSp3s/cu5UFQvZ4/MYd59IyL4YK6sUoy4tcGp7hxpJfxexOw9PggAILgPai2DLJvAqmCgbzERezJBbvsNz1fDTApBrMcz9fYbYfEKBwiYp5hCFDzPGaSWu4ueu9OLlGBysKnqPYUVukdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NtgrOA9O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11096C32782;
	Thu,  8 Aug 2024 10:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723113354;
	bh=xgT1DTrtS2BTALYpnpNPT2qA7RzEiYYzMnGwhu3460I=;
	h=From:To:Cc:Subject:Date:From;
	b=NtgrOA9ORtqANBtpOLvL4sIBlnwGU2RFKIwD3bT0JuROWBRwZEfC5133Gsh5C8dAx
	 jzeMh8+uMfIkfcY8SqWTFgDY1sYv8zXMVcn7dJUOtus16LLM8oh/xY9e8mhmor4SFH
	 pF4T7BDjWZn6QT9g1QSH6g00Qpri0biOW1iWE96k/CAtduTpXvQXjSkuYGZCEuDpGt
	 1ZCUPPRf9ofjIHBZqPYZI/Xe5sK6TNPrBVj4AfW4+Udbz7shOAt93PX4qgN2RHDjiZ
	 I/iYxMMiHL5mdRYpIu68+/dtHxLTwf9ZnIySEpM7wC3MquStgfNSHYAEwCJOF5gonl
	 jhTrUN0ea0Dgw==
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
	Peter Hurley <peter@hurleysoftware.com>,
	linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@intel.com>
Subject: [PATCH v2 00/11] tty: random fixes and cleanups
Date: Thu,  8 Aug 2024 12:35:36 +0200
Message-ID: <20240808103549.429349-1-jirislaby@kernel.org>
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
Cc: linux-usb@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>

[v2]
 * fixed "serial: use guards for simple mutex locks"
 * added also previously missed xhci dbgtty patches

Jiri Slaby (SUSE) (11):
  serial: use guards for simple mutex locks
  mxser: remove stale comment
  mxser: remove doubled sets of close times
  xhci: dbgtty: remove kfifo_out() wrapper
  xhci: dbgtty: use kfifo from tty_port struct
  mctp: serial: propagage new tty types
  6pack: remove sixpack::rbuff
  6pack: drop sixpack::mtu
  6pack: drop sixpack::buffsize
  6pack: remove global strings
  6pack: propagage new tty types

 drivers/net/hamradio/6pack.c     |  60 ++++++----------
 drivers/net/mctp/mctp-serial.c   |  23 ++++---
 drivers/tty/mxser.c              |   5 --
 drivers/tty/serial/serial_core.c | 113 +++++++++++++------------------
 drivers/usb/host/xhci-dbgcap.h   |   1 -
 drivers/usb/host/xhci-dbgtty.c   |  30 +++-----
 6 files changed, 88 insertions(+), 144 deletions(-)

-- 
2.46.0


