Return-Path: <linux-hams+bounces-345-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B54778D44B7
	for <lists+linux-hams@lfdr.de>; Thu, 30 May 2024 07:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F42BB230F9
	for <lists+linux-hams@lfdr.de>; Thu, 30 May 2024 05:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1A3143C40;
	Thu, 30 May 2024 05:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CSc+v21J"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCEC219EB
	for <linux-hams@vger.kernel.org>; Thu, 30 May 2024 05:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717046365; cv=none; b=IPCsOdDlBGmB+KPd9wCJroluV6Obp0AAtsCgWvKdhyBVgGJEqA/roMmIDLRB4WYT5tBlxYNBwpj7ltoS6kNghySaTLfgPhpStC6cwRyiKcxvubIK6f4xZmD8eBIpFUHxkbhb2WE1ZIR8T/eqvYyh4Xu6cI0o/GG/TrOAlnt39es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717046365; c=relaxed/simple;
	bh=iQIHui2J8/VPCv4h0/uBwICkHTKgTVbNccBfXNS3tV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/i1yiI9iVlQdzgMiuzP4EXyGH2emcWt11u181GVd4ciN06R2k0Pz6iJANIepXPt3AF3epXnvjtVP4zCW92hNWT1YR1HiAyGwzPKzGCnH1KkCA4tK8/jzR/6jw4zJ9RmkWxvkrwQLzD9Pdr/7QFR2WsxfMhVR1WAWzdkjokfugY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CSc+v21J; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a63036f2daaso32299466b.1
        for <linux-hams@vger.kernel.org>; Wed, 29 May 2024 22:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717046362; x=1717651162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WGFDe5QFNJsbrwE6AO0wiiAwqVgYTFlbJkwt8ppYct0=;
        b=CSc+v21JQlcsQ2qbSUUWSQJbzMv5eG+nkhKM8N3ZMAlngpZL9jJmWGsyTJRgH9plPC
         v4c25M65jzydFKCr9jGuWe7SYWjkh2i+S+B/W+yaKem/Raa5eT9RvvT8H/D/etW1MaxR
         qvp7D08ORDkg6Bzbl5F96rRxe6c77+9cvCWPbeVPaGmHHoIbiBZhYDQ0veJSNW5e55sP
         DNHngxOLX5r+ltnK2gKtRO1amDUnN/VDm8KWIWt2TMgOkc04PZXHbTfFf09kg+/dyXGy
         dPv5GWBMRjddrHE1uih1kEhYml9wvWj6TG46GWnKC0IknvJVCs4gtygf2F17mgzH9g6m
         LXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717046362; x=1717651162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGFDe5QFNJsbrwE6AO0wiiAwqVgYTFlbJkwt8ppYct0=;
        b=ino0nEEcqGWP+dahLSFUqeMaOqCUL85eopkwL5bIbKIwPSJJ67c7ZmuWWzV43yt85Y
         ia1yd/trbW+Bc9xSybvffS8LlmSAD9U53zNXK6BJaOatIKBwme5E/+d83n9ELXHTbNlj
         m+qMGStXsJS/wbaUIgRau0YXx/Q4cyyRhjgyyTGekKb2qCbXikN8o0m8/a8DedjNVlDD
         8lC7X5VdcSjqfn5h6SAusrxfiVolM8OMNKT+XlkFQBeSpp7NNjYhkSv0WJg5BCMVScV3
         1xwpytU1OGZzbpa8SOsViZzGtKwWbQ+u0A6oZMXl3vOsPirRACEStnXDNO6JwiJa8mIa
         4NuA==
X-Forwarded-Encrypted: i=1; AJvYcCVd8YbhN5eyFzAjs8xT6sT0FuwRbZMV2tQ/vX4AkItsN6aWodj3xUT0Tl2AXhBl2dmBMEk14p6FOdgCdMtJ2Gtd1kP2yJMpHtPE+g==
X-Gm-Message-State: AOJu0Yzezssc9yPhWPxW1VU3ufmpknAQpTTosVCh1aMGvyEkhfnTxLR2
	ytjws8C14XaHzxuRGt8900q31SwFAGiz6zRJYq4AXybuJiv8E9ZpZSTtcz3xp9A=
X-Google-Smtp-Source: AGHT+IFFcfKF0hEcVhzUyZFOwZU9f8o2yIB07vxIXzayhG8EF4HdTgzwGpRUNX0OOqVtr+jojzHHeQ==
X-Received: by 2002:a17:906:655:b0:a59:a0c1:2624 with SMTP id a640c23a62f3a-a65e8f7b553mr68072466b.39.1717046361826;
        Wed, 29 May 2024 22:19:21 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a660947c20fsm11763466b.175.2024.05.29.22.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 22:19:20 -0700 (PDT)
Date: Thu, 30 May 2024 08:19:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: lars@oddbit.com
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>, Dan Cross <crossd@gmail.com>,
	Chris Maness <christopher.maness@gmail.com>
Subject: Re: [PATCH v5] ax25: Fix refcount imbalance on inbound connections
Message-ID: <babd0f3a-a77a-4d6a-971b-30835bf0e2ff@moroto.mountain>
References: <20240529210242.3346844-2-lars@oddbit.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529210242.3346844-2-lars@oddbit.com>

On Wed, May 29, 2024 at 05:02:43PM -0400, lars@oddbit.com wrote:
> From: Lars Kellogg-Stedman <lars@oddbit.com>
> 
> When releasing a socket in ax25_release(), we call netdev_put() to
> decrease the refcount on the associated ax.25 device. However, the
> execution path for accepting an incoming connection never calls
> netdev_hold(). This imbalance leads to refcount errors, and ultimately
> to kernel crashes.
> 
> A typical call trace for the above situation will start with one of the
> following errors:
> 
>     refcount_t: decrement hit 0; leaking memory.
>     refcount_t: underflow; use-after-free.
> 
> And will then have a trace like:
> 
>     Call Trace:
>     <TASK>
>     ? show_regs+0x64/0x70
>     ? __warn+0x83/0x120
>     ? refcount_warn_saturate+0xb2/0x100
>     ? report_bug+0x158/0x190
>     ? prb_read_valid+0x20/0x30
>     ? handle_bug+0x3e/0x70
>     ? exc_invalid_op+0x1c/0x70
>     ? asm_exc_invalid_op+0x1f/0x30
>     ? refcount_warn_saturate+0xb2/0x100
>     ? refcount_warn_saturate+0xb2/0x100
>     ax25_release+0x2ad/0x360
>     __sock_release+0x35/0xa0
>     sock_close+0x19/0x20
>     [...]
> 
> On reboot (or any attempt to remove the interface), the kernel gets
> stuck in an infinite loop:
> 
>     unregister_netdevice: waiting for ax0 to become free. Usage count = 0
> 
> This patch corrects these issues by ensuring that we call netdev_hold()
> and ax25_dev_hold() for new connections in ax25_accept(). This makes the
> logic leading to ax25_accept() match the logic for ax25_bind(): in both
> cases we increment the refcount, which is ultimately decremented in
> ax25_release().
> 
> Fixes: 9fd75b66b8f6 ("ax25: Fix refcount leaks caused by ax25_cb_del()")
> Signed-off-by: Lars Kellogg-Stedman <lars@oddbit.com>
> Tested-by: Duoming Zhou <duoming@zju.edu.cn>
> Tested-by: Dan Cross <crossd@gmail.com>
> Tested-by: Chris Maness <christopher.maness@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


