Return-Path: <linux-hams+bounces-151-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 599618B452F
	for <lists+linux-hams@lfdr.de>; Sat, 27 Apr 2024 10:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A54A1C222EE
	for <lists+linux-hams@lfdr.de>; Sat, 27 Apr 2024 08:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1219F43AB2;
	Sat, 27 Apr 2024 08:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d/gFI00e"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A0163BF
	for <linux-hams@vger.kernel.org>; Sat, 27 Apr 2024 08:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714207736; cv=none; b=LFL0GM1S2uvIBTGuV4psV/mZZmehkFgOK1cL5UZbnrGAo8fOfGjxvoWlUhiVxWkBmmiM+i+4xmFUCIz0w8rbretYTgz6nBQEzrOJB5xdUUWuQHxqc64Dz4BGiYGgXSCILMB90isdyxaXMk2K8KQ4QllYVllVVNdHtcH/71vVNBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714207736; c=relaxed/simple;
	bh=WXDRwb1qV5S/ZUy3Luc08sfOUJsbgQT5e1mrXwAQaeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Har4dndVBmTKmTEjUCE3Bcv6Jyoz+TyTzUCrxynjLKzvXmIPPOA3ftw/8E4qfi5ltYXWdcKI0e6Fx1nwG4mcdca9/oeHqsy35M+hK8DttUf62BXMsz14iL/9yDR7eCZp9YN3KbpRJoisg2kWYvCuPLFHMG04V7kYbHk0ZL6GiPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d/gFI00e; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso4471841a12.1
        for <linux-hams@vger.kernel.org>; Sat, 27 Apr 2024 01:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714207733; x=1714812533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n3U4TF5OcYavrhjA3ao/Jc6oNw0dz9hUJVNNp9zfCGQ=;
        b=d/gFI00eNkl1wjFMo0m5B6p0gn1tl+ma/UV4EVYoYcPAHIYXY4z2UUPvM96phwwjwP
         jmQHT5slodahMk33x3X94zEoP4DADqzkiuWr3Qv8YYzz33QITQyqQSlyV83OXUK9xFXj
         UF+T1DIJuwv9A/+ed0tLuUwQ7cwGAwB5ZAp8+G6v4iKMZX0NNLNi9kom6ff6vYoU6wJa
         MIu4s95UQ5JmEior//2leGoJMLJ3N2skdaelwH6Iaryk4BFaoxMc2rHf2RQ5Ue0Qrlhi
         LYcZodqIXavPoGjDbHzYWWdJnXig5pry0AreFTKCk78ypI/HU2ghXSMJDQsuAzfEqbgR
         6Mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714207733; x=1714812533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3U4TF5OcYavrhjA3ao/Jc6oNw0dz9hUJVNNp9zfCGQ=;
        b=ZPWozoyz8ODvu04LwVx04jMWb0x1e3XXP4I3OjibGvb3eZlpuNw1RtwycHNs6falI9
         7WtxRoNh1xHSobKjjob+VY2CvGPcXxHhE9UVNrJNuKPzRplXfAACQ01MSKebYipqLC0Q
         uupST8KVwVvBC3rTdkpEGHirCMVGydBYs2bnj1r3z02eRVYEuNlGD85doW1SfTvlDIJ2
         MBXdnBTM+xoaZKLyOY4aHT/EySACpl8YuQd/w4cDv1STWo49K72PkdI7ZYieEtd1j1fE
         lhYUk6OSF23nqpMDXbdt5JaBVJh+ukhYhtIdoA77QGhBOzdXSvDCWB3us9a/GopD3MgG
         WqbA==
X-Gm-Message-State: AOJu0Yyco8gpuQ15ierzLsI3tcqYMrflV7PgE2zrPQPWSQFnZa6rftK/
	iiRK7Mf3wYXTIZ41U+cD1BkhxRQDP1yAdTQvXMm/XI0iq0Q2s12Q1irquZY91EdCJ30SXxF0HTt
	h
