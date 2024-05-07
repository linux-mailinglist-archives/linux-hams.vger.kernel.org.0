Return-Path: <linux-hams+bounces-237-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCA48BDC70
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 09:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39DFAB20EFF
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 07:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B1113B78A;
	Tue,  7 May 2024 07:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="lYOeEOuq"
X-Original-To: linux-hams@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191EC13C3C0;
	Tue,  7 May 2024 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715067066; cv=none; b=qCr4k7CWcP+xLByBEXAzjLoQfL7Fwg7xnJ//2+JJSjZtl8yYOC2rFZljWpCxiXVXAZXY43K698kctTA4gYu5/3H5xd4lalgoyZ7X1IviajFf96Hp/LOLObm7gfJAJGb9ElXySkaVZ/dEx0EaGmUDgrqRAfdlE5YEkY9R8rD/sJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715067066; c=relaxed/simple;
	bh=hmx5YlR28Y43Dsm7EnmMfOwh+GjWWW2rcpB2wdOLYhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=puezjBwNTlY2sjrwJuDJoYqaeDMh41icbzcInsUtbYfbH4K78ccKVmUdB/kjUM29mXBtol0h+5en1gXZUI+AXOtYbAyL5cauOOusuu2n1Kitdjs9A+zHXE3YblHSi32mmFk8Zn9Ia06bIXJ8NchLA0Z98yCz+lc1BeSaixIqioY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=lYOeEOuq; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1715067033; x=1715671833; i=markus.elfring@web.de;
	bh=hmx5YlR28Y43Dsm7EnmMfOwh+GjWWW2rcpB2wdOLYhk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lYOeEOuqbEZHSXsC7xePzvU9QstYMyAtkmTziCxXiidg31b9ORH1/jvwG6+P4tBj
	 roIu74BgeEmZH/vDZYYzGCS5UruDBaa/81KairCv99Q0BwtFvnBghxuXjpHp7KJsC
	 LZhIgGRvuDd7GfKz0VFAZzVwagj6K6Pmek5Gj+F7P4B+dQDXRWfAf3ImsPDIxXQNc
	 /dg2C9TzAtHf5dMmuXhH/vuHps4jW76u+366/QogDHyRRkQq821Sy55TYAoVFc2kb
	 gN8Mvd191sguM5aM+T4ybjZAAgdlMSDOIMkJyBfu8qWsgQ3r8i2JeiuFnFiOQ9dkK
	 +8WmeN2mUnvQSfOumA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mvbn2-1swUYw47eQ-00sfkN; Tue, 07
 May 2024 09:30:33 +0200
Message-ID: <0334480f-1545-455b-8d5f-0f7a804ad186@web.de>
Date: Tue, 7 May 2024 09:30:16 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND net v4 0/4] ax25: Fix issues of ax25_dev and
 net_device
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?Q?J=C3=B6rg_Reuter?= <jreuter@yaina.de>,
 Paolo Abeni <pabeni@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Lars Kellogg-Stedman <lars@oddbit.com>, Simon Horman <horms@kernel.org>
References: <cover.1715062582.git.duoming@zju.edu.cn>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <cover.1715062582.git.duoming@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:59Z3T0+7kOChULTDQq4WStFF3BTShvGpkWwNkdTCMr5X15GDbxu
 ib+CHx8O1VWr2jeEJLfM+hzOGlAqEaPDPrj1MwWjepqz8b/L/m9bvr5qugaSW4unlxtm3ED
 fgKfCK1dUJQAWAB5QFFbKtryNQY4kvpS6rt0+edi/B1Z47yjiKfWpy9fBuuo7PmBGfYQitQ
 Xco3djPc3qP3jUB8PCshw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wp9FOU4EY3o=;NUy1Sm4Obbq0MFx+2V62dk+SmSO
 77SLi7jq+MGe0NyZez6HwAu91ZMO5pCRPDQ9b1zerBacTKalB7xVLJiWIYhh6gKo930q3KiQm
 9dgCDFOYV7+wTfFyHk/kXykJdFutHZb/kkHtd2ZhrIxYYLtuTStSswIyA7mzhvh0VPl/mozJ6
 kmdmOD/u48hLUZVCoZx1ro4MOlTZa5vbjr033WC57xqLXZGVu6FLINCrOeP8VP7iquY2ugNyR
 l1ezYtOcgc/ToQhto3CkQJJuplW93ZqCIb+kvTU95t32bxrKZ4co+h//e4f4Goeiyd8TIl0Vw
 qPHKqtO1EVUdGpsEw8zLBUP2psL/nleMD0gqh19ovNgzitdd28xfxtKYuqWcd9L6lb9cX9/Bv
 qbJPjmoFv9SjI6mn04BLqB1uBFtJxgSFCtBmodKpZEiGq44d9W3qqjyX9MqiLGOzorbtq7icU
 XYF9L+R+vyX0zV0QVNZOBgCy5Tk/smrVjYn5qOdbq34u1Qcy8H3vRZw96vV3g0I1oigLq25Ca
 M6/voT+WhDmCLX969DTVfoSHwwijzOblZfBAPMpKfn2BZq7kI1S8uHKuhyg1Ymoy9U2jusALr
 gkVEwHiMvRi0U2+XHDgF9Hj8okhwcGwxwSDXgaojuDEIdMApWLj5n8FsKb3s11wgsWalkyYan
 vDLNzCUfxk6bOOtTgdXeHQDDKXnsm9Go3fdH7Vq0T6PC+w2L8t2DGF4vBiAofFamHibfRK+t/
 x9QTScrciTcG4yNyzBgvlmy2LXkPPw1IEr9OIA0FST5+rFtCAW5xi+nAR1Ijqnb15GhI2RxzV
 SzaXqeAvAnSslm8afsPy6lSNY2NX4AAm0FjdDCIExmJk0=

=E2=80=A6
> You can see the former discussion in the following link:
> https://lore.kernel.org/netdev/20240501060218.32898-1-duoming@zju.edu.cn=
/
=E2=80=A6

Does this change approach represent another subsequent patch version
instead of a =E2=80=9CRESEND=E2=80=9D?

How do you think about to improve patch changelogs accordingly?

Regards,
Markus

