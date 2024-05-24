Return-Path: <linux-hams+bounces-325-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CAD8CE7D4
	for <lists+linux-hams@lfdr.de>; Fri, 24 May 2024 17:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CE091F21B67
	for <lists+linux-hams@lfdr.de>; Fri, 24 May 2024 15:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A4C12DDA1;
	Fri, 24 May 2024 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="sJwfGVh4"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp122.ord1d.emailsrvr.com (smtp122.ord1d.emailsrvr.com [184.106.54.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3335512D775
	for <linux-hams@vger.kernel.org>; Fri, 24 May 2024 15:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716564344; cv=none; b=qjIZdCevQQuUCinhxATUlNRtW7Pu55WelJxdNkpTudeKcjW/wPnhZjYqH1mk13C8YedW9QKEp2vqXyAhQnyfM5Tq//LpU9FFXXtWLphG3X2LSsA8r4QSIO2rfhtNZyy8aT2KXSTll1jn/P4xHce20MQ0oWJ10wRrfKw06uOoJgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716564344; c=relaxed/simple;
	bh=Xsk4ujdriBcfb4e3Nn2s9GgsHfVf9yVi74dz2Bks52U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ue49oWNUKwlfQeXQzUwUitzqZBql/Nt8XJENI03w3TdL7rkq/kTXlLhR1wDIt2c7cCep3XYAshCnt/A0nbYg62TecvBkV5OfuE1qQKwPv8TljaPHB7f/Yy8ThOcI3keG3iWkkAkE+3Zi8hyfAmmpJChtHu0NzRI6in68sRO5Bh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=sJwfGVh4; arc=none smtp.client-ip=184.106.54.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1716564336;
	bh=Xsk4ujdriBcfb4e3Nn2s9GgsHfVf9yVi74dz2Bks52U=;
	h=Date:From:To:Subject:From;
	b=sJwfGVh4XqCW4OU8dnxGzrtWTMVVQwBlvB8q77CJ+qo7DcYIssKyA03BUtVEraX2M
	 ct83/gMYt+OKB8ycvmda/v5SEdk6ot5mawzMXd4LeWyGa5lZ/PMiTh3Ro0dX9ucNwF
	 WRZP16eJ4AAt0puvHR0QC1qUPfPsIUE2iw5rTeUo=
X-Auth-ID: lars@oddbit.com
Received: by smtp8.relay.ord1d.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id 72F15C01D7;
	Fri, 24 May 2024 11:25:36 -0400 (EDT)
Date: Fri, 24 May 2024 11:25:36 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Dan Cross <crossd@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
	Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v4] ax25: Fix refcount imbalance on inbound connections
Message-ID: <wq52rxvjp64uk65rhoh245d5immjll7lat6f6lmjbrc2cru6ej@wnronkmoqbyr>
References: <20240522183133.729159-2-lars@oddbit.com>
 <8fe7e2fe-3b73-45aa-b10c-23b592c6dd05@moroto.mountain>
 <CAEoi9W45jE_K6yDYdndYOTm375+r70gHuh3rWEtB729rUxNUWA@mail.gmail.com>
 <61368681-64b5-43f7-9a6d-5e56b188a826@moroto.mountain>
 <CAEoi9W4vRzeASj=5XWqL-BrkD5wbh2XFGJcUXUiQcCr+7Ai3Lw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEoi9W4vRzeASj=5XWqL-BrkD5wbh2XFGJcUXUiQcCr+7Ai3Lw@mail.gmail.com>
X-Classification-ID: 55fa4c0d-612d-43b3-a37d-feb876ec7ed3-1-1

On Thu, May 23, 2024 at 04:39:27PM GMT, Dan Cross wrote:
> On Thu, May 23, 2024 at 2:23 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > The problem is that accept() and ax25_release() are not mirrored pairs.

Right, but my in making this patch I wasn't thinking so much about
accept/ax25_release, which as you say are not necessarily a mirrored
pair...

> It seems clear that this will happen for sockets that have a ref on
> the device either via `bind` or via `accept`.

...but rather bind/accept, which *are*. The patch I've submitted gives
us equivalent behavior on the code paths for inbound and outbound
connections.

Without this change, the ax.25 subsystem is completely broken. Maybe we
can come up with a more correct fix down the road, or maybe we'll
refactor all the things, but I would prefer to return the subsystem to a
usable state while we figure that out.

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

