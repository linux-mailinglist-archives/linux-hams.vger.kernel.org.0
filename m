Return-Path: <linux-hams+bounces-685-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8FBC054CA
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 11:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9DEB94EEF48
	for <lists+linux-hams@lfdr.de>; Fri, 24 Oct 2025 09:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AF0305E31;
	Fri, 24 Oct 2025 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4D48iXqt"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36381207A22
	for <linux-hams@vger.kernel.org>; Fri, 24 Oct 2025 09:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761297599; cv=none; b=p2pM8UzICYyPiSWUs9Z9TU7m8D6pd/NH+LtQ4/yLX3BSAuLiiBLuAsVy7m3rJpPELYq/GXslB39xENumHsNbX+zEQH0pkyXDMEG65FdU9LQhxAnnv3ct3D2gt0Aoj4RvLuoi5+VQ29ik68wp0rFnG7MPqqz0n19xUKi7spa02/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761297599; c=relaxed/simple;
	bh=tj9sY++LZkzvHe1f64tI96u/mkvypwjhfSQvuJM76Hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2joVtgRYJ1mSciVmHgV1aVtWhUHXDoIBVTTtaPoIFyNd1A+BhFX9CS1KSvswfX36Ykp86Da0OJwl0KPinMJNmC8HCpeirZ/yGxdnGpcMrDx7mQknW3RM64pJPaD3HIIjay6uvo2+2oRvTTPk4rSftlgzGI7y4QIf2daV2fMNI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4D48iXqt; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-88e4704a626so188129185a.0
        for <linux-hams@vger.kernel.org>; Fri, 24 Oct 2025 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761297597; x=1761902397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twcKB1hm/Ie/5PoJp3KEG1N7Jytbx89hSg/ow35Xqp8=;
        b=4D48iXqtJ/CDumG4qSxPqy8EIgOclzgrsybfSh6StSQDn8gyMu2k1KSlU1bMDpGpHN
         tP5krKDZ9dj6WObINDjRKw2lW4CkU659Ro+XNSZHtVUUVTdl1pXpM5NxMlsywW6FnrtF
         59qBU/fCu9y5ctyEHzLKeDmKj23xZ6/3mETCnZWE6PLX8JtHEP1T8WIHkPYbG0ADiF79
         I4fDj5tD7JHALxCFR/iGKJ/DcxfRsGQ8VM+RSWZd+G4KYguF2xx+Ovxd9iXLO+Mmss2q
         HZkwQQR8Fy0Pk/iRkX1XESW7XlbWCV+jHa1iYxNm2NKO4RS8x7aOZM8OHSWPH8egpA2o
         VtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761297597; x=1761902397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twcKB1hm/Ie/5PoJp3KEG1N7Jytbx89hSg/ow35Xqp8=;
        b=vKSV5EABOB9djXQcIH2nNC+Ul3BK712e7+XP17WJe53C9l2ka+haNzI88N70SJAD4t
         sq82mevUlZUR1FWFvA0KQhBiWFdA0Urg57zleDrJQW2D94oUcQsc1jt0xwb2IdkXfLUN
         A3e9FPIhfqt2Ve5HOZ2HyNXwDcGqmu2soFmQkNQu//cT3W5RNbmiEFgQI0IuzB0DgpC5
         OkU/k0Z7euT/3/4SxbdPMPUAZIOVpugIhalUHvuChYz02lD6AUoff4BB515D0D42Dlzz
         pjvDznJGmME0MtFqy68BlDS/rn8vCXdCxr2+Z+09WX3A0D2nLCL76w6WBb4TYlH6l3xO
         8xNA==
X-Forwarded-Encrypted: i=1; AJvYcCW1kCs+LAjP4lz8m0WyNXjCV3bKibhoiMP/15pgtWzzRmEBr3eDs7q0sBLG28pt/oykxoljBidvmCV0@vger.kernel.org
X-Gm-Message-State: AOJu0YzzjDGNc4OO2n5T4/QKH/pbZt2tyrtSnZ1nLZ62eL8VbZWntrDp
	ZoY0sK/8CUna9G2WArKwTllq5FkmqLoXl3rm3Mdo65lIarvRBQLN2yPTi2K0WixXCSvy/ZVUHL+
	llaFKeq1X/yL7BCHFTKGG4ujJS4AB84+/tzP0nqe+