X-Google-Smtp-Source: AGHT+IE6ywVNseVTxU4e6Lt7vMhQVJo80xXTDLLE7utyE06gLR9ZeNivRUM14R7/tzw6WXIYtuIW/A==
X-Received: by 2002:a50:99c6:0:b0:571:c12a:b508 with SMTP id n6-20020a5099c6000000b00571c12ab508mr1252534edb.9.1714207733282;
        Sat, 27 Apr 2024 01:48:53 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id k13-20020a05640212cd00b005726f00914csm293598edx.92.2024.04.27.01.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 01:48:53 -0700 (PDT)
Date: Sat, 27 Apr 2024 11:48:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lars Kellogg-Stedman <lars@oddbit.com>,
	Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org
Subject: Re: [PATCH RFC] ax25: Fix (more) netdev refcount issues
Message-ID: <472cb9d6-708e-4acd-b938-e12c3a19591e@moroto.mountain>
References: <6kant25vimoq36blyb5sjqgq3xxjcqbqeskbgf5zihdho3iulb@ni2lvhiytfrg>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6kant25vimoq36blyb5sjqgq3xxjcqbqeskbgf5zihdho3iulb@ni2lvhiytfrg>

The commit message needs a Fixes tag.

Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")

Let me add Duoming Zhou to the CC list.  That commit is two years old
now.  This sort of bug should have been caught by basic testing, right?
Could you confirm that that's actually the commit which breaks it?

regards,
dan carpenter

On Fri, Apr 26, 2024 at 05:29:40PM -0400, Lars Kellogg-Stedman wrote:
> Folks,
> 
> I'm posting the following patch here before sending it to netdev in the
> hopes that someone can take a look at the change and comment on the
> correctness. This resolves all of the issues I've been experiencing
> recently with ax.25.
> 
> ...
> 
> When closing a socket, the ax.25 code releases references via
> netdev_put() and ax25_dev_put(). In the case when the socket was the
> result of an incoming connection, these references were never allocated in
> the first place, causing underflows in both ax25_dev->refcount and
> ax25_dev->dev->refcnt_tracker->untracked. This would result in a variety of
> errors:
> 
> - After an initial connection and then again after several subsequent
>   connections:
> 
>       refcount_t: decrement hit 0; leaking memory.
> 
> - After several subsequent connections:
> 
>       refcount_t: underflow; use-after-free.
> 
> A typical call trace for the above two issues would look like:
> 
>     Call Trace:
>     <TASK>
>     ? show_regs+0x64/0x70
>     ? __warn+0x83/0x120
>     ? refcount_warn_saturate+0xb2/0x100
>     ? report_bug+0x158/0x190
>     ? prb_read_valid+0x20/0x30
>     ? handle_bug+0x3e/0x70
>     ? exc_invalid_op+0x1c/0x70
>     ? asm_exc_invalid_op+0x1f/0x30
>     ? refcount_warn_saturate+0xb2/0x100
>     ? refcount_warn_saturate+0xb2/0x100
>     ax25_release+0x2ad/0x360
>     __sock_release+0x35/0xa0
>     sock_close+0x19/0x20
>     [...]
> 
> On reboot, the kernel would get stuck in an infinite loop:
> 
>     unregister_netdevice: waiting for ax1 to become free. Usage count = 0
> 
> The attached patch corrects all three of the above problems by ensuring
> that we call netdev_hold() and ax25_dev_hold() for incoming connections.
> 
> Signed-off-by: Lars Kellogg-Stedman <lars@oddbit.com>
> ---
>  net/ax25/ax25_in.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
> index 1cac25aca63..35a55ad05f2 100644
> --- a/net/ax25/ax25_in.c
> +++ b/net/ax25/ax25_in.c
> @@ -411,6 +411,8 @@ static int ax25_rcv(struct sk_buff *skb, struct net_device *dev,
>  	ax25->state = AX25_STATE_3;
>  
>  	ax25_cb_add(ax25);
> +	netdev_hold(ax25_dev->dev, &ax25->dev_tracker, GFP_ATOMIC);
> +	ax25_dev_hold(ax25_dev);
>  
>  	ax25_start_heartbeat(ax25);
>  	ax25_start_t3timer(ax25);
> -- 
> 2.44.0
> 
> -- 
> Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
> http://blog.oddbit.com/                | N1LKS

