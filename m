Return-Path: <linux-hams+bounces-613-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9F0B40148
	for <lists+linux-hams@lfdr.de>; Tue,  2 Sep 2025 14:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52F3C1B60B43
	for <lists+linux-hams@lfdr.de>; Tue,  2 Sep 2025 12:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCA72D248E;
	Tue,  2 Sep 2025 12:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1mZV8eX"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB0D2C11D4;
	Tue,  2 Sep 2025 12:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817478; cv=none; b=VrkfrA6B/LIvcYCAmMsHMoLMwo55IeadbQMN9alAbwQPmFi7nzH+MY7Tw2QU2hvFcHdD7VLbDUlAs5Jzmp7rzK1AxHmi1XiiRaoGOE0aRgNIfnaG/qJ+68rfJz9cFx2Oflq6hLeDI2vBFxOK/V0Zb20JBFWNFWzLrfgLDQKqumY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817478; c=relaxed/simple;
	bh=/sPo9pBECcAhfAWSoMxXdNszGRgWmyiT18Zblnhx6cE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FJuBgMbzFX0fZcjkiFXD3DWBs0Gg6ptmSXRbgbq+nU/d35ONpiyP8hgASfVpX8jNme3GG0X/DUNu9Y+k3Cfey/CN1aPJ71wvOUyhy4fmTAVR4ze8cNw0o/5ZkLpJJ9thv7u14RcxpTIePAqC9nod7Qmv1uMezUA61rA6aH3DYm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1mZV8eX; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-71d603b60cbso43549487b3.1;
        Tue, 02 Sep 2025 05:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756817475; x=1757422275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6icDGL2eboy4iH2vHFB7luOYPIhqNwF9zuAvyeOQRE=;
        b=N1mZV8eXkptChABcM8zUjrj7T2mH6gw5LNCpIq/67uHZrEZ12KmV87ZlgiytGM5Bpn
         v2q3WsFtx1Ka0M4ZqaUMGP8W3Slf1+xONLoMkzmP6PYTE4jFuGa1QVhiY1d3kOzF9yIT
         tcHwazJgTLULOqs26LPK/0dZQWan6zOcebHI3hi65j3KRJnS7TfE+nm3T4j2Ud7gG4aN
         cjD6o4mCCLTpPlpD9m1Na8KszkweNe82j6dPSYcVBJcBrighwWMENusT4qvnF9FdS6ks
         A1zPnQIrr/8JPxWSsK21Bcel8ZcdeZ79rUl0hj/gMN6rStgwHuJmvTWxN/kZPrPZzqJj
         6mUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817475; x=1757422275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j6icDGL2eboy4iH2vHFB7luOYPIhqNwF9zuAvyeOQRE=;
        b=gxnVj5oEKWyR7UlEQfcgopd+oT4sZWojvR/RuJI033x0OP18W5NoTRfVficYj/FyQr
         JSnS9tDDTgq3q7fXQqjxCRHrLNBRd7CjDYSW3VQrkKkWHU5sEnurzxZZHXETuPI+kgAO
         4sYKny6fLQ4GBM5xwGgB3TUsg3sGbjhX+Xe5d3uplMMZVc2XrnLPFQKmbNV2g5ZS4mVf
         +aNFuNg14ouusfN2FCzfH0plTRap0p1z3bhq9GPxhyZRYY9f5rn8Bt312Zl6Yhx9r+zK
         VQqXu+URLoqr3snETZJ+dvhxHsrQI3/YeLjB4h1/QNBGanVQMUXRy9mpykBQdqSdABF7
         krug==
X-Forwarded-Encrypted: i=1; AJvYcCUZjRv/0zPuY79NmyKwRsHYbTOtkq7BwowylUN8o46jPURrUOtR6k6p+IlhDFku2jwhXJI2EcLZzwGa@vger.kernel.org, AJvYcCVnkeqhCG24MTUzTvcr3KYDzPB6BS/OOJw0zH033nG7vLyh8nNpY0+WSLhvoe/AZkfpuAKMcE4c@vger.kernel.org
X-Gm-Message-State: AOJu0YyMBtqhaP/hAQVfeTzFmDv+v41LafHo4ZyedQsSgd7dAaXaS+kH
	GZmKVeYOpInJ5WJ7P1AK6RNGUcSUUyOyivbqej5nIHYjrQ/3+qu0zSa2oUxQuAWM8JHFF027AAZ
	ICxblR4MCzK7NRxmzLw9AteW0mDlekng=
