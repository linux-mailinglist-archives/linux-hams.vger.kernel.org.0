Return-Path: <linux-hams+bounces-15-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BAC8070F9
	for <lists+linux-hams@lfdr.de>; Wed,  6 Dec 2023 14:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D013D1C20DFE
	for <lists+linux-hams@lfdr.de>; Wed,  6 Dec 2023 13:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B1E3A8C3;
	Wed,  6 Dec 2023 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uE4+2Ydy"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C749212B
	for <linux-hams@vger.kernel.org>; Wed,  6 Dec 2023 05:35:46 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-54c79cca895so11277a12.0
        for <linux-hams@vger.kernel.org>; Wed, 06 Dec 2023 05:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701869745; x=1702474545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Im4te3doPcBdDN6YcqkA4euXVxY1womiD8wyj2T42ZQ=;
        b=uE4+2YdykgMAsIiGUdgNAdIPvhFH58hN1dYh1HhwvywkiYurYPP9HNSfVJbrP2CS2V
         q2td8jQtjPBmqeqnXK8Oo4Gg5b0eSR3zu8NtEQRh2Qv1IGVucOvIGbFufGawIuN6YvAW
         +qP6CszPCr4N/orAclZKMCkNIkVMeDXAbndSKxk0lYRuclWLMDC0sl3JYtg4ediWC/Pb
         wMK9wJ03Vmw5ldGOdy+Q9AsensMkoYgZxylNQaXlfWYcz6yC/EYsEdU5mPzfY1iWCXuV
         SBkQV5+OSyCAg+FsknEr1K6keC+Elxy16fbasWo++W9fHlrZr2MEIHRnU4ktdFI+59HS
         bHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701869745; x=1702474545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Im4te3doPcBdDN6YcqkA4euXVxY1womiD8wyj2T42ZQ=;
        b=Efe3tOw+Q9Vd7S1xhQ1/97bfImOUd7dD2ipR2lLax603GfxHfhXDsO2RFTGeDRpoDX
         fLtlyrRX8X+BeHYlE4tQJZk7ehCqNhkLKTgKeEKcR7Hky+ZJ4t9tgm68VwX+AaMD8+C5
         g2VsC0BkpQ7RZ7gq+JVMYwf3nkrJa1uUyAeyams1Xdu19S7oHHl5L+MWcegvPv2vTqL2
         4MTDwr+/+l7dJdYb9amqZ+BNkErxI2qR+FA8KxUPpGBZBqyY41AKUGlldefKBY/0gf1N
         eZH4seGe4DqYk304naoPjZkx8o49ktwLJrT/GBdaVfAE0Efvy98Oa1Bk8hs67eg4OPsq
         Up5A==
X-Gm-Message-State: AOJu0YxYxS+ppEZV0hHiEf0NvAbke5deCxEuEaIfYPFwaPl30lZ/GY0b
	+MGnYNCj2D0SmaIz8VFbdxbZThl9CH0pKnJKardssA==
X-Google-Smtp-Source: AGHT+IFVWaTn5Cn5z8vtWP45gBT5PuRkLJMlUGFLszeNzI64WItliEwivO23OkLO2QFLkXNBt4f3Ez4ZHbVScgpMvS4=
X-Received: by 2002:a50:aacf:0:b0:54b:321:ef1a with SMTP id
 r15-20020a50aacf000000b0054b0321ef1amr85650edc.6.1701869745046; Wed, 06 Dec
 2023 05:35:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206111329.GA9888@ubuntu>
In-Reply-To: <20231206111329.GA9888@ubuntu>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 6 Dec 2023 14:35:31 +0100
Message-ID: <CANn89iKFqxdCgDJTM-AXVZBBaXmv=Y51K1cfA48QEriUV5QT=w@mail.gmail.com>
Subject: Re: [PATCH v3] net/rose: Fix Use-After-Free in rose_ioctl
To: Hyunwoo Kim <v4bel@theori.io>
Cc: ralf@linux-mips.org, imv4bel@gmail.com, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, linux-hams@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 12:13=E2=80=AFPM Hyunwoo Kim <v4bel@theori.io> wrote=
:
>

> ---
>  net/rose/af_rose.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
> index 0cc5a4e19900..7ff76bf3f56e 100644
> --- a/net/rose/af_rose.c
> +++ b/net/rose/af_rose.c
> @@ -1316,8 +1316,10 @@ static int rose_ioctl(struct socket *sock, unsigne=
d int cmd, unsigned long arg)
>                 struct sk_buff *skb;
>                 long amount =3D 0L;
>                 /* These two are safe on a single CPU system as only user=
 tasks fiddle here */

Can you remove this stale and confused comment ?

Thanks.

