Return-Path: <linux-hams+bounces-534-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 009BAAEC69E
	for <lists+linux-hams@lfdr.de>; Sat, 28 Jun 2025 13:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35EDC3B72B3
	for <lists+linux-hams@lfdr.de>; Sat, 28 Jun 2025 11:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354E924167C;
	Sat, 28 Jun 2025 11:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="b7oJlY3D"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp-fw-52002.amazon.com (smtp-fw-52002.amazon.com [52.119.213.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9B645C14;
	Sat, 28 Jun 2025 11:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751108535; cv=none; b=gf4mpUFUahsNmbvZe8zn5Y2vw+qCvwG17KR2Mapw27r7TvqsW9RCSO36BbJWgTNn3mPzLWBUTF4OSph50JPWWhn8VPp7bCWk+Tcw8n0YUGTgjAJfG3MNZ4kj7NONsKpX6sXijTMR7l9rNXkd0+cbzxE1EJxdyRxhLpVl1bF8cZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751108535; c=relaxed/simple;
	bh=giYwo7Zl9h2/Rvsm1rILaMuBuZLsHEooRjG7QlGE/EA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nGMJckZRsK/PolCOEwpTTfpZYb/ghbdXKyooX+URtZB2asVVOn5hUHqWzWOq3FxX6ifH+0zmuygrY1HPxOjSyXvY5X39r0yv323kmzR4YTMHBWqfkjFmOqzZjxQGWzenM/b6p4CbOALgHQuRNdHeg1+G9J6Pd552FRMo+Ta4w/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=b7oJlY3D; arc=none smtp.client-ip=52.119.213.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1751108533; x=1782644533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tWYEurIYp7b1oRCiuF2sVNWNHm2Aq/42YT0uF1C+gN0=;
  b=b7oJlY3DnScfNESaxPvJBG8Vii6PTQnGiUO4OTHRZOaB+yyy7C3mamG0
   Y1PB8vS6K2Ua8njupRt3vEP2PTfLlkCUGGcpk7RmCA0R2nFMzHphH2Kha
   lUvINpFv2Kre+BeM5SaBt4Ofcs+SBFSZNAOJAQCUy2p4BhfMo0wk3IP1L
   6qEY/qVZszEhMyQjwQKQ/GsnHvf9q4lrilHclnojeiROIvGOzOFo3bAou
   ogg3rfZm5njh7RMCz2/EPewiTm0IViPoPqHjNy6BS4V/JlqvxMqxMoyOu
   AQS6+9NiV93iA4f59YkHRU5OqEyxdAwsOxTpvvvgS0156gawRqLeESKwG
   A==;
X-IronPort-AV: E=Sophos;i="6.16,272,1744070400"; 
   d="scan'208";a="737581941"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52002.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 11:02:08 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.21.151:22581]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.30:2525] with esmtp (Farcaster)
 id 10d55f81-e47c-4454-aead-fdb417cb5871; Sat, 28 Jun 2025 11:02:07 +0000 (UTC)
X-Farcaster-Flow-ID: 10d55f81-e47c-4454-aead-fdb417cb5871
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Sat, 28 Jun 2025 11:02:07 +0000
Received: from b0be8375a521.amazon.com (10.37.244.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Sat, 28 Jun 2025 11:02:05 +0000
From: Kohei Enju <enjuk@amazon.com>
To: <pabeni@redhat.com>
CC: <davem@davemloft.net>, <edumazet@google.com>, <enjuk@amazon.com>,
	<horms@kernel.org>, <kohei.enju@gmail.com>, <kuba@kernel.org>,
	<kuniyu@google.com>, <linux-hams@vger.kernel.org>, <mingo@kernel.org>,
	<netdev@vger.kernel.org>,
	<syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com>, <tglx@linutronix.de>
Subject: Re: [PATCH net v1] rose: fix dangling neighbour pointers in rose_rt_device_down()
Date: Sat, 28 Jun 2025 20:01:37 +0900
Message-ID: <20250628110155.82474-1-enjuk@amazon.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <7a25c9c4-610c-4e93-8855-1ec335cd2b64@redhat.com>
References: <7a25c9c4-610c-4e93-8855-1ec335cd2b64@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D037UWC001.ant.amazon.com (10.13.139.197) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

>Message-ID: <7a25c9c4-610c-4e93-8855-1ec335cd2b64@redhat.com> (raw)
>In-Reply-To: <20250625133911.29344-1-enjuk@amazon.com>
>
>On 6/25/25 3:38 PM, Kohei Enju wrote:
>>> Message-ID: <20250625095005.66148-2-enjuk@amazon.com> (raw)
>>>
>>> There are two bugs in rose_rt_device_down() that can lead to
>>> use-after-free:
>>>
>>> 1. The loop bound `t->count` is modified within the loop, which can
>>>    cause the loop to terminate early and miss some entries.
>>>
>>> 2. When removing an entry from the neighbour array, the subsequent entries
>>>    are moved up to fill the gap, but the loop index `i` is still
>>>    incremented, causing the next entry to be skipped.
>>>
>>> For example, if a node has three neighbours (A, B, A) and A is being
>>> removed:
>>> - 1st iteration (i=0): A is removed, array becomes (B, A, A), count=2
>>> - 2nd iteration (i=1): We now check A instead of B, skipping B entirely
>>> - 3rd iteration (i=2): Loop terminates early due to count=2
>>>
>>> This leaves the second A in the array with count=2, but the rose_neigh
>>> structure has been freed. Accessing code assumes that the first `count`
>>> entries are valid pointers, causing a use-after-free when it accesses
>>> the dangling pointer.
>> 
>> (Resending because I forgot to cite the patch, please ignore the former 
>> reply from me. Sorry for messing up.)
>
>This resend was not needed.

Acknowledged.

>> The example ([Senario2] below) in the commit message was incorrect. 
>
>Please send an updated version of the patch including the correct
>description in the commit message.

Sure, I'll update and send as V2.

>[...]
>>> @@ -497,22 +497,14 @@ void rose_rt_device_down(struct net_device *dev)
>>>  			t         = rose_node;
>>>  			rose_node = rose_node->next;
>>>  
>>> -			for (i = 0; i < t->count; i++) {
>>> +			for (i = t->count - 1; i >= 0; i--) {
>>>  				if (t->neighbour[i] != s)
>>>  					continue;
>>>  
>>>  				t->count--;
>>>  
>>> -				switch (i) {
>>> -				case 0:
>>> -					t->neighbour[0] = t->neighbour[1];
>>> -					fallthrough;
>>> -				case 1:
>>> -					t->neighbour[1] = t->neighbour[2];
>>> -					break;
>>> -				case 2:
>>> -					break;
>>> -				}
>>> +				for (j = i; j < t->count; j++)
>>> +					t->neighbour[j] = t->neighbour[j + 1];
>
>You can possibly use memmove() here instead of adding another loop.

That sounds like a good suggestion. Thank you for reviewing!

>/P

Regards,
Kohei

