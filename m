Return-Path: <linux-hams+bounces-217-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B018BD0A0
	for <lists+linux-hams@lfdr.de>; Mon,  6 May 2024 16:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9FB61C22ECC
	for <lists+linux-hams@lfdr.de>; Mon,  6 May 2024 14:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B474154446;
	Mon,  6 May 2024 14:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EADyn62c"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ED31534FD
	for <linux-hams@vger.kernel.org>; Mon,  6 May 2024 14:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715006790; cv=none; b=dB4r5DNmDpXvNdpvse+DqTHKScUisDADGAeRugW2V+ea+ngeEC2VPqSQ7T/J5fdgf941pq0IVuFJ4gE1PNoXkZsCMpcdtEse9xr5cgDMrrnEB5WEkS/Q3CXB2krqcFG33KVC+0wJSvWtS/agYX4DTUVbOz/22y+fV0aT2RVuu5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715006790; c=relaxed/simple;
	bh=C5ndl1lC8CL0XtsuR5ib2Bk7fPRJ97FYkLf8X6C5eVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3VBFwQoiAw4hWQxbZ94B2V1u2sraTZ/vdI7Othy4RybiOFRASkCfWCUu6CZ5dC3XKkRHEmzEOGzgp06edABxbMVxb6+4zy2tMclW/mBax9xdzkMNKZiWmzNKx+8e/rrR7q0uZDTgcMCb6pAvH8RXyD5lbZmf+ustbw977hANcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EADyn62c; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41c1b75ca31so14478555e9.2
        for <linux-hams@vger.kernel.org>; Mon, 06 May 2024 07:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715006785; x=1715611585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m7OBu1r2Z+saah5jk3wO64dx/25d9VmAszp5iej3gKE=;
        b=EADyn62cXJtGpv3wr3RN2pPVaV6H6454d7gv3wZ6YZ6+cZ5KND2mD6OXcd/K9139LY
         1NDZzKXl1uEASe2+pqd3pptYB7lgNAq0/rYrbfrRTwwiFxabZmicIZnuogOI45vJiXbT
         Lk0cjoQatCpd4Zyu32z9nZgymKANHz/6IWu+DdDPkBC9WpD0KHObAy0QXhCkzd1OUgpw
         j0XF0auDyRIaeBoZ61d7d6zpHoC2jN2RZXGbFe2QjACUB4euicOHH3MxVPqt1KVdBjHy
         5jteD2W/jjDAvbonhmH8oAaLqMmn4ABUMIrD61yThgCABHFPGJqaUNDQO1C/Ae40+hdD
         5/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715006785; x=1715611585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7OBu1r2Z+saah5jk3wO64dx/25d9VmAszp5iej3gKE=;
        b=kfoMuf5l3SF8eSzuxTds/faeFkfKKvdDpKjMYj8JFdFBNit4JFNmOgVcqGbFxNwZsw
         FUwtTBxkR/R2ioswpx0TqINufKZ6DYd0ck+XfD/kDaPijlbTqMV/YwDbOW8QOqN8o0US
         XaSMuhLNi6Czrst6J9ytpbfGm/89S7OCGPjV5Y+ej/SHSDq8CoVABzyTBf5t5p5vzMlk
         OZqpyWMWAf+4xxW/kaUFtse8sehBdICiKhd52ITAd3Lf6IR1rS2TNyBTzulyDjTSXe3p
         7diCvHCyo2EODA4qA/njuXGQGml1XmF7rGg4ApxBar+UveWN9KjBjruu+MpoY588csM+
         xl6g==
X-Forwarded-Encrypted: i=1; AJvYcCXdAp5io4wlSJ3DZQAXFleOAiomXq1S6sBZcSi3Dqaqh9cEZKh17/hVBLKpWLqVgk06VocS2pVesQaEs/T6nN4tGiH+GB6Z5YooXQ==
X-Gm-Message-State: AOJu0Yy5Ge6qsutHyv0gHo88Nxdw9e24VjpBDL2rxRJXGDAU2hYHo7la
	iLB7vLKIEizRAbuwQal6W+IB2rY0HVikU/gkaKH39gnfrW8T/+igT7QeFu6tACc=
