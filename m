Return-Path: <linux-hams+bounces-594-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D18AAB37AC0
	for <lists+linux-hams@lfdr.de>; Wed, 27 Aug 2025 08:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F11F41B6184A
	for <lists+linux-hams@lfdr.de>; Wed, 27 Aug 2025 06:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6702EA746;
	Wed, 27 Aug 2025 06:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4V/ILMsd"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD07275AED
	for <linux-hams@vger.kernel.org>; Wed, 27 Aug 2025 06:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756277312; cv=none; b=OuXfLJchrQLHcdGIIuU289F1PDY0JaRaXrC7Mr9YsXYkJ7qQJ6l7t33VJ0ZRVO6qgBkSerjpayOYpyyELaMuyPdBLSEOxgKKcpiV/zTEPkTW4uDmsCbiam1wlCp7wpFUtZwbk3cOs10Krqzz4iZYRoNea1TdK+oWNZp2cUECCRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756277312; c=relaxed/simple;
	bh=KDIIDbtUUSONkUIsWg5HrwwmQCERUmjTq7MXv9xCvq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CL+BapnOXTl/z9vc5SQeuQhJf9oE22nV9p5FZiVUHRZk1FNOpb4I+MJCNiEpDIJSWYgxJdtbsn3vpAB/iEhPUfNxuUAjWsUxr0PmiA+A/tIzzGfxI1r+Otwr8cfg0Jtv9lQbTm/KkPI3ouImo8VCHJ+RukI7+6UiJ6Px4eLkI38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4V/ILMsd; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b4c21867cceso2431454a12.1
        for <linux-hams@vger.kernel.org>; Tue, 26 Aug 2025 23:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756277310; x=1756882110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDIIDbtUUSONkUIsWg5HrwwmQCERUmjTq7MXv9xCvq8=;
        b=4V/ILMsd8iFrfS/6nzfSK0Z6D54+8vAGfMxK1glwcFE8NIcudsri9Qd2JLJzRCjwwb
         bYB7wOffhR2Ogge+vO8kETo97cxZZi0iF0fJF6yC0U0sVR0l7QblsXuRdPcNqV8Vk591
         M0MmxoPgfHO4JcYMuuw8QI/f/1b/LvZjsTn4SMF9YzBjcS95SJWc9qdYTGHlAGwn2v/j
         TzcJCCG7CeJdhtd4weYJ1kNYIMDAQ3pCg9vlEPVtJieXGcP/qyTkEA5u0oyc+SJS4VBw
         tv3RUqJTkq+5WdUZEC5EkHBM4VG0YCSMcAOjoMwLsAKVMkZxLOisPfhw6k/uy/H3qqg4
         JNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756277310; x=1756882110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDIIDbtUUSONkUIsWg5HrwwmQCERUmjTq7MXv9xCvq8=;
        b=FN0hsx6+g+9Y93KhIMSKSFihudqhRq/nijngKtpws/VoGyjlbD3qOZTCp3ytnINUcZ
         L7GOgV+jD2jlXywPc7u3Kq84CHDwLhfvWOj4Ab1ZYq7NmZcPloXv0IoX1MbL6m5adV2F
         Q9zxt24jJuFVEuxY/WXfIteRPib84UIUtje1h8rYbt6/Y2+TstqVr0HiiIUVohmnCFMn
         XS+76Os39mA9YgLJGLwNo3IQiNOsVt/Datm7NavcjznW7Hlznrzozz2Bu52KoBuL4CyX
         A3FtnXARt6fb48RsV+XsBzfR/cDrf3KQVxxPUT2QvVV9KRpWGli01OwJqrmfgUJ+0bcp
         29dw==
X-Gm-Message-State: AOJu0YwRGBC2TDGSAktxSLSc2HompZPuSHSYqTFjrO4g2cjf7sLh3ze/
	MywnhomTfpOaYGcc05IzBSK7kHBrXlsMNZUf5ntKj2nS8Xt+sqTwNFd/XWE6L0QBvB/VZ+ouVm3
	p54EYLXUrXUzGW8UmBMiw5Qy4YU/Io6N7a37U3q0G
X-Gm-Gg: ASbGnctHjZhMDVcYneOPgwJA83Pvj7sYvNpZeGWaD3BPrKjxCrjptiU0yQO59/jM+ZQ
	1kk0/ezlkWXfvZ2OG1Qdz1Hf74wkRF31n92K3kkX5kF0RSNkb8EGBvSMhJTA2mv06pu7anx6UjF
	jpm+zGyk0Rl9rJ7TC1VLmafOUrG9W94pmdbMfJheO38/cZinFTtrbtKy8Tz5aIueKa+oDLcGpHL
	+rqYzPWfOkS9u3lLxxW1qQb87OsgmpNW6GZ2vhavpyrdJ3AmJxDQMDZD69Y/bbDuV0+od6xsnkl
	G5+abL3c5s4uGg==
X-Google-Smtp-Source: AGHT+IGlKOPsL5HmiGB6ns14OEUdaHHHLVp3PKOpPKy5ph7E3HATr4YLd59x3SSmQWYPxrDN/z6Sf1MwNyBIM3fXdPQ=
X-Received: by 2002:a17:903:2ecd:b0:246:22e3:6a2a with SMTP id
 d9443c01a7336-2462ee1a616mr238109095ad.15.1756277309980; Tue, 26 Aug 2025
 23:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250823085857.47674-1-takamitz@amazon.co.jp> <20250823085857.47674-4-takamitz@amazon.co.jp>
In-Reply-To: <20250823085857.47674-4-takamitz@amazon.co.jp>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 26 Aug 2025 23:48:17 -0700
X-Gm-Features: Ac12FXyHytAfOhleRkCY940agxPKzR2y5s0bTYnTsYrXaqhUZs3xBCr0fcpPY0w
Message-ID: <CAAVpQUAtFWD0gsuY1zCodD=ZGY=-FQnG+=Qve8cQ1yKkVq3i8Q@mail.gmail.com>
Subject: Re: [PATCH v2 net 3/3] net: rose: include node references in
 rose_neigh refcount
To: Takamitsu Iwai <takamitz@amazon.co.jp>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kohei Enju <enjuk@amazon.com>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>, 
	syzbot+942297eecf7d2d61d1f1@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 23, 2025 at 2:01=E2=80=AFAM Takamitsu Iwai <takamitz@amazon.co.=
jp> wrote:
>
> Current implementation maintains two separate reference counting
> mechanisms: the 'count' field in struct rose_neigh tracks references from
> rose_node structures, while the 'use' field (now refcount_t) tracks
> references from rose_sock.
>
> This patch merges these two reference counting systems using 'use' field
> for proper reference management. Specifically, this patch adds incrementi=
ng
> and decrementing of rose_neigh->use when rose_neigh->count is incremented
> or decremented.
>
> This patch also modifies rose_rt_free(), rose_rt_device_down() and
> rose_clear_route() to properly release references to rose_neigh objects
> before freeing a rose_node through rose_remove_node().
>
> These changes ensure rose_neigh structures are properly freed only when
> all references, including those from rose_node structures, are released.
> As a result, this resolves a slab-use-after-free issue reported by Syzbot=
.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+942297eecf7d2d61d1f1@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D942297eecf7d2d61d1f1
> Signed-off-by: Takamitsu Iwai <takamitz@amazon.co.jp>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

