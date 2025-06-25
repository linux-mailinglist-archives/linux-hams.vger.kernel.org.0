Return-Path: <linux-hams+bounces-531-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F10BBAE84F7
	for <lists+linux-hams@lfdr.de>; Wed, 25 Jun 2025 15:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC6F3188F59E
	for <lists+linux-hams@lfdr.de>; Wed, 25 Jun 2025 13:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3310825E83D;
	Wed, 25 Jun 2025 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="IIcP2SWh"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F13A17BA5;
	Wed, 25 Jun 2025 13:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.95.49.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750858771; cv=none; b=FgMNDgASrZYAXKETWQdnsjXLfKUnPNfcwp7VRmlRENTx8Kg2Kam9mpNv3lbR+JhzWuZ+TSpEbaQTBnFoMvGkHEbuGHvccTkXGU6eM7QyYcOpMuiXRMV0YnnfIgoL3ZixWZqjlY7VHaLfoZK/TlK6elxKH6EQBWBgqX4A7yABzO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750858771; c=relaxed/simple;
	bh=bZtQS81lOx/YYndKLNLqhpjZTBxSn5vYXqfFAsPq9Y8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YQwx5deGMfYTaWg7bqRnVMqfJ5QQubqZlmCmniMAP9jroeWE/J5YSuFYBb3uECgNWnSFxDghHaNcJnCdJGMu85OMR3WOGAhNrneCKHPKUG5FEPLs8YDdbun0VotG9k5VZCAPo427R/UOze2cdAl4cCeBw1dngVAmBKs8ggt3XDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=IIcP2SWh; arc=none smtp.client-ip=52.95.49.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1750858769; x=1782394769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yfeDpvYigoPKXfSIZ21puyWinZWpbdtK06BKAmLJEXE=;
  b=IIcP2SWhn61NzTuHtJk5qGwKGyKcfzlcdLm9RWA84j07pYIgTeKdxuF9
   5ju6CzPdcrWp6xMP3HC+kro6z3/VqWv7pRZt3FSpuxHVs+/LmRjosoroS
   C0lfnKr0xQSitOqtbWpIrqyULTUcv5XyHA+HvMPW9PxN+SQhjYEMKbF/I
   6n7T/eDd+PiBYkS7A11ILQNnjjhaA9GhgYSlgPu67bh+otrtHMBxBRcUl
   QsKCQcGN/Qo2GImSowjoiq4jLuqwAl/QsoXh+w2nLCwk48houPKzysgv7
   RIhg28V6stTi1bWVge6bzfztdDZgU9a1rys8CLQH6VzgTdFmmIvFJL4SO
   w==;
X-IronPort-AV: E=Sophos;i="6.16,264,1744070400"; 
   d="scan'208";a="513338550"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 13:39:26 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.7.35:31203]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.60.100:2525] with esmtp (Farcaster)
 id 84ce84e5-4e33-4376-85b8-3ca924a51f34; Wed, 25 Jun 2025 13:39:24 +0000 (UTC)
