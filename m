Return-Path: <linux-hams+bounces-483-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A175A6F1AB
	for <lists+linux-hams@lfdr.de>; Tue, 25 Mar 2025 12:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BF1416A264
	for <lists+linux-hams@lfdr.de>; Tue, 25 Mar 2025 11:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC0D255E3D;
	Tue, 25 Mar 2025 11:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQRRb1h9"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642372E337C;
	Tue, 25 Mar 2025 11:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742901713; cv=none; b=N0W8vooBoUZPQzWpF0olo6TcaPFyGaqUkbTSqTyIXeZ5ZeNYhUPgZOH7zjIm2F6SiKQWJbdlnjRgOPS0Hm/P+afQeMsEanlRfZENbElcLHs0t1Wls5G20mXsK645aj2kzTiEmtRf/se+WgmUG6QK1/EaEwQ5yJPCNvE3D5C/mbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742901713; c=relaxed/simple;
	bh=ftwtZXIOCMaYAxzuWBdEbpL26cxxbkseuQptRaNUc+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k1KgLeVe6xcxXMk6S5gFpBZfai5jC0VkJLC+/hyYazDwonL4kiTZf6urMwVE6YeRY2mnSvdzRsR/bWu6fnKHwfrH6Xs1gl2wBHxnNCZZTlpVvNCjTCVtigDJ2vQ4/0V3oP8kxd0q7Lm1sXUgzK+XIBpTqpF09QbBkUW4sJD97Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQRRb1h9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F450C4CEE4;
	Tue, 25 Mar 2025 11:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742901712;
	bh=ftwtZXIOCMaYAxzuWBdEbpL26cxxbkseuQptRaNUc+Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KQRRb1h9cWQhfU/gB9TJRz1RpitBikdcWCYG2g+XXI75psCXyQ5vOXFamDiKliebd
	 PKHXhiBrabOZmAlPa+rs9piKbgAHdK2DIlAujwG/LP1qqIE3QrIHTkatlCIQc1m5jr
	 7F8I+ykoIFV1aw7WSU7YZYIKGldI/5QKkmKF2Cecc6Vejq1GPnh8dRDqn/gnUyIGNv
	 qrFi0Aciy0BoB7xqfJlk+aimtW7QfHHUzNEp4jWQ/45gbfnuI9KX+bxW4op8luOueY
	 8/GXQcOXmFQCfNnRSxem8AAGJzNc0w2DErsETaALNMmtb2AVnJOM7yb+OQkRS4pQbC
	 1qRB5TyEPz47A==
Date: Tue, 25 Mar 2025 04:21:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Murad Masimov <m.masimov@mt-integration.ru>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Joerg Reuter <jreuter@yaina.de>, Kuniyuki Iwashima
 <kuniyu@amazon.com>, <linux-hams@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <lvc-project@linuxtesting.org>,
 <syzbot+33841dc6aa3e1d86b78a@syzkaller.appspotmail.com>
Subject: Re: [PATCH] ax25: Remove broken autobind
Message-ID: <20250325042144.022c9121@kernel.org>
In-Reply-To: <20250317105352.412-1-m.masimov@mt-integration.ru>
References: <20250317105352.412-1-m.masimov@mt-integration.ru>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Mar 2025 13:53:52 +0300 Murad Masimov wrote:
> Binding AX25 socket by using the autobind feature leads to memory leaks
> in ax25_connect() and also refcount leaks in ax25_release(). Memory
> leak was detected with kmemleak:

Looks like DaveM applied this yesterday, thanks!
-- 
pw-bot: accept

