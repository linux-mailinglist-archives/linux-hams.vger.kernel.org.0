Return-Path: <linux-hams+bounces-619-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C02B41AF4
	for <lists+linux-hams@lfdr.de>; Wed,  3 Sep 2025 12:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53A6C56611E
	for <lists+linux-hams@lfdr.de>; Wed,  3 Sep 2025 10:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA1E2D2382;
	Wed,  3 Sep 2025 10:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iZtT1Kai"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5AA23D7DF
	for <linux-hams@vger.kernel.org>; Wed,  3 Sep 2025 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893729; cv=none; b=njSo7f9QgoT2gqkuMflPCS9IJLPKoSkD15+Gogv2ctOaR2yPKpTPyxRKf9QmrJhM333pt9w1uP8qZCX4V0YGGvEk1Ptk7iwYohofXzwNQ7GnbyL55w1yPQqdUzkFXi94b1bN6YHDfk0K8GCDzQB1bk1UAmBL7ik3LabpUcNcMCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893729; c=relaxed/simple;
	bh=uG+IUAFocjY0ferxW0QE1UIG+WKT3oBRbkzbzKGK3hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKMUadbXoKr/71R1ERqqj3UTdAnKMG++VDI1CFUePhAAJBjj5oRVINzD1odylylu5ug+FqHF/dFGh8Hj8YD6w8SE1UGkqQEN8p614V8tAbJNrd7G2kY3UzB/uJuwdnT1UO1XOmrsHijwFFrlXFc4hokTz455Asi4LCn8fm90u6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iZtT1Kai; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4b338d7a540so32090011cf.1
        for <linux-hams@vger.kernel.org>; Wed, 03 Sep 2025 03:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756893726; x=1757498526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PdZ82/MZBQGEEJuXtN7htuB7hxcJ2bbzGdrPDDwIfc4=;
        b=iZtT1KaitOM1Jx0RSkEj24gllZS0DSwaOsa2yQwxhwjoZZ089VjQ2whzL1ezlh4770
         UT6Y7Wfm1N9MF19IR3d75yLm7ogLfN6ANKhswYXLPULFWnF+RSSJ6JWZ3NevUiVnKqWn
         Ecd+PEpf9J1e7Dz2XtlCdihC6rmS60THDbTf7XYdgDPne5bEuzthxGq6SFwY91zWN2wn
         0Hy0HYK3qjwJeTNeF/oIxEqrTAPtAJeWSf+86BFAWEPz0gad7jjItGn51eYwZVfPBg8v
         RI63dWHQ5PwAjQirSFfj5aFWsdrr71fWDknFKw6mVz2clld6cC9szF6xf3LdJFH8Rzz4
         DgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756893726; x=1757498526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PdZ82/MZBQGEEJuXtN7htuB7hxcJ2bbzGdrPDDwIfc4=;
        b=MBdreC9LFLkJ++I7LYquu370Urmu2iKNMY4WN9pw8DWdOPB1O8OlXEWEB6GxsyccU6
         AV45pLPsXInwCWOPEat6UXFI+F/+A6tysj24G9dlpLIAzbTzVSTF5KRCR130xkWek/HT
         BVWpqOJ/s4sUAtL4kBqMubVrWHRgKFHbEs7Rp6X+FrCsI58b8uovso9d4fxsi5HrWBNk
         ykz+o/g1sT0JXXjPK11+2xeXJj+zOhzCS51iomQSLyRw0t1Tw4mjcF2Evpe6SPJXJ58U
         o/kojrL62DbQgtctlQ6Nho4qglzGsRgGF4iQlssZqSEZaqam5k4jOkDKQnv5pWX3fZjw
         2pRw==
X-Gm-Message-State: AOJu0YxYE9JDYQjLZhvLGN8briQzvfBCiBEknwykNkkyAenYBcCSHXuc
	1HwuOjiR1si1KZq+Rfq3jhQNS6w8T1xU/swglWroWW/o0nVtoeJ0X+IMHolCGuvzL9EVnNEfNLO
	iASJ1XNRxG5n8gZyUp4/1hd1GUaeH+W3n2lRfIJM2
