Return-Path: <linux-hams+bounces-411-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0439622D6
	for <lists+linux-hams@lfdr.de>; Wed, 28 Aug 2024 10:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 088AE1F2653F
	for <lists+linux-hams@lfdr.de>; Wed, 28 Aug 2024 08:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CF015B99E;
	Wed, 28 Aug 2024 08:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vprztl8/"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3524CB67A
	for <linux-hams@vger.kernel.org>; Wed, 28 Aug 2024 08:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724835256; cv=none; b=a7EAWwQRuOwoDacXeWjb28AUQ14LTraKOhrBreeZdiHnz386K4CddKBfgFTLMBEWbg6EuHor2AKBcIcUIVHpBFPO8HMnJ8/L3gDOMq/JaeHcy6ZB892iK+8L5GxsIml7ulgOqLGU/+WMXOrO401OgL6FnV4Sv6YNCE8mVCV+ZxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724835256; c=relaxed/simple;
	bh=ZJ/J7m6i+8KbtJqj1FMAwGA+Bmxy4Lpbs/RVJWh8Vgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c89qH23JyoG/3Rhin/9YK4p0EayzhBiEh5C1Ado8TlW0XQKQrHZMUZHf864HePcdnQWoHI9X95Pf+632ruNIfAygr3dqd+/+MugQtCH0AGnwyHzFl/YWwCjOU8QdoI0DAz2sXb3svdwNLSQswgM/Gk2uB4rr1rkgerGAE8A0ZLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vprztl8/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42ab97465c8so55426585e9.1
        for <linux-hams@vger.kernel.org>; Wed, 28 Aug 2024 01:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724835253; x=1725440053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IQtjr3ZsIIcSu1rCSe254P3JWX2H8aBnGOcApocErl0=;
        b=Vprztl8/nigFe59LCJ7rkABx13cVc27gwIZbJlLh63FvHvV8i//HIEY200G1ygM1yW
         MivszpVAzJL2vbokuZBHsR2QVJE9G3TY+lthYV/KySHC6qmtTIZxS05W5nfQagO2N8ID
         /kAzGBrSyrUt0/zC0q7h1a6rS0pXcygLQA8KWvn8OiM5SakfWc6p1WgHR0b+b8VT1r2y
         qzZFBozJ83oimU+iGsVBPrRzJfEZgU6JF45oXLKWD9oFe0YJn/GZXkI7jGJLVWL02dwq
         wYeMErSLXqJc9bauqYok1fS4xQMCsHOadnz1dBcchnhow1qPU7jhnKHKiYc3q+cc+rC2
         WVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724835253; x=1725440053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQtjr3ZsIIcSu1rCSe254P3JWX2H8aBnGOcApocErl0=;
        b=q4kLNDashxTytQBVbOJCewA5A/Ki0MOJbqzv7uPWdkXpWSxL2wN1DOC2DiZBTsweYd
         eCfA3b6sNGYrRrjOOfUnr3EYMSuP+YXqLBQk+0leJOcYYoYlciP0t1z8RoYOL26ChCOT
         TO+xLv3JIRCrzsp8CkK/JN25WZJ/48XBwu8yI8OzPKrnrci0FG8uLA53qjfCFbjZ9jir
         eDtnAFv8GXwyJWyRzc0OqZn9qZNxO4JtV2iB4YqA2lBMEqQgPbinuYs7/d0VOfbJ172Y
         Sqr7lY3j5RLWXT4h2GI0Pj5n4SSWCafzvTeFlD0bqW8rdBv6xO/RstVKMz+R8RmBLcFC
         XJuA==
X-Forwarded-Encrypted: i=1; AJvYcCX/elRMyIzMSJptfi3uL67Ar1yABMTcVmTbKB73oaUi7w/AF8kJ7VMaC6pb27v7nad4hetEWKwdOyvI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv8P6/WgEfvIehxiAbLPPjXJzYVWCHx5+qG8cyXwtXwiDuhTPb
	pUZL+kch1lC73yACW6PU2Va444fqv+QaRvRN1FUtSbLMles3zQg8eaQL5SlM3c0=
X-Google-Smtp-Source: AGHT+IGr3JPJmC+vbozl+aEANHfCdvcBvynQALLAOIYsAcPYx4SVws2LzUK1Yn9Ipf6EeFPGVzxiQQ==
X-Received: by 2002:a5d:47af:0:b0:368:3731:1613 with SMTP id ffacd0b85a97d-37311840ef8mr13595292f8f.13.1724835253222;
        Wed, 28 Aug 2024 01:54:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63b11ecsm13978265e9.26.2024.08.28.01.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 01:54:12 -0700 (PDT)
Date: Wed, 28 Aug 2024 11:54:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, dsahern@kernel.org, ralf@linux-mips.org,
	jmaloy@redhat.com, ying.xue@windriver.com, netdev@vger.kernel.org,
	linux-hams@vger.kernel.org, netfilter-devel@vger.kernel.org
Subject: Re: [PATCH net-next 1/6] net: prefer strscpy over strcpy
Message-ID: <d5525686-aefc-439e-8c27-d41a2ee2eb69@stanley.mountain>
References: <20240827113527.4019856-1-lihongbo22@huawei.com>
 <20240827113527.4019856-2-lihongbo22@huawei.com>
 <a60d4c8f-409e-4149-9eae-64bb3ea2e6bf@stanley.mountain>
 <7fd81130-b747-4f70-978c-7f029a9137f3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fd81130-b747-4f70-978c-7f029a9137f3@huawei.com>

On Wed, Aug 28, 2024 at 03:43:30PM +0800, Hongbo Li wrote:
> 
> 
> On 2024/8/27 20:30, Dan Carpenter wrote:
> > On Tue, Aug 27, 2024 at 07:35:22PM +0800, Hongbo Li wrote:
> > > The deprecated helper strcpy() performs no bounds checking on the
> > > destination buffer. This could result in linear overflows beyond
> > > the end of the buffer, leading to all kinds of misbehaviors.
> > > The safe replacement is strscpy() [1].
> > > 
> > > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
> > > 
> > > Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> > > ---
> > >   net/core/dev.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/net/core/dev.c b/net/core/dev.c
> > > index 0d0b983a6c21..f5e0a0d801fd 100644
> > > --- a/net/core/dev.c
> > > +++ b/net/core/dev.c
> > > @@ -11121,7 +11121,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
> > >   	if (!dev->ethtool)
> > >   		goto free_all;
> > > -	strcpy(dev->name, name);
> > > +	strscpy(dev->name, name, sizeof(dev->name));
> > 
> > You can just do:
> > 
> > 	strscpy(dev->name, name);
> > 
> > I prefer this format because it ensures that dev->name is an array and not a
> > pointer.  Also shorter.
> ok, I'll remove the len.(Most of these are an array, not a pointer)

s/Most/all/.

If it were a pointer that would have been a bug and someone would have
complained already.  :P

regards,
dan carpenter


