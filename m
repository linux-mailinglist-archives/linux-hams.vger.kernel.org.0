Return-Path: <linux-hams+bounces-719-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C052C9B420
	for <lists+linux-hams@lfdr.de>; Tue, 02 Dec 2025 12:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36B073A4908
	for <lists+linux-hams@lfdr.de>; Tue,  2 Dec 2025 11:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAED30E854;
	Tue,  2 Dec 2025 11:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q65IGWuB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="J56ww2ZM"
X-Original-To: linux-hams@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9DC291C07
	for <linux-hams@vger.kernel.org>; Tue,  2 Dec 2025 11:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764673331; cv=none; b=RCTdhX4byUpfGlLxINj2gdTxXV39iZzyIpzuxUtJknQOQrkTH97zLNPLqaRcf5XklNH2hctk/BOCtu7Mi4J8ksFSNqbhwExGPVQGHBZ2Om1/RhNqWeH4CZOEJqhJ3Eyi8bMoXwE53pMQLkMnmAYO/lmt4FHL+bl4Ex9sSIdbn70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764673331; c=relaxed/simple;
	bh=u189I7GcLWDoBonyyDr64/v8+mxN7E25UI0pgCBVgLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNjFyDEjqN7KfCvlKUfee5uNxeoADtiGq4V/xLJ3KlzlyF0zmI/bYP3gCOEg38pyfOb0oo5D6i0Oo2VLCHOxlgLO544CQjvjf1DaC+mXT54s6PYRr+VCrl/w2Pjb7lmyEhWMmb3DAH7fXfzhOqjKUiuK+bp/pvCiLTK/qARmt8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q65IGWuB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=J56ww2ZM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764673328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bFxFd8aATvzXg9pa8rXnfKDyOi/m6Ej3XHml7lh2HCg=;
	b=Q65IGWuBDRmlI/nFSZxoex3dtJ6/LVpyQ9ztL3/Lg4xZybCwHRlcB1Hw8/suT9LoI5FFxJ
	FeIZi36soGoO0Mu988i0fEk/9RjoPUHOGaseKHanHg7xzl81i4fvCSp8bg3J8YfveRf6nw
	FACrL0mkcy5RBGstteO2lvn46stE+2A=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-7HjVZWUgONiToFn_OTf-yw-1; Tue, 02 Dec 2025 06:02:07 -0500
X-MC-Unique: 7HjVZWUgONiToFn_OTf-yw-1
X-Mimecast-MFC-AGG-ID: 7HjVZWUgONiToFn_OTf-yw_1764673327
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-63f9f128060so6289241d50.0
        for <linux-hams@vger.kernel.org>; Tue, 02 Dec 2025 03:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764673326; x=1765278126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bFxFd8aATvzXg9pa8rXnfKDyOi/m6Ej3XHml7lh2HCg=;
        b=J56ww2ZMqagi6mRho8TSFwPddZCGXlc/FKI+fELzncrZ746jKOvWF23Qo2lt8WzczQ
         ej+daMSz6gwI6eQ3ArQYlaO2nfudclaIGX+H6nuPYavDAEUjS+8h2Wuapm8yUuteiirN
         mHLrls9qGB0ki+Qe8UmTRXd6P0pRjoHsvjoZA71d2qsC8Tl86JdVQxMJIflb4X79onab
         ZsVJ+/STMddmas8BcNPKqwM/kqBZLBfHcKwJpwsaSAL7SqJKC9lZmTrQ9yPiOrBhrGjS
         M+Tmm4Ggm7aE62IDj45xN9xz6WxtsncEgQ8CdU7AwnuK/2kB9g/+0e9/jzTyNeBnEz1N
         bb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764673326; x=1765278126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bFxFd8aATvzXg9pa8rXnfKDyOi/m6Ej3XHml7lh2HCg=;
        b=SzvLgRQTzcW4ZVODd1sgFvXwUibOGQF38a25xiWa0R8yCec26mSkrlDoI7XcEJvIBJ
         x8Lxafk8yHrXx6CAjJd8rVRNS24daYUbkkATu8g3kjGKt7Kt1pnt+wW4XKSjzVMblRoi
         ZxXPyfV07oSD2Qu9GsTwUPpf6GB1vB5OixgA8DgN3BJvEmaO9IATjPDz8xXpInqlYI3l
         dl6iC5xA5CGDZOaFHot0y+ZWWcc/iEhTDpiqrFfCZr1RLrV1KWJ80EAHO/z653iaypE6
         lJn+QB4/j9QMuiyQnyNw6eN6fO1iuHa1OTchv04KQj8fxcnDWAopOi0wKbhIikM2AFFx
         CZmA==
