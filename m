Return-Path: <linux-hams+bounces-30-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1215A86F538
	for <lists+linux-hams@lfdr.de>; Sun,  3 Mar 2024 14:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD90C1F2239E
	for <lists+linux-hams@lfdr.de>; Sun,  3 Mar 2024 13:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F7359B60;
	Sun,  3 Mar 2024 13:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FBMKzgTu"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7719C14F
	for <linux-hams@vger.kernel.org>; Sun,  3 Mar 2024 13:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709473998; cv=none; b=r1PPuI52CqmIUOflzb6Tt5Slb3/zri20TXqZL0/fhrgBb068rkPO357+htD96JQhmaIjtTENqO80i09MXs3b7TGHjoMAiVXTyIVT7ous2AFf6/n9iEDFdUqLZAB1ZZubHAzsK/T0YF7xkPqyBa2zuhmsajBSnGGLjaMKE2QCA9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709473998; c=relaxed/simple;
	bh=m9WfCAt/9mCpF3w2n1SiZvJlN2JVM0mWtPd73kqnbIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RoyYhOiAMpxpkPAsZHhyK760BZxSmDybfp54wv59tNKfg+AkOjjCRMUQav9l6n3Ac6MCGuAMDwQibRlE8WZXX85lArcHwMqo6sMi9jgHz5IP83HSFWhtVwBOWtaXzy+HNfKsVGkbWsNLbl/PEnK7L1RBTtXfmCqrZ/ewrQWUGlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FBMKzgTu; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-565223fd7d9so15286a12.1
        for <linux-hams@vger.kernel.org>; Sun, 03 Mar 2024 05:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709473995; x=1710078795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mnrk0wQk2IOhQbi+YVbVoXdcHS2VPAuCcAxwDINWAIc=;
        b=FBMKzgTum4afzJnaWyLec9vm7iCL79oOqNgSqvEIxqE8Kzf/SRgkfUwbP84K2SSOio
         NtfSOW1tqSFJEurlJJLyJCkuNCuWQAT6YsjyYudN0FGZE467/c6zs6EzHhc+2Fir/UJ6
         KC4EoxtZZDSIuoPEvsCvF7HLYUzpswP+pngIR4E8/i0eEKN4JXv9nPkSDbFIPMDgO47H
         3Ue1Cz9PSL/c7sCiMbcRwcnJG/8ir2WVu2e0T35OTHgUWsUEWUbjT4bYXc7yg/Jmob2N
         dwpW/iy11vm1fUk83trdCYgj49xL8Quexbdh7hu/TO6BSHAHNen3yITnrC5mCjnCvjf6
         fr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709473995; x=1710078795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mnrk0wQk2IOhQbi+YVbVoXdcHS2VPAuCcAxwDINWAIc=;
        b=nH+lzvN2s6V4pBW9dRpdlVsQW7Zt/H+LOzj94wAMNN8HZhRucdanvMaZRnwXG+Wayv
         7/CEoT6qFyqYQcMzOUVEBNy0WEZ+TBj33CU1Ts05KfyWTMvw8sgaGGMl+bS0VTRwVDD4
         tcOIge0696DZRj/0z6/n38kBXaitVUJZhEwqTvawba+t6tBAuxwslcxfEQxLAOCZxlHP
         I/7/+cbBAXUqp0DFvn4J8iGBp0cZBkHvWXXT5XMxQXCv/uRxh+r48HAxmvw0XQ1LUHk7
         rxepatO4s7VaxScUYp3GKfFXHki07GlnREZdZLhhF329xgNvAu3omZBSwgJWB6gLXd1c
         iPHA==
X-Forwarded-Encrypted: i=1; AJvYcCUMP0gUfrQbBZvPWRAsX0if8Umqq18zat/rg5OPBEcDpu81SfmsLqlnRFRW8EvXQxUhLa8jT3T4WRSno8BoyoGFWPZXEe6WcFB6aQ==
X-Gm-Message-State: AOJu0Yy1E7SHZGY4R1yV0sNr/efXtpRMdLl5ORjCQLmrOgbjbmB7hz1i
	Gak/8MqhPh419RQNQsQKBdaKtSeKXCP2O/0wVRoFX8xIGUA5Fmjish5HGqwk9Qz7+U7F3KEpylk
	vqOjJ6Rhcur+ODdBrLB+j7HXG0/05lOtAgV7C
