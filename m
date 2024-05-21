Return-Path: <linux-hams+bounces-288-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDDA8CB220
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 18:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22CAD282AB0
	for <lists+linux-hams@lfdr.de>; Tue, 21 May 2024 16:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9261CD3B;
	Tue, 21 May 2024 16:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXJ5Mpi4"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3744C66
	for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 16:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716308952; cv=none; b=Kgj3kdYXkz8KtTRTOAkHf5TD090Loj/ZF10+yNgpI2AlLuf5qClxQZ9lP68HYCbz8tCorEKTTE0JDqmLQc9HEsmIkxzceSC/1IprCorhJfDKed+ZS/YDM+myt8gTN03PiUgZRnV53oUvQCdlHRVW7m5gRWtw0J3TUKn5qvxUWBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716308952; c=relaxed/simple;
	bh=+RN597HK6sthv2eetZLhg5zrosr9OZEJB5ke60zXIZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G9MUzoqxqmwh6MaMLkJtK2FwjxYM06OvgcCoSfY4PD2NqQfmh/DAMhLlSVs5VhvBHGU3nXEywGc8jdTofOzlX/M9omah38GaI9tc7pxQ014mS94IyyGsjzO2Tff1DMuqXrAmJy00nHyLl4bS4JV4bV9YP08tnmbtChqKihe0jFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXJ5Mpi4; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dee72970df8so10831276.0
        for <linux-hams@vger.kernel.org>; Tue, 21 May 2024 09:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716308950; x=1716913750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9E4LcwLLftDWbvzSyK1XWFAd8cZjF6gmBlpBz2wxxY=;
        b=YXJ5Mpi4gUmQTlLd0bjjNgMm5IGQ3m0AXbSg04nIlrCeTUkIvo23GaEZ9X/nxuI7Pv
         MHCWtTh+xh0peaqu3fKBnO22JjhrdsjBRgW0vuvflC9cC6Dqycx3F8zNo3XRDxQpovPd
         R+PtyJAPoAnnop2o8P2kIqmIp62yV2SFwJ40hrUZHDBFecdMIMtxdi6yOYfi1DebUnLY
         /RSJeGoqBnP9D5GkLKGZob6yiQ87g0PnSOqhfWadxq/lraNzNo32yIkacHayvuNaYl7b
         KTlgKlA0iB+bC39ZMKYo4Xg1IgeLy+L5gXtHo/qIUfYNUCC50eQooIgCnTRH9GC13Ac8
         wEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716308950; x=1716913750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9E4LcwLLftDWbvzSyK1XWFAd8cZjF6gmBlpBz2wxxY=;
        b=cf+L2No4KuLBwnHFwgT54BVpEPFIUM/IhGLbxV5/D87mLp6cUfdoDFajG2gp156Kv4
         79rjpXQKCAZMRQtruc8hDgDwYkwk1wHZ7hXMwbePHWyz4mkBsivkBO6mLkVLxvM9slhS
         D1nAUaYJpOKGgb1h/On+ve6cQYEd8Ho9X4sFMfYI1wTFBTBeIs9IhWBIayHmJK8KUZae
         1RfSpjNYVz5uPpaopix6Y3GyTaQsJZuTWO5MffPFfsOhpAmRPo1Hp2ZRgyHg5EFoOES4
         E/6LwbwApvr+0JdnOaz56M1vzbUWNn4QNEjsNokwBtTSCAPlD9c3xFGlWqFytu+Yx4t9
         STzA==
X-Forwarded-Encrypted: i=1; AJvYcCWM0kJJA7E8mBUecz4VGmGPA9OOv06anEo0Q/0gE54vHl0kdxya0bGdTgUbvGQJS1uDNQ5+FmaL8RKnbLBKlzBFbCQGTdjV/iOquw==
X-Gm-Message-State: AOJu0YyA94iyRyBPHr+bNEzjwjnvdkod3q24bGJhn9NTVgnEnbDb3UND
	TA2NK8z7MbNuIj4+HDVx3dhSSTCpJ0wpqYUZY1ah2AmGRuW0LDdxJv5JsqI58VUaPznnZuxtwD4
	wb+ALacBMmWoOT+Mk9m/VNLiTDy4=
