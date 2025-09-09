Return-Path: <linux-hams+bounces-629-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 020FEB49E23
	for <lists+linux-hams@lfdr.de>; Tue,  9 Sep 2025 02:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E182F4E01ED
	for <lists+linux-hams@lfdr.de>; Tue,  9 Sep 2025 00:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054CA1F130A;
	Tue,  9 Sep 2025 00:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O36T0wMM"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B187F1E9906;
	Tue,  9 Sep 2025 00:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757378612; cv=none; b=JMKlcvfLjzq9nTg2AvEC8mzN7ADbvqMRrFdcVo48vucrjZsvIfQnxjImmFhU9Zm0h3mYBFJ+/4d3TvbrMMt4uAWBV72dUHBf/p4b+W6TwgMBomCUOYburukitFLVRlxFq5HJwlg94bH6DXA9ukF/lXC3Ado3CE9w34uqbwqQxv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757378612; c=relaxed/simple;
	bh=WHbr101hR4anFn40YWww/ka9V7Y3W5JIZ/oD1doygy8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tV74AXurtyvXWVNzxXt3LvqlRMHzIyUfiWTmDy7D4LtePqDk3tkMJ2baO4n4kFcBjAtFQU2hhE6qTZL24oS7JBmP41uov0UXcaHylTFoKZ8CT2FSV0gHdm7NY9QOXejn257e5EgRB/yHSjVM3w6YC4SwM4NRScyHtl5dCBKt/qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O36T0wMM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038E7C4CEF1;
	Tue,  9 Sep 2025 00:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757378612;
	bh=WHbr101hR4anFn40YWww/ka9V7Y3W5JIZ/oD1doygy8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=O36T0wMMSn/CeaA+wKMiDyHwPg6FlYnUnZzYzPyoyh2TFzjdawe+om5fR+zZSZ5f7
	 VfEmni2nlq1c1vuSCHvJuSE0jcs63YA9XQJHw2ZKyvw038UNzCk8SgMuYFDZY6e87X
	 g0PaJltDgF4K2WioakIO54M3BtfSb7QErOkmzVvNmjH6Cmzp8rPEEtzvk3QpWJg1n8
	 AzQvSLUP/bR9O4MZY2wviOJ5XSUj9T6RosguIWi0OeOpCwf42VPPXHtgKRINUA7RTW
	 cSDiLLJE7DGXhZIpbpkARJXxdGmY2HMFJK5Dy+PmDX29uTu07VGsqkzSIlWZlNsOr1
	 cmTa71pzgkKiw==
Date: Mon, 8 Sep 2025 17:43:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bernard Pidoux <bernard.f6bvp@gmail.com>
Cc: stanislav.fort@aisle.com, davem@davemloft.net, disclosure@aisle.com,
 edumazet@google.com, horms@kernel.org, linux-hams@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 security@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v4] netrom: linearize and validate lengths in
 nr_rx_frame()
Message-ID: <20250908174331.47d895a0@kernel.org>
In-Reply-To: <FDBA9F48-A844-4E65-A8B1-6FB660754342@gmail.com>
References: <FDBA9F48-A844-4E65-A8B1-6FB660754342@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 7 Sep 2025 16:32:03 +0200 Bernard Pidoux wrote:
> While applying netrom PATCH net v4
> patch says that 
> it is malformed on line 12.

FWIW the version I received is completely mangled. There's a leading
space before each +. You can try B4 relay if your mail server is giving
you grief.