X-Gm-Gg: ASbGncuwCkor3SuSF1JqULG0lxwdCI6GbQSJL7Cl0L0uoa3Ml0vwrmK520vESsU2VuW
	4UFsAq0pNeFWG5MmCcF1Mz723HX/P2SkiYb1VvujRrK5syIo8BV+jo6K8KQLsoj+VsFQDk1S/yv
	j3KMl4r9gZja/jrVIUjcE9OKLUPxQwIjjXn7OteGRQXwtEXsGk1mejevT4s4kscvjNQ7sOkR+QN
	TPH/73jLK9XQEp0woeI9y0Q
X-Google-Smtp-Source: AGHT+IE96tVDfOMzHb3rTORLqR2kclX9pG/b2GeGdgfjbPLiAuRxi1B/OBPlD8BdlGywrG7cVhIMfiiwU0KYtntSJNY=
X-Received: by 2002:a05:622a:244a:b0:4b3:4320:e1bf with SMTP id
 d75a77b69052e-4b34320e7edmr87322891cf.33.1756893725981; Wed, 03 Sep 2025
 03:02:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <11212ddf-bf32-4b11-afee-e234cdee5938@free.fr> <4e4c9952-e445-41af-8942-e2f1c24a0586@free.fr>
 <90efee88-b9dc-4f87-86f2-6ab60701c39f@free.fr> <6c525868-3e72-4baf-8df4-a1e5982ef783@free.fr>
 <d073ac34a39c02287be6d67622229a1e@vanheusden.com> <6a5cf9cf-9984-4e1b-882f-b9b427d3c096@free.fr>
 <aKxZy7XVRhYiHu7c@stanley.mountain> <0c694353-2904-40c2-bf65-181fe4841ea0@free.fr>
 <CANn89iJ6QYYXhzuF1Z3nUP=7+u_-GhKmCbBb4yr15q-it4rrUA@mail.gmail.com>
 <4542b595-2398-4219-b643-4eda70a487f3@free.fr> <aK9AuSkhr37VnRQS@strlen.de>
 <eb979954-b43c-4e3d-8830-10ac0952e606@free.fr> <1713f383-c538-4918-bc64-13b3288cd542@free.fr>
 <CANn89i+Me3hgy05EK8sSCNkH1Wj5f49rv_UvgFNuFwPf4otu7w@mail.gmail.com>
 <CANn89iLi=ObSPAg69uSPRS+pNwGw9jVSQJfT34ZAp3KtSrx2Gg@mail.gmail.com>
 <cd0461e0-8136-4f90-df7b-64f1e43e78d4@trinnet.net> <80dad7a3-3ca1-4f63-9009-ef5ac9186612@free.fr>
 <CANn89iJGdn2J-UwK9ux+m9r8mRhAND_t2kU6mLCs=RszBhCyRA@mail.gmail.com> <938ad48d-a4a3-4729-a46d-4473e190f1a1@free.fr>
In-Reply-To: <938ad48d-a4a3-4729-a46d-4473e190f1a1@free.fr>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 3 Sep 2025 03:01:54 -0700
X-Gm-Features: Ac12FXzLL8m922YFRsZVPobRIu52bY9OqCqqrAh-B95wqQY7JasuKjODHZ9HNec
Message-ID: <CANn89i+BBuYYk1n=4HvEiZS6YhMwjdntt=psvAEAzXwcU-VKkQ@mail.gmail.com>
Subject: Re: [BUG] [ROSE] slab-use-after-free in lock_timer_base
To: Bernard Pidoux <bernard.pidoux@free.fr>, Takamitsu Iwai <takamitz@amazon.co.jp>
Cc: linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 2:51=E2=80=AFAM Bernard Pidoux <bernard.pidoux@free.=
fr> wrote:
>
> On 6.16.4 kernel patched with last ROSE commit for refcount use
> rose_remove_node() is causing refcount_t: underflow; use-after-free
>
> List:       linux-stable-commits
> Subject:    Patch "net: rose: split remove and free operations in
> rose_remove_neigh()" has been added to the 6.1
> From:       Sasha Levin <sashal () kernel ! org>
> Date:       2025-08-30 20:20:24
> Message-ID: 20250830202024.2485006-1-sashal () kernel ! org
>
> Bernard Pidoux
> F6BVP / AI7BG

Any particular reason you do not CC the author ?

CC Takamitsu Iwai <takamitz@amazon.co.jp>

BTW, a syzbot report was already sent to the list.

https://syzkaller.appspot.com/bug?extid=3D7287222a6d88bdb559a7