X-Google-Smtp-Source: AGHT+IHg1boR+fa1p1v2qPPcugyDsbkJgWtZXVkIxTd+sDyVX6MGR9zuE7B/BOKJ/0F83GNAkxSMUA==
X-Received: by 2002:a05:600c:35c7:b0:416:3f85:d49 with SMTP id r7-20020a05600c35c700b004163f850d49mr8630415wmq.18.1715006785041;
        Mon, 06 May 2024 07:46:25 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d59a3000000b0034def22f93csm10934601wrr.69.2024.05.06.07.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 07:46:24 -0700 (PDT)
Date: Mon, 6 May 2024 17:46:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hams@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org,
	edumazet@google.com, davem@davemloft.net, jreuter@yaina.de,
	horms@kernel.org, Markus.Elfring@web.de, lars@oddbit.com
Subject: Re: [PATCH net v3 1/2] ax25: Fix reference count leak issues of
 ax25_dev and net_device
Message-ID: <818218ce-4055-4c7b-b4f4-aa7e0d2db4b5@moroto.mountain>
References: <cover.1715002910.git.duoming@zju.edu.cn>
 <8338a74098bc1aafbca14d4612a10d6930fcef1b.1715002910.git.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8338a74098bc1aafbca14d4612a10d6930fcef1b.1715002910.git.duoming@zju.edu.cn>

