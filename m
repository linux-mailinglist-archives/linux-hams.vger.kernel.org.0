Return-Path: <linux-hams+bounces-252-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C783B8BED63
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 21:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82AE1283EB7
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 19:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284F22101A2;
	Tue,  7 May 2024 19:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="oyHizF33"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp89.iad3b.emailsrvr.com (smtp89.iad3b.emailsrvr.com [146.20.161.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD061CB339
	for <linux-hams@vger.kernel.org>; Tue,  7 May 2024 19:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715111524; cv=none; b=s0FbZg2LvzB7sA+LRK+6K1AfNEyYhABh2tNMeHepzAlPTkOcoMhjdSkxt802U3rWYWAKk7tk5K8bFYeJJ+OXn5CwK/2+jotM6OdWqzPHvPqz5DYsERbhJjChAqBESqZpr045Qh8adlTJSNGC1f6rZ7bEWAyTwHNBrK4VOckCNdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715111524; c=relaxed/simple;
	bh=Qkybr0ICtPOdOIgP4Bi2fvNRD8VjwHKkQtnvW+vmQBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4DNNtozPNu7AEU8TDRGPE5+wMT39SZmvEEEvYZkX0VpfD8jeXp9A9USbAB+u6NZ8BgE1yEVcctJc1ggqlvog8l4e+nA6z/QrEAXJshgFWgkiwglNsTIVLTpyu6ZlgfSOMofU/dFOnCI8WwjZzNGrvbo3GalJIJGfQFFFvS7Y1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=oyHizF33; arc=none smtp.client-ip=146.20.161.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1715110992;
	bh=Qkybr0ICtPOdOIgP4Bi2fvNRD8VjwHKkQtnvW+vmQBs=;
	h=Date:From:To:Subject:From;
	b=oyHizF33EJ9iPYpjHhjzhbUyxd4IKJc047Qjp1SV2xtzZaVViI5QEGEQXBIwOUhcK
	 6jS1781D76NO4uaIx/i5/Cyw0q+6i2hyCTju4SK/sLJaQZaSQ4o/ASrGlWvQNyM3sZ
	 g6ZBjMao8iV6oR9+pxsJaoxVAZyZQjPl/RZImsLk=
X-Auth-ID: lars@oddbit.com
Received: by smtp12.relay.iad3b.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id B0AD9C00FC;
	Tue,  7 May 2024 15:43:11 -0400 (EDT)
Date: Tue, 7 May 2024 15:43:11 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hams@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, 
	jreuter@yaina.de, dan.carpenter@linaro.org
Subject: Re: [PATCH net v5 1/4] ax25: Use kernel universal linked list to
 implement ax25_dev_list
Message-ID: <sijkuyypbnelg3w2shbxm3y6zu3qhfurvpvkoij5eluolnqr5w@y5dq74ycxzkm>
References: <cover.1715065005.git.duoming@zju.edu.cn>
 <bd49e83817604e61a12c9bf688a0825f116e67c0.1715065005.git.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd49e83817604e61a12c9bf688a0825f116e67c0.1715065005.git.duoming@zju.edu.cn>
X-Classification-ID: 3459c125-4b56-4fd5-9dc7-757dbe40275f-1-1

On Tue, May 07, 2024 at 03:03:39PM GMT, Duoming Zhou wrote:
>  typedef struct ax25_dev {
> -	struct ax25_dev		*next;
> +	struct list_head	list;

Would it make sense to replace this with:

LIST_HEAD(ax25_dev_list);

And then get rid of:

> +	/* Initialized the list for the first entry */
> +	if (!ax25_dev_list.next)
> +		INIT_LIST_HEAD(&ax25_dev_list);

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

