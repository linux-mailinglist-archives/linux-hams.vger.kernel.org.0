Return-Path: <linux-hams+bounces-183-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB2F8B8F26
	for <lists+linux-hams@lfdr.de>; Wed,  1 May 2024 19:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 666EA28379A
	for <lists+linux-hams@lfdr.de>; Wed,  1 May 2024 17:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D7612FF97;
	Wed,  1 May 2024 17:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eUPQZn5d"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997C314286
	for <linux-hams@vger.kernel.org>; Wed,  1 May 2024 17:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714585426; cv=none; b=QQEZwjIAFYoxwYEvHa18Fi1sad7D91AsUXEgdnU/eCzQ1fLOE97cXoB+KvnZt/ZQuhn4qYcOQek2Q3UIG0KFhGA1T3l6JNq0cB65Sjzq4MmPhDqcj1jgXgvm43UGmh1bf9IGDRniETngf4SYajAgNyEg+nKYBhXAt8EBTXtA/So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714585426; c=relaxed/simple;
	bh=3bmTWYwRFWLcqerdJa5XqE+bQEiJYPRaVhoVBhWPBHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0NpOkiYpduRQWO0Z5VLh9U7h5DWENM8ZTzO2aw32GLWapSy3IvoGIT4nC7xJUpJRTIL5/3DHrXcYofUYdXGVUNOkSwT0E+qjRAWzg53DphxsWWEkDWniTkE9RpH3aOlhTy7rNUq+CA3kaoW3pq9Tpl/PEBLGy3ABZxfsRDMhcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eUPQZn5d; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5176f217b7bso12377958e87.0
        for <linux-hams@vger.kernel.org>; Wed, 01 May 2024 10:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714585423; x=1715190223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3bmTWYwRFWLcqerdJa5XqE+bQEiJYPRaVhoVBhWPBHU=;
        b=eUPQZn5d7TaEoJSsjp25jtx5rg24DhMR4W3IErzep++MHMNOXuhjd6NvpVSKMnfD9h
         rQKPXgZ2yTuLdTi/CfX5xCCDONQ1KaJ+r9cGfA6qQ8pI85hP878bIKTIGHLL54QUYtWj
         7XbaotcFIBR9yID2Wt88+uenUlqXW4gZDVseFiShCE4ZXLFJ/hDMhuI9PjzQcFqBMv8W
         jS6Ip9nsARfaCXNYnA2jTOt/8HH85VLcUIZkc4+KF6kFYLKyyqDPAOwEx6OWHS2AGP4P
         s2CSq71js5XPP7h9FndO1C62XnEn0OwanCYV8LkX1SndpoQhSlEhy+fJiynNzHg+PL62
         RXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714585423; x=1715190223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bmTWYwRFWLcqerdJa5XqE+bQEiJYPRaVhoVBhWPBHU=;
        b=nXsMne7cD2SOC+9XYhQ/YUmHwexgir23CJ7gf+3IY+NGjWN2IHME3tXWUK21XupqUp
         BsgF4TvxCvy9mHqjOskEr0TyPzhkLJ8tuMoc3HR79yZMuMgXd1+WLbcd+kO7THVM18Wj
         9rSFyGimePrYm8RzuqOnTF1Rc1QC9Z1K4pU5Tau4EgJfyVUU7aX65ZNrSu9IMYwjvQAm
         G2Xtti6pV/LLW7gXOhzoPlG+5NdMznc0OVZnmSO1JBTClhQK5AT5aCqxlBXw8ghPtbkh
         ZOeE4+Y67iKpnNMx+r/OBWTspEjAnZWW9As4RmrmlpSEGlgqF2HBXGaprkSjGgFcIH7J
         uw+w==
X-Gm-Message-State: AOJu0Yzna6b/vE3+Al3p0lavGhNeWLmxBHguJGuqVlFMVvRBKWE8O7CY
	fUspG9Qfd/QZugRWfCQx2Exg3TkiMBiWCWQl8oSdWWbiOXF0kispmx2QtseNIaU=
X-Google-Smtp-Source: AGHT+IEfCIWUVgqYXG41TceguPXTQ+LH1imEyNeUiPyIb+1mgoogJOusr6dty/3f0bMhz+BELrLJZQ==
X-Received: by 2002:ac2:48a1:0:b0:51d:9e17:29f0 with SMTP id u1-20020ac248a1000000b0051d9e1729f0mr2326819lfg.24.1714585422462;
        Wed, 01 May 2024 10:43:42 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id c15-20020a056512238f00b0051c76aff880sm2212482lfv.43.2024.05.01.10.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 10:43:42 -0700 (PDT)
Date: Wed, 1 May 2024 20:43:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org,
	edumazet@google.com, davem@davemloft.net, jreuter@yaina.de,
	lars@oddbit.com, Miroslav Skoric <skoric@uns.ac.rs>
Subject: Re: [PATCH net] ax25: Fix refcount leak issues of ax25_dev
Message-ID: <7fcfdc9a-e3f3-49a1-9373-39b5ad745799@moroto.mountain>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501060218.32898-1-duoming@zju.edu.cn>

I'm always happy to take credit for stuff but the Reported by should go
to Lars and Miroslav.

Reported-by: Lars Kellogg-Stedman <lars@oddbit.com>
Reported-by: Miroslav Skoric <skoric@uns.ac.rs>

Lars, could you test this please and let us know if it helps?

regards,
dan carpenter



