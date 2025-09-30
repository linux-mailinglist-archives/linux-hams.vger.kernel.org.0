Return-Path: <linux-hams+bounces-646-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE8CBAC0E5
	for <lists+linux-hams@lfdr.de>; Tue, 30 Sep 2025 10:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84C1A1C2971
	for <lists+linux-hams@lfdr.de>; Tue, 30 Sep 2025 08:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D6026C384;
	Tue, 30 Sep 2025 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nw9wQUEq"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1953D2505AF;
	Tue, 30 Sep 2025 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759221017; cv=none; b=F6tJWA8OZ/bFNh9gLtrnx2veqW/KN3dRK2kG8pmzZ9yafYg6TjiM7CDCj2lH+bBEnjtKK8dsK0yd9BsXi0KYBjVqSE/V5AIE6iWue+iF3ghT5Qk0/nq/Xbk+vVlMuz4ftNGKucl4k+B/mBbfBzGHaUfV0x2d3cCekX64atwgEmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759221017; c=relaxed/simple;
	bh=8LVBFueTsAhY1YiXtgw2e04yoV5b8+BvIpy2KpTkOQg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NmxLtzsMr5axDDZ8q01ui5OlKr98FQ+MWgY7NjcH+MH7Z8yKcR4Lt50hPxAiaiUD+bFL/nRq/+WbY6efOQtDN13R3HNYEFka/+Pn7FnC7d7W4yyW3yn/i8rw5yJ2SUTiF7Xnnikpv6nHenCas5eGEwGmU3a9o3DzfGhwxbpnqMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nw9wQUEq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75ADC4CEF0;
	Tue, 30 Sep 2025 08:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759221016;
	bh=8LVBFueTsAhY1YiXtgw2e04yoV5b8+BvIpy2KpTkOQg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nw9wQUEqA1spX9cU/jSS5nIgUHN2JqHNbyaeZVnT/tL037+pd5l5gxVyDV1og94bF
	 xmbM0y//H08XvcF6Ij2jkTSSkBn/xP6C7G7RF2vVw506HnvKIsGHfWfw+I721T0gWz
	 Ur7qnxcmtZyLdUfg6CmOWc34hzPpwJfR/2Wv69mMAP12e25Gm5c9iP/EHL/Y38hyal
	 Wv08M/FUZHZ5aJ9f12GWLF7UkIpnVyo7KjRjor6N6gn8YLyBWIpDpCtRiE20cKzaZL
	 3tp06bwkODWlmiRpXBKH9edCPm6dQoS+0iIogRwvcyUA0tVbIqLtqsgmztXtnB/qWv
	 J59xF1q9YFx3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BCC39D0C1A;
	Tue, 30 Sep 2025 08:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] 6pack: drop redundant locking and refcounting
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175922100999.1892773.7313320613788612084.git-patchwork-notify@kernel.org>
Date: Tue, 30 Sep 2025 08:30:09 +0000
References: <20250925051059.26876-1-dqfext@gmail.com>
In-Reply-To: <20250925051059.26876-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: ajk@comnets.uni-bremen.de, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-hams@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dan.carpenter@linaro.org,
 syzbot+5fd749c74105b0e1b302@syzkaller.appspotmail.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 25 Sep 2025 13:10:59 +0800 you wrote:
> The TTY layer already serializes line discipline operations with
> tty->ldisc_sem, so the extra disc_data_lock and refcnt in 6pack
> are unnecessary.
> 
> Removing them simplifies the code and also resolves a lockdep warning
> reported by syzbot. The warning did not indicate a real deadlock, since
> the write-side lock was only taken in process context with hardirqs
> disabled.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] 6pack: drop redundant locking and refcounting
    https://git.kernel.org/netdev/net-next/c/38b04ed7072e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



