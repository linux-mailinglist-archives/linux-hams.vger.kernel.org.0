Return-Path: <linux-hams+bounces-592-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4442B37A3D
	for <lists+linux-hams@lfdr.de>; Wed, 27 Aug 2025 08:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 561E0201BA7
	for <lists+linux-hams@lfdr.de>; Wed, 27 Aug 2025 06:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22832BE05B;
	Wed, 27 Aug 2025 06:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rnaPAuAU"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6B82857C7
	for <linux-hams@vger.kernel.org>; Wed, 27 Aug 2025 06:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756275723; cv=none; b=ZNNZSDARLhpnBlq3akB0NGayKaQNMTgVNV5l+F6pdBwR1RXZIZyqSiVahfCsUaESssFwr0OA3pl2a3I02gzeqMWwQST6F4yEEwJDj/KB00mAbMth6qYFKbU2jZjLutMjNndEylAtfiFtavRas+uc7eHpeAjGcXsAQmsP2U43d5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756275723; c=relaxed/simple;
	bh=qLTy5C2dGEjAw/4OL8eYtf366J2gpBTkVIFNNML1MGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M/QUaNXcNZp5q568Lz0DWKOUIuSQVOh821n+RiUVrQtafQdQ+Uox0ysF/arRHandHGyvBUwdB9K1xt/ilY+gyVe0KUO2i+FygKD1M6qHXu1CRx2aSE9tnIQ5OzkUiMN6Dwt+p3uP4Wb3mcQAL8SYP38CtNwHT5SZ7/K6U9Bzrs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rnaPAuAU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-248a638dbbeso997105ad.2
        for <linux-hams@vger.kernel.org>; Tue, 26 Aug 2025 23:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756275722; x=1756880522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLTy5C2dGEjAw/4OL8eYtf366J2gpBTkVIFNNML1MGM=;
        b=rnaPAuAUU7dG9EbtS8wLKDvdzUkCMryBoAUVjWpvkdvraK9lsEx83LBZ4DI/o/JCWI
         5r54Pf2JTFRxsltTsGW87mqqpxwUuplt07gabqk3ipsnzzPrr9spIRa84Blx8XMIg8Bm
         YMwRJfIMA2f+dRGhEJfZibvjIW8XoKCeyr26nxbKfjwWIMNGqzdg45OtqSg6l+W9m4RW
         78tYu12mPTkIhKnuEF2KaXWkEhrhkJO+GSEypWZ8AMHNhSX3oQNB2BnuVgRctPpG44tz
         PPD9AkT5dw9hI8iMxzwhpyDOPWYty0GvE08y2GC57yXewD/+ce6hu92WJva6GeKTBmM1
         kfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756275722; x=1756880522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLTy5C2dGEjAw/4OL8eYtf366J2gpBTkVIFNNML1MGM=;
        b=XlDKmkZN5M5KjKZoOFU03u4naRJCSwNGEsdWM0d7HboUSPFb2Ql9xUbx6Dl9SXa0ZO
         n5e1LXtb7yleqToopytdQQ73cMY4Ngvao/wiR3w7A2DrdJOQgRmQwkY1adaZuk7FZV7z
         2Jiwx6ol66QVU3l1fpSKe5IIQ90gilBZWS43ejPjjg9VrOrxlA+sECV/e8f9khIDEGEW
         ZVciI7+c0d1LdAWpd6wVEKw6Wzyjl5PIJAiVGIYYumNaancHxO5+bMT4Jh55IESnPO5E
         wCdGFF61b60OG/sYWaw2rP3zMhWmtZLyZ/KbcC+3C/UtHF+9iAja+idUd+9m+LQpxysT
         v08w==
X-Gm-Message-State: AOJu0YxVPTPAfA20Kg0tiBA5N/jkay/ZzIsb4J500ZZcY4R3ZF2kcmEX
	BV1XPvGTu1b6mSKYS2L1+kb8MWpWkwCRDxirUkIOP6guQ6DvIN9q6Q7G1tEoHNcCwr+2jboSNNs
	r3nz4/IRUndahaHC2+Ldp3c5eDz4Xm8VrJSLPOsKa
X-Gm-Gg: ASbGnctc/ZzoQEEpKDvZjVYBA9N3jTaSrBC5/LSF8gEwugkgqIynN32BnnXa7OO1G/E
	OcXWTHfYsYDO2jAhd97ZHa6IRNWwyChLmLXaIxI+Kb5YR2xE3zMcPUHODc2IJ0X61+W8RZUiuKa
	iQ1V19aoDq/hdbpXRJhx46aZMBRi2O4b+ikNfPINabdtlk80Y7LEM/qbinKkTIQNh9jIkDe8of7
	908Xe+tk3Aqag8wZ6Gc/2sxHH1poXgSpx4KoPA9CeUh5nj03KQEHc8x8bxtEUhgrHmw/Ywd6GZF
	w2c=
X-Google-Smtp-Source: AGHT+IF7jzGKwhBs3pL9OuYd7gtObX8p++nn1QWf6ESVamZva6AHRWA5C4h1KdRnHeraZ0FOsbdKT9twMzVlH+RX+Z4=
X-Received: by 2002:a17:902:dad1:b0:246:2eb1:9c09 with SMTP id
 d9443c01a7336-2462efad608mr216159465ad.52.1756275721423; Tue, 26 Aug 2025
 23:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250823085857.47674-1-takamitz@amazon.co.jp> <20250823085857.47674-2-takamitz@amazon.co.jp>
In-Reply-To: <20250823085857.47674-2-takamitz@amazon.co.jp>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 26 Aug 2025 23:21:50 -0700
X-Gm-Features: Ac12FXxGlXiuIICtDl2pUKJYc29VkTGFl6RVAVQ5m9yhCpp_rN0yUWRt5x0jzhQ
Message-ID: <CAAVpQUBhyRevCUqAjLYEFFqfDTZT42KHUEjRpARbNzn3V_cYbQ@mail.gmail.com>
Subject: Re: [PATCH v2 net 1/3] net: rose: split remove and free operations in rose_remove_neigh()
To: Takamitsu Iwai <takamitz@amazon.co.jp>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kohei Enju <enjuk@amazon.com>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 23, 2025 at 2:00=E2=80=AFAM Takamitsu Iwai <takamitz@amazon.co.=
jp> wrote:
>
> The current rose_remove_neigh() performs two distinct operations:
> 1. Removes rose_neigh from rose_neigh_list
> 2. Frees the rose_neigh structure
>
> Split these operations into separate functions to improve maintainability
> and prepare for upcoming refcount_t conversion. The timer cleanup remains
> in rose_remove_neigh() because free operations can be called from timer
> itself.
>
> This patch introduce rose_neigh_put() to handle the freeing of rose_neigh
> structures and modify rose_remove_neigh() to handle removal only.
>
> Signed-off-by: Takamitsu Iwai <takamitz@amazon.co.jp>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

