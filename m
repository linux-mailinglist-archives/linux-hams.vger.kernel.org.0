Return-Path: <linux-hams+bounces-210-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E936D8BB891
	for <lists+linux-hams@lfdr.de>; Sat,  4 May 2024 01:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26A1F1C229E4
	for <lists+linux-hams@lfdr.de>; Fri,  3 May 2024 23:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB5D83A0D;
	Fri,  3 May 2024 23:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b="F2DLZfUB"
X-Original-To: linux-hams@vger.kernel.org
Received: from smtp101.iad3b.emailsrvr.com (smtp101.iad3b.emailsrvr.com [146.20.161.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68BD2E65B
	for <linux-hams@vger.kernel.org>; Fri,  3 May 2024 23:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714780789; cv=none; b=E6G/vdIc4iJ18IWOn2zpBJ51nGIrDU+76nM5/5fw7Ng85iHZK35UiI9QLWceHLa+OcSrvZCb1L3tMZSBtrqQdqj7Ki5ho1/FWg4B3GD4y3kLOv265FU8clxmEtkflEsVhD7Yuo8GnW5fWYsREQqX0cdyHQ+YgIdY0Vzs3hwcVB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714780789; c=relaxed/simple;
	bh=sEjZ83Sw1Dl1XxIKn2KeQPWM4I5AmiVyc4bGvGyYSiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxcH5dXJic7r6MJoDjGImLNVpwU+8svkZ/E8ZbI287Y2APZbPG7p4R7miJPU+sXJEaIoMX9o7pMblyhrv5jp2XM7b4XcLhRRhGFP1NwsJ5i9gizk31fCTgbj2dPPWXWFQo2Hxy8/i1zAXPtnTuafqxTXs1QT/NvJ0eRQ9SszJ1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com; spf=pass smtp.mailfrom=oddbit.com; dkim=pass (1024-bit key) header.d=oddbit.com header.i=@oddbit.com header.b=F2DLZfUB; arc=none smtp.client-ip=146.20.161.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oddbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oddbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oddbit.com;
	s=20180920-g2b7aziw; t=1714779633;
	bh=sEjZ83Sw1Dl1XxIKn2KeQPWM4I5AmiVyc4bGvGyYSiY=;
	h=Date:From:To:Subject:From;
	b=F2DLZfUBhQ3QPw4CMlMcCre1KISmfn2mRJBTkSTCQveEH9SLP/50vpjpGdc6vn5vF
	 pKS2H+SuKkBZZASLVkXqTPUlzkCAw1ce+Ffpt4OMkcP6u34+0P89j3riGjoceeRjiM
	 ElHe5zEs6MrrXXM4dd0OEqjhoge7O0Y80hbA1fjA=
X-Auth-ID: lars@oddbit.com
Received: by smtp13.relay.iad3b.emailsrvr.com (Authenticated sender: lars-AT-oddbit.com) with ESMTPSA id F10F1602B0;
	Fri,  3 May 2024 19:40:32 -0400 (EDT)
Date: Fri, 3 May 2024 19:40:32 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org, 
	edumazet@google.com, davem@davemloft.net, jreuter@yaina.de
Subject: Re: [PATCH net] ax25: Fix refcount leak issues of ax25_dev
Message-ID: <ekgwuycs3hioz6vve57e6z7igovpls6s644rvdxpxqqr7v7is6@u5lqegkuwcex>
References: <20240501060218.32898-1-duoming@zju.edu.cn>
 <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <78ae8aa0-eac5-4ade-8e85-0479a22e98a3@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78ae8aa0-eac5-4ade-8e85-0479a22e98a3@moroto.mountain>
X-Classification-ID: ab5b3add-fbf9-4fe3-adb7-2c2d96a83c57-1-1

On Fri, May 03, 2024 at 11:36:37PM +0300, Dan Carpenter wrote:
> Could you test this diff?

With that diff applied, there is no kernel panic, but I see the same
refcount errors that I saw before the latest series of patches from
Duoming:

  refcount_t: decrement hit 0; leaking memory.
  refcount_t: underflow; use-after-free.

-- 
Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
http://blog.oddbit.com/                | N1LKS

