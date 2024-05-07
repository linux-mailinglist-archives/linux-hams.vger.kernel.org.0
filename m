Return-Path: <linux-hams+bounces-251-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0E88BE590
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 16:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7705B28369F
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 14:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24966165FC1;
	Tue,  7 May 2024 14:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="YiqL1bcj"
X-Original-To: linux-hams@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E2416132A;
	Tue,  7 May 2024 14:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715091232; cv=none; b=BrVCwyEeQvkaaREyRQkxrGaMdJsKNTX+BQ//7oKVvniqFIJICTS2L4mAhjNfH2d8EF6PF0kPiWt1guo4PY++uuYeViYGeuYGY1bDHaQn/i/aVj9s6mtD0qCbrD+aZQFf2z031Fw8Id7vyusItF5+nmm8X5sAKAWvKkqgrL+3Gsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715091232; c=relaxed/simple;
	bh=LbuUNo2s482mQRrIcVdTCP+fnZZxVYLbxTrPXeS+Ksg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0oM6R/jnHW5ySB6FmUMk3QjZPuY3VLgXj+yqx8owtsIJsJMO7HwCh07//wmcNAG6NketmONe/IG1ofXkUUNTbrKAiwOIX/n6zz3pO1w/tgf78RqBTtuHX4K53G6VKqBBBvxKKinl4QOKHT0CEB3vYPnl7WAo2dLH0DlZ47ThJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=YiqL1bcj; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4478bQdu006998;
	Tue, 7 May 2024 07:13:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=pfpt0220; bh=MXQybSTqFGSVtkBn7jZOAr
	GJgra1Vr2nPLrSYts8mXw=; b=YiqL1bcjPaRyYag5ICulirsXfRPJ1RXprA75W/
	QCSOuLnUghs9qmhjdqM0vzBqKB1JRvsP7sH/4jtmQqx1bQ7qgh+29cXarT0zHHXG
	XLi0YHWxJQjs2agw9kOV/fAEa02keG23NtMybJDuAej/I5m8j7CE0cx7xDsEeU1Y
	gogC0GeMPqKboYXuey4ZokoHRSzksmVqikxy8eKFYeLx05vRkvALkY+g4qVLJUcA
	xbvdPD60I0sJEFcs4PDXAVX1Db7Fut9NLbcbCZltNbKU7126cjvkx4r4zB5Fek0Z
	FZ7WDlOmRDelM0a6DRhdDcR2/FJ+FD1PmcqA4AIdRT1uoTBg==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3xwmhghj5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 07:13:31 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 7 May 2024 07:13:30 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 7 May 2024 07:13:30 -0700
Received: from maili.marvell.com (unknown [10.28.36.165])
	by maili.marvell.com (Postfix) with SMTP id B13823F7041;
	Tue,  7 May 2024 07:13:27 -0700 (PDT)
Date: Tue, 7 May 2024 19:43:26 +0530
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: Duoming Zhou <duoming@zju.edu.cn>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-hams@vger.kernel.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <jreuter@yaina.de>, <dan.carpenter@linaro.org>
Subject: Re: [PATCH net v5 4/4] ax25: Change kfree() in ax25_dev_free() to
 ax25_dev_put()
Message-ID: <20240507141326.GA1050877@maili.marvell.com>
References: <cover.1715065005.git.duoming@zju.edu.cn>
 <5c61fea1b20f3c1596e4fb46282c3dedc54513a3.1715065005.git.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5c61fea1b20f3c1596e4fb46282c3dedc54513a3.1715065005.git.duoming@zju.edu.cn>
X-Proofpoint-ORIG-GUID: ifxI65k7sibW2qbX6yaRP1jxGqMYbOvE
X-Proofpoint-GUID: ifxI65k7sibW2qbX6yaRP1jxGqMYbOvE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_07,2024-05-06_02,2023-05-22_02

On 2024-05-07 at 12:33:42, Duoming Zhou (duoming@zju.edu.cn) wrote:
> The object "ax25_dev" is managed by reference counting. Thus it should
> not be directly released by a kfree() call in ax25_dev_free(). Replace
> it with a ax25_dev_put() call instead.
>
> Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
>  net/ax25/ax25_dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
> index c6ab9b0f0be..2a40c78f6a0 100644
> --- a/net/ax25/ax25_dev.c
> +++ b/net/ax25/ax25_dev.c
> @@ -195,7 +195,7 @@ void __exit ax25_dev_free(void)
>  	list_for_each_entry_safe(s, n, &ax25_dev_list, list) {
>  		netdev_put(s->dev, &s->dev_tracker);
>  		list_del(&s->list);
> -		kfree(s);
> +		ax25_dev_put(s);
The commit message "The object "ax25_dev" is managed by reference counting"
seems be not making sense here.  in case ref > 0 after the ax25_dev_put().
ax25_dev_put(s) is not initiating any mechanism to come back and recheck.

>  	}
>  	spin_unlock_bh(&ax25_dev_lock);
>  }
> --
> 2.17.1
>

