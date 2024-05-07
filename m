Return-Path: <linux-hams+bounces-239-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B63AE8BDCBD
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 09:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 107EEB22016
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 07:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0345813C814;
	Tue,  7 May 2024 07:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="E2iZGMCZ"
X-Original-To: linux-hams@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5465578274;
	Tue,  7 May 2024 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715068400; cv=none; b=VUZmZ3WQ0EkeJL7It9AizT5rDAwwAguVpsCB9wIeKp6nGJ06Ec6yL4eegSiTvRFqtnuCH8HFPXZeBo8GlCXD5OZJ5/1pILRCsCW9lg0j6Q/pDWMJgFIYbr0TOdDf2cEsc3IC1JCxNgB4KZPJvX4zavx6KNwPTY7Y77qCDPGj2sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715068400; c=relaxed/simple;
	bh=PdzkpfEmwxK/pzn735F8E3DY8ddcp/oOwhlxuPHUSGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBA/0fWj1x4i8p8rG6slrt8KskTbHSSPSGiFjvxSP9lOd6GoczhX1ub8NABAGfCQHgLkL6rQ99vCwNS0q87bPxU6fKD3/XmGvuut5NpZP2z9vGJThRkIdaXZg/a/s2LonVPXJYKTe6KZANteczxYvrZYl68NHlPGGFCskPqL+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=E2iZGMCZ; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1715068377; x=1715673177; i=markus.elfring@web.de;
	bh=PdzkpfEmwxK/pzn735F8E3DY8ddcp/oOwhlxuPHUSGU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=E2iZGMCZNoehF4HYktpIznUiGZj3jSmO4t6J4jrcY/FZHVDGwzjlDU9sQ567F3el
	 VB92s/8WqNKbA9pgRntlDyMj0VidGfWgZZY4iyzLbXdf/2Tb1/LG3MDRj6p4hOiwh
	 63VOaCMcy8Q4ZXrBKoFKKwDx/UHhN8kpal1fAEciz5vQnR8PbQJJ8WztuKvgYUjuf
	 /vZ9pzWm15q63AQ/ACdE7Cs9GfhpDtb9WWpaaZ81gID1OJ9QO+bwXIcfEEBs3zcqJ
	 gu0S5RmU8AvN/1MSAXboOClBW18c4/xo/9hl134tHmIfVLOzzqp1ONKDxmKR/LncX
	 3zFTWCWpeXeLK1EewQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MFs1t-1rqETP40ch-00FhiB; Tue, 07
 May 2024 09:52:57 +0200
Message-ID: <04bb96a0-0561-4583-88e1-d98253e0808a@web.de>
Date: Tue, 7 May 2024 09:52:54 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND net v4 1/4] ax25: Use kernel universal linked list
 to implement ax25_dev_list
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?Q?J=C3=B6rg_Reuter?= <jreuter@yaina.de>,
 Paolo Abeni <pabeni@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Lars Kellogg-Stedman <lars@oddbit.com>, Simon Horman <horms@kernel.org>
References: <cover.1715062582.git.duoming@zju.edu.cn>
 <5022fa6a280c3fa852bf3724149251c41ee8303f.1715062582.git.duoming@zju.edu.cn>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <5022fa6a280c3fa852bf3724149251c41ee8303f.1715062582.git.duoming@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AcxtWcKhsnvM4Wyfr1/gM0nQhuxjagjJQcGnFRWS5hhlpbk2Ks1
 Vw+MfevEkH8j17232cwi/ClgDR5mP3R+O/ok52USYZlRZmhtcDmdNy4i2aR/3lvJjM/8BOD
 TR9qj+cHj+53j9ArS1LfWr0hcqFygNjtCNXPZz4RRvlTSo+PpnWtOGvDdGxp50DYRwCXoBN
 fVBKQeV8Gh8Jg93DEtezw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VAKrZdKyq1I=;NP2PmAgGCC5JpSTHcMAs82hAn/W
 U8udGfE9bxwjbijcyBZqlvYxXbke/jzqaX2PDyb3Ykh6yDI0FewVACPNDIEulHqnMjkf6snNE
 mgd1OVwEchChjM0BN14jnHmPlvAnQe2NSb59spCSV7h2JLjab9ZCopamau5kvCzt9qfluNGGh
 +rbVV9Efay7JjOP1rxYoBJKaDfjQY6S6E2ySq64BTuhCdDeUZwCcWLiW5+MOt7YNIX8R+9I3Z
 1xSWMs/e6SqgoH7+N0k8scvQ54ZZzxl5Qw8h4gs93+ueUwTc39t2XFAKcP21W3Ga9K5/WAQ2F
 X89rBqPuv56GP1wI40b2XCx4UyNEEh/nmwylWV8iaoXEcZZqCRJbDS480KYGRFYNoLE6YiL7N
 +DgTVNh0s+BCrncN4dlYYTHTcWsC7KUoeOhyrRsThJv4Ug/ccXUiKbFC7AODqk+FiTGVP3wLQ
 vRD8n9aCBIVYcRkJIrHLKVcASR6h8KAy9AWetbyRdOYfQrWdgGgs7erRz5Q+H1eIfy8QRjHls
 oRSwa7c9/ibv+qKEKUirhl5fyB3uLRnJo2hA8xajHqYIltS6chbg4y6yteheSc7+vu+HGMTPg
 dH+VY3e5N+KTnMMLS7YTs52WZ7c0W7ORdb7zpn+KVqcF/u8djoHJI6/hmKFGKhVZSAPioK5NE
 rLj/C4VDslLT//swIa8Xzzr6m3Xf/Htbm5Y//0vfrx29VVFhcsfIF7AvXwZR7L2GINioWkJyN
 DdQZ8jTSgwTYJ/Ja7kcvDPBN06Gi9vAbQ5D3tru1mdtCPRYoMvvSNZTfh2zroWy+8EXWZH3cJ
 BtR4DIe8szbxIKgdws6WeWdcnqfYoQIeIuguqWTj7+LrM=

> =E2=80=A6 that need to notice:

I suggest to improve such a wording.


> [1] We should add a check to judge whether =E2=80=A6

Are imperative wordings more desirable for improved change descriptions?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.9-rc7#n94

Regards,
Markus

