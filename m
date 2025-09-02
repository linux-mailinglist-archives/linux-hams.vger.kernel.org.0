Return-Path: <linux-hams+bounces-615-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4999AB40BD5
	for <lists+linux-hams@lfdr.de>; Tue,  2 Sep 2025 19:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1995E17605D
	for <lists+linux-hams@lfdr.de>; Tue,  2 Sep 2025 17:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FA833CEB9;
	Tue,  2 Sep 2025 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="paZKFr8k"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C0C2D239A;
	Tue,  2 Sep 2025 17:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756833558; cv=none; b=NUXTZOFFCn/j26cYxizap58k4pv6H+7c8UNX1KTsKwvihpQsJCNchPeRX/heWg6QgQN2spx8hQtNF/21mNgBLOsfnfp92WxHA0K+ZV3jGxLQmIoRe2mOAXtwJHeM8FRn2l1f0vhCETb01lUD7CJCJnDaYc8SsEp/hH/U3i1zMuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756833558; c=relaxed/simple;
	bh=/E14yxKlVoRgQMOBr9xf/hr4UbtA7Xop6RaP1CcDAB4=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=npBoIOzw99YZcV2PzDNlNP3F6Jm3mmiUW0H1nsMzQnQZ2WJCvIVkP6JFjmj7gaUFmd9skg9rRayc9Hm3mEPczAtpwIR0IG4UTZq9M8ooM2MhOqBMVihAFJML6aVZrAjZR8S4k15xQur23iSTWgoHPh2FTRZzKUQw12K7FXtqPJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=paZKFr8k; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from [44.168.19.11] (unknown [86.195.82.193])
	(Authenticated sender: f6bvp@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 4BDD619F5C2;
	Tue,  2 Sep 2025 19:18:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1756833548;
	bh=/E14yxKlVoRgQMOBr9xf/hr4UbtA7Xop6RaP1CcDAB4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=paZKFr8kCKbCUNKIM1lUoKEUYEnE2qCdayURiDn+QZhyh7/By1hsqumqw5d+Mqosv
	 aUSFgaeR5T6v97C2Jb/1w262TWi7GDRVjfsBWaxwMnYc4/qVWgLqXewzskmVxGtpAn
	 BV3UUqSX9Y/eLd97rXsBQYZDAYlKS2U7X5MIZBD/VxfTdJl9GYRy7KCQj3O+fZRbbR
	 oot7gUK6+FWMy+0jmnh5h7PWLIPHs5R8rXOHgYUzVRjwJ1NT/6POGnApt4JbLWk0z4
	 2sCsDJM0rt/trVoGx17EqX4zYDg3IrlIrjpKxLHuaEFd3gsBglvl+hSAy2m0RtQOP8
	 MeV4foyteP2WQ==
Content-Type: multipart/mixed; boundary="------------YjEW7tzqppVdue2N0Jikw9KQ"
Message-ID: <58ba5453-52a2-4d26-9a5d-647967c8ede1@free.fr>
Date: Tue, 2 Sep 2025 19:18:52 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net 0/3] Introduce refcount_t for reference counting of
 rose_neigh
To: Takamitsu Iwai <takamitz@amazon.co.jp>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 enjuk@amazon.com, mingo@kernel.org, tglx@linutronix.de, hawk@kernel.org,
 n.zhandarovich@fintech.ru, kuniyu@google.com
References: <20250823085857.47674-1-takamitz@amazon.co.jp>
 <175630620975.735595.12172150017758308565.git-patchwork-notify@kernel.org>
Content-Language: en-US
From: F6BVP <f6bvp@free.fr>
In-Reply-To: <175630620975.735595.12172150017758308565.git-patchwork-notify@kernel.org>

This is a multi-part message in MIME format.
--------------YjEW7tzqppVdue2N0Jikw9KQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I am facing an issue while trying to apply refcount rose patchs to 
latest stable release 6.16.4

In rose_in.c the call to sk_filter_trim_cap function is using an extra 
argument that is not declared in 6.16.4  ~/include/linux/filter.h but 
appears in 6.17.0-rc.

As a result I had to apply the following patch in order to be able to 
build kernel 6.16.4 with refcount patches.

Otherwise ROSE module refcount patchs would prevent building rose module 
in stable kernel

Is there any other solution ?

Regards,

Bernard Pidoux,
F6BVP


