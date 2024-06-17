Return-Path: <linux-hams+bounces-369-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E754790ADAD
	for <lists+linux-hams@lfdr.de>; Mon, 17 Jun 2024 14:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66856286671
	for <lists+linux-hams@lfdr.de>; Mon, 17 Jun 2024 12:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9236194C80;
	Mon, 17 Jun 2024 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSgF56k5"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880B9194C67;
	Mon, 17 Jun 2024 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718626228; cv=none; b=Ujzz8Aw+aDn789RMjPlgcotMR3K+iAXUgnNtp6mLDeqs2EWEW1Q7Z+JzUKGWP71Q/wMTXZHK+eUlc6drZzn4I7sIkU5tVVuW0tmFHsQWlIYg3RKMOLe1t1vCYFCwT1IF2fuqXM42Qq96ECEPKFJfBjVwPxOzNpRWgjOC4eG7MTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718626228; c=relaxed/simple;
	bh=DyawOSkp08/NBbf1PChYtj9JupVvK/uwKZI7ZwqqxMM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=EWYASR5AqW6BC9vwpmCmQaChpnIIVarJgLdFFOS9E6SJmb/qX6SMMZWpzKYonnE9dBKsCA8VGFFzxGn+Txk3OgL1uEZGiPkqQVckOGH+iV9vH88nR/KfWxk39t/ArMsyGy0iYl7uUuQFvWicncVPt4UPl3aDouIk8oFj+29QRiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSgF56k5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00F2CC4AF1D;
	Mon, 17 Jun 2024 12:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718626228;
	bh=DyawOSkp08/NBbf1PChYtj9JupVvK/uwKZI7ZwqqxMM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OSgF56k5z15nExQvCDaALzwgqIHxpS/DKERmrP9lUXGT+eodhS9Z4M10aAX7Y66Jr
	 3cm46kb0/6LZqdxtkfaRndiymOni9Ym0sdGob2E+TC8dSTI3f4m3aogUj/sOqzMPbv
	 Mq462T6ZlvlOpDrvZT/y9rhxeh1y7v1Ki6MQ2MLjy70WIAQRHRknRIie7dr7nFXAVl
	 XH2PXOnZYOjQXhDXCC82pIDgQ6YPQP7r7kKQ3WcDiFjWBiA5opx4WTfzj9o2/20JtM
	 QdvF8Ooj9afvFduFCVkYQM9wBUfIPdhILRE+qDBZRec6Evtb5LarUNlX5HBZxj+oKu
	 bZj1o210bomSQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E0E47C4332E;
	Mon, 17 Jun 2024 12:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] netrom: Fix a memory leak in nr_heartbeat_expiry()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171862622791.26206.17391169744722640892.git-patchwork-notify@kernel.org>
Date: Mon, 17 Jun 2024 12:10:27 +0000
References: <20240613082300.294668-1-Ilia.Gavrilov@infotecs.ru>
In-Reply-To: <20240613082300.294668-1-Ilia.Gavrilov@infotecs.ru>
To: Gavrilov Ilia <Ilia.Gavrilov@infotecs.ru>
Cc: ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, kuniyu@amazon.com,
 linux-hams@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 syzbot+d327a1f3b12e1e206c16@syzkaller.appspotmail.com

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 13 Jun 2024 08:23:00 +0000 you wrote:
> syzbot reported a memory leak in nr_create() [0].
> 
> Commit 409db27e3a2e ("netrom: Fix use-after-free of a listening socket.")
> added sock_hold() to the nr_heartbeat_expiry() function, where
> a) a socket has a SOCK_DESTROY flag or
> b) a listening socket has a SOCK_DEAD flag.
> 
> [...]

Here is the summary with links:
  - [net] netrom: Fix a memory leak in nr_heartbeat_expiry()
    https://git.kernel.org/netdev/net/c/0b9130247f3b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



