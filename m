Return-Path: <linux-hams+bounces-676-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97060C00E0E
	for <lists+linux-hams@lfdr.de>; Thu, 23 Oct 2025 13:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D55363A2EFE
	for <lists+linux-hams@lfdr.de>; Thu, 23 Oct 2025 11:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD9730E83A;
	Thu, 23 Oct 2025 11:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Voj3jP3m"
X-Original-To: linux-hams@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40E930E0FF
	for <linux-hams@vger.kernel.org>; Thu, 23 Oct 2025 11:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219866; cv=none; b=DCwxh0T4H7R2sOxSosJt64O8pkEAJ6bgLnFAr5Bf7o7dSfSbFa2rHB4C7jxV8bkht5m20HC+CPwDr2nRX9qO8kaV0gUhdNehi6jT308YLngY6i1IUakceEDLW5cTRAtwFQM5JbgT9keFLojSaGMJMiHgibc55G5m4QJAZS3JRYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219866; c=relaxed/simple;
	bh=V515WjHuILLU+8tNTBNpbWGXfmgFWkUZc4kfGyLRu5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=brPMWiEFcBOA6MEdYx2TrwuAAgmmORNT7w84tR2QXhuaYPJNWVlq/JjOBr9hq+OfFgzXZEgfjmNIfxkJ85bTUNSghPJAVCsXX0LvNqX9EX7tzW2qp4rGF2W9AYRhhsNTOvg6BKWQ8HbGqieZeaDq8mZr0Ix6b+ZkvxvEBL44O9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Voj3jP3m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761219863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rXC9I/gqGLzvMaY95b2W891cPW1ryM6oOh9smYbOgEI=;
	b=Voj3jP3maUzYi0+sGAMoka03eG+fFpSHmbfs17f7+JRQo4HAMeAKbFFOCciVjnPTxcHFqz
	3wZN+KGnhS2nTIgJGh59c7mmcUTq2R+n7IuBEt9l0D7hqb+96lW18PU8Kp2GbqjbKhgan6
	isY/RLDxHANYTo/ZggxOshKfYR0utcs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-GAal7eEJPwe0Af23tkvASw-1; Thu, 23 Oct 2025 07:44:22 -0400
X-MC-Unique: GAal7eEJPwe0Af23tkvASw-1
X-Mimecast-MFC-AGG-ID: GAal7eEJPwe0Af23tkvASw_1761219861
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47106a388cfso3616445e9.0
        for <linux-hams@vger.kernel.org>; Thu, 23 Oct 2025 04:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219861; x=1761824661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rXC9I/gqGLzvMaY95b2W891cPW1ryM6oOh9smYbOgEI=;
        b=YYgMGFH45NR/a7YLRpWVy2FdAWbwRs0YaJP29Ehduk/iyfnxuczOXvVaZCNxx2TVkW
         N7kqgvk6TJshSmZzoK0KivcsY+sRt1+rj9hciWRPNQkKPis66E+cAn2w/BbCx6oaLTAF
         hGE0g2lKEuW68E6wvv1hmX96/kFTYr6no6lY5zRaF/nymQvrf3br5OPJUtajiNv/yxQd
         zZSVWlrSu+RQcQet7N87ZnDO7t/AfEwqq0+BpXm4osvedU2JZ4H7D6KeEEJXi/uICUUY
         KF/z9to2u93TmZ0h2qzGXlsEm2cB9xOT5d9pqHS4+sIoi7P4ICyk26aIxjkhngce6peG
         ScWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqt7ARUDHv2rxmnudl5n8hjiFM4V+F7XudPkbN5np4T7Fp0Duc5Yl8zooOAMJNeAR7f8SELtAe0PW/@vger.kernel.org
X-Gm-Message-State: AOJu0YyaIE+oX6SpRdEADmfU/oIZZ+2X4dbQuRnHK0YDz8RmHq0iUsnQ
	Eiq/Jq1Hg8lKJ8EKVNdD8jk/as9bQfOVPurlKF8BGwN47tHrRmGdlbb40t6/v6xkFd3PCJVh3IB
	H7wa5oXReLzb7km3PRlBDwoKUjJ38EAxBy4/KBLxfVlHH8OEBOl2ult9lGeIDXeI=
X-Gm-Gg: ASbGnct75ymoY0L0bgbP2iEPFt/HP8akbyuQrcOadX89h7CbnPKtv++xL9fCTtoaRdZ
	QxjCbwtEch3sIHcvdAAc66QYHl8u7vUHPQGYBov0zq3MMwn4rhw7lFOckrnm9HqIn57DSUZYtFq
	ROOR3/KBbmAngO9cSek7q3ssZrIKsdLzJ8lBrqSjSN3dmjjcH2eGgIBZaRTZuG13Yqk5Xn8UE0c
	W1Vl0B+sJBhr3x9BjJ4vdnlxp3Pbz6eCudMnOIskqrSjdPZ9RNmexznMOC99fSqI38o80Ac8wO9
	RdKuB2y/WaV7KoRJ3Lb6aFAUP3T1zU95bF+F82jopyeXPFpFdvgGnqH5zEA0hG9XVTX9323b5xh
	jOZOn/Jd8yGxg817jWA7Crre07ZolPbCwzPlAzo5Ao7nAbfg=