Le 27/08/2025 à 16:50, patchwork-bot+netdevbpf@kernel.org a écrit :
> Hello:
> 
> This series was applied to netdev/net.git (main)
> by Jakub Kicinski <kuba@kernel.org>:
> 
> On Sat, 23 Aug 2025 17:58:54 +0900 you wrote:
>> The current implementation of rose_neigh uses 'use' and 'count' field of
>> type unsigned short as a reference count. This approach lacks atomicity,
>> leading to potential race conditions. As a result, syzbot has reported
>> slab-use-after-free errors due to unintended removals.
>>
>> This series introduces refcount_t for reference counting to ensure
>> atomicity and prevent race conditions. The patches are structured as
>> follows:
>>
>> [...]
> 
> Here is the summary with links:
>    - [v2,net,1/3] net: rose: split remove and free operations in rose_remove_neigh()
>      https://git.kernel.org/netdev/net/c/dcb34659028f
>    - [v2,net,2/3] net: rose: convert 'use' field to refcount_t
>      https://git.kernel.org/netdev/net/c/d860d1faa6b2
>    - [v2,net,3/3] net: rose: include node references in rose_neigh refcount
>      https://git.kernel.org/netdev/net/c/da9c9c877597
> 
> You are awesome, thank you!

--------------YjEW7tzqppVdue2N0Jikw9KQ
Content-Type: text/plain; charset=UTF-8;
 name="rose_in_reason_dr_ignored.patch"
Content-Disposition: attachment; filename="rose_in_reason_dr_ignored.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2IvbmV0L3Jvc2Uvcm9zZV9pbi5jIGIvYS9uZXQvcm9zZS9yb3NlX2lu
LmMKaW5kZXggMDI3NmIzOS4uNTE3MjMxYiAxMDA2NDQKLS0tIGEvYi9uZXQvcm9zZS9yb3Nl
X2luLmMKKysrIGIvYS9uZXQvcm9zZS9yb3NlX2luLmMKQEAgLTEwMSw3ICsxMDEsNyBAQCBz
dGF0aWMgaW50IHJvc2Vfc3RhdGUyX21hY2hpbmUoc3RydWN0IHNvY2sgKnNrLCBzdHJ1Y3Qg
c2tfYnVmZiAqc2tiLCBpbnQgZnJhbWV0eQogICovCiBzdGF0aWMgaW50IHJvc2Vfc3RhdGUz
X21hY2hpbmUoc3RydWN0IHNvY2sgKnNrLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBpbnQgZnJh
bWV0eXBlLCBpbnQgbnMsIGludCBuciwgaW50IHEsIGludCBkLCBpbnQgbSkKIHsKLQllbnVt
IHNrYl9kcm9wX3JlYXNvbiBkcjsgLyogaWdub3JlZCAqLworLy8JZW51bSBza2JfZHJvcF9y
ZWFzb24gZHI7IC8qIGlnbm9yZWQgKi8KIAlzdHJ1Y3Qgcm9zZV9zb2NrICpyb3NlID0gcm9z
ZV9zayhzayk7CiAJaW50IHF1ZXVlZCA9IDA7CiAKQEAgLTE2Myw3ICsxNjMsNyBAQCBzdGF0
aWMgaW50IHJvc2Vfc3RhdGUzX21hY2hpbmUoc3RydWN0IHNvY2sgKnNrLCBzdHJ1Y3Qgc2tf
YnVmZiAqc2tiLCBpbnQgZnJhbWV0eQogCQlyb3NlX2ZyYW1lc19hY2tlZChzaywgbnIpOwog
CQlpZiAobnMgPT0gcm9zZS0+dnIpIHsKIAkJCXJvc2Vfc3RhcnRfaWRsZXRpbWVyKHNrKTsK
LQkJCWlmICghc2tfZmlsdGVyX3RyaW1fY2FwKHNrLCBza2IsIFJPU0VfTUlOX0xFTiwgJmRy
KSAmJgorCQkJaWYgKCFza19maWx0ZXJfdHJpbV9jYXAoc2ssIHNrYiwgUk9TRV9NSU5fTEVO
KSAmJgogCQkJICAgIF9fc29ja19xdWV1ZV9yY3Zfc2tiKHNrLCBza2IpID09IDApIHsKIAkJ
CQlyb3NlLT52ciA9IChyb3NlLT52ciArIDEpICUgUk9TRV9NT0RVTFVTOwogCQkJCXF1ZXVl
ZCA9IDE7Cg==

--------------YjEW7tzqppVdue2N0Jikw9KQ--

