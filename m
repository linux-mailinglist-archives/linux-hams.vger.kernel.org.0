Return-Path: <linux-hams+bounces-212-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8118BBB22
	for <lists+linux-hams@lfdr.de>; Sat,  4 May 2024 14:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 813181F21783
	for <lists+linux-hams@lfdr.de>; Sat,  4 May 2024 12:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC90171D2;
	Sat,  4 May 2024 12:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yP63KKc5"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0378B20DCB
	for <linux-hams@vger.kernel.org>; Sat,  4 May 2024 12:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714825023; cv=none; b=TMj5Qx0PEllHuZDIkVhY2nQDGwu+pVhKvnTj1sVWCx2cUeiHUwhR4Q926sqPj5Vfuf9W59/p1B4lHl6WvD3JtOiHpoTnLRLkIvDUdeYhhaonIOZmsFVvKpcYaWacBLoFeLblxS76Z8liF9TsVIEb590WXC07epExgT2RqdsxskI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714825023; c=relaxed/simple;
	bh=669O3y//f07tj9sHQFVeirnJEWT9tHeeDzQOoN3zNjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZV78uWuQdNpPSWv8iHQF7fLWieCp2W47WHCwn7Lwq1zPE/9Jh/tawpKfe8dsN2gEzjxt3jnod/4CAzrnYTkeMwgzFjSIWiiaiwoIdAwwxXW4kJdJREyhBmq2+5togCAiDvxH0xEFjSOSjShBeszQ27wcTAOa2fqcEbgJ+sigK9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yP63KKc5; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51fb14816f6so579245e87.0
        for <linux-hams@vger.kernel.org>; Sat, 04 May 2024 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714825020; x=1715429820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ea8eUTmJJojcjwmqPaOSu/nCryeFpydpEbWC7pWZbY=;
        b=yP63KKc5xHt2ApMLNNNLvbQRIUbkKmEEubrjXVwy9Vb86h2E38ghIOAzeHQFhwbuzW
         xr4iVPwDwAM10uMi4RmUZ8oG4PWXFUOr1cOEPMdos4Qokv0LO5g+U9s1k6BXa32BsNFz
         ZJBvPuhsVmYPFL1rze0XStdonJ1dR/EHm3fNp0qbxXJ0T7NNNgrx0Cz+HQCQgLUtWjjD
         +Q7J3k5OAit/2hwZPeOEe1/feubko2l5DdaV7Fo5+SZSA08nc9Z3pDXi+Uk3pFDZ6nFo
         RPBMiQwLxcjxhJNUtvM4iIZwHwlUEyMjlGKQIGn6J3ifVW5Qqp+Oo7Pu7IsX00ueHY0p
         VoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825020; x=1715429820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ea8eUTmJJojcjwmqPaOSu/nCryeFpydpEbWC7pWZbY=;
        b=hhYztb4vUORrSOWwBA75AYi5XsFDTcX/NwLSX9bhhHMY+QYoorl3hI9p3JGROYX5+3
         j6z8uVN29MyXcQYH0/egQuDuArgzSaluc9zaV1T1eGMKZN8jCCaiixJ8QLOwM0ONqvoE
         Erua5nn9boIJC8GJaHaxMJt1qqxk1DIhNHJRp2S3GSDD+lwDQ/QwrOdp6XF3KIymQenI
         A7jtr9Heery3iBmezuJLYcapQbulqLC0p6CJB2y50mJba/DEWt3Tq3WLH/wi5PrRqEDw
         CKAlchNyTBlSu/wlPvr76+6cXE+mOaUf/QnjNSo7pt+OnJKDrqKz9mxiNIPzHUnFwb9/
         NZ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIaRJTGagFCRL8ZM4ows7tdqYQ6Z78MGexbdJGmnmT3dgamI3aYSVYQHKaAJBahyIxH90H+rB4nsHQhWLJSkccddu8kfLlzmdaMg==
X-Gm-Message-State: AOJu0YztEcm5xncXEU94JMyrFn18zaorHzw21tcb9wRQeK5KZML/DhYn
	f6VJr69SPeuH5yltsu/HZuy3aY4jDHGgkbsb/xT7w07XmSGeyBxeNsVcW4V1abM=
X-Google-Smtp-Source: AGHT+IELxPWHXfQa5E+mJoBDo1dTtGGNHRm8J/13XW2AKQRYu/irxBpk75nxOWfED6zV/3b1O2vfXA==
X-Received: by 2002:a05:6512:368d:b0:51e:fa8c:47cc with SMTP id d13-20020a056512368d00b0051efa8c47ccmr3756879lfs.30.1714825019963;
        Sat, 04 May 2024 05:16:59 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j12-20020a05600c190c00b0041c120dd345sm9082267wmq.21.2024.05.04.05.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:16:59 -0700 (PDT)
Date: Sat, 4 May 2024 15:16:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, jreuter@yaina.de
Subject: Re: [PATCH net] ax25: Fix refcount leak issues of ax25_dev
Message-ID: <1e14f4f1-29dd-4fe5-8010-de7df0866e93@moroto.mountain>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <78ae8aa0-eac5-4ade-8e85-0479a22e98a3@moroto.mountain>
 <ekgwuycs3hioz6vve57e6z7igovpls6s644rvdxpxqqr7v7is6@u5lqegkuwcex>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ekgwuycs3hioz6vve57e6z7igovpls6s644rvdxpxqqr7v7is6@u5lqegkuwcex>

On Fri, May 03, 2024 at 07:40:32PM -0400, Lars Kellogg-Stedman wrote:
> On Fri, May 03, 2024 at 11:36:37PM +0300, Dan Carpenter wrote:
> > Could you test this diff?
> 
> With that diff applied, there is no kernel panic, but I see the same
> refcount errors that I saw before the latest series of patches from
> Duoming:

Wait, which panic is this?  The NULL dereference introduce by the
"ax25_dev" vs "res" typo?

> 
>   refcount_t: decrement hit 0; leaking memory.
>   refcount_t: underflow; use-after-free.

Hm...  Is there a missing netdev_hold() in ax25_bind() on the
"User already set interface with SO_BINDTODEVICE" path?  That would
fit with the commit 9fd75b66b8f6 ("ax25: Fix refcount leaks caused by
ax25_cb_del()") which introduced the bug.

I'm not really sure I understand how netdev_hold() works.

(My patch here is correct, but apparently that's not the bug).

regards,
dan carpenter

