Return-Path: <linux-hams+bounces-95-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0CB89F1A3
	for <lists+linux-hams@lfdr.de>; Wed, 10 Apr 2024 14:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F24701F229C6
	for <lists+linux-hams@lfdr.de>; Wed, 10 Apr 2024 12:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B0915ADB6;
	Wed, 10 Apr 2024 12:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sAKrDavZ"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B3C1598F2
	for <linux-hams@vger.kernel.org>; Wed, 10 Apr 2024 12:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712750585; cv=none; b=tK/4osEAi+ujPmeDqnTom7HyXf0SIEQVsQNpW8WPp2vcWdJjs3aFbe/5KTAw1+8qXHVHS+ys2/YPzTTJsLkO11qTSOjH+kcYhlklvuYMOF9KGXyMJgfR8YPab0bsKSXxlR+7/whoyrAcSdHIof8ucym+4YIMtvSV16fbrJfXhM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712750585; c=relaxed/simple;
	bh=dok3CoQZBUOxfJkd2mS5KGUGBjCD9hGgbtuzSDZ6INw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXc57tomWgVvNA54HmFF/RmLFMAh7Kp8U88AVbXWELazdpaEHpkI0Cvw73nv0vsjY+OaqTPeuCbtN2iFqw0Cq+gq8NS9V66rdBsVot1r+jr7/gMuaio9mwQ3u4znGXUmKiEFaQ0ekRHAXgV6HjxOeag8BgGMdYEyvXrfCIvTJgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sAKrDavZ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a51d05c50b2so427784666b.0
        for <linux-hams@vger.kernel.org>; Wed, 10 Apr 2024 05:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712750582; x=1713355382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fXWSezRddsH2Km9288DfQApZGX3jnO0FVLNyfITLez4=;
        b=sAKrDavZEuxoxdtwfBUvybgkeZjZm0z+CoaZfj/V1iv876kzMutZ0M/OvrQa/EpgHo
         ijgwSsdFpzJwlqhWYqmMOWKZG4yZMXpkSHCh9c05tKbAvk/sHyhNMFJyG8UkcKDzGcX5
         9bjv3nEHxxSlxI+Jz3LF+9jkGdGY7GdT4AJaQIE58sw96oTF9eOsC+QRADYD5WfbCFuE
         U6/GsT89BVVFZOruBKjmFsPmOJIyZDj+jo0Y7JUgrTbC9QEMtQpDo2zwzftKi3c3ZpAX
         C28QMy43dotw9yE+p5WyP8l++LKAeyZ8MHw7Gx4BRoiopixSajE+LKdcpKopQYt2G2JH
         THng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712750582; x=1713355382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXWSezRddsH2Km9288DfQApZGX3jnO0FVLNyfITLez4=;
        b=O5mPSktc+wG0M8UtBHseIJmCtgW2SMqbxdq9TCf1heeZdS9wOp9H5tzIMijwjrXcl3
         fmoaEcG+Y70sN6jFe363A/4Mhe5XaQ6wIkV43HLkhb3Wwu2KAj46TaUPU9pMVAWTGVb4
         2FJfcWFzQfW8FwZLLhkLwv2H2i639Bvauisr81YZ118938xlPxsfqKO2u5c1BoRWxkli
         7JLRtuVcT/Xy93OR+MDPbAElLCCCWnPlXGabRJH50nBjrORPVn0+IPUgCMje8xU/5dUR
         VoD8BI9WNmDYnrQucpXUKEqckIGFxKpWuk5tymlJHAOmMUG9x4nG7JHTLEdWeFZ7Zc26
         ZcDQ==
X-Gm-Message-State: AOJu0YyYL97tkss19EvfyBvI9tLV1eL8twDwQF7j4+XzkMHcBTZnaQq8
	fZ9Hm2oiS0rdaK7TlgSljItxFGIUtdLDcJqEflmcvRzNjk5uOqTmyuWRGe3VlGs=
X-Google-Smtp-Source: AGHT+IGprlML/cRRnm/+dpABy8kccptOOnBCa7Fi0mO8XTRiXPA4G/dItI3aHvNHaQBLOf7sVhtw/g==
X-Received: by 2002:a17:906:4a54:b0:a51:d1a7:ad6 with SMTP id a20-20020a1709064a5400b00a51d1a70ad6mr1413608ejv.76.1712750581714;
        Wed, 10 Apr 2024 05:03:01 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id v20-20020a1709063bd400b00a473a1fe089sm6881662ejf.1.2024.04.10.05.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 05:02:48 -0700 (PDT)
Date: Wed, 10 Apr 2024 15:02:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: linux-hams@vger.kernel.org
Subject: Re: unregister_netdevice: waiting for ax0 to become free
Message-ID: <98b4bd73-bfa9-44c7-ab0a-fe57115320ec@moroto.mountain>
References: <CA+Q+rdzYUcfYF8CcX1WOWjVBYiZgidFAY1M0kR4J4KL73yN9yA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Q+rdzYUcfYF8CcX1WOWjVBYiZgidFAY1M0kR4J4KL73yN9yA@mail.gmail.com>

On Tue, Apr 09, 2024 at 05:05:40PM -0400, Lars Kellogg-Stedman wrote:
> It looks there is a panic earlier in the shutdown process; the kernel
> trace starts like this:
> 
> === cut ===
> [   32.072855] ------------[ cut here ]------------
> [   32.074595] refcount_t: underflow; use-after-free.
> [   32.075777] WARNING: CPU: 0 PID: 1354 at lib/refcount.c:28
> refcount_warn_saturate+0xbe/0x110
> [   32.077104] Modules linked in: mkiss ax25 ...
> [   32.088624] CPU: 0 PID: 1354 Comm: socat Not tainted 6.9.0-rc3+ #3
> === cut ===
> 

Could you provide the whole dmesg?

regards,
dan carpenter