X-Received: by 2002:a05:600c:540c:b0:471:12be:743 with SMTP id 5b1f17b1804b1-471178a3f93mr178692145e9.15.1761219861209;
        Thu, 23 Oct 2025 04:44:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9ZhN8mEzvDl19eAfb5+piHJIx0UNn6iM8BVw8iQ/eotSJnTtbF+oUAQOCAOFM12uWUwrycg==
X-Received: by 2002:a05:600c:540c:b0:471:12be:743 with SMTP id 5b1f17b1804b1-471178a3f93mr178691905e9.15.1761219860831;
        Thu, 23 Oct 2025 04:44:20 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e75a0sm3525020f8f.5.2025.10.23.04.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 04:44:20 -0700 (PDT)
Message-ID: <7232849d-cf15-47e1-9ffb-ed0216358be8@redhat.com>
Date: Thu, 23 Oct 2025 13:44:18 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] netrom: Prevent race conditions between neighbor
 operations
To: Lizhi Xu <lizhi.xu@windriver.com>, dan.carpenter@linaro.org
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org,
 kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org,
 syzbot+2860e75836a08b172755@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
References: <aPcp_xemzpDuw-MW@stanley.mountain>
 <20251021083505.3049794-1-lizhi.xu@windriver.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251021083505.3049794-1-lizhi.xu@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/21/25 10:35 AM, Lizhi Xu wrote:
> The root cause of the problem is that multiple different tasks initiate
> SIOCADDRT & NETROM_NODE commands to add new routes, there is no lock
> between them to protect the same nr_neigh.
> 
> Task0 can add the nr_neigh.refcount value of 1 on Task1 to routes[2].
> When Task2 executes nr_neigh_put(nr_node->routes[2].neighbour), it will
> release the neighbour because its refcount value is 1.
> 
> In this case, the following situation causes a UAF on Task2:
> 
> Task0					Task1						Task2
> =====					=====						=====
> nr_add_node()
> nr_neigh_get_dev()			nr_add_node()
> 					nr_node_lock()
> 					nr_node->routes[2].neighbour->count--
> 					nr_neigh_put(nr_node->routes[2].neighbour);
> 					nr_remove_neigh(nr_node->routes[2].neighbour)
> 					nr_node_unlock()
> nr_node_lock()
> nr_node->routes[2].neighbour = nr_neigh
> nr_neigh_hold(nr_neigh);								nr_add_node()
> 											nr_neigh_put()
> 											if (nr_node->routes[2].neighbour->count
> Description of the UAF triggering process:
> First, Task 0 executes nr_neigh_get_dev() to set neighbor refcount to 3.
> Then, Task 1 puts the same neighbor from its routes[2] and executes
> nr_remove_neigh() because the count is 0. After these two operations,
> the neighbor's refcount becomes 1. Then, Task 0 acquires the nr node
> lock and writes it to its routes[2].neighbour.
> Finally, Task 2 executes nr_neigh_put(nr_node->routes[2].neighbour) to
> release the neighbor. The subsequent execution of the neighbor->count
> check triggers a UAF.
> 
> The solution to the problem is to use a lock to synchronize each add a
> route to node, but for rigor, I'll add locks to related ioctl and route
> frame operations to maintain synchronization.

I think that adding another locking mechanism on top of an already
complex and not well understood locking and reference infra is not the
right direction.

Why reordering the statements as:

	if (nr_node->routes[2].neighbour->count == 0 &&
!nr_node->routes[2].neighbour->locked)
		nr_remove_neigh(nr_node->routes[2].neighbour);
	nr_neigh_put(nr_node->routes[2].neighbour);

is not enough?

> syzbot reported:
> BUG: KASAN: slab-use-after-free in nr_add_node+0x25db/0x2c00 net/netrom/nr_route.c:248
> Read of size 4 at addr ffff888051e6e9b0 by task syz.1.2539/8741
> 
> Call Trace:
>  <TASK>
>  nr_add_node+0x25db/0x2c00 net/netrom/nr_route.c:248
> 
> Reported-by: syzbot+2860e75836a08b172755@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=2860e75836a08b172755
> Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>



> ---
> V1 -> V2: update comments for cause uaf
> V2 -> V3: sync neighbor operations in ioctl and route frame, update comments
> 
>  net/netrom/nr_route.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
> index b94cb2ffbaf8..debe3e925338 100644
> --- a/net/netrom/nr_route.c
> +++ b/net/netrom/nr_route.c
> @@ -40,6 +40,7 @@ static HLIST_HEAD(nr_node_list);
>  static DEFINE_SPINLOCK(nr_node_list_lock);
>  static HLIST_HEAD(nr_neigh_list);
>  static DEFINE_SPINLOCK(nr_neigh_list_lock);
> +static DEFINE_MUTEX(neighbor_lock);
>  
>  static struct nr_node *nr_node_get(ax25_address *callsign)
>  {
> @@ -633,6 +634,8 @@ int nr_rt_ioctl(unsigned int cmd, void __user *arg)
>  	ax25_digi digi;
>  	int ret;
>  
> +	guard(mutex)(&neighbor_lock);

See:

https://elixir.bootlin.com/linux/v6.18-rc1/source/Documentation/process/maintainer-netdev.rst#L395

/P


