Return-Path: <linux-hams+bounces-269-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E95218C0DCB
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 11:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79F4C284891
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 09:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E4414AD36;
	Thu,  9 May 2024 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZOwSOcGj"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EF914A09D
	for <linux-hams@vger.kernel.org>; Thu,  9 May 2024 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715248279; cv=none; b=cLXZHuEmAs9EZuiSr1IaGOUWnWg4mUjhY+Q6RqZe4LBKxIyoVeTcLIWniurH1ZwQvVG0U8OZdv7CvN7dgbPPrT4/PRFYj7zZilI7ES56t9qUzoMRVYwtvGbkVk2PlH/+VJ89z+5q0SmyEfPyYlOjqhdybbgjEmNNCPAgUNsbSGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715248279; c=relaxed/simple;
	bh=HwgomhHyoNxuk/P65VSTDTjX/OrvIegbXeCP/nu/Ctc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+lB/5x3NMzsjo20BOdgeFPzQUPke9qr9XdQ/CvNQc0Kz5aIdlG4VZ64buoVuuAYQgBPSn0wOjVHLHvui42buO2pBdEapJN90FGM3dbjeAkrDuxeKeG2SEOatEPsNhdXI/uQ8IgMxlqe/jR1OfFXyGS9q7//v6RE9CIoDGE3FzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZOwSOcGj; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59ce1e8609so314438666b.0
        for <linux-hams@vger.kernel.org>; Thu, 09 May 2024 02:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715248275; x=1715853075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ywofGwMYBfFis2HqHr7Nt/RPy6KpRr5SHOYvXemXtAo=;
        b=ZOwSOcGj4JIbIOGXQDyrlG+5ad/7F/QGjZWnX2Ce/hNQXQ8evrRX3vMsgW8WTmXM0I
         BHro7w51Yvc2lbosn7HD67TQiOcFxmgz24cKbASFC43IFk1uTUdGUz8ppk4i5qTfxGIP
         wpc1GRaA7bFZInVM7mh1RFQudSlWfbqKSOoiyRoPwXF6IThHjL0TeNz1WYJqnEV72Ka5
         DLxYLEeEwY1XDXjn2UmPfrdMXZREJgoc0NLH8XX8x9q3mgMwxPwrBdfb4XGM5aEcwsAk
         9UxP+E6lUZ98pc0L7cA23Y4BGHnEwKY+YDyXmdyBGsqsnqhD4qG3UY/bnUjWuvYjwJFN
         encA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715248275; x=1715853075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywofGwMYBfFis2HqHr7Nt/RPy6KpRr5SHOYvXemXtAo=;
        b=b1fBdxPhB+S9jgxGAm46V50LGfIbvDnTq1IqbHj925WkVUHsLXBMtmYgdznqthS/ut
         Uw9LJ5nY7sxzq8hRRrGGWqvj/7H5LOTNMN50ZzUAcwk3R5H7NvWL3fkLKv3PHtcO7DGe
         YvxkrFx0xe4Ep0yelsWt+NCyHcKHtF+FFJI5AG/63GMMkFdKHUl0CWUpWp7y2Nzu58tY
         n900cqs5MlV3xdFvZFAJeShieHxTT5yVL2Pv/3F+WteKL6fgHad3m0JjPwIIiGh8WeXM
         z/Pg9wtBLIDBMxWtVNQnsRlwtLiHxPz4U9cTWdIAemlQt+TXd7biVYocwN8HRDJUyN+V
         59Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWRL09qFnAZqluBYI5KFmnaImEddwL6IbKf5gILS0V7kaw76lwYTjIvqx1LWmUmygCTs3rvn/Y19MQA97cqdyYq2odSOdntB+JDcw==
X-Gm-Message-State: AOJu0Yzi5sevx30seOlFwphTCzTMD5/6QuCjJ+mhLNgXG4dWW4gAahhv
	KWzzvAHTLkj5bVfGzvJO7GdayZGm4X9iGZP1it+4Op7Qq6uhAREDhCS3cpEYPB8=
X-Google-Smtp-Source: AGHT+IEbUB7ITQG3LQnrbSjNOLWt/PQE4woZqsi3of9uczOVr5D+X401PanfnzNzZ1RqHahUg5vDHQ==
X-Received: by 2002:a17:907:2d09:b0:a55:5520:f43f with SMTP id a640c23a62f3a-a5a115ef93dmr223975366b.10.1715248275395;
        Thu, 09 May 2024 02:51:15 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7fe5sm55191466b.114.2024.05.09.02.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 02:51:15 -0700 (PDT)
Date: Thu, 9 May 2024 12:51:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hams@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org,
	edumazet@google.com, jreuter@yaina.de, rkannoth@marvell.com,
	davem@davemloft.net, lars@oddbit.com
Subject: Re: [PATCH net v7 0/3] ax25: Fix issues of ax25_dev and net_device
Message-ID: <e00b89a7-3c1f-4830-9ef9-3230c3648092@moroto.mountain>
References: <cover.1715247018.git.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1715247018.git.duoming@zju.edu.cn>

On Thu, May 09, 2024 at 05:35:59PM +0800, Duoming Zhou wrote:
> The first patch uses kernel universal linked list to implement
> ax25_dev_list, which makes the operation of the list easier.
> The second and third patch fix reference count leak issues of
> the object "ax25_dev" and "net_device".
> 
> Duoming Zhou (3):
>   ax25: Use kernel universal linked list to implement ax25_dev_list
>   ax25: Fix reference count leak issues of ax25_dev
>   ax25: Fix reference count leak issue of net_device

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


