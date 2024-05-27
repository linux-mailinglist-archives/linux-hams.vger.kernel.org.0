Return-Path: <linux-hams+bounces-334-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBDB8D0240
	for <lists+linux-hams@lfdr.de>; Mon, 27 May 2024 15:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB1011C2149A
	for <lists+linux-hams@lfdr.de>; Mon, 27 May 2024 13:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B144015ECF8;
	Mon, 27 May 2024 13:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="Q4Oxt6Rd"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp89.iad3a.emailsrvr.com (smtp89.iad3a.emailsrvr.com [173.203.187.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F891640B
	for <linux-hams@vger.kernel.org>; Mon, 27 May 2024 13:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.203.187.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716818210; cv=none; b=XY52OPNUnGQhJIlEoUtOJoooZWDZT1Vp8wPLqwrZyp8Lye40nHBnGLZJvJke2PW4pJmNm0hlEM+f13c1XPxgxxPSpK+mq4jvBgyHtv23slH4MHyVcNimaOvAfnE27ReSO9IFGgStIzmQoSAUS4mJxaR7Ow5VTf8Uq1rpviN66NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716818210; c=relaxed/simple;
	bh=WGOYIdE7d5slzi7k/JERyTQxurR9YhgI95/DL6D31Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9SmVieqN9NrJ+Rn+J3ytykiN9ZG/jPP5FitU2GrzViNneHaKhG0XBhwDfZ3RpdhMS/atkLkuqztZAvEEbb5j43iT1huYHeC3LlSLGeQR7Owx05M+RCsbY/DvF/0Fbd7HzLLyJ6y64+vrtGSDOaAE0NQlITj4sBSSKZrhgIFSLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=Q4Oxt6Rd; arc=none smtp.client-ip=173.203.187.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1716817878;
	bh=WGOYIdE7d5slzi7k/JERyTQxurR9YhgI95/DL6D31Bg=;
	h=Date:From:To:Subject:From;
	b=Q4Oxt6RddXz4aN0UYxZCCaVM2Qp8aEyfN/iPL6matefsMDxXeaJaFVRDKrgt9UrWc
	 3eRwM73Jv2crmjt9SBIS27DzCfQtLr0/Gz+f+n+e4Asa1LMQ72Mjh9kHc8O2dGK8gR
	 04V7m7UiSLpK9QwDs7+O6XltxryVJzdv8FmFdv7w=
X-Auth-ID: lars@oddbit.com
Received: by smtp36.relay.iad3a.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id F0B19543A;
	Mon, 27 May 2024 09:51:17 -0400 (EDT)
Date: Mon, 27 May 2024 09:51:16 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Chris Maness <christopher.maness@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
	David Ranch <linux-hams@trinnet.net>, linux-hams@vger.kernel.org, Duoming Zhou <duoming@zju.edu.cn>, 
	Dan Cross <crossd@gmail.com>
Subject: Re: Mainline Kernel Question
Message-ID: <putxyik6yrsixppkef6v4jqmy743bxqf5uupoh6biwnjdr2vrg@s7axcoh4rv3s>
References: <CANnsUMGJvG6Cs57_ar-iixCpyRKq_ScMZFNaq-SpdHX53ou6fQ@mail.gmail.com>
 <CANnsUMFWHd1kvbDubMnX4aS9La=0EpiCzee7NDNqkCMUwLXPaw@mail.gmail.com>
 <5d40d8ee-e4e6-41cb-a8d7-b2590b549494@moroto.mountain>
 <CANnsUMH9Of7q4NyTnWPE6e-XdezTTxiQeRVDPWzofW82Smj+zg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANnsUMH9Of7q4NyTnWPE6e-XdezTTxiQeRVDPWzofW82Smj+zg@mail.gmail.com>
X-Classification-ID: 7cd18da9-7831-4e98-a339-1816d1106a97-1-1

On Mon, May 27, 2024 at 06:30:01AM GMT, Chris Maness wrote:
> I would be happy to.  I already have the system for it.

Chris,

Could you post that somewhere? I'm working on putting together an
automated test suite, and I'm curious to see what you're doing.

Thanks!

-- Lars

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

