Return-Path: <linux-hams+bounces-192-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A39CD8BA12A
	for <lists+linux-hams@lfdr.de>; Thu,  2 May 2024 21:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69884283F4E
	for <lists+linux-hams@lfdr.de>; Thu,  2 May 2024 19:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE98180A7D;
	Thu,  2 May 2024 19:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B9rGy0fe"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E51179972
	for <linux-hams@vger.kernel.org>; Thu,  2 May 2024 19:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714679795; cv=none; b=bpentJBYlhG/ZdKYgCr/pVYruaqG+sUcbxZss7RXjcXOVcd/s2l6lXAcPf3tdWZBZkpAu8OtRD0hN8prVftDRpaEQUjN/4F7ANICL9bsm4/i7XyrFbqKkf3v3mRDK78gvTsS1wDHQRWuQTIJucD3vVzqZTZMrZiWG5g1oFzipa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714679795; c=relaxed/simple;
	bh=NXC4ddXI6s466s+yE7pFTmOsbcHy1eK9kBtpIaQqUHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSq2pafxdCFXkzJA4Z2M61GJjusAjxwtzgxOMgliPuyWnhPjxt9BQtI90yk0ptyJYEisoo6Y94J0y6nuKQn8OBQmeu5P7waEamclR8Yp486dPL7INoZSR3tXnm177Si2meKUqE2c7BVPlw8JiWVNnZg3nzucFPUfDfDCv7/E4I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B9rGy0fe; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41c7ac6f635so29859715e9.3
        for <linux-hams@vger.kernel.org>; Thu, 02 May 2024 12:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714679790; x=1715284590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=arPW5gD6qYspv+Dw5+o0jCoBQCRjes6FUELPaGgl7+A=;
        b=B9rGy0feAhBCu/pR/uviC95h0BeUzl38dN/AGq9uaYj6tsdmGYJOIUgjUimWm3KsF7
         mzfGWe505YbIONsIRdlsViwFJFWHjTHOaN4jD4/0Qc6lB/TM8jH4AWsxI06wrXrnW8bC
         Yem/Pn+pUbsg7sUcRpokrk9LMn8YpqQNsfsk2xkjD4GgKYiui1+7bCPrQEQ54da0s/MT
         /WciwEkeBPuGqZ7uCG+ue6P6TwhyVXmSxaflsBt58q9xgY/xSp61hThRzzdQJ/UMWdkO
         5krAL8IFixUcM0V1G/ovjrsybo9/xltkipaQr43hxh2bacwupxltyuoaalA8ispToCzJ
         0m+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714679790; x=1715284590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arPW5gD6qYspv+Dw5+o0jCoBQCRjes6FUELPaGgl7+A=;
        b=OQ1va7+zC+kKYwswRKvHEPvZHqatUeuzws229FSTrx62HyuvZn4kNk55qzVU43Hv02
         b/kHal9phzZVneHXoxyPZ6Yxs3ymiMGJG/AVBfrnE/cn2HwbcOEZynHt/3CT2U7XC5Zi
         ZJw6pp1mZ9rqlsj0FZ9qgS0eXyXuZjyZxUJDu0WsZDCbM3MYVL8dDsOyyhS5+dbuW2sm
         59mjzzEBmFE3JQ0P5BWPkNj8WQgV5xtrCO427Y67iv/vLbmXMOxGYYA8tLOnPmFu+8AN
         vYKxwpD0sPnYQMdvDxN2iBCN/i5EPOcsGJTr2KNPOsq3q4GPgHPgINsl0XUOZPcTn7qw
         XEZQ==
X-Gm-Message-State: AOJu0YzwgpCHRq7Qc3QXB2FB2CNQR3xYQwsHXivBdWiXQUW+D3ZOGR3K
	jsw7AmhjVaMkpvr17nTGOX5kXDfN6FWVOGVMfFhejR6/nyaZ8DNcFdVh6VceT14=
X-Google-Smtp-Source: AGHT+IEpfOOOUYWpSzH/iyktCVwaYBF746jIRropE6T4t/9I6OMbyxfoAl8bqILYaWHHN0U1dtlnOg==
X-Received: by 2002:a05:600c:1d8c:b0:41a:908c:b841 with SMTP id p12-20020a05600c1d8c00b0041a908cb841mr532673wms.32.1714679790129;
        Thu, 02 May 2024 12:56:30 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id s20-20020a05600c45d400b0041bde8ddce9sm6741202wmo.36.2024.05.02.12.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 12:56:29 -0700 (PDT)
Date: Thu, 2 May 2024 22:56:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, jreuter@yaina.de, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	Lars Kellogg-Stedman <lars@oddbit.com>
Subject: Re: [PATCH net 2/2] ax25: fix potential reference counting leak in
 ax25_addr_ax25dev
Message-ID: <c32bd541-8242-4d4a-ab14-eff835bd38a6@moroto.mountain>
References: <cover.1714660565.git.duoming@zju.edu.cn>
 <cb44ea91c0b7084079c3086d6d75e7984505cec7.1714660565.git.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb44ea91c0b7084079c3086d6d75e7984505cec7.1714660565.git.duoming@zju.edu.cn>

On Thu, May 02, 2024 at 10:43:38PM +0800, Duoming Zhou wrote:
> The reference counting of ax25_dev potentially increase more
> than once in ax25_addr_ax25dev(), which will cause memory leak.
> 
> In order to fix the above issue, only increase the reference
> counting of ax25_dev once, when the res is not null.
> 
> Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
>  net/ax25/ax25_dev.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
> index 07723095c60..945af92a7b6 100644
> --- a/net/ax25/ax25_dev.c
> +++ b/net/ax25/ax25_dev.c
> @@ -37,8 +37,9 @@ ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
>  	for (ax25_dev = ax25_dev_list; ax25_dev != NULL; ax25_dev = ax25_dev->next)
>  		if (ax25cmp(addr, (const ax25_address *)ax25_dev->dev->dev_addr) == 0) {
>  			res = ax25_dev;
> -			ax25_dev_hold(ax25_dev);
>  		}
> +	if (res)
> +		ax25_dev_hold(ax25_dev);
                              ^^^^^^^^
It should be ax25_dev_hold(res);

This is the NULL dereference that Lars saw.  Thanks for testing, by the
way Lars.

regards,
dan carpenter


