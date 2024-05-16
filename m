Return-Path: <linux-hams+bounces-274-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC2F8C7DBD
	for <lists+linux-hams@lfdr.de>; Thu, 16 May 2024 22:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 356981C212A5
	for <lists+linux-hams@lfdr.de>; Thu, 16 May 2024 20:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D541D14A612;
	Thu, 16 May 2024 20:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="JAEN21yV"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp82.iad3b.emailsrvr.com (smtp82.iad3b.emailsrvr.com [146.20.161.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1993139F
	for <linux-hams@vger.kernel.org>; Thu, 16 May 2024 20:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715891821; cv=none; b=fCQ1feMT6n/dPCvWtZfYSSnygeXVzruIziJO6SdQC6ybI21Uf88x4F7zuUn3zEBIKXjRYwdTz93oeSckrjb0z45uyIW6o9tADvDw6VO/hJtE83S0StBCWiJrbwwCMIof2yvcbdDIGtEnjZZ8Jt7wqqX95RLD33NHCoAL1F8Vqn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715891821; c=relaxed/simple;
	bh=woXkL/9qQS0/k3ID0v9Q8WMp0BgGvQWIeQU9B4ZFwyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3wAFxYm+y0NhJZFzwTp/FYhfGKWy6lvu/JeoUEPBcNszlKZGgOsmjxnWElAKeFrlNMPldUOWizAbrut8rdzCv3iza3hXh2t2Hp0jbyfb+KOQQGxubPDzTYHgEMxwg+F/pxzktpdkYsfJTsN9oev1djPK76s9Q1Cq3+neY6pj5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=JAEN21yV; arc=none smtp.client-ip=146.20.161.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1715887238;
	bh=woXkL/9qQS0/k3ID0v9Q8WMp0BgGvQWIeQU9B4ZFwyo=;
	h=Date:From:To:Subject:From;
	b=JAEN21yVhlR5ZMsApejjP2vDPrPYk9EcHN4vYHbv8bNWeXROQvegvQ0pCWfSUiDw6
	 gn341Riez7gxfVYyoDdU0qebvXs5dGC88DXzgT6tcHhY3InhkFSzgz/F3gbeenQ2kr
	 nhT/e0yMH5VzQ7MhXv1lP26fSZErPRPO2lYMNVoM=
X-Auth-ID: lars@oddbit.com
Received: by smtp11.relay.iad3b.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 70B5440331;
	Thu, 16 May 2024 15:20:38 -0400 (EDT)
Date: Thu, 16 May 2024 15:20:38 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: duoming@zju.edu.cn
Cc: linux-hams@vger.kernel.org, dan.carpenter@linaro.org
Subject: Re: [PATCH net] ax25: Fix refcount leak issues of ax25_dev
Message-ID: <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn>
X-Classification-ID: 5b4adde0-03ae-4c75-ae0d-50ad3c28e5d0-1-1

On Wed, May 15, 2024 at 05:52:25PM GMT, duoming@zju.edu.cn wrote:
> On Wed, 1 May 2024 21:29:16 -0400 Lars Kellogg-Stedman wrote:
> Do you know how to trigger this bug? Could you share the POC?

[I've trimmed the Cc: list a bit]

Yes, triggering this issue is trivial. As far as I can tell, it happens
for *any* incoming connection.  I use a script [1] to up a simple test
environment on a clean system like this:

    bash setup-ax25.sh node0

This will configure a pair of axudp interfaces (one for `node0-0` and
one for `node-1`), and configure ax25d to listen on both interfaces.
Then just establish a connection:

    axcall -r udp0 node0-1

This will immediately trigger the problem, and subsequently the system
will be unable to reboot because of the "waiting for <device> to become
free" issue.

You can see from the traces I posted in a previous email that the
problem is pretty clear -- we never call netdev_hold when accepting a
new connection, but we *do* call netdev_put in ax25_release, leading to
the problem.

[1]: https://github.com/larsks/ax25-debugging/blob/main/scripts/setup-ax25.sh

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