X-Google-Smtp-Source: AGHT+IGm6U2vFqkDC1iJlypsmF5quRLbtAk1KeFZnVmMmjjpFw/WI0WgD+eiHeIPaYKOLxyRAxvAjWmbR8uqqt6iYWM=
X-Received: by 2002:a05:6402:5215:b0:566:f626:229b with SMTP id
 s21-20020a056402521500b00566f626229bmr160373edd.7.1709473994912; Sun, 03 Mar
 2024 05:53:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <000000000000b69bf20612bf586e@google.com> <tencent_ECF3CC90A7DB86E312FF464F09BF2EEAAE06@qq.com>
In-Reply-To: <tencent_ECF3CC90A7DB86E312FF464F09BF2EEAAE06@qq.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 3 Mar 2024 14:53:03 +0100
Message-ID: <CANn89i+fJis6omMAuEmgkFy7iND97cA8WecRSVG6P=z15DpHnQ@mail.gmail.com>
Subject: Re: [PATCH] skbuff: fix uninit-value in nr_route_frame
To: Edward Adam Davis <eadavis@qq.com>
Cc: syzbot+f770ce3566e60e5573ac@syzkaller.appspotmail.com, davem@davemloft.net, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 3, 2024 at 2:24=E2=80=AFPM Edward Adam Davis <eadavis@qq.com> w=
rote:
>
> [Syzbot reported]
> BUG: KMSAN: uninit-value in nr_route_frame+0x4a9/0xfc0 net/netrom/nr_rout=
e.c:787
>  nr_route_frame+0x4a9/0xfc0 net/netrom/nr_route.c:787
>  nr_xmit+0x5a/0x1c0 net/netrom/nr_dev.c:144
>  __netdev_start_xmit include/linux/netdevice.h:4980 [inline]
>  netdev_start_xmit include/linux/netdevice.h:4994 [inline]
>  xmit_one net/core/dev.c:3547 [inline]
>  dev_hard_start_xmit+0x244/0xa10 net/core/dev.c:3563
>  __dev_queue_xmit+0x33ed/0x51c0 net/core/dev.c:4351
>  dev_queue_xmit include/linux/netdevice.h:3171 [inline]
>  raw_sendmsg+0x64e/0xc10 net/ieee802154/socket.c:299
>  ieee802154_sock_sendmsg+0x91/0xc0 net/ieee802154/socket.c:96
>  sock_sendmsg_nosec net/socket.c:730 [inline]
>  __sock_sendmsg net/socket.c:745 [inline]
>  ____sys_sendmsg+0x9c2/0xd60 net/socket.c:2584
>  ___sys_sendmsg+0x28d/0x3c0 net/socket.c:2638
>  __sys_sendmsg net/socket.c:2667 [inline]
>  __do_sys_sendmsg net/socket.c:2676 [inline]
>  __se_sys_sendmsg net/socket.c:2674 [inline]
>  __x64_sys_sendmsg+0x307/0x490 net/socket.c:2674
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcf/0x1e0 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x63/0x6b
>
> Uninit was created at:
>  slab_post_alloc_hook mm/slub.c:3819 [inline]
>  slab_alloc_node mm/slub.c:3860 [inline]
>  kmem_cache_alloc_node+0x5cb/0xbc0 mm/slub.c:3903
>  kmalloc_reserve+0x13d/0x4a0 net/core/skbuff.c:560
>  __alloc_skb+0x352/0x790 net/core/skbuff.c:651
>  alloc_skb include/linux/skbuff.h:1296 [inline]
>  alloc_skb_with_frags+0xc8/0xbd0 net/core/skbuff.c:6394
>  sock_alloc_send_pskb+0xa80/0xbf0 net/core/sock.c:2783
>  sock_alloc_send_skb include/net/sock.h:1855 [inline]
>  raw_sendmsg+0x367/0xc10 net/ieee802154/socket.c:282
>  ieee802154_sock_sendmsg+0x91/0xc0 net/ieee802154/socket.c:96
>  sock_sendmsg_nosec net/socket.c:730 [inline]
>  __sock_sendmsg net/socket.c:745 [inline]
>  ____sys_sendmsg+0x9c2/0xd60 net/socket.c:2584
>  ___sys_sendmsg+0x28d/0x3c0 net/socket.c:2638
>  __sys_sendmsg net/socket.c:2667 [inline]
>  __do_sys_sendmsg net/socket.c:2676 [inline]
>  __se_sys_sendmsg net/socket.c:2674 [inline]
>  __x64_sys_sendmsg+0x307/0x490 net/socket.c:2674
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcf/0x1e0 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x63/0x6b
>
> [Fix]
> Let's clear all skb data at alloc time.

This can not be serious.

>
> Reported-and-tested-by: syzbot+f770ce3566e60e5573ac@syzkaller.appspotmail=
.com
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>


Fix net/netrom instead.

