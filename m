Return-Path: <linux-hams+bounces-419-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD29964F09
	for <lists+linux-hams@lfdr.de>; Thu, 29 Aug 2024 21:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 374061F236C1
	for <lists+linux-hams@lfdr.de>; Thu, 29 Aug 2024 19:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F231B9B3A;
	Thu, 29 Aug 2024 19:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxQpi/LB"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E5C1B7906;
	Thu, 29 Aug 2024 19:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960209; cv=none; b=FcLSHyp/vjwYcc1x3N/YvVFHIV0SZILh/+LQmSW8g3DZukDckPvBd1stzLTM6e9hw9LMZzuwRzSdjX2yM6d/f8GH+o5jOge2Tb2job9L4Hu/xNgSFOB8vo9dx1MFQpr+zCB6LOAwvn93LprwwXOKb9nH6Qss4SELTfFloc2x0zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960209; c=relaxed/simple;
	bh=hkL0vjS7SessfwWwpXInjTewc6+d21g556wt1xmOhz0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WIXjHDgfmtb2fg9OH2rPumedY0o7pSviF06ALkd7tK8qwiYj2w/AnUkt61kUPzRb+gkYgVsDUeo/kH/fQw/RnSUd6ysYCoB4pRMMUFKg1n72JZsYyaIwtuCbTJ4AH7KSWg5Wt2E/M2l1D3DtSpeFBKMECSHyDjp3tCTizfvkkK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxQpi/LB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E26C4CEC1;
	Thu, 29 Aug 2024 19:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724960208;
	bh=hkL0vjS7SessfwWwpXInjTewc6+d21g556wt1xmOhz0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jxQpi/LBJg3/+Izuxjc0OB5V9nKxYz0qywrw2DQDt2s04ikYMn/MoQzKolqw1IwA4
	 o3H170motp0Qh2mQC+FjyZfnDaGxeCSmFxZHpEmfCU0JIRvogjDIWx/cBJE9flS8Or
	 zQHI1Dcl5G00ks5rsS8TRf5Pvawch1WNXfc+8yrqMuSsEvshdFyoStKli0Qe6oUISi
	 Bi84omjbBmz8lqIte4mQm0kEMmwWlirm9xsBL8gdEHsSKjv8xkpaFJT37O7O93N837
	 NnGYrFgrOYRZyUxcxw20c9A2m6M8BUZMNjB/mfOf6bWUp5HmmhetqtnRsrruxHD9qC
	 2d0FvVc41EfIA==
Date: Thu, 29 Aug 2024 12:36:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
 <dsahern@kernel.org>, <ralf@linux-mips.org>, <jmaloy@redhat.com>,
 <ying.xue@windriver.com>, <dan.carpenter@linaro.org>,
 <netdev@vger.kernel.org>, <linux-hams@vger.kernel.org>,
 <netfilter-devel@vger.kernel.org>
Subject: Re: [PATCH net-next v2 0/6] replace deprecated strcpy with strscpy
Message-ID: <20240829123647.32aaeb17@kernel.org>
In-Reply-To: <20240828123224.3697672-1-lihongbo22@huawei.com>
References: <20240828123224.3697672-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Aug 2024 20:32:18 +0800 Hongbo Li wrote:
> The deprecated helper strcpy() performs no bounds checking on the
> destination buffer. This could result in linear overflows beyond
> the end of the buffer, leading to all kinds of misbehaviors.
> The safe replacement is strscpy() [1].

What's you plan? Are you going to send 200 patches like this
just for networking?

$ git grep strcpy -- net/ drivers/net/ | wc -l
199

Please don't. I'll look thru this series but it feels like such
a waste of time.

