Return-Path: <linux-hams+bounces-673-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1548BF562E
	for <lists+linux-hams@lfdr.de>; Tue, 21 Oct 2025 11:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 903EA18C3904
	for <lists+linux-hams@lfdr.de>; Tue, 21 Oct 2025 09:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD14732AAA8;
	Tue, 21 Oct 2025 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e14q1YG9"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6976D28DF07;
	Tue, 21 Oct 2025 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761037228; cv=none; b=EjkJoKj+7hSv4ABuPKWvhtadry9fprrewqHT3Wmv0YyAOno449yPp5ge7EafOtEUzMyr9jztFAWLgKTzjnr5N00+al9riUDTbU47ETNcVFzDFLAgf4Afz38rYW2iryMIMKGALYayyfnkNeB4D/noFXRBeJM2tvuzMIOwqlPlnLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761037228; c=relaxed/simple;
	bh=aZ6H4PDNbH9+t94rurDNQOsP0qI49eh3ijZct1sk8MU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uATgFoTy5nGgcHKU70b2BZlRJCMfAm7dx5bmiUQvjsEOureek7C9pF0G20EjsbzUSerxQ+qrC8gnTGnBdyrZkuGbMU0tR5wxCOvrwGFlbwsUI37kblL+4u/JECSsNfGAtSaEC8x8dCwv7IXr1Ki9ld/grCkV+td7f/aKk+hoo3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e14q1YG9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57D4C4CEF1;
	Tue, 21 Oct 2025 09:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761037227;
	bh=aZ6H4PDNbH9+t94rurDNQOsP0qI49eh3ijZct1sk8MU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=e14q1YG9L+xXijoIJ9Zn1Q4kJX0P1u50/UhuC6GHOF/HKvyBXDybc/e7qJPJyVvA7
	 McllI/M6rfDJ4xCZMDcnOKe4TKTx9IS1AcDFERqms9WuGzjjFa3r6lk6AAPPf0EkiS
	 CsK7hVRDliUaYa/yunY/Cz+DQXqVlx0V8yLTSbSfjorVhBvscH3KkgK5rUVcD09GOU
	 ecyJSEtyLdhIDbU/EcEHPf6MGVFhdoqyIhkQ/hYhdqd4/ruOeSnTwCdGB9wvEzvbSp
	 hILCo6FJ5L+fXAcbREH95y5QtAJSBxWdZpIfp53hZlHYl7g6GHgi7FnnUNjAZLUqY5
	 v7fuLbMaH0IOQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFB23A54A01;
	Tue, 21 Oct 2025 09:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] networking docs section headings cleanup
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176103720951.983008.17974631563235694861.git-patchwork-notify@kernel.org>
Date: Tue, 21 Oct 2025 09:00:09 +0000
References: <20251017064525.28836-2-bagasdotme@gmail.com>
In-Reply-To: <20251017064525.28836-2-bagasdotme@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-hams@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 corbet@lwn.net, krzk@kernel.org, ajk@comnets.uni-bremen.de

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 17 Oct 2025 13:45:24 +0700 you wrote:
> Hi,
> 
> Just two net docs patches cleaning up section headings. The shortlog below
> should be self-explanatory.
> 
> Enjoy!
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: nfc: Format userspace interface subsection headings
    https://git.kernel.org/netdev/net-next/c/122d696c1789
  - [net-next,2/2] net: 6pack: Demote "How to turn on 6pack support" section heading
    https://git.kernel.org/netdev/net-next/c/97aa8ecb5732

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



