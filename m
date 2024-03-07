Return-Path: <linux-hams+bounces-51-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8789874B2D
	for <lists+linux-hams@lfdr.de>; Thu,  7 Mar 2024 10:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA4FE1C20C42
	for <lists+linux-hams@lfdr.de>; Thu,  7 Mar 2024 09:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0891483CCF;
	Thu,  7 Mar 2024 09:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GE7DQ7d/"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AD683A12;
	Thu,  7 Mar 2024 09:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709804666; cv=none; b=tCt4VRNqgDFho9ZBLFQg0S6IkP/87HMe1ogXFxDWZhKuDtw4JNLQYUkifK2SFDSFVAHgHyo7OiQVF1rOS8dyGNokoiltYLSO0tmQ77X/bRoTQ2U7kUZJ7RY9CVQ9ewQO1ZV3JK2WRJdmhqN/prRbJVHuCDdwguJIZyfG8V9JbsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709804666; c=relaxed/simple;
	bh=qKTi/7HqNRHMwqnMeFapnRo5Oj9fQWDvThMsdZQftdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqFxsdDzjerMUY/VN+g/4ZLHkgTm+OMDAB9OLU77N6EaV7Dnnm5Wnxw+z8N6Qu9+vgo3yUWnsJI5NX5MALpQu6FcERZblu1rMEYEFrGGMt2nfQNmtUjwRy00D8bFJldB3ZrvcgonRuLkfZMkB7vzF/xCP5Rs/qGqwF58UZcnes0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GE7DQ7d/; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a458b6d9cfeso97672166b.2;
        Thu, 07 Mar 2024 01:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709804663; x=1710409463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKTi/7HqNRHMwqnMeFapnRo5Oj9fQWDvThMsdZQftdc=;
        b=GE7DQ7d/ejGzZoOqOiAGkl9uPOl53LYjbdV6bWQ6PvLHERmKuW8Y7xXY70TLrWjIu8
         US7sacSlDyctEQTPt3qSTqUad0WnEUA+mDTR5uggOj5Hj3mnfEJ9HykTPm2uFyzgYGny
         ESxF1otSqhdfK7tjcnPB6l5EBcCSOCmroRhL6P2pyicWo72VI3a9E4W9+pPUxNZXsyzQ
         zligBAa9Q8+8+2VaJN3UM/C9ElyOvm/89TjfkjcIDTnr5DX9xOFdk1hCd5ThUi/8W1EF
         14EOFLJJlG2wI5UQftOTqH7kCJkaIHzvn2jOprVWCREs6Dxmpezpp1F+A2TCt9GRTEG6
         /khA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709804663; x=1710409463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKTi/7HqNRHMwqnMeFapnRo5Oj9fQWDvThMsdZQftdc=;
        b=OExAgjr60XKH3/WEiQ42zyvqS0Pbk9Ihhz1YWgIaBFwFKE+zReW4q6W60dcGTvDWW3
         +PpYOAxraicnfqyJ8+YwV7Ja9UcwQHbrdqq+uuqxCcu4ox7mdLZIIHCG3YQcZE/KvNn8
         ko/z3a4W/17BPmi6jmxD0lFjJFlDnOUf/oEZbDbjiEFEz0rG+8qsOVJuR8pJCql6cWJQ
         SydSFwxjal6VUGDkdQwm/QOJFIFUsGmtIbQKBlmx/0GcSvcnt5fIy5TUoddnYrv7jwQ/
         1ubeUYFvAtuSYqK0oENUn5C3RkGYWMq6pO4N23hhuDWP9PdbUaIrmVhADjzpkC28pC61
         Rlsw==
X-Forwarded-Encrypted: i=1; AJvYcCXhqLyXrRQLr8USblPbMpu5ovZFqWUL8hJLMqaXT7Jk09tlPFmExzTCEwvsRUMhTjbOBLCNblSC4tCMLoQJVAKZBqQw9n46ydr1ZZq65PtcFf4fWLp7WZKxml4uO5g5ye6msg==
X-Gm-Message-State: AOJu0YwU9R5Yi269do8FchHAjKZeqdxVCeMEetaM403sT0IjgC2owxpb
	WMKO+W80gL/sH30//Xni1+ZkLeKt/QweK/18OlKFViQXGlKsqESRCSGL4GNqWM/KDuIMblvARLc
	DM5FmbYj9LrE3xaH2dLMfJ63MOSQ=
X-Google-Smtp-Source: AGHT+IF2lcfUrJF8+uXC4+6A3g2wnCWmnC8Go5wwoKa+prz+tq79cBcQWfFl+2VNO+wM8PseMtOLwIrHxA9y/kITLGU=
X-Received: by 2002:a17:906:aac8:b0:a3f:9f38:ded with SMTP id
 kt8-20020a170906aac800b00a3f9f380dedmr10800093ejb.69.1709804663414; Thu, 07
 Mar 2024 01:44:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240304082046.64977-1-kerneljasonxing@gmail.com> <d192bf6be832e6948988dc1cbb9751ab1ea41b3d.camel@redhat.com>
In-Reply-To: <d192bf6be832e6948988dc1cbb9751ab1ea41b3d.camel@redhat.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 7 Mar 2024 17:43:46 +0800
Message-ID: <CAL+tcoD=drFF6WtCnPxy7TJK9fjmNMuZPee=kkjiQ64cr8YJ1Q@mail.gmail.com>
Subject: Re: [PATCH net 00/12] netrom: Fix all the data-races around sysctls
To: Paolo Abeni <pabeni@redhat.com>
Cc: ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, 
	Jason Xing <kernelxing@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 5:36=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> Hi,
>
> On Mon, 2024-03-04 at 16:20 +0800, Jason Xing wrote:
> > As the title said, in this patchset I fix the data-race issues because
> > the writer and the reader can manipulate the same value concurrently.
>
> I hope this is not a one-shot effort. I think there is quite a bit room
> for improvement in the x25/netrom land, e.g. starting from selftests,
> if you have time and will:)

Yes, I'm trying to make time to learn it after work, like fixing
issues that syzbot reports, since Ralf seems inactive in recent years.
I hope I can take it...

>
> The patches LGTM, I'm applying them.

Thanks!

>
> Cheers,
>
> Paolo
>

