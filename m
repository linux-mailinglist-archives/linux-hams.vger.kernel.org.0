Return-Path: <linux-hams+bounces-245-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DE38BDDD1
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 11:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C14661F2222D
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 09:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B88214D6ED;
	Tue,  7 May 2024 09:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Lsypbf1j"
X-Original-To: linux-hams@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D844A14D451;
	Tue,  7 May 2024 09:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715073207; cv=none; b=DXdTfhVm7iy3T3Ofnv/fUuP3j9KT+ItNnrJYgy6zdl6u//7To8UI7ehSA9rVIYNhPsV9n4cx7IOOFaQstXc1FHc1RgTKh7IGmSg+9NmHjd64wghR5jKuGTiytIjEwIk2PwIJWjeWlb1g8Q5hp2gtVx6dB9HBjqtsUwagd6tGLqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715073207; c=relaxed/simple;
	bh=jciq9IMISLKFIamOPsw1NfQECykrFsPqx3KmjUlEdX4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=NtUvr1vcSxFn65QHgHE30/myAVTL/RSVPyddIgcSuH4cHwTryQRJhdlNmzdScG/De4iA3kWURkWu+/8FAKfP5UGA8IKjYOFkrBB/mexVNHmLc6fnU3IOUm/70OEeqavSW0IZRkP4u2BJz+BuaDaDEJfF1LjMpcdFTYW2OLrQeRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Lsypbf1j; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1715073171; x=1715677971; i=markus.elfring@web.de;
	bh=+4X1Dq3PhXLw4Pod25FOL6S3U5Sov1WBLcQo1sxZYZM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Lsypbf1jmYJ/3dYyOzWO47ogXcomiyIbPSIKEpbKZYiagxlnvrpdl68by1wvJVii
	 waG7/J617uSkY5teCsV7kXa9pO78yhKVxbi/eZtc6xPrh25yxtpSUWjFDji0DHDUT
	 BJuCEy5TgCDqeA5n/iRvynZypoVTuFYWSVK3EtzGCtZyhtRarOhpW4UjWn4DOawj5
	 Rut02WyximjkE478JJLLCneHAUXrksDQSKeUcNnkZe5kFSMGiIaF3jLqweW6AKoqm
	 LvRAWU3LV1HJ2HGQZVGKE+A/qVoFWGCxO/yARzKcxhntrtT84aQWSTxAQ04CDNZhm
	 IekJL4iVK2l6NGyeVA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MRW6Z-1sIDOI1r6L-00Mx00; Tue, 07
 May 2024 11:12:51 +0200
Message-ID: <4c09a28c-0336-4440-94c3-15337726ccd4@web.de>
Date: Tue, 7 May 2024 11:12:47 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?Q?J=C3=B6rg_Reuter?= <jreuter@yaina.de>,
 Paolo Abeni <pabeni@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Lars Kellogg-Stedman <lars@oddbit.com>, Simon Horman <horms@kernel.org>
References: <86ae9712b610b3d41ce0ce3bbe268c68de6c5914.1715065005.git.duoming@zju.edu.cn>
Subject: Re: [PATCH net v5 2/4] ax25: Fix reference count leak issues of
 ax25_dev
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <86ae9712b610b3d41ce0ce3bbe268c68de6c5914.1715065005.git.duoming@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9zLGST24T1eONVB08IqDf7NEIsQFZaKYLVN1oNvMm8kncuGCQ4c
 sPcOAmZzlUSJ8facNH7xOCdJdGUtfYpDDvghr8bCFyVea7D+YwodAYGxwIBqj+sb8Me184W
 LqBWpbf96Cja5WkbcbhQclv2y1Po3vNXDexdkxzh5g8seThJ4lXy90EgkoRrei+4PXe2Jzc
 zt3SkmAnrRG6i7vKhk31A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:f1IMFT+klaM=;mpsLtyLksxrhQFDRfTgUO5J77be
 f3OnZ9iSLu6xSKD6KDE8ZtYJkLzlGdTQiE7n2eBXwUTxHrCMQUaXMi1VztIZvGZMtg/AZnhNR
 3AA+m4QgT4zAejN+f96U9vMLF5maGdP/1j1Hj0lbCYC9WQIw8tcfyCVQWGFVUhU+E3FT7WD4y
 pAkFrN2TpxzLsNQxTLAMsp9Jq9ETpQM0I+QXDJYicf9mf2Dt0LM3ebq0n3cCcxUyucRrBKijt
 0ezMcE1SIyObBP9fTTOLMQeu2IFMmkfyexuz5ylhCS9zHAUIcqrb9WrSQ7PyG3MdDW/8BgQUe
 yXsHm9few9pcUEf9o2JlUhkO+AlMiaBOjtXQS+zxrBERaa81fxzojcxCJnilhtmCC39GJw3p+
 WjuvGzqJLVbyfgQBn0T2VBPBD/8VSnZWW3LWBObrlqyrwG7iVRYPcOLuh4k+yprqxL/0c61y3
 kF3B5J7wF6F5VkD5wecJ+MnrFHKoFWjojDwToSIJYvS/6Knc3XUkeOUdDagY81MwQHS5fkzAt
 T7OpWmyzcQo0KT2186DdHDDRA3cKiRiVHNA+pLGH7stilgIMOb8rV10Hf9jgNcO9YkiwbZZXm
 fcwp7EtNxwNcb7VgjQYJOGhCD0EsETmSfXZC7S977H2zbbDWYZ9oulXl7DDWmUVPk+/dXiMhE
 A3B9b9O+dvnMb/96iHXzdGC+QDGf7DsYj6ZUeZ/iNVARvv+SZwZz/nRtZqzZXpIt94fDh2RA8
 K9BfgoWmMkyom9JF0P2MH9gT84zaSPcA4uWX3ZtkKLuEOzopxIm5VvcuI2JFP1kZbErJ+1RVp
 FiWpyI3yBjaFyYkZBfd3dI4Q1oFVwpayIYQWhSZW+tqU4=

> The ax25_addr_ax25dev() and ax25_dev_device_down() exist a reference
> count leak issue of the object "ax25_dev".

Please improve this wording.

Suggestion:
   Two function implementations contained programming mistakes.
   Thus =E2=80=A6


> Memory leak issue in ax25_addr_ax25dev():
>
> The reference count of the object "ax25_dev" can be increased multiple
> times in ax25_addr_ax25dev(). This will cause a memory leak so far.
=E2=80=A6

* How do you think about to work with indentation in such a description
  for item enumeration?

* Would you like to add imperative wordings for improved changelogs?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.9-rc7#n94

Regards,
Markus

