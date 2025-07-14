Return-Path: <linux-hams+bounces-541-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC62BB04713
	for <lists+linux-hams@lfdr.de>; Mon, 14 Jul 2025 20:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E5B33AF561
	for <lists+linux-hams@lfdr.de>; Mon, 14 Jul 2025 18:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF4926B090;
	Mon, 14 Jul 2025 18:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z9F92bNP"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C752D26AA85
	for <linux-hams@vger.kernel.org>; Mon, 14 Jul 2025 18:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752516238; cv=none; b=sUjhcSiH0RZuUiImx53S7IYiw1hKcyxZ9BfuUigdTleuU+b6gtGV9RS/5GRgXg7vEK0QpkUBxiR+NTOd5LrfyGHL4wNCdz9nub1v5Q3/xjaT9q7gq5AIzZNv6cjWOzwWJKwfNXF6Si8bu2FDpRxbOr0K/9dxizRFumgfeIfnzUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752516238; c=relaxed/simple;
	bh=xKnjXWOY2IrRzosXfQB3Bpso/mm2u4JxGSYgZGdZjIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/9INy177IjPnesnxE3Mvp/kJLKvNIG7pr1JKoPlXD+fdNov17uGsVWM22FRWwMChzVpUiezKcavZghfVRKfedRcWZcdOJtM0cF7hIaHj2omQIfz4rbi6ihTi5etGhzebGbhSLdRduHRYzkPqJOKiF0/vr5oe6m0Ac+1VpqASTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z9F92bNP; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2e9a38d2a3aso4050204fac.3
        for <linux-hams@vger.kernel.org>; Mon, 14 Jul 2025 11:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752516236; x=1753121036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kUc//PEDPwGX6GKHFUnDylrVbmV9/GKD9WpLyzBk2E0=;
        b=Z9F92bNPvUvzoOh9o+Tc/v+cCBf2+qu2MWe2G+RnjWD3C5x+s5lLbCFMjjA6bZZHKa
         W84FRIVVuaQVJ2pqMnhdhw0dQ3pF4LOsc3XrVXolQ6aJ34SCadHwhMOMfQOJAULm48QY
         OUHlIO8OIR6r5SZqjPuKKb2awKYWSxP9R4yVFTA59l7TkKPMj0wCHwV7sgywmQT9hgpk
         ldT9xZUimI5KStO+hW3gwxTtS7p7ud+7upXQkYXbhVwVYA2zQ+YA8BBLAcBV5QdIjhHv
         5FpaNP+G7k6nzJWFPnAKSC1L1uSWICCdR6vRbM98oluqvyDIvrmxKU+aNO1LnzLMerx4
         DtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752516236; x=1753121036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUc//PEDPwGX6GKHFUnDylrVbmV9/GKD9WpLyzBk2E0=;
        b=UQml6ct2cXxQHg79419bN7bPOJN+pqmD2LHZob5YasBE9Kl5tiR6/Fs/THj0nNLFUG
         Ux3aox9xgRKhxNh4exFCJQ5Lxk7ROYk70KMYh+DTS7ZQ8AMMfuz64W/P4U84zhCDrW2A
         UFsRl8L4abS0GiMgRtVYgOAuna11fW4wV51Dkofp92pTyjirk6DoVinRqfZiN5l8DvSv
         kYaBzr/u80ZViKFKBu/6Jtvh3jNmZtVrIcow7RX4agaa946X6V9jxb6SaqYRMXOGI0vK
         B1uPRXx+AAZnf2uzsmmlEVF57rq1NEOKEj61Px8uuSRVscPQJkcf0F+q12nG17WaUSF7
         ANaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzBkVfrIL52A5xmKMEzeVOCnBjAXEWmrmMJilSn6GpsquVwsbJMk1q+fSIV1cOhjqiNRYWQHTdMkfE@vger.kernel.org
X-Gm-Message-State: AOJu0YwgqYXhfAARP3YWojNE4rxrNgeg1DZjOF4LH38NL74Q5jMAX9if
	BJaz5bAhsMSqqgfl43wWBvvpBPop+0l2ci+HXwjyy+BRA/iqWPLSgNMKWxmM9GUwf3M=
X-Gm-Gg: ASbGncsZ60M+BAgjvo/fvxUaTrJmpq2rE9nLdD2HZTShCGCJOjOwWfdggWT7Rb8/O1r
	JvIgwAyxhE0RMg39bl/lghgjbIPJRXlrWte76hi7KvRckfB4dVYFGhA1t4TsJE01uQ1Pu93r90V
	hNpToLkCDaNZXyKubZzLkVtXH8JpnkrYaHq4fTORByJ0ZqwI5rVQu3pguMj9CCWGGJD+5lyA5nL
	9wY455EMRojm7ADFzgadSnyWQ5b5bnJ4LhXVmShuvUwgnrtmbz+VCIP5RwJJmDxz9fC+ocpA9+S
	9iWJdRDSMCIcV+3OSqHpjrK6QPtJAs1qP9F212B5N9Mt3/su5SIL9tg7qmrpvdnV7qB/+/EU3DW
	FQvrOeKj+lLc5Lv8LR8qr3ib0gHSrDQ==
X-Google-Smtp-Source: AGHT+IHTpGx6mV7WMwP1pIKs1b9CdmfJ9vEn7hc8jx+5sU/Mj67Y+rDomjPaMvowTYcY4XUtpdxDwA==
X-Received: by 2002:a05:687c:2001:20b0:2ff:8822:2912 with SMTP id 586e51a60fabf-2ff88223f6cmr1071480fac.5.1752516235811;
        Mon, 14 Jul 2025 11:03:55 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff8dea112bsm84240fac.43.2025.07.14.11.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 11:03:55 -0700 (PDT)
Date: Mon, 14 Jul 2025 21:03:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Kohei Enju <enjuk@amazon.com>, Thomas Gleixner <tglx@linutronix.de>,
	linux-hams@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net/rose: Remove unnecessary if check in
 rose_dev_first()
Message-ID: <96fbe379-cf8e-44e9-aeaf-a8beee2eda9c@suswa.mountain>
References: <20250704083309.321186-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704083309.321186-3-thorsten.blum@linux.dev>

On Fri, Jul 04, 2025 at 10:33:08AM +0200, Thorsten Blum wrote:
> dev_hold() already checks if its argument is NULL.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  net/rose/rose_route.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
> index b72bf8a08d48..35e21a2bec9c 100644
> --- a/net/rose/rose_route.c
> +++ b/net/rose/rose_route.c
> @@ -608,8 +608,7 @@ struct net_device *rose_dev_first(void)
>  			if (first == NULL || strncmp(dev->name, first->name, 3) < 0)
>  				first = dev;
>  	}
> -	if (first)
> -		dev_hold(first);
> +	dev_hold(first);

I'm not a fan of these sorts of "remove the NULL check" patches in
general.  Sure it removes a line of code, but does it really improve
readability?  I feel like someone reading this code might think a NULL
check was required.

I guess there is also an argument that this is a tiny speedup.  That
could be a valid argument especially if we had benchmarking data to back
it up.

Of course, if you're planning to take over this code and be the
maintainer of it, then you get to do whatever you feel is best.  So if
this change were part of a larger change where you were taking over then
that's fine.

regards,
dan carpenter


