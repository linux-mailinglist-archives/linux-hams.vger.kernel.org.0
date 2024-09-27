Return-Path: <linux-hams+bounces-428-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE70B9885BB
	for <lists+linux-hams@lfdr.de>; Fri, 27 Sep 2024 14:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36B0EB21482
	for <lists+linux-hams@lfdr.de>; Fri, 27 Sep 2024 12:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4ED16D9AA;
	Fri, 27 Sep 2024 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ytYUaVYa"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1082718C34D
	for <linux-hams@vger.kernel.org>; Fri, 27 Sep 2024 12:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727441746; cv=none; b=U+KWXZ5agIzxib6JIZgdgl7Yv6u4S6ttDcgQUag7qQXCl6G3889oLdPBHvrGyN7rjZ0C2nNyHKRnX4nvIb5JxVzy3SF8RXXO9/wMnWMOHomYm2ZmzcZg9QLRdvBwk5pTJRqiMPRSGtyFqqhzqznMs+vINXFXDlzAfSyhrbrGNAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727441746; c=relaxed/simple;
	bh=qLD+K+EM+QykrR5wQ4RFPkwTk68QeSkZLe8HWKzj8KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtcyTH/O5N4E+S3ALowMNQ0mZ1i8+2Z5+5LeFPdwnV+21ez7uJGMDFK0AK5nkyy1nRBrvscx1P0FYANsni7EhP+1G3DKxVBLLAlWLUa8mi2YTItQYf1vP6SvbyNamQxCFdca3pgCTbysiIevhaKM8BDCIxkt87VL4VaFnt3I45A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ytYUaVYa; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42e5e758093so18173335e9.1
        for <linux-hams@vger.kernel.org>; Fri, 27 Sep 2024 05:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727441743; x=1728046543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7G1zAS3+0h+YAHD5sa1v09s7BPxHMz7BLX9PumSuY2E=;
        b=ytYUaVYadaagnhXQXmHKm+hvF2GFewWy+fbxIvBbMpHdp1gmaytVFMVgY2kMs1hJ0w
         E5vQN4nhpEMxDzDXItmBs7bEiyPM0cieZqKF5Tp58PPtlKRGDKAhfvPwGpGThVzkEYW6
         yP9/qbhoxIZW7EocbSyoRvttMXLz4v/p4gjs5PnoTBW5zbUQX1vlP1opphsvTDKPmvVi
         urZqvGm94E2e/My8QI2VNFuyh/uqQ9HG0oP8oF0tMqTDguXBdVjaay7qi764kEINVrxZ
         gR7zhM+V8yufgb+YkzUwfPdKBj0JmMxg6TAVeGLJzt4EPs5Zo/P6UyhgQoHF1nPq8PaR
         XZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727441743; x=1728046543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7G1zAS3+0h+YAHD5sa1v09s7BPxHMz7BLX9PumSuY2E=;
        b=UbK1QcH8Gl4BqjL3P9wotatjfnW53RvggFO25jvonqpqrx/SC4gswSi9X3CM2bAxw0
         ovBfCMT1otplcwYpa75NqySUV2KETiKwQZD6LOpplwtlu5iuo0QiGgwjXwvq0+b/3G+/
         OBLz2hHgKHg9a1wd+CaX8ua26TOXTAESHZoTYt2G+k3skyiaPmwCWrEuTY2r9v2EowLD
         YOc4SCgCFlViK4YnDr+XWoDSB7Uethdy5zsfBvbb8L4vLPpMVGVocRq7Fp7lFJ/VubsI
         8rVIdti+Dr5P+Cj5HHSGSvMxbAHdmaZychTQJaM9+llV7qwmoPrkkbL8NOuCnypmo3Jy
         iBDQ==
X-Gm-Message-State: AOJu0YwirDUDO/AXuPPXRfZosaVLPt1egmW/sGNrIZEaGV8/8pF3ngdT
	oTCXOPgkHjFRfmxVT8JnBfeOAhNBA0UBVBL0hBUFBs0N8unpPkZrPom/1IBGoBs=
X-Google-Smtp-Source: AGHT+IHZ2qaUlhcJ/Zvsw3e63WKCE7ik2WTtg8XEqVxItlGGuypG5O6MgmsUgczWrnsoAMdw021MyQ==
X-Received: by 2002:a05:600c:5642:b0:42c:c401:6d8b with SMTP id 5b1f17b1804b1-42f5840cfe0mr22744985e9.7.1727441743165;
        Fri, 27 Sep 2024 05:55:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969f1a76sm73331375e9.12.2024.09.27.05.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 05:55:42 -0700 (PDT)
Date: Fri, 27 Sep 2024 15:55:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bugspray Bot <bugbot@kernel.org>
Cc: linux-hams@vger.kernel.org, helpdesk@kernel.org, macro@orcam.me.uk,
	konstantin@linuxfoundation.org, linux-mips@vger.kernel.org
Subject: Re: Bouncing maintainer: Ralf Baechle
Message-ID: <f74c4234-a091-4cc3-b92b-469f506c16a5@stanley.mountain>
References: <20240925-flashy-innocent-goat-afdbe8@lemur>
 <20240925-b219325-df57a5dbcddf@bugzilla.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925-b219325-df57a5dbcddf@bugzilla.kernel.org>

On Wed, Sep 25, 2024 at 03:30:26PM +0000, Bugspray Bot wrote:
> Hello:
> 
> This conversation is now tracked by Kernel.org Bugzilla:
> https://bugzilla.kernel.org/show_bug.cgi?id=219325
> 

This bug is Access Denied.  No need for an email when the bug is private.

regards,
dan carpenter

