Return-Path: <linux-hams+bounces-460-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2CAA00307
	for <lists+linux-hams@lfdr.de>; Fri,  3 Jan 2025 04:06:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 529AD1631DB
	for <lists+linux-hams@lfdr.de>; Fri,  3 Jan 2025 03:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3DE418E764;
	Fri,  3 Jan 2025 03:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvI1pGmX"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600011537C6;
	Fri,  3 Jan 2025 03:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735873579; cv=none; b=mcOcd7Pc1LHkTqn0mMscNxJrKNrpoDkmAIr+11ixGj72j16eEEdUM3kNq35J1rb9WLKSwYKq8mx2JZZMdlLHAd4/7ZeA2He+XuKSEWtnOkQ51FWbLluu6yUn2PEjcEz5R3w0emWP0M6W5wo6+9oGsWlc7XV4k6r+HhGsXnhUyh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735873579; c=relaxed/simple;
	bh=LuIItTH7CZowXK6ClDg78qR4z6nbS1CzA5lJSsMm23U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kt+lmcczFwQkpfQ6DsGsRQey5pu4FW1nvguwEp+vHSGLtVIykIliGr6RYF4JTkV4BheTOx0NkfHw73zR2SNPqyipO+fsYvH6k+Z2Nfq8E+/5nF9BxV0i1v/wZ3+/lOIC4QI6j+99sraRPaegg4RYIChoRgjGw+3zFujJrpYx3YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvI1pGmX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA26C4CED0;
	Fri,  3 Jan 2025 03:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735873578;
	bh=LuIItTH7CZowXK6ClDg78qR4z6nbS1CzA5lJSsMm23U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HvI1pGmXC0ZsvHdeOc/A2XkUSsqjkr8HeB/ifkX2/2DXdjIx0wogtLno+r9BAdePq
	 X06mIML2uKXzonxzn6NVyWq03zCvMw0DMZLrher97eFtavvsSTu7eSF744CDcT4gEU
	 GzK14zOEuvlesSFyT8vekVxiV2r8HcjUNtDRkTSV/cH+g6AS3ZqjZ2GqNRUAw7c0Ju
	 /9+HxIwdpJu6TJByjeo0olz7t07Yj4UPNZs623Sg4n2SU3JrtzenfaeztEJwV/oYZO
	 nBHlujO/URXJat1ha7QC01aOqSjr7hMmGz4lpFhXvWWVrXklil10MBStpZy4TlJBpx
	 anyPj3pEVvKhg==
Date: Thu, 2 Jan 2025 19:06:17 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: "t.sailer@alumni.ethz.ch" <t.sailer@alumni.ethz.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>
Subject: Re: [PATCH] hamradio: baycom: replace strcpy() with strscpy()
Message-ID: <20250102190617.6c9ad4d4@kernel.org>
In-Reply-To: <bqKL4XKDGLWNih2jsEzZYpBSHG6Ux5mLZfDBIgHckEUxDq4l4pPgQPEXEqKRE7pUwMrXZBVeko9aYr1w_E5h5r_R_YFA46G8dGhV1id7zy4=@ethancedwards.com>
References: <bqKL4XKDGLWNih2jsEzZYpBSHG6Ux5mLZfDBIgHckEUxDq4l4pPgQPEXEqKRE7pUwMrXZBVeko9aYr1w_E5h5r_R_YFA46G8dGhV1id7zy4=@ethancedwards.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Dec 2024 15:13:42 +0000 Ethan Carter Edwards wrote:
> The strcpy() function has been deprecated and replaced with strscpy().
> There is an effort to make this change treewide:
> https://github.com/KSPP/linux/issues/88.

Please rebase on net-next/main and repost.
-- 
pw-bot: cr

