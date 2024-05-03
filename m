Return-Path: <linux-hams+bounces-202-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D19468BABB6
	for <lists+linux-hams@lfdr.de>; Fri,  3 May 2024 13:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F6F2283E4B
	for <lists+linux-hams@lfdr.de>; Fri,  3 May 2024 11:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD59152788;
	Fri,  3 May 2024 11:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XizIh0rW"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD84C2E9
	for <linux-hams@vger.kernel.org>; Fri,  3 May 2024 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714736288; cv=none; b=ip0H5aZ9xpndhU84ou/QZ/M/Mm96E+CkUQPQxb7CkyTyZiguVfWWpGtFEdoZrR5/xqPldrbGAFAgeLpSCaqmzcklOJZ6vAZKP0dcwEUwT/A2sSQAek3688tAnM7CIX2aFtft8yVQ/zWRVLkIVpWs5H0hm/qmTBEVG83Heq9lhVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714736288; c=relaxed/simple;
	bh=2mFwIyJjhlyZVBLu3QUcc225c9YGrTsjtcIlVVK9h4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJaR3LzRmOCKCyeoVruia5zu4OH07fTyG6VsyGAiMK8jVbQ02FxSpJcJPG3n/TYj2e7/NpVcu7C+ir+bWPDRmRnnOpnf4MFsRFvM8sptRnzKqAWZL8hUVxnpKySZHj5PbBIwYaO+WBXkjzdhfknR3zUqwtOtC060V1pJDAUMKa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XizIh0rW; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41b79451153so56109135e9.2
        for <linux-hams@vger.kernel.org>; Fri, 03 May 2024 04:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714736285; x=1715341085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MLQCofPdnJ63uOr5tDqjn2YZWUonrylBn211XOLOE44=;
        b=XizIh0rWMaGtGbkF5dUoT3wX2ZbEhrBEWDLxu3KA74Dk8WkpGgqsXSvlCyRaq/SPnt
         d2cpaOkZSUR/Y6M8KTAo4H4nFmQBQNbghTM3aHNeGjZYm/A+OvMbDdBviW1gMr+zoZT4
         MrSlqRIu1K4zbOHpHU4ThYpHfSzncy1vqlKvwNL3RMTzk92J7lMrPl+hU3kDn34AFaXz
         FF0Y29A3ouZjpLFvDHwHbVseEbC1RZLgYQXisZjmhqSh9NMmQsmbtt1q/65KFVfZffml
         xalTMZ40rCcRN3QURAgeb5tt8CkVZmJprGW/5YBwD+glgRqaCWeU7m070tevUbfVwk5V
         iqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714736285; x=1715341085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLQCofPdnJ63uOr5tDqjn2YZWUonrylBn211XOLOE44=;
        b=IWXYYgLIbugQSzsH2wbFdaCowqaSRm2Rjlqc5LJDEmiCqisVJumkHZZwUffdvdId1e
         la5hOdDcR6qHzgkQj0proYoi1/bJuzlnetocOwMdAl6Sp1YkU4BcVp0YQxjtzJy4Ya2A
         U8P+ck6YzPZL8bQFFOHlSr6FVAPPukQEJAVjsdF1QLgzjJsH5gUk6rOg0WeS1KWjGvTZ
         UcjqdxXGC2jY3AeaofdcrIMjLL0TbgXW/9Eari4PlVDJHoUF08gLeUaWDZa9NzUBSyIo
         HGkkXRXD73OaCh27unmPMmfRheavbo79vaDFuDeOHGLZ/88xINfKMyP6Cr4Rt34olybK
         y5GA==
X-Forwarded-Encrypted: i=1; AJvYcCWC0EsJi5RG7aEnmWdfp3T5FreG21zEkN3e+3t94QsTk/qgR87WeS50A1Fzh23MX4dayoiVL4JfaBqN2Lumju4qxmkHYOmAdDooLQ==
X-Gm-Message-State: AOJu0YxGWNWHXV3K3K+4KT0iUSVYRRS5Bgc+EZe+9ygEUnIlBWI2PsEz
	r7KDVe4SIYgmg0sAkzuspNZ11bvv36RqcZWvdz05FxITX26YIzBRoIoZ0KKm2fI=
X-Google-Smtp-Source: AGHT+IEUFq74MPGIgnW3XCqkUsaInfSWPvUq0gwS1ToGTdl+wAiuIT9mb9JtsW4g2vBgPQlcLO6dgw==
X-Received: by 2002:a05:600c:4fc3:b0:41a:ff7d:2473 with SMTP id o3-20020a05600c4fc300b0041aff7d2473mr1857856wmq.4.1714736284563;
        Fri, 03 May 2024 04:38:04 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u21-20020a05600c139500b004190d7126c0sm9131680wmf.38.2024.05.03.04.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 04:38:04 -0700 (PDT)
Date: Fri, 3 May 2024 14:38:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Reuter <jreuter@yaina.de>,
	Paolo Abeni <pabeni@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Lars Kellogg-Stedman <lars@oddbit.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net v2 2/2] ax25: fix potential reference counting leak
 in ax25_addr_ax25dev
Message-ID: <e471ec93-6182-4af0-9584-a35e2680c66d@moroto.mountain>
References: <cover.1714690906.git.duoming@zju.edu.cn>
 <74e840d98f2bfc79c6059993b2fc1ed3888faba4.1714690906.git.duoming@zju.edu.cn>
 <6eac7fc4-9ade-41bb-a861-d7f339b388f6@web.de>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6eac7fc4-9ade-41bb-a861-d7f339b388f6@web.de>

Yeah, it's true that we should delete the curly braces around the if
block.  Otherwise checkpatch.pl -f will complain.

The commit message is fine as-is.  Please stop nit-picking.

regards,
dan carpenter


