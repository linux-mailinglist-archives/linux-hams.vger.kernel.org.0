Return-Path: <linux-hams+bounces-12-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C53806CAC
	for <lists+linux-hams@lfdr.de>; Wed,  6 Dec 2023 11:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A20BB20D99
	for <lists+linux-hams@lfdr.de>; Wed,  6 Dec 2023 10:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E5530343;
	Wed,  6 Dec 2023 10:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=theori.io header.i=@theori.io header.b="O40FOdX0"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28949C
	for <linux-hams@vger.kernel.org>; Wed,  6 Dec 2023 02:52:56 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d06d4d685aso25567415ad.3
        for <linux-hams@vger.kernel.org>; Wed, 06 Dec 2023 02:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theori.io; s=google; t=1701859976; x=1702464776; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ndrwArs8BHo8pksNnEzWW3TY5l3AocyhYh91ziw2ze0=;
        b=O40FOdX0PoqzQbdvswfe+d1hmTB4w5mMtlSDN1FHPb6staAWCamh2xgbhItoYx80WF
         zfIPQ8ITK+RZuYAN66YsNH9GqgxUHBu8Dy9sNEruT1n9Ckre0/WSvfg/Oi9L0QuZer/k
         amMcL1YjPjhT+MaC8auqWi+bNZ0gdoZW4cH7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701859976; x=1702464776;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndrwArs8BHo8pksNnEzWW3TY5l3AocyhYh91ziw2ze0=;
        b=Pjs8RB34E/Kx4Bp3OW93F9R/UWq8KCXPbG9xmK4eBQSaTm27EdzdnmXY9ddqAElUxm
         BtP14AU8GFVLIDXGG5PkpNDx94HijyOa0Bt+80u+kumDChoZlHX3fMepT+4t4dALjrid
         p9UzPnylk6wAudoS/ap/+JFaLJz8Tjx8DWufI2FwDCBNZjeIxwa7nYmyaIMTRfR71TpN
         u6RKQ2Lj9D+uRGWNdCQfyBoQdVo4Pj+8ZTallLis/ujKgavyi7VryC85z9p/Z5q2V6/0
         ywoqiq8IOQjNSwZiY3KipzGQiHlBdB+fkU4rjzoeqnbh13JVuLtotKVQYdbXfjKl6TKa
         IU8w==
X-Gm-Message-State: AOJu0YzrfcScBCXrrplss63WZMqpRQglHwjUIu3U2fecxzJ4WkJngiyL
	FWzu69pGaEcQq6orTMp/vVbtqQ==
X-Google-Smtp-Source: AGHT+IHtIqYOh4gBdtnYlkJhpMem0iNAPeNF7Z7OT0ZleUKPPQV/bm2kmvG4doInosNedFaRAtmSgA==
X-Received: by 2002:a17:903:2343:b0:1d0:6ffd:f20a with SMTP id c3-20020a170903234300b001d06ffdf20amr454445plh.96.1701859976087;
        Wed, 06 Dec 2023 02:52:56 -0800 (PST)
Received: from ubuntu ([211.219.71.65])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902eec600b001d0a6f31519sm5144370plb.188.2023.12.06.02.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 02:52:55 -0800 (PST)
Date: Wed, 6 Dec 2023 02:52:51 -0800
From: Hyunwoo Kim <v4bel@theori.io>
To: Eric Dumazet <edumazet@google.com>
Cc: ralf@linux-mips.org, imv4bel@gmail.com, davem@davemloft.net,
	kuba@kernel.org, pabeni@redhat.com, linux-hams@vger.kernel.org,
	netdev@vger.kernel.org, v4bel@theori.io
Subject: Re: [PATCH v2] net/rose: Fix Use-After-Free in rose_ioctl
Message-ID: <20231206105251.GA7219@ubuntu>
References: <20231206041332.GA5721@ubuntu>
 <CANn89i+uXB__Bx7HAJt1Dg-P-cWyQUQk1SshE0jHjcTdODS9_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89i+uXB__Bx7HAJt1Dg-P-cWyQUQk1SshE0jHjcTdODS9_w@mail.gmail.com>

Dear,

On Wed, Dec 06, 2023 at 11:33:15AM +0100, Eric Dumazet wrote:
> On Wed, Dec 6, 2023 at 5:13 AM Hyunwoo Kim <v4bel@theori.io> wrote:
> >
> > Because rose_ioctl() accesses sk->sk_receive_queue
> > without holding a sk->sk_receive_queue.lock, it can
> > cause a race with rose_accept().
> > A use-after-free for skb occurs with the following flow.
> > ```
> > rose_ioctl() -> skb_peek()
> > rose_accept() -> skb_dequeue() -> kfree_skb()
> > ```
> > Add sk->sk_receive_queue.lock to rose_ioctl() to fix this issue.
> >
> 
> Please add a Fixes: tag
> 
> > Signed-off-by: Hyunwoo Kim <v4bel@theori.io>
> > ---
> > v1 -> v2: Use sk->sk_receive_queue.lock instead of lock_sock.
> > ---
> >  net/rose/af_rose.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
> > index 0cc5a4e19900..841c238de222 100644
> > --- a/net/rose/af_rose.c
> > +++ b/net/rose/af_rose.c
> > @@ -1316,8 +1316,10 @@ static int rose_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
> >                 struct sk_buff *skb;
> >                 long amount = 0L;
> >                 /* These two are safe on a single CPU system as only user tasks fiddle here */
> > +               spin_lock(&sk->sk_receive_queue.lock);
> 
> You need interrupt safety here.
> 
> sk_receive_queue can be fed from interrupt, that would potentially deadlock.

I want to change spin_lock to spin_lock_irqsave, is this okay?


Regards,
Hyunwoo Kim

> 
> >                 if ((skb = skb_peek(&sk->sk_receive_queue)) != NULL)
> >                         amount = skb->len;
> > +               spin_unlock(&sk->sk_receive_queue.lock);
> >                 return put_user(amount, (unsigned int __user *) argp);
> >         }
> >
> > --
> > 2.25.1
> >

