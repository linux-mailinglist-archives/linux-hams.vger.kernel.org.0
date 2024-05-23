Return-Path: <linux-hams+bounces-318-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E118CD0C4
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 12:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46183B20D01
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 10:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6BC13D2B9;
	Thu, 23 May 2024 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DWQLaXaO"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985F813CF97
	for <linux-hams@vger.kernel.org>; Thu, 23 May 2024 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716461815; cv=none; b=S+IMkNL/3S75/4RfMU1aWM1fvoh8Zqqze3uWbE3bZEZ2tIepeTBOYXV8RB+63NhGPGjo5Rmh8HIiV6J/Hbjrs+4BhMWoh1DYBEClcLPO/JZstOAocyow2f3h+y48gvtC8SBcTL+uIT2vZaKPg4Iz/l58eahSYUuVV7Bl/c9F1so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716461815; c=relaxed/simple;
	bh=YO1XQo7nNtnm8WzWI1KN8oTEEAefnvH3PABXBM+AyQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8G4xXpecR38NF9joNvCJeGbduA3tEnAiCdMjXFxBTThl3IF+7tZJP4/ypNfYbhjOT1qWTDuqts/Y+a/OuGVmnq7pmGLt5crCQgod2/e4dDueIHm8tJj5Omu25L0db8ATWNJLFDIiggfbfQgakTq6IGpeBn9p7wZ90B7JvdQ6kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DWQLaXaO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4202cea9a2fso17388085e9.3
        for <linux-hams@vger.kernel.org>; Thu, 23 May 2024 03:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716461812; x=1717066612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FPBLGw/bVVgSkVYg9Zg7QdXAu6Lpu2YsqgligqgHQoQ=;
        b=DWQLaXaOFEOhjrM805Jl1dBsAppaVv0Bw9/Cxhw4ryIxZH0KzxHwTwwtZN4JucYtzS
         ak8ydcbuLZkomW9kt3Z1bOJK2o+TSiPIRjEbfzxd2BFoYkD59Qawa5rvgavH+AKIp3rF
         1Gbe8PkPqYU5oXg/o4/SEVcgiq4IVXHb6vn4b6BZnBW6E7OokJUKtLyfyoW/NVPzgRAF
         tzmBUd2U3nWuYQnQD7TcGv8XKus1+Z7j+Y5iKGoIlnjYAzFFFHnwnk18X0Kbv33oZZnP
         SN4rucEiptJxLSXGZEC/bAoCLdBHxiCsHrS53o2NBTNaLcRIRvqaWm1RZZ9PX4NyFqFl
         1cWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716461812; x=1717066612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPBLGw/bVVgSkVYg9Zg7QdXAu6Lpu2YsqgligqgHQoQ=;
        b=R9CxCrksjmCMJwWwrJwFMPi4JTkbUk5jkpjQ9HejaCy9RBoXDC4yiaG15PahQsruo2
         UOPCdnvrO7DqP9Nx23Hmemsp0xpTcRDZU3FflPx7s0nBnshux9x/Y60+6SM36p2wbm52
         LNznpO8a85DnNxqtr2ixVRK6sXeNJlavLNWF0Cikh5ojKdtMf12swsrB7vxlRo5OM2af
         YxeI06GhH+cwpJg2/AjgApJSMIBeoqUp+hjeGS91erRPMviWTvSw1qrHVjY3aqYQ09X2
         wbmb9v8s3xG7HdOkIoSEKXRIdnNPRa9HUmUyyZa4eWeiOA1LE5NGOY7MfHr1AHIrcrHX
         vhZQ==
X-Gm-Message-State: AOJu0Yx79nq2M7Chr8iDTSH9RsKVUztElyp/II3zeiI4boRphkzMlqYO
	JLqyPGzMitF9cA3jeoXuoBVdq0eQvGd7XVef2ktOFojo4uB1zQ7mMbWuR0ksNsCVwqvQDN/JPsG
	rItg=
X-Google-Smtp-Source: AGHT+IHSIixrjgiLinjRsHdbBZMwjn8J9QjzP9OYg/VhRaGLRVIjShK+lV/hEqjegYcpOIIpmntIbQ==
X-Received: by 2002:a7b:c84c:0:b0:420:2df0:1a9b with SMTP id 5b1f17b1804b1-420fd30e5ccmr37461075e9.18.1716461811701;
        Thu, 23 May 2024 03:56:51 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f7a52fsm21835765e9.28.2024.05.23.03.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:56:51 -0700 (PDT)
Date: Thu, 23 May 2024 13:56:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Reiner / Tania Hagn <DF9RY@darc.de>
Cc: linux-hams@vger.kernel.org
Subject: Re: unsubscribe
Message-ID: <88f29588-965d-4586-bcbf-9433e07f34f7@moroto.mountain>
References: <3bb96528-20e2-442b-bab4-db98547cc3f1@darc.de>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bb96528-20e2-442b-bab4-db98547cc3f1@darc.de>

On Tue, May 21, 2024 at 07:04:28PM +0200, Reiner / Tania Hagn wrote:
> unsubscribe
> 

Send an email to linux-hams+unsubscribe@vger.kernel.org to unsubscribe.

regards,
dan carpenter


