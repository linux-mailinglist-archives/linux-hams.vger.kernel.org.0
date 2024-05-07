Return-Path: <linux-hams+bounces-231-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6060D8BDBAB
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 08:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5492B226C4
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 06:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35ECA78C7B;
	Tue,  7 May 2024 06:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f5w1405i"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5984277A03
	for <linux-hams@vger.kernel.org>; Tue,  7 May 2024 06:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715063913; cv=none; b=ETtMtamF8E45RJyBJMVIalXQkTnjcmtwvO7B3tb5hmguAeP/U1GjoBlSrs8lZKu3b3WpZ+rUShSjDpucRuhjO9YiG3lObjCEdrl+1Xiv1Oq4zwiUVzzU/JONYamsV0MJ9q9YcxnuQnyB5kKMwdn4rPSQCD/6QFsS1//dhEiAjno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715063913; c=relaxed/simple;
	bh=BKoeohEDZ10JoxgkEHGh6hbaSRwhE+vURlivpEtErJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0FkzqOuEbxpGwUbuKpO/mxkH8Ey5v3GvOLgtYEgYHWcMBMZL4GST2YAn+L77pTBY1JHDHRyuISwC7we+qqIYI5cxqFdXj+SA3bR1in2siatl2pxhpTDgcHR19ZEibhNUzOKt9skSmZ3tKPFb4MD8MPC4J2Bfmta+p5MmIM55nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f5w1405i; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41c7ac6f635so18494205e9.3
        for <linux-hams@vger.kernel.org>; Mon, 06 May 2024 23:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715063910; x=1715668710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6aHkDzKF7lg6ebAituhr9z6rljFZ6+hRg0pe8ntw8+I=;
        b=f5w1405i3JDyMtJDOB4FSsagyo6t5ZwSxMVVethWdqgnUNihxtztuYHo1N7u5L8A4J
         p71VRwnRZ9F5IZhd+rFwB8bzVlzfA3sxjBiGhNar0ZURcmy2B6tqZ/BjMFP9/iQ+xw5d
         sA/XIlU0bMnnLIqc2t7VoATXFIn6cC3vcqRaUYhR5o7ZNlaB9TkZ7GMcOyejSIwG3dkF
         QTtJh2frrqY6pFHy5qnQWZXXYvO+aItujh0rkbAj7zS7dxusMFSXnIQ+b5mtgjBtdnAs
         AEeO1Jl+MfN04LdSEXUwe505Fkt6hz3Ry4XWJQxIqKe4r5a2NyAMpH/78yaqN97ssDyI
         rZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715063910; x=1715668710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aHkDzKF7lg6ebAituhr9z6rljFZ6+hRg0pe8ntw8+I=;
        b=Mv2+7BglfOqmjdIleiMMbHvMuW9gphyNJMAzMqecM8wAHm4rep+nEHDRjDhnvlRUzE
         u7TyR62jVn7td/Wj4VoRh2MuX1g+uXhznJpaFvK14S/pZVpAEmiSulfixkLZX3YFV//K
         HuhaTJ968ZWNq9SKpjdYPAJ1DB6h2ki+boUc7ixwcXYNQ1oAH9Kw33kJmqEV19JSrB0t
         SeqXptbM5xn6b/0/hSummj6LvcNMDDrnhGTSdOgNBGCUj179JgK8FEMOQbTV48Cwhru5
         feh6T7gDf8SABwWCcBycsCYIJvMn5kqaSTUCtb8zFTmcNujPngwELcGt2SIuKkv7kzKt
         f6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWEhkrKLgW6r3Sx+byLq9ik7SQnM6JJIQlTnaMwGq4sz4v9zo3LXLoJrfgfdTakiLU3FI5WFhmTHWphVDauygXATLgUG/hAWNyypA==
X-Gm-Message-State: AOJu0YxxwhDdSugl/XP6orECFM9vNMj+6wa/g5fzhYy5ut8r8QFcqSPQ
	GcQ6XJEAwon81lV2qKhCry0BK/BO6Am/zRmfOxbbvArHc6Z/FFRjuYF6c8PC9TI=
X-Google-Smtp-Source: AGHT+IEuAJWgnwrL51HjDRkNkuIQnolNDtcX2Dtiv4JArVnt0gU0JFVwrgBNZe8x9Vwq0qUDf0GeOw==
X-Received: by 2002:a05:600c:4713:b0:41e:62e2:f55f with SMTP id v19-20020a05600c471300b0041e62e2f55fmr9053031wmo.18.1715063909582;
        Mon, 06 May 2024 23:38:29 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bd23-20020a05600c1f1700b0041bfb176a87sm22215368wmb.27.2024.05.06.23.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 23:38:29 -0700 (PDT)
Date: Tue, 7 May 2024 09:38:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, jreuter@yaina.de
Subject: Re: [PATCH net] ax25: Fix refcount leak issues of ax25_dev
Message-ID: <d117754b-fb7c-4889-a49a-76d64f30a372@moroto.mountain>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <78ae8aa0-eac5-4ade-8e85-0479a22e98a3@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78ae8aa0-eac5-4ade-8e85-0479a22e98a3@moroto.mountain>

On Fri, May 03, 2024 at 11:36:37PM +0300, Dan Carpenter wrote:
> Could you test this diff?
> 
> regards,
> dan carpenter
> 
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index 558e158c98d0..a7f96a4ceff4 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -1129,8 +1129,10 @@ static int ax25_bind(struct socket *sock, struct sockaddr *uaddr, int addr_len)
>  	/*
>  	 * User already set interface with SO_BINDTODEVICE
>  	 */
> -	if (ax25->ax25_dev != NULL)
> +	if (ax25->ax25_dev != NULL) {
> +		ax25_dev_hold(ax25->ax25_dev);
>  		goto done;
> +	}
>  
>  	if (addr_len > sizeof(struct sockaddr_ax25) && addr->fsa_ax25.sax25_ndigis == 1) {
>  		if (ax25cmp(&addr->fsa_digipeater[0], &null_ax25_address) != 0 &&

This commit is wrong.

regards,
dan carpenter

