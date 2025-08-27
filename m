Return-Path: <linux-hams+bounces-596-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE87AB3856E
	for <lists+linux-hams@lfdr.de>; Wed, 27 Aug 2025 16:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D3B31885ED7
	for <lists+linux-hams@lfdr.de>; Wed, 27 Aug 2025 14:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECAA1C5F1B;
	Wed, 27 Aug 2025 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDGAIxao"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE394207DF3;
	Wed, 27 Aug 2025 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756306203; cv=none; b=lN+3No+qGkvQu4Hmj8Xo204jn45sIZ4CDC+dYXs2A8OUbAKyoLHsI92AE9w8hkdsTq8Ens45HaZGmPvmBZfmg1NwfwSCE2pOL9y/FFXSo9gTkvJYMVwt4X3bDC68qz6y5az0vQu6kYEcOCdGwdFr1uEXanqaNq03f9kJp7UolGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756306203; c=relaxed/simple;
	bh=zTE/enmrm1QNB+7hQxJH6uD7gf9rwRAERAzg/sPIi5s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ApA+mc88iebuVNKTDwor4QLYVEf/GMGEkpduQA+52d5Yos0VsnPai+LhlBQKdfTHoH0y65DJYLvs+8av+DKsE/vtZoCZFkrb/STOUeyKK2dHWwiVdVo8Xlj90ZfJGjO2HKvcCJDSY3YkKsappvYdMzHNuGopp7Q15XDibAz7Mjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDGAIxao; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C85C4CEF5;
	Wed, 27 Aug 2025 14:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756306202;
	bh=zTE/enmrm1QNB+7hQxJH6uD7gf9rwRAERAzg/sPIi5s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BDGAIxaoPEQW3yBifYjve5PL57ydxz64jhsM1ZbBqbfXn6TSuadzEL4NRxH7RMgL9
	 gErjYnzXSJTKxiej5gHKKkSYq4ZnktPmVSVq+jnuO/T+YtBITxZXDtFtBxX/D9x9Rp
	 GHJP3V0Wzr5Iz9MmTIDXLDeMYQCt3umo4VCvQWm988crNJlFibVtcqpfHdjx4EMj+e
	 KBXCZcqDZBbN+qpZBA2gxTK12qM/KJ6O5JFsm/Do3HtDTfTDCsKJr9DuTtf3/DYRZE
	 JGSlo0Nf2mo0Hkkl1Tanga7vkveQjCcCbrrftx5GmoSOW+LCXQbkf6Ht1vtejwpoXy
	 IYbh3yL/VlrGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB02E383BF76;
	Wed, 27 Aug 2025 14:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net 0/3] Introduce refcount_t for reference counting of
 rose_neigh
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175630620975.735595.12172150017758308565.git-patchwork-notify@kernel.org>
Date: Wed, 27 Aug 2025 14:50:09 +0000
References: <20250823085857.47674-1-takamitz@amazon.co.jp>
In-Reply-To: <20250823085857.47674-1-takamitz@amazon.co.jp>
To: Takamitsu Iwai <takamitz@amazon.co.jp>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 enjuk@amazon.com, mingo@kernel.org, tglx@linutronix.de, hawk@kernel.org,
 n.zhandarovich@fintech.ru, kuniyu@google.com

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 23 Aug 2025 17:58:54 +0900 you wrote:
> The current implementation of rose_neigh uses 'use' and 'count' field of
> type unsigned short as a reference count. This approach lacks atomicity,
> leading to potential race conditions. As a result, syzbot has reported
> slab-use-after-free errors due to unintended removals.
> 
> This series introduces refcount_t for reference counting to ensure
> atomicity and prevent race conditions. The patches are structured as
> follows:
> 
> [...]

Here is the summary with links:
  - [v2,net,1/3] net: rose: split remove and free operations in rose_remove_neigh()
    https://git.kernel.org/netdev/net/c/dcb34659028f
  - [v2,net,2/3] net: rose: convert 'use' field to refcount_t
    https://git.kernel.org/netdev/net/c/d860d1faa6b2
  - [v2,net,3/3] net: rose: include node references in rose_neigh refcount
    https://git.kernel.org/netdev/net/c/da9c9c877597

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



