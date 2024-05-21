Return-Path: <linux-hams+bounces-281-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B07738CA610
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 04:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF69E1C20D46
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 02:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE22717758;
	Tue, 21 May 2024 02:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mjc5Dh0Z"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE6C175AA
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 02:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716257564; cv=none; b=A6NFnkqxkSU+Yv7gywxwHjh5TRxuJjcNyixS5MPFNPLIAqXdxC9MQGfu6hRwDhAtWteSGYV6qD7TpzsaxukUWsRlQy25htalinpsFfaw/nd4FZBKwgPpgGEqfTUKa11yU1WQ4AHp/CPr7yLw8KokG8LZLwsjo/1KnNnizuFa9qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716257564; c=relaxed/simple;
	bh=7YU+dO9CADMPdsy4mhemvxvI5W/NZp9IiYsM0BN0V4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BpUmacykzV7ZzROpkBjbSKpKuGR328fycjsg0PfYAChWkvXpOtvG0oqbmlRtdB9SEdjBzK0jaOjhjqOPFUH9Jqe1cJXFCtAnoifoxT0iQbk1UZ/YNVvDq6TG6eBlACHBvy3gAoc2VCCMIngV9jZN+q7c0WulybBvgi0kTML0KRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mjc5Dh0Z; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51f0f6b613dso6250969e87.1
        for <linux-hams@vger.kernel.org>; Mon, 20 May 2024 19:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716257560; x=1716862360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zMUg+UUctSFpsbblj3OxNakLMYr82AE/XTqQdRnnYk=;
        b=Mjc5Dh0ZnaRmt5yVpJ9dgBs8aAibJxgEgLcJ0vA6BsDB27ias37oua1Qv/kL9Y8Fm6
         rWW4kgJQMyBNrFcDZPBQPtab8lKXSD8bgOWWZEiVRXBU5LZY69z2A7M545fJu3kgfYkj
         fKE38uT3Scz9gm8t937ior2WqGQ+7JZDU2NZhBTawY8B63ugyhRcfkfg5R+hZPV0giEA
         N8m+/92U8cRYh4vEwBuDN3jUNTrj37pQZUp0FU240oyvS8mEaUSSVkENwFXuqKU4yytn
         imXqgY8+QmgZ/Gyy+Q12gZoqGYuLb94FMjc0MMER2kQdsFoaytstwZsAxUNEkCKEngzE
         iFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716257560; x=1716862360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zMUg+UUctSFpsbblj3OxNakLMYr82AE/XTqQdRnnYk=;
        b=mnLqxt9Hzo4W9w1u0Raa/MBbSAYclD7ws2KMnePZcvpLd8cxtYcqcgSgFoEEwIDVB4
         rXLKn2kwX4M7nXtpEggjK7IxtgsGo6AqICNjifXP0bumjI5c4KaHNYf13ZfwLdh4dcQ7
         fcizSPXBY8tW/pclHBxwpdCW1D7hV2GQ6AGR8WCJqWmFa+CrzGZf1+AKG94SIj2jIu6n
         JMA7eh/3oGnvL2h8CCiBSVYSUzItE0tEShtGbxBPXg0jSFJW45MLTC8nISQJwiSi/6LL
         0xuL+lulc+LsCaQWFaVOYx9EKU75sdl2BdkIsAO+S3S5wDktSwMCx1gfma2iViDt4Y1j
         Kt/w==
X-Forwarded-Encrypted: i=1; AJvYcCVN7GaVHg7fGpm6saRXd74r5PtJCKg3EsShmZGitl84scfPY74sTcacIxzCzIN8gi2ddyqzkJxGhk6zoJeOcnY1SR+ufL97+VbLVQ==
X-Gm-Message-State: AOJu0YxzgYcbbjYQKX3eRUy/tIe98inOM5gOF2wTYJQLJi0xYQlM+xr+
	st88kOs+vmGf+NNFZeBX7G3hFc/J7aA5tVzGA/S5ug0fPjv2hJNPMRJYMLDjzkuKfaY6UxI3jIw
	GQmIikLxxv0fNlaLzpHZSr0XViVo=
X-Google-Smtp-Source: AGHT+IEdCzFuXc/ES0F8681H0PgLpehx9+M5DSJYUTuhhUbS01UKjIbt8Rey7unN8z1AXXNd441VwcYsl6Ghr6MjYms=
X-Received: by 2002:a05:651c:14f:b0:2df:eee9:c71f with SMTP id
 38308e7fff4ca-2e51fc36881mr186399311fa.7.1716257559690; Mon, 20 May 2024
 19:12:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501060218.32898-1-duoming@zju.edu.cn> <my4l7ljo35dnwxl33maqhyvw7666dmuwtduwtyhnzdlb6bbf5m@5sbp4tvg246f>
 <ac6f090.eaff.18f7baadb40.Coremail.duoming@zju.edu.cn> <y5pcz6v6wsn2vjlyyzyclnktfgo2yiwawcdu5jbzpava74y6yr@t7m6req4cwsq>
 <CANnsUMHTZ_P4-C2iGdbakcp_Xk5c-aCO5kYEvaBdOcsaSnK5Pg@mail.gmail.com>
 <4it3k7z5sylbv4agiztmwdhaudo2orccpm5pbi24bsu6fyajfm@k3zulkrpqaof>
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com> <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
In-Reply-To: <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f>
From: Dan Cross <crossd@gmail.com>
Date: Mon, 20 May 2024 22:12:03 -0400
Message-ID: <CAEoi9W7LN5MQPGKXZJOdtcaXvyK4PPU9yW7HWOBdq1AP3Fs7nA@mail.gmail.com>
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: Chris Maness <christopher.maness@gmail.com>, Duoming Zhou <duoming@zju.edu.cn>, 
	linux-hams@vger.kernel.org, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2024 at 9:06=E2=80=AFPM Lars Kellogg-Stedman <lars@oddbit.c=
om> wrote:
> On Mon, May 20, 2024 at 05:11:39PM GMT, Chris Maness wrote:
> > Your patch seems to have fixed the issue so far.
>
> That's great! I'm glad it helped.
>
> > How come this patch is not included in the mainline source?
>
> Well, partly because you're the first person to confirm that it works
> for someone besides me :). Dan (Cross) has offered to test it out as
> well; if I can get a couple of confirmations that it's working, I'll
> probably go ahead and submit it to netdev.

I am running this as of today, and so far so good.

> The bigger issue has been that there are very few people interested in
> the ax.25 support in the kernel; there's not a real maintainer, so it's
> difficult to get code approved. There were some concerns expressed that
> maybe this isn't the *correct* fix, but I would argue that even if it's
> not the most correct fix we should try to get it in anyway, since
> otherwise ax.25 is completely broken.

Agreed: what's there now is objectively broken. Please, let's not let
the perfect be the enemy of the good here.

        - Dan C.

