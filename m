Return-Path: <linux-hams+bounces-248-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD9D8BDED0
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 11:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8A331C231AB
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 09:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10A614EC65;
	Tue,  7 May 2024 09:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="nKBqsw0o"
X-Original-To: linux-hams@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC328821;
	Tue,  7 May 2024 09:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715074979; cv=none; b=kcd5kda9hnDvM33WhrFUKcB1s6iF9oDzatarFCUXjRyWjr70W0DAURWvfb6K3+EUsMH8/dbXGmQD3Fczxg7GZFebMcmWiUzowfp4f9Qh/KNxTJ6DELfQOoHehEnWuR0xY12dMZ3eEO2u+GNJvx4fv9ow8Oe0n/f6g1S5Dss8PSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715074979; c=relaxed/simple;
	bh=+nDEuH5Ssq5bYvy+3zosscDSP7Lvm/QwrqbbeTHFOLI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=C2AXAB3w7od8hJcs5rOfDHcbMzc0Wdp3+qNMH8CUrC7Z6q9qjsK0FUoWBYeZKBuszde1bFRr0/03lOoU7ZmXW6gfKVEVt77fuj0Oua27y9uxBMD6aDyiY6BhpKulJvou1qxBSkg5hcI5T4IIiSVE9VSktClf6KarzujljNH5kqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=nKBqsw0o; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1715074954; x=1715679754; i=markus.elfring@web.de;
	bh=r5NM6ZMZAAS7E+M7pm2Z6LYVfm8zSH5Ol4T7cTS539Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nKBqsw0oAKDdVsM6Jj5ohfvf5oZ9bOf5AX3U3i7JjkMLfrecLADdiGLI+8uB4kjC
	 jY9dhdnqebyZBlg93wEWyIPryKfO44WQkySseyVc1fvr+1ulilua5lSId7Q5st2OP
	 aVTNN+JuZ+28QUWvQuATNLVJpH4sh43ImzMMrklk/NSZ6nNHghfUtv74edXRdFZAJ
	 qs/Lecur6n/ZVtvfjSv56ueyFtTOZafD/Rj97kbk0fywOnij83XGr0pvktsOwSa5q
	 VV6dL+WODaN0QqtDlYIPZZfxV60P8BfophFpExDMY4F+2Y2WMXGZt9BRuUFuVsYdH
	 0fDeypTMNxcUa9fpwQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MDv9a-1rwXaI1nMK-009LgC; Tue, 07
 May 2024 11:42:34 +0200
Message-ID: <dd736c19-ee7e-4040-aeba-6b79ec15f266@web.de>
Date: Tue, 7 May 2024 11:42:32 +0200
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
References: <5c61fea1b20f3c1596e4fb46282c3dedc54513a3.1715065005.git.duoming@zju.edu.cn>
Subject: Re: [PATCH net v5 4/4] ax25: Change kfree() in ax25_dev_free() to
 ax25_dev_put()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <5c61fea1b20f3c1596e4fb46282c3dedc54513a3.1715065005.git.duoming@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+pdHRZr7m21n7xLmFkZBY95nM+/t80yhgyKvXQ93ITu5O3mm8uG
 XaGOT59O3eUQWzDy/AZkainCMmuSFVxftcplkLa6sF3jrelLvvPzdpdGOFmAcGVy5CBhlhz
 OtEgrpt0m00ojq6Tg+yh688lPq991nOuHx9R55AjsYjClPZ47j9+6j12RSOgjx/ohGB/MSj
 QHTPoPj4A8MEEWkZ8kgmA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oT1Lk3+spDI=;sGvZy0c3wuS6usgKSYG8TBtSNlT
 vPzS14FAqAzkjIjurTFX7iaYYVAd6Iy9Aqi/3PbOCmIh/isjRaWV1blXGf3CXh/dmhNhdfnyp
 iAcR6t6FSn6BHN6BEGpN8a8Ir7t/fRPm/LRrdiK0whDesYL4iXaIKoewYz95cForHUYB61h1L
 3nAwJQEfW4jNlEdq5O47Mb5qGzBeyPzwznbtScsZl6emJikicj8HKF5EySb0WGOKo9VPESLuG
 /Vp1J+1DMfMriq2zRajTg1mLkOdaj4RG5b+iMO1G3oG85T53I3XUau7VOm90rZZvXQdnqZdll
 sxKCtW0JGG6rlRDNeyBJfzsoCE7G5RTb7ZjSF9F9hoI8Dcc2/2DGrtwciAxcGrjvu5u9oUf/8
 e9OnEmtF3f5uQorLS7Xp1Du8DKX3JE0t5+GdvrFN8mfVQBWnpXc7HiHdHzyuDQY8S9EQ/5Rj5
 1qIdT5plALgCaAEYDBL0nik5/ARmN5aqJTenHoeHf3hXUMfld++uAaaPuT+1QWeMyLDR8uUje
 xWtvC4D/d3SziQVSswMoeCWnLjexSRI3CF0YgkSfTV6iucqztQW9khPYGpZxP4lwJr/nWheZ7
 rPtqqgXi3onjNM6SzDOqqEjzfrBE6AYgcofIJa8STAh+f8WyIb3QHSLwp5IhMZLMHH/Q3S6uv
 zGzNgB5rHuAm7pn6bqFYXUdtd6RRlGyOxNETHjhwbeEJQ2EDOjnBYo/83wreFJui0Ta+d4zV4
 oMdrEWJx2zpzfN3cOcolrqpSslWMCivQ5di/cb1g5TeHkooVsOyfchbv+3WlZ+PuyS8svwh9j
 Z0Wv5QB5mfwOSKgZS6OaZjkESngH8oN2C1vS9S+sq0bJQ=

>                                          =E2=80=A6 in ax25_dev_free(). R=
eplace
=E2=80=A6

Can word wrapping look a bit nicer if a single word at the end will be mov=
ed
into the subsequent text line?

Regards,
Markus

