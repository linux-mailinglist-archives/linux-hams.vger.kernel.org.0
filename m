Return-Path: <linux-hams+bounces-308-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2863B8CC69D
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 20:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D329C1F2243D
	for <lists+linux-hams@lfdr.de>; Wed, 22 May 2024 18:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C7C1465B9;
	Wed, 22 May 2024 18:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HcjI3aEZ"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8346B142621;
	Wed, 22 May 2024 18:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716404099; cv=none; b=U5CYLjvsPlk8uCH47sHVZh/zGJ6kf175SYqEubX7vXVUsq4k5eV4Cc8RZSgDmGqyZVPPITHy3yVHOw4c6jOYGKZQKsj0W0jopIdmoni2YUg0UuwUVcqnNAvFgJxznMnusdkiK2t88uBB9KbjrCGqdZW+eiPRgdL9sIB8+MJYwVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716404099; c=relaxed/simple;
	bh=AJDbIwZZLkNBkgAXspeW7IDZ79hlwr0DhW6dRqxnk6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fvC/GXOAzVkFwh7yXUZBy/r4+9usaoR7UCnW3c14Y275NJ6c4fJiP+Ri86ZVBonn56up6XjKMPg8Hg/OW8kmJyNhrn7bbxtaz8FjSAmFUPrxYtdHiBiVTaw/4SguBKPnJnGYK7LqaWtJf50iLEDqKa4KhXbsxW5q/aHqyXkMNkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HcjI3aEZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4B9C2BBFC;
	Wed, 22 May 2024 18:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716404099;
	bh=AJDbIwZZLkNBkgAXspeW7IDZ79hlwr0DhW6dRqxnk6Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HcjI3aEZdYC9r0mQQaV3YPTP7U+V+HZaw+dv2wkABfSDL2t3UNG6cifmoFzCg2cuk
	 niu5Inu0UX4jwvBzXVxymatLBPIbVZ1Mu6C/sTrZ/+5QLPBBA7UYlEbB3Fph7yaiwe
	 uSEaetw6Zy0sOTyZERMDkXdBQxZc4uQssgslRLPp1BTtLro8KmZBwcaXgQyIi4REbY
	 bKuTMPYStA5FeANHOiori9CkwxbXIVyA2DWfA1VbtVunleMuFemyBpIVWkuSWHMP2H
	 LFHggYly5CJHmxZS8+wB1uO8aU56U3SgOR9usBH29tPViv8u457YDeNpcqwxQ6p328
	 kcqru0noJqt6Q==
Date: Wed, 22 May 2024 11:54:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3] ax25: Fix refcount imbalance on inbound connections
Message-ID: <20240522115458.3634a1ae@kernel.org>
In-Reply-To: <yzz225joxbxptlrdqjr4u2cwk4myactk6ozz7bfpv25dqbzri4@mz5ocbxbefxp>
References: <46ydfjtpinm3py3zt6lltxje4cpdvuugaatbvx4y27m7wxc2hz@4wdtoq7yfrd5>
	<20240521182323.600609-3-lars@oddbit.com>
	<20240522100701.4d9edf99@kernel.org>
	<yzz225joxbxptlrdqjr4u2cwk4myactk6ozz7bfpv25dqbzri4@mz5ocbxbefxp>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 May 2024 14:25:36 -0400 Lars Kellogg-Stedman wrote:
> > Please CC maintainers (per script/get_maintainer.pl)  
> 
> ...the ax.25 tree is currently orphaned:
> 
>     AX.25 NETWORK LAYER
>     L:	linux-hams@vger.kernel.org
>     S:	Orphan
>     W:	https://linux-ax25.in-berlin.de
>     F:	include/net/ax25.h
>     F:	include/uapi/linux/ax25.h
>     F:	net/ax25/

Fair point, but get_maintainer acts in a bit of a hierarchical fashion,
so since we don't have AX25 maintainer and dedicated tree - the general
networking maintainers should get CCed

