Return-Path: <linux-hams+bounces-331-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A718CF997
	for <lists+linux-hams@lfdr.de>; Mon, 27 May 2024 08:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 134851C20A54
	for <lists+linux-hams@lfdr.de>; Mon, 27 May 2024 06:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F0F1773D;
	Mon, 27 May 2024 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RLbZek/c"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D6717552
	for <linux-hams@vger.kernel.org>; Mon, 27 May 2024 06:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716792877; cv=none; b=a+ZkzDToK2nwquEKjakbIz4GdyV+iDKl1ux3eWnEs+kJhWmVB8pEZNt/xmh8A7ptWj2qaIkR7P63o+3sGBUFvb8FDT+/LYcQ4ELXUap36m4rsOaNQ3UH4s/I8MIaIVm7gobQqpLxUHu7WQapZlHMOdrmXBn+lZD+qhwOkhJXiS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716792877; c=relaxed/simple;
	bh=VxHJoZiMyiwyBnB4POPE8lVlZPk3+ZIY2GY2crpQntU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxnqE5sNUzwzdt9MXALzId1/K1GO64bOFKf/jyJOZJ/SLdSv6xyJwuiOfceHVBDhRYHM2suUEt3xHKUXU/qs4Mb2aHBMxyGhBlkho+l6l6ZHE3pg9QS0rQwuq1CG/00lVLMgzy0Ajh+uydvIAYnBnmmzilrnilmtmlVa4huJ0aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RLbZek/c; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6269ad7db2so328215866b.2
        for <linux-hams@vger.kernel.org>; Sun, 26 May 2024 23:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716792874; x=1717397674; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xJhnA91EUm5BFx+9yq9C+Lu2TPfoMDMXEdKU5H9UO2o=;
        b=RLbZek/c2zGnkM+jYzPGk3FGp7TKV/ZMB73YY1iJZzSz95fTgK/77IXXVq5Tz97Mnv
         W5R06MUHP0t048xCpKj62VRkZx6VlUXmTTI/8KXSo/3N/VOhets+djceu0BUR02xzyGk
         sKCzl5PvzOPTjND01N7Yr/wjxJx1yUHIsAptc2R4l8+6TwburLpClY7LOaSs6uBDa6hb
         gJsk8gRRTnxjFYgmeIwwppvHjLRPZmWEcyYZJx8jl2gjkJjq6/FmO04BvhKst+C/jT4r
         XudUdMOUxEx166lTGebujGunxW8JFIwpzHTWgdN3FSRbH+BNru9/BfA3U9pnypSg2mG3
         Q9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716792874; x=1717397674;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJhnA91EUm5BFx+9yq9C+Lu2TPfoMDMXEdKU5H9UO2o=;
        b=W2ohw+iVPmGc+KA+zcOVQEnS1QeHMQ32LNBTzHv9eJQWhZRuGCmeMZ0heMffrjRVO3
         5Ku7J3KbEAN1ShZ5sbA/sJTEZmKgpuhifQrs2CeV3JHRZQHuhm+QB5cLRO0g43BX0f7b
         vHwWHOLWGgSJlbos+tcTKQmj98qvDVjDVa5BgkGBCFAfsf2eNTKVMYTmArzMos+9lPfp
         7FddEm1Qk55yr2XrW2XkuXQoF/fp0cUgAsamINyC/MLa0CFhzjG2huo31rswByY30Olg
         H2jSsuSAzd0tAqkmVxUUGrn/zs1tTRo1kgAhIkvI5YR+V+waPT2LvFVndNmM2wiynm7A
         lZng==
X-Forwarded-Encrypted: i=1; AJvYcCUli5D6+etl7JwTHwgQOXBrTpCfYIx6RI/xT+gZ0NfMrQmMhhIttglTj5Y5L9ZmWGh3ijBerruNeoGJJCLbPDA3OrASHCwLVJPBwg==
X-Gm-Message-State: AOJu0YxtkhGN2JCgv0CA1IS0K8YlnYu+f/tnI1A+cAQYcf5NcegNfGtc
	18Ns0MFQiNq19OGJAlEoEO6PApUNRWcAR7FWbC7GNhorDmL60uxE8uaKBpZDkzk=
X-Google-Smtp-Source: AGHT+IGwnbX5/LwOoj3Mf+bHr8I4wAPehdrVU/zqT47csOl10bXj2Mk9PcRUdqCYDH4CYWuW/oEdKw==
X-Received: by 2002:a17:906:280a:b0:a59:dd90:baeb with SMTP id a640c23a62f3a-a6264f0ef79mr616057366b.48.1716792873515;
        Sun, 26 May 2024 23:54:33 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc4fec8sm462527266b.99.2024.05.26.23.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 23:54:32 -0700 (PDT)
Date: Mon, 27 May 2024 09:54:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: Dan Cross <crossd@gmail.com>, Duoming Zhou <duoming@zju.edu.cn>,
	linux-hams@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v4] ax25: Fix refcount imbalance on inbound connections
Message-ID: <582ff355-683b-4451-9443-d5adca154fa0@moroto.mountain>
References: <20240522183133.729159-2-lars@oddbit.com>
 <8fe7e2fe-3b73-45aa-b10c-23b592c6dd05@moroto.mountain>
 <CAEoi9W45jE_K6yDYdndYOTm375+r70gHuh3rWEtB729rUxNUWA@mail.gmail.com>
 <61368681-64b5-43f7-9a6d-5e56b188a826@moroto.mountain>
 <CAEoi9W4vRzeASj=5XWqL-BrkD5wbh2XFGJcUXUiQcCr+7Ai3Lw@mail.gmail.com>
 <wq52rxvjp64uk65rhoh245d5immjll7lat6f6lmjbrc2cru6ej@wnronkmoqbyr>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wq52rxvjp64uk65rhoh245d5immjll7lat6f6lmjbrc2cru6ej@wnronkmoqbyr>

On Fri, May 24, 2024 at 11:25:36AM -0400, Lars Kellogg-Stedman wrote:
> On Thu, May 23, 2024 at 04:39:27PM GMT, Dan Cross wrote:
> > On Thu, May 23, 2024 at 2:23 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > > The problem is that accept() and ax25_release() are not mirrored pairs.
> 
> Right, but my in making this patch I wasn't thinking so much about
> accept/ax25_release, which as you say are not necessarily a mirrored
> pair...
> 
> > It seems clear that this will happen for sockets that have a ref on
> > the device either via `bind` or via `accept`.
> 
> ...but rather bind/accept, which *are*. The patch I've submitted gives
> us equivalent behavior on the code paths for inbound and outbound
> connections.

This is the explanation I was looking for.  Sorry, I meant to review
these patches again over the weekend but I got caught up in other things.
Give me until tomorrow to review it again.

regards,
dan carpenter