X-Gm-Gg: ASbGncuX+Z/SwD9BhMJ0SfdTOIIvSi5rrCOq/8TCNSYYXN3PIJ92PL6g/c1gjJ9quZs
	hWYT+mghQL5GsBT+D13/Irrio/VRRTHeXElYxePJjz5L9366AbkWGC7eW5JexF14qtTpGXyJGnV
	sZQhgU+xQ3w26rRpKTsvsYTQX0lAVjwHDbaxn3+yZaQxXVcQr945a044Z6ZXWUtCWY41aDtXYlp
	DfatnjdOMZFrZujeT5yvxSzqoGD8Z9YsZMAcb4G
X-Google-Smtp-Source: AGHT+IEtnhPU08XOUXQR38kXEuvcTgLjz2WIxazWOnjF9F79cPTDROkUjUjTUCgVRpG8kNmxVDUUJXMrONIWX8Tw5zQ=
X-Received: by 2002:a05:690c:31e:b0:720:4ec:3f89 with SMTP id
 00721157ae682-7227656e59fmr117999387b3.46.1756817474612; Tue, 02 Sep 2025
 05:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902124642.212705-1-edumazet@google.com>
In-Reply-To: <20250902124642.212705-1-edumazet@google.com>
From: Dan Cross <crossd@gmail.com>
Date: Tue, 2 Sep 2025 08:50:38 -0400
X-Gm-Features: Ac12FXwG7A40jMC0LewRdFjT7Fmmy7jauWCqrAKXLloEW2o2kWcCpWa9nT41iLs
Message-ID: <CAEoi9W7ni8r6yZY6okZb3JHLHHbvXOtJmB9VXurykx0Nuio0LQ@mail.gmail.com>
Subject: Re: [PATCH net] ax25: properly unshare skbs in ax25_kiss_rcv()
To: Eric Dumazet <edumazet@google.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	eric.dumazet@gmail.com, Bernard Pidoux <f6bvp@free.fr>, Joerg Reuter <jreuter@yaina.de>, 
	linux-hams@vger.kernel.org, David Ranch <dranch@trinnet.net>, 
	Folkert van Heusden <folkert@vanheusden.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 8:46=E2=80=AFAM Eric Dumazet <edumazet@google.com> w=
rote:
> Bernard Pidoux reported a regression apparently caused by commit
> c353e8983e0d ("net: introduce per netns packet chains").
>
> skb->dev becomes NULL and we crash in __netif_receive_skb_core().
>
> Before above commit, different kind of bugs or corruptions could happen
> without a major crash.
>
> But the root cause is that ax25_kiss_rcv() can queue/mangle input skb
> without checking if this skb is shared or not.
>
> Many thanks to Bernard Pidoux for his help, diagnosis and tests.
>
> We had a similar issue years ago fixed with commit 7aaed57c5c28
> ("phonet: properly unshare skbs in phonet_rcv()").

Please mention the analysis done here in the change description:
https://lore.kernel.org/linux-hams/CAEoi9W4FGoEv+2FUKs7zc=3DXoLuwhhLY8f8t_x=
Q6MgTJyzQPxXA@mail.gmail.com/#R

Reviewed-by: Dan Cross <crossd@gmail.com>

> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: Bernard Pidoux <f6bvp@free.fr>
> Closes: https://lore.kernel.org/netdev/1713f383-c538-4918-bc64-13b3288cd5=
42@free.fr/
> Tested-by: Bernard Pidoux <f6bvp@free.fr>
> Signed-off-by: Eric Dumazet <edumazet@google.com>
> Cc: Joerg Reuter <jreuter@yaina.de>
> Cc: linux-hams@vger.kernel.org
> Cc: David Ranch <dranch@trinnet.net>
> Cc: Dan Cross <crossd@gmail.com>
> Cc: Folkert van Heusden <folkert@vanheusden.com>
> ---
>  net/ax25/ax25_in.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
> index 1cac25aca637..f2d66af86359 100644
> --- a/net/ax25/ax25_in.c
> +++ b/net/ax25/ax25_in.c
> @@ -433,6 +433,10 @@ static int ax25_rcv(struct sk_buff *skb, struct net_=
device *dev,
>  int ax25_kiss_rcv(struct sk_buff *skb, struct net_device *dev,
>                   struct packet_type *ptype, struct net_device *orig_dev)
>  {
> +       skb =3D skb_share_check(skb, GFP_ATOMIC);
> +       if (!skb)
> +               return NET_RX_DROP;
> +
>         skb_orphan(skb);
>
>         if (!net_eq(dev_net(dev), &init_net)) {
> --
> 2.51.0.318.gd7df087d1a-goog
>

