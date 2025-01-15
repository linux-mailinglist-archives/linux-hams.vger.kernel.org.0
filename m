Return-Path: <linux-hams+bounces-464-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6CBA12F3F
	for <lists+linux-hams@lfdr.de>; Thu, 16 Jan 2025 00:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 038AC3A63B8
	for <lists+linux-hams@lfdr.de>; Wed, 15 Jan 2025 23:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE161DDA24;
	Wed, 15 Jan 2025 23:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VosqbvC+"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E49F14B959;
	Wed, 15 Jan 2025 23:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736983797; cv=none; b=uA0S8mZNqbJVrZcn6Tvaew9faUEav28oZCxQ60DYWpTJJfLe5Sh3qw0RsWM+JNUpmpMqgIP23cbprMLAzSZv90Ff8DhhgYfC/ui0Qe5Kq0uy0nqmCiR38VmiW1CUbWL7SMZ8AvcWbqfJBKhhKOSqP8vmCSWH/1LfMYLg5ZM446g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736983797; c=relaxed/simple;
	bh=tR8UaN7ZYY+xze2NiGBqja/fsWyajwNrPbVBlhYFccM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bj3SntQabii5TX5NWu+zU3SxlR/WMCBlnTA6lX7kaWlN6FiMgPDHaHW706rIpp1ln4NzH/M0BP+Pf0zEnZGA49cquLdBCtS3yLz1RwBxri9GS2aOZLrc3rctedyO+rsXl9+QeEdDAeUA5TLZDY3puNtcwoU7ah+TewJFpPpOL00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VosqbvC+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436a03197b2so1471215e9.2;
        Wed, 15 Jan 2025 15:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736983794; x=1737588594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AA85lizn+4y3tVKckeAfu/sCD8UsF/7zytrgJMgx6X8=;
        b=VosqbvC+nQFkmfn0v+3KfWt0zQIlYt6znzdXqNXDdF6HpwaRfsHUZmE7oaMkW6W65N
         fEUbEcaPsQzdCK56cTJDOG7vlXibl6OhnFnQV3E2bYBoY7yZVHb3BRVDLeeVzAfLVlWv
         sverBpTYTMM4GWUJTcMINh7Rp0oyDOhNNzxhiNNT8Y2J9kpnG9KPRY/4q7EyOO9VmnyG
         RVpX95atX0Qx6ZPybW8C9hjU8a3GVHufCppPCs5ZiiqlNBC8pNlRLDedc4J3ypR9W/LN
         DzxoqkmvRHbSrqUlS7SHpWWS3ur6LkmexzzupqHzpeLAPdk00CLnozQoobxs6PQv4ftP
         9BNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736983794; x=1737588594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AA85lizn+4y3tVKckeAfu/sCD8UsF/7zytrgJMgx6X8=;
        b=LPYInu/Uvys5x9HlbD+AEqMI87m+1tKBuJ/ErHwszQ1499m1Rfl8S3VFxTVw1A8exL
         kif2hP+Rw5Dg+JeJEgQaOUzjIN1giwtzYnXChun6tvUxASzN25fwCtDjxZsiS4Qe/QBN
         QOnloVaXvr1POdjKIrVm8BiE7MRx8pxEZylmto3+aw7Xb+t714XBSysQ2uI5wAAa9IDy
         AQ5ZWyNbtes3mWZn5nduojOZQt9wIegFPYRysQYisXTnOi/HmjK2WoUmdwr7EDNOVRaC
         O9RbOe2yqLJZw9+UettkaJq0QJ/hbnwkZDl8r3MwNMZ+sn5J+ILyV5JxdEo5akASWvaf
         pPPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbBZyUZ4ZnKBJvXcqV586lzFG3wqRImsIPZhqi2hRGDN2beVEvPywChUz2a62r0THinXf6dyHAohj2@vger.kernel.org, AJvYcCVkvjNCuynpGKqGCLlaNanEIOK+dQGznsPSbZeLkgKkqDeNCVxcbdc9H1sWShwTOVxfFWX6hgaR@vger.kernel.org, AJvYcCWr5G93KZgDuSnNhD0QumET8zM0pgOjL6Dnq3eL6JAACe2Sckuin3/oOuuSPX5ImRQzwv5V56ML@vger.kernel.org, AJvYcCXmQKiY1tquNBqX8vk6TZgKxpp5Hmt8ezZXlYdnmO/w28xxp+ECKornixFwaZ5LFqnZbRyqNOmZewqN8fRg@vger.kernel.org
X-Gm-Message-State: AOJu0YwCud6djVBXlxUppGObaR0zBpQ8CHJc/uoJW8ybdn2hIKet5SLp
	JNRbocc0mLznANil/KjABr20rpTM20Iv1fGTWZrn0MHFqCoLi4F4Mu/nnA==
