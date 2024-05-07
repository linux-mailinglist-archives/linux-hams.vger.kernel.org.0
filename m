Return-Path: <linux-hams+bounces-220-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C822C8BD9C3
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 05:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0513F1C22001
	for <lists+linux-hams@lfdr.de>; Tue,  7 May 2024 03:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2253FB9F;
	Tue,  7 May 2024 03:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="gh5OC/nW"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp71.iad3b.emailsrvr.com (smtp71.iad3b.emailsrvr.com [146.20.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FEE2A8DD
	for <linux-hams@vger.kernel.org>; Tue,  7 May 2024 03:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715053023; cv=none; b=iYurHB7Tx10knELyr9nUOOjADtm8q/ODlel262s2kT7NRGIj3MJmwl3wONu/ORPYCV/CH0YhCosgYbNfteO/AxJMAUFsCZ0wojoyGHTcR2uw8c51V6hF4cI/dPdivy2rknopQn9mPv59dsjupIAAC+UbIddeD7sAXDN97ijyBrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715053023; c=relaxed/simple;
	bh=cWMEq59X7zXzL3nJa3BLDmbI7tPBBw3giwZaDz3gBLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVr6WziMHGfRyvilfQ1QrL4PsEPhFImB5uKo645NuwOE4saQX1XwW6Yss9xOUFadDTovqXvrC3SBLdFej7G69WuIxrnagLhn/XUVQjLZAnQdWfFos7T0ykFSKuIrN2ZYhX6jcx4UWYUXEZk1bPpCHspf1B2JUaQCztOiaiR5YFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=gh5OC/nW; arc=none smtp.client-ip=146.20.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1715051887;
	bh=cWMEq59X7zXzL3nJa3BLDmbI7tPBBw3giwZaDz3gBLI=;
	h=Date:From:To:Subject:From;
	b=gh5OC/nWu2m+qCk6m0PPZVQuqzfvydgDIjESDhRMMppqckZ/n5+QjiJhRy4hCYjND
	 59EjcycsEBuXz4t8EnBMrx/7wNVNtkJSZcs+vaPEmElxiYNIXw8Slbu5ct7020lsLA
	 IchtCetQlquQGfB2uJiffbK2EpbEY9NblZGnzfX8=
X-Auth-ID: lars@oddbit.com
Received: by smtp17.relay.iad3b.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id B39DCA02AA;
	Mon,  6 May 2024 23:18:06 -0400 (EDT)
Date: Mon, 6 May 2024 23:18:06 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org, 
	edumazet@google.com, davem@davemloft.net, jreuter@yaina.de
Subject: Re: [PATCH net] ax25: Fix refcount leak issues of ax25_dev
Message-ID: <eb5oil2exor2bq5n3pn62575phxjdex6wdjwwjxjd3pd4je55o@4k4iu2xobel5>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <78ae8aa0-eac5-4ade-8e85-0479a22e98a3@moroto.mountain>
 <ekgwuycs3hioz6vve57e6z7igovpls6s644rvdxpxqqr7v7is6@u5lqegkuwcex>
 <1e14f4f1-29dd-4fe5-8010-de7df0866e93@moroto.mountain>
 <movur4qy7wwavdyw2ugwfsz6kvshrqlvx32ym3fyx5gg66llge@citxuw5ztgwc>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <movur4qy7wwavdyw2ugwfsz6kvshrqlvx32ym3fyx5gg66llge@citxuw5ztgwc>
X-Classification-ID: 523c2de5-7003-4c0c-8800-1836014b2a10-1-1

On Sat, May 04, 2024 at 06:16:14PM GMT, Lars Kellogg-Stedman wrote:
> My original patch corrected this by adding the call to netdev_hold()
> right next to the ax25_cb_add() in ax25_rcv(), which solves this
> problem. If it seems weird to have this login in ax25_rcv, we could move
> it to ax25_accept, right around line 1430 [3]; that would look
> something like:

The same patch applies cleanly against the Raspberry Pi 6.6.30 kernel,
and clears up the frequeny crashes I was experiencing in that
environment as well.

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

