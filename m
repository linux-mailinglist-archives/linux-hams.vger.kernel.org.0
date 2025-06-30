Return-Path: <linux-hams+bounces-536-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4A5AEDD8F
	for <lists+linux-hams@lfdr.de>; Mon, 30 Jun 2025 14:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E30703A83A8
	for <lists+linux-hams@lfdr.de>; Mon, 30 Jun 2025 12:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3DF28A3E0;
	Mon, 30 Jun 2025 12:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Au3cC2lT"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E29A2701D2;
	Mon, 30 Jun 2025 12:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287924; cv=none; b=O7B8yJFD/bVyLJvvYfebRhiN/yy3yobHMj0h7ksDmmoOtvZGz9UvKCIKJ8527zHVjz+9g55rQTRd1ptRNveKODRfpkQQ4olW3nNFIMhBPQ2kiRIi/dwhM1CZ6cYUzIZjtCc6PK+N2EC9bvFMNf+4LbfYEcbiNwJXfzFxrjTFD7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287924; c=relaxed/simple;
	bh=KFAC8BKzF2DZUXxOABkXUwBHPs4HuhbfQUlHbK0UpdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6PjRMsTr86dY2iiNjgw0x4wjurYetVr6LxYHJqy+Ho09NuSHvWNMoOMW0rb+ZvgBGmGAeI36j3iDInAUZuO8wGXpJ6xHmFZJ80WMEDnwr0k1Blhz2jkPMK/TDPGq70NBzi0hr44CFxPF4q6MmGnUSDYCvaNhx3MWk/NGNJf4LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Au3cC2lT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5D9C4CEE3;
	Mon, 30 Jun 2025 12:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751287923;
	bh=KFAC8BKzF2DZUXxOABkXUwBHPs4HuhbfQUlHbK0UpdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Au3cC2lTfKlYYBCrTsewr80JrUm4PIpNVMHbrR9/36yW1v4lYxKTsWf6V3kqsN0Hg
	 KfHcs/uy5eGriYOxvdrksOsqEW1/mXzhCyANBCzP3DBo0yoKPrltl9Tz5XyQ1QVvAg
	 KpWn3WXc3SDHcC9dKfG/fTbvAclXpXmet9Lv/MchaPdOriX7cMr5acCkMOn9QRIxg1
	 z9R5iyDW9pVRJurw90lBkQee6NIIk89i3qdNS4uvMROGAXsrgcoHTgD+qMwhh8WIj1
	 FcwgWHtNagdrkPWGjwqEyuURNycwk/3gthT9BIAIXQjn8MbZADzloyHtiGVzp+gWeS
	 lO/8WBPpG0fzA==
Date: Mon, 30 Jun 2025 13:51:58 +0100
From: Simon Horman <horms@kernel.org>
To: Kohei Enju <enjuk@amazon.com>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	kohei.enju@gmail.com,
	syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com
Subject: Re: [PATCH net v2] rose: fix dangling neighbour pointers in
 rose_rt_device_down()
Message-ID: <20250630125158.GG41770@horms.kernel.org>
References: <20250629030833.6680-1-enjuk@amazon.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629030833.6680-1-enjuk@amazon.com>

On Sun, Jun 29, 2025 at 12:06:31PM +0900, Kohei Enju wrote:
> There are two bugs in rose_rt_device_down() that can cause
> use-after-free:
> 
> 1. The loop bound `t->count` is modified within the loop, which can
>    cause the loop to terminate early and miss some entries.
> 
> 2. When removing an entry from the neighbour array, the subsequent entries
>    are moved up to fill the gap, but the loop index `i` is still
>    incremented, causing the next entry to be skipped.
> 
> For example, if a node has three neighbours (A, A, B) with count=3 and A
> is being removed, the second A is not checked.
> 
>     i=0: (A, A, B) -> (A, B) with count=2
>           ^ checked
>     i=1: (A, B)    -> (A, B) with count=2
>              ^ checked (B, not A!)
>     i=2: (doesn't occur because i < count is false)
> 
> This leaves the second A in the array with count=2, but the rose_neigh
> structure has been freed. Code that accesses these entries assumes that
> the first `count` entries are valid pointers, causing a use-after-free
> when it accesses the dangling pointer.
> 
> Fix both issues by iterating over the array in reverse order with a fixed
> loop bound. This ensures that all entries are examined and that the removal
> of an entry doesn't affect subsequent iterations.
> 
> Reported-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=e04e2c007ba2c80476cb
> Tested-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Kohei Enju <enjuk@amazon.com>
> ---
> Changes:
>   v2:
>     - Change commit message to describe the UAF scenario correctly
>     - Replace for loop with memmove() for array shifting
>   v1: https://lore.kernel.org/all/20250625095005.66148-2-enjuk@amazon.com/

Reviewed-by: Simon Horman <horms@kernel.org>


