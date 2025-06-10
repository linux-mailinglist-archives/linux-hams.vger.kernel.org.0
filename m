Return-Path: <linux-hams+bounces-525-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F70EAD3991
	for <lists+linux-hams@lfdr.de>; Tue, 10 Jun 2025 15:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0447318951ED
	for <lists+linux-hams@lfdr.de>; Tue, 10 Jun 2025 13:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B396629616D;
	Tue, 10 Jun 2025 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gg7gc6O6"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78F5246BC0;
	Tue, 10 Jun 2025 13:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562643; cv=none; b=j6VL+PunNSBBy7jjDoNtNKjmJ7FLMXBlLvlHo8ZU4zJz6dqHV6a9hTMk0Sc4lHFZ/R6Rjjy+VWaY8XG1PjC16kB5hyzIu/dG6FMUPUfdCCa2YVcOH9F9+guWqGIQew3BXzKxgDxeSTnbKR4AxTFtV2ijleIosBGBzOy8BSqxhBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562643; c=relaxed/simple;
	bh=oOWVuLO2T4RnSw7Vz1x2rYEpuImpONyqClwgxnMeXIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwtTcSszJhFfyFbtnc/88btBZ+CU7/SsULPyLw+e7F19McTPIG7in0pHdRDNqErLCHkpmQbURsQrHrtjOVMGK5l2HdCvi2k4zZBlvqhKBVUxM4An9JCebicntCp5FHofhqpCfY1j9aj05YUUzVKy21SYH+dtgjIRYjoIp0TWazc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gg7gc6O6; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70e6bddc30aso44381097b3.0;
        Tue, 10 Jun 2025 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749562641; x=1750167441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxIrKS/FqjNsM2xFokaxGJ/xqDLh5zv82FrSmAhAsqA=;
        b=gg7gc6O60ehL72MlXfAL1e+OE34CgQicKulsxHm0M7cftC9h1g89OU1A9lRluBbgzZ
         Xt+6HH6u2J/pmYxYqFuDXHQHYUuQvP7pG15Nd2qGE9Yt5G2rHjjigpxweKLDAVjKcu4D
         0dB0apRP7rKQvxOwI/6bzDD1oz4FHtNBMW0iJEFche/uz+Wq4le9bjikDQHsQsw0dysE
         uIztNU9y4AdSSxDSHbbYVI5D0u4DNm0DaJZoGeTsmv/W+ddbgeoLrWEddiVLJI3worbN
         UBrkYaZ2wrC1+Tahtcfx5xLxC81LvG/h+UchqQmCjVLUYZM0oUvD0mjVYak+gQ5Sk4dD
         zkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562641; x=1750167441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxIrKS/FqjNsM2xFokaxGJ/xqDLh5zv82FrSmAhAsqA=;
        b=wLIuUR1XVdG94ZibIY7mkEi9BwdGyPFK4A80l5v5xDYKZ03v4MxBEWG2rQ0ulZqqsT
         Vv42tyyA5dGGDpRZDyjHhoKW4Z50T4TEK9igpJtTDTP7dLi50YWvPsWBrhe56hmAsUwT
         Xkj/S2nCAgpW2arTwUx+iBzf3lwViDYvhgW1Q7WFjE4SKpfXsSl5+x14TLwACWJs5BNc
         2bU/786YVEuVdak2QyzFpTtBRkHvuTppe77cWpbWgV80/YGaLx7jRDiAy0aMu2MYsU8h
         ZX6CDnvUZEp3YWhMj8GbmbW+u6L3Ivc2UvMJ61OwVdp47n5bCtBDfNrXnmPVAt3ebfev
         iLFg==
X-Forwarded-Encrypted: i=1; AJvYcCUE9kkKii/bSLqeZ6/uun3Cx1yJQgq8dg+nayqnfF21CJZby8+KcJM0YuCPru0CVjPQmYRCfv0t2BcwCtIO@vger.kernel.org, AJvYcCV1QA19AQOC2v7gUIGR+D8OhbPOGkr53I3f1vFNmjPDpU7EBzkKAeDz51OzBSvbg522ELVGm36ApgYW@vger.kernel.org, AJvYcCVvAKK9ga+KzR7fwZDAdrvB7srlAhpjJ31EU+f01aDMarinvEr3hWTv6X/bTP7iBmgiOtF9274C@vger.kernel.org, AJvYcCWHaaDLCUk8LRxgIbt6+3P2dTQbYSJN0I4UF6H9uV7mKSukpGWffZU8l+SP/0Lu6LFbTdQ7PpOT@vger.kernel.org
X-Gm-Message-State: AOJu0YyWV4d8PKZq1QtX3DsET+AEgqc0LXKSGIZVXTA8DEbb51gICmOv
	SrZ4M7z20QBzJ1m3tjTJGOcko7jFrn6k9B8WaaPAci3nebXBhOtUu/hiLZG+qBx5/86YtMyMu73
	sAfKftum2u6DGoEqxcc8nCBlVfdA99mo=
