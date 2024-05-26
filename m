Return-Path: <linux-hams+bounces-328-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B49828CF686
	for <lists+linux-hams@lfdr.de>; Mon, 27 May 2024 00:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 482F71F21691
	for <lists+linux-hams@lfdr.de>; Sun, 26 May 2024 22:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FBC84D30;
	Sun, 26 May 2024 22:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRUOANMC"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC61C15D
	for <linux-hams@vger.kernel.org>; Sun, 26 May 2024 22:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716762362; cv=none; b=k3qWQBTSenJMU5vx0I8U4/kDe5DE6nFer8ggmHtK/tSXHk+jpH08ul8icOYc5zha65znm2w2OAsrYV99GNm7RMnd4OJg0b4u+t/XFAn3O5PCJh6P41XMY8cS6VGHpiMYwl5DbOueRaXtlAbUxYmZ8P0Cp2h/I/mp0aP/1pdN3I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716762362; c=relaxed/simple;
	bh=AXqEi9vXDD2UoQJ6E/IAG79y1r/YGcXEx7KBTKnE19o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Z1CmlQzEiQVxpKWN39AM2zvCKy5FqOxJGFTnuEpuAZrDPEEIFwzFPM6r9pmBw3C5FWXo+L+hhkZJNUJNIbTGSn2PnbbQaidgr2UAz21KxgfbmnC5cA7vvkZGFEBvH0TzuxuTaX131jIG9kz7TLRaTqitLs6jHe4Iszz3CfccEwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRUOANMC; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-62a080a171dso25639487b3.0
        for <linux-hams@vger.kernel.org>; Sun, 26 May 2024 15:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716762360; x=1717367160; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GrNl4oj9qM9/RxC8JOjB/2TgfyD41JaivqcXM79oY+s=;
        b=WRUOANMCqKFak6llwrH+GWYk7FaWzHJN9brjobRRuXLzqHWwzYCWCh0pjWVrbcwGQt
         baB1h6LOl4zyyG+WLa2siZGfCMzETBpgED5GgtOlF7gam0LbSkW7T0jfsSW957tP9xdf
         kDfQPZVZ5Fs0ZXUpU6mQgbieyrTDYIvw5VQVIRIZ8dF/YHMnKkdi06KeDEosO3TVpU8c
         9G9uqXQLio4NB2Cn4fiTjRiKKc0uyW5JQ4eYHHJMqBpECzS/9ILeCvV75dZpbCs1JzwY
         15uIfgW0NLAbgzlcR0Nv+its+cG89dFg74qQnPec/fmXYQRTQzpTnk3fObXERrhiMl+r
         qcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716762360; x=1717367160;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GrNl4oj9qM9/RxC8JOjB/2TgfyD41JaivqcXM79oY+s=;
        b=VY9bmfIwJagKV9fmrQwVZQam+9qE/F5GW4qFU47aPVPK1kT4C4SoT1i7uZQWz2qf0x
         vz11aJFIoq9FJTa52JKcTB7FjhuA7ZgWIgzBHcQxFFljFMw4q7JDiLEm1plLRPmVsYyq
         rsuIlCUWRYeM9iFGBER65j8GvnGLtz3GdZYPCRqrrzRQCxCAt9p0PVxTpwd1nBl2zT+B
         Wp2vWmpOwsIb72mHdayYroT5zIGvMHy9kqhB+E4DDOfrOA5//QNMBOLH+tdhBX1RNb3Q
         E2MnLqvQWUZBarEuP4HvhKjJ14GrwWWC7zi5yDPWRI+KywMDN5WMeyohDl2taLs8scyY
         5uew==
X-Forwarded-Encrypted: i=1; AJvYcCVtVyTRwPYaJfQjcYFg1VrJ7w4vogXRjBfwJ0GbnumAEoCPUoaPjPMhLgdTf/vxq/lb1SjC89LZyY6AXNgWhieKuYuOGgFDp9Ls1g==
X-Gm-Message-State: AOJu0YyNrVWsii5iZRMtrUBJe7DTv2xAzxozu297Eeoivgyv8PRKW/7Z
	81GxM9N6jNwSAs2Kyw6B7/IsarAam4NlaPj4Y5m7YBc3tq5VQtSZPhi50oceKx8979GLY8uykFh
	wVNqMxSjcBWp9UvOpZxGRvxddOGQ=
X-Google-Smtp-Source: AGHT+IFeHIxhOt4/i8UaPYa+C+Y+PpUvdBThWb5u740REpH+fT6DYzpKTRmQVu+cE/9mjz+hnOtfU6ussA3PXWcvN5M=
X-Received: by 2002:a25:abaf:0:b0:df4:4345:260b with SMTP id
 3f1490d57ef6-df7721f6a2amr7877469276.36.1716762359747; Sun, 26 May 2024
 15:25:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANnsUMGJvG6Cs57_ar-iixCpyRKq_ScMZFNaq-SpdHX53ou6fQ@mail.gmail.com>
In-Reply-To: <CANnsUMGJvG6Cs57_ar-iixCpyRKq_ScMZFNaq-SpdHX53ou6fQ@mail.gmail.com>
From: Chris Maness <christopher.maness@gmail.com>
Date: Sun, 26 May 2024 15:25:48 -0700
Message-ID: <CANnsUMFWHd1kvbDubMnX4aS9La=0EpiCzee7NDNqkCMUwLXPaw@mail.gmail.com>
Subject: Mainline Kernel Question
To: David Ranch <linux-hams@trinnet.net>, linux-hams@vger.kernel.org, 
	dan.carpenter@linaro.org, Duoming Zhou <duoming@zju.edu.cn>, 
	Lars Kellogg-Stedman <lars@oddbit.com>, Dan Cross <crossd@gmail.com>
Content-Type: text/plain; charset="UTF-8"

I am looking at the [view diff] in the mainline kernel, and I think I
see the AX.25 patches that were going back and forth a couple of days
ago (a good thing).  I imagine that I will have to wait for another
stable fork (say 6.10.1) before I can expect to find this code in
Slackware-current.   Slackware current is following the most recent
stable fork of the mainline tree.  Does this sound correct?

Now, when I see this new code can I simply update the net directory in
say 5.15.145 or whatever is running at the time in Slackware15 and
recompile?  Also, what can I/WE do to have all the deltas from the
mainline (as far as the AX.25 stuff) backported to longterm branches?
That way these updates will eventually trickle down into other
distros.  Slackware-current works pretty well, but I am having some
small problems with some softwares running bleeding edge Slackware
(which is an oxymoron for Slackware :D ).  Therefore, I would prefer
to use the longterm branch on Slack-15 where everything is working
nicely.  The only bug so far is that if a connection is crashed out
of, the socket stays busy for that callsign.  I can still connect, but
I have to use a new call. I am going to send a separate email to this
group on the subject.

-Chris KQ6UP