On Mon, May 06, 2024 at 10:08:34PM +0800, Duoming Zhou wrote:
> The ax25_addr_ax25dev() exists a reference count leak issue of the
> object "ax25_dev" and the ax25_dev_device_down() exists reference
> count leak issues of the objects "ax25_dev" and "net_device".
> 
> Memory leak issue in ax25_addr_ax25dev():
> 
> The reference count of the object "ax25_dev" can be increased multiple
> times in ax25_addr_ax25dev(). This will cause a memory leak so far.
> 
> Memory leak issues in ax25_dev_device_down():
> 
> The reference count of ax25_dev is set to 1 in ax25_dev_device_up() and
> then increase the reference count when ax25_dev is added to ax25_dev_list.
> As a result, the reference count of ax25_dev is 2. But when the device is
> shutting down. The ax25_dev_device_down() drops the reference count once
> or twice depending on if we goto unlock_put or not, which will cause
> memory leak.
> 
> There is also a reference count leak issue of the object "net_device",
> when the ax25 device is shutting down. The ax25_dev_device_down() drops
> the reference count of net_device one or zero times depending on if we
> goto unlock_put or not, which will cause memory leak.
> 
> In order to solve the above issues, use kernel circular doubly linked
> list to implementate ax25_dev_list. As for ax25_addr_ax25dev() issue,
> it is impossible for one pointer to be on a list twice. So add a break
> in ax25_addr_ax25dev(). As for ax25_dev_device_down() issues, increase
> the reference count of ax25_dev once in ax25_dev_device_up() and decrease
> the reference count of ax25_dev and net_device after ax25_dev is removed
> from the ax25_dev_list.
> 
> Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
> Changes in v3:
>   - Use kernel list to implementate ax25_dev_list.
>   - Solve reference count leak issues in ax25_dev_device_down().
> 
>  include/net/ax25.h  |  4 ++--
>  net/ax25/ax25_dev.c | 36 ++++++++++++------------------------
>  2 files changed, 14 insertions(+), 26 deletions(-)
> 
> diff --git a/include/net/ax25.h b/include/net/ax25.h
> index 0d939e5aee4..92c6aa4f9a6 100644
> --- a/include/net/ax25.h
> +++ b/include/net/ax25.h
> @@ -216,7 +216,7 @@ typedef struct {
>  struct ctl_table;
>  
>  typedef struct ax25_dev {
> -	struct ax25_dev		*next;
> +	struct list_head	list;
>  
>  	struct net_device	*dev;
>  	netdevice_tracker	dev_tracker;
> @@ -330,7 +330,7 @@ int ax25_addr_size(const ax25_digi *);
>  void ax25_digi_invert(const ax25_digi *, ax25_digi *);
>  
>  /* ax25_dev.c */
> -extern ax25_dev *ax25_dev_list;
> +static struct list_head ax25_dev_list;
>  extern spinlock_t ax25_dev_lock;
>  
>  #if IS_ENABLED(CONFIG_AX25)
> diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
> index 282ec581c07..fbaaba0351e 100644
> --- a/net/ax25/ax25_dev.c
> +++ b/net/ax25/ax25_dev.c
> @@ -22,11 +22,11 @@
>  #include <net/sock.h>
>  #include <linux/uaccess.h>
>  #include <linux/fcntl.h>
> +#include <linux/list.h>
>  #include <linux/mm.h>
>  #include <linux/interrupt.h>
>  #include <linux/init.h>
>  
> -ax25_dev *ax25_dev_list;
>  DEFINE_SPINLOCK(ax25_dev_lock);
>  
>  ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
> @@ -34,11 +34,13 @@ ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
>  	ax25_dev *ax25_dev, *res = NULL;
>  
>  	spin_lock_bh(&ax25_dev_lock);
> -	for (ax25_dev = ax25_dev_list; ax25_dev != NULL; ax25_dev = ax25_dev->next)
> +	list_for_each_entry(ax25_dev, &ax25_dev_list, list) {
>  		if (ax25cmp(addr, (const ax25_address *)ax25_dev->dev->dev_addr) == 0) {
>  			res = ax25_dev;
>  			ax25_dev_hold(ax25_dev);
> +			break;
>  		}
> +	}
>  	spin_unlock_bh(&ax25_dev_lock);
>  
>  	return res;
> @@ -52,6 +54,7 @@ void ax25_dev_device_up(struct net_device *dev)
>  {
>  	ax25_dev *ax25_dev;
>  
> +	INIT_LIST_HEAD(&ax25_dev_list);

You can't do this, it will empty the list for each new thing added.
What I wrote is the way to do it.

	/* Initialized the list for the first entry */
	if (!ax25_dev_list.next)
		INIT_LIST_HEAD(&ax25_dev_list);

Just delete the FIXME.  I had thought there is maybe a more beautiful
way to do it but actually it's fine.

>  	ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_KERNEL);
>  	if (!ax25_dev) {
>  		printk(KERN_ERR "AX.25: ax25_dev_device_up - out of memory\n");
> @@ -59,7 +62,6 @@ void ax25_dev_device_up(struct net_device *dev)
>  	}
>  
>  	refcount_set(&ax25_dev->refcount, 1);
> -	dev->ax25_ptr     = ax25_dev;
>  	ax25_dev->dev     = dev;
>  	netdev_hold(dev, &ax25_dev->dev_tracker, GFP_KERNEL);
>  	ax25_dev->forward = NULL;
> @@ -85,10 +87,9 @@ void ax25_dev_device_up(struct net_device *dev)
>  #endif
>  
>  	spin_lock_bh(&ax25_dev_lock);
> -	ax25_dev->next = ax25_dev_list;
> -	ax25_dev_list  = ax25_dev;
> +	list_add(&ax25_dev->list, &ax25_dev_list);
>  	spin_unlock_bh(&ax25_dev_lock);
> -	ax25_dev_hold(ax25_dev);
> +	dev->ax25_ptr     = ax25_dev;

Please do this while holding the spinlock, otherwise we're not
guaranteed to find find a match in ax25_dev_device_down().  It could
race.

regards,
dan carpenter


