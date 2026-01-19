Return-Path: <linux-hams+bounces-756-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D30D3B818
	for <lists+linux-hams@lfdr.de>; Mon, 19 Jan 2026 21:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D01683010E77
	for <lists+linux-hams@lfdr.de>; Mon, 19 Jan 2026 20:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DFD271450;
	Mon, 19 Jan 2026 20:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="OwrTr9IL"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349D421FF26;
	Mon, 19 Jan 2026 20:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768853981; cv=none; b=DDKTIhCvRG0zZ3+11+s+u7eUJmvGibcN+MdTGi3WIi/dBdXNyqhRWcxGnUWny/wSJvwcYgBLkXm2D18TPqP6BpPROLICQiHvneI66BXJux8PrlRgi4BC5WFgArOsx9DwV8q+wS9C/+tFIgtTjILExiKyQGSTh6q3U3ToIFd41uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768853981; c=relaxed/simple;
	bh=vj0blF461drr08OljWi95diPtHuRTqOdv+V4xWLa7MI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=RBaTUe2ESt1OTgqOYsKvQhOhNk0LD/iB+x9qI0p7oKfoxH4GKlQwBUolQxJnzyPEW0bD/yg7TQyn8I7Ynmr6wxZbKNXWcxcy6/vyhA31fweCET1oaQhrOdMnp7osMrX5sfgXZoo2dx2hiKG4mvgdzZuQ0loKgOrpAw3lVbgPKus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=OwrTr9IL; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: f6bvp@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id D090C19F57B;
	Mon, 19 Jan 2026 21:19:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1768853977;
	bh=vj0blF461drr08OljWi95diPtHuRTqOdv+V4xWLa7MI=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:From;
	b=OwrTr9ILrW/h9S5CXZzlGivWLpcUxHpIDcNFrs8NvWYrtGIsNcBe9aTQjlTW9/w0T
	 uk17PhUtZHS+PxVEF7GZv11F7TmTSwvcOyeRYwR92VElytawbCsP1RpY7bKqp1724R
	 Z+hpb1LFptaWCNGvzHg7BTVwS6IuQ5AHFDDYmZ3duHhDC52kQCrUTnC5JEjMyDn2AD
	 NVue+hYnZrXohIrPImNLJOn7ZkgdVM+VBGMDm0uCFMMqzle4vwssRGIYUrXT/BOTZi
	 WGMToJv1B0AvNbGwVpkxLfj4WqsOP7FTyBRj6eGVBDLqPpB1EJpdIz7f2p4GOj/WnT
	 m32153K4dptLQ==
Message-ID: <5a88b747-bb06-4ebd-99de-80ceb574cf22@free.fr>
Date: Mon, 19 Jan 2026 21:19:21 +0100
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kartikey406@gmail.com
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org,
 kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org,
 mingo@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 syzbot+62360d745376b40120b5@syzkaller.appspotmail.com,
 takamitz@amazon.co.jp, tglx@kernel.org
References: <20260117063930.1256413-1-kartikey406@gmail.com>
Subject: Re: [PATCH] rose: Fix use-after-free in rose_timer_expiry
Content-Language: en-US
From: F6BVP <f6bvp@free.fr>
In-Reply-To: <20260117063930.1256413-1-kartikey406@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Patch applied to rose_timer.c

Result is interesting even if

rose module cannot still be removed with rmmod command.

For a very long time rmmod would freeze the console and the task could 
not be killed.

With the patch applied rmmod command is not blocked anymore.

However rose module is not removed probably because of a wrong refcount ?

lsmod | grep rose
rose                  184320  -1
ax25                  217088  1 rose

Bernard, f6bvp


