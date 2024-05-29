Return-Path: <linux-hams+bounces-342-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D6D8D3AA2
	for <lists+linux-hams@lfdr.de>; Wed, 29 May 2024 17:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B39E285177
	for <lists+linux-hams@lfdr.de>; Wed, 29 May 2024 15:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A322918132E;
	Wed, 29 May 2024 15:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l9ruISG/"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C656018130D
	for <linux-hams@vger.kernel.org>; Wed, 29 May 2024 15:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716996030; cv=none; b=FN2EPZ2YQGdJi1wPqZ/ToWrdPnDWAYpA50lAK/ave9At3AoB52cn3BUsxT+acUD4CajuYK/eM1oRo6GARpQr5YTWR7sa4AqJxZPMaP+/OaRZ0TbXJ5IWmLvxGIGYXcTEw4mByqnQFKTYukdGE1Ov5sjPOO3uEkQ0VvwpraI5cCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716996030; c=relaxed/simple;
	bh=HKDPUklsnxlG+mVqbEl8APDzYt/yZRfVUStmJCPSB7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFMRlmqLwuHo1GvAPSEkVwSUfOqsrjCWPNo1n0hjCp50PruG8BbN2FlltRYe5ci3WE4xZEUvCzLb6jg1uLh52gj12i/j2X5Z8OQQQpoMn1K+2mFglTwcIjXxQ0nKmViP0ClQgwHsfAI1kImL2tQOQU6jkim/Ct19vMxz6m7v0hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l9ruISG/; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5755fafa5a7so2786947a12.1
        for <linux-hams@vger.kernel.org>; Wed, 29 May 2024 08:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716996027; x=1717600827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ssWtE6S6mHdnxlC4elwxRIfkxjFvIJnV0sZqtOYQD9Q=;
        b=l9ruISG/OsgsirBK0J5th1WdfzZg8hE6xrm8PdA0IKvn+J9ubcDYs4pWLwIn3wDpxm
         fGHz0q8u+TELFoku9v1iKDqemT5iESF9yqEzp/ZYDACxV4xR0H0CuYWXcITCjEYmafEM
         l8iDYxDD9eMx30yXsVie5UfWOfgjfD2WdT6jcVOMKvRAxevuuh7z771RYMzaMRZPhSGv
         ZvRUPTl1g7irIZ3QJf4CHWLJPek17UYoNB3Ehd4gOSfnbdCtZnhOOXVzhTLqEVLi8mqm
         81wvvvyif0jlszSlxbU99T0ag7vUVUQzTsg6xaNRZSJWO0/gDxN2bB9sGTc+gQ688zR7
         4GVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716996027; x=1717600827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssWtE6S6mHdnxlC4elwxRIfkxjFvIJnV0sZqtOYQD9Q=;
        b=jdPYkzU0iftwhhLY2F+RwjLLAYDXpb9yfRI3875sNFaEvtMbKFUKoCLj5JGVeVnZv6
         FE5NbeRtEhXRf/48hEUJ/yqRDoVvAT4UgrZAdCqvRGOT5D7dynv57mNK3hUYikUGZ1f/
         hS5jR+m77VcbiJJ1Cutm8JpNoSvo/Wcgu0XlZerNFjStqyvCXbGRfJzIPiCv0LcZpqFJ
         9nQVpLFFZDOuUKUdRTi2maD7FMQaeLx/5bSmIDpNC7CPj4rzx8d+gLU5c0VvVQQBj+5F
         LPhKnH1xk69GjV4aV/rvJXxKfERj3Z6MiJ4gsqVhCq3oLqJ/JsPZ9UUhgoPoLmwEb5Ks
         FbDA==
X-Forwarded-Encrypted: i=1; AJvYcCVdQoK3/SfhOCm20TtkCe3683KtIT19qC3lVoQ6ppR2e+NkDkix3lwZy5C7NpCNFD5gW5kt13KNh0dJlF3pxAU6Xi/ZoJhhTC7Ing==
X-Gm-Message-State: AOJu0YwXxIOUEY6sajzMCERiBePo3ifSG+bOeSy784yuZmFSMogtsPXX
	SAlNY7+gSJGCJSLorhwSCP2XVnpb7L8WQe6/83O4kzcqmhnkVm6APkZ/iqpkviA=
X-Google-Smtp-Source: AGHT+IGXJQft27bLZUlO9LEC0uwj8lCzAwFIpMjeEEzR4cf87fPK9kl1/HUFfyeDxdbCKBIDPDHafA==
X-Received: by 2002:a50:d617:0:b0:578:6198:d6fa with SMTP id 4fb4d7f45d1cf-579c4905902mr7299495a12.2.1716996027003;
        Wed, 29 May 2024 08:20:27 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579d018ef3fsm4580123a12.13.2024.05.29.08.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 08:20:26 -0700 (PDT)
Date: Wed, 29 May 2024 18:20:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: Paolo Abeni <pabeni@redhat.com>, linux-hams@vger.kernel.org,
	netdev@vger.kernel.org, Duoming Zhou <duoming@zju.edu.cn>
Subject: Re: [PATCH v4] ax25: Fix refcount imbalance on inbound connections
Message-ID: <3ea61b17-c893-46ae-a338-090cf1c6618a@moroto.mountain>
References: <20240522183133.729159-2-lars@oddbit.com>
 <8e9a1c59f78a7774268bb6defed46df6f3771cbc.camel@redhat.com>
 <rkln7v7e5qfcdee6rgoobrz7yzuv7yelzzo7omgsmnprtsplr5@q25qrue4op7e>
 <962afcda-8f67-400f-b3eb-951bf2e46fb7@moroto.mountain>
 <7bfn3g46beatmbp3bzxauahdiitb67ncfixp6znjdc6e5gj6mc@ldmt3i2wnqpf>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bfn3g46beatmbp3bzxauahdiitb67ncfixp6znjdc6e5gj6mc@ldmt3i2wnqpf>

On Wed, May 29, 2024 at 10:54:45AM -0400, Lars Kellogg-Stedman wrote:
> > 3) The other thing that I notice is that Duoming dropped part of his
> > commit when he resent v6.
> > https://lore.kernel.org/all/5c61fea1b20f3c1596e4fb46282c3dedc54513a3.1715065005.git.duoming@zju.edu.cn/
> > That part of the commit was correct.  Maybe it wasn't necessary but it
> > feels right and it's more readable and it's obviously harmless.  I can
> > resend that.
> 
> Just so that I'm clear, with that comment you're not suggesting any
> changes to my patch, right?

No, I just noticed it while reviewing the code.  I'll take care of it.

regards,
dan carpenter


