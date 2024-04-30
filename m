Return-Path: <linux-hams+bounces-167-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CAD8B6F1E
	for <lists+linux-hams@lfdr.de>; Tue, 30 Apr 2024 12:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B8751C2269C
	for <lists+linux-hams@lfdr.de>; Tue, 30 Apr 2024 10:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804891292E6;
	Tue, 30 Apr 2024 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yJIOoiFr"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9908CFC02
	for <linux-hams@vger.kernel.org>; Tue, 30 Apr 2024 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714471713; cv=none; b=bxn1Ma66Q95+EZbpHGT56uHU9/T2FOx+D8YP09U5MnDB5lcNibjMHte/f5rQUJQZpGA54z2EJN/6GZWjQT8MnvhFsYvx1aJr/28gWfGQGbF1rOI9W/1/BcOef4Z+Kuk43M3hWaw2dR1RTR8ayS9xRoh276fq3lfA9v927Cisdyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714471713; c=relaxed/simple;
	bh=cuxAxi9HXUX/wxCC7ka95taOZGrYP8Uua4G7YBtiRJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXdBSm2ECgOF1NSLCC4Fh3aD04dK3LiKaY6jk9yIbpPlcatSkasDMDDgcw4Zol2b4Nf8vLYEPZKmvyhJQvW7rht7Ve8M94ThRkTUse9AgnQG8eNCHUsUnWJFFbfOCZkC6oeuRNwktg3agCmCyI260e20m8N8sVf0GpebmqdtoTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yJIOoiFr; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a5557e3ebcaso897970666b.1
        for <linux-hams@vger.kernel.org>; Tue, 30 Apr 2024 03:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714471709; x=1715076509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Umc+ZnVpkX9jweeXOmXaajM8MkE4A85pWRDfY3f8oG8=;
        b=yJIOoiFrkRhrcndfpjo8fe7dAyNIruGT4W+MQcFaQmn6FVR1lhdXGecAJvKWQpfRz1
         QjAiFm9io83XZXXEORr/5GiZ6QbFQLHga0St7C9Ffk2RHpGQ64T3ZCIRgxLH2A2g639V
         LjXqy7sZjgLvTpR3WNrW+CGA+VeMS95H6jEyrFiVff83KFghnYp1R9dWokbXXjXDvce1
         IPqM9rwQ04nInFRTN00brHvjRjbACdWhNpVS3PU0aogOUNF+Sc/qkddM013nHAvteZYS
         RN/5n1PFFZUIb/HYEnkVzjrXWSTZAffrhGNAXV3KxoHd/uiRpmGi03ZZxyCNCcg1HyrQ
         cLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714471709; x=1715076509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Umc+ZnVpkX9jweeXOmXaajM8MkE4A85pWRDfY3f8oG8=;
        b=eTMl9DoaU/NzDv5RxGiKTkVLOqC4MqYrsoXmxhJBpWKS0FfN/xziOAfhp0rpqKrZtc
         kwXF3LhhL9Ne3F8T/qjk85z0Mvk96zDvQRZ72wY9qrLwPo5nd7EEpG0syGl/vD5mPYKh
         Gcjv3akZZKnrlL+3IDakYfUrSwTWOuIIeuW9CvA3OZ2wpERUsL/+ECpuKi+Z9n5rOiz5
         Cr0uqGkwmqCI92rX0TU/ObH5L+kAhqb9f9/PGFXZ/D3HaW7zCIWv94qPZ1XPsKhPBnb7
         CLXSYig5U35c5mgM3mdaZmw9zshroKD9aGVn9fxE3rhJYbiesrOrDw+rJMwwM2CsUNMJ
         +FMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/iZ+AiIP9Q0llHzHGP7XZHwxvRmo1vciub/jlslrASzdxSpBivfg6k9gIpuMcIbBsv9aRXtH91arfEssMEN2IAoq3x4+pl/E4Nw==
X-Gm-Message-State: AOJu0YydQrR1XSWQJv1wt1vbrz7ow+/lCknZjiForuz7T1L/e3dAbENh
	3YqTDs+ENrvgNhp80xYAUF3YLz6NbLjSJiqN60fFQt3XysECxHv9n7jSXCPdD/8=
