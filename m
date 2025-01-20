Return-Path: <linux-hams+bounces-470-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D18AAA16772
	for <lists+linux-hams@lfdr.de>; Mon, 20 Jan 2025 08:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AD331883077
	for <lists+linux-hams@lfdr.de>; Mon, 20 Jan 2025 07:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE531922F3;
	Mon, 20 Jan 2025 07:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bGNrYKsm"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53E61922E1
	for <linux-hams@vger.kernel.org>; Mon, 20 Jan 2025 07:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737358812; cv=none; b=fyBiOk6lcMFtPZ/ism00F8qnzSce1LXmyX4pxYRMmlqDkMt2Gp+qkeci1ZyxG9A1UD4c8hYV8G54bJrmh0ZEYHz/apFKhf0daLlm2LO01Ij8iU9CKYaF709pMXJcqoR4HMJmjZKueyus9yRAZq77J/9UrvGaYZn8k/f1re6u+gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737358812; c=relaxed/simple;
	bh=YWIHq1/W3DMDvM/aHqt8Pnp1a5M6SlkR2kR7Lyu/8RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfpOB56hacayDNxrsFheKs2bGSJhLzi6eCo6Gkkt5bR2/VEmokwvI9oeYcFs4X4T0LmTaBca1QCXhQg5biO7wkClY+uxK5PnyyQIgPDkHd49zVRNhFT/UWMzZdkmHDPQimRoHU65SubzmHN5d+KUnWTpjDabl64tTUdRIflN14w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bGNrYKsm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43635796b48so25815665e9.0
        for <linux-hams@vger.kernel.org>; Sun, 19 Jan 2025 23:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737358809; x=1737963609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AE5EKEi1Hcz44IBUtJMS+BPfCCLOfNQz5T/5k7bksgM=;
        b=bGNrYKsmgeE6C311llspLLfg3iqfRcZTh7JhxjlrxCT7/dp7XyriDewssYRuuHYBtV
         jpA7jN00pkdNMF+FUhmwCVJV9EQjGmikwOElI+2bg58zEZ72DKp+Zs3Ffc7ZhlgKArom
         QiK2Ew957ctKBoDSgk6mgGyNtYiXfpYL+D540NQhb/Z2KdJd5h8Zj+CtH3s5zEmr1pLm
         m5QCAFZfOj/3qbdUol/r98AJnAoOLbP+qH5yZ7sDvBEJTsy24vg04C+wIpG517XW9mHf
         pSp6kU7sg8RcYIHmwK6Vfr4KNIZyL9oEwEY+22I8SdaGYPl0u1MhuePuDNkoAuVqnWsu
         u+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737358809; x=1737963609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AE5EKEi1Hcz44IBUtJMS+BPfCCLOfNQz5T/5k7bksgM=;
        b=pqf9T8g18ajWZvHE/2rQovczC/fVlhS2/Ha7qfhBLhqEGrcOdfzX0LxiBG/I53D+zC
         yw6L0r6yZCUqUXDV4RBN2ePRQ7sDbkutXpNepvIJY+HwvV6olwRS88dEaYSMyDsLR0Ux
         HBkhztSgX1qgMoCHjKV7KqKYIVzlpQjJtzU4J7/dsjbM4/Raia6iAlVqU6LswDfProHa
         Qod87cS2ETyBjsfpKZQCEMihA+2VsioxbJAJAV46VEnU0cTsd6b5OAb8PfWHg45oygyC
         yXHfxpDicXOaapmO1OZMfGqVhJyFCNu17XFHQAUupOyxuFzdtA1F4/Ne5iJwrRawKYvO
         EGRw==
X-Forwarded-Encrypted: i=1; AJvYcCVrPDEWgsSR+a3pO3CnS5hZoB2OqfZo/X8REoKMk72VNvRp754TJD3l0vyn4RU6AGoDvZPb5VNRwcp8@vger.kernel.org
X-Gm-Message-State: AOJu0YzxiYHahUwjWfJ/YA24kclKsTqWTqCWoYgoTQv1O3dfyqiwOan+
	hUrtf3MxQzm5a6DPd3rStgilnwLKfcPbbzWhQIktgtRxq9ipD/N5+Sz3A4eN2Xw=
X-Gm-Gg: ASbGncsKx0RCexTrdkiNhJm43apNbD5+POqQVmMuEBnI5dLRVjv3yJipjCQf0di0tcp
	FNn8lEMtG3g91e2mQI1FEHd4kNhNl1aw5HAGy/64G5IFspzeRryvL9yEBt3SFpgNvy8QlupAk+V
	9ve+TW8Kjn5mEzlgJlzusR9vM5opwVPI6z2PqVctuj0XH3xNJMOkur+n1JQFoZShqCFPuxEaXfv
	IoIiF7CmAXbfxWcdsXVMoip3CeceRZDftKU5LSYiJEPd7NOUjJl7tvUZUqPMObxkqszi1WKVtU=
X-Google-Smtp-Source: AGHT+IHY++/helopgOYKIdJhr5Gy0IZlYkzhzZB7FO+q932DyRrjCnxNoMiK12Z8NjK0J30FLX967A==
X-Received: by 2002:a05:600c:4f55:b0:434:ea1a:e30c with SMTP id 5b1f17b1804b1-437c6b468a7mr183634345e9.13.1737358808951;
        Sun, 19 Jan 2025 23:40:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890413795sm126097405e9.14.2025.01.19.23.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 23:40:08 -0800 (PST)
Date: Mon, 20 Jan 2025 10:40:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	"t.sailer@alumni.ethz.ch" <t.sailer@alumni.ethz.ch>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>
Subject: Re: [PATCH v2] hamradio: baycom: replace strcpy() with strscpy()
Message-ID: <92b603cb-a007-4f02-bc81-34a113a04e7d@stanley.mountain>
References: <62yrwnnvqtwv4etjeaatms5xwiixirkbm6f7urmijwp7kk7bio@r2ric7eqhsvf>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62yrwnnvqtwv4etjeaatms5xwiixirkbm6f7urmijwp7kk7bio@r2ric7eqhsvf>

On Sun, Jan 19, 2025 at 07:34:51PM -0500, Ethan Carter Edwards wrote:
> The strcpy() function has been deprecated and replaced with strscpy().
> There is an effort to make this change treewide:
> https://github.com/KSPP/linux/issues/88.
> 
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
>  v2: reduce verbosity

If you had resent this patch a week ago we would have happily merged it.
But now you've hit the merge window and you'll need to wait until
6.14-rc1 or -rc2 have been released and then rebase it on net-next again
and resend it.

Anyway, if you do resend it feel free to add a:

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


