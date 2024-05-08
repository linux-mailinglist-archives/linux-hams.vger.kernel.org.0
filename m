Return-Path: <linux-hams+bounces-256-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDFA8BFD23
	for <lists+linux-hams@lfdr.de>; Wed,  8 May 2024 14:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1E32B226BF
	for <lists+linux-hams@lfdr.de>; Wed,  8 May 2024 12:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A73244C7A;
	Wed,  8 May 2024 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KSQ8HDtr"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239FB8F40
	for <linux-hams@vger.kernel.org>; Wed,  8 May 2024 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715171456; cv=none; b=e7YP4CZFZSCWZrhrAR3YcO3e1CjOBSQ+/enmHTBLIV7s6SfPb7X7D7qmS+JbLyNvdPOtq9bSHloYoD9oDHugzT9DKBNF7SXZJ8D2f14FraFZfDn9Hmxes0STwt4gRF6SenznqQkdmKeM+aI3uFov42gZfvP96nWnx/kk3r/QXgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715171456; c=relaxed/simple;
	bh=udrSthju91iTTd/hCXwNP3ss8krjp5UgvP3u8l+CcY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6ImNshC09uf+8xSKorQkAP9P953798dz03QzeRIBgBGeCemvyQ+KYUlWIF8pWGvC3pPzXfPqBfW25O0JpjCVDx7MwDdJdLvzFOdEJiSi3lzdW4JF856tpK0lZCrIFtqvRs7w/YdnKk54Xe2qG6xqbWpYpoYRXMLwoiDGi7OupA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KSQ8HDtr; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a599a298990so1160120966b.2
        for <linux-hams@vger.kernel.org>; Wed, 08 May 2024 05:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715171452; x=1715776252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jlwyq/1IX/FSnmcUcEK3U0EwnE28fYISNssSS1mTjz8=;
        b=KSQ8HDtrFyAk88KleYRRkuUgXhlfUosrH1/KhmZeaWCifVACkY/9XUEcA0IOzV7KK+
         PAKtSuEs81GUo8yiBl8g8c+kN3zYtrvIyoZk8Lq32fvckdaWzhVz3qlXKGcfWT+UQ/9u
         ID6ECfmZGgZhPfE9IBA5AkqI/O36J4oEQO1sCaWrk1xvx80jQjHx4QHf8vqlDb3j52Es
         TH14xOT7cNJYlixAXlPJYBHo+c4Ll7f/MIbQxmYMHca1PsKtam6x5OgME2WjyWeEUnNe
         ikB8Pms062BfsEhQqcFwL4bV4JpXmRbQ7AE1wBib43ahhy4PrUKtdOj9U/s6Sgx7dORI
         dFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715171452; x=1715776252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jlwyq/1IX/FSnmcUcEK3U0EwnE28fYISNssSS1mTjz8=;
        b=bnlE6LNKbs7m3mOmD5BTOLvdEFYWmzU8A2L2DcuVy7a8awllhQ3B1phX/QtkoT7fnD
         2bviymWqaXrkHn2yISLeCC0r98kxRvq8K+2v+g8FEusDr9K9P3Kaw+80RyoykUTnVyrM
         6/42aqD9d27BrYNVg1pFS1BA5GmxXI+7pMPNzcxdBXawwKz9Ps/zwTV7KbpIJ7wrQpYt
         GLu+reJe9iqyMbXPoqvO04ZqSeBpCF8Agu5WyoEJK4bNkPsk2BZioP6E42nl2OtNDC66
         s7mEW9SkK0cNgiPA4aXYRvYxpK9ZUKWRN62QfAl27EAfuBrp8SN9Go5ne4Z32PFv/0RW
         iRoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGZVYcU8lWX+mwAsjqviO2y387gojZrUmPHpMOrE9dyN0gVNSRPLHsesoiaITGKSvHLbv9bwRviHanlQpeBRZzV9UGGhDOzuGlmw==
X-Gm-Message-State: AOJu0YzmJ4EUNGfMeWQWigrrYT6vAZ3Py4dYgY/6YfcWx3puxJsboScc
	F7YaKqyNiGi79kWWBJRrjWVFknr2hWyUkpwAxri3/TU7ysZtcRFHimRboEEAmqI=
X-Google-Smtp-Source: AGHT+IEUdN4yCjg1EbVceLNb47N7q/pu0Z2BPUoRd23kSGnOEvLg+0w5/+pbACD0wZIcVpIkUF8igg==
X-Received: by 2002:a50:9345:0:b0:56e:2c34:cfec with SMTP id 4fb4d7f45d1cf-5731d9ce493mr1548917a12.7.1715171452073;
        Wed, 08 May 2024 05:30:52 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p9-20020a056402500900b005727b2ae25csm7535130eda.14.2024.05.08.05.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 05:30:51 -0700 (PDT)
Date: Wed, 8 May 2024 15:30:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
	jreuter@yaina.de
Subject: Re: [PATCH net v5 4/4] ax25: Change kfree() in ax25_dev_free() to
 ax25_dev_put()
Message-ID: <15eddaa4-5e6e-4b9e-9cf1-89527173c1a3@moroto.mountain>
References: <cover.1715065005.git.duoming@zju.edu.cn>
 <5c61fea1b20f3c1596e4fb46282c3dedc54513a3.1715065005.git.duoming@zju.edu.cn>
 <20240507141326.GA1050877@maili.marvell.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507141326.GA1050877@maili.marvell.com>

On Tue, May 07, 2024 at 07:43:26PM +0530, Ratheesh Kannoth wrote:
> On 2024-05-07 at 12:33:42, Duoming Zhou (duoming@zju.edu.cn) wrote:
> > The object "ax25_dev" is managed by reference counting. Thus it should
> > not be directly released by a kfree() call in ax25_dev_free(). Replace
> > it with a ax25_dev_put() call instead.
> >
> > Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
> > Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> > ---
> >  net/ax25/ax25_dev.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
> > index c6ab9b0f0be..2a40c78f6a0 100644
> > --- a/net/ax25/ax25_dev.c
> > +++ b/net/ax25/ax25_dev.c
> > @@ -195,7 +195,7 @@ void __exit ax25_dev_free(void)
> >  	list_for_each_entry_safe(s, n, &ax25_dev_list, list) {
> >  		netdev_put(s->dev, &s->dev_tracker);
> >  		list_del(&s->list);
> > -		kfree(s);
> > +		ax25_dev_put(s);
> The commit message "The object "ax25_dev" is managed by reference counting"
> seems be not making sense here.  in case ref > 0 after the ax25_dev_put().
> ax25_dev_put(s) is not initiating any mechanism to come back and recheck.

The other place where we have a reference is when it's saved as
ax25->ax25_dev.

regards,
dan carpenter


