Return-Path: <linux-hams+bounces-218-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8FA8BD15B
	for <lists+linux-hams@lfdr.de>; Mon,  6 May 2024 17:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D19991F22000
	for <lists+linux-hams@lfdr.de>; Mon,  6 May 2024 15:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8EEC156237;
	Mon,  6 May 2024 15:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="HiHEFrOu"
X-Original-To: linux-hams@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA3D155359;
	Mon,  6 May 2024 15:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008332; cv=none; b=I2qW41PaDzvAR9YTaonMOOKNGCFGhfa5imZZpe4ktGFkGRtGhfB2ik0o0UMZQhcu99OaYteseQpSZ6RTJDdlnZA0zmfzMiSeYng6NyJM9P8UOweRzFRnrA1VNsy/NbY78E9BANiWiDj8gD+Qkm3ZlpDCYGi4wC9up4UbxpuPGxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008332; c=relaxed/simple;
	bh=6e1q5SzxhmAt8bpTfbd7aZEK9sXTlPjzcbJlbx0Ai7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZtGdHM1av4Py71rYqMRWub+wdE3BvqhOFSw9q4OrMj8+6L/IEgy8eyJG71vDCEmgABOy6SR+xwKPpaNuIL0bpI4cEpl3SuaKRbiZdEKXE0fgCyNI2dKFdmaUIhOJo6/yHMTt/7+FpBZX+bZ9IwPPKYZ10vv/SXXkzhKSqcq9Mzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=HiHEFrOu; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1715008294; x=1715613094; i=markus.elfring@web.de;
	bh=6e1q5SzxhmAt8bpTfbd7aZEK9sXTlPjzcbJlbx0Ai7A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HiHEFrOub7F+MIrA3Zj8Ntt+oJDAnR+dTaRqRwUPNpxLGCLrBizgl3kcBX/SpzLZ
	 BAYHu5MCB5bGBvhWXaHYffMjgUr0o5DQ/ViUhe6S7iSke29JPCHGK+C2xanKDVEcU
	 fSkXgRlz5X2hkJz9xAaxZosgaUzo9WfkV7dBPl+xO2YfWihAuzJwp5RclXjb9ZabI
	 7CaicpEmVyKOxLECttQPBSCv5DX7uhFsXiSVbtMH0dIyuPWw4STFGBMa0lvI3dUZy
	 EnwXqIHoT4DFMdiJNgAdy7u+ICAtWxf5FQHWXSt8qggYG/jOxDjx1F9KZhc5SdpWf
	 wNA9Gf89gak5j5k2lQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlbLM-1sUm1s1VPW-00ijig; Mon, 06
 May 2024 17:11:34 +0200
Message-ID: <7582e197-122c-4682-b9e2-53bfc386d870@web.de>
Date: Mon, 6 May 2024 17:11:31 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 1/2] ax25: Fix reference count leak issues of
 ax25_dev and net_device
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?Q?J=C3=B6rg_Reuter?= <jreuter@yaina.de>,
 Paolo Abeni <pabeni@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Lars Kellogg-Stedman <lars@oddbit.com>, Simon Horman <horms@kernel.org>
References: <cover.1715002910.git.duoming@zju.edu.cn>
 <8338a74098bc1aafbca14d4612a10d6930fcef1b.1715002910.git.duoming@zju.edu.cn>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <8338a74098bc1aafbca14d4612a10d6930fcef1b.1715002910.git.duoming@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:RONyq3fALCbJADN/0hRJ9hnA+UEEvs4z1ucA3GyJCmX8Q4rDgTa
 6wj6ykFbxKOL5vSvLYE4XP0123sYErDGuWLbvES+gCymF4t2thrkeQAhDi5ARN7HyqnP1Fw
 l433K7dS9GeQQaRK1uz6k06q5elOAqGh+5JjuCrjZM+LDauN3uE3TC2rvQyEr/yVpwwElvW
 eAfOiAet6R/jYSiNA7mUA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7y0mQykGYLA=;p9lu1MtTvq61ZoI2zU7ntxmR31A
 BOwLVU6vjClWt23iGroruQIO/KBwzUylCl4EWal+Pbht/Peh00tmUnp7H+vf51jrlsaHdB5KQ
 zq3SuPkUuryho61EVxKTbUbbdJnQtvpOD9P2wszErdhVfPtV01llhr+gRlbObWkq4fjzaWQ2W
 d4apuw3PReVFPWAsB/EKbd3a4GQWuOOF3j2FWsycHNpQr6Y/sFhKEicUosYo74VIelFvtrZmc
 R3mEUBBk6jgkosx7VjajUr6c0LWzxCG7tizApfNA2wE3doXqARhGEkxlTKpNfsIYULNSQ68gD
 WJeE1lAAUtItHNKnHMlc8NWP5Fmjxm7lqkl6FjneIvnrf/ig+izSSS1bqkkozNTC3NnbnqSq1
 0415Oy0+MY8rasHgQmWrhgkDFbyuo5mJrBvIyfrywz3grg+ofbRmkxnroD2+S01SquoEjIswY
 BcTvzaPeFXYgJKcidPedAsmRvY3fTjPwaqo7DlGw/3xQc5BPK35uSUig4IUtoJQI4ET5+1U9C
 ZZ7kiiupMQwcJJNiRd2eoQIpTDNsxX6SUVCrtwtrqpNvdg/5dDE01a2DIkUDFnHRBJXt9m+o1
 mdIWJG5IeyxYMFz9RDaxypTQ7LqTVL5K8kmXQIsZRzYPywtgT644NEceG72OO/WnhAASX/2o1
 1UMNbMLdOCOZDc2ysz8syMG1nrkRb8xcCP0bV+Dpzje22MAroXxFQef/6EtCOBL+ydoQ5psQu
 rfp3zAJjCZiBioAgYOu2REHmBEU4Q9M0rpuLb+iYRvilR2FeRXx03JHffIWBNNFXY1nqoTwdN
 J4UEseE1nNXwXAset/IyBLLSq7W52+WB93OMIoZJUq/D4=

> The ax25_addr_ax25dev() exists a reference count leak issue of the
> object "ax25_dev" and the ax25_dev_device_down() exists reference
> count leak issues of the objects "ax25_dev" and "net_device".

I find that such a wording for the introduction of adjustments needs
further improvements.

How do you think about to offer changes for the affected two function
implementations as separate update steps?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.9-rc7#n81

Regards,
Markus

