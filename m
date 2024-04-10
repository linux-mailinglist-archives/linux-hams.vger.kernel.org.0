Return-Path: <linux-hams+bounces-94-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C12F389F19E
	for <lists+linux-hams@lfdr.de>; Wed, 10 Apr 2024 14:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1F181C2130E
	for <lists+linux-hams@lfdr.de>; Wed, 10 Apr 2024 12:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2AE15ADA2;
	Wed, 10 Apr 2024 12:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IrvOZoBj"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3CC15ADB4
	for <linux-hams@vger.kernel.org>; Wed, 10 Apr 2024 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712750513; cv=none; b=YKyiVpU7yQazM+LaGg4KIVEiPeR8uxMBFvMTZgNcSua3jGJZs/r+XJbbtsbcEnWwe9A6c4EhbFgHaNubuUjDlrEWVjT2gfxl0oJWyVDcfg6fhUDvu7lwqF5na4RVJRD3ohzIhRmwBm7VvjtwYWmIqBPZ+98y6n60SWWX1gSMBAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712750513; c=relaxed/simple;
	bh=sxEQb2NZFr0lXXgvGdH78ovJZVpP4IOKNWsqOOnTiq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+t5mer12NMIIvgtFRHEaYv2iQY5KLIXjdMIPZrNTuI+BMXIEH54K665AWY43vU/MnKKTU+xqsyFvKLvAy3OCcrDrn62n5dnX1YG7QYT7a2XvkcKJmfO8AfqfX65fxcA9FE1GTGKexa3TQtdmys4U22oIa47McoLDwOkQM1xVCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IrvOZoBj; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a51c8274403so465300266b.1
        for <linux-hams@vger.kernel.org>; Wed, 10 Apr 2024 05:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712750509; x=1713355309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XgTWTo2ucFnPFI/xvsBm/e5v/AYY5D6MgZvvNxgccHY=;
        b=IrvOZoBjb7JjpAQCl5GM/C4g2Ae5xx92SP9bD7B4Ddg1VPFwVMw8RaJPSkUYNHzHgt
         IPncaj6is5JG0exSyhCfKoaZkqxt9C897bZUxpD4fxOGBLCiRUcELPG7rBY/HAzv22Cs
         EsSzRf3H1NeyQ8EAFfqxj+YBhhze0qsbQtaOSsa6z7ZgWY/vqwmxUAHZDwF/mmdn1zbz
         yGL/dI52fMDmjJ2LrOHTh6l1ZdUlGCxtH5kgW6ID3oJ7SK1D84u5LSweSSDp/oVZmgbd
         33C9qZue9VJfSFuA1UflcrxPMhG3CRgf7g2KKbEz/ukrhuTV0Js6UogkUaPvDO5GhQiz
         6jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712750509; x=1713355309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgTWTo2ucFnPFI/xvsBm/e5v/AYY5D6MgZvvNxgccHY=;
        b=WzsAoSTQf/vH287HL4w4Lw3p/4zUDoMMVgkBNm/XVbyXAQpFjmp4PbWbu1pslWhtr2
         CknmW6qQ/NSfedrG4qe4QIc+itOxomieIGBoVysH+h0D90WRVsjyGJiBwHt3a5amC24c
         t93QCvXizfs5w8Dgr+9m3cDkWTaHgEd+qtqmQcbfZf15+w4bwDeJz2+bHWIdJ1jEc97X
         kTYL+xoL+O/UD+vV/C/03L61UNn8hE9e14JRw0KVjxMmi/T04M8AlcDw5cVZFAcy0wpB
         +KnNmn7YVTnq8f5LQAczM+aCGKY/+HJbZTTBo068gbYCfxwIC6ouZY2LOyR486KRX+fd
         iKNw==
X-Gm-Message-State: AOJu0Ywp6QX5pQdHjUr2J4TR4HMK3tqv6XRggQCKyzaQQ4dxE+2OyVlk
	gXjSwkD267+oqiqH+2hQ+V698AVtKNYqI4CAfWb4bCA12iSEHKD8El8AI+ktB7Aox9NzgAHO1Uj
	u
