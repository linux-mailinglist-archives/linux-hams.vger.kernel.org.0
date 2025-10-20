Return-Path: <linux-hams+bounces-658-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBEABF06FE
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 12:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4A67034B0C2
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 10:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C837B2F656C;
	Mon, 20 Oct 2025 10:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IrQEmkuO"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950EC2F5A2F
	for <linux-hams@vger.kernel.org>; Mon, 20 Oct 2025 10:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760955017; cv=none; b=Ycl2UMcarG7lWisVzkGHlXuv2oIoEUPzXRrjsWbDi8xPaOWZ0x9Qw1BmzM/NH8JZrrg40e2uSCKVIr9s+gWcVijztqDLTnCq3hrAkiM34gy3joPC+3tg8dWliD/ix58G4sB4+SQidITUyBRmxDXzy99Zpj33oCXTSRIvRlYKWjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760955017; c=relaxed/simple;
	bh=irwHczt7jTZu429UGLQiqo0bQAQe6oh+iKytPWQdo9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1jRDB5pJ2g6ZVBLRzuHhYNSh8OUVplNIDf/LfWyE8KwI6xDd/V5tRWCbS5lr7YMII/6Qie3KcozPCS5kpX85Y0VQfWMJc+cLXe6GTOUruJ6bg8DvLjjHyrHR+m7r5VYjOUvbgwQd8CY/ajAAq8eXoklpMlWPvnXOqL7NKQIK5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IrQEmkuO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47117f92e32so25218905e9.1
        for <linux-hams@vger.kernel.org>; Mon, 20 Oct 2025 03:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760955014; x=1761559814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OIWARefYPtKPfqB0xwmbONWz7j5Ht1YLIPXHwUrFpFA=;
        b=IrQEmkuOxi/GwkN7WZzPHCV9sexq3E+L96YDx3FnOsl1H0EsWzxBSoBXHYy4+PcOaw
         bZrx4g24U6Qh6aKxNKiui8iSaSCwilmuB0O/DR9maelpfVLqbrzxpm9evrP5VOZoIzXg
         imtW3zwYyJYVZQaJaYBBMggL67UuWS1ibg1h7EiCsx6/Sll3IdKHx9YcbL8atDRB/WBO
         Z5iNhKJLnL7tkjd29dQXkeITTqHHkVle2IWeq4HE89yZ9Zc/YnHyW8sUlfgod3TIfOeA
         mf1PosV+Jedpeu/Pt2Mkk1FMonZ1oTDKJLz7fqajl5YbGw0356zOjcsJwkBNuAGE9rbW
         wkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760955014; x=1761559814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIWARefYPtKPfqB0xwmbONWz7j5Ht1YLIPXHwUrFpFA=;
        b=l9pHciOhSU2lSRa9yb/6lHqXY8RY/ycATN4+JgD6ChM0hLh1sVAcsohBr3BAM74M2e
         vtimGtH4ecFIp8GIdM1nhjDIkcDrozQ7ZcvUD2JRj1Lwrf8abBcwpBhpWbMJvAeAcMXE
         LUmgeLCOJBwh3M1EircQOxh5XYsmOq4J5m8hmbjz0+ZHGECO/WwMTfqqqL2CyYQM2dz7
         ZXwmw9pQWKICKONR5DlLLonrILHpqye/p9BZsA/2UvpkB047aDy11pVvIXUre5NUcFmM
         twaaoZXs4ucwvJdPC9dIebqMO9Hc0RkzOawIWii8KAIuBgafxDjjLBT7JkNH4DiIvvkJ
         eAcw==
X-Forwarded-Encrypted: i=1; AJvYcCU6TA3vlnglbuFecA29TYNo10g+rdJwRTao2nHajFBZQXKnwFy8+Lpz4j+vMRB38SsNN9F4hvNqaC6K@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0UAeNEer/ylwgKCaxnMaOk/Q4iVnodkBXVtuDkoza6XMzXO1l
	lsJ9pmMkecdE9ec8uhrJ2ij6TjWHMRLuDtriQKSyaJloUx8pqmZXTZEIhTtff4l+iHs=
