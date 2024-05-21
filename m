Return-Path: <linux-hams+bounces-280-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D27D68CA5E6
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 03:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CC391F2110E
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 01:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86631799D;
	Tue, 21 May 2024 01:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7SWhR/w"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163391798F
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 01:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716255524; cv=none; b=iPsOQvMa0wMFdwKDLan59SY5omXB+cdlci8bN+PUFhBMc5tAwqHu5HyNG3tXDtorq1OLNvd3SDgOKwYJwCNys2w/IzwEtOZJe5/v7kbQRjCebCXn9mg4xnZ2zNglaVXoiLjB8EeH2b0ixa1jromBxS4IuvZT+a3JImG29Ai06Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716255524; c=relaxed/simple;
	bh=7oiEi+GIzaJFhRDfp6UmLk8KDqvCIzNbosrgEnzoODw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwpVJS771bjP/P+Gp6gDj+/3kLl0Vc6kztFowB2US5ogh6N35PHVpwsY5ZI/iR2qjyWBKp0VUVMu131qWpyzi397DaDBzHw0K17GZqD9vUcRpVLO7Ri+l/WJyHSDY8xITv/FO6Ms5kzmiDsmwRZiRLl51P+kP3jOm8QQhbYqp+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7SWhR/w; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-deb99fa47c3so3270721276.2
        for <linux-hams@vger.kernel.org>; Mon, 20 May 2024 18:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716255522; x=1716860322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEsTExgQlIUHvQXYXYRFPucKqMnlxBBo3mU9WqzMY1Y=;
        b=T7SWhR/w58eM6XxNRi5hqKT4sV5VtkL2T2Sp+H/2OC0RkE3EK/TY349+7c2nL6i+rI
         JVpbcmLpmsUtacQOOh5K6l81ErfV4Ui5S1DQuBpQ88XioGK18iaXDlPwNbW7LMyPo2iK
         QsPiwpqeGACGpC3Kt6ShBiD+R+2txZg5MLVrwK77oRfpuRfwP7TP9LkpQwFIyUyT44Xv
         aNIs0krJLK5/d6IsZ81u2/f+A4MbCEeU2ciQNQRofh/IObEtukaj9bPt0ewV9R0jqDqa
         YQMqRoduYmKVQ5fj4+lU7J5HafeVt3fJ8NSV1j4yOtqiAc+2gr/2tQEVXb90mFrhQVs2
         LElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716255522; x=1716860322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEsTExgQlIUHvQXYXYRFPucKqMnlxBBo3mU9WqzMY1Y=;
        b=HcawdQfoNXH+p20TGBGcAmbVmlFYcW5YvjJXfiWbxmcYCv4J1R7RivevGOOH+QeFzR
         SxUrFZfD8vEpDz+/3wSRff+pCTrPt5RTxDLvLoeBi50FjJLMahYsq6eYtR+/Ls/+BDk2
         ScP1mM9QRkxSmJt52LJhkMemj4sSTuS52sWMqYb2DGzh3Xk30myL+JCFZ2T1jmLydZjd
         +jUBGO5BuL28yJhW1b7f7hQUZWkxk8v4Ilac30VqODq7EJi2MbSrUwWyqRw0EklAKNbR
         Xna33JxObMF56GbCIm248GHxV+A0xZLcsbA49fqUCAdGhrheRbKEqGDCTtDqzcw6zzip
         ufGw==
X-Forwarded-Encrypted: i=1; AJvYcCWqAdZfWgKTB9FDk9hwMCiPfhFoR8JEJALwoktCJKqEg54CeiXFXCOrP+HpipmsTbvQYTJ6ohpAMbhPT9OjxbbcXw6/zEVxqnVbAw==
X-Gm-Message-State: AOJu0Yw2wvlEXSSVkzs9NhEQF26Jut+oNfjJHJBgYKcX43mPyhU6FY05
	If0ahcrsVx8992wCkziMpauKhDPcW9NSz/d7hOEyFpTVIS1n4+zbUHrWqwvuLqSp2hpBcDmMm6l
	wWtTaMj88Nqavddcu40nlVm/gcJc=
X-Google-Smtp-Source: AGHT+IFeLAs1jMKfhWeCgu84pFlGgIR0qyydYWo687CXyUj0ukDsVqNeP22h2ttUTli2tsE3bF+9Ng97W7ryjNE7NIw=
X-Received: by 2002:a25:ce10:0:b0:dcd:4e54:9420 with SMTP id
 3f1490d57ef6-dee4f1c4718mr29960171276.5.1716255522011; Mon, 20 May 2024
 18:38:42 -0700 (PDT)
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
From: Chris Maness <christopher.maness@gmail.com>
Date: Mon, 20 May 2024 18:38:30 -0700
Message-ID: <CANnsUMH0ES=WNL-RkTFMnDmBg+dgedcX5bBfauvfKSJ6-MtODg@mail.gmail.com>
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: Duoming Zhou <duoming@zju.edu.cn>, dan.carpenter@linaro.org, 
	linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, I would say that it bombed pretty quickly without the patch, so A
patch is better than NO patch -- and often we are always our own worst
critic.  I have NETROM working too now in kernel space.  Seems to be
ok.

Thanks,
Chris Maness
-Sent from my iPhone


On Mon, May 20, 2024 at 5:48=E2=80=AFPM Lars Kellogg-Stedman <lars@oddbit.c=
om> wrote:
>
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
>
> The bigger issue has been that there are very few people interested in
> the ax.25 support in the kernel; there's not a real maintainer, so it's
> difficult to get code approved. There were some concerns expressed that
> maybe this isn't the *correct* fix, but I would argue that even if it's
> not the most correct fix we should try to get it in anyway, since
> otherwise ax.25 is completely broken.
>
> --
> Lars Kellogg-Stedman <lars@oddbit.com> | larsks @ {irc,twitter,github}
> http://blog.oddbit.com/                | N1LKS



--=20
Thanks,
Chris Maness

