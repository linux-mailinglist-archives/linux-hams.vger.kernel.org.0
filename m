Return-Path: <linux-hams+bounces-556-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE7BB281A0
	for <lists+linux-hams@lfdr.de>; Fri, 15 Aug 2025 16:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 072EA7B4293
	for <lists+linux-hams@lfdr.de>; Fri, 15 Aug 2025 14:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C7922541B;
	Fri, 15 Aug 2025 14:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3nLmA/B"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68FF224B03
	for <linux-hams@vger.kernel.org>; Fri, 15 Aug 2025 14:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755268084; cv=none; b=fmhqu0gMtSPWAMl15fJa18THXfFLSFSdPbieBM7to4li91791+Fz2a9A5+wuYqIT/WpOU0OyFT0/cKwiorqWEtAwpNx/2XGGSRTcyZP4fxdRKIF+1y+DcoBGwcyFfxebHY43XVUl3LiHNyaOs++kydrvV8zgnV2qSlEPvwPZWTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755268084; c=relaxed/simple;
	bh=22hVGiA6brVlk8+cFIcG4E8+2KkuA9zJT5FuEtwqJrg=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=JCASxVmdXjran58M0yAhWARFFzorIXgjiKUhDulkgd5OxQyQ5sfVLZxohT0Unupbi8ukZn6yvSRrNi856JiFp59nbqW5TMt1mQnzPFj42jRYHElmGac1klj39EPGJ2x1CzA19gMLqprXjKK1RrSu4xaVZoC0WpZO8Dh+ab87ef4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3nLmA/B; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-24458263458so17525665ad.3
        for <linux-hams@vger.kernel.org>; Fri, 15 Aug 2025 07:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755268082; x=1755872882; darn=vger.kernel.org;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=22hVGiA6brVlk8+cFIcG4E8+2KkuA9zJT5FuEtwqJrg=;
        b=m3nLmA/BBjnURDWnimBmOVRoupmUdNIhxYek3rrRHhDt4UI7ZPGsTn/h4AIiOpwA66
         39iRmOzdwWDXHIIPHJ/fU5eCTNIZ8bXlrIx3rjOoUYVK9b3xarOZtRI4e2XkccxjHwUM
         auR6CT5VNjUPUyWWSjBAuWPC9Xzbh32kfSjJM3f5Q4rfgpDxCKMPZ3y9HXggd1H4JCUq
         25pXeMQIflgvvAAalJDo1gTW25lhHcTY1dUXVyynBJ/v+gEgIokop3upkKNYAUSvS8LF
         8euENxvbXB7mfrxRunh0YhSkJuxFuWt+XcN1QIWP8WLgVwo55VzhGeMZ89fzxgliZerf
         sKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268082; x=1755872882;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22hVGiA6brVlk8+cFIcG4E8+2KkuA9zJT5FuEtwqJrg=;
        b=qnGNw5F5S5uWitJurbes68edOpmnOEZABjxzlfGDN8zolo9Ckfnj14OT9lWX2/Oh+8
         oSuOAyPGixYq6wydonOndkPrIrbDl3MeMuNh8OFlqZFyYAVUq/yrcr61usfhuYYY9//7
         eAf5WRmyTw7XgMFzAAcYTRA0axgqTC/rm3AHWPRIzHDRiRAFapiejtwD1i6/vBPdN/us
         AwbHB9LXPzzUMtR1LfTuNjlYxWZvZxgJnUoytvl+RB1bDNdpA+oqgthV2iNuePNkewEf
         LlKbfdu2Oygb36IbYyoc/OZMhOBnRmCKJZ9CMEpzykMvAkjO8q0fcQ8wKY9V1Im7pF2N
         giLg==
X-Gm-Message-State: AOJu0Yxp7ZUVNOMeBaEiqaiubBfROF8qZipB3bZAmXPJK3nrwxyWl+sF
	vzbQWhi76OhLjeO/UMmxO+h1ugqAYXH7C+JuMcC1UWH6BZ3fJRvng8pGWi12CTpp
X-Gm-Gg: ASbGncu6jaO+Qu/03RWWksA9LMJuNgEHFXXr4SDSIbPr6vw6LgYeFqnqFSqrxSST1VM
	JMDhvDyEftZWC4L+WsmdGHuucHPUtZtzb1dX4SWIVfCsJ8KUBBaqCM6hT3lRWNDu2l5YL46Gl0I
	L+uDQW3We2gvZ7nrzl97+p3oqB65feMlGAV5UyPXwxLAvmLNuNlzJIxwxzHtXCsZzSqN/suFiRv
	fzulyTt55wnjNFGXlfXh8rCkKQarjSoA4Rgkel4tDh3sDq7YYD21cbEAllgE4A1I2roRcEA6I2L
	7WSLb19kNQ3azjZDbWPbic26NHYrXxcsk10osSCdOYlP+sszAgi229XghxqITyb+nsqAXl3i/UA
	/42L39ul3jzAZ+8//L4qhj89Da+xMuXvATzd4lYbzCiw7WCLU3ssnaA==
X-Google-Smtp-Source: AGHT+IEki127dISulKjnowWVDh8hIecY+WcuhLaSh9Hw5XI3Q+mQ0p8yC3SQaFqM0r78n5ebLm+83A==
X-Received: by 2002:a17:903:1a43:b0:240:41a3:8e0d with SMTP id d9443c01a7336-2446d8b51f4mr28826125ad.36.1755268081801;
        Fri, 15 Aug 2025 07:28:01 -0700 (PDT)
Received: from smtpclient.apple ([177.189.100.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5a1390sm15397225ad.164.2025.08.15.07.28.00
        for <linux-hams@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Aug 2025 07:28:01 -0700 (PDT)
From: Guilherme Novaes Lima <acc.guilhermenl@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Seeking guidance on Rust porting for network driver as a learning
 project
Message-Id: <5EE4D47C-2874-4582-AD62-BF0107CBD622@gmail.com>
Date: Fri, 15 Aug 2025 11:27:49 -0300
To: linux-hams@vger.kernel.org
X-Mailer: Apple Mail (2.3826.600.51.1.1)


Hello everyone,

I=E2=80=99m a computer science student working on a graduation project =
focused on learning more about the Linux kernel and Rust. I understand =
that the kernel maintainers have been cautious about integrating Rust, =
and my intention is not to push for any immediate changes, but rather to =
explore Rust porting as a learning exercise.

Specifically, I=E2=80=99m interested in working with a network driver to =
get hands-on experience. My goal is to comply fully with the =
community=E2=80=99s expectations and guidelines, and to better =
understand the technical and cultural aspects before considering any =
real contributions in the future.

If there are any maintainers or experienced folks willing to offer =
guidance or suggest a suitable driver for this kind of project, I=E2=80=99=
d be very grateful. I=E2=80=99m not asking anyone to do the work, just =
hoping to learn and engage respectfully with the community.

Thanks for your time and any advice you can share.

Best regards,
Guilherme Lima=