X-Forwarded-Encrypted: i=1; AJvYcCUYfQelLt0lr3Z1KEKJDtl8a6LuHuJDLRO25qtAXsApoq+ocxtOBkabKguEg4snIRS08LsDJJ5eu5d1@vger.kernel.org
X-Gm-Message-State: AOJu0YxPVpqZsz4HhGEcB9e4ZcOMBfguvRkONx/O5HkJTJ2DHiRaYypH
	NHP9xDUucpwatHbNIcV9GoMT89xWQqXsKPEAJkmMJ4H9GkqOoXEdE09hNdNLiPyNjriIWoDFJLq
	Yc3TJLbk1znrawfzoikn5UA6e8E5we85lK63IyWa7xPrM52TefmgsC/twrscrQV0=
X-Gm-Gg: ASbGnct1mM+66DfKSNGU93rbFqfwZPEL9kTMJK9HrDedPJr/tCoutMgeRtdsciOo7R3
	zk10P43SEQQk11mxbaoRqUnDZuW78y6dbjA9DUDrRh+BaSfa9lik+JFU/CFrvb5yVVdA8+Ywdgs
	Igbr2gUjLZqLvE3VB5lI8OJZHdj5lU2E8XCx7qMMlObEO35NM2QatJz2OgkPsINaXuGlYCuzEGG
	URQD8SREWdfKsTQFsB9cx7AVepDkYFM5/b3ncxa/2x+0SGn3jDRhnBb/5Gj2WcFfWrbC8hzmZQM
	e22d8BBGQeTqTQgaVGjQXwwGS8/S+TLcVZre/jLnxUqUBD2RUWAB5p3byRzHWnRk1JWPRNBYg+S
	D71JUz7lYuxwifg==
X-Received: by 2002:a05:690e:1519:b0:63c:f5a7:3da with SMTP id 956f58d0204a3-64329350169mr21110544d50.54.1764673326657;
        Tue, 02 Dec 2025 03:02:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCEBMuPTPwT5XthZm8fQk3CECPwJkDrZcIL6/tAF/WYZi7za3DdHwdl9IGvTCDekPEWg+48Q==
X-Received: by 2002:a05:690e:1519:b0:63c:f5a7:3da with SMTP id 956f58d0204a3-64329350169mr21110529d50.54.1764673326249;
        Tue, 02 Dec 2025 03:02:06 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.136])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6433bf5f366sm6125689d50.0.2025.12.02.03.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 03:02:05 -0800 (PST)
Message-ID: <29f61bac-ec6a-447d-a2f4-89328eaba688@redhat.com>
Date: Tue, 2 Dec 2025 12:02:02 +0100
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] netrom: fix possible deadlock between nr_rt_ioctl() and
 nr_rt_device_down()
To: Junjie Cao <junjie.cao@intel.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org,
 syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com
Cc: horms@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 stable@vger.kernel.org
References: <20251127084112.123837-1-junjie.cao@intel.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251127084112.123837-1-junjie.cao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/27/25 9:41 AM, Junjie Cao wrote:
> syzbot reported a circular locking dependency involving
> nr_neigh_list_lock, nr_node_list_lock and nr_node->node_lock in the
> NET/ROM routing code [1].
> 
> One of the problematic scenarios looks like this:
> 
>   CPU0                               CPU1
>   ----                               ----
>   nr_rt_device_down()                nr_rt_ioctl()
>     lock(nr_neigh_list_lock);          nr_del_node()
>     ...                                  lock(nr_node_list_lock);
>     lock(nr_node_list_lock);            nr_remove_neigh();
>                                           lock(nr_neigh_list_lock);
> 
> This creates the following lock chain:
> 
>   nr_neigh_list_lock -> nr_node_list_lock -> &nr_node->node_lock
> 
> while the ioctl path may acquire the locks in the opposite order via
> nr_dec_obs()/nr_del_node(), which makes lockdep complain about a
> possible deadlock.
> 
> Refactor nr_rt_device_down() to avoid nested locking of
> nr_neigh_list_lock and nr_node_list_lock.  The function now performs
> two separate passes: one that walks all nodes under nr_node_list_lock
> and drops routes / reference counts, and a second one that removes
> unused neighbours under nr_neigh_list_lock.
> 
> This also fixes a reference count leak of nr_neigh in the node route
> removal path.

Please don't mix separate fixes; the latter need to go in a different
patch to help reviewers. Also both of them need a suitable Fixes tag.

Thanks,

Paolo


