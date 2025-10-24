Return-Path: <linux-hams+bounces-691-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC96C085C5
	for <lists+linux-hams@lfdr.de>; Sat, 25 Oct 2025 01:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 34664354D5A
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 23:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD58E30EF7D;
	Fri, 24 Oct 2025 23:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/Q6W06W"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7349B1F1932;
	Fri, 24 Oct 2025 23:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761350320; cv=none; b=FgsCqWy6I/lMnzLEIbSuj7vZzGDLlFty9/HMAIl3sCMGQFU0UkQ/kYWhDHQCvV2+Z0F0Gqb+2P2cZ1tk9U9DZgsG5jgQsCGLHXYAibuGpMDoxGNy0F0HANDnpdoMTwU1j17nAXJn+1prhejc+yQWsQat2NjTMa0In4wJ941sTZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761350320; c=relaxed/simple;
	bh=RBJ1kFdTqUt6A9DhvYBiKt7ySabI6UHTBG76GHsRHk8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qHQCvSF2Sb7UxTbFLsRHuirmm1xNRz8bxcCbGcgUA+jLNsL1zSlRD1kiDfUxLy8f/6cB+E3SSkExZrnPDLspqee7irUUKcTWcnaxcj9UiweVTYo4tEjR00IJmrw3FQIew2ur4NUtJoXEOwDuPW40ALkOPnaTATXkpYMuGDu7k5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/Q6W06W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB22C4CEF1;
	Fri, 24 Oct 2025 23:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761350320;
	bh=RBJ1kFdTqUt6A9DhvYBiKt7ySabI6UHTBG76GHsRHk8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S/Q6W06WRSgiy+fxdMyjENVTWa+USVO0DV8plsld1hondsKuVyUsYqflehUP+V9wV
	 09QatamCxQhRwUwetzriw2OD365AcDHsCSPurnfA+U+l9/n+xRAgWt6MQbOQ0Q9aPs
	 Lzby+iA3wFQKzsGTMGVhshJnjsqTt42Cy4ADcxNKTZeEzwjq5htZU5CqpKAlw66tT4
	 n/WmmKzWQ4YCCjnJAyoCvyQWMAH+/mptC9cZZX1clM/BMrtLsD+Fjr5ibtKoj2SBRs
	 jad6/UPGn6sKXhxktAqibpJxyR1xCh2gQ6LLB8HFH7dUM+JKygKVtk9oQP4OkrlxX6
	 oebn6ClHr3m3g==
Date: Fri, 24 Oct 2025 16:58:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lizhi Xu <lizhi.xu@windriver.com>
Cc: <kuniyu@google.com>, <davem@davemloft.net>, <edumazet@google.com>,
 <horms@kernel.org>, <jreuter@yaina.de>, <linux-hams@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <pabeni@redhat.com>,
 <syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com>,
 <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH] net: rose: Prevent the use of freed digipeat
Message-ID: <20251024165838.6efa0dc3@kernel.org>
In-Reply-To: <20251024090521.1049558-1-lizhi.xu@windriver.com>
References: <20251024031801.35583-1-kuniyu@google.com>
	<20251024090521.1049558-1-lizhi.xu@windriver.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Oct 2025 17:05:21 +0800 Lizhi Xu wrote:
> There is no synchronization between the two timers, rose_t0timer_expiry
> and rose_timer_expiry.
> rose_timer_expiry() puts the neighbor when the rose state is ROSE_STATE_2.
> However, rose_t0timer_expiry() does initiate a restart request on the
> neighbor.

Read what reviewers tell you please.

Kuniyuki already told you not to send patches in reply to existing
threads.

