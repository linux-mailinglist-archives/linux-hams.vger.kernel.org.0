Return-Path: <linux-hams+bounces-479-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87163A31A9F
	for <lists+linux-hams@lfdr.de>; Wed, 12 Feb 2025 01:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8039B18881E7
	for <lists+linux-hams@lfdr.de>; Wed, 12 Feb 2025 00:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD3326AE4;
	Wed, 12 Feb 2025 00:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="horZP85L"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2091DA21;
	Wed, 12 Feb 2025 00:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739320811; cv=none; b=dxA+NmxsClT1bfiloOkvoQUpQVtxbk0/G1Ii4vs23nY6xZ5eH6fsMb0facD3CCLKvtrjgDQXqwPDdwlaM04yDIbZJNPTSHyyxkFpjRKmJEnTOmtEAwd/BXHxVuY1FuttU3LI5tV2SCQ/weT5vjoZelZJdcxhiTkrpGUZhtGmc84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739320811; c=relaxed/simple;
	bh=o6jacl+8YFQgDkweUrSEzGvajj1U6xTIXTLU27ON87Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=o/s1kfzW/6APV0YKl0Qe09ntEwiGnJnvT0oT+RFN1zLzCK8N74DSeWggh6jzd4yb4xThQrjvkykdlMgF5BLRM0OAccAOmE7X1lBTuxYX9klz1T6VR1xh+sV4nyMiNMRefuJHjzoMDXSFv3Zr+WRM6lsvUI3v5ouYse1WBR3klFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=horZP85L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E439C4CEE2;
	Wed, 12 Feb 2025 00:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739320810;
	bh=o6jacl+8YFQgDkweUrSEzGvajj1U6xTIXTLU27ON87Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=horZP85LlDZ86QCZvtw15CDgr1Mo8OW5HZQj5/HiaQVmg7YZ67A4QfVf8N8Cq+dLq
	 8lXcGDK/rJG15Bh+HNw4ajUaUcUQq1g054DSKqAk2K+VTPbsHI7RYYMoQ5d91WlVh6
	 UIYyU150aJfGduKkNmkUsfItaidd9JwO0EWrVUmQGv+XmQPTZShTS+DZcaLL4INVrv
	 eZ2DTondLlJS1nBFz3UUeJpoTdkjt8DIUy6PxJHAWvMiPmrYUJ6JZ/wjUq1Vt+Mdy2
	 J8QPCNfhSstwU+4kVTjdOZV335c5rKRylDlEuEpGdWriFbr+9QU+IqgZmwmL6UMRky
	 lP/AH5scUBhMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE57380AA7A;
	Wed, 12 Feb 2025 00:40:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] hamradio: baycom: replace strcpy() with strscpy()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173932083925.51333.16699116613029373811.git-patchwork-notify@kernel.org>
Date: Wed, 12 Feb 2025 00:40:39 +0000
References: <3qo3fbrak7undfgocsi2s74v4uyjbylpdqhie4dohfoh4welfn@joq7up65ug6v>
In-Reply-To: <3qo3fbrak7undfgocsi2s74v4uyjbylpdqhie4dohfoh4welfn@joq7up65ug6v>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: dan.carpenter@linaro.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-hams@vger.kernel.org, pabeni@redhat.com,
 linux-hardening@vger.kernel.org, kernel-hardening@lists.openwall.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 8 Feb 2025 23:06:21 -0500 you wrote:
> The strcpy() function has been deprecated and replaced with strscpy().
> There is an effort to make this change treewide:
> https://github.com/KSPP/linux/issues/88.
> 
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v3] hamradio: baycom: replace strcpy() with strscpy()
    https://git.kernel.org/netdev/net-next/c/3b147be9ef08

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



