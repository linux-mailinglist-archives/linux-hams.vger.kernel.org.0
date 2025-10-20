Return-Path: <linux-hams+bounces-665-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC3EBF1C08
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 16:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 22EA04EA906
	for <lists+linux-hams@lfdr.de>; Mon, 20 Oct 2025 14:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C8031A7ED;
	Mon, 20 Oct 2025 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IgMnt/ya"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEC3136351;
	Mon, 20 Oct 2025 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760969482; cv=none; b=C+OkT6NEgXXIUT0pOl4mPODGwpd2UAgfMGKBHbPvlBf60sW9FHt9K5bwFGpOMaKfSRI6/OXCt6WxfcOaqsZtVQtGRf4X+lLLuzS7gWOG01Vg+FJw10C85Pgansgle94fdH9KbIQffEDPA5edf5a+3tS0MFLZ/Kfr+uPkLdAlQdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760969482; c=relaxed/simple;
	bh=AWyMZLPpj4ENw762AewDNXUr7Eumkj4BikItwdTH+fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rS17j2r3O74BgvWcydeuGue+Av8mVGaNnbzYNikPcDpYGpCM1daJeHrmIYAsPCxkUGRvuv0S2+voZov5ADfVLrH6pEoPm0tAb6DXd8H+eKHpeylAPcLjyRXDtRW4cWOsqLiuz6gCDhq10UgU3F/SbaWNjtvhC+JcqltRLGxTMv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IgMnt/ya; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81D3C4CEF9;
	Mon, 20 Oct 2025 14:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760969481;
	bh=AWyMZLPpj4ENw762AewDNXUr7Eumkj4BikItwdTH+fE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IgMnt/ya+DM5yOX9/Tnv+MzuKsmiHnRLP0fRx83j83IhZR1nmOMuWjCnDS8erEx3S
	 LMRFhSJWkB+mJh1RJNM4HSJLYQ7r3qo3KLfysl1pWlnVNeMdm1YA1iDteCfmOmKnJ5
	 h1yjaMg3v+vugGcWDwoeEiIcsKGGByctO23gwo0S6iMxLr9pBN3iLP+lzfLBoakrFM
	 wuy/8R2lzgCPdnnlN05KaFJ8eDlHaX4pEXVw55I27uvFdeJwZUSxA5v+2RGEl1Z6F4
	 uI4sa8mBJZsWmT66JTJsf5BPE9MUtK1+hbsshuBc4nSPRgl0msbmox+JMa0siRJzrU
	 axTFET/5cqglg==
Date: Mon, 20 Oct 2025 15:11:17 +0100
From: Simon Horman <horms@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: networking: ax25: update the mailing list
 info.
Message-ID: <aPZDBZ9JXn2bwo9t@horms.kernel.org>
References: <20251020052716.3136773-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020052716.3136773-1-rdunlap@infradead.org>

On Sun, Oct 19, 2025 at 10:27:16PM -0700, Randy Dunlap wrote:
> Update the mailing list subscription information for the linux-hams
> mailing list.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Simon Horman <horms@kernel.org>


