Return-Path: <linux-hams+bounces-688-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A321C0617F
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 13:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6985E19A2F3A
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 11:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DD22C2345;
	Fri, 24 Oct 2025 11:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="THBKORSJ"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8333C2C21FB
	for <linux-hams@vger.kernel.org>; Fri, 24 Oct 2025 11:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761306610; cv=none; b=JSJ1gw9k5Ku9AR5YPhnGHzT5leIlesJIcCbcT9hhmXf0USbvbyLLTa3AZA6GpG7DK08X3S0h4iCPiLvYTDdr4kLHzYyP7XH9aZEZKjPs32wmh7s4soF5NDoWfqpzpZT6/n4yvODKwOjggwDyIJzlDCmtrzQnHxbHNm4q7uKwCe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761306610; c=relaxed/simple;
	bh=JyNPoOflrd09KImJzGn+Oa6R2et+UXAyI1HgrMWnlrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=emzo+q+2UdlBOmtMr310vy9FNFDm6eInAyZ6zp2TYPm5MfCpCOffU1WmGGcUPVmGLKq+05zAbxmj5KZdWth4QYbSS2uTv/V5ZE4z2M/HJuiIwKMFzLXSzs7IJ3htpc4ywHxHm6cmK93RFNbhP7WXme6jbnYgvVnUBEFDDXw8cZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=THBKORSJ; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-63e19642764so2066057d50.1
        for <linux-hams@vger.kernel.org>; Fri, 24 Oct 2025 04:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761306607; x=1761911407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPu7vN1calUWS9Gz7jrsKnKSCyFmaW2kq8XMxDii/Ww=;
        b=THBKORSJHmb2r0wEkEg4vLDxBhzZNXJ06lh/v4ndf7RrKUw6f7FFFU5n+wbq7o+ONa
         lyR3opdpVcoz34/rnDcpAHwd+ovhsoxjbIXgyfp0zWu0chNnDxPnKmt8Pa2rGPoxGFM3
         S9tKWGvPHRex65AJ7zDwUQR18+Or/TDmtLbvcXrqUrxXMZTdcVASJ8MNZm+cPisyrGt8
         ymsZwaVkrdBtVWn6Z+nTb+L2p2qxsoBgxUQpR2FHhBLR5+1llqVV3Q/d+8n5bJAThEWZ
         wDqY/TigG7de52PcbeFDWcri0KF2ngxwd5+Sm3sCDVfGCbbNs34MKsvxQDaRmy2GnOY5
         psOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761306607; x=1761911407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPu7vN1calUWS9Gz7jrsKnKSCyFmaW2kq8XMxDii/Ww=;
        b=OKvIgkBePBRn2kLQOlsG4okNH2VjardV3n0oSzHbrikFNeGSn2pNzD8Dm8LcFKwyTq
         DSnf/nxgidRxOoJ0aEKnXCN1RvJq5Euz6MBx1pYlm/jK4GmdZ2VTw28IWrHqB4mJQWH6
         gUZbHzpNTgvXnH9od6txP6It/SnDdAVr2OlVGVs1EYldVFhyfzINRQGopBQYoo098uD3
         AAYZv2g9+S7k3jrHZwk04t+lUIdrgyhG+ULYp87eNb7zNIRoftA93HzxJ9tGNz9TGyXe
         USE/JImzhNO2ZLZkkccWRc/jO3b1ZzVL232Jbik+eZAC4UTd4WEDVlSbGvYSTVYeJWUT
         nx8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzTRE9WQbJvU7v9bX/L8bu/i26HFVuzBqgfQCn/DQlFjkCC+V6VvWk3reGrzB3QUPEZxxSStPq86Df@vger.kernel.org
X-Gm-Message-State: AOJu0YyyMb0m/2KWu+UkWNviycmMT7KhWUozIvbNc6dazQEomZh4npg0
	0pkzGVVf1gwkFAWj8P32NUXM1G8epyDAsz5D989GVZyBGT1ZHBJItuyWbQXuejh3mCrq+2E3+yO
	NdxKhXkYbZqNpYtOcCV4oH1EOqq7FV7ADyizQCseG
X-Gm-Gg: ASbGncsTHOjxsoPZ2o2kOr5i5D6lATneT4IUiRZuG+1q/UIqYEdTH99wxTuhwV7nue8
	AAQAxK6iAgdhf+sYt0HR2cp+9aBPhi6YtRRC/HJRVJNN+VWmuEfaaPy8XXrde3gtT8iL5DrHGEo
	LsDadMKIDkBTGumHXzLO8Zm6r8h8AucDBKoOmTbWF8eUy2+E8+G/avm9we6PDDGzfKVbiaP+P9H
	QRU6iM9UAgizphBQ25/2/W3rqw2QARWYNVy1LWy1P8aLb8vq9dDpCIbcArqfXIswrQggQ==
