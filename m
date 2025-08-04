Return-Path: <linux-hams+bounces-548-lists+linux-hams=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hams@lfdr.de
Delivered-To: lists+linux-hams@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1FBB1A406
	for <lists+linux-hams@lfdr.de>; Mon,  4 Aug 2025 16:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 342087AA62D
	for <lists+linux-hams@lfdr.de>; Mon,  4 Aug 2025 14:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3023E26CE2C;
	Mon,  4 Aug 2025 14:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0QWoepw"
X-Original-To: linux-hams@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE6A175A5
	for <linux-hams@vger.kernel.org>; Mon,  4 Aug 2025 14:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754316137; cv=none; b=TVrUo1wV7EvZV8lPXX5SEjKuoukt6F88+KtL9CHg1ntyeKjI3WMYW4btlGm+hVMuLUZcTAgevoH5kmfQi2GjEH9a1g2UZKPYBn7OZ3P2AUjAPi7rVPuQ9ii3iTLTFbeQM2pW3Q/dtM2QghT04ejo+69YiF1XyacyWsQhquweH0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754316137; c=relaxed/simple;
	bh=mroAnH5jBh2xukLXC2DloXTVu9BY+O+7wHAZSfNzc8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=EGVM8aY6MgJM9V3ebN+m9XpW5iysrv728t5YSeM3L6LsrF9VpApdd1pUK8wJohp+WE2y4u44YXRg74SDh5+NBMCA06TPiePtOdCPSTQnCT0emPa4WpnCGiSv4hA8iMTxtR5x/fKGyi5z/qFymNMSAjrxTIfksf14yM0Q1QW87OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0QWoepw; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-30b6c230808so429997fac.3
        for <linux-hams@vger.kernel.org>; Mon, 04 Aug 2025 07:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754316134; x=1754920934; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvKmgwxvE7AmUucQNNyV6bmDZnlcOj6aX70t/8Pz0bU=;
        b=c0QWoepwFiNYLeW4DyJszq+J1Xkyju2WxEzFcS34SOQ8c1yW5agrGFsLOB1C6uW6f5
         amFhTzHRCgNjWQYQND+cyFPQYLTOe+M7+bvCmvAPMBVULc/dRZMpKbp6hPM3lvmv2NKh
         KSwLr2GETeu9a2MqG5yXqX/xIntJNczdLEiczDoj71eNvXrWHrIy2+TclPvRDSfFuw/X
         B0s6jjnWNP6wjNMrFcLL8z8RhG7GATpOMIHU1D2HX3vw3hlxntuhs5otNyqYy38sw7fc
         IcWgS614NOdy7WHJLEQgV6OgjDb7mBOURwWorawkp8aPrjDvIpcaNRovsSolrVNL/raO
         LMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754316134; x=1754920934;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvKmgwxvE7AmUucQNNyV6bmDZnlcOj6aX70t/8Pz0bU=;
        b=XAPXCrBYmJ+RwYiZX/88Z+nzVsGJEKG5lYn5VZzY98FjGHQqRVsuA0AAYZIbebRV0a
         WzWTWJzr6eLVa+mcOiA8T52OrgQCajw7IBoiZ+gwUPrDVrUwg6F5X2TGaU21E/2irR19
         idQ6NEaP8bM+bP6CGh8pKx9TjhnsiHhiqWmgycny+mLVY61NfgnJHUCqjLQb7i+w1zrS
         FhfMY0JJY2f6sJtfX81LLI/5rN+UV2vzfHZbPPTjmufw9+mP7rjnizyMf0wd5w0yTu1q
         VH7XqRdufLN2987EyRyeyN2I9/BTFjvWdpmzEjAeUP1r97hRtZvt9gb7HENeiqviJH7s
         iOBA==
X-Forwarded-Encrypted: i=1; AJvYcCVegowHpeSRPnXThVD8xCO7CihZc7+qGjdOXkA1H8IymAEuCQZuHAC8KBV8uXuXPDABUx+O7TY92Hgk@vger.kernel.org
X-Gm-Message-State: AOJu0YztJFNIY4Vb6f5lKjQGGZmuBbSEKyDFxoIwElqt9sAAL3B/WO7+
	Ig9xQY8oK6bFrDd2qG6ZPGtySAcNOi1HVMNCLb6dqiQF8gZP7hCiw/kL5SkusY97e2/YJdA4dmg
	1AuxNFEMoyI/OpbofH8jfFxdLEKgPIg4IwA==