X-Google-Smtp-Source: AGHT+IGhlpMgQhhVOWNE+JfYzoNBf9X+sFvsN0SNSUaGj2aG/8YSpvGWhThLWn2ijNUtAo9JgRF/Fg==
X-Received: by 2002:a17:906:aad5:b0:a51:8d60:215a with SMTP id kt21-20020a170906aad500b00a518d60215amr1292279ejb.27.1712750508358;
        Wed, 10 Apr 2024 05:01:48 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ck20-20020a170906c45400b00a4e23400982sm6899039ejb.95.2024.04.10.05.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 05:01:41 -0700 (PDT)
Date: Wed, 10 Apr 2024 15:01:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: linux-hams@vger.kernel.org, Duoming Zhou <duoming@zju.edu.cn>,
	Simon Horman <horms@kernel.org>
Subject: Re: unregister_netdevice: waiting for ax0 to become free
Message-ID: <8dcbb033-f4b9-4a3d-9bd5-dc5301bfe51a@moroto.mountain>
References: <CA+Q+rdzYUcfYF8CcX1WOWjVBYiZgidFAY1M0kR4J4KL73yN9yA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Q+rdzYUcfYF8CcX1WOWjVBYiZgidFAY1M0kR4J4KL73yN9yA@mail.gmail.com>

You say that this isn't a new problem...  Why would it not be a new
problem?  Could you try reverting commit fd819ad3ecf6 ("ax25: fix
use-after-free bugs caused by ax25_ds_del_timer") and see if that fixes
the problem?

Just do: `git show fd819ad3ecf6 | patch -p1 -R` and rebuild.

regards,
dan carpenter

On Tue, Apr 09, 2024 at 05:05:40PM -0400, Lars Kellogg-Stedman wrote:
> First, apologies if this isn't the right place for this. I know this
> is primarily a development list, but I'm trying to track down patches
> for a kernel issue.
> 
> I'm running a kernel built from 2c71fdf02a9, which includes the recent
> use-after-free patch from Duoming Zhou in fd819ad3ec. After bringing
> up ax.25 (see below), If I make a single ax.25 connection to the host
> (to an ax25d hosted service), it will subsequently fail to reboot; the
> kernel gets stuck waiting for an ax.25 interface:
> 
>      3   [  217.717327] unregister_netdevice: waiting for ax0 to
> become free. Usage count = 0
>      2   [  227.957427] unregister_netdevice: waiting for ax0 to
> become free. Usage count = 0
> 
> The kernel will get stuck here indefinitely (or until the watchdog
> triggers). I know this isn't a new problem, but is it one for which
> patches exist? There's a lot of older information out there, and the
> website in the mailing list welcome message
> (https://radio.linux.org.au/) appears to have gone away.
> 
> It looks there is a panic earlier in the shutdown process; the kernel
> trace starts like this:
> 
> === cut ===
> [   32.072855] ------------[ cut here ]------------
> [   32.074595] refcount_t: underflow; use-after-free.
> [   32.075777] WARNING: CPU: 0 PID: 1354 at lib/refcount.c:28
> refcount_warn_saturate+0xbe/0x110
> [   32.077104] Modules linked in: mkiss ax25 ...
> [   32.088624] CPU: 0 PID: 1354 Comm: socat Not tainted 6.9.0-rc3+ #3
> === cut ===
> 
> I'm running a test environment with a pair of AXUDP interfaces; I'm
> configuring things like this:
> 
> === cut ===
> #!/bin/sh
> 
> mkdir -p /run/radio
> socat \
>         pty,link=/run/radio/ptyudp0 \
>         pty,link=/run/radio/kissudp0 &
> socat \
>         pty,link=/run/radio/ptyudp1 \
>         pty,link=/run/radio/kissudp1 &
> 
> while ! [ -c /run/radio/ptyudp0 ]; do sleep 1; done
> while ! [ -c /run/radio/ptyudp1 ]; do sleep 1; done
> 
> ax25ipd -c /etc/ax25/ax25ipd-udp0.conf -d /run/radio/ptyudp0
> ax25ipd -c /etc/ax25/ax25ipd-udp1.conf -d /run/radio/ptyudp1
> 
> kissattach -l $(readlink /run/radio/kissudp0) udp0
> kissattach -l $(readlink /run/radio/kissudp1) udp1
> 
> kissparms -p udp0 -c 1
> kissparms -p udp1 -c 1
> 
> ax25d -l
> === cut ===
> 
> -- 
> Lars Kellogg-Stedman <lars@oddbit.com> | larsks@{twitter, irc, github,
> ...} | N1LKS

