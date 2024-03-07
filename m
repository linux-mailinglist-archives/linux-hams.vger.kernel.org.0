Return-Path: <linux-hams+bounces-52-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E7E874BCB
	for <lists+linux-hams@lfdr.de>; Thu,  7 Mar 2024 11:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5411B222EB
	for <lists+linux-hams@lfdr.de>; Thu,  7 Mar 2024 10:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA7E12BF28;
	Thu,  7 Mar 2024 10:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tkm8wX4u"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ACB127B74;
	Thu,  7 Mar 2024 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709805632; cv=none; b=ZlIqHyAUZjcvYLGvlUk32TvEJm7iQAuxOxgfBM+O0aJ752x1l3sf8A/4V0zog9CE89qnZ+RXj9pm1tgMjsttHqpadvvXzIdOtsxeeL8JkCopmloJsbkFZkbMoaRmxsv4DErUaTqYP9758lRbkLDSyS26X11Pvzb+rI3VtAUyU3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709805632; c=relaxed/simple;
	bh=6CpFwo6gc627KHUzzl6xCi4freC95xx3mayG126Bzqs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cnHifVdhcF3mtSsFyLlxDdT0e5QnPfcmobeALhrBTQ1JdseBfBD7Ugel6isEDMiRUwb88bjzzbkuOwsFmcQZvorf1vW+uQsJuzeap9lzxkbB0boCSudEAexmuLAHe1gKS0Ra2XcRy8xGC9parMyNhubhg3KZRJyuQTTkYNftGd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tkm8wX4u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97BDFC433C7;
	Thu,  7 Mar 2024 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709805631;
	bh=6CpFwo6gc627KHUzzl6xCi4freC95xx3mayG126Bzqs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Tkm8wX4uar4sy414mMvBmp5fLvqwBCDU5Ie8c5Ter+ElaLUCYAU1Htyq9E8LcWHo9
	 3TpSdNiletZyqZHT/dsd/GkLZEpmowkg5ADoaWxAuZB2KLba83gQaErZqT3S4gSE4O
	 mLLxgTmujVjOOtZSzHkQwAaCGRG2Z6ZL5Irn4gbUKj+C1hMwcYXE9l5XiA4QzSoZxG
	 ur2eXDUGXoyijSf/17lNNkGr9GqQ4Nlv8d/qKrGwY8O9imhkAbRMzIJuldkGO7jIUl
	 51xQGuVTaQgYZ7O70SN3hM/uIzS21kqE+Nc+95BdpXw08H/De3Ekg4+MqCJi5JUO8+
	 lft37j92NChig==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6D4A2D84BD7;
	Thu,  7 Mar 2024 10:00:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 00/12] netrom: Fix all the data-races around sysctls
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170980563143.27682.16929475387592674131.git-patchwork-notify@kernel.org>
Date: Thu, 07 Mar 2024 10:00:31 +0000
References: <20240304082046.64977-1-kerneljasonxing@gmail.com>
In-Reply-To: <20240304082046.64977-1-kerneljasonxing@gmail.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-hams@vger.kernel.org,
 netdev@vger.kernel.org, kernelxing@tencent.com

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon,  4 Mar 2024 16:20:34 +0800 you wrote:
> From: Jason Xing <kernelxing@tencent.com>
> 
> As the title said, in this patchset I fix the data-race issues because
> the writer and the reader can manipulate the same value concurrently.
> 
> Jason Xing (12):
>   netrom: Fix a data-race around sysctl_netrom_default_path_quality
>   netrom: Fix a data-race around
>     sysctl_netrom_obsolescence_count_initialiser
>   netrom: Fix data-races around sysctl_netrom_network_ttl_initialiser
>   netrom: Fix a data-race around sysctl_netrom_transport_timeout
>   netrom: Fix a data-race around sysctl_netrom_transport_maximum_tries
>   netrom: Fix a data-race around
>     sysctl_netrom_transport_acknowledge_delay
>   netrom: Fix a data-race around sysctl_netrom_transport_busy_delay
>   netrom: Fix a data-race around
>     sysctl_netrom_transport_requested_window_size
>   netrom: Fix a data-race around
>     sysctl_netrom_transport_no_activity_timeout
>   netrom: Fix a data-race around sysctl_netrom_routing_control
>   netrom: Fix a data-race around sysctl_netrom_link_fails_count
>   netrom: Fix data-races around sysctl_net_busy_read
> 
> [...]

Here is the summary with links:
  - [net,01/12] netrom: Fix a data-race around sysctl_netrom_default_path_quality
    https://git.kernel.org/netdev/net/c/958d6145a6d9
  - [net,02/12] netrom: Fix a data-race around sysctl_netrom_obsolescence_count_initialiser
    https://git.kernel.org/netdev/net/c/cfd9f4a740f7
  - [net,03/12] netrom: Fix data-races around sysctl_netrom_network_ttl_initialiser
    https://git.kernel.org/netdev/net/c/119cae5ea3f9
  - [net,04/12] netrom: Fix a data-race around sysctl_netrom_transport_timeout
    https://git.kernel.org/netdev/net/c/60a7a152abd4
  - [net,05/12] netrom: Fix a data-race around sysctl_netrom_transport_maximum_tries
    https://git.kernel.org/netdev/net/c/e799299aafed
  - [net,06/12] netrom: Fix a data-race around sysctl_netrom_transport_acknowledge_delay
    https://git.kernel.org/netdev/net/c/806f462ba902
  - [net,07/12] netrom: Fix a data-race around sysctl_netrom_transport_busy_delay
    https://git.kernel.org/netdev/net/c/43547d869943
  - [net,08/12] netrom: Fix a data-race around sysctl_netrom_transport_requested_window_size
    https://git.kernel.org/netdev/net/c/a2e706841488
  - [net,09/12] netrom: Fix a data-race around sysctl_netrom_transport_no_activity_timeout
    https://git.kernel.org/netdev/net/c/f99b494b4043
  - [net,10/12] netrom: Fix a data-race around sysctl_netrom_routing_control
    https://git.kernel.org/netdev/net/c/b5dffcb8f71b
  - [net,11/12] netrom: Fix a data-race around sysctl_netrom_link_fails_count
    https://git.kernel.org/netdev/net/c/bc76645ebdd0
  - [net,12/12] netrom: Fix data-races around sysctl_net_busy_read
    https://git.kernel.org/netdev/net/c/d380ce70058a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



