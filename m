Return-Path: <linux-hams+bounces-17-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A1E80EC83
	for <lists+linux-hams@lfdr.de>; Tue, 12 Dec 2023 13:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 583A41C20A0A
	for <lists+linux-hams@lfdr.de>; Tue, 12 Dec 2023 12:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BAA60EC5;
	Tue, 12 Dec 2023 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvIKTGlN"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB596A936;
	Tue, 12 Dec 2023 12:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BECEC433C9;
	Tue, 12 Dec 2023 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702385424;
	bh=4I/JJVdtNbprk3ZYhxaZF97ugC1eO8Heq/k9SobQVZI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PvIKTGlN3Kqb1F4Uy5vkbsYu34Uokqh3e5wDAl6sPqZZztnDaM+E+Q239UolQc1Ab
	 pdqE2FgoStI7bMH5nVy0RcF9zxQiqm5GyBu2Xg99UE8TJqV8x9yAZA1b1k34cBd1qT
	 c65a9KSm8BqknPVutNXttgLQ7tMweuKpIFMydMmv2lgxj/I+T9WqpVsYDSualS8LQ9
	 7O0wxHI9HrmMtZezsE0igQEQDTNXgf6KIcdiU4RGx2BHetW48dp/FOZKGamTszerMd
	 rn1W8pE4kKdbNQ7VOFehKw7dED9rx99dHxOfkrJfpLhl8h9buUnT3go8A8ezit3LEj
	 sEzXUV9s0A6Eg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 20555DFC906;
	Tue, 12 Dec 2023 12:50:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] net/rose: Fix Use-After-Free in rose_ioctl
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170238542412.23173.8458445650930950286.git-patchwork-notify@kernel.org>
Date: Tue, 12 Dec 2023 12:50:24 +0000
References: <20231209100538.GA407321@v4bel-B760M-AORUS-ELITE-AX>
In-Reply-To: <20231209100538.GA407321@v4bel-B760M-AORUS-ELITE-AX>
To: Hyunwoo Kim <v4bel@theori.io>
Cc: ralf@linux-mips.org, edumazet@google.com, imv4bel@gmail.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 linux-hams@vger.kernel.org, netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sat, 9 Dec 2023 05:05:38 -0500 you wrote:
> Because rose_ioctl() accesses sk->sk_receive_queue
> without holding a sk->sk_receive_queue.lock, it can
> cause a race with rose_accept().
> A use-after-free for skb occurs with the following flow.
> ```
> rose_ioctl() -> skb_peek()
> rose_accept() -> skb_dequeue() -> kfree_skb()
> ```
> Add sk->sk_receive_queue.lock to rose_ioctl() to fix this issue.
> 
> [...]

Here is the summary with links:
  - [v4] net/rose: Fix Use-After-Free in rose_ioctl
    https://git.kernel.org/netdev/net/c/810c38a369a0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



