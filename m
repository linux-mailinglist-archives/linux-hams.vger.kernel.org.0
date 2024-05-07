Return-Path: <linux-hams+bounces-249-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9BB8BDF44
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 12:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C08C1F22658
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 10:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C9714E2EC;
	Tue,  7 May 2024 10:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="uXIGVPPR"
X-Original-To: linux-hams@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2141114D6FE;
	Tue,  7 May 2024 10:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715076058; cv=none; b=QwhPGKuGuO/xkuZs+BXvI1WrzBb6vUjsOQxnG68UP153eYUJ9dd5R7fsk2Qquj9TOQUE7FHF+DRHrfrn+9QmXuKC8sJ69Q50hKXlMY+toynRFjcNIh31zo7dyo0Hmzx1JKAmd21z9cLoLy1rtmr6bvPMGccGaMaW6ItTQv19BsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715076058; c=relaxed/simple;
	bh=KLEOc4abcZn6HpAPgSfouRchY2WrlUiWSoBEOV7r6wU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=WsmV7C3JNHvCPrmb7blnQIYezYNDbZdDj4QhweM7l+PgrYjjGXuMcvO3ku5WtnEs6L2yhNXsC7qdvzdIxsHK14vKz1Di45RVconnWoeYkvTy77+xOPbTaTqY6zB0T3FgE0ksSAWqTzhAfLkKICy8lWs7U8EqnWx7VlAocgtzx38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=uXIGVPPR; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1715076026; x=1715680826; i=markus.elfring@web.de;
	bh=qJIk6Q309Lb3bnksQBwYYv+sXVfHbFc8XdTibljeQR8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uXIGVPPRvl4S/tpJiT4rptYoNZU/ikGBXFIYK0/lXyMm4J3Nv5QoClkjt6suQD96
	 HtyWxZyewAY5d1BrMrVjaNSxUW/vqN98Y6NHYFPX1MgnYOYA1d6rZ0q3fe68nHJcv
	 KUiOW9Ub4qGjxtvX4KP3xVOdkN6gycnl9JVjHiH0XlHnNUomkLNSwtgObHDZ79MkP
	 XrpZZn1PrE5FyyIP1ziDtsVeM5nt7tyJoAdQ0nHfAXFOFuT3xPZrq44GjbYivKSXb
	 O8cYcw0CW7RUx5SFtEg4VY9LP5HpkoTks+vnc6Vbnm2g0Gplq9Cp4TX3vEP0lIRDm
	 X+1MrkO+kuBko1ICQg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MI3tF-1rsPNN0ilb-00DUiB; Tue, 07
 May 2024 12:00:26 +0200
Message-ID: <8705fc88-ab7d-4b28-90aa-b87922f9f8c0@web.de>
Date: Tue, 7 May 2024 12:00:23 +0200
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
References: <cover.1715065005.git.duoming@zju.edu.cn>
Subject: Re: [PATCH net v5 0/4] ax25: Fix issues of ax25_dev and net_device
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <cover.1715065005.git.duoming@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TAQuf8VXbxojBjTAY9fwBV/Uw6QCArWWkLMICFSnbf3H71ZXXXR
 r/d/CosZs1tb43xJSC316rfSb5HvdFgM1A8debkdhkoPWaWIJd6MsN3r4I5rmmNy2J6WZaO
 dpooYXxOoQ4IAGI0IZUKv+0JszwJUuayx9CIQ25PfbOWzW2LAHb3dPGooiBD7jwo/YDT6rW
 TGjWc+n0TF4GY4mOSv4bQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GpDbgZwGOKY=;vc2QaRDcMBx7nZJAqYiar3V5h8H
 4pbFTin3UJWJfQw4EWUNlgEPCK8JjrdYpGk0OdLwcs5txNYB+swJ3V+vPaqCJ346aNSGXE7V3
 N+ZIEVphWQJvJ27Gr6qSiSsumztxVPDHIU40fadfno9rRaXZeuqiWNMAiUAOXn51+9UPfCqsi
 rB7R3onhO5Bbi0yyKnLnKBHhiGOKSo63891xsAW8sBxCunKfTn7hfXtTeMLE9T45R8tQnWbx3
 SKtm4vrgZaA7/ULWt9+7VVwpB3gxp8s1alJD2vYGHK/MQpXfmRpPhy6/0j3nGaEoskrcuxbg1
 boLEixh0+CDCOp63NGwzEXvp1Ewit/p1wejTBFIr4V4I12cuBZEs5r5VtRjoRUvEIeNwWG8Ol
 L6xA+Djun59MglCC2vA0mzx1kwaFg/h4avrmpTCg1P/t5CeRe4eVUB8bmpJzkDTxzalZUjvTA
 7QOWiciaRJ+0mvH7sFN+8eXLYKpcjLv3fmlTT9/hMmndvwqhAQehxnqie99CeydxVCqx/7yiG
 dVoLyWUlkvD8ohdDvDayED+jIdI9CXLny5DEAv/xSM9RsKYkO6FJL/ubVQ9upjyjHpLUy6EW0
 sck5hZdrRgHxAD2JOEOSsyQQxz0FlnctsMpP1lFR0vDZQGDa/l/MWfZsXLaMN19lyrm+nv3q8
 zkP6+UPYLKNVxw/HP/1pzqIyCLHzqJy6QhiGwHwZzExwEw+q63+wTA+bDITHED1jUgtkUvFy8
 K0MkDbjwMZIca1JonTbIQcOL1lWUQ7M73fBL3nZ3/AWYn6f3OthRQ/jGbAia/6K6M4JVqlmTo
 WXqQ8bFCbEXbq64ll5V1hKj4Hkbu25I2itoknbpyjWz8c=

=E2=80=A6
>  include/net/ax25.h  |  3 +--
>  net/ax25/ax25_dev.c | 52 +++++++++++++++++----------------------------
>  2 files changed, 20 insertions(+), 35 deletions(-)

Did you accidentally overlook to provide corresponding patch version descr=
iptions
(or changelogs) for this change iteration?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.9-rc7#n725

Regards,
Markus

