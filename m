Return-Path: <linux-hams+bounces-321-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC278CD6FD
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 17:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C45D1C21910
	for <lists+linux-hams@lfdr.de>; Thu, 23 May 2024 15:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2ED111AA;
	Thu, 23 May 2024 15:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeysNl6O"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D432171AB;
	Thu, 23 May 2024 15:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716477804; cv=none; b=VDHThA4CewgsmOl6z+W/yo/6gpNWnLWays49rOnDAb5GHKU2kThqJcIMuTUrBhBEL61q6545cZxMLSM5OY3pifOvD4akf1MkndenAktPcGIMrm5VrE9Xj7rBOL3nhTR46tC2xhjKuoW/aj+Yk6zvNAh8tQdyZeY+rKo6H3ONLyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716477804; c=relaxed/simple;
	bh=gm2akDKV+K/A+SKv5Rv3py5A35ux/uSRgjaqBzbM2bY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uGVw1UcBfbMQT9DGknRChkql2KSQy0T4cRYSHw2U/0QeJBVzRg8yOTikJn0tjZOIWtPtpHVHh28rnVNrLzCYUN2R8uFltRFNl11Me98g/ZgRyf0kTzRQIAWXYADFY+0A0jK1S6bKEGqd3weapoU7aXBy8xEAMftMSUMpEzZGKEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeysNl6O; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e576057c2bso115711121fa.1;
        Thu, 23 May 2024 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716477800; x=1717082600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIqLG9Ip1R2q7phAuful+Soh0Fz/9vGd1c4u2HUfpDE=;
        b=jeysNl6OMAztloUZQM7vaSjwpOw7+5zjHYxdDgO9KTk4qEIqvhrrc24MNCIGq+ViMR
         4iQAADlEFNeENUOMj+H5y3r/99qQn45tiXjr6AQrlDzyzPN+jBKueL+nHkwntBjjvSAM
         8pZZ4XkAHITyz/lw1Lk1/jdXyt70rxHNfZPrmloS+c8sbAJQdZVM3XUT+63GidiCQGZC
         qnK3iTIVY/c+gc8mMnUUC7CB1wSCDoLpyVhHUV3AVCc05V+loJ8OFUy+YnZHYPafEJxM
         /Pl17qFVuu+CIH3l2a2kWCaAouEMYugR09kvHrM64fQnL0QJ+LDf57LLIHQN+RYI2phe
         orYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716477800; x=1717082600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIqLG9Ip1R2q7phAuful+Soh0Fz/9vGd1c4u2HUfpDE=;
        b=IVe+ehk4cDNCWYtAAseNLfYuer+QwjYLWIo5HV9TEw9Y4uDeXXqDO6zDz2qTSHNhdM
         vQQK+/TLXDvK6/LeL/Sc8KhpdP8fWL5pca8wKqBqTsFDPflqZsX+fPtmEPx+eRwO58sj
         8AakBWuDQ+K+54g2HMNBcxUIIM+NZeBJpr/ZQdFuZdP8JRAkKd9q7vxcpuovd6zfpUyt
         /fHIUjOj8YuthLL/FetTiDr35X9Xa8HfUpwVAF6/0vcRvd+Ekjv5YaM36FR4cYwhUxLa
         JbEgORQ4FJgSrFjII+BGnByMOt8vWJoDVUmoaix+V6eR2NUXGBy0lEqyNneIDvmAOTPy
         iGcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSXsXG4rmPsQu5wJ5i4nSDVeh6vvOQ51DbS1lKYRXTcBIZU3K+DLi5tKRo5Pl7RTmQ909EuJ6U2RZxzAJyF5XSvwrr/bmV+ZtIXcq3hha2AMh67otvmnB1poxprl4XMytfeg==
X-Gm-Message-State: AOJu0YxIGP/XUua9jKOKwQLmeg4OG/Ilb3PegeCiPGFlh5G5/6WepJXr
	r/mcOsI2euyhaD32YEQCjZTLroBQ2dkrZsELKSpTphP1+uWFn+Y5zX4Vl+6Mm0aF9dt7fhA3mne
	4nUYvo21mFm50f+NW2qy/24/rm6u/z5VFgiU=
X-Google-Smtp-Source: AGHT+IG76fvNn/u89EljjsSKy4xcgB9RvwpblSMHQd6gEi2y9bHr9QW0VGAxGM8UhtXYlJpRRo47a5f3oRrISa7ASkA=
X-Received: by 2002:a05:651c:10a7:b0:2e9:485d:45a4 with SMTP id
 38308e7fff4ca-2e949466b84mr41158321fa.16.1716477800065; Thu, 23 May 2024
 08:23:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522183133.729159-2-lars@oddbit.com> <8fe7e2fe-3b73-45aa-b10c-23b592c6dd05@moroto.mountain>
In-Reply-To: <8fe7e2fe-3b73-45aa-b10c-23b592c6dd05@moroto.mountain>
From: Dan Cross <crossd@gmail.com>
Date: Thu, 23 May 2024 11:22:43 -0400
Message-ID: <CAEoi9W45jE_K6yDYdndYOTm375+r70gHuh3rWEtB729rUxNUWA@mail.gmail.com>
Subject: Re: [PATCH v4] ax25: Fix refcount imbalance on inbound connections
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: lars@oddbit.com, Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 11:05=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
> > [snip]
>
> I've already said that I don't think the patch is correct and offered
> an alternative which takes a reference in accept() but also adds a
> matching put()...  But I can't really test my patch so if we're going to
> do something that we know is wrong, I'd prefer to just revert Duoming's
> patch.

Dan, may I ask how you determined that Lars's patch is incorrect?
Testing so far indicates that it works as expected. On the other hand,
Lars tested your patch and found that it did not address the
underlying issue
(https://marc.info/?l=3Dlinux-hams&m=3D171646940902757&w=3D2).

If I may suggest a path forward, given that observed results show that
Lars's patch works as expected, perhaps we can commit that and then
work to incorporate a more robust ref counting strategy a la your
patch?

        - Dan C.