X-Gm-Gg: ASbGncuzCfsy6C9qkbznRB1hUgypDOfEoO1XMsvWUy/ooeekPT9Eac9wXPLh9pidaB3
	OeL3QmXA+BJsPv3fKJjzSkJn1dxaa6JXC9sxre2AsY8IMnB3jvS6pLHp72CyCg5CtoPaYCHOGBq
	X/8LxqJbWbH7xMxEaAo7rex6OSugS7D2jO5QirgQgi3tJgydlbk0HWn0wHlgrDLIlTIf3iIKHdv
	WE6Xz7oH1LALJE=
X-Google-Smtp-Source: AGHT+IFM1XwmtOLu46/6hnB8HE+OYFSHJX6Sjmr/fbwlTVJpbAdiZS0DZi1jGEnlfK67xiMSjcPRgzR6HPYhzLNQ7ZQ=
X-Received: by 2002:a05:6902:98f:b0:e81:86ae:2c40 with SMTP id
 3f1490d57ef6-e81a213224cmr24404325276.19.1749562640474; Tue, 10 Jun 2025
 06:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605105449.12803-1-arefev@swemel.ru> <20250609155729.7922836d@kernel.org>
 <5f821879-6774-3dc2-e97d-e33b76513088@trinnet.net> <20250609162642.7cb49915@kernel.org>
 <4cfc85af-c13a-aa9c-a57c-bf4b6e0f2186@trinnet.net>
In-Reply-To: <4cfc85af-c13a-aa9c-a57c-bf4b6e0f2186@trinnet.net>
From: Dan Cross <crossd@gmail.com>
Date: Tue, 10 Jun 2025 09:36:44 -0400
X-Gm-Features: AX0GCFvn-7qD2cihhzkYj_5iK1X4T6iJ_-iI3ppeXU5PRwGVUbNgolRtiKDGC9E
Message-ID: <CAEoi9W57D-BfpYUAe5M3zjJvTUQUL4UUB+iWkpRO_o8JWfS7FQ@mail.gmail.com>
Subject: Re: [PATCH net] netrom: fix possible deadlock in nr_rt_device_down
To: David Ranch <linux-hams@trinnet.net>
Cc: Jakub Kicinski <kuba@kernel.org>, Denis Arefev <arefev@swemel.ru>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Nikita Marushkin <hfggklm@gmail.com>, Ilya Shchipletsov <rabbelkin@mail.ru>, Hongbo Li <lihongbo22@huawei.com>, 
	linux-hams@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org, 
	stable@vger.kernel.org, syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 7:31=E2=80=AFPM David Ranch <linux-hams@trinnet.net>=
 wrote:
> That's unclear to me but maybe someone else knowing the code better than
> myself can chime in.  I have to assume having these locks present
> are for a reason.

The suggestion was not to remove locking, but rather, to fold multiple
separate locks into one. That is, have a single lock that covers both
the neighbor list and the node list. Naturally, there would be more
contention around a single lock in contrast to multiple, more granular
locks. But given that NETROM has very low performance requirements,
and that the data that these locks protect doesn't change that often,
that's probably fine and would eliminate the possibility of deadlock
due to lock ordering issues.

        - Dan C.

> On 06/09/2025 04:26 PM, Jakub Kicinski wrote:
> > On Mon, 9 Jun 2025 16:16:32 -0700 David Ranch wrote:
> >> I'm not sure what you mean by "the only user of this code".  There are
> >> many people using the Linux AX.25 + NETROM stack but we unfortunately
> >> don't have a active kernel maintainer for this code today.
> >
> > Alright, sorry. Either way - these locks are not performance critical
> > for you, right?
> >
>

