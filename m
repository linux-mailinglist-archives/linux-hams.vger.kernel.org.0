Return-Path: <linux-hams+bounces-477-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA25A2DB52
	for <lists+linux-hams@lfdr.de>; Sun,  9 Feb 2025 07:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 573171887BA9
	for <lists+linux-hams@lfdr.de>; Sun,  9 Feb 2025 06:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235FA13A3F2;
	Sun,  9 Feb 2025 06:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FtUcMwlB"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B9A24B34
	for <linux-hams@vger.kernel.org>; Sun,  9 Feb 2025 06:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739082251; cv=none; b=jDFxv/V+vgPCmw3VwHAYSqmd81cHTTSziM+Ne8qwDcUyvZOsW0FxVheIp1jvWYqMH9fQi9V+fKiUaYXzLZDjjX9y8Yh1QTOMALZN8yPmKZUiHZpGPDWodCj0o2wi1rrDLsRfuPtLJCb6yvspiJyn0oc74a6fAJsebp6LPSvTUlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739082251; c=relaxed/simple;
	bh=aE8Pr7FMgBpzGLwqUQPLB4QILiBDleWz4ZaabRMSO3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOPgz9VD8SAfggEKAT+ykOxn/VCLw9i6/j1oM32Z1BRfLazDopJYGLocCq0D4IEhnEBg5daImgTuZPBx1iTYazH/EXkHs5RmFvfZtSdZ/0zsETCgvSqiZAF4tMuJt8JIwYr4SdcRfgLoPiRC/2rFKv//UmCzoPUOSwTXa9uBCnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FtUcMwlB; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5de47cf9329so3393955a12.3
        for <linux-hams@vger.kernel.org>; Sat, 08 Feb 2025 22:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739082247; x=1739687047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yTto9Kr8hhs4LG0n8TSGyp+f3yaAmq1VIFKY3P9KHF0=;
        b=FtUcMwlBjGcQm5TpBrrrZSc1mtPEy+KFHo/653m82noS/CzyuNG9SPjdjcJyxelUUe
         h1N+NiIxjF3WH0zlm+nAE50y8HvWYYJDaFAjs4gZqpm5tD1fxktpGT6UOjt2DUZv9w4i
         mQlkmsBGdIG0GqbgJUZQ+hshLkCwikJw9RntesMheXGA9Gw+ACZPxlYG5+JakwOZmvt6
         jRwwPHJQEVDUUPXBs3AQL990P5/0wE3d1s96w8Gy+RWJaDjLZHgB8sVSD6eobH4liCPv
         02hEgh7oDTbArzfU+4PdOSu8wzsa7wPKTKKgpqK+JD7w0WizCeFa35YXaNXJccNzZTFK
         QcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739082247; x=1739687047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTto9Kr8hhs4LG0n8TSGyp+f3yaAmq1VIFKY3P9KHF0=;
        b=S7PC0NbjM42AuF/bZkT0Cl1mi+GRhIogTXgtl20PXyCY4z1t1/vxuI9t6TQJ95AG7G
         opZ9sm+htyRkZOXEG+eF0u5b6QCQg17/5TPOTmGFO/z7l1Kkwq+jyiF8t4zNgL2bWGgY
         WI5f/oyXamVaPokcDDMr5umSP/Whw6NtIQHrr+EI+QmhInesrOINFqBPn/bpFN6p7YCS
         BwrQEArm+iGnR64r7xVJ+gCxVfpjym96r20V6IyTaUkiji0YnHfQkn2mnDyn5c0xOTfw
         LAq05/oK7HyAwbFt6GRiyNe2zqYttpm2ADFZKgThliS+X+CCvQAzuFxuU363+xRDFK+q
         1YQg==
X-Forwarded-Encrypted: i=1; AJvYcCWFb9Uxqqoa81i5CiYy18bptfypiDztkeuneIzjH0tXnUi/mfkakcs+siWmPb9lVFix5nvBufyT7j09@vger.kernel.org
X-Gm-Message-State: AOJu0YwrAsNl+vrAmJPzxvJpJCkEXpqJNWifYfV47DgUH0AGrlN28Jpq
	CT32ejgoaIdeHP+CZaCa9oE+owZG40eUj/7Ubkk7fJuZaXJghyoOGuW20DKOQHk=
X-Gm-Gg: ASbGncuTuV/lUoiZbvqneRWAY9Yf2iCB8GKpsMWVjlHXY3hbJz8N+8z067odWBPZreA
	coHKS4qBRErW9X3T8rjzkeWnJjl1lbSOt4AwaMVLCTSAmkt/XAwcs4Qu+2QUJ6VPfDzm7a/8UAS
	Lj4Eln34/Z1U4q5k+xSLCJ867giukVu0nmARV3J5Q7XEkSvIzaKqlXVlQ8BVX6HH8bfIzdgEtTs
	CnMr1Vut8Mn7jMJR/daEYt0rZAS+Q5gAkkAlmLEz0J6yVgar//EPb0dfKKvqUSznMOvM863Iu+L
	Vobml2H2pY1G0IOQP3F1
X-Google-Smtp-Source: AGHT+IES82N8C+fmH6KFZPQ2PcILhvhCYo68TATrCctmduAL8AzzSocttcg6O+pNFOFLcG4GQSgsDw==
X-Received: by 2002:a05:6402:4588:b0:5db:731d:4456 with SMTP id 4fb4d7f45d1cf-5de45085cc7mr10374231a12.28.1739082247149;
        Sat, 08 Feb 2025 22:24:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5de63a89b6asm1714510a12.46.2025.02.08.22.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 22:24:06 -0800 (PST)
Date: Sun, 9 Feb 2025 09:24:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-hams@vger.kernel.org, pabeni@redhat.com,
	linux-hardening@vger.kernel.org,
	kernel-hardening@lists.openwall.com
Subject: Re: [PATCH v3] hamradio: baycom: replace strcpy() with strscpy()
Message-ID: <90cb9ac2-2af9-4fc7-b93d-0f36514a76f6@stanley.mountain>
References: <3qo3fbrak7undfgocsi2s74v4uyjbylpdqhie4dohfoh4welfn@joq7up65ug6v>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3qo3fbrak7undfgocsi2s74v4uyjbylpdqhie4dohfoh4welfn@joq7up65ug6v>

On Sat, Feb 08, 2025 at 11:06:21PM -0500, Ethan Carter Edwards wrote:
> The strcpy() function has been deprecated and replaced with strscpy().
> There is an effort to make this change treewide:
> https://github.com/KSPP/linux/issues/88.
> 
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  v3: resend after merge window ends
>  Link to v2: https://lore.kernel.org/lkml/62yrwnnvqtwv4etjeaatms5xwiixirkbm6f7urmijwp7kk7bio@r2ric7eqhsvf/T/#u
>  v2: reduce verbosity
>  Link to v1: https://lore.kernel.org/lkml/bqKL4XKDGLWNih2jsEzZYpBSHG6Ux5mLZfDBIgHckEUxDq4l4pPgQPEXEqKRE7pUwMrXZBVeko9aYr1w_E5h5r_R_YFA46G8dGhV1id7zy4=@ethancedwards.com/

Ah great.  Thanks for remembering.

regards,
dan carpenter


