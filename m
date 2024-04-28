Return-Path: <linux-hams+bounces-153-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8958B4B70
	for <lists+linux-hams@lfdr.de>; Sun, 28 Apr 2024 13:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C9401C20F3D
	for <lists+linux-hams@lfdr.de>; Sun, 28 Apr 2024 11:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B205351C5B;
	Sun, 28 Apr 2024 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INH8PF0g"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B7128F4
	for <linux-hams@vger.kernel.org>; Sun, 28 Apr 2024 11:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714302122; cv=none; b=pa94fp+EDOR+mESHU0r/qQogiCM8Sk/D0PDENW2lyf6v2S4uyC5n20HhUR+g196ki3QHi11mR2vzZ6FC9xhMUTK5wJwZnzLoAtlPiAEzmsyCeLQqaCqBlZR6qvq4VCjlzRG/OScjgsunlPEPpWIExTiCeLfAW3PAIiF7LYBd3kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714302122; c=relaxed/simple;
	bh=nkJjJ/CNGHBY4HrxMyJWXVp1KL9cZf5hNMKYvP57Nmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITNZlvuVAaHZEjbMq+aeT5XX1nEwpQYStEqF/aCVyMIQXBuw5J+TQt1ctMT7O5P+71hAy041rWP5FKRB3fKe1aD8QHrSFfarLRoyZkHgadzyHXlAoTlKQu3r48/y/NpjFWJ/y6K0EoBu/+z+C9m/BxaGRKGNFfaVcaRektiqm7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=INH8PF0g; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a5878caeb9eso445382966b.1
        for <linux-hams@vger.kernel.org>; Sun, 28 Apr 2024 04:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714302119; x=1714906919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6+zf3vZRIMCSmw4zbiNDPpj4xP0u2M+NY2+FRP6afQM=;
        b=INH8PF0gcfRL+UnXg+DgcKln3el4limbFps0zjKJlB3yxa05L8o6nj99j+psaS3mwj
         u7WmCtVjITL67gPFdxfSzsh2H6mOiYETZ4rLZuhsYAjGdSo+W9xy0Cq1h9H5vAWYeJ5w
         pZfx1KmFtDZRnHU9xTVA5p0xxuO5yslq0UmEjCAzcD9Fc2TC/FYokQWU+A5ACSwDtX9S
         DDaNvJj/tFBaExge46XRLgtgU1RSyRt7dohVyBh1beAJD/m7bnr9DAt1kWmFUVDgJNRd
         gSmKbUkyhnOChYMavqswVuNEmJ3gQqkkNdH704AS2rRZxzjsYc2rZ3aThX3OZGCkbJ4W
         mPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714302119; x=1714906919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+zf3vZRIMCSmw4zbiNDPpj4xP0u2M+NY2+FRP6afQM=;
        b=VHUdK8w3agX1KRd71KDcHrOXF2vfdqGo9iJA0abGs5YTWGo4qC9fMyNRraHdyrB07A
         qspJIssglfv2xa+MEiTQxOi2/Nn12DgktbW1GzkByNsvhgodVEi57b2hdOI0w/t+PN7F
         EPCx1WxSn4o7mgUhktEuE4FMMxY23uL4PxPoO3uF5shnmXq6MFLk5ceqYA5OIHQNxeta
         MIAzvpxH1ek8kXQtnP9v7wMDKieq8l9ZbsdVfPDvG0nZKiSyuEgOGA93Q1cXljFXRbJ6
         +8zawl67HIFOzeciYyVDK4QHavYG0PelcuWFWykQQRqYuTjNMYZ3zB0Ty3e4oaknf22Z
         LkOg==
X-Forwarded-Encrypted: i=1; AJvYcCWTQjATQyO9sGs5YOH8iUpWsatRMKCm/rDcMy953yDrHIKMnwsJjP1UBY2NDVvKEHorU3q5r5bXyt844AdR6KDTQZarGAF97q8+aQ==
X-Gm-Message-State: AOJu0YwOI7rkWGOHapQvPeWOzBatjzF2gPgAQt+Ty+XrD+FkriHP+g5z
	Iiu45hIfsWVxTfq6FKzavcVHXnpbn6xMOD9PDnhjqGKukVamJ/Jp22kbwzZlkw0=
X-Google-Smtp-Source: AGHT+IGmaAhiKOV7B5nosZT022Ihw7zB7lktX0GPVrm8La0f2Jj1TpsEWf30b1GAhwoKa40IL1YTGw==
X-Received: by 2002:a17:906:1594:b0:a58:7940:69de with SMTP id k20-20020a170906159400b00a58794069demr4911172ejd.39.1714302118733;
        Sun, 28 Apr 2024 04:01:58 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l18-20020a170906645200b00a55bb18e3d7sm7709439ejn.168.2024.04.28.04.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 04:01:58 -0700 (PDT)
Date: Sun, 28 Apr 2024 14:01:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org
Subject: Re: [PATCH RFC] ax25: Fix (more) netdev refcount issues
Message-ID: <34c0f87f-793e-4815-8f50-9cf632dafe21@moroto.mountain>
References: <6kant25vimoq36blyb5sjqgq3xxjcqbqeskbgf5zihdho3iulb@ni2lvhiytfrg>
 <472cb9d6-708e-4acd-b938-e12c3a19591e@moroto.mountain>
 <c2xhy6qnfvog4efddy32yrzd2ohjqmfixrqfuujvamsubkjbv6@vpidhqtxfcag>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2xhy6qnfvog4efddy32yrzd2ohjqmfixrqfuujvamsubkjbv6@vpidhqtxfcag>

On Sat, Apr 27, 2024 at 01:15:38PM -0400, Lars Kellogg-Stedman wrote:
> On Sat, Apr 27, 2024 at 11:48:48AM GMT, Dan Carpenter wrote:
> > The commit message needs a Fixes tag.
> > 
> > Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
> 
> This wasn't meant explicitly as a fix for that commit. Is the Fixes: tag
> still appropriate?
> 

We would want to have a Fixes tag to say how the bug was introduced.
That's the commit which introduced the underflow I think.

> > Let me add Duoming Zhou to the CC list.  That commit is two years old
> > now.  This sort of bug should have been caught by basic testing, right?
> 
> You'd think, right? The errors were trivial to reproduce (and can be
> tested by anyone; you don't need a radio to exercise the ax.25 stack).
> 
> > Could you confirm that that's actually the commit which breaks it?
> 
> I'll see what I can do. There are already several patches on top of
> d01ffb9eee4a (I count 19), so figuring that out might be tricky.

Instead of reverting just the commit directly before that commit.

git checkout 4e0f718daf97d47cf7dec122da1be970f145c809

regards,
dan carpenter