X-Gm-Gg: ASbGnctDKBKW6HLCMEoVhECTRTzTY6fXHZajA3JXjCx0efEsIC+7RaE+pu5zKhaP23V
	m3RMueJ/xU1xhBtMZQ1/gN9YEh2F0f1rpm9mue5/KohuDkFzoKwd6KKMgY4k/yc3DlYoKgzhUPC
	U8TVcEhgfkoHoMyI2WW0V57TTwdBJJxAV/J7iU/MujJvX1EEs/+gLAiAhvxKa1FgHWlr6vzJSDO
	D+PuI/zNExxusK5Srspni/fqS8IK+DOAfli0HHC53NPLIzpo653vOZeiQf5GUA3XFB65nyYxS8/
	XSNmgaUMm0ih8hbLPGg=
X-Google-Smtp-Source: AGHT+IGHT6gwn/i7tqdptm35vr6/1ZvguxuWOv8R6zd9N7gFMI1OVesj0CUG1ETkcppAJyxXugo7nA==
X-Received: by 2002:a05:600c:1384:b0:436:1c04:aa8e with SMTP id 5b1f17b1804b1-436e26bdac1mr335593495e9.16.1736983794166;
        Wed, 15 Jan 2025 15:29:54 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bebccc93asm542914f8f.17.2025.01.15.15.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 15:29:53 -0800 (PST)
Date: Wed, 15 Jan 2025 23:29:52 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 <linux-hams@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH net] net/rose: prevent integer overflows in
 rose_setsockopt()
Message-ID: <20250115232952.1d4ef002@pumpkin>
In-Reply-To: <20250115164220.19954-1-n.zhandarovich@fintech.ru>
References: <20250115164220.19954-1-n.zhandarovich@fintech.ru>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Jan 2025 08:42:20 -0800
Nikita Zhandarovich <n.zhandarovich@fintech.ru> wrote:

> In case of possible unpredictably large arguments passed to
> rose_setsockopt() and multiplied by extra values on top of that,
> integer overflows may occur.
> 
> Do the safest minimum and fix these issues by checking the
> contents of 'opt' and returning -EINVAL if they are too large. Also,
> switch to unsigned int and remove useless check for negative 'opt'
> in ROSE_IDLE case.
> 
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
>  net/rose/af_rose.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
> index 59050caab65c..72c65d938a15 100644
> --- a/net/rose/af_rose.c
> +++ b/net/rose/af_rose.c
> @@ -397,15 +397,15 @@ static int rose_setsockopt(struct socket *sock, int level, int optname,
>  {
>  	struct sock *sk = sock->sk;
>  	struct rose_sock *rose = rose_sk(sk);
> -	int opt;
> +	unsigned int opt;
>  
>  	if (level != SOL_ROSE)
>  		return -ENOPROTOOPT;
>  
> -	if (optlen < sizeof(int))
> +	if (optlen < sizeof(unsigned int))
>  		return -EINVAL;
>  
> -	if (copy_from_sockptr(&opt, optval, sizeof(int)))
> +	if (copy_from_sockptr(&opt, optval, sizeof(unsigned int)))

Shouldn't all those be 'sizeof (opt)' ?

	David

>  		return -EFAULT;
>  
>  	switch (optname) {
> @@ -414,31 +414,31 @@ static int rose_setsockopt(struct socket *sock, int level, int optname,
>  		return 0;
>  
>  	case ROSE_T1:
> -		if (opt < 1)
> +		if (opt < 1 || opt > UINT_MAX / HZ)
>  			return -EINVAL;
>  		rose->t1 = opt * HZ;
>  		return 0;
>  
>  	case ROSE_T2:
> -		if (opt < 1)
> +		if (opt < 1 || opt > UINT_MAX / HZ)
>  			return -EINVAL;
>  		rose->t2 = opt * HZ;
>  		return 0;
>  
>  	case ROSE_T3:
> -		if (opt < 1)
> +		if (opt < 1 || opt > UINT_MAX / HZ)
>  			return -EINVAL;
>  		rose->t3 = opt * HZ;
>  		return 0;
>  
>  	case ROSE_HOLDBACK:
> -		if (opt < 1)
> +		if (opt < 1 || opt > UINT_MAX / HZ)
>  			return -EINVAL;
>  		rose->hb = opt * HZ;
>  		return 0;
>  
>  	case ROSE_IDLE:
> -		if (opt < 0)
> +		if (opt > UINT_MAX / (60 * HZ))
>  			return -EINVAL;
>  		rose->idle = opt * 60 * HZ;
>  		return 0;
> 