X-Gm-Gg: ASbGncuPRU4cBrmvSMXbhqSoNzjuiYczMuzYnUtbHwhPXhyTE/uKQURI1vP9icXeJ+v
	esbVOvss25S/h//W3R1GKwlNTvETgG0gObRBBkap4HJk/Fl3MOgf3EIhMPCz31LXznPCt2vLIZP
	91jKaHFN1AJl2UZE75mSVbU25UtvdknXKW4duWI85wIlkjqU+5WbPPLvIVerQL2/P2A1EyBtNlk
	4do+4vfM2JYuY/uJzqF3GiQX4io4nlIsmx/bs+GTQ==
X-Google-Smtp-Source: AGHT+IGYSELkyjopliXZAtI5jOedusXUlUz96Uwo5/rWyqZVXbt+Bn2muHCL0V/VcmOULt3U75CmBjGViXlvPLGVDNk=
X-Received: by 2002:a05:6870:d60f:b0:30b:af6d:f92 with SMTP id
 586e51a60fabf-30baf6d1190mr1319520fac.34.1754316134067; Mon, 04 Aug 2025
 07:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <018e5e9f979d1c2076b198b1ec970c6b@vanheusden.com>
 <CANnsUMEbVBPV89WCktZt7XpnUc6fhT84J1b5ZFTPCJUfApay3g@mail.gmail.com> <73e2457e74a34adb45eb365ae8febe31@vanheusden.com>
In-Reply-To: <73e2457e74a34adb45eb365ae8febe31@vanheusden.com>
From: Chris Maness <christopher.maness@gmail.com>
Date: Mon, 4 Aug 2025 07:02:02 -0700
X-Gm-Features: Ac12FXx0ld__PX7wl1AqWm1NAsv8bYVE3f2jQzTv5ry3r3wk0a5jl2_bqZKEQSc
Message-ID: <CANnsUMHzqZF3VmVLBiOS5QRv6i0TfvzWKy4=6Z1RbnqHn4iLfQ@mail.gmail.com>
Subject: Re: ax.25 & linux, 4th send attempt
To: Folkert van Heusden <folkert@vanheusden.com>, linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That is an issue I have not seen before.  I was having crashes with
pre-patched (before version 6) kernels, but since I have been
following this email reflector I have not seen AX.25 issues with v. 6
kernels.  I run slackware, and they are still using 5.15.*, so I have
to use a custom kernel that is version 6.  I have not had any packet
related crashes on x86 since running v. 6.  Someone would need to try
to reproduce the crash.  I don't have a Pi 5.  Hopefully someone here
does.

-Chris KQ6UP

On Sun, Aug 3, 2025 at 11:56=E2=80=AFPM Folkert van Heusden
<folkert@vanheusden.com> wrote:
>
> This is a 6.12.34+rpt-rpi-v8 kernel on a pi-5.
>
>
> On 2025-08-04 05:05, Chris Maness wrote:
>
> What kernel version are you using?
>
> Thanks,
> Chris Maness
> -Sent from my iPhone
>
>
> On Sun, Aug 3, 2025 at 2:33=E2=80=AFPM Folkert van Heusden <folkert@vanhe=
usden.com> wrote:
>
> Hi,
>
> I'm trying to setup an ax.25 bbs. A few things work like setting up a
> kiss-session, sending beacons and sending ip-over-ax.25 icmp packets.
>
> But as soon as someone tries to axcall to my bbs, the whole system (a
> raspberry pi 5) resets. This is with a remote connection (kiss over
> socat to a location a few km away). But if I on the other hand run
> direwolf and send a few packets, the system reboots as well.
>
> I tried to check the linux-ax25.in-berin.de website (as mentioned in the
> kernel docs), but that website is not responsive.
>
> regards
>
> --
> www.vanheusden.com
>
>
> --
> www.vanheusden.com



--=20
Thanks,
Chris Maness

