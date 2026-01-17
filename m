Return-Path: <linux-hams+bounces-753-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD40D39026
	for <lists+linux-hams@lfdr.de>; Sat, 17 Jan 2026 18:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCE2D3019BF9
	for <lists+linux-hams@lfdr.de>; Sat, 17 Jan 2026 17:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D1023D2B2;
	Sat, 17 Jan 2026 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cr+cwZB1"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5547125A9;
	Sat, 17 Jan 2026 17:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768672067; cv=none; b=SVs9PkV2ZBZty0ykXWLiYo1iKOek5X44w3SuEzGu6RhX8tZ3lK2yP2GhWW02K9R4ADmBuJgcmlGj3grITXUUb8naLUliuqojmxR1PV+bkhK/W3O8P7U0C8jj4v/hpYNOAwhSDnjqM7TEIziuzo5OtBKKMERYH91q8mHy4J67WWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768672067; c=relaxed/simple;
	bh=CEqJ5/LD8RauSknlMfaXdmV4C7zRV+Ebu0wJHelRL4A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mYLhsDjTWL3ZDTN6MRdShan2z91MfTFdnO+UOnPNuDvKlkOF2JFTTQ8SF0hP9VbbHrgzjWCb3dShbpDy2Rk5jKZGsgHgzJkRqIPUDIzkG1GAlilBn84xuFZuSyQpOgQTZLpFf+ZFu69oDw/OUiQib17X+NrCiKXqcF0fqq4JONM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cr+cwZB1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE66CC4CEF7;
	Sat, 17 Jan 2026 17:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768672066;
	bh=CEqJ5/LD8RauSknlMfaXdmV4C7zRV+Ebu0wJHelRL4A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cr+cwZB1AI89hnd/gLiGdR3pfYN/8Z9AmBW8BeW6P+hhehDSk6uWuaRsuV6Ii7pTT
	 9A/pxCivFnD1uTqIjnKWK5UFY5Y5dzMOkfYFAcue7I3xoJxjYI047kv1Kfl4y/3VHQ
	 SJaw4K62omvBVGlC5t2Ih6N6qjHUti2R0ytVrlkUlldVA0URx9eWEWCh6U67DISP1G
	 99DUYdtRwHtPf81ddZ5DAZICR4vBwLNlFdbGI8KkZ84kWFuBYGte+s7jwwrfTgIXYs
	 foLFBsLfqPj9AdxyFXvutMN1q+4gBZFfzIhJQtBVgrtt2oidlrAQ2IehRugx0shLxr
	 taH5+vewqTgeA==
Date: Sat, 17 Jan 2026 09:47:45 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Prithvi Tambewagh <activprithvi@gmail.com>
Cc: syzbot+df52f4216bf7b4d768e7@syzkaller.appspotmail.com,
 davem@davemloft.net, edumazet@google.com, horms@kernel.org,
 pabeni@redhat.com, linux-hams@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
Subject: Re: Testing for netrom: fix KASAN slab-use-after-free in
 nr_dec_obs()
Message-ID: <20260117094745.6fed3c45@kernel.org>
In-Reply-To: <20260117065313.32506-1-activprithvi@gmail.com>
References: <69694da9.050a0220.58bed.002a.GAE@google.com>
	<20260117065313.32506-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 17 Jan 2026 12:23:13 +0530 Prithvi Tambewagh wrote:
> #syz test upstream be548645527a131a097fdc884b7fca40c8b86231

Please do not CC the main mailing list on your testing attempts. 
Just CC syzbot

