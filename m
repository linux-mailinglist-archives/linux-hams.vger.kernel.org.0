Return-Path: <linux-hams+bounces-32-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B1686F969
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 06:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46A531C20D0A
	for <lists+linux-hams@lfdr.de>; Mon,  4 Mar 2024 05:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EB263D9;
	Mon,  4 Mar 2024 05:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZaV8S7NY"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E43E612E
	for <linux-hams@vger.kernel.org>; Mon,  4 Mar 2024 05:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709529147; cv=none; b=VUr7i+UL7bqcNpMqYsb48tVC9smZUTuDMSEsTUqveVmHvIawKyFfF2yHICdjXG3x7TXo2xrpEsomSrGtxXvuPImfumw/rS5GFlDHb0D0oif1jXxsO4DaLhztCBPsF0o4KB+fw/irJg+I5JSrq6fZCz63SY8AEgABtvW61WDbtck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709529147; c=relaxed/simple;
	bh=RkZR6AQGNumxUNeiUTcE2zH9/MxQFnrzWkHwzZzIdoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HepLoyt8U/tm+s36eHRxTsa2HZbMlhFC0IvUQKWkwpNY5CO7U79qStwWgll9wvEjp39Mq8fWtQHMVWbyGoOkULgG45IAzVpUDzxA7ea+2dMUfGTFH51QvZ0hIJe2xE8fXrPBO0MRwM3t+vbiEnwvHfaKbCJv3T+qFa0A5f+0Awc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZaV8S7NY; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5654ef0c61fso22510a12.0
        for <linux-hams@vger.kernel.org>; Sun, 03 Mar 2024 21:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709529144; x=1710133944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUR3SXQYlMBJ+S1TsUhop+VTYRh3FUB5752NRTIEWf8=;
        b=ZaV8S7NYxn1hackDu4FBfGIe5dr0W7lzNLYC+HxKvJW8Rv7+Z6gqkKP/z1fMQeC1dn
         E+ffuop3JvrDNaB8h7a7lWGQrJnqNHNoyFBg4WxtXKRfrrl+nIaXOqlcCCSiYPBKgtUB
         xHSF6/FfJPZL0Hp7Sw1ELSuz3vqvJESBp4QoWLSSp8iUxaWw0Tuw5q+cvHZBikgYbqrp
         mYhSX1bg1mDFTq2Csop5Y2rvIHtjvH1InfrpLhKy3I/daktYp3CYZJbsLqJPEOjpLPjU
         Y9uWWmav2sX/xCgyK1myD3ijjJbMHvoC44AdUnJfA7RPbPeRvW/yUSFV8U+zRx8lyQlH
         4rhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709529144; x=1710133944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUR3SXQYlMBJ+S1TsUhop+VTYRh3FUB5752NRTIEWf8=;
        b=r+mMp8GjxvlKKRtxb9GHAttFNcl7zwtwTnZkj1AAGNwCWbcUiHhtDzchL1i6PBeY24
         0WqARof2AqQVTLCPbXtu8DniTzLxJzLK6xD+LBh9Nt9/vMrBcAZmIalpESSfEZ+0yexJ
         AdVZ3x+fVm00z8TEhB7uxAr4i2NEBmnv86Ca6CMEWyiJxA8w6Qg+NX5Iyf307i27jyiD
         HG3i/+YzHYeataKHKbBwi10hCrt+oBVfNqktWCtxV1vy3GMAbj+LDwFSUT1D/l2laf92
         OjZWy4UfXVOiZKk6r4Hpxxmr9o44s7TAh4gtNkpYuseyzN7NByFsU7LimiJBQbmjEnQZ
         XqSg==
X-Forwarded-Encrypted: i=1; AJvYcCUiA0i/tD62jGVmBBQFwnYLslclx/eBLjMbsccR2P/GMOM/G9QYH3U+JhjmcHG+R9R6F4czWqBVk/dsus79k298Klpi4ghG327yJg==
X-Gm-Message-State: AOJu0YzzFzRKszRN+OGTVg5J3GZfBQpUFhifO5udsRc1Jm0tKWX56iY1
	d0Lvb+sV0VLkLCWij+RZFHtZHru8XbOhiW5/Skp7w+cnKftRSslmOi4AQh7rdzOtLu3RWrjByIC
	yhqCmWNxxd/zWdPcmcK5X88LLXI4U75M99IWr
X-Google-Smtp-Source: AGHT+IFk/yOw56LrMBCcjw5FkqWSmRn9c37C4hrrela5SKpQ0FiUwD8BBhxVSWUFxhxJtKdGT7I9Ik2nnrrNCi8cpxY=
X-Received: by 2002:a05:6402:3496:b0:566:ff41:69f1 with SMTP id
 v22-20020a056402349600b00566ff4169f1mr182364edc.3.1709529144406; Sun, 03 Mar
 2024 21:12:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANn89i+fJis6omMAuEmgkFy7iND97cA8WecRSVG6P=z15DpHnQ@mail.gmail.com>
 <tencent_FD84E7D8C6D392F1C66E89816EF36ED48C06@qq.com>
In-Reply-To: <tencent_FD84E7D8C6D392F1C66E89816EF36ED48C06@qq.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 4 Mar 2024 06:12:11 +0100
Message-ID: <CANn89i+cfMWX_ybtP-VHX7PgLT-mwuUkYMuqsnUwZ3jki8oTcA@mail.gmail.com>
Subject: Re: [PATCH] net/netrom: fix uninit-value in nr_route_frame
To: Edward Adam Davis <eadavis@qq.com>
Cc: davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	ralf@linux-mips.org, syzbot+f770ce3566e60e5573ac@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 6:05=E2=80=AFAM Edward Adam Davis <eadavis@qq.com> w=
rote:
>
> [Syzbot reported]
>
> [Fix]
> Let's clear all skb data at alloc time.
>
> Reported-and-tested-by: syzbot+f770ce3566e60e5573ac@syzkaller.appspotmail=
.com
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>  net/core/skbuff.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index edbbef563d4d..5ca5a608daec 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -656,6 +656,7 @@ struct sk_buff *__alloc_skb(unsigned int size, gfp_t =
gfp_mask,
>          * to allow max possible filling before reallocation.
>          */
>         prefetchw(data + SKB_WITH_OVERHEAD(size));
> +       memset(data, 0, size);


We are not going to accept such a change, for obvious performance reasons.

Instead, please fix net/netrom/nr_route.c

Thank you.