X-Gm-Gg: ASbGncsUsUz5NguewiuRvBtRqcju7AjgCzF9bG0SnsPXZ8hqW5ihnLQgCl8ZIJjzqV1
	uPycj3J8hjFy455A1mzxGuK1caZtkmO9HcHRbp45rnHWZo8LSibzG2HM6phRnog5FlIo7h0GmpU
	T8ZDNSxCh1c4UR1/SV/6TJXk7ReSuwkDMmCOH1XabSZAeQi0hwor6ElwCS6hjo1SrwjQFWUHuMp
	1Yir3KSiG9JU9bZaYpwZfHdy/dt/IQ0oL/nlmLOoDnSA3MdnEuNPbVJukZ0/Otxf6poPQ==
X-Google-Smtp-Source: AGHT+IELThhQ8ILVw5nuo5976ycY9bB+OZ/LcmK2ueQZ09CwFSYkjJaTgg0wCVkT81qczhOxurRBwaO1v9J6HO5i8hI=
X-Received: by 2002:a05:620a:31a4:b0:893:b99:7114 with SMTP id
 af79cd13be357-8930b997cabmr2102715285a.82.1761297596672; Fri, 24 Oct 2025
 02:19:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251024090630.1053294-1-lizhi.xu@windriver.com>
In-Reply-To: <20251024090630.1053294-1-lizhi.xu@windriver.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 24 Oct 2025 02:19:45 -0700
X-Gm-Features: AS18NWDEKpX6DxQFX-E95G22l0XMZHGoUhV3IsKo9AGOEPWAGImfkcQ19Hdmzz8
Message-ID: <CANn89iKS3ZOSva0EUjLFD+CmJeT=JgX3-7bHxgHChMMQpx+7=g@mail.gmail.com>
Subject: Re: [PATCH V2] net: rose: Prevent the use of freed digipeat
To: Lizhi Xu <lizhi.xu@windriver.com>
Cc: kuniyu@google.com, davem@davemloft.net, horms@kernel.org, jreuter@yaina.de, 
	kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, 
	syzbot+caa052a0958a9146870d@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 2:06=E2=80=AFAM Lizhi Xu <lizhi.xu@windriver.com> w=
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
>
>  include/net/rose.h   | 1 +
>  net/rose/rose_link.c | 5 +++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/include/net/rose.h b/include/net/rose.h
> index 2b5491bbf39a..ecf37c8e24bb 100644
> --- a/include/net/rose.h
> +++ b/include/net/rose.h
> @@ -164,6 +164,7 @@ static inline void rose_neigh_put(struct rose_neigh *=
rose_neigh)
>                         ax25_cb_put(rose_neigh->ax25);
>                 kfree(rose_neigh->digipeat);
>                 kfree(rose_neigh);
> +               rose_neigh =3D NULL;

What is the purpose of this added line ?

@rose_neigh is a local variable. Setting it to NULL while this
function no longer uses it is
going to be optimized out by the compiler. Even if not optimized, this
has no effect.


>         }
>  }
>
> diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> index 7746229fdc8c..524e7935bd02 100644
> --- a/net/rose/rose_link.c
> +++ b/net/rose/rose_link.c
> @@ -43,6 +43,9 @@ void rose_start_ftimer(struct rose_neigh *neigh)
>
>  static void rose_start_t0timer(struct rose_neigh *neigh)
>  {
> +       if (!neigh)
> +               return;

This will never fire. callers would have crashed already it neigh was NULL.

> +
>         timer_delete(&neigh->t0timer);
>
>         neigh->t0timer.function =3D rose_t0timer_expiry;
> @@ -80,10 +83,12 @@ static void rose_t0timer_expiry(struct timer_list *t)
>  {
>         struct rose_neigh *neigh =3D timer_container_of(neigh, t, t0timer=
);
>

Can you explain (in a comment) why this is needed ?
What is the precise scenario you want to avoid ?

> +       rose_neigh_hold(neigh);
>         rose_transmit_restart_request(neigh);
>
>         neigh->dce_mode =3D 0;
>
> +       rose_neigh_put(neigh);

I am pretty sure this patch fixes nothing at all.

>         rose_start_t0timer(neigh);
>  }
>
> --
> 2.43.0
>

