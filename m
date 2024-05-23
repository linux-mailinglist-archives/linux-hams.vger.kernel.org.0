Return-Path: <linux-hams+bounces-317-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD70D8CD061
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 12:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C8E71F23E15
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 10:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAEF413D2A7;
	Thu, 23 May 2024 10:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sWbli/jJ"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BDF13B59B
	for <linux-hams@vger.kernel.org>; Thu, 23 May 2024 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716460268; cv=none; b=MKWwDZ824li848ZrbZctkjL1zCO0R/MH2T/76oJgj4wZYO3n1Ls3pA5csWX6T9vPN+zFvmJlYAT2tjVbrUP8cUX51nD7iJR0GMOqTMaoL8vzZjMvXQlBniaIwAaIiYIXcA5cb2roZTFWl7v+P2ANt3kREiHzLjbfdIlHq5O95m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716460268; c=relaxed/simple;
	bh=sF84YSsy1tBhJYfwoRhZxXLjVeqnhSeQSeltsMFLERM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKNd8Zx/Ua9Xdhb3IzcUi1Lu8nYfn2qCy3jHSoN3QiixC9/JsGwodUeyZ+DJyYJMjsfAGAqbZm8GrL1MGE8ARmkZnhghLO2BQG1isx9WsM8/9aRSuhE4vPQQQwNGP+dO5hpXTrLuEYbvmgL4wHVvhXRN3uPxFmRdOmJvTFrkynE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sWbli/jJ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e538a264e0so104343791fa.1
        for <linux-hams@vger.kernel.org>; Thu, 23 May 2024 03:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716460264; x=1717065064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZCWh7GpoMncXFfpFdlsZC/o5mqcJH5ctGeXaQceYUE=;
        b=sWbli/jJ8SQrc/nQoYKIWj9YiTo+I+hZsoMQFDkv27S4/dnuQbDRToKC+rU4e72muz
         kMXh8+4OyVstQ68nDZeuBgdrWGNB/aNF5EN/jkHlEukP4h/CfdHAiJzbp4V6xSt2Cokx
         fx2fO2DOgeUtWXovftwuSbfsNdOEOzlvzzLY2s8SfBFqj6FosxtHenlP67triDhgDK27
         GEQ/hUu7WaNXmh5yhfQRiq6swJqKGCGmopRJRXtlQ1XCsBO7YYZVMHhZbysWFakpH6NJ
         wJ8Ox4N79ZuX9NgDUnHiAZfry97bG1Wui3UJQhdLDvh3U7qAktpIILJBlSC0br462pFW
         inKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716460264; x=1717065064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZCWh7GpoMncXFfpFdlsZC/o5mqcJH5ctGeXaQceYUE=;
        b=nAAZR/qmWXeOjQjS5bFP0F6q2WK7FLpU74zHzu+c5UQ3QTjbRvhJROYC++RG4ll7S9
         9KMbhpxi8RX6SIbditiRmMFX9T50GSaethWqdj/MOig4wR3rD54T5Uqm85gPBotUMQl4
         oyy4Tg6e0bE90Tpz+gCzmZtd3pXWQ6RYXKtWOi97fOqg4Yr42AGELmgbYvMVganyOkd0
         N1oETukVfkzMY52fUa6IQvHhuUUbD9/GgmtDBqnIq9VAplsH0N0BVWtALvcMRtEz8I+0
         0BgYOEOpkrmiRXdsIqgNadtqmQt7gWDYzEJBdRnoOjvM0DDbXTozMoBEI0VFUtacjnNU
         QnWw==
X-Forwarded-Encrypted: i=1; AJvYcCXggHXyXnw1mVH0113y28crRJ3+EudFWzs9qh2d7DkOF0U1ggLKORjODv8qIfM6DlJ8twJWnlk5QzlL1OFUaIAYkP5lLK6+npI/JA==
X-Gm-Message-State: AOJu0Yw0xIX3f21SFSrA9JfPLwY/jC4aP7HwqQRhUBHkK873gROuxp1N
	kHQUZuDKeNpVOdoPruoHa+tnx3EjustSjvymCKBKq83Q1BILnVIZVLpmQ+jztrLQJpOKM7rbXl+
	K8Gk=
X-Google-Smtp-Source: AGHT+IG/xBFwfsiN//yj3g2CEv3gMBvicpAHbPw2FMcxIztVl8QWRkpgTPAqXOZAARG5GVRFZZDJeA==
X-Received: by 2002:a2e:96c3:0:b0:2e9:555f:54e with SMTP id 38308e7fff4ca-2e9555f08bdmr8163181fa.18.1716460264024;
        Thu, 23 May 2024 03:31:04 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100fad638sm21338695e9.29.2024.05.23.03.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:31:03 -0700 (PDT)
Date: Thu, 23 May 2024 13:30:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: Chris Maness <christopher.maness@gmail.com>,
	Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org
Subject: Re: Kernel 6.9.1 AX.25 Crash
Message-ID: <3a316394-eb92-48ae-84f7-1fd8065cf86c@moroto.mountain>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn>
 <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>

I sent an alternative patch which isn't totally complete and hasn't been
reviewed.

https://lore.kernel.org/all/79dc1067-76dc-43b2-9413-7754f96fe08e@moroto.mountain/

But really, if we're going to bump the refcount on accept then we do
need to add the ax25_dev_put(ax25->ax25_dev) in ax25_cb_put().

The part of my patch which isn't complete is that we probably need a
netdev_hold/put() as well I guess.  I don't know what that does.

regards,
dan carpenter


