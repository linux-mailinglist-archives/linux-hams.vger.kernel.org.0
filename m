Return-Path: <linux-hams+bounces-246-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A028BDE1C
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 11:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F89528415D
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 09:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484E614D717;
	Tue,  7 May 2024 09:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="M3/FZZjA"
X-Original-To: linux-hams@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF43014D710;
	Tue,  7 May 2024 09:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715073947; cv=none; b=UGkr8mPKTUAchFre+SRNpv89OiOW2RmZGRMVoSOAKVXm4TG86MFX25cEp5VasXbr0EP6AJ0kHHo8/AhmKiYadczidSjhdXDoInReuueRV4SoZNC62gJYomaa+KpJIO8q9YLrBFsD1zPa9sX+nMXnk1crLkvDd3iviCAt+OhIc64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715073947; c=relaxed/simple;
	bh=vSeJbkIMICdQAl1glvGGycQMjGSoLDGjVinLmisZB9E=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=uL1x0krhba5dkZPs6rUUdqMKnyaYv5rX82F8IB94HLItnnNbKo0ZPOChbs3tmwGICb7R8hulcuu6YhHA+RJAcKJr8eNcNKEu82EvxHKfxqj+BzgSixYadZGFqhAYcozFLHmrXjQWoufbR/x17by/w0XADJy1ivjSI8fzxHdXAMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=M3/FZZjA; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1715073921; x=1715678721; i=markus.elfring@web.de;
	bh=vSeJbkIMICdQAl1glvGGycQMjGSoLDGjVinLmisZB9E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=M3/FZZjAx73zkY/yPxjQ895+NCl082NCcX+avLWlv4RPMPPr3zFj2b/rBn77/fq2
	 bt/ZOQA6mtSqI/75X2NTMQL5fY5cXUF9R9JRjWu/7HzY1vbihXk5bVozMdAo1rCQ8
	 d/3RMEZ6nxAZO9N0oIu8xHZoNctp3+vZ7vC1Rh0C1PFD7dUflREpU71haCw7lwr7A
	 C4wjHmyX0G1sSJ4muY0aKVRtqrMcoxpuT2VAXQcdY0rHFx+1tffBYqjK8NHdA/SKI
	 z/tAsgocwli91S8vA7hfx2ecJEePnC6A/tkQA+44nmvitUIrXxwv9qMsPhpq1rUR2
	 NjEgKH3FnyHkGcoiNw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MVaYw-1sE4jU3sAu-00R14J; Tue, 07
 May 2024 11:25:20 +0200
Message-ID: <7cc71e11-a484-4b5d-a3dd-a8b84c432977@web.de>
Date: Tue, 7 May 2024 11:25:19 +0200
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
References: <c1d18fcf1bf6ef65264ba992172ea1636dbf5431.1715065005.git.duoming@zju.edu.cn>
Subject: Re: [PATCH net v5 3/4] ax25: Fix reference count leak issues of
 net_device
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <c1d18fcf1bf6ef65264ba992172ea1636dbf5431.1715065005.git.duoming@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:EvViN+aWJfnlUWfbeSptumUZpkz1hRT43xIcsGsraksgWefTirR
 1qhK4MRgc6ZmxsGzPD4Kxmz1RgK6xJ9Lay8ipCqBOJ/HzA1bVM55Kg9KZ29XWLGLuSm42pW
 nafRPfJ0gP14LS47ZFxpi7/RLesqJids2+znTW22wdERYorMcE2ZgpGLLr4wRcp9LQtUl+L
 MvVAUC58/XASnG4lwQLhg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eHzY7tsbTC0=;ywjjrQhRZCbWvmysFOg+GM/ODeM
 axDWGTwsrSWSa6g0to3P4Sd145vXKDvthSeHbEYYiPxrcCB8T8ekS5Cec7ozHldHxdr6i1hFr
 +Ap4XGpvoUMoSKRvZITfRkDwwtnHECHtVpvq5gt1/B/KGEQYureNKFTEL8FjWVvuhnYbWO86D
 NcTnSvA4MrnZlMAVR3DHioe9j2qJRIDumDx5c/Br7xMGSVqj3gFjuj/CfcIcn1Y9aD9vk29Db
 eoqIa5LaUF2AXQHhVsQ152LK06I9f6MLqtobA8yvZejIdueySMpgUbclxuzdnaeJXZVjPiXLK
 483s5sw7EzxaRVqqHv9tyNCSZ3llJZHLLeT0VtBl+FjCHUiqWxm0Uga4ll/oWH7jUgn4NxSYc
 UNHN1twdljMIlcwn4jL14PpT6LQUU+sXO0TYs2y4sa0y3ebBxEW09EFdPjRTRQoWR9taw/I/k
 pRqDfHvdCZ9WKXwn+VXQHZhWSzNpvjYHKg55TutNb/M9mCL+eZfWL2W+B/uQLj6U3yMjkV9yC
 UnzrsAm8p3ENr/gpnCXXv31MPhTa1thk5p0jijg0ByYsO7ljzCoW7rT3F8ROISJe8l7vKcmwa
 O6Clu0bDjYOJOnpV9S/P9Zu9CX1EXIe6NZnm76zXquIB0l8ZZHH8jQ/hLYNW04Ydvmvx17Mr0
 v+CHwtuqLX1VlNDz35QrYeN0EzIrTyYyGq8+1HltAWU0bRveCArvOZW9LOv3fooFggEepnCcQ
 mhJjWAJuHBIlbOsEOIIMwWnsFRJqfUYo5JoBu2ig2B5bMEef+hcwy6pKZHih5lgGy0qZXLf44
 E+g4KnD6P3QxCLWZ70fY22VLdUQRuNnPqtFzArg6uES1s=

> The ax25_dev_device_down() exists reference count leak issues of
> the object "net_device". When the ax25 device is shutting down.

* Please improve this wording for the final commit.

* Do you refer to a single issue here?

Regards,
Markus

