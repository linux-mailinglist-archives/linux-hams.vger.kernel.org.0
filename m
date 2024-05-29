Return-Path: <linux-hams+bounces-339-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF9E8D3961
	for <lists+linux-hams@lfdr.de>; Wed, 29 May 2024 16:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6978928912E
	for <lists+linux-hams@lfdr.de>; Wed, 29 May 2024 14:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869DA15AADE;
	Wed, 29 May 2024 14:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y9fG5jcp"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D2415AD81
	for <linux-hams@vger.kernel.org>; Wed, 29 May 2024 14:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993268; cv=none; b=Qt6E7H06jqkAqpemtfiIVva0URBgiAJ6RhavCNFRBrF3rMm0Dg0DTRu0HtlUNfQf4CAsYGEnQ15W79qzCk7kgPnIdW2Ztrl6fuDrbUb70kJQ0iBDa0TvGz8UqJjFzNLEyKixEuO11bFF4OVaC7/ZU5SpjDdr/kkXxL6D1OoUmVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993268; c=relaxed/simple;
	bh=+gUBYjF+Y8hwJU4yqDNq/idF/ljkT845h8jbGF6pDyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cw9DpkYM3zNttl8CiAj6qmfv5OsSpC3sGUwWp2ZRJQQawbtt/qIe/xsIgn4X+DjXGB/UJFe4XKPllCAguPWp0vxSewYvz2PV/RcrRpRqidqXLSUwh/AxC2AP2YAboac8NNLKqukKRConpQjxyDHR9LVcsnHA1ZEvGS59KNB36Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y9fG5jcp; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6265d48ec3so234479166b.0
        for <linux-hams@vger.kernel.org>; Wed, 29 May 2024 07:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716993265; x=1717598065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UxKvozPEtwlO8OXnPN6yBQ22rv1LshJRA3Kmq/ptkTs=;
        b=Y9fG5jcpRMiFeI4D4vKZnQLkP5WZk0NRWI0YbhKG//899/NHkGeUnFOJt/UM0Ztw0U
         tqkFHL+InqbDNOyRsV2ljzq3bcb2kggGJID6rv2U9b4ZpxtgNijrjCgVuW8Xv+q2Cq8C
         3JEiLGET8TfdT2N/Lnw95Bai0/0egOdEQ1M07+opoTz1vQSlWSSk2crwXIFmAbokEu81
         s2u99yMMVnzIS1U77ZiMxamOjbS/4CzaKpb+0H1UAgrteGMJXrMt/2QEOd44ZNHa6DG1
         0NW8tXB36YodCGLb4wQVkFAZ31PimVFWN0cgQifV0FmJmrU/3QcZSSe+A3zo5KrMU6B5
         ejUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993265; x=1717598065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxKvozPEtwlO8OXnPN6yBQ22rv1LshJRA3Kmq/ptkTs=;
        b=I9xl2cbjjRshUAvh6F7GF5xaqSTVOcflq3bqXB8TVKpntkYvZIeGXS8aEzkYqM9X4r
         KoVMod0XjOWl/IXe1MfBBs0nyf2cs7/SbJ6jgfvtVaJxIW+fWn2kVP2rnz/mJJo+WiE4
         uY3nkSfBKjJSYKxblsYUqinCK4HTt3to53rX4s8y2VSO5UXFx1IbWLQid6RptZJvAXtG
         N3Yhpfwoe2DkceWI50NDdBF6S8OCGfYlNm0WE3eBimuQ1BUl+uZI5FApDkorC5c8ouT0
         A3NNZEHI/SAdecRs82jWRUgdz1L+f9N4I2lRbZK1Xdep0dGT0g2FcOY9RDvgOPEpYR5k
         Ddxg==
X-Forwarded-Encrypted: i=1; AJvYcCXeQIkJpuB7KKA4dQPDaNtoGZMp96pMnKn2ymNyhkLQ5yo34eDCca/yqElyfHHJrWO4MURFS8G0SVNbChgJE2OXP9GLzGbqEjiSvA==
X-Gm-Message-State: AOJu0YzUBs5F7oGxsjNdpohaD4Cvf722WMUlvbWUmgjbdl9F54pjexGv
	I6mUlLD4F0XaKYZJoSDg+a2VviDEmI988jg8bgPrLCB07H1ae6sFZSh40wo14fE=
X-Google-Smtp-Source: AGHT+IG4+VOpbeCI0VHpQAmsZbgQumjd4HqVZdvwzgiyKtu4frzTjhK3ZWfHPP3/Uv4v5N7256hwMw==
X-Received: by 2002:a17:906:391a:b0:a59:a83b:d438 with SMTP id a640c23a62f3a-a62641b9ae6mr1027059966b.23.1716993264720;
        Wed, 29 May 2024 07:34:24 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8adf3sm723121666b.152.2024.05.29.07.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:34:24 -0700 (PDT)
Date: Wed, 29 May 2024 17:34:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: Paolo Abeni <pabeni@redhat.com>, linux-hams@vger.kernel.org,
	netdev@vger.kernel.org, Duoming Zhou <duoming@zju.edu.cn>
Subject: Re: [PATCH v4] ax25: Fix refcount imbalance on inbound connections
Message-ID: <962afcda-8f67-400f-b3eb-951bf2e46fb7@moroto.mountain>
References: <20240522183133.729159-2-lars@oddbit.com>
 <8e9a1c59f78a7774268bb6defed46df6f3771cbc.camel@redhat.com>
 <rkln7v7e5qfcdee6rgoobrz7yzuv7yelzzo7omgsmnprtsplr5@q25qrue4op7e>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rkln7v7e5qfcdee6rgoobrz7yzuv7yelzzo7omgsmnprtsplr5@q25qrue4op7e>

[ Sorry for the delay on sending this.  My email daemon messed up so
  all my outgoing mail has been going to /dev/null for the past few
  days.  Resending everything...  -dan ]

On Tue, May 28, 2024 at 12:06:39PM -0400, Lars Kellogg-Stedman wrote:
> On Tue, May 28, 2024 at 11:40:38AM GMT, Paolo Abeni wrote:
> > Note that the fixes tag above is still wrong - the hash must be 12
> > chars long, see:
> 
> I had spotted that, thanks. Just waiting to see if there are any real
> change requests before re-submitting.

Okay.  It looks good to me.  Sorry for all the headache.

1) The Fixes tag points to the wrong commit, though, right?  The one
you have here doesn't make sense and it doesn't match the bisect.

2) Can we edit the commitmessage a bit to say include what you wrote
about "but rather bind/accept" being paired.  We increment in bind
and we should increment in accept as well.  It's the same.

3) The other thing that I notice is that Duoming dropped part of his
commit when he resent v6.
https://lore.kernel.org/all/5c61fea1b20f3c1596e4fb46282c3dedc54513a3.1715065005.git.duoming@zju.edu.cn/
That part of the commit was correct.  Maybe it wasn't necessary but it
feels right and it's more readable and it's obviously harmless.  I can
resend that.

regards,
dan carpenter

