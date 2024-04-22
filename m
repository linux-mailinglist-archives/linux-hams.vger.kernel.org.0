Return-Path: <linux-hams+bounces-119-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B9D8ACD3A
	for <lists+linux-hams@lfdr.de>; Mon, 22 Apr 2024 14:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21EC72857AB
	for <lists+linux-hams@lfdr.de>; Mon, 22 Apr 2024 12:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BF514F122;
	Mon, 22 Apr 2024 12:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QKVetmT4"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2640714EC6B
	for <linux-hams@vger.kernel.org>; Mon, 22 Apr 2024 12:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713790046; cv=none; b=a0abvb9BiHfQyrJT+oI48r1Xsdt1Y+n4aMkciDLmQihSHUHU6hWvuO7CzyEowumy9Yt4tSe/PT62XgsQZ+NDO7/Y+Ci3ZRXWG6p79j7WaCKiYzDc5W4hu3uksZCTQA65vbaCLbDoI4jonqPXfrexU180L8qYJyykyMe+Hlaiqmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713790046; c=relaxed/simple;
	bh=xK0xpJYoCLIITlC+CsYauUdtz62QeVeHRGmWzCiWf5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+CdMQ9HriqsTkOnf0U7wm6VqGVVqEIR/+819EAUln35G/dbuwSUNiIOxSK6lN3a2dk6AstDgE8VhYOT8BUFZEOK5PMCyDw0GwRZbvHszT5TkVx8EtYfPhTpwJ8gpvWIy7JyI+TzLcXXtB82oNQLbeYmg5OSz3/5GxqATCwwqMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QKVetmT4; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-518a56cdc03so5292930e87.1
        for <linux-hams@vger.kernel.org>; Mon, 22 Apr 2024 05:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713790042; x=1714394842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tAq2BIio/WgpUEPdT8jPUBANtNcgUg2oMhI7FrVaEB0=;
        b=QKVetmT4Qiv2LzM5bk/Rk+DI4aimjEbt6joAxLnYRDLX/FzEMNGF8e7jXAlwsrauwA
         c0xHKqmpHy76N/L5OvbNpQ9raifbYLglRIU6o0U0C47ElT+tlsLhwzs8RywixlGPoKoT
         BG2v89BzOhSKDFCFBbnEZsljWgBsLovuefUO0IenfK5GCcq3ZLK0NxUPLRJ2oHoVVTua
         YPBlZ9cyYeMVcpGP+TANdwTW7jxweUyLoKH3IonGyLckFiGZ1k2H6OF55duhqQWGq77g
         iKxLlyouFq8MohJmDXXj9VIzCMVkDB9FcPmUxoRzOyvl/Xv4+rdFnN0L94sombBSJL9J
         Diaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713790042; x=1714394842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAq2BIio/WgpUEPdT8jPUBANtNcgUg2oMhI7FrVaEB0=;
        b=YQWBTwG7ka3tmyF4LiA2zrFNDsWLrB0cdyudmJ08o0fa2EI7T/aVhgMB4E6l9ihzZl
         TuO5d47/3UIdDt64D9/80vx454VyC6XACHZuQojN1zX/nlj0kmnrjc+YZVrqfxmBUT+s
         GAOWNDJV8UT8Y0wSZLA2fDzOqULvwlFDaEZvk29om2niVxsCnTuhF8DLdkH8k+6O8SlG
         Qz8iv9JjH3+RYO+Umpg83jR2jn9H8jBq0I6yxZeEXNgkIXjXiT/YAMItq6mluBbFLeWN
         ewn2686OVg/+wQUSenLhww7I9KiylrgYb9OaGp0AJfXG2bo91YUjfjvcgY5EmLQZqn8J
         8T4w==
X-Forwarded-Encrypted: i=1; AJvYcCXp5efxMbFqzZazG9VZ2GJNyd94oMY2wUXeOddPMNOYgZthvXqyusZ5t0s0+Pio4MZAAnGFDgtizQ+lKmWn1qx1jXaiPNtuTpG8KQ==
X-Gm-Message-State: AOJu0Yxrj1DKKDxfL3BPgGZShPU1MemYVzh4kwhIAHcA7YUn7SKwN+zE
	wqWEHFkf6Af4+Svp2TzF708HLZXBRQMPhHwLjxdHgaqufGzgFQaE/qdHpptG6Bc=
X-Google-Smtp-Source: AGHT+IEMH8RihJNVGuEx0Di87sDBlhXnXygmj8MwWRwVHNTMdA9GYNd7ZTy8dfvJApZvwx5iiRjYLw==
X-Received: by 2002:a05:6512:20c3:b0:51a:c3a6:9209 with SMTP id u3-20020a05651220c300b0051ac3a69209mr5156044lfr.68.1713790039896;
        Mon, 22 Apr 2024 05:47:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id r25-20020a170906351900b00a55b5c365dfsm1248156eja.199.2024.04.22.05.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 05:47:19 -0700 (PDT)
Date: Mon, 22 Apr 2024 15:47:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeongjun Park <aha310510@gmail.com>
Cc: ajk@comnets.uni-bremen.de, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, linux-hams@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+8e03da5d64bc85098811@syzkaller.appspotmail.com
Subject: Re: [PATCH] hams: Fix deadlock caused by unsafe-irq lock in sp_get()
Message-ID: <bac3fb0d-2810-496d-b3ef-26a7f208ec51@moroto.mountain>
References: <20240418173037.6714-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418173037.6714-1-aha310510@gmail.com>

On Fri, Apr 19, 2024 at 02:30:37AM +0900, Jeongjun Park wrote:
> 
> read_lock() present in sp_get() is interrupt-vulnerable, so the function needs to be modified.
> 
> 
> Reported-by: syzbot+8e03da5d64bc85098811@syzkaller.appspotmail.com
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
>  drivers/net/hamradio/6pack.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
> index 6ed38a3cdd73..f882682ff0c8 100644
> --- a/drivers/net/hamradio/6pack.c
> +++ b/drivers/net/hamradio/6pack.c
> @@ -372,12 +372,13 @@ static DEFINE_RWLOCK(disc_data_lock);
>  static struct sixpack *sp_get(struct tty_struct *tty)
>  {
>  	struct sixpack *sp;
> +	unsigned long flags;
>  
> -	read_lock(&disc_data_lock);
> +	flags = read_lock_irqsave(&disc_data_lock);

This doesn't compile.  At least build test your patches.

regards,
dan carpenter