X-Farcaster-Flow-ID: 84ce84e5-4e33-4376-85b8-3ca924a51f34
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 25 Jun 2025 13:39:23 +0000
Received: from b0be8375a521.amazon.com (10.37.244.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 25 Jun 2025 13:39:20 +0000
From: Kohei Enju <enjuk@amazon.com>
To: <enjuk@amazon.com>
CC: <davem@davemloft.net>, <edumazet@google.com>, <horms@kernel.org>,
	<kohei.enju@gmail.com>, <kuba@kernel.org>, <kuniyu@google.com>,
	<linux-hams@vger.kernel.org>, <mingo@kernel.org>, <netdev@vger.kernel.org>,
	<pabeni@redhat.com>, <syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com>,
	<tglx@linutronix.de>
Subject: Re: [PATCH net v1] rose: fix dangling neighbour pointers in rose_rt_device_down()
Date: Wed, 25 Jun 2025 22:38:34 +0900
Message-ID: <20250625133911.29344-1-enjuk@amazon.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250625095005.66148-2-enjuk@amazon.com>
References: <20250625095005.66148-2-enjuk@amazon.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D038UWB003.ant.amazon.com (10.13.139.157) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

> Message-ID: <20250625095005.66148-2-enjuk@amazon.com> (raw)
> 
> There are two bugs in rose_rt_device_down() that can lead to
> use-after-free:
> 
> 1. The loop bound `t->count` is modified within the loop, which can
>    cause the loop to terminate early and miss some entries.
> 
> 2. When removing an entry from the neighbour array, the subsequent entries
>    are moved up to fill the gap, but the loop index `i` is still
>    incremented, causing the next entry to be skipped.
> 
> For example, if a node has three neighbours (A, B, A) and A is being
> removed:
> - 1st iteration (i=0): A is removed, array becomes (B, A, A), count=2
> - 2nd iteration (i=1): We now check A instead of B, skipping B entirely
> - 3rd iteration (i=2): Loop terminates early due to count=2
> 
> This leaves the second A in the array with count=2, but the rose_neigh
> structure has been freed. Accessing code assumes that the first `count`
> entries are valid pointers, causing a use-after-free when it accesses
> the dangling pointer.

(Resending because I forgot to cite the patch, please ignore the former 
reply from me. Sorry for messing up.)

The example ([Senario2] below) in the commit message was incorrect. 
Correctly, UAF will happen in the [Senario1] below.

Let me clarify those senarios.

When the entries to be removed (A) are consecutive, the second A is not 
checked, leading to UAF.
[Senario1]
    (A, A, B) with count=3
    i=0: 
         (A, A, B) -> (A, B) with count=2
          ^ checked
    i=1: 
         (A, B) -> (A, B) with count=2
             ^ checked (B, not A!)
    i=2: (doesn't occur because i < count is false)
    ===> A remains with count=2 although A was freed, so UAF will happen.


When the entries to be removed (A) are not consecutive, all A entries are 
removed luckily.
[Senario2]
    (A, B, A) with count=3
    i=0: 
         (A, B, A) -> (B, A) with count=2
          ^ checked
    i=1: 
         (B, A) -> (B) with count=1
             ^ checked (A, not B)
    i=2: (doesn't occur because i < count is false)
    ===> No A remains. No UAF in this case.

Although, even in the senario2, the fundamental issue remains 
because B is never checked.
The fix addresses issues by preventing unintended skips.

Please let me know if I'm overlooking something or my understanding is 
incorrect. 
Thanks!

> Fix both issues by iterating over the array in reverse order with a fixed
> loop bound. This ensures that all entries are examined and that the removal
> of an entry doesn't affect the iteration of subsequent entries.
> 
> Reported-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=e04e2c007ba2c80476cb
> Tested-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Kohei Enju <enjuk@amazon.com>
> ---
>  net/rose/rose_route.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
> index 2dd6bd3a3011..a488fd8c4710 100644
> --- a/net/rose/rose_route.c
> +++ b/net/rose/rose_route.c
> @@ -479,7 +479,7 @@ void rose_rt_device_down(struct net_device *dev)
>  {
>  	struct rose_neigh *s, *rose_neigh;
>  	struct rose_node  *t, *rose_node;
> -	int i;
> +	int i, j;
>  
>  	spin_lock_bh(&rose_node_list_lock);
>  	spin_lock_bh(&rose_neigh_list_lock);
> @@ -497,22 +497,14 @@ void rose_rt_device_down(struct net_device *dev)
>  			t         = rose_node;
>  			rose_node = rose_node->next;
>  
> -			for (i = 0; i < t->count; i++) {
> +			for (i = t->count - 1; i >= 0; i--) {
>  				if (t->neighbour[i] != s)
>  					continue;
>  
>  				t->count--;
>  
> -				switch (i) {
> -				case 0:
> -					t->neighbour[0] = t->neighbour[1];
> -					fallthrough;
> -				case 1:
> -					t->neighbour[1] = t->neighbour[2];
> -					break;
> -				case 2:
> -					break;
> -				}
> +				for (j = i; j < t->count; j++)
> +					t->neighbour[j] = t->neighbour[j + 1];
>  			}
>  
>  			if (t->count <= 0)
> -- 
> 2.48.1