X-Google-Smtp-Source: AGHT+IFiXZPFoW3XumCylfcB7j13+foGPrt/PBXHdC1d5im6TR7Pl10kLZ/EEoKE1RNBjalMg75qFAT+YfmAMkkUFZ0=
X-Received: by 2002:a05:690e:1c08:b0:63e:4150:4a0b with SMTP id
 956f58d0204a3-63e41504b4cmr12608126d50.64.1761306607028; Fri, 24 Oct 2025
 04:50:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251024093901.1202924-1-lizhi.xu@windriver.com>
In-Reply-To: <20251024093901.1202924-1-lizhi.xu@windriver.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 24 Oct 2025 04:49:55 -0700
X-Gm-Features: AS18NWCyXWglYAph4MhDJQMx_rCfCfaeUc5A_R94Ms8hmdKV9GKUS6s1Tfgfq_I
Message-ID: <CANn89iKxjOPyP7h-8bCtx1SwCM1FaXDAXfcdCW7uXxKsy49L3w@mail.gmail.com>
Subject: Re: [PATCH V3] net: rose: Prevent the use of freed digipeat
To: Lizhi Xu <lizhi.xu@windriver.com>
Cc: davem@davemloft.net, horms@kernel.org, jreuter@yaina.de, kuba@kernel.org, 
	kuniyu@google.com, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, 
	syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 2:39=E2=80=AFAM Lizhi Xu <lizhi.xu@windriver.com> w=
rote:
>
> There is no synchronization between the two timers, rose_t0timer_expiry
> and rose_timer_expiry.
> rose_timer_expiry() puts the neighbor when the rose state is ROSE_STATE_2=
.
> However, rose_t0timer_expiry() does initiate a restart request on the
> neighbor.
> When rose_t0timer_expiry() accesses the released neighbor member digipeat=
,
> a UAF is triggered.
>
> To avoid this UAF, defer the put operation to rose_t0timer_expiry() and
> stop restarting t0timer after putting the neighbor.
>
> When putting the neighbor, set the neighbor to NULL. Setting neighbor to
> NULL prevents rose_t0timer_expiry() from restarting t0timer.
>
> syzbot reported a slab-use-after-free Read in ax25_find_cb.
> BUG: KASAN: slab-use-after-free in ax25_find_cb+0x3b8/0x3f0 net/ax25/af_a=
x25.c:237
> Read of size 1 at addr ffff888059c704c0 by task syz.6.2733/17200
> Call Trace:
>  ax25_find_cb+0x3b8/0x3f0 net/ax25/af_ax25.c:237
>  ax25_send_frame+0x157/0xb60 net/ax25/ax25_out.c:55
>  rose_send_frame+0xcc/0x2c0 net/rose/rose_link.c:106
>  rose_transmit_restart_request+0x1b8/0x240 net/rose/rose_link.c:198
>  rose_t0timer_expiry+0x1d/0x150 net/rose/rose_link.c:83
>
> Freed by task 17183:
>  kfree+0x2b8/0x6d0 mm/slub.c:6826
>  rose_neigh_put include/net/rose.h:165 [inline]
>  rose_timer_expiry+0x537/0x630 net/rose/rose_timer.c:183
>
> Fixes: d860d1faa6b2 ("net: rose: convert 'use' field to refcount_t")
> Reported-by: syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com
> Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> ---
> V1 -> V2: Putting the neighbor stops t0timer from automatically starting
> V2 -> V3: add rose_neigh_putex for set rose neigh to NULL
>
>  include/net/rose.h   | 12 ++++++++++++
>  net/rose/rose_link.c |  5 +++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/include/net/rose.h b/include/net/rose.h
> index 2b5491bbf39a..33de310ba778 100644
> --- a/include/net/rose.h
> +++ b/include/net/rose.h
> @@ -167,6 +167,18 @@ static inline void rose_neigh_put(struct rose_neigh =
*rose_neigh)
>         }
>  }
>
> +static inline void rose_neigh_putex(struct rose_neigh **roseneigh)
> +{
> +       struct rose_neigh *rose_neigh =3D *roseneigh;
> +       if (refcount_dec_and_test(&rose_neigh->use)) {
> +               if (rose_neigh->ax25)
> +                       ax25_cb_put(rose_neigh->ax25);
> +               kfree(rose_neigh->digipeat);
> +               kfree(rose_neigh);
> +               *roseneigh =3D NULL;
> +       }
> +}

You have not even compiled this patch.

Also please carefully read Documentation/process/maintainer-netdev.rst

Resending after review
~~~~~~~~~~~~~~~~~~~~~~

Allow at least 24 hours to pass between postings. This will ensure reviewer=
s
from all geographical locations have a chance to chime in. Do not wait
too long (weeks) between postings either as it will make it harder for revi=
ewers
to recall all the context.

Make sure you address all the feedback in your new posting. Do not post a n=
ew
version of the code if the discussion about the previous version is still
ongoing, unless directly instructed by a reviewer.

The new version of patches should be posted as a separate thread,
not as a reply to the previous posting. Change log should include a link
to the previous posting (see :ref:`Changes requested`).