X-Google-Smtp-Source: AGHT+IHLYVH70geQh0wtU8JwWHJP2q0h2ulSSpCdHgTerppgdgy9RiOCxq8zksQ+o33/SA8nJZ5MvE30V6LVoy7xn3A=
X-Received: by 2002:a5b:cca:0:b0:dcf:eb30:c580 with SMTP id
 3f1490d57ef6-df4905ad1ecmr6906375276.3.1716308949998; Tue, 21 May 2024
 09:29:09 -0700 (PDT)
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
 <CANnsUMEq5xZUFdZdmNd=wGz+RmjxGzGY_9eaqGcgCLxs55mr9w@mail.gmail.com>
 <r3hwkyx6os3eacimhqvrs4cv4ssqajpxp3zkiqqidu6pjkj2v6@slrtgnartz3f> <f27710b7-253c-79ce-e214-2b8251aceead@trinnet.net>
In-Reply-To: <f27710b7-253c-79ce-e214-2b8251aceead@trinnet.net>
From: Chris Maness <christopher.maness@gmail.com>
Date: Tue, 21 May 2024 09:28:58 -0700
Message-ID: <CANnsUMETDpfXG+pmAYKZyEikNVOLKT-VwmnjZeCg+cEJ-dgNBg@mail.gmail.com>
Subject: Re: Kernel 6.9.1 AX.25 Crash
To: David Ranch <linux-hams@trinnet.net>
Cc: Lars Kellogg-Stedman <lars@oddbit.com>, Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I had some patches committed to the Raspberry Pi fork, and that was
just a matter of submitting a bug report in their forked github kernel
site.  It was easy since the kernel had already been committed in the
mainline, they just simply added the patches the way I did before
recompiling and installing it on my Raspberry Pi.  I wish I could help
more.  I have not done any programming beyond what I needed to do to
get my physics degree.

-Chris KQ6UP

On Tue, May 21, 2024 at 8:53=E2=80=AFAM David Ranch <linux-hams@trinnet.net=
> wrote:
>
>
> Hello Lars,
>
> > Well, partly because you're the first person to confirm that it works
> > for someone besides me :). Dan (Cross) has offered to test it out as
> > well; if I can get a couple of confirmations that it's working, I'll
> > probably go ahead and submit it to netdev.
> >
> > The bigger issue has been that there are very few people interested in
> > the ax.25 support in the kernel; there's not a real maintainer, so it's
> > difficult to get code approved. There were some concerns expressed that
> > maybe this isn't the *correct* fix, but I would argue that even if it's
> > not the most correct fix we should try to get it in anyway, since
> > otherwise ax.25 is completely broken.
>
> First off, Lars, I wanted to thank you for getting some of these REAL
> fixes actually committed into the mainline.  You've done something that
> many others could not!  That said, I wanted to chime in here about your
> commend about "very few people interested in the a.25 support in the
> kernel".  That's definitely not true.
>
> I and several others tried for many quarters and years to try to get
> some of these initial toxic commits that came in around the 4.19.x
> timeframe fixed but there was never any real meaningful responses and
> fixes.  I do agree that the lack of a real maintainer aka steward for
> the mkiss / ax25 / netrom / rose kernel code really hurts the ongoing
> health of the stack.  I wish I could take up that job but I don't have
> the required skillset.  The larger issue here is that random Linux
> kernel developers are periodically changing various parts of kernel
> infrastructure and when they try to make "updates" to the AX.25 code,
> the mindset is that they only consider a successful kernel compile as a
> "code pass".  That's VERY bad.  The other significant issue is that the
> kernel branch maintainers / powers at be seem to just accept these
> changes without any real scrutiny and don't require any real testing
> results to confirm things still work.  I had previously asked how some
> of these developers had really tested their code when they offered
> official patches here on the vger list and never received *any*
> meaningful responses.  I've asked if there is some form of a per-commit
> or daily CI build and regression test environment that I could offer up
> some basic toxicity test scenarios to.  No response.  It's been hugely
> frustrating for YEARS now and all of the "silently suffering" Linux
> packet users have resorted to still run ancient Linux distros like
> Debian Wheezy to keep their systems fully operational.
>
> I am hugely grateful to you (Lars) on being able to submit some
> meaningful fixes and was able to get them committed to the mainline.
> The next major hurdle that I would love to get feedback on is how to get
> these new changes but also create a set of backported fixes committed
> into various Linux distributions kernels that don't strictly follow the
> mainline kernel.  My personal interest is in the Raspberry Pi OS kernel
> and the Canonical Ubuntu 22.04 / 20.04 kernels.  If people have
> recommendations / contacts to try / etc...please contact me offline and
> I will work on trying to get these fixes committed.
>
> --David
> KI6ZHD
> Maintainer of the Linpac AX.25 terminal program
> Advocate of the Direwolf multi-platform AX.25 software based TNC
> AMPR 44-net Coordinator for the Silicon Valley, USA region
>


--=20
Thanks,
Chris Maness

