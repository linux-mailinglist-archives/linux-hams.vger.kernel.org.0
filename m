Return-Path: <linux-hams+bounces-471-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0ABA1678A
	for <lists+linux-hams@lfdr.de>; Mon, 20 Jan 2025 08:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB0D41884BA0
	for <lists+linux-hams@lfdr.de>; Mon, 20 Jan 2025 07:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1345D18FC84;
	Mon, 20 Jan 2025 07:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="QpYehyG4"
X-Original-To: linux-hams@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBE018FC92;
	Mon, 20 Jan 2025 07:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737359013; cv=none; b=iJum+k1E22km4FbuFOVk1dpkx+Fj0tXrSbWzlAzczsQ7B9QS7qy0Me4oRuKCNnkiX8/xpfxpPOZmQFeQgMoFlnYDAxbzgFbw97jIFv/oBJoJl8ufFrnfzKSpAimyoVKSBUq0cAyDa/yv0acOk+fRX2P+iaxJHuExRlo2Vr1vAXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737359013; c=relaxed/simple;
	bh=LQNzZpYdYVJJOrWJwoU9T+maxwRLdMU1JC29N3sisuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eESLu83TzVFQIegvSkOEBXxg8YmDplwah6JYU5t+qLXV68TuDZe6+7X33C40ZNAK5/jm2VBNGx9UF9RpYmhaSSF3/+VRTCqHnhY/CpXv+h05VsYHKZzagXQPacd+RAf8dfOPBa3KdrYWLJhv6URBiJ2G8xN45EG+KUrDbXFbRVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=QpYehyG4; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Yc2Q71dNHz9sQb;
	Mon, 20 Jan 2025 08:43:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1737359007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LbOqci+Y+1n+DVwByFP/6eLO3g5cf2zoepibzS/0joQ=;
	b=QpYehyG4nuZFnNv9REp6eA6YF0t4QxCCujQRuQR4NLKtgS1migUo6GWNMzo5gJRL1FxDbe
	MnVWPPbqNXTKRyH/FXJ7oJCjjSI9rrfYe/uBExTmMDvnkrIXRNsMtMcXmvWH+44mzKGL7P
	ppAF71QDw0EAzBL0AmTAP6QGOuwKvqCqIde+3N9Nc2Y/wBTAXHzFkvFcuD4Zo0hZ3sKJjI
	X45Utky3uVOx4agtan2/j/K9At5XmkdjhnUW1ogtuSuBWr/HNzG89fUEgnmepGp8CpY1sc
	GN06zo01Ic/C0N/vzhgRRRfTEEgJ5v2D7vxWyWnhDjHK5ehCY5MCOU0D5LkPeg==
Date: Mon, 20 Jan 2025 02:43:23 -0500
From: Ethan Carter Edwards <ethan@ethancedwards.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
	"t.sailer@alumni.ethz.ch" <t.sailer@alumni.ethz.ch>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>
Subject: Re: [PATCH v2] hamradio: baycom: replace strcpy() with strscpy()
Message-ID: <uhggj2ghv63akhsuxpwmrjabkbhzotpwepogguxjvxt7ilmzeq@q3prlwntbr72>
References: <62yrwnnvqtwv4etjeaatms5xwiixirkbm6f7urmijwp7kk7bio@r2ric7eqhsvf>
 <92b603cb-a007-4f02-bc81-34a113a04e7d@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92b603cb-a007-4f02-bc81-34a113a04e7d@stanley.mountain>

On 25/01/20 10:40AM, Dan Carpenter wrote:
> On Sun, Jan 19, 2025 at 07:34:51PM -0500, Ethan Carter Edwards wrote:
> > The strcpy() function has been deprecated and replaced with strscpy().
> > There is an effort to make this change treewide:
> > https://github.com/KSPP/linux/issues/88.
> > 
> > Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> > ---
> >  v2: reduce verbosity
> 
> If you had resent this patch a week ago we would have happily merged it.
> But now you've hit the merge window and you'll need to wait until
> 6.14-rc1 or -rc2 have been released and then rebase it on net-next again
> and resend it.
I see. My apologies. High school started back for me last week, so I was
busy getting situated with my classes and all. I'll keep this in mind
and send it back out in a week or two.

Thanks,
Ethan
> 
> Anyway, if you do resend it feel free to add a:
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> regards,
> dan carpenter
> 

