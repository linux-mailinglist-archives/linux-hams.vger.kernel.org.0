Return-Path: <linux-hams+bounces-219-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2818BD1C7
	for <lists+linux-hams@lfdr.de>; Mon,  6 May 2024 17:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4AC1284BE8
	for <lists+linux-hams@lfdr.de>; Mon,  6 May 2024 15:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77AA1155729;
	Mon,  6 May 2024 15:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="P1RfsMEb"
X-Original-To: linux-hams@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B93154450;
	Mon,  6 May 2024 15:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715010648; cv=none; b=tiuU2VXbEneRGA42W/5ejfIz0MXxopXgx8ao3zW80XPGFLJBh7pOmUYNLiDE0kxAWrOPR/68dCbV6kes/o9lJB4ulI+N7+Is5hiVwo5ryI9vHG26bmfOcP60FbEHQhAeFt/jLRXiJv+PmJ7Ka5lF+fSBYg8ZzJDzMETCjWdjwEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715010648; c=relaxed/simple;
	bh=1yyAqDkLFzrqKXzOSJzS2RwxgP/SThZ2l8QRzY3mMto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HNpMd+ss4nkngeV6fYV5UWp3sh+GBugNEvLfmjijuIjvGa6LIMiZprIbtTwmE+0iiully46DT2ZfGlC6QoW36FNEIxsifhPf+yFVelsDcnYaIBazwbRLIKXcwHp2jx+2TaxUL0p1oAUXwjew3QyLAeIu9YQ+muy+lmhi6CusgqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=P1RfsMEb; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1715010622; x=1715615422; i=markus.elfring@web.de;
	bh=H9sTmaUe+r3xoDCrpXo7q1l4R6zgCLudODMODzaJySI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=P1RfsMEbI6WI5DZVmZCjhlAGG17nCkZrsM2pxE9jgoX6OXUZmXJ1+F2FbJmP+BOt
	 RoWfy9GMi3LIO+fMOy/mPOdh094LVq30Y71TTRGRhZUYFgPxUobApnOFbsB8KYYGx
	 Nn3/SpewE14Us7iAJVv/lbKlSw0N4Pc1kPOsToIZAwpBspM6nAGxEf4lM74eNTgqf
	 bEKo+8O8dS5W/WL4Gg6MXLIQtatqQeh+gcyKCvJ009TchWeW102gKzvzlBDcD8AM+
	 gLYVxBBu4LcSHDz+VMsRarxP3r82kiucEd+txjQX2VjzEL+dOK7AqGzKWAJyg9bJ8
	 aPLGTSpouULGIuDh0w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M5j1c-1rxw3j4AP4-007l9k; Mon, 06
 May 2024 17:50:22 +0200
Message-ID: <45f6991d-1595-4ba1-956b-acfcbbdfe8de@web.de>
Date: Mon, 6 May 2024 17:50:19 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 2/2] ax25: Change kfree() in ax25_dev_free() to
 ax25_dev_put()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?Q?J=C3=B6rg_Reuter?= <jreuter@yaina.de>,
 Paolo Abeni <pabeni@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Lars Kellogg-Stedman <lars@oddbit.com>, Simon Horman <horms@kernel.org>
References: <cover.1715002910.git.duoming@zju.edu.cn>
 <53925353450dea9a705d67ad225b589e8508042c.1715002910.git.duoming@zju.edu.cn>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <53925353450dea9a705d67ad225b589e8508042c.1715002910.git.duoming@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YbeJ89qqt2nw8KnLHNWF0skZsoHi5qd1kuwRpt0DBunZK4csV0V
 zWBAkWyR0IcdmCCNgEuexDy+tb8yyZdhHPmgtylpJwBWORJY6SGAlQEIAoOBLDpVl1x+s+w
 yAd1KRp0oEr9Xx5y6k23CFfq+9wnZ2Wd4oP/RvZzpoZxr0IUbpXd7mlmGIzP9D8mub/PqYd
 mlo9vzqKRALUIW+QL1inw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IMt04jr/M9U=;H1eGqO+BBW3jUOXk2stzLFN+eog
 L+RgGRdGcqtQlntEPB9fuk3V1HW0lxR+KgCX1jgBCuOylADU9aOr35dvDYotD16I4BlLIjyqh
 g4fS6fyyN/jNx3fSQxP5cmA5qgrVmuJCSATNmGuSj1478F4DaUJP/GWyxp49isqDym6G8/qK3
 vcqTWngvjCNVfWsodLJ/6GeSKSVu/K1kz4aQodPU1GARlYfm+2WUud1kljw8UQCNlR5lOVU+B
 20yanfXneOFYaOFzuLyA6LtAYkEEThQLKhKbYP367CjgmY9Eo4HWzDXCaosBVHQmZgWENExba
 fz6fXGj2K7h9o1dpFYJPNYL7n+X1cUqyK5q3UBfhXJ95DvAuDRXKo1jubc9uKfCjEzg+QkMMD
 ttC1OUeRsDbRjp7WZjNzALqc/t3J0zLVan8UQmH8AwYF1pt1UssbL1jodbt4eXVDPohJuMRXy
 jJOb2U1Pg0wMeRyC7/ThM3czS/phRAfQmiK5AOWf1WM5AvPRD/dvFiXiH05DO2M588FZYFrn+
 0NOlMfNHilJc9vIpzNsmwUGJ2HIMoAs8RKfrzW/v5OXzuIIqt8HOenhh8M84yvhVl6smk6CqB
 i40J3XF86mqXc3RNuEgi+LN7+aS7lEoSvncWX34djQVC5nC8H5tkbe3ivnXA4jUY08vIFE43y
 YZS4F/rDy6IrCWUnmiUv7raGxyEi79HUAJc/RZJxY1M8qcV0RJvEItbH88MldXwJagDhxMxty
 Ss6bFwACuATiotdZtspMPVuDJXXVJGzpTxzn4GP6xsvvSgbD22rTkUhGa8NDA6OeVYMmZr6zM
 166wUZOK2Gv+8VFC88m3jx7WWwbOcAAr41GtPz28/BKlo=

=E2=80=A6
> Replace it with a ax25_dev_put() call instead.
=E2=80=A6
> ---
> Changes in v3:
>   - Make commit messages more clearer.
=E2=80=A6
> +++ b/net/ax25/ax25_dev.c
> @@ -188,16 +188,13 @@ struct net_device *ax25_fwd_dev(struct net_device =
*dev)
>   */
>  void __exit ax25_dev_free(void)
>  {
=E2=80=A6
> -	ax25_dev =3D ax25_dev_list;
> -	while (ax25_dev !=3D NULL) {
> -		s        =3D ax25_dev;
> -		netdev_put(ax25_dev->dev, &ax25_dev->dev_tracker);
> -		ax25_dev =3D ax25_dev->next;
> -		kfree(s);
> +	list_for_each_entry_safe(s, n, &ax25_dev_list, list) {
> +		netdev_put(s->dev, &s->dev_tracker);
> +		list_del(&s->list);
> +		ax25_dev_put(s);
>  	}
> -	ax25_dev_list =3D NULL;
=E2=80=A6

Can the increased application of the Linux list API be offered as
a separate update step?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.9-rc7#n81

Regards,
Markus

