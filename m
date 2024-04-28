Return-Path: <linux-hams+bounces-156-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 596008B4DC8
	for <lists+linux-hams@lfdr.de>; Sun, 28 Apr 2024 22:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 804151C2090A
	for <lists+linux-hams@lfdr.de>; Sun, 28 Apr 2024 20:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E3B8BF0;
	Sun, 28 Apr 2024 20:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="UWJPE8/G"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp72.iad3b.emailsrvr.com (smtp72.iad3b.emailsrvr.com [146.20.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075064A2C
	for <linux-hams@vger.kernel.org>; Sun, 28 Apr 2024 20:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714336595; cv=none; b=kQybshITUKA9C/rDa0Awawqmna+8qOS5ArDsUbeVRD9Mkhs1fgqI22TRQu/ocrX4dLbGk4nGKudn+iTAPL4eyt3hrgS6kQL7qAEsHCZsqf9x/FhmfE90txxWsvLMAkg24Hqm3eWStPErbMeacEVs1cOG9kxdFbNIL+UZk6E6Zpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714336595; c=relaxed/simple;
	bh=qNU/cHkFFjtR7EmRnatRbZ/mVUJMTaytTaUDEqPJ2Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fv4o9/LV3GQduNjwF1LPcYlQnHbg0ZIe6SLJKL/GPcJSAzhGoUqiCQMPP+mjfZU10iWZmDaEsJ+ymihx3p/tyrjm1vBPeolmj1yiOA20qxEp+bg0Qz3U2SKL3yrvoagNQSwkK0Z1/c4SuSfymrlq+c/KVXXjOULvKdKRYlhwCx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=UWJPE8/G; arc=none smtp.client-ip=146.20.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1714334256;
	bh=qNU/cHkFFjtR7EmRnatRbZ/mVUJMTaytTaUDEqPJ2Ns=;
	h=Date:From:To:Subject:From;
	b=UWJPE8/GRImxLUW6P6QJGyzWNUsfaWnHA4/ceVUR/RqMHS1G0UAf+qZ2Eq/Qj5yWY
	 UnwfUnSA0weL4ASMowbzTVP8hL6x1HpAGdHOSKpoJbZc/kOF3IJjSzjskvwJUazsw5
	 HlK8pOPrWomaEr4KMw+23DZGSEza6xTpaeNx283g=
X-Auth-ID: lars@oddbit.com
Received: by smtp10.relay.iad3b.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id B64E2E0298;
	Sun, 28 Apr 2024 15:57:36 -0400 (EDT)
Date: Sun, 28 Apr 2024 15:57:36 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Miroslav Skoric <skoric@uns.ac.rs>
Cc: linux-hams@vger.kernel.org
Subject: Re: [...] unregister_netdevice: waiting for ax0 to become free.
 Usage count = -1
Message-ID: <tffff2tppdxudqj4pq73zkxakk3qehfwrfeboxit7vqcpnkxxl@xd2jz5ho7all>
References: <dd43a40e-ab22-a751-185f-3931ade2fa8f@uns.ac.rs>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd43a40e-ab22-a751-185f-3931ade2fa8f@uns.ac.rs>
X-Classification-ID: 308e232e-eac0-44c5-bb04-1f7bb73f2765-1-1

On Sun, Apr 28, 2024 at 05:57:30PM +0200, Miroslav Skoric wrote:
> subsystem and on top of it runs FPAC node and FBB mailbox. The issue happens
> whenever the *other* machine has some netrom activity such as a BPQ node/bbs
> or like.
> 
> [...] unregister_netdevice: waiting for ax0 to become free. Usage count = -1
> [...] unregister_netdevice: waiting for ax0 to become free. Usage count = -1
> [...] unregister_netdevice: waiting for ax0 to become free. Usage count = -1

That sounds remarkably like the problem I was asking about a few weeks
ago; that threads start with
https://marc.info/?l=linux-hams&m=171271178900331&w=2. I'm curious if
you see any of the kernel traces I reported in your kernel log? That
would help identify the problem.

I just posted a patch that resolves it for me [1], but that patch was
against the current development kernel (6.9.0rc5).

[1]: https://marc.info/?l=linux-hams&m=171417563600765&w=2

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

