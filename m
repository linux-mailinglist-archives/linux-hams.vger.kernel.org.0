Return-Path: <linux-hams+bounces-264-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF0A8C0A03
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 05:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF085282F9D
	for <lists+linux-hams@lfdr.de>; Thu,  9 May 2024 03:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F7C13C9D9;
	Thu,  9 May 2024 03:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="O87Cd2ap"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700CDD517;
	Thu,  9 May 2024 03:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715224392; cv=none; b=ogwcolegQLjz487lBT0n4RuL7wxEzwsGN3QtYxbSQjoittF5mofn4cUxGzEP1H8Ib4CVC1cUTJOQiVsDdh4+M+8BauHuNZMoq8ywIZGVkV14iltaS7SIdoT/L3ECordqc8qSgN0PLcfkUtQHj7AEY8dMVLIu3+ocFkJHXYOWvfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715224392; c=relaxed/simple;
	bh=7aBwxO2CipScIGLBEjHWmQgZZx67CZNWp8onHyyobcM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0zij9PbNsygCYCFZoQZKbYCGZ1bmlyoxbl4+G1rYS4kPBASp6gorTdIVpuxUrG0F6jl6eEhJ0d53cayCy2LGthUTaRCNTzfckdP+LuIS0c7n2jjfl8DwakSZjIWDoLIIiOgvSX8gSLlqwhdsdtACVlrdv85zQe/pd33dLLE7oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=O87Cd2ap; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448NOrbp003000;
	Wed, 8 May 2024 20:12:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=pfpt0220; bh=NIN1SoqsKzzoR1CfLY8RZC
	nwsAX8ymAGByQHK0QnZHA=; b=O87Cd2apgUI/luHEUjpzz7eLB5961pH5ddIQbP
	vqQBGLla7b9C9Qh/7jeNVyWaURNz3Um5Egq3Id852F4gZkUDHor3JNQdBfa6dOT+
	Q4HeaAOeiaxRtd4cKgYVP16kJxBSj5ZgfeKCvI89a7pQKgWxEVtN8MugAVvp/piB
	RugysNPV7IIFR3tOURe2EGzIBiarQxPCvUuXvZEVhqZOvC3EqxRAY2IrbzZdGwFm
	h/QDvopSvXLgIsG383jjOpbr/gwq/yBDf2+qtk/ZYMZNWoyWeEFxMHQo3liPZHAk
	mCrHDyyhj4bm2WldGGKUAKRSHmxSBXgU1HFlY0U/ARvqoHbA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3y0b2d321n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 20:12:58 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 8 May 2024 20:12:58 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 8 May 2024 20:12:58 -0700
Received: from maili.marvell.com (unknown [10.28.36.165])
	by maili.marvell.com (Postfix) with SMTP id EC58F5B6D03;
	Wed,  8 May 2024 20:12:54 -0700 (PDT)
Date: Thu, 9 May 2024 08:42:53 +0530
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: Duoming Zhou <duoming@zju.edu.cn>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-hams@vger.kernel.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <jreuter@yaina.de>,
        <dan.carpenter@linaro.org>
Subject: Re: [PATCH net v6 1/3] ax25: Use kernel universal linked list to
 implement ax25_dev_list
Message-ID: <20240509031253.GA1077013@maili.marvell.com>
References: <cover.1715219007.git.duoming@zju.edu.cn>
 <d52c1f4dbd6e09769007233aa343010e98c85f0d.1715219007.git.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d52c1f4dbd6e09769007233aa343010e98c85f0d.1715219007.git.duoming@zju.edu.cn>
X-Proofpoint-GUID: l2QN4S6jGK8w_e9CzPGmE2I-1-2mgNaB
X-Proofpoint-ORIG-GUID: l2QN4S6jGK8w_e9CzPGmE2I-1-2mgNaB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_10,2024-05-08_01,2023-05-22_02

On 2024-05-09 at 07:26:12, Duoming Zhou (duoming@zju.edu.cn) wrote:
>  		if (ax25cmp(addr, (const ax25_address *)ax25_dev->dev->dev_addr) == 0) {
>  			res = ax25_dev;
>  			ax25_dev_hold(ax25_dev);
> @@ -52,6 +53,9 @@ void ax25_dev_device_up(struct net_device *dev)
>  {
>  	ax25_dev *ax25_dev;
>
> +	/* Initialized the list for the first entry */
> +	if (!ax25_dev_list.next)
will there be any case where this condition is true ? LIST_HEAD() or list_del() will never
make this condition true.

> +		INIT_LIST_HEAD(&ax25_dev_list);
>  	ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_KERNEL);
>

