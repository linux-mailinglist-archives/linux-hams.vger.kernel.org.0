Return-Path: <linux-hams+bounces-522-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA9AAD2A7C
	for <lists+linux-hams@lfdr.de>; Tue, 10 Jun 2025 01:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17BB8189021E
	for <lists+linux-hams@lfdr.de>; Mon,  9 Jun 2025 23:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0589822A802;
	Mon,  9 Jun 2025 23:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqmJREeY"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95FB227E9F;
	Mon,  9 Jun 2025 23:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749511604; cv=none; b=F5P/331HtFDzZd164dNISVnkIsFHd1+QOy4KL25WS88ExHHf4GG38OTJy0lKE+w2oyFuQEjR0baqjBKOmuX5DF4lPB3VC+9fHI2hysVCNaniYI6xKEO9dmJOrD+NBqA6erZsmnUA1sfI31pO9Vlw66w6ffkl7AYHtjewgTHh93E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749511604; c=relaxed/simple;
	bh=95+fXPPytchzkz4AQrgGNdFJLtuacNTbOdwBilJs9Do=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ppdPM5Dc5XqDK7jYviYKHDdvinUniZ+kXfg9PeeOfyTZH0DKSXcrMZsmUgAiwVCUU7/AOkY9NSEgoGuNbbEDhF9R9fWYx5SOUKOXiv3GnfIsYen2S9tjULiqDC54IErbMSyorNf7G0OJl6KK5W0N+7z7M6yFOBFkJk1tLtEYbtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqmJREeY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6D2C4CEEB;
	Mon,  9 Jun 2025 23:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749511604;
	bh=95+fXPPytchzkz4AQrgGNdFJLtuacNTbOdwBilJs9Do=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hqmJREeY6eWFdzfiuAaaDV6Ij0Bdo2CVJXcqiDnNF9IDGTLHH0/1gHtQFfOL1tnnQ
	 JXhU0rcv1LKWncco7zYpnf8EXWO7BUWz5IlS/bxCJF068tHKAMu6kaQemYj0gxfEhJ
	 mWmkqMLMcPZ1ZAFdEkFhBqt5BEIAWHGCHMKYMnZYUh8ChXKOVswUcLkton85sq0FUT
	 KzLr1iTC+OkJCB+8C21VnBT1L68gUBxYDfuozD2DDYwps85MsdTo1ZEw5Z6wR2DpdP
	 Gpd49PbdSRKfSDxVzLnpHRJ24YSsOvLVOvykjdczRlqSs8IpJPPRoJ7ofELO3+I6xz
	 hSuXjuJ5cCvgQ==
Date: Mon, 9 Jun 2025 16:26:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Ranch <linux-hams@trinnet.net>
Cc: Denis Arefev <arefev@swemel.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Nikita Marushkin
 <hfggklm@gmail.com>, Ilya Shchipletsov <rabbelkin@mail.ru>, Hongbo Li
 <lihongbo22@huawei.com>, linux-hams@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org,
 syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com
Subject: Re: [PATCH net] netrom: fix possible deadlock in nr_rt_device_down
Message-ID: <20250609162642.7cb49915@kernel.org>
In-Reply-To: <5f821879-6774-3dc2-e97d-e33b76513088@trinnet.net>
References: <20250605105449.12803-1-arefev@swemel.ru>
	<20250609155729.7922836d@kernel.org>
	<5f821879-6774-3dc2-e97d-e33b76513088@trinnet.net>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 9 Jun 2025 16:16:32 -0700 David Ranch wrote:
> I'm not sure what you mean by "the only user of this code".  There are 
> many people using the Linux AX.25 + NETROM stack but we unfortunately 
> don't have a active kernel maintainer for this code today.

Alright, sorry. Either way - these locks are not performance critical
for you, right?

