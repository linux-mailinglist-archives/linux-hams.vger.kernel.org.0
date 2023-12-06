Return-Path: <linux-hams+bounces-11-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A640806BF6
	for <lists+linux-hams@lfdr.de>; Wed,  6 Dec 2023 11:33:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B98952819BE
	for <lists+linux-hams@lfdr.de>; Wed,  6 Dec 2023 10:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B0C30336;
	Wed,  6 Dec 2023 10:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2RXIR2ic"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA3D12B
	for <linux-hams@vger.kernel.org>; Wed,  6 Dec 2023 02:33:28 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-54c79cca895so9779a12.0
        for <linux-hams@vger.kernel.org>; Wed, 06 Dec 2023 02:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701858807; x=1702463607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09DI37Cq+VQrU+S9PP54JaC5ZxNfdGTjkQnCEA1LpAo=;
        b=2RXIR2icJTMw/+ACt8BOYRUIHJNcSiz8QclXIioynnuwGXsprpbjJN6m9Sj4TCToUK
         mECHcejtfILRUECewTRQfqyq+kOHNOd6c7kpvLi6oJxUUR/x3i7bIS8LcOUIXCWoUn/W
         ahmefwc9IIWNFgrWKKfQQVcvTyb/AutQyXpNfkd6sFcBxoq81RFOaQR5VK1imBmqOpft
         7MzJ0uUzBTsKUSo723Xm1mKsUmR2s445bHcqurlZLNuMXipzvVHwp6mpQUMYUwNWvUv/
         gwxknkeuOC9dyvyvKmAyOEEYxioTKG9nMqotJFvcsfBHybkWFC3jDVn5lr8G+NI//pAz
         bN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701858807; x=1702463607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09DI37Cq+VQrU+S9PP54JaC5ZxNfdGTjkQnCEA1LpAo=;
        b=LhUJKIewkHSQOf8mbI41J8emci32Rhxf7gV1MIh6U6vOIi+ELJJIFqMPJX2voQ3HS5
         G1uDIMpck0MXOytUF958d/gvBSEzK06OhbRPATmg5w9MXT0oNSGgBRd0kwW4+0nGHQIB
         TZPscH/IvKxf08+ioRe6zmVNy7zB3Prdm1lq4jHYsGcEjAhpKqh941eZ+EkBZ59BWKAE
         cI5uNmLEEoSugHmIVCOMf8vy55LBeCBki9y9PmHTFexvVHLxUsxqmEzyxv+g/Icod2gN
         1yjzQ1DwrIh5Ydct5ngx5bdYyW5qv6hxlorWEacVXbmQMa67YCeqwgkDo4a/a7fj17X5
         uOqw==
X-Gm-Message-State: AOJu0Ywas9qLiieCYxpsD6IzyTThJvK3wZQWGVO1o6HWbrHED0waBQ78
	V5uozCsWJum77R9JCm2jEuqk6XxEf/tjLRuNUZ5huw==
X-Google-Smtp-Source: AGHT+IGgsPQOvHd0HHZviyExDPpjEL4RdM9N55BTh8O12Jwv1ZA4HWaSazOM/4R4GfRXVUDTJmpGIqiyyw+YHDUsLKU=
X-Received: by 2002:a50:d744:0:b0:543:fb17:1a8 with SMTP id
 i4-20020a50d744000000b00543fb1701a8mr52085edj.3.1701858806381; Wed, 06 Dec
 2023 02:33:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206041332.GA5721@ubuntu>
In-Reply-To: <20231206041332.GA5721@ubuntu>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 6 Dec 2023 11:33:15 +0100
Message-ID: <CANn89i+uXB__Bx7HAJt1Dg-P-cWyQUQk1SshE0jHjcTdODS9_w@mail.gmail.com>
Subject: Re: [PATCH v2] net/rose: Fix Use-After-Free in rose_ioctl
To: Hyunwoo Kim <v4bel@theori.io>
Cc: ralf@linux-mips.org, imv4bel@gmail.com, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, linux-hams@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 5:13=E2=80=AFAM Hyunwoo Kim <v4bel@theori.io> wrote:
>
> Because rose_ioctl() accesses sk->sk_receive_queue
> without holding a sk->sk_receive_queue.lock, it can
> cause a race with rose_accept().
> A use-after-free for skb occurs with the following flow.
> ```
> rose_ioctl() -> skb_peek()
> rose_accept() -> skb_dequeue() -> kfree_skb()
> ```
> Add sk->sk_receive_queue.lock to rose_ioctl() to fix this issue.
>

Please add a Fixes: tag

> Signed-off-by: Hyunwoo Kim <v4bel@theori.io>
> ---
> v1 -> v2: Use sk->sk_receive_queue.lock instead of lock_sock.
> ---
>  net/rose/af_rose.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
> index 0cc5a4e19900..841c238de222 100644
> --- a/net/rose/af_rose.c
> +++ b/net/rose/af_rose.c
> @@ -1316,8 +1316,10 @@ static int rose_ioctl(struct socket *sock, unsigne=
d int cmd, unsigned long arg)
>                 struct sk_buff *skb;
>                 long amount =3D 0L;
>                 /* These two are safe on a single CPU system as only user=
 tasks fiddle here */
> +               spin_lock(&sk->sk_receive_queue.lock);

You need interrupt safety here.

sk_receive_queue can be fed from interrupt, that would potentially deadlock=
.

>                 if ((skb =3D skb_peek(&sk->sk_receive_queue)) !=3D NULL)
>                         amount =3D skb->len;
> +               spin_unlock(&sk->sk_receive_queue.lock);
>                 return put_user(amount, (unsigned int __user *) argp);
>         }
>
> --
> 2.25.1
>

