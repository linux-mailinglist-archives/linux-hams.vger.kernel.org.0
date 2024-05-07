Return-Path: <linux-hams+bounces-247-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4F28BDE36
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 11:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5CDC1F237F5
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 09:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1580414E2C0;
	Tue,  7 May 2024 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="cB06D8GB"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82F114D2B5;
	Tue,  7 May 2024 09:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715074183; cv=none; b=raTnb57i0sQLdEx0xnNqxhKXmx0g3ZRc3+g1QafZwzIXHY3ji0wkdGYGgryWRuIOdba4lgcnQtfwvaMdFnJtEmjMvl1FX4pL5qYv3c4L1NZHQk8Fdzo5GBdMh8htddjMtzkbibz5yeBTx1/BH7V5DoBX4s+eZXqWuVfxn1Pm4eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715074183; c=relaxed/simple;
	bh=+b0PqBmWiKM8fSbUCScwguB7ROVDToBniJB8hjgJhHs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxuoUjsRmiDLNfhaXeVWOur6JaFSFb/JEZCc5oV1RcdXf8aXGj/huLOs6JtuDQuYdboDIxSs/1E2RbBzAkn3r8DglSagLiBEwps9/P706xLtVtXiPaY0wwlB9/L+L/BKc1RKFSCYOokDjN6OcQVlEKS/19Bq9kCqpXzFLAeO+vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=cB06D8GB; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4478Qxlb005008;
	Tue, 7 May 2024 02:29:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=pfpt0220; bh=V3Tg6uTIXEi5tFnn8HB+4v
	Z22SCVpPXl19hGHqdsyx8=; b=cB06D8GBOysMaiXZDzKxH7erL7QiJ8lT9f9qgO
	52YSWme11bRV9si5kUz4YsPUdqA6X9H6bYlJE7joaZaw0QAlg0ZJrZAMU/FTqBmT
	CEGWKWAjEQVR6bdy+9YShf4YwjJuv2HRlghNbmL7sJDxRKutNRkgopK9Ya9OCW3B
	SP064sqRYQTGbh2jBp8OeLdHuZsHSsv9W8EDZ/SlmWoPnpSZvDUP4ErYmbf9n7cE
	6Sl1nTVvKt36maWUVKHTRp/BzRabKqP2v3Ian/zBwjHJlNLZP7Y13CyiAkxl35zr
	uPgw8TS0/0vGQWrhACI+gA6a/jVFx62d5DHXcBCHgl8c6/Sg==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3xygt2r5aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 02:29:22 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 7 May 2024 02:29:21 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 7 May 2024 02:29:21 -0700
Received: from maili.marvell.com (unknown [10.28.36.165])
	by maili.marvell.com (Postfix) with SMTP id C08753F7067;
	Tue,  7 May 2024 02:29:18 -0700 (PDT)
Date: Tue, 7 May 2024 14:59:17 +0530
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: Duoming Zhou <duoming@zju.edu.cn>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-hams@vger.kernel.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <jreuter@yaina.de>, <dan.carpenter@linaro.org>
Subject: Re: [PATCH net v5 1/4] ax25: Use kernel universal linked list to
 implement ax25_dev_list
Message-ID: <20240507092917.GA1049473@maili.marvell.com>
References: <cover.1715065005.git.duoming@zju.edu.cn>
 <bd49e83817604e61a12c9bf688a0825f116e67c0.1715065005.git.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bd49e83817604e61a12c9bf688a0825f116e67c0.1715065005.git.duoming@zju.edu.cn>
X-Proofpoint-ORIG-GUID: KfjDknZKjbqKtls64QpGuiYWmbBMGvzA
X-Proofpoint-GUID: KfjDknZKjbqKtls64QpGuiYWmbBMGvzA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_03,2024-05-06_02,2023-05-22_02

On 2024-05-07 at 12:33:39, Duoming Zhou (duoming@zju.edu.cn) wrote:
> The origin ax25_dev_list implements its own single linked list,
> which is complicated and error-prone. For example, when deleting
> the node of ax25_dev_list in ax25_dev_device_down(), we have to
> operate on the head node and other nodes separately.
>
> This patch uses kernel universal linked list to replace original
> ax25_dev_list, which make the operation of ax25_dev_list easier.
> There are two points that need to notice:
>
> [1] We should add a check to judge whether the list is empty before
> INIT_LIST_HEAD in ax25_dev_device_up(), otherwise it will empty the
> list for each new ax25_dev added.
>
> [2] We should do "dev->ax25_ptr = ax25_dev;" and "dev->ax25_ptr = NULL;"
> while holding the spinlock, otherwise the ax25_dev_device_up() and
> ax25_dev_device_down() could race, we're not guaranteed to find a match
> ax25_dev in ax25_dev_device_down().
>
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> -ax25_dev *ax25_dev_list;
> +static struct list_head ax25_dev_list;
>  DEFINE_SPINLOCK(ax25_dev_lock);
>
>  ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
> @@ -34,7 +35,7 @@ ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
>  	ax25_dev *ax25_dev, *res = NULL;
>
>  	spin_lock_bh(&ax25_dev_lock);
> -	for (ax25_dev = ax25_dev_list; ax25_dev != NULL; ax25_dev = ax25_dev->next)
> +	list_for_each_entry(ax25_dev, &ax25_dev_list, list)
>  		if (ax25cmp(addr, (const ax25_address *)ax25_dev->dev->dev_addr) == 0) {
>  			res = ax25_dev;
>  			ax25_dev_hold(ax25_dev);
> @@ -52,6 +53,9 @@ void ax25_dev_device_up(struct net_device *dev)
>  {
>  	ax25_dev *ax25_dev;
>
> +	/* Initialized the list for the first entry */
> +	if (!ax25_dev_list.next)
> +		INIT_LIST_HEAD(&ax25_dev_list);
if you define ax25_dev_list using 'static LIST_HEAD(ax25_dev_list)', you need this conditional check and
initialization ?

>  	ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_KERNEL);
>  	if (!ax25_dev) {
>  		printk(KERN_ERR "AX.25: ax25_dev_device_up - out of memory\n");
> @@ -59,7 +63,6 @@ void ax25_dev_device_up(struct net_device *dev)
>  	}
>
>  	refcount_set(&ax25_dev->refcount, 1);
>

