Return-Path: <linux-hams+bounces-323-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F688CD9C9
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 20:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E7F91F22545
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 18:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6C97D417;
	Thu, 23 May 2024 18:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QgtG7xdf"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAE2328B6
	for <linux-hams@vger.kernel.org>; Thu, 23 May 2024 18:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716488596; cv=none; b=ETLWYvfApGniDQQ2G/+rcqfL2pApvwl7bE3QoTJn+78OuaM+pFAN1YigTCrE22iH9nc1JL3mcA4lA1qJR7wN1MMLTVW4gBdnkWTq34XsCREEunUEHw9ECCLbjI3tSG5aE/9JiyVr5Jvva66HQB08BqApEVMrHg4L2gQpTEjhLp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716488596; c=relaxed/simple;
	bh=YpLORyNL0Z5yk+8up8p9RuJQ5UV1uELRAJgfKqVMjik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTSNn0f3yhRNPLSCdntCkW36TTz7dPx43psn+BO8MXcXbpQ7cw4hDaTBQVmYv2OjSo3dfEd3XhKQ283tQva61UtliqULWXglm7GkLNfMgYLrVYkmpEUIKzlY2v1qZWFwlDnEwIpyR77+F07/tqtVYTMWKwBqJUbbmUYUWUN8FxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QgtG7xdf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42011507a54so13943585e9.0
        for <linux-hams@vger.kernel.org>; Thu, 23 May 2024 11:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716488593; x=1717093393; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T0KoAdrCeMFcRSCQt6aCHjBcz1Lyjopl+ImFWGgoJ3w=;
        b=QgtG7xdfyrrG9oXgNjuPaCgxPCnpTacfJKnKnFdmX4+NfQmgfDMy7oeVeHkQLPDc1M
         wDIP/ySG9RhyjBuzc+evjo6pNBgYoNp7El9C1NYSSRVDOfAKfRHQKtXDzLfny84QJNxp
         pBocDIbMicg9/z1swDdDrRVJsGD36nPi7z8VIejNefyRiKpIhwHZOnNgP6C8e6H5cw3D
         lQB/42/LvK4QKqU3MPQlgKHIzY+6PMcNPAVGW3AMI/ANZdNGhp8NjZ3VurnznE4nWugc
         eGyOVNP398HMVYCVw1V7VZ4uc8/N4Ja1ysaxkhp7xtGBptZpiyyYGzdYl2vKv7bcxmSa
         mG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716488593; x=1717093393;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T0KoAdrCeMFcRSCQt6aCHjBcz1Lyjopl+ImFWGgoJ3w=;
        b=Lu5CnRlmXBiugvp23MvnW8odLxoRZu+cDNTcqR8PUPTax/SUPbCl17jQoomtF83toG
         dwq+jug0j9mIvsqp8/WBl+cmFkpS3yo86IPsP7vN41EGhKD1GscV0wokgZcASs1UnHyC
         lsAAjroGe4qCAJ0PLSF4Y3oKIJpoZ0boJbh9P0V6kpWOfFbhZuOTY/ZaeMxviC0BDBMh
         h57hoZXGOK6eQ5nVy+q5WkH48NT03lC0+NzhJZzn9TZU1K/yDB1XxS4KIRjoAwGOFKEv
         /qAIt6qOi7L/xhXSrs7RlcoTCDpVQiwLa2wJHWVfpneB/rFDHKzPSccGJogpfAv1Sbsm
         FRyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbdDJZrLrdiXdsgXmPgcw2hQXb2SfHSgesZlV1YpAcvcE0NwrKXt8K+mqu6S1AFPtCxuA5iNG+mS34kYe0ZYZJCsupsbvdJWAuIA==
X-Gm-Message-State: AOJu0YzdGfKR5BuTX7nXElzjZzVtDg737GTNo6Ki4rL1Y+LJKHw0/hVP
	lxrgT6Xxh2RXbKubrsT9G66OOVITmW9bQKBo0MoDdi2RATx5WW7vhJ/nFYWHUF8=
X-Google-Smtp-Source: AGHT+IF2EUkBbtjoxY0yn3TjeLKgqYZNDfBbPj7Rfpf6qhx+77pv2KbhnygJndDp17D3vM4GOa5WZg==
X-Received: by 2002:a05:600c:1c24:b0:420:1a72:69dd with SMTP id 5b1f17b1804b1-421081b9359mr1928915e9.10.1716488593136;
        Thu, 23 May 2024 11:23:13 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f69850sm31273065e9.26.2024.05.23.11.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 11:23:12 -0700 (PDT)
Date: Thu, 23 May 2024 21:23:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dan Cross <crossd@gmail.com>
Cc: lars@oddbit.com, Duoming Zhou <duoming@zju.edu.cn>,
	linux-hams@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v4] ax25: Fix refcount imbalance on inbound connections
Message-ID: <61368681-64b5-43f7-9a6d-5e56b188a826@moroto.mountain>
References: <20240522183133.729159-2-lars@oddbit.com>
 <8fe7e2fe-3b73-45aa-b10c-23b592c6dd05@moroto.mountain>
 <CAEoi9W45jE_K6yDYdndYOTm375+r70gHuh3rWEtB729rUxNUWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEoi9W45jE_K6yDYdndYOTm375+r70gHuh3rWEtB729rUxNUWA@mail.gmail.com>

On Thu, May 23, 2024 at 11:22:43AM -0400, Dan Cross wrote:
> On Thu, May 23, 2024 at 11:05 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > > [snip]
> >
> > I've already said that I don't think the patch is correct and offered
> > an alternative which takes a reference in accept() but also adds a
> > matching put()...  But I can't really test my patch so if we're going to
> > do something that we know is wrong, I'd prefer to just revert Duoming's
> > patch.
> 
> Dan, may I ask how you determined that Lars's patch is incorrect?

The problem is that accept() and ax25_release() are not mirrored pairs.
We're just taking the reference and never dropping it.  Which fixes the
use after free but introduces a leak.

> Testing so far indicates that it works as expected. On the other hand,
> Lars tested your patch and found that it did not address the
> underlying issue
> (https://marc.info/?l=linux-hams&m=171646940902757&w=2).

Yeah.  I've said a couple times that my patch wasn't complete.  I keep
hoping that Duoming will chime in here...

> 
> If I may suggest a path forward, given that observed results show that
> Lars's patch works as expected, perhaps we can commit that and then
> work to incorporate a more robust ref counting strategy a la your
> patch?

The argument for this patch is that it works in testing even though we
think it's not totally correct.  That's not really a good argument.
Like we can revert patches that clearly don't work so we could revert
Duoming's patch, but when we're adding code then that should work.

regards,
dan carpenter


