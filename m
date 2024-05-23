Return-Path: <linux-hams+bounces-320-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EEC8CD6A3
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 17:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87F131F21D3F
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 15:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD793B653;
	Thu, 23 May 2024 15:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e6yQqqBX"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AC86FBE
	for <linux-hams@vger.kernel.org>; Thu, 23 May 2024 15:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716476742; cv=none; b=jx1CSuDcf1lgFc68Glhfml5ZmnjaBpzdWBwwBgEPfr9paUnnWZ4LY6iyAm0RhMKMyxFTjxYCJNHqQu8dnq2u6101D8b75u9lL7/GQ+vBhJuW3gjUVJOV05+umlk9zn5YubPHxTF57Ypl/Q/EwLot6U0AF/wKOuJW0aHFx2+fvcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716476742; c=relaxed/simple;
	bh=bo6U42lO405aAO7PxD+4VH+3Z51Lx6lMzDD8ewuykKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9w3p07HJRDYszRuXSRMqJLN497oSxpGbOdsvb3nOlyI3+VyeHoHEfVr2GGAlLVUQqFqNcYksffXN8a2VELjA7K6HlTt/tNUBbsiqwD2Z6npW1oz5cKAU82JKvkXJAlYwMqxFNWUubq2i0w3YEUETCKVrLeSunCrkpIRTRcRFbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e6yQqqBX; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-354de97586cso2407470f8f.0
        for <linux-hams@vger.kernel.org>; Thu, 23 May 2024 08:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716476739; x=1717081539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7neT5eys302Amd8BRdf9WiVW3g1p32Dv9F0d8apRSUc=;
        b=e6yQqqBXrIcOVlJ38A85OWTUN7zEmKCScU8wvpJnZiQTxSqogkSsWq4QIjptH8StF9
         W1DN9RRK/XE/7JfnfkVZuEBlANR+iAOvkoa4Hwo/RkcRwFTodstzX6fa55W8xLNd/iRd
         bqUJfQLKWMrOqQ/aWtqSvjIxs/z8x7KqopyTVv1wkI0t9S36Om66fIZ8KQJVIattEbib
         tYP1Do3FJv4pjSHeHqg60ROUunb78415jaTx8YqMjjDP2pGcZMpiDt/kfbAu4k49QsgD
         CseCntLzOwWs+2fNF6BSLpXtUSxM8Ba/bRCx2NQvHkAdl5EyC8cYYhtUmZLaaqyS+1n1
         IXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716476739; x=1717081539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7neT5eys302Amd8BRdf9WiVW3g1p32Dv9F0d8apRSUc=;
        b=mU1+opMySPsYaZUSiUPIFPZ6b10HXsF6IVuyu+gaYMZCmU0iARam+xydkLoSjf3QBs
         DqIDTlE8XkOkiIorKKEuOHe58G9SlrwAa1JKv/xLUYPT2H0g6piZH2H3UuJrsCix9DlV
         v4ExaokP7gdeH/acndynRpk0WDqxX8yS1Xt2mER0NLNLGmrrvqny9XaczouCApNFJvQc
         9L6K3M30JJKZlDf9XXIaNWOtlcPzHV0Z36R8sfFzoUhh4bd+3JddQsRvSrcmUIqhnqGj
         S6YhOjbQCRIDJEPEaCJpG+ZDJ3AASYhpheXNpRgvyRHNCArQEQ6Q8PcPHFtvBEiv114x
         tgwA==
X-Gm-Message-State: AOJu0YweVBfylSL7rnvLlScu6SXFScUpPgAtPwj652k+2PRn7NLhwHUx
	osqoCOelKa/929DmcxHHW6VOwvauBPryWGkmnQ2kKnIJLAJey+xSGWDuizsBEsFRmU05lmXSBON
	zsbw=
X-Google-Smtp-Source: AGHT+IHuO2AJMxqVQJPfn4UlmQbcFz33w74ZIQnC6wNwRsyPf2VDL1tGtAmW39QjMzo8MiuVjDI7Nw==
X-Received: by 2002:a05:600c:3588:b0:418:d6f2:b0c1 with SMTP id 5b1f17b1804b1-420fd339afbmr41449705e9.26.1716476739086;
        Thu, 23 May 2024 08:05:39 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100fb99e8sm27571355e9.43.2024.05.23.08.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 08:05:38 -0700 (PDT)
Date: Thu, 23 May 2024 18:05:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: lars@oddbit.com, Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v4] ax25: Fix refcount imbalance on inbound connections
Message-ID: <8fe7e2fe-3b73-45aa-b10c-23b592c6dd05@moroto.mountain>
References: <20240522183133.729159-2-lars@oddbit.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522183133.729159-2-lars@oddbit.com>

On Wed, May 22, 2024 at 02:31:34PM -0400, lars@oddbit.com wrote:
> From: Lars Kellogg-Stedman <lars@oddbit.com>
> 
> When releasing a socket in ax25_release(), we call netdev_put() to
> decrease the refcount on the associated ax.25 device. However, the
> execution path for accepting an incoming connection never calls
> netdev_hold(). This imbalance leads to refcount errors, and ultimately
> to kernel crashes.
> 
> A typical call trace for the above situation looks like this:
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
> On reboot (or any attempt to remove the interface), the kernel gets
> stuck in an infinite loop:
> 
>     unregister_netdevice: waiting for ax0 to become free. Usage count = 0
> 
> This patch corrects these issues by ensuring that we call netdev_hold()
> and ax25_dev_hold() for new connections in ax25_accept().
> 
> Fixes: 7d8a3a477b ("ax25: Fix ax25 session cleanup problems")

I thought the fixes tag was:

Fixes: 9fd75b66b8f6 ("ax25: Fix refcount leaks caused by ax25_cb_del()")

I've already said that I don't think the patch is correct and offered
an alternative which takes a reference in accept() but also adds a
matching put()...  But I can't really test my patch so if we're going to
do something that we know is wrong, I'd prefer to just revert Duoming's
patch.

regards,
dan carpenter


