Return-Path: <linux-hams+bounces-741-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF2CCEF53E
	for <lists+linux-hams@lfdr.de>; Fri, 02 Jan 2026 21:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C638D301FF64
	for <lists+linux-hams@lfdr.de>; Fri,  2 Jan 2026 20:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E2922A80D;
	Fri,  2 Jan 2026 20:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a14tEpAS"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2F579CD;
	Fri,  2 Jan 2026 20:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767386808; cv=none; b=pOPzlN4HrfPM+mpFqUUCqAEystVqwJzlPEK0zGy+vDEYLtu1EqBk6zs0GVWBCJqdkTdqFMWTdmBJRQTdppX+miGKZjHdQhhncfipPmu4gX2bVQMY7Wkg8H523B25yeCbkC13sDwkpi2BjN2wR1ELAEFe+++VCmOgaLrDNmukVH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767386808; c=relaxed/simple;
	bh=bdCY5cMbhUX9SwB8MkbAUbYbFHlPUggK/Adf1cTLEWU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eX1psHk2yf2hhduIIH1H77Sv8gOjMO9Zg5OBEJxyW2A3SsAc3IDDXqph4zfVDwyzqp+7piyUBr6JVJUXcbAGrdpi4wWgYv+JVPkQr4cJ2zENEZ70Mv1lwcFX4ggCApb0YnBpdWn75kcl5WQfI7itcOC/JG/pzLLKH8zxO1o6gko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a14tEpAS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B238DC116B1;
	Fri,  2 Jan 2026 20:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767386808;
	bh=bdCY5cMbhUX9SwB8MkbAUbYbFHlPUggK/Adf1cTLEWU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a14tEpASXW25oxfwdx7qAQU5v2ZKJimFJeyFPBBfFqYyw5tJOIduaF9CY59db/LAX
	 Bm5DX1iaWfPrYu7uG5bA3xRJuViokEg3esFY+ZGmzHzobhM9kqehiF1BLdHitdsIsz
	 ENLl1+6a02eiUHe7WBRZpyQSCQiI97mJIpDz84zF5LOsC1E7s1dUIhKON0d9qi0wZH
	 svQpfxd7F8DV/oGK/BdQvviYBLaOM4rnsLDqt/un6jXAalyZer1ETKy0gapAot/CJF
	 TzbM0aRF3teO9zq0U1AXD8uoQ9LELblaf0H6AX8A5CR+YCDtAM105sNhW7a+ka5cx1
	 Prg+eJo4rjVHQ==
Date: Fri, 2 Jan 2026 12:46:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Junjie Cao <junjie.cao@intel.com>
Cc: pabeni@redhat.com, davem@davemloft.net, edumazet@google.com,
 syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com, horms@kernel.org,
 linux-hams@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 stable@vger.kernel.org
Subject: Re: [PATCH 1/2] netrom: fix possible deadlock in nr_rt_device_down
Message-ID: <20260102124646.04dd56af@kernel.org>
In-Reply-To: <20251204090905.28663-2-junjie.cao@intel.com>
References: <20251204090905.28663-1-junjie.cao@intel.com>
	<20251204090905.28663-2-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  4 Dec 2025 17:09:04 +0800 Junjie Cao wrote:
> -	struct nr_node  *t = NULL;
> +	struct nr_node *t = NULL;

AFAICT your fixes were archived before any reviewer had a chance to
take a look (perhaps due to LPC / Maintainer Summit). Could you repost,
and when you do drop the whitespace cleanups from this patch? There
should be no whitespace cleanups in fixes..

Have you written a test to exercise these code paths by any chance?
Adding one would be great.