X-Gm-Gg: ASbGncvR4+mW2vDny6izxRrKXoXmeCCFnHHNFpn7S5I/tv4uZbi0ZFiKOhil2dOMFWY
	LIJYx6W1dgo/6Myfv6KyaOsCWEooAfBiLU1hlXYjZkLwVlYZOuraBOwU32kQDJTw/IIgsxt1Qc4
	CJTqdVfY9ZBn1k0IorCzGuGO6rbRFQ0mNLYok8TlZ4HfI+85mH/U2qEcOKzawKc19kjrIZASA0j
	pIm/0Lo53C/NIwRIg5p5Zhs+7uuOljWHBbvTrD0je2ngtTKzp9zfnPZdpeU1X0OuaXGgGEHSzIy
	nKmSeO/qBp4v2akUjFG7+MmQ058bqsfQlNK6igfcUOiiLvdovZhTkPagMM12ATyQkpWo9SqT4U/
	VjYDrApYMVAgqF5abnMm3EfbfCMRGbk7tM8ltx5Ku3Wgb4kUWOkyztPeDTHAnDR+xlPvhMcCMOh
	o8GL/Ra24ylvmHM5E=
X-Google-Smtp-Source: AGHT+IHrrYifEg1gpWKBK0S8ZIgR8Z+8wANqrcE3Fb9jIBMTS+dnOjVa5aHlyOB7K3bTQJksXWDdXA==
X-Received: by 2002:a05:600c:3b8d:b0:46e:4883:27d with SMTP id 5b1f17b1804b1-4711791c8d3mr99523105e9.30.1760955013820;
        Mon, 20 Oct 2025 03:10:13 -0700 (PDT)
Received: from localhost ([41.210.143.179])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5bab52sm14440788f8f.22.2025.10.20.03.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 03:10:13 -0700 (PDT)
Date: Mon, 20 Oct 2025 13:10:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lizhi Xu <lizhi.xu@windriver.com>
Cc: syzbot+2860e75836a08b172755@syzkaller.appspotmail.com,
	davem@davemloft.net, edumazet@google.com, horms@kernel.org,
	kuba@kernel.org, linux-hams@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] netrom: Prevent race conditions between multiple add
 route
Message-ID: <aPYKgFTIroUhJAJA@stanley.mountain>
References: <68f3fa8a.050a0220.91a22.0433.GAE@google.com>
 <20251020081359.2711482-1-lizhi.xu@windriver.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020081359.2711482-1-lizhi.xu@windriver.com>

On Mon, Oct 20, 2025 at 04:13:59PM +0800, Lizhi Xu wrote:
> The root cause of the problem is that multiple different tasks initiate
> NETROM_NODE commands to add new routes, there is no lock between them to
> protect the same nr_neigh.
> Task0 may add the nr_neigh.refcount value of 1 on Task1 to routes[2].
> When Task3 executes nr_neigh_put(nr_node->routes[2].neighbour), it will

s/Task3/Task1/

> release the neighbour because its refcount value is 1.
> 

The refcount would be 2 and then drop to zero.  Both nr_neigh_put() and
nr_remove_neigh() drop the refcount.

> In this case, the following situation causes a UAF:
> 
> Task0					Task1
> =====					=====
> nr_add_node()
> nr_neigh_get_dev()			nr_add_node()
> 					nr_node->routes[2].neighbour->count--

Does this line really matter in terms of the use after free?

> 					nr_neigh_put(nr_node->routes[2].neighbour);
> 					nr_remove_neigh(nr_node->routes[2].neighbour)
> nr_node->routes[2].neighbour = nr_neigh
> nr_neigh_hold(nr_neigh);


This chart is confusing.  It says that that the nr_neigh_hold() is the use
after free.  But we called nr_remove_neigh(nr_node->routes[2].neighbour)
before we assigned nr_node->routes[2].neighbour = nr_neigh...

The sysbot report says that the free happens on:

	r_neigh_put(nr_node->routes[2].neighbour);

and the use after free happens on the next line:

	if (nr_node->routes[2].neighbour->count == 0 && !nr_node->routes[2].neighbour->locked)

Which does suggest that somewhere the refcount is 1 when it should be
at least 2...  It could be that two threads call nr_neigh_put() at
basically the same time, but that doesn't make sense either because
we're holding the nr_node_lock(nr_node)...

regards,
dan carpenter


