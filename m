Return-Path: <linux-hams+bounces-356-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF2C8D72A1
	for <lists+linux-hams@lfdr.de>; Sun,  2 Jun 2024 01:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A11101C20AC6
	for <lists+linux-hams@lfdr.de>; Sat,  1 Jun 2024 23:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1777639FF3;
	Sat,  1 Jun 2024 23:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twP4ZEw3"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CF621364;
	Sat,  1 Jun 2024 23:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717282830; cv=none; b=rJ+c69EXeAx3bAY5m8q715r2wMFpty0NGUZk41fP9Zu7fyla3tm085S0Of5caDkOMLmB/02UQfMaVXjLCzW/3/LnC9vJMJurhZXaSSxYIjuJfjFWUgRekkQloem7VSLICTj3RKyF08SQ04DoXeAnXhWfjR0tLJgSV+zJQHJiZbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717282830; c=relaxed/simple;
	bh=vpMWcqdZgpvmvcEejXV8FOCWLu3N8B3M22Aygr6cuDI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=i8nrURuthBzBRPgbzJgHdFjNjVitxq7od2YV2FW2mr4OLZgjxKMzld3jJcDeRWqovR6uvMfF3yT6w29VoU6DorgNWe06UaZExcUhmhQzmKDI/6gW7zTbN0rxRzXkcKQUp3AsHBotzZcMfiSVOqmExWElnnQr/6JThZi14VWVj48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=twP4ZEw3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B905C32786;
	Sat,  1 Jun 2024 23:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717282830;
	bh=vpMWcqdZgpvmvcEejXV8FOCWLu3N8B3M22Aygr6cuDI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=twP4ZEw36pQMraRf9g7DgWgwbyzN+fhdv7bANiEojgZ6TkyT/p3mHJ9hRDNTunNq5
	 8OB+RLzgnA8nhPDuFJSoGgoflgAV0MU5LuHGQMv38EHnOxZxtJ4fwD0ABVs+JdwD5D
	 Qo7zxhCVkKC9eQEQLSEnqear+vHdhs+GzORGSNEvKUpIRRGEa6yakXX5upi8aWsz+e
	 UMUlUpoqiqINcccoIYUt2eG23BtHMRU8di0kVIhzaPzCLccemytiL7AidwY6WRuyJx
	 jAIJJh8nImgZUXdjfirwMylrqgAAh54BhtuSE5+RDzacvI4M+FUJmoopFJal7Y8h0j
	 Vol5JBJ++vmJw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4C395DEA711;
	Sat,  1 Jun 2024 23:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] ax25: Replace kfree() in ax25_dev_free() with
 ax25_dev_put()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171728283030.4092.4494686257575065784.git-patchwork-notify@kernel.org>
Date: Sat, 01 Jun 2024 23:00:30 +0000
References: <20240530051733.11416-1-duoming@zju.edu.cn>
In-Reply-To: <20240530051733.11416-1-duoming@zju.edu.cn>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hams@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, jreuter@yaina.de, davem@davemloft.net,
 dan.carpenter@linaro.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 30 May 2024 13:17:33 +0800 you wrote:
> The object "ax25_dev" is managed by reference counting. Thus it should
> not be directly released by kfree(), replace with ax25_dev_put().
> 
> Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> 
> [...]

Here is the summary with links:
  - [net] ax25: Replace kfree() in ax25_dev_free() with ax25_dev_put()
    https://git.kernel.org/netdev/net/c/166fcf86cd34

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