X-Google-Smtp-Source: AGHT+IFv0YHdW4OqLCE3C2Dj1N8jsiT9bWe61PhCyXXJck1rTCHeLShWQAxRQlLIRJGIQYZfUsq4ew==
X-Received: by 2002:a17:906:b7cf:b0:a52:4bde:4999 with SMTP id fy15-20020a170906b7cf00b00a524bde4999mr2123109ejb.31.1714471709125;
        Tue, 30 Apr 2024 03:08:29 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a4-20020a170906368400b00a4e48e52ecbsm14807263ejc.198.2024.04.30.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 03:08:28 -0700 (PDT)
Date: Tue, 30 Apr 2024 13:08:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org
Subject: Re: [PATCH RFC] ax25: Fix (more) netdev refcount issues
Message-ID: <7166e176-afbb-49e1-bd24-809a1856bf93@moroto.mountain>
References: <6kant25vimoq36blyb5sjqgq3xxjcqbqeskbgf5zihdho3iulb@ni2lvhiytfrg>
 <472cb9d6-708e-4acd-b938-e12c3a19591e@moroto.mountain>
 <c2xhy6qnfvog4efddy32yrzd2ohjqmfixrqfuujvamsubkjbv6@vpidhqtxfcag>
 <34c0f87f-793e-4815-8f50-9cf632dafe21@moroto.mountain>
 <tkgm4hbsiccrlehjhbpmsigo5r2fmght72evmcdz47cynqewpb@7yevwv7wma6d>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tkgm4hbsiccrlehjhbpmsigo5r2fmght72evmcdz47cynqewpb@7yevwv7wma6d>

On Mon, Apr 29, 2024 at 02:06:30PM -0400, Lars Kellogg-Stedman wrote:
> On Sun, Apr 28, 2024 at 02:01:54PM +0300, Dan Carpenter wrote:
> > We would want to have a Fixes tag to say how the bug was introduced.
> > That's the commit which introduced the underflow I think.
> 
> It doesn't look like d01ffb9eee4a introduced either of the problems.
> 

I really wanted this to be introduced by this patch because then the
issue would have been more simple.

> I ran a couple of git bisects between d01ffb9eee4a and c942a0cd36
> (that's the HEAD of my local repository, 6.9.0-rc5); the traces
> involving ax25_release first show up in 9fd75b66b8f ("ax25: Fix refcount
> leaks caused by ax25_cb_del()"). The "waiting for ax* to become free"
> problem first shows up in feef318c855 ("ax25: fix UAF bugs of net_device
> caused by rebinding operation").  Since feef318c855 is the older commit,
> I guess we pick that one as the target for the Fixes: tag.

Meanwhile commit feef318c855a ("ax25: fix UAF bugs of net_device caused
by rebinding operation") is a much more complicated patch...

I don't think your patch is correct.  It's fixing the use after free but
it introduces leaks instead.

I don't think it makes sense to take a reference in the recv() path...
How would we balance that with a _put()?  It has to be something like
increment in the open() and decrement in close().  In your patch, you
say that it's dropping the reference in ax25_release() but that pairs
with ax25_bind() and that takes the reference when it calls
ax25_addr_ax25dev().  I don't see a problem there.

1)  The reference count starts as 2 in ax25_dev_device_up().

	refcount_set(&ax25_dev->refcount, 1);
	ax25_dev_hold(ax25_dev);

Then in ax25_dev_device_down() it drops the reference once or twice
depending on if we goto unlock_put or not.  What is the logic there?
Seems suspicious.

2) The ax25_addr_ax25dev() has a small bug.  It potentially increments
   more than one reference.  That's unrelated to the underflow.  Also
   The function should be renamed to show that it increments the ref
   count.

diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index 282ec581c072..13fe57deafef 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -34,11 +34,12 @@ ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
 	ax25_dev *ax25_dev, *res = NULL;
 
 	spin_lock_bh(&ax25_dev_lock);
-	for (ax25_dev = ax25_dev_list; ax25_dev != NULL; ax25_dev = ax25_dev->next)
-		if (ax25cmp(addr, (const ax25_address *)ax25_dev->dev->dev_addr) == 0) {
+	for (ax25_dev = ax25_dev_list; ax25_dev != NULL; ax25_dev = ax25_dev->next) {
+		if (ax25cmp(addr, (const ax25_address *)ax25_dev->dev->dev_addr) == 0)
 			res = ax25_dev;
-			ax25_dev_hold(ax25_dev);
-		}
+	}
+	if (res)
+		ax25_dev_hold(res);
 	spin_unlock_bh(&ax25_dev_lock);
 
 	return res;

3) The ax25_dev_free() function doesn't do have reference counting.
   Suspicous.

The other increment/decrement is bind/release which seems okay to me.

regards,
dan carpenter



