Return-Path: <linux-hams+bounces-333-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9A48D0180
	for <lists+linux-hams@lfdr.de>; Mon, 27 May 2024 15:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB37C1F24B69
	for <lists+linux-hams@lfdr.de>; Mon, 27 May 2024 13:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D0A15EFCE;
	Mon, 27 May 2024 13:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ypt/nFtf"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011C915EFC2
	for <linux-hams@vger.kernel.org>; Mon, 27 May 2024 13:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816615; cv=none; b=czAKi3Pto02Zf8RsZK5peOfN1m4KC/jTQaITNIUUVmv3RiOQGQBn5LfxoHHWkBbnJNsOPDW2iqeBFyB8QL4DRxY9j1dvQUsK4oW/b8nVmMUwmdLpwmS2zvouks43K06sU5UvQx1uDzqJyNb+AG31zZPabPhgxJ6HpnT2K8SFpv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816615; c=relaxed/simple;
	bh=WcWpV/NPypAedpDy7DQNRgP/S05BoKxs/iLWICVqszc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s7D7kaaQd+Zhe0/sPBFZiu1/qqIbtUmwwIZaX+EYyOgOiqqvdJVGLTxOYJ0W4odjE3KfFtgEePq+xVa0mX9osj78mSoEp67vR/XhGdLAMSxY7pbwt7kyFZJ1RRXIUh+CzgxImrn3+DJsYefY1soC3HypTrDdJzs2IAFIFwLny4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ypt/nFtf; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-627ecda47d0so55755857b3.2
        for <linux-hams@vger.kernel.org>; Mon, 27 May 2024 06:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716816613; x=1717421413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wcaqjItTEGTi2Bya83G5944W6Z0pWgrva/DV5trIrE=;
        b=Ypt/nFtfEki99gKXb2z0SsWRDnrN1F4Gy2b5+wgRsEmg+GeB+ItJVV0ds1ExUJ7mNL
         PQoRvCh+DjrG4E/ijQ4yR4vk5zwBQM/yeQaQS1TeFbpVjTp//KoP3kR396Rh8C97NWUA
         2/PVb7IMFqg3wWOvBiOM6zbqgXVx9osi2KGNBotCKEet9VQqq8VedhZNwvNhaUD1x+Xv
         tZYJ0zaCE79DMhqkW3zvNOvz9G0AW1shuQXMzyov5qV94zas6mYX6+G/Iv24Q9wAol/f
         brmoJD4gfM5tDjW6rRoNEt5FzkyAsMoOwTLMa8tk3rb7E1/eqZ7N4cclXBL7F57zTb1o
         2YCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716816613; x=1717421413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wcaqjItTEGTi2Bya83G5944W6Z0pWgrva/DV5trIrE=;
        b=VtPZYNJ+5cSBW//S2pDhfM+GflwOnTX+n1iZ4BDt/rJ2FgORFW+gvG0PkUThNMNjNN
         hY9tLkbW36GTp69ioLbaMPr2dhcezFoEvtaR9woc7axQAVusep8xsFW8SEtajSvemGkG
         1Log8X2m74mhdMVblC8Lasa7fWMosZTZU0vYNJcY+3xtpND+NtNvELBFcMaKP9UY8YOV
         XUc7+6jN5hQh0puGthzcvMwJOr3vjf2vcELQlmfGeIlsKt2JF9SZW/7RnOlieNA7nBH8
         JpBi1btHKlFRQDlBYLovBNu8gvJKIs+f+wTLzh4b8od1N83GKRQwUFWNU3+Ih/IiojFT
         Bhvw==
X-Forwarded-Encrypted: i=1; AJvYcCUVIQLU+A+amMVqjSTgT262W/gigd8ubnPPTLiPhhLgYOSegAQn1VqzAdkW0cZJS7ISv08GODJD5BVLnwPc1M8vfi9cZ33LQrXH8Q==
X-Gm-Message-State: AOJu0YzGz7kSSfpV+XKSORQi7cM+RY8lgaQff1YfKtZpi+fMpDUBPDci
	BqxrnH1NGGrFhitgBZV8st4GRJX5+YxuPyIu7nFDJAhdmxFZAYtHqPrje7YN0bcvLmST2cPAXY6
	tIWPH33LAlyzfM9Nb25aMxjOv+kQ=
X-Google-Smtp-Source: AGHT+IGPk/WcSyEM4p7K23IYW6WXx+xtUXdy1RpvNwT02GAQKbortZlHjVETyFskeCtxsJG3sIJ9/1dGpw18Fwn5JzQ=
X-Received: by 2002:a81:a194:0:b0:620:2ec0:9797 with SMTP id
 00721157ae682-62a08dda7c8mr88167037b3.23.1716816612904; Mon, 27 May 2024
 06:30:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANnsUMGJvG6Cs57_ar-iixCpyRKq_ScMZFNaq-SpdHX53ou6fQ@mail.gmail.com>
 <CANnsUMFWHd1kvbDubMnX4aS9La=0EpiCzee7NDNqkCMUwLXPaw@mail.gmail.com> <5d40d8ee-e4e6-41cb-a8d7-b2590b549494@moroto.mountain>
In-Reply-To: <5d40d8ee-e4e6-41cb-a8d7-b2590b549494@moroto.mountain>
From: Chris Maness <christopher.maness@gmail.com>
Date: Mon, 27 May 2024 06:30:01 -0700
Message-ID: <CANnsUMH9Of7q4NyTnWPE6e-XdezTTxiQeRVDPWzofW82Smj+zg@mail.gmail.com>
Subject: Re: Mainline Kernel Question
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: David Ranch <linux-hams@trinnet.net>, linux-hams@vger.kernel.org, 
	Duoming Zhou <duoming@zju.edu.cn>, Lars Kellogg-Stedman <lars@oddbit.com>, Dan Cross <crossd@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would be happy to.  I already have the system for it.

On Mon, May 27, 2024 at 2:30=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Sun, May 26, 2024 at 03:25:48PM -0700, Chris Maness wrote:
> > I am looking at the [view diff] in the mainline kernel, and I think I
> > see the AX.25 patches that were going back and forth a couple of days
> > ago (a good thing).  I imagine that I will have to wait for another
> > stable fork (say 6.10.1) before I can expect to find this code in
> > Slackware-current.   Slackware current is following the most recent
> > stable fork of the mainline tree.  Does this sound correct?
> >
> > Now, when I see this new code can I simply update the net directory in
> > say 5.15.145 or whatever is running at the time in Slackware15 and
> > recompile?  Also, what can I/WE do to have all the deltas from the
> > mainline (as far as the AX.25 stuff) backported to longterm branches?
>
> Let's get this working and then we can easily send an email to Greg to
> backport the necessary patches.
>
> Btw, ax25 was broken for two years and that's not great.  Could someone
> commit to testing upstream?
>
> regards,
> dan carpenter
>


--=20
Thanks,
Chris Maness

