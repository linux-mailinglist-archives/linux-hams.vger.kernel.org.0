Return-Path: <linux-hams+bounces-396-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BC695011F
	for <lists+linux-hams@lfdr.de>; Tue, 13 Aug 2024 11:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61422282964
	for <lists+linux-hams@lfdr.de>; Tue, 13 Aug 2024 09:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EEE114D42C;
	Tue, 13 Aug 2024 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u8LDZkNy"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5985F210E7
	for <linux-hams@vger.kernel.org>; Tue, 13 Aug 2024 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723541052; cv=none; b=sP3tXMUe6r4hpQWjSxaXVViggfe/9OKDZ4AVY/qeVJQ2nzlU3tuvQiTbypoSoql4q5am9WX8dO0FxmU+xYcIes/OjqBcV9zFqiu48GYO2cO4Rs8ELIXu+noDPzKKCtVVtdEZNOUKu7LbEAvGum4tNYf+rvfXvm4oL2KzdZ/2F9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723541052; c=relaxed/simple;
	bh=KD3vKKg5BG3CzNni4gdE4mykSV/HQ63lP1SGQGw2NOM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjvpeqkV47UOetsb55JzqBKKram2nKeujkIQwyQbo/FLZVxex4ZEViPs6ZwyDgNMBEueZH1dvX4dfoByemp8Y22NxfgBjCDPqCw0iOwiPpUkCMf5hEFDYe8proZl4iwkpVdjrlPy0eXgvzdW6SVjqGBzTfqauTb870enotyvuhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u8LDZkNy; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a83562f9be9so11551666b.0
        for <linux-hams@vger.kernel.org>; Tue, 13 Aug 2024 02:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723541048; x=1724145848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FXg21OcI+itzxXUDuPL1iraHr3u0+O+iq8dQpdqw9vs=;
        b=u8LDZkNyjXWgccXjbgkpriam8EWbAVMTQ2pNZLnr0FFxQc5OZP6D0MrsruH5ZutFhY
         5Ec4gRV56HunzMv/gRox2dVs8UBsVYVl37947P2P02BQpWWc5EkHOxR/ocxD+l80S72t
         OV/9Jtj0Kpx8O+FV3F3EijxR7FE4o8d3TkFQfgtvvaH1XrMIgVgXEqBPFayF+fH93zrS
         hFLxW8Kl1ZbshQmdywGIYjjbPpYjmqwigCEzKjA+sUFnzEpYLxG0aeV1rD2V9vqHAOTs
         1QGKHK8PuLPTPNRBSTt3tEaBBld+OWlbOCM9oJQ1Ij1cH4jNxie3wGz4oE0T6oOJ1oOy
         XUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723541048; x=1724145848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXg21OcI+itzxXUDuPL1iraHr3u0+O+iq8dQpdqw9vs=;
        b=D5dgqOg4tR6tvrF9OMEogZgSFzPBqyijiUqEKL/u1zijMKvEA/86JPVlZvuZM8Rua9
         7JzwADQVZwWTvM92ZEh7vPaZBlbQ5pslqLhMBGrUmxsRM4EdcXuGrHXYY9KyFnNEKVur
         SYRKiunnLaNdBcN9qMXIPeosDSu+s4/f+3SKw4ASZ7LDWZ4tgzTuFVFg5AegsiUGrsrc
         mJRbfOr5AXHLptZC7oar8m+Wp/m4P7F8FqTeKeBlW6JdcsBSdIOj+k7FnTRnuOsOZQGH
         iD57BnAjk0CDrRuAhLoimXcANrP79VndlelFmxDLXr465OiXc4rODkNSpBXhXW9j1aHx
         xW5Q==
X-Gm-Message-State: AOJu0YwltvnXU/64fb/wFfsOpJGK2Cn7c+tL/3II6vwSVqdxVOYPMH6r
	Map9h5DFJ7VWbiBOm93olQhNR3+Mi9szJgd7WNpqn7jtaOC+uNfTsISa7WoHqJiGMAKy916AmuE
	M
X-Google-Smtp-Source: AGHT+IGeRUu2Vjq62tOcQk421uNf2Jk8rX7d+6EJH5AqskD0OMWrpMlzZD3uEbRSlapCJmEgM/2APg==
X-Received: by 2002:a17:906:730a:b0:a75:23bb:6087 with SMTP id a640c23a62f3a-a80ed25b2camr225893166b.29.1723541048258;
        Tue, 13 Aug 2024 02:24:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f4184ec9sm52659666b.219.2024.08.13.02.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 02:24:07 -0700 (PDT)
Date: Tue, 13 Aug 2024 12:24:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: linux-hams@vger.kernel.org, Duoming Zhou <duoming@zju.edu.cn>,
	Lars Kellogg-Stedman <lars@oddbit.com>
Subject: Re: [syzbot] Monthly hams report (Aug 2024)
Message-ID: <ff0f5776-6b61-4fe6-ae2a-2f5913719476@stanley.mountain>
References: <000000000000c76df0061f8cba62@google.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000c76df0061f8cba62@google.com>

On Tue, Aug 13, 2024 at 01:52:29AM -0700, syzbot wrote:
> Hello hams maintainers/developers,
> 
> This is a 31-day syzbot report for the hams subsystem.
> All related reports/information can be found at:
> https://syzkaller.appspot.com/upstream/s/hams
> 
> During the period, 0 new issues were detected and 0 were fixed.
> In total, 7 issues are still open and 35 have been fixed so far.
> 
> Some of the still happening issues:
> 
> Ref Crashes Repro Title
> <1> 270     Yes   WARNING: refcount bug in ax25_release (3)
>                   https://syzkaller.appspot.com/bug?extid=33841dc6aa3e1d86b78a
> <2> 257     Yes   KMSAN: uninit-value in ax25cmp (3)
>                   https://syzkaller.appspot.com/bug?extid=74161d266475935e9c5d

Apparently we never fixed these.  They have reproducers so it shouldn't be too
impossible to debug them.

Lars, were you ever able to test the stable kernels to see if the backports
fixed the crashes?

regards,
dan carpenter

