Return-Path: <linux-hams+bounces-593-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08758B37ABF
	for <lists+linux-hams@lfdr.de>; Wed, 27 Aug 2025 08:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A620E1620D6
	for <lists+linux-hams@lfdr.de>; Wed, 27 Aug 2025 06:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A3E2E1757;
	Wed, 27 Aug 2025 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vSwaYiQH"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0766275AED
	for <linux-hams@vger.kernel.org>; Wed, 27 Aug 2025 06:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756277285; cv=none; b=lRO601XTqYkyrGhOwpu/6IJ2prYP/+2bpRJ05mXzzABfuCt7/2cGZWbTLvtP0o2xSZ18l8NowPRU7Mu0UiRmUGWulrZCodUsqldh2r2HIB0K0cAFS1QBhnaeEYsMzJexlFdjkIYZo+lpnNoTO0BJK1x+rAyaXWwDNs0gA3sLz+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756277285; c=relaxed/simple;
	bh=TNLR1UwgZ9zZ2aYedKNHrYcjRTY3Nev2evOuNBDYGr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLyZ/gmmohhQLNfwtappnxo4yvUuHwWZe4NnsfFMgoM0vp9gCZRoECenGGz7kfbGTWFwwD3ynmlFBTg/ClUZZPzpWjrj4FCalnvG0G74RZ2PLBZpfg1Mph7eJiTwabzNJjqWsbBztNqpO1PL41Q0P7/rQWUkzefyxcc8e6o1CrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vSwaYiQH; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-24456ce0b96so7309115ad.0
        for <linux-hams@vger.kernel.org>; Tue, 26 Aug 2025 23:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756277283; x=1756882083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNLR1UwgZ9zZ2aYedKNHrYcjRTY3Nev2evOuNBDYGr8=;
        b=vSwaYiQHlE1mO9Y20Gqw9FnEt+Sy1875ty4HTBMFe3xoMEbVSn/wztMWfvS4Yd/toF
         UarI9+pBqJPJ+8jnicgjY4middk1tSh+SAXzn7baauo/lSP9JIDIU9GweuUJ6Kkvkkx5
         urZNq8qBXv3WFaU5o1bo03y4WYsretvsVoqFlOn9BUpe3+G6JdST5UEwtvarR3WWd8Tl
         88lmT3qwXceITQfIBlROKF1XYN8TDzHi6Qgri15z1SONgvff1mqGi39mnChT+XmcAbSJ
         dX6Ht9AWpiQoue3DfO0OvdbAyK+8fYgJk1EMcs3EUoiAcw/bWOEv0KBDyuQWfqdc2BsU
         Yjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756277283; x=1756882083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNLR1UwgZ9zZ2aYedKNHrYcjRTY3Nev2evOuNBDYGr8=;
        b=kbgRG36XhLAMuZJA5Dzkfdmn5WfnLyPJ4DPmxPeE/Ra3z2AJWTVmqa1B9HcdlK6wsQ
         qrY21bwsTa6Q4WoGxcP+h/hIPEeNjMaPdwf7MePhpS9HGoX39nwoUfDRkvqyeZKbuUZY
         uvsFc72Qsxmzi+R0UIN5xe7wcnms2CrW2aBfBRvuZhfiywmliANKUPsAPvr5NXphy+q6
         Pr3+LIqxC3cmdWQNtPD7qmvIhZQkqg9SE1FqEpIU0vqGZ5ZdPSzHDx2xbCAOrswk0HrE
         TlmTyd3jMDaKZZ2rgXiZ9IzD4U7PKJf45Z4Px3kOEZiQnTvlSuR8WrDUTN8UOJNvsX1g
         P0DQ==
X-Gm-Message-State: AOJu0YxNWxqC7lM5H50T9jZypFQp26pJ4b2sVhpFWdD+8baqPXU7xqxY
	RruFW5/13q/Ch9s1D1SfJWB8aGjoey2y+VZ+nWHwSMMcPQ+tmrFCqyJ3E753iajp0MHd/x1QuqR
	2Ho3/udWbbK0mylE9bylqLGcsmuZFr5eNYDc2N9ZH
X-Gm-Gg: ASbGnctEndltIHuuJNij6/tTzK4IZKSgaUHZanyAAUhFINFzkR3P4/5A3jcSpWkrV/a
	ETxErtIgTt3oP0s23v/422fAhulY+Q1Jv+5Yfi7G3mHHuBFmOpS8m+jeuQ4yfh7oLbQvU5w+DwN
	s+Z3FIpoRMFMV/UB1mPHJUYjb6LAHNUKeNcr9yXPHV9tY5ctjhdxRfRa9ADnoco3g/C65/QVCGJ
	yXWEJw9omu+i03iBIdp+zOkfHpDHwmMAsLmjtJlcR+O+4BmDtK3H2fITG6yZ0Y8SYT/b/Exoeq+
	O9wtsm1iH/mBKw==
X-Google-Smtp-Source: AGHT+IGjFafqOYf9+cCklsM5gzmxNHkLV8I4T6yawhjbD6jh1HYN3Ub47zpb/sh3aycQqpO7kpYW4nWdVmWVBeWYQaQ=
X-Received: by 2002:a17:903:1a6f:b0:246:ecce:544 with SMTP id
 d9443c01a7336-248753a2642mr57116535ad.12.1756277282374; Tue, 26 Aug 2025
 23:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250823085857.47674-1-takamitz@amazon.co.jp> <20250823085857.47674-3-takamitz@amazon.co.jp>
In-Reply-To: <20250823085857.47674-3-takamitz@amazon.co.jp>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 26 Aug 2025 23:47:51 -0700
X-Gm-Features: Ac12FXxnK3iILmw9b5MTakhawEP4I3D_OlE5LCy1ARWUBLMb5CfJbzFCcMS4_YE
Message-ID: <CAAVpQUCAPchBjAr3_S03ieKHvGBQmW+c2g7+QyeSCSEEvxW8XQ@mail.gmail.com>
Subject: Re: [PATCH v2 net 2/3] net: rose: convert 'use' field to refcount_t
To: Takamitsu Iwai <takamitz@amazon.co.jp>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kohei Enju <enjuk@amazon.com>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 23, 2025 at 2:01=E2=80=AFAM Takamitsu Iwai <takamitz@amazon.co.=
jp> wrote:
>
> The 'use' field in struct rose_neigh is used as a reference counter but
> lacks atomicity. This can lead to race conditions where a rose_neigh
> structure is freed while still being referenced by other code paths.
>
> For example, when rose_neigh->use becomes zero during an ioctl operation
> via rose_rt_ioctl(), the structure may be removed while its timer is
> still active, potentially causing use-after-free issues.
>
> This patch changes the type of 'use' from unsigned short to refcount_t an=
d
> updates all code paths to use rose_neigh_hold() and rose_neigh_put() whic=
h
> operate reference counts atomically.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Takamitsu Iwai <takamitz@amazon.co.jp>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

