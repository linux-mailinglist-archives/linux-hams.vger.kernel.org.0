Return-Path: <linux-hams+bounces-740-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E96CE97A9
	for <lists+linux-hams@lfdr.de>; Tue, 30 Dec 2025 11:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D79030060F2
	for <lists+linux-hams@lfdr.de>; Tue, 30 Dec 2025 10:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E802E8B83;
	Tue, 30 Dec 2025 10:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7B8a8UE"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5073113957E;
	Tue, 30 Dec 2025 10:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767092005; cv=none; b=IA+lNM/gtYa4RfEjwgqGXcYm1+Gx84oemwq5tvmVLu2Yx4VuOyxXf6KG2ToHYtH+PT1uWMAJ4POVfPOqe8mBS+mTH5cg6sEOQ4A58FKY3nhP5rr3zRa2JInXj/WMMObjae8S9yX+m2iM30D2dUaBlj7+kW3t4kuTwKUCLEoqh7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767092005; c=relaxed/simple;
	bh=Ig9APFORRFBPjl4XuTltFt3Q+4tuQivR5b+hF/3Y5Dk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bqKeqUmO2mBdsVgZXylXt5ytyoN7r3rLQ71bA3rxA2bpfSwWuSWDl8UeGI9Exx+eZ4RFFiORTLC6dtlGOU2nYDumbQY610zkC8rdjiA4hur6i1Mq7tzKfKxIuV6Ko86i63WMBTW6fq19rSsxO+uhNlnx774fpP5WK6/G2fEUpLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7B8a8UE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53BCC16AAE;
	Tue, 30 Dec 2025 10:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767092005;
	bh=Ig9APFORRFBPjl4XuTltFt3Q+4tuQivR5b+hF/3Y5Dk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E7B8a8UE2BekdLMA8xeXlkqT9UjEXgkFTGK3oYI95yiJdmPUOSzdGANwUa5zwoQSz
	 rY7qt22axF8hnyOy9UscHfIEiAktSTq3/bbYs0gkRJrKPbFxqvV0TtlkjBHDFN0/w5
	 fLatBrrcTp08dQDiCKJC+SKiz/iNNAKkUmIRuCXZBU5j/d1aMBC0iLn94lh0+Mx6re
	 ++SINlynDtHsu+JlaoAVahKIRrppS33wfnJO3qcQuYfM4NEcv+R3oOLkblesWQWo8W
	 SaDYLOrZgOix5GJ/O/68mb1+XvAf7w/AYoKvntv0qjWip+yHE/LjFHzkmszxx279M1
	 vJl4N0KleI+BQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BA423808205;
	Tue, 30 Dec 2025 10:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: rose: fix invalid array index in
 rose_kill_by_device()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176709180705.3210717.17273237853991917461.git-patchwork-notify@kernel.org>
Date: Tue, 30 Dec 2025 10:50:07 +0000
References: <20251222212227.4116041-1-ritviktanksalkar@gmail.com>
In-Reply-To: <20251222212227.4116041-1-ritviktanksalkar@gmail.com>
To: Ritvik Tanksalkar <ritviktanksalkar@gmail.com>
Cc: kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-hams@vger.kernel.org, stanksal@purdue.edu, falwasmi@purdue.edu

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 22 Dec 2025 21:22:27 +0000 you wrote:
> From: Pwnverse <stanksal@purdue.edu>
> 
> rose_kill_by_device() collects sockets into a local array[] and then
> iterates over them to disconnect sockets bound to a device being brought
> down.
> 
> The loop mistakenly indexes array[cnt] instead of array[i]. For cnt <
> ARRAY_SIZE(array), this reads an uninitialized entry; for cnt ==
> ARRAY_SIZE(array), it is an out-of-bounds read. Either case can lead to
> an invalid socket pointer dereference and also leaks references taken
> via sock_hold().
> 
> [...]

Here is the summary with links:
  - [net] net: rose: fix invalid array index in rose_kill_by_device()
    https://git.kernel.org/netdev/net/c/6595beb40fb0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



